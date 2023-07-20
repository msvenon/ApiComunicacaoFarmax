unit Funcoes;


interface

uses
  Windows, Graphics, Jpeg, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  ExtCtrls, Db,
   DBCtrls, Registry, StdCtrls, Printers,

   ComCtrls, DbClient, TLHelp32, WinSpool, StrUtils, IniFiles, Gauges,
  ShellAPI, Variants, Buttons, wwdbgrid, wwdbigrd, WwExport,

  wwdblook, Wwdbdlg, Wwkeycb, wwdbdatetimepicker, wwdbedit, Wwdotdot,
  Wwdbcomb, wwFrame,  Rio, SOAPHTTPClient, ComObj, ActiveX, UrlMon,
  IdHTTP, Winsock, IdStack, IdIPWatch, WinInet, IdBaseComponent, IdComponent,
  IdRawBase, IdRawClient, IdIcmpClient, SqlExpr, ImageHlp,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.DBX.Migrate;

 function BuscaRegistro(QryBusca: TFDQuery; Select, Where: String): Boolean;
 function StrZero(Num : Real ; Zeros,Deci: integer): string;
 function Crypt(Action, Src: String): String;
 Function FazLogErroApply(Cds : TClientDataSet; Evento : String) : Boolean;
 function VersaoExe(const Filename: String): String;
 function ConectadoInternet: boolean;
 function RetornaId ( Campo : String ) : Double;

 procedure GeraLog(Mensagem : String);
 procedure GravaLog(cMensagem: string);


implementation

uses Udm;

 procedure GravaLog(cMensagem: string);
var Log : TextFile;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogExporter' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
   begin
     AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogExporter' + FormatDateTime('ddmmyyyy',Date) + '.txt');
     Append(Log);
   end
  else
    begin
     AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogExporter' + FormatDateTime('ddmmyyyy',Date) + '.txt');
     Rewrite(Log);
     Writeln(Log, ' - Iniciando o Dia ' + FormatDateTime('dd/mm/yyyy',Date) + ' as ' + FormatDateTime('hh:mm:ss',Time) + ' horas');
    end;
  Writeln(Log, cMensagem);
  CloseFile(Log);
 end;

function  RetornaId ( Campo : String ) : Double;
begin


  DM.CDSControle.Close;
  DM.CDSControle.ParamByName('CAMPO').Value := Campo;
  DM.CDSControle.Open;

  if DM.CDSControle.Locate('CAMPO', Campo, []) then
  begin
    DM.CDSControle.Close;
    DM.CDSControle.ParamByName('CAMPO').Value := Campo;
    DM.CDSControle.Open;
    DM.CDSControle.Edit;

    DM.CDSControleVALOR.Value := DM.CDSControleVALOR.Value + 1;

    DM.CDSControle.Post;
    DM.CDSControle.ApplyUpdates(0);

   if DM.CDSControle.ApplyUpdates(0) = 0 then
    begin
      Result := DM.CDSControleVALOR.Value ;
    end
    else
    begin
      RetornaId(Campo);
    end;

//    DM.FDConn.Connected := False;
//    DM.FDConn.Connected := True;
  end
  else
  begin
    DM.CDSControle.Close;
    DM.CDSControle.ParamByName('CAMPO').Value := Campo;
    DM.CDSControle.Open;
    DM.CDSControle.Append;

    DM.CDSControleCAMPO.Value := Campo;
    DM.CDSControleVALOR.Value := 0;
    DM.CDSControle.Post;
    DM.CDSControle.ApplyUpdates(0);


//   if DM.CDSControle.ApplyUpdates(0) = 0 then
//      DM.FDAtualizaControle.ExecProc;
  end;

end;

function ConectadoInternet: boolean;

begin
  Result := False;
 if InternetCheckConnection('http://www.google.com',1,0) then
  begin
    Result := True;
  end;

end;


procedure GeraLog(Mensagem : String);
var Log : TextFile;
begin

  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Logs') then
    CreateDir(ExtractFilePath(Application.ExeName)+'Logs');

  AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogErro' + FormatDateTime('ddmmyyyy',Date) + '.txt');
  if FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogErro' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
   begin
     //Rewrite(Log);//, ExtractFilePath(Application.ExeName) + 'Logs\LogErro  ' + FormatDateTime('ddmmyyyy',Date) + '.txt');
      Append(Log);
      Writeln(Log, FormatDateTime('dd/mm/yyyy - hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Mensagem);
    CloseFile(Log);
   end
   else
   begin
    AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogErro' + FormatDateTime('ddmmyyyy',Date) + '.txt');

    Rewrite(Log);
    Append(Log);
    Writeln(Log, FormatDateTime('dd/mm/yyyy - hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Mensagem);
    CloseFile(Log);

   end;

end;


function VersaoExe(const Filename: String): String;
  type
     TVersionInfo = packed record
     Dummy: array[0..7] of Byte;
     V2, V1, V4, V3: Word;
   end;
var
 Zero, Size: Cardinal;
 Data: Pointer;
 VersionInfo: ^TVersionInfo;
begin
 Size := GetFileVersionInfoSize
 (Pointer(Filename), Zero);
 if Size = 0 then
    Result := '0'
 else
  begin
   GetMem(Data, Size);
   try
    GetFileVersionInfo(Pointer(Filename), 0, Size, Data);
    VerQueryValue(Data, '\', Pointer(VersionInfo), Size);
    Result := Format('%d.%d.%d.%d', [VersionInfo.V1, VersionInfo.V2, VersionInfo.V3, VersionInfo.V4]);
   finally
    FreeMem(Data);
   end;
  end;

end;

Function FazLogErroApply(Cds : TClientDataSet; Evento : String) : Boolean;
var Log : TextFile;
begin
 Try
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Logs') then
       CreateDir(ExtractFilePath(Application.ExeName) + 'Logs');
    Result := True;
    if Cds.ApplyUpdates(0) <> 0 then
     begin
        if  FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
         begin
           Append(Log);
           Rewrite(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt');

         end
        else
         begin
           AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt');
           Rewrite(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt');
         end;
        Writeln(Log, FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Cds.Name + ' - ' + Evento);
        Flush(Log);
        CloseFile(Log);
        Cds.CancelUpdates;
        Result := False;
     end;
   Except
     on E : Exception do
      begin
         GeraLog('FazLogErroApply - ' + Cds.Name + ' - ' + E.Message);
         result := False;
         exit;
      end;
   End;


end;

function Crypt(Action, Src: String): String;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Exit;
  end;
  Key :=
'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToIntDef('$'+ copy(Src,1,2),0);
    SrcPos := 3;
  repeat
    SrcAsc := StrToIntDef('$'+ copy(Src,SrcPos,2),0);
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;


end;

function BuscaRegistro(QryBusca: TFDQuery; Select, Where: String): Boolean;
begin
    try
    Screen.Cursor := crHourGlass;
    with QryBusca do
      begin
        Close;
        SQL.Clear;
        {Parte fixa da query}
        SQL.Add(Select);
        {Parte variável da query}
        SQL.Add(Where);
        {Tenta executar a query montada anteriormente}
        try
          Open;
          if RecordCount = 0 then
            begin
              Result := False;
              Exit;
            end
          else
            begin
              Result := True;
            end;
        except
          on E: EDataBaseError do
            begin
//              ExibeError(PChar('Ocorreu o seguinte erro durante a consulta ao banco de dados: ' +
//                                     CHR(10) + '"' + E.Message + '".'));
              Result := False;
            end;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

function StrZero(Num : Real ; Zeros,Deci: integer): string;
var tam,z : integer;
    res,zer : string;
begin
   Str(Num:Zeros:Deci, res);
  //  res := Alltrim(res);
   tam := length(res);
   zer := '';
   for z := 1 to (Zeros-tam) do zer := zer + '0';
   Result := zer+res;


end;

end.
