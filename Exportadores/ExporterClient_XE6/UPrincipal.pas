{
 Timer1 - ExporterClient
 Timer2 - Primeira execução do ExporterClient
 Timer3 - Colocar o Form em TrayIcon
 Timer4 - ExporterClientQuick
 Timer5 - ?
 Timer6 e Timer7 - Contadores de tempo para próxima execução doa exportadores
}

unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXShell, AppEvent, Spin, StdCtrls, Buttons, ExtCtrls,
  Menus, RxMenus, formshape, TLHelp32, ShellApi, MidasLib,
  DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, IniFiles, DateUtils, Registry;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    AppEvents1: TAppEvents;
    RxTrayIcon1: TRxTrayIcon;
    RxPopupMenu1: TRxPopupMenu;
    Restaurar1: TMenuItem;
    Fechar1: TMenuItem;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    Timer6: TTimer;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    SpIntervalo: TSpinEdit;
    Label6: TLabel;
    LabelTempo: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    BtCancelar: TSpeedButton;
    BtOK: TSpeedButton;
    Label4: TLabel;
    CbAtulizarPrecos: TCheckBox;
    AbrirLog1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure AppEvents1Minimize(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure RxTrayIcon1DblClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure AbrirLog1Click(Sender: TObject);
    function  IniciaDia : Boolean;
    procedure ValidaBD;
    procedure ApagaArquivos;
    procedure ArmazenaVendaMaior;
    Procedure RegistraHoraInicio;
    procedure ExecutaProcedure(Sql: String);
    procedure CalculaCurva;
    procedure BaixaAutomaticaChequePre;
    function GravaEventos(Codigo : Real; Evento : String; Inicio, Erro : Boolean) : Real;

    procedure AbreTransacao;
    procedure ConfirmaTransacao;
    procedure CancelaTransacao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ExecAndWait1(const FileName, Params: string; const WindowState: Word; ProcessName : String): boolean;
  function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;
  Function VerificaProcesso(Arquivo : string; Instancias : Integer) : Boolean;
  function Crypt(Action, Src: String): String;
  procedure GeraLog(Mensagem : String);
  Function FazLogErroApply(Cds : TClientDataSet; Evento : String) : Boolean;
  Function UltimoDiaMes(Mes : Real) : Real;
  function AtualizaSaldo(Tabela: TClientDataSet; ID: TFloatField; Data: TDateField; Saldo: TFloatField;
                         ValorAtual,ValorAnterior : Extended; TipoAtual,TipoAnterior : String;
                         DataAtual, DataAnterior : TDateTime; ContaAtual,ContaAnterior : Extended):Boolean;


var
  Form1: TForm1;
  Importer : TextFile;
  Caminho, Servidor, Intervalo, Intervalo2, AtualizaPrecoVenda : String;
  TempoExecucao, Faltam, Faltam2 : Integer;
  ProcessInformation :TProcessInformation;
  InicioDia, ServidorLocal : Boolean;
  DataHoje : TDateTime;
  Entrada, FarmaxConexao, CaminhoBDConexao, NomeServidorConexao : String;
  TD : TTransactionDesc;
  ServidorData, AtzApp, TipoPrograma : String;
  NovaVersao : Boolean;
  EntraPrograma : Boolean;
  Cd_Evento : Real;

implementation

uses uDmTrigger, UBackup;


{$R *.dfm}

function Alltrim(Text : string) : string;
begin
 while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
 Result := Text;
end;

function StrZero(Num : Real ; Zeros,Deci: integer): string;
var tam,z : integer;
    res,zer : string;
begin
   Str(Num:Zeros:Deci, res);
   res := Alltrim(res);
   tam := length(res);
   zer := '';
   for z := 1 to (Zeros-tam) do zer := zer + '0';
   Result := zer+res;
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


// MODO DE USAR "ATUALIZASALDO" //
{
     'I':  FrmDm.AtualizaSaldo(FrmDm.CdsSaldo,FrmDm.CdsSaldoID_CONTA,FrmDm.CdsSaldoDATA,FrmDm.CdsSaldoSALDO,
           CdsConsultaVALOR.AsFloat,0,CdsConsultaTIPOMOVIMENTO.AsString,
           '',CdsConsultaDATA.AsDateTime,CdsConsultaDATA.AsDateTime,CdsConsultaID_CONTA.AsInteger,0);

     'A':  FrmDm.AtualizaSaldo(FrmDm.CdsSaldo,FrmDm.CdsSaldoID_CONTA,FrmDm.CdsSaldoDATA,FrmDm.CdsSaldoSALDO,
           CdsConsultaVALOR.AsFloat,ValorAnterior,CdsConsultaTIPOMOVIMENTO.AsString,
           TipoAnterior,CdsConsultaDATA.AsDateTime,DataAnterior,CdsConsultaID_CONTA.AsInteger,ContaAnterior);

     'E':  FrmDm.AtualizaSaldo(FrmDm.CdsSaldo,FrmDm.CdsSaldoID_CONTA,FrmDm.CdsSaldoDATA,FrmDm.CdsSaldoSALDO,
           0,CdsConsultaVALOR.AsFloat,'',CdsConsultaTIPOMOVIMENTO.AsString,
           CdsConsultaDATA.AsDateTime,CdsConsultaDATA.AsDateTime,0,CdsConsultaID_CONTA.AsInteger);}

function AtualizaSaldo(Tabela: TClientDataSet; ID: TFloatField; Data: TDateField; Saldo: TFloatField;
                       ValorAtual,ValorAnterior : Extended; TipoAtual,TipoAnterior : String;
                       DataAtual, DataAnterior : TDateTime; ContaAtual,ContaAnterior : Extended):Boolean;

Var Saldoanterior:Real;
    PodeSair,Existeodiaatual : boolean;

Begin

Result := False;

if ValorAnterior <> 0 then
begin
   Tabela.Close;
   Tabela.Params[0].AsFloat := ContaAnterior;
   Tabela.Open;
   Tabela.Last;
   PodeSair := false;
   Repeat
    begin
      If Data.AsDateTime > DataAnterior then
       Tabela.Prior
      else
       PodeSair := true;
    end;
   Until (Tabela.Bof) or (PodeSair);

   Repeat
    begin
      Tabela.Edit;
      if TipoAnterior='C' then
       Saldo.AsFloat := Saldo.AsFloat - ValorAnterior
      else
       Saldo.AsFloat := Saldo.AsFloat + ValorAnterior;
      FazLogErroApply(Tabela, 'AtualizaSaldo');
      Tabela.Next;
      end;
    until Tabela.Eof;
end;

if ValorAtual<>0 then
begin
   If (ContaAtual <> ContaAnterior) then
    begin
       Tabela.Close;
       Tabela.Params[0].AsFloat := ContaAtual;
       Tabela.Open;
    end;
   Tabela.Last;
   SaldoAnterior := 0;
   Existeodiaatual := false;
   PodeSair := false;

   if Tabela.RecordCount <> 0 then
   begin
      Repeat
         If Data.AsDateTime >= DataAtual then
         begin
            if (Data.AsDateTime = DataAtual)  then
               Existeodiaatual := true;

            Tabela.Prior;
            If (Tabela.Bof) and (Data.AsDateTime < DataAtual) then
            begin
               SaldoAnterior := Saldo.AsFloat;
            end;

         end
         else
         begin
            SaldoAnterior := Saldo.AsFloat;
            PodeSair := true;
         end;
      Until Tabela.Bof or PodeSair;
   end;

   if not existeodiaatual then
     begin
      Tabela.Insert;
      Data.AsDateTime    := Dataatual;
      Id.AsFloat := ContaAtual;
      Saldo.AsFloat      := SaldoAnterior;
      FazLogErroApply(Tabela, 'AtualizaSaldo');
     end;

   if Data.AsDateTime >= Dataatual then
   begin
     Tabela.edit;
     if TipoAtual='C' then
        Saldo.AsFloat := Saldo.AsFloat + ValorAtual
     else
        Saldo.AsFloat := Saldo.AsFloat - ValorAtual;

     FazLogErroApply(Tabela, 'AtualizaSaldo');
   end;

   Tabela.Next;

   While not Tabela.Eof do
   begin
     if Data.AsDateTime >= Dataatual then
     begin
       Tabela.edit;
       if TipoAtual='C' then
          Saldo.AsFloat := Saldo.AsFloat + ValorAtual
       else
          Saldo.AsFloat := Saldo.AsFloat - ValorAtual;
     end;
     Tabela.Next;
   end;
   FazLogErroApply(Tabela, 'AtualizaSaldo');
end;
end;


function RetornaID(Tabela, Campo: String): Extended;
var Valor : Real;
Tentativa : Integer;
begin
   Try
     Repeat
        DM.CdsControle.Close;
        DM.CdsControle.Params[0].AsString := UpperCase(Campo);
        DM.CdsControle.Open;
        If DM.CdsControle.RecordCount = 0 then
           begin
             DM.CdsControle.Append;
             DM.CdsControleCAMPO.AsString := UpperCase(Campo);
             DM.CdsControleVALOR.AsFloat := 0;
             FazLogErroApply(DM.CdsControle, 'RetornaID');
             Valor := 0;
           end
        else
           begin
             Valor := DM.CdsControleVALOR.AsFloat;
           end;

        Tentativa := 1;
        if (Tabela <> 'LANCAMENTOS') and (Tabela <> '') then
         begin
            repeat
               Valor := Valor + 1;
               DM.Cds1.Close;
               DM.Sql1.CommandText := 'SELECT ' + Campo + ' FROM ' + Tabela + ' WHERE ' + Campo + ' = ' + QuotedStr(FloattoStr(Valor));
               DM.Cds1.Open;
               Inc(Tentativa);
               if Tentativa > 5000 then
                begin
                  raise Exception.Create('Falha ao gerar identificador da tabela "' + Tabela + '". Contacte o suporte imediatamente.');
                end;
            until (DM.Cds1.RecordCount = 0) and (Valor > 0);
            DM.Cds1.Close;
         end
        else
            Valor := Valor + 1;

        if (Tabela = 'VENDAS') then
         begin
           if not (DM.CdsParametrosCD_VENDA.IsNull) and (Valor <= DM.CdsParametrosCD_VENDA.AsFloat) then
            begin
              DM.CdsParametros.Close;
              DM.CdsParametros.Open;
            end;
         end;

        DM.CdsControle.Edit;
        DM.CdsControleVALOR.AsFloat := Valor;
        DM.CdsControle.Post;

     Until DM.CdsControle.ApplyUpdates(0) = 0;

   Finally
      Result := DM.CdsControleVALOR.AsFloat;
      DM.CdsControle.Close;
   End;
end;


Function UltimoDiaMes(Mes : Real) : Real;
Const
 Fevereiro = [2];
 Trinta = [4, 6, 9, 11];
 TrintaeUm = [1, 3, 5, 7, 8, 10, 12];
begin
 if StrtoInt(FloattoStr(Mes)) in Fevereiro then
    Result := 28
 else
 if StrtoInt(FloattoStr(Mes)) in Trinta then
    Result := 30
 else
 if StrtoInt(FloattoStr(Mes)) in TrintaeUm then
    Result := 31
 else
 Result := 0;
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
        if FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
         begin
           AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt');
           Append(Log);
         end
        else
         begin
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



procedure GeraLog(Mensagem : String);
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
     Writeln(Log, '>>>>>>>>>>>>>>>Iniciando o Dia ' + FormatDateTime('ddmmyyyy',Date) + ' as ' + FormatDateTime('hh:mm:ss',Time) + ' horas');
    end;

  Writeln(Log, Mensagem);
  CloseFile(Log);
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

procedure TForm1.ExecutaProcedure(Sql: String);
begin
  Try
    Cd_Evento := 0;
    Cd_Evento := GravaEventos(Cd_Evento, 'Executanto Procedure - ' + Sql, True, False);

    AbreTransacao;

    GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Execucao de: ' + SQL);
    DM.Sql1.CommandText := Sql;
    DM.Sql1.ExecSQL(True);

    ConfirmaTransacao;

    Cd_Evento := GravaEventos(Cd_Evento, 'Executanto Procedure - ' + Sql, False, False);
  Except
    CancelaTransacao;
    Cd_Evento := GravaEventos(Cd_Evento, 'Executanto Procedure - ' + Sql, False, True);
  End;
end;



procedure TForm1.AppEvents1Minimize(Sender: TObject);
begin
  Form1.Hide;
end;

procedure TForm1.BtCancelarClick(Sender: TObject);
begin
  Form1.Hide;
  Timer6.Enabled := True;
end;

procedure TForm1.BtOKClick(Sender: TObject);
begin
  AssignFile(Importer, ExtractFilePath(Application.ExeName)+'ExporterClient.TXT');
  if not FileExists(ExtractFilePath(Application.ExeName)+'ExporterClient.TXT') then
   begin
     Rewrite(Importer);
     CloseFile(Importer);
     AssignFile(Importer, ExtractFilePath(Application.ExeName)+'ExporterClient.TXT');
     Append(Importer);
   end
  else
     Rewrite(Importer);

  if SpIntervalo.Value < 3 then
     SpIntervalo.Value := 3;
  Writeln(Importer, Edit1.Text);
  Writeln(Importer, Edit2.Text);
  Writeln(Importer, InttoStr(SpIntervalo.Value));
  Writeln(Importer, '0');
  if CbAtulizarPrecos.Checked then
     Writeln(Importer, 'S')
  else
     Writeln(Importer, 'N');
  CloseFile(Importer);
  Form1.Hide; 
  FormCreate(Sender);
  Faltam := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 Reg : TRegistry;
 Chaves : TStringList;
 i : Integer;
begin
  Try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Control Panel\International', True) ;
    Reg.WriteString('iCountry','55');
    Reg.WriteString('LocaleName','pt-BR');
    Reg.WriteString('sCountry','Brasil');
    Reg.WriteString('sCurrency','R$');
    Reg.WriteString('sLanguage','PTB');
    Reg.WriteString('sShortDate','dd/MM/yyyy');
    Reg.WriteString('sTimeFormat','HH:mm:ss');
    Reg.WriteString('sShortTime','HH:mm');
    Reg.WriteString('sDecimal',',');
    Reg.WriteString('sMonDecimalSep',',');
    Reg.WriteString('sThousand','.');
    Reg.WriteString('sDate','/');
    Reg.WriteString('sTime',':');
    Reg.WriteString('s1159','');
    Reg.WriteString('s2359','');
    Reg.CloseKey;
    Reg.Free;

    Chaves := TStringList.Create;
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_USERS;
    Reg.OpenKey('', False);
    Reg.GetKeyNames(Chaves);
    for i := 0 to Chaves.Count - 1 do
     begin
        Reg.OpenKey(Chaves.Strings[i], True) ;
        if Reg.KeyExists('Control Panel\International') then
         begin
            Reg.OpenKey('Control Panel\International', True) ;
            Reg.WriteString('iCountry','55');
            Reg.WriteString('LocaleName','pt-BR');
            Reg.WriteString('sCountry','Brasil');
            Reg.WriteString('sCurrency','R$');
            Reg.WriteString('sLanguage','PTB');
            Reg.WriteString('sShortDate','dd/MM/yyyy');
            Reg.WriteString('sTimeFormat','HH:mm:ss');
            Reg.WriteString('sShortTime','HH:mm');
            Reg.WriteString('sDecimal',',');
            Reg.WriteString('sMonDecimalSep',',');
            Reg.WriteString('sThousand','.');
            Reg.WriteString('sDate','/');
            Reg.WriteString('sTime',':');
            Reg.WriteString('s1159','');
            Reg.WriteString('s2359','');
            Reg.CloseKey;
         end
        else
            Reg.CloseKey;
     end;
    Reg.Free;
  Except
  End;

  if VerificaProcesso('ExporterTri', 2) then
   begin
     Application.Terminate;
     Exit;
   end;

  RegistraHoraInicio; //registra a hora do inicio de uma exportacao

  GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Inicializando o ExporterTrigger.' );
  if not FileExists(ExtractFilePath(Application.ExeName)+'ExporterClient.TXT') then
   begin
     Timer4.Enabled := False;
     ShowMessage('O arquivo de configuração não existe. Configure-o antes de prosseguir');
     GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Falta do ExporterClient.txt' );
     Form1.Show;
     Exit;
   end;
  AssignFile(Importer, ExtractFilePath(Application.ExeName)+'ExporterClient.TXT');
  Reset(Importer);
  Readln(Importer, Caminho);
  ReadLn(Importer, Servidor);
  ReadLn(Importer, Intervalo);
  ReadLn(Importer, Intervalo2);
  ReadLn(Importer, AtualizaPrecoVenda);
  CloseFile(Importer);

  if StrtoInt(Intervalo) < 3 then
     Intervalo := '3';

  Edit1.Text := UpperCase(Caminho);
  Edit2.Text := LowerCase(Servidor);
  SpIntervalo.Value := StrtoInt(Intervalo);
  if AtualizaPrecoVenda = 'S' then
     CbAtulizarPrecos.Checked := True
  else
     CbAtulizarPrecos.Checked := False;


  ValidaBD;
  if not DM.CdsParametros.Active then
     try
      DM.CdsParametros.Open;
     except
       on E:Exception do
        begin
          ShowMessage('Falha: ' + E.Message + '. ');
          Application.Terminate;
          Exit;
        end;
     end;

  if pos('\\', DM.CdsParametrosSERVIDORMATRIZ.AsString) > 0 then
   begin
     ServidorData := Copy(DM.CdsParametrosSERVIDORMATRIZ.AsString, 3, Length(DM.CdsParametrosSERVIDORMATRIZ.AsString));
     ServidorData := Copy(ServidorData, 1, Pos('\', ServidorData) - 1);
     DM.CdsParametros.Edit;
     DM.CdsParametrosSERVIDORMATRIZ.AsString := ServidorData;
     DM.CdsParametros.Post;
     FazLogErroApply(DM.CdsParametros, '');
   end;

  if DM.CdsParametrosSERVIDORMATRIZ.AsString <> '' then
     ServidorData := DM.CdsParametrosSERVIDORMATRIZ.AsString
  else
     ServidorData := 'Servidor';

  Timer6.Enabled := True;
  Timer4.Interval := StrtoInt(Intervalo) * 60000;
  Timer4.Enabled := False;
  Timer4Timer(Sender);

  DM.CdsParametros.Close;
end;

procedure TForm1.Fechar1Click(Sender: TObject);
begin
  Close;
  Application.Terminate;
end;

procedure TForm1.Restaurar1Click(Sender: TObject);
begin
  Form1.Show;
end;


//ativa os Exportadores
procedure TForm1.Timer4Timer(Sender: TObject);
var
  StartupInfo :TStartupInfo;
  ProcessName : String;
begin
   Cd_Evento := 0;
   Cd_Evento := GravaEventos(Cd_Evento, 'Disparando os exportadores....', True, False);

   DM.SQLConn.CloseDataSets;
   DM.SQLConn.Close;
   DM.SQLConn.Connected := False;

   Timer4.Enabled := False;

   IniciaDia;

   DM.CdsParametros.Close;
   DM.CdsCadClasse.Close;
   DM.CdsCadContas.Close;
   DM.CdsBaixaAutomaticaChequePre.Close;
   DM.CdsMovimentoCaixa.Close;
   DM.CdsEventos.Close;

   Timer4.Enabled := True;
   //nao dispara o exportador porque neste horario esta fazendo backup no servidor....
   if (Time > StrtoTime('02:00:00')) and (Time < StrtoTime('03:00:00')) then
      exit;

   Faltam2 := 0;
    Try
       if VerificaProcesso('ExporterClient', 1) then  //ExporterClientQuick
        begin
           Timer4.Interval := 60000;
           Exit;
        end;

       if VerificaProcesso('Farmaxba', 1) then  //FarmaxBackup
        begin
           Timer4.Interval := 60000;
           Exit;
        end;

       Timer4.Enabled := False;
       FillChar(StartupInfo, SizeOf(StartupInfo), 0);
       FillChar(ProcessInformation, SizeOf(ProcessInformation), 0);
       StartupInfo.cb := SizeOf(StartupInfo);
       StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
       StartupInfo.wShowWindow := SW_SHOWNORMAL;
       Timer4.Enabled := False;

       GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Disparando o ExporterClientQuick.' );
       ProcessName := PChar(ExtractFilePath(Application.ExeName)+'ExporterClientQuick.exe');
       RegistraHoraInicio; //registra a hora do inicio de uma exportacao
       ExecAndWait(ProcessName,'',0);

       if ((FormatDateTime('hh:mm', Time) >= '08:00') and (FormatDateTime('hh:mm', Time) <= '08:10')) or
          ((FormatDateTime('hh:mm', Time) >= '10:00') and (FormatDateTime('hh:mm', Time) <= '10:10')) or
          ((FormatDateTime('hh:mm', Time) >= '12:00') and (FormatDateTime('hh:mm', Time) <= '12:10')) or
          ((FormatDateTime('hh:mm', Time) >= '14:00') and (FormatDateTime('hh:mm', Time) <= '14:10')) or
          ((FormatDateTime('hh:mm', Time) >= '16:00') and (FormatDateTime('hh:mm', Time) <= '16:10')) or
          ((FormatDateTime('hh:mm', Time) >= '18:00') and (FormatDateTime('hh:mm', Time) <= '18:10')) or
          ((FormatDateTime('hh:mm', Time) >= '20:00') and (FormatDateTime('hh:mm', Time) <= '20:10')) then
           begin
             ProcessName := PChar(ExtractFilePath(Application.ExeName)+'ExporterClient.exe Consistencia');
             GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Disparando o ExporterClient Consistencia.' );
           end
       else
           begin
              GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Disparando o ExporterClient.' );
              ProcessName := PChar(ExtractFilePath(Application.ExeName)+'ExporterClient.exe');
           end;
       RegistraHoraInicio; //registra a hora do inicio de uma exportacao
       ExecAndWait(ProcessName,'',0);

       TempoExecucao := 0;
       Timer5.Enabled := True;
       Timer4.Enabled := True;
    Except
       Timer4.Interval := StrtoInt(Intervalo) * 60000;
       Timer4.Enabled := True;
    End;
    Timer4.Interval := StrtoInt(Intervalo) * 60000;
    Timer4.Enabled := True;
    TempoExecucao := 0;
end;



function ExecAndWait1(const FileName, Params: string;
  const WindowState: Word; ProcessName: String): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
//  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do begin
  cb := SizeOf(SUInfo);
  dwFlags := STARTF_USESHOWWINDOW;
  wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(ProcessName), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(FileName)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then begin
  WaitForSingleObject(ProcInfo.hProcess, 1800000);

  //tentativa de terminar um processo que travou por algum motivo
  TerminateProcess(ProcInfo.hProcess, 0);

  { Libera os Handles }
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
  end;

  //tentativa de terminar um processo que travou por algum motivo
  //TerminateProcess(proc_info.hProcess, 0);
  //CloseHandle(proc_info.hProcess);
end;


function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do begin
  cb := SizeOf(SUInfo);
  dwFlags := STARTF_USESHOWWINDOW;
  wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
  CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then begin
  WaitForSingleObject(ProcInfo.hProcess, INFINITE);
  { Libera os Handles }
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
  end;
end;


procedure TForm1.RxTrayIcon1DblClick(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled := False;
  Form1.Hide; 
end;

//rotina que vai verificar se o processo de um determinado sistema ainda esta em execucao.
Function VerificaProcesso(Arquivo : string; Instancias : Integer) : Boolean;
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  Looper : Bool;
  Contador : Integer;
begin
  Contador := 0;
  SnapShot:=CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize:=sizeof(TProcessEntry32);
  Looper := Process32First(SnapShot,pe);
  Result := False;
  while Integer(Looper) <> 0 do
   begin
    if Pos(UpperCase(arquivo), UpperCase(ExtractFileName(pe.szExeFile))) > 0 then
     begin
        Inc(Contador);
        if Contador >= Instancias then
         begin
           Result := True;
           Break;
         end;
     end;
    Looper := Process32Next(SnapShot,pe);
   end;
end;


procedure TForm1.Timer5Timer(Sender: TObject);
begin
  Inc(TempoExecucao);
  if TempoExecucao >= 10 then
   begin
     TerminateProcess(ProcessInformation.hProcess, 0);
     Timer5.Enabled := False;
   end;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
  Faltam := Faltam + 1;
  if ((Timer4.Interval / 1000) - Faltam) >= 0 then
     LabelTempo.Caption := FloattoStr((Timer4.Interval / 1000) - Faltam) + #13 + ' segundos';
end;

procedure TForm1.AbrirLog1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    ShellExecute(Application.Handle, 'open', PChar(OpenDialog1.FileName), nil, nil, SW_SHOWMAXIMIZED);
end;


//executa os processos de inicializacao de dia.
function TForm1.IniciaDia : Boolean;
var
 Mes, Ano, MesMeta, AnoMeta : Integer;
 DataImplantacao : TDateTime;
 AnoAnterior, MesAnterior, MesAtual : Integer;
begin
  Result := True;
  InicioDia := False;

  ValidaBD;

  //REGISTRO DA DATA DO DIA, criptografada no campo CHAVESINTEGRA, se o campo estiver vazio
  //se houver apagamento da data, data errada, ou coisa assim, a autenticacao vai zerar e deve ser obtida uma nova....
  if not Dm.CdsParametros.Active then
    try
      Dm.CdsParametros.Open;
    except
    on E:Exception do
     begin
       GeraLog(E.Message);
     end;
    end;

  DataHoje := StrtoDateDef(Crypt('D', DM.CdsParametrosCHAVESINTEGRA.AsString), 0);
  if (DataHoje = 0) or (Crypt('D', Trim(DM.CdsParametrosCHAVESINTEGRA.AsString)) = '') then
   begin
     GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - >>>>>>>>>>>>>>>>>>> Data Encontrada no Banco: ' + FormatDateTime('dd/mm/yyyy', DataHoje));
     DM.CdsParametros.Edit;
     DM.CdsParametrosCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
     DM.CdsParametrosDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date - 5));
     DM.CdsParametros.Post;
     GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Atribuicao de data do Dia por estar vazio.' );
     FazLogErroApply(DM.CdsParametros, '');
   end;

  DataHoje := StrtoDateDef(Crypt('D', DM.CdsParametrosCHAVESINTEGRA.AsString), 0);
  if (DataHoje = 0) then
   begin
     GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - >>>>>>>>>>> Data mantida no banco mesmo apos gravacao correta: ' + FormatDateTime('dd/mm/yyyy', DataHoje));
     exit;
   end;

  Try
    MesAnterior := StrtoInt(FormatDateTime('mm', DataHoje));
    AnoAnterior := StrtoInt(FormatDateTime('yyyy', DataHoje));
  Except
    on E:Exception do
     begin
       GeraLog(E.Message);
       Exit;
     end;
  end;

  GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Data Encontrada no Banco: ' + FormatDateTime('dd/mm/yyyy', DataHoje));

  //se houve alteracao de data, o sistema vai executar um conjunto de rotinas de fechamento do dia anterior e abertura de novo dia
  if (DataHoje < Date) and (Time > StrtoTime('02:00:00')) then
     begin
        GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Alteracao de data do Sistema : ' + Crypt('D', DM.CdsParametrosCHAVESINTEGRA.AsString));
        GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - ApagaArquivos' );
        ApagaArquivos;
        GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - ArmazenaVendaMaior' );
        ArmazenaVendaMaior;
        if (Crypt('D', Trim(DM.CdsParametrosCHAVESINTEGRA.AsString)) = '') then
         begin
           DM.CdsParametros.Edit;
           DM.CdsParametrosCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
           DM.CdsParametrosDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date - 5));
           DM.CdsParametros.Post;
           GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Atribuicao de data do Dia por estar vazio.' );
           FazLogErroApply(DM.CdsParametros, '');
         end;


        //efetua o backup diario, automaticamente..... GML
        //GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Disparado o FarmaxBackup.' );
        //WinExec(pChar('FarmaxBackup.exe'),SW_HIDE);

        if not (DM.CdsParametrosDT_IMPLANTACAO.IsNull) and (DM.CdsParametrosDT_IMPLANTACAO.AsString <> '') then
          DataImplantacao  := StrToDateDef(Crypt('D', DM.CdsParametrosDT_IMPLANTACAO.AsString), 0)
        else
          DataImplantacao := date;

        DM.CdsParametros.Refresh;
        if StrtoDateDef(Crypt('D', DM.CdsParametrosCHAVESINTEGRA.AsString), 0) >= Date then
         begin
           GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Inicializacao do Dia já executada por outro Terminal' );
           InicioDia := False;
           Timer4.Enabled := True;
           Dm.CdsParametros.Close;
           Exit;
         end;

        //incrementa mais um dia de utilizacao do sistema, visando autenticar dentro de x dias
        GeraLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' -------------------------------------- Alteracao: ' + #13 +
                 'Data Anterior : ' + Crypt('D', Dm.CdsParametrosCHAVESINTEGRA.AsString) + #13 +
                 'Data Atual : ' + FormatDateTime('dd/mm/yyyy', Date));
        try
          DM.CdsParametros.Edit;
          DM.CdsParametrosDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', DataImplantacao + 1));
          DM.CdsParametrosCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
          DM.CdsParametrosDATAATUAL.AsDateTime := Date;
          FazLogErroApply(DM.CdsParametros, 'IniciaDia');
          GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Gravacao da Nova data do dia executada com Sucesso.' + FormatDateTime('dd/mm/yyyy', Date) );
        except
          GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Gravacao da Nova data do dia NAO FOI executada com Sucesso.' + FormatDateTime('dd/mm/yyyy', Date) );
        end;

        DataHoje := Date;
        MesAtual := StrtoInt(FormatDateTime('mm', Date));

        Try
          GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando o backup do banco.');
          Application.CreateForm(TFrmBackup, FrmBackup);
          FrmBackup.BtBackupClick(FrmBackup.BtBackup);
        Finally
          FrmBackup.Destroy;
        End;

        //executa limpeza dos arquivos temporarios
        if (DM.CdsParametrosTIPO_LOJA.AsString = 'U') then
            ExecutaProcedure('EXECUTE PROCEDURE SP_INICIA_BANCO_DADOS_0');

        //executa calculos dos saldos de comissao
        if (DM.CdsParametrosTIPO_LOJA.AsString <> 'M') then
         begin
            //calcula as comissões dos vendedores no ultimo dia de abertura da loja...
            ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_SALDO_COMISSAO(' + QuotedStr(FormatDateTime('mm/dd/yyyy', DataHoje)) + ', ' + QuotedStr(DM.CdsParametrosCD_FILIAL.AsString) + ')');

            if (DayOfTheMonth(Date) <= 2) then
                ExecutaProcedure('EXECUTE PROCEDURE SP_ARMAZENA_POSICAOESTOQUE');
         end
        else             
         begin
           if DM.CdsParametrosUSAIMS.AsString = 'S' then
            begin
               ExecutaProcedure('EXECUTE PROCEDURE SP_APAGA_ESTOQUEIMS');
               ExecutaProcedure('EXECUTE PROCEDURE SP_ARMAZENA_ESTOQUEIMS');
            end;
            ExecutaProcedure('EXECUTE PROCEDURE SP_APAGA_PEDIDOGESTAO_INATIVO');
         end;


        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Processos de Calculo de Demandas <<<<<<<<<<<<<<<<<<<<
        // ACUMULANDO TOTAL VENDIDO DO PRODUTO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Executando Sp Preenche Grupos e Curvas...' );
        ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_GRUPOS_CURVA');

        DM.Sp_Preenche_Dados_Filiais.ExecSQL; //dados do cadastro das filiais (custos e vendas)

        if (DM.CdsParametrosTIPO_LOJA.AsString <> 'M') then
         begin
            if MesAtual <> MesAnterior then
             begin
                ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_VENDA_PRODUTO_LOJA');
                GeraLog('Executada PROCEDURE SP_PREENCHE_VENDA_PRODUTO na virada do Mes: "' + FormatDateTime('dd/mm/yyyy', Date) + '"');
             end
            else
             begin
                ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_VENDA_PRODUTO('+ FormatDateTime('yyyy', Date) + ',' +
                                  InttoStr(StrtoInt(FormatDatetime('mm', Date))) + ', ' + DM.cdsparametrosCD_FILIAL.AsString + ')');
                GeraLog('Executada PROCEDURE SP_PREENCHE_VENDA_PRODUTO na virada do dia: "' + FormatDateTime('dd/mm/yyyy', Date) + '"');
             end;
         end;

        // Calculando Media_F na Virada do Mes
        if (MesAtual <> MesAnterior) then
         begin
            GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Mudança de Mes.....: de ' + InttoStr(MesAnterior) + ' para ' + InttoStr(MesAtual));
            // calculando as curvas do dia em funcao do previsto em CLASSES
            if (DM.CdsParametrosTIPO_LOJA.AsString <> 'L') then
              CalculaCurva;

            GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Calculo de MediaF, eSeg e eMax. ');
            if DM.CdsParametrosESTOQUEMINIMO.AsString = 'M' then
               ExecutaProcedure('EXECUTE PROCEDURE SP_CALCULA_MEDIAF(' + DM.CdsParametrosCD_FILIAL.AsString + ', ' + InttoStr(MesAtual) + ')')
            else
               ExecutaProcedure('EXECUTE PROCEDURE SP_CALCULA_MEDIAF_ESEG_EMAX(' + DM.CdsParametrosCD_FILIAL.AsString + ')')
         end;

        //tratamento de clientes... bloqueio, juros...
        if (DM.CdsParametrosTIPO_LOJA.AsString <> 'L') then
         begin
            if not (DM.CdsParametrosDIASBLOQUEIOCLIENTE.IsNull) and (DM.CdsParametrosDIASBLOQUEIOCLIENTE.AsInteger > 0) then
                begin
                  GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Bloqueio automatico de clientes em atraso. ');
                  ExecutaProcedure('EXECUTE PROCEDURE SP_BLOQUEIACLIENTEATRASO');
                end;
         end;

        InicioDia := True;

        //EFETUANDO PAGAMENTO AUTOMATICO DOS CHEQUES_PRE
        if  (DM.CdsParametrosTIPO_LOJA.AsString <> 'L') then
         begin
            if (DM.CdsParametrosBAIXAAUTOMATICACHEQUEPRE.AsString = 'S') then
              try
                GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Baixa automatica de Cheques Pre e cartao. ');
                BaixaAutomaticaChequePre;
              except
              end;
         end;

        //inicia transacao
        ExecutaProcedure('EXECUTE PROCEDURE SP_RECALCULA_ESTOQUE_INICIA_DIA(' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date- 1)) + ', 15)');
        ExecutaProcedure('EXECUTE PROCEDURE SP_RECALCULA_PRODUTOSTOTAIS');

        DM.Cds1.Close;
        DM.Sql1.CommandText := 'SELECT COUNT(*) FROM PRINCIPIO_ATIVO';
        DM.Cds1.Params.Clear;
        DM.Cds1.Open;
        if DM.Cds1.Fields[0].AsInteger = 0 then
            ExecutaProcedure('EXECUTE PROCEDURE SP_SUPORTE_PRINCIPIO_ATIVO');
        DM.Cds1.Close;

        Mes := StrtoInt(FormatDateTime('MM', Date)) - 1;
        Ano := StrtoInt(FormatDateTime('yyyy', Date));
        MesMeta := StrtoInt(FormatDateTime('MM', Date));
        AnoMeta := StrtoInt(FormatDateTime('yyyy', Date));
        if Mes < 1 then
         begin
           Mes := 12;
           Ano := Ano - 1;
         end;

         DM.Cds1.Close;
         DM.Sql1.CommandText := 'SELECT COUNT(*) FROM METAS_FILIAIS WHERE CD_FILIAL = ' +  DM.CdsParametrosCD_FILIAL.AsString + ' AND MESREF = ' + IntToStr(MesMeta) + '  AND ANOREF = ' + IntToStr(AnoMeta);
         DM.Cds1.Params.Clear;
         DM.Cds1.Open;
         if DM.Cds1.Fields[0].AsInteger = 0 then
          begin
             ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_META_NOVA(' +
                                 DM.CdsParametrosCD_FILIAL.AsString + ', ' +
                                 InttoStr(Mes) + ', ' +
                                 InttoStr(Ano) + ', 30)');

             Application.ProcessMessages;
             ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_META_NOVA_VEND(' +
                                 DM.CdsParametrosCD_FILIAL.AsString + ', ' +
                                 InttoStr(Mes) + ', ' + InttoStr(Ano) + ')');
          end;


        ///////////ativando a trigger de alteracao de produtos///////////////////
        ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE');


        ///////////marcando todos os produtos para o envio para a matriz///////////////////
        if (DM.CdsParametrosTIPO_LOJA.AsString = 'L') then
          begin
            GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Preparando produtos com movimento de estoque para envio à Matriz. ');
            ExecutaProcedure('UPDATE PRODUTOS SET ENVIADO = ' + QuotedStr(' ') + ' WHERE ID_PRODUTO IN (SELECT DISTINCT ID_PRODUTO FROM LANCAMENTOS WHERE ID_PRODUTO > 0 AND CD_FILIAL > 0 AND DATA_LANCAMENTO > CURRENT_DATE - 10)');
          end;

        Application.Terminate;
        Try
          Halt;
        Except
        End;    
     end;
end;



procedure TForm1.ArmazenaVendaMaior;
var
  VendaVendas : Real;
begin
    VendaVendas := 0;

    DM.Cds1.Close;
    if DM.CdsParametrosCODIGOUSUARIO.AsString = '2226' then
       DM.Sql1.CommandText := 'SELECT MAX(CD_VENDA) FROM VENDAS WHERE CD_VENDA <= 1000000'
    else
       DM.Sql1.CommandText := 'SELECT MAX(CD_VENDA) FROM VENDAS';
    DM.Cds1.Params.Clear;
    DM.Cds1.Open;
    if not (DM.Cds1.Fields[0].IsNull) then
       VendaVendas := DM.Cds1.Fields[0].AsFloat;

    if (DM.CdsParametrosCD_VENDA.IsNull) or (VendaVendas > DM.CdsParametrosCD_VENDA.AsFloat) then
     begin
        DM.CdsParametros.Edit;
        DM.CdsParametrosCD_VENDA.AsFloat := VendaVendas;
        DM.CdsParametros.Post;
        DM.CdsParametros.ApplyUpdates(0);
     end;
    DM.Cds1.Close;
end;


procedure TForm1.ValidaBD;
var ini : TIniFile;
begin
    ini := TiniFile.Create(ExtractFilePath(Application.ExeName)+'CaminhoBD.ini');
    CaminhoBDConexao := ini.ReadString('CAMINHO','CAMINHO','Caminho');
    if Pos(':\', CaminhoBDConexao) > 0 then
     begin
       NomeServidorConexao := ini.ReadString('NOME','NOME','NomedoServidorDB');
       ini.WriteString('NOME','NOME', Crypt('C', NomeServidorConexao));
       ini.WriteString('CAMINHO','CAMINHO', Crypt('C', CaminhoBDConexao));
     end;
    NomeServidorConexao := Crypt('D', ini.ReadString('NOME','NOME','NomedoServidorDB'));
    CaminhoBDConexao := Crypt('D', ini.ReadString('CAMINHO','CAMINHO','Caminho'));
    FarmaxConexao := ini.ReadString('FARMAX', 'FARMAX', '');
    ini.Free;

    ServidorLocal := FileExists(CaminhoBDConexao);

    if (NomeServidorConexao <> 'NomedoServidorDB') and (CaminhoBDConexao <> 'Caminho') then
      begin
        DM.SQLConn.Connected := False;
        DM.SQLConn.Params.Values['Database'] := NomeServidorConexao + ':' + CaminhoBDConexao;
        if FarmaxConexao <> '' then
           DM.SQLConn.Params.Values['PASSWORD'] := Crypt('D', FarmaxConexao);
        Try
          DM.SQLConn.Connected := True;
        Except
          GeraLog('Falha na abertura da conexão com o banco de dados. Trigger encerrado 1 : "' + FormatDateTime('dd/mm/yyyy', Date) + '"');
          Application.Terminate;
          Halt;
          Exit;
        End;
      end
    else
      begin
        GeraLog('Trigger encerrado 2 : "' + FormatDateTime('dd/mm/yyyy', Date) + '"');
        Application.Terminate;
        Halt;
        Exit;
      end;
end;


procedure TForm1.ApagaArquivos;
var
  RecLog, RecBackup, RecCaixas : TSearchRec;
  Data : TDateTime;
  ListadeArquivos : TStringList;
  NomeArquivo : String;
begin
{  if FindFirst(ExtractFilePath(Application.ExeName)+'Logs\*.*', faAnyFile, RecLog) = 0 then
   begin
    repeat
      Data := StrtoDateDef(FormatDateTime('dd/mm/yyyy', FileDatetoDateTime(RecLog.Time)), 0);
      if Data <= (Date - 30) then
        DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'Logs\' + RecLog.Name));
    until FindNext(RecLog) <> 0;
   end;}

  //armazena no HD os 8 ultimos backups
  ListadeArquivos := TStringList.Create;
  if FindFirst(ExtractFilePath(Application.ExeName)+'Backups\*.*', faArchive, RecBackup) = 0 then
   begin
    repeat
      ListadeArquivos.Add('Backup' + Copy(RecBackup.Name, 11, 4) + Copy(RecBackup.Name, 9, 2) + Copy(RecBackup.Name, 7, 2) + Copy(RecBackup.Name, 15, Length(RecBackup.Name)));
    until FindNext(RecBackup) <> 0;
    ListadeArquivos.Sort;
    while ListadeArquivos.Count > 15 do
     begin
       NomeArquivo := 'Backup' + Copy(ListadeArquivos.Strings[0], 13, 2) + Copy(ListadeArquivos.Strings[0], 11, 2) + Copy(ListadeArquivos.Strings[0], 7, 4) + Copy(ListadeArquivos.Strings[0], 15, Length(ListadeArquivos.Strings[0]));
       DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'Backups\' + NomeArquivo));
       ListadeArquivos.Delete(0);
     end;
    ListadeArquivos.Destroy;
   end;

  if FindFirst(ExtractFilePath(Application.ExeName)+'Caixas\*.*', faAnyFile, RecCaixas) = 0 then
   begin
    repeat
      Data := StrtoDateDef(FormatDateTime('dd/mm/yyyy', FileDatetoDateTime(RecCaixas.Time)), 0);
      if Data <= (Date - 5) then
        DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'Caixas\' + RecCaixas.Name));
    until FindNext(RecCaixas) <> 0;
   end;
end;


Procedure TForm1.RegistraHoraInicio;
Var Txt : TextFile;
begin
  ///////////////// tratamento do tempo de atividade dos clients
  if not FileExists(ExtractFilePath(Application.ExeName) + 'ExporterTime.TXT') then
   begin
    AssignFile(Txt, ExtractFilePath(Application.ExeName) + 'ExporterTime.TXT');
    Rewrite(Txt);
    Writeln(Txt, TimetoStr(Time));
    CloseFile(Txt);
   end;

  AssignFile(Txt, ExtractFilePath(Application.ExeName) + 'ExporterTime.TXT');
  ReWrite(Txt);
  Writeln(Txt, TimetoStr(Time));
  CloseFile(Txt);
  ////////////////////////////////////////////////////////////////////////////////
end;


//calculo das curvas ABC para os  produtos em funcao de Classe
procedure TForm1.CalculaCurva;
var
 Mes, Ano, UltimoDia : String;
 DataInicial, DataFinal : TDateTime;
begin
  Mes := InttoStr(StrtoInt(FormatDateTime('mm', Date)) - 1);
  Ano := FormatDateTime('yyyy', Date);
  if Mes = '0' then
   begin
     Mes := '12';
     Ano := InttoStr(StrtoInt(Ano) - 1);
   end;
  UltimoDia := FloattoStr(UltimoDiaMes(StrtoFloat(Mes)));
  DataInicial := StrtoDateDef('01/'+Mes+'/'+Ano, 0);
  DataFinal := StrtoDateDef(UltimoDia+'/'+Mes+'/'+Ano, 0);

  DM.CdsCadClasse.Close;
  DM.CdsCadClasse.Open;
  DM.CdsCadClasse.First;
  while not DM.CdsCadClasse.Eof do
   begin
    if Date >= (DM.CdsCadClasseDT_CALCULOCURVA.AsDateTime + DM.CdsCadClasseFREQUENCIA.AsInteger) then
     begin
       Try
         ExecutaProcedure('EXECUTE PROCEDURE SP_CALCULA_CURVA('+
                                    DM.CdsParametrosCD_FILIAL.AsString + ', ' +
                                    DM.CdsCadClasseCD_CLASSE.AsString+','+
                                    QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial))+ ','+
                                    QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal))+')');

         DM.CdsCadClasse.Edit;
         DM.CdsCadClasseDT_CALCULOCURVA.AsDateTime := Date;
         if (DM.CdsCadClasseFREQUENCIA.AsInteger <= 0) or (DM.CdsCadClasseFREQUENCIA.IsNull) then
           DM.CdsCadClasseFREQUENCIA.AsInteger := 30;
         DM.CdsCadClasse.Post;
       Except
         GeraLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro no processo de Calculo da Curva.' );
       End;
     end;
    DM.CdsCadClasse.Next;
   end;
  FazLogErroApply(DM.CdsCadClasse, 'CLASSES');
  DM.CdsCadClasse.Close;
end;


procedure TForm1.BaixaAutomaticaChequePre;
var
 Conta : Real;
 Banco, Agencia, ContaCorrente : String;
begin
  Conta := 0;
  Banco := '';
  Agencia := '';
  ContaCorrente := '';
  if not (DM.CdsParametrosCD_CONTA_BAIXA_CHEQUE.IsNull) and (DM.CdsParametrosCD_CONTA_BAIXA_CHEQUE.AsFloat <> 0) then
   begin
     DM.CdsCadContas.Close;
     DM.CdsCadContas.Open;
     DM.CdsCadContas.Filter := 'CD_CONTA = ' + DM.CdsParametrosCD_CONTA_BAIXA_CHEQUE.AsString;
     DM.CdsCadContas.Filtered := True;
     if  DM.CdsCadContas.RecordCount > 0 then
      begin
       Conta := DM.CdsParametrosCD_CONTA_BAIXA_CHEQUE.AsFloat;
       Banco := DM.CdsCadContasBANCO.AsString;
       Agencia := DM.CdsCadContasAGENCIA.AsString;
       ContaCorrente := DM.CdsCadContasCONTA_CORRENTE.AsString;
       DM.CdsCadContas.Close;
      end
     else
      begin
        DM.CdsCadContas.Close;
        DM.CdsCadContas.Open;
        DM.CdsCadContas.IndexFieldNames := 'CD_CONTA';
        if DM.CdsCadContas.RecordCount > 0 then
         begin
           DM.CdsCadContas.Filter := 'TIPO = ' + QuotedStr('B');
           DM.CdsCadContas.Filtered := True;
           if DM.CdsCadContas.RecordCount > 0 then
            begin
              DM.CdsCadContas.First;
              Conta := DM.CdsCadContasCD_CONTA.AsFloat;
              Banco := DM.CdsCadContasBANCO.AsString;
              Agencia := DM.CdsCadContasAGENCIA.AsString;
              ContaCorrente := DM.CdsCadContasCONTA_CORRENTE.AsString;
            end
           else
            begin
              DM.CdsCadContas.Filter := '';
              DM.CdsCadContas.Filtered := False;
              DM.CdsCadContas.First;
              Conta := DM.CdsCadContasCD_CONTA.AsFloat;
              Banco := DM.CdsCadContasBANCO.AsString;
              Agencia := DM.CdsCadContasAGENCIA.AsString;
              ContaCorrente := DM.CdsCadContasCONTA_CORRENTE.AsString;
            end;
         end
        else
         begin
           Exit;
         end;
      end;
   end
  else
   begin
      DM.CdsCadContas.Close;
      DM.CdsCadContas.Open;
      DM.CdsCadContas.IndexFieldNames := 'CD_CONTA';
      if DM.CdsCadContas.RecordCount > 0 then
       begin
         DM.CdsCadContas.Filter := 'TIPO = ' + QuotedStr('B');
         DM.CdsCadContas.Filtered := True;
         if DM.CdsCadContas.RecordCount > 0 then
          begin
            DM.CdsCadContas.First;
            Conta := DM.CdsCadContasCD_CONTA.AsFloat;
            Banco := DM.CdsCadContasBANCO.AsString;
            Agencia := DM.CdsCadContasAGENCIA.AsString;
            ContaCorrente := DM.CdsCadContasCONTA_CORRENTE.AsString;
          end
         else
          begin
            DM.CdsCadContas.Filter := '';
            DM.CdsCadContas.Filtered := False;
            DM.CdsCadContas.First;
            Conta := DM.CdsCadContasCD_CONTA.AsFloat;
            Banco := DM.CdsCadContasBANCO.AsString;
            Agencia := DM.CdsCadContasAGENCIA.AsString;
            ContaCorrente := DM.CdsCadContasCONTA_CORRENTE.AsString;
          end;
       end
      else
       begin
         Exit;
       end;
   end;

  DM.CdsBaixaAutomaticaChequePre.Close;
  DM.CdsBaixaAutomaticaChequePre.Open;
  DM.CdsBaixaAutomaticaChequePre.First;

  while not DM.CdsBaixaAutomaticaChequePre.Eof do
   begin
     if not (DM.CdsBaixaAutomaticaChequePreVL_SALDO.IsNull) and
        (DM.CdsBaixaAutomaticaChequePreVL_SALDO.AsFloat <> 0) and
        (DM.CdsBaixaAutomaticaChequePreSTATUS.AsString = 'A') then
      begin
        DM.CdsBaixaAutomaticaChequePre.Edit;
        DM.CdsBaixaAutomaticaChequePreVL_PAGAMENTO.AsFloat := DM.CdsBaixaAutomaticaChequePreVL_PAGAMENTO.AsFloat +
                                                           DM.CdsBaixaAutomaticaChequePreVL_SALDO.AsFloat;
        DM.CdsBaixaAutomaticaChequePreVL_SALDO.AsFloat := 0;
        DM.CdsBaixaAutomaticaChequePreDT_PAGAMENTO.AsDateTime := Date;
        DM.CdsBaixaAutomaticaChequePreSTATUS.AsString := 'P';

        DM.CdsBaixaAutomaticaChequePreCD_CONTA.AsFloat := Conta;
        DM.CdsBaixaAutomaticaChequePreBANCO.AsString := Banco;
        DM.CdsBaixaAutomaticaChequePreAGENCIA.AsString := Agencia;
        DM.CdsBaixaAutomaticaChequePreCONTA.AsString := ContaCorrente;

        if (DM.CdsBaixaAutomaticaChequePreHISTORICO.IsNull) or (DM.CdsBaixaAutomaticaChequePreHISTORICO.AsString = '') then
            DM.CdsBaixaAutomaticaChequePreHISTORICO.AsString := DM.CdsBaixaAutomaticaChequePreVirtualCliente.AsString;
        if DM.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.IsNull then
         begin
            Case DM.CdsBaixaAutomaticaChequePreCD_FORMA_PAGAMENTO.AsInteger of
              2 : DM.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 12;
              3 : DM.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 13;
              4 : DM.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 11;
              5 : DM.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 10;
              6 : DM.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 14;
            else
              DM.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 15;
            end;
         end;
        FazLogErroApply(DM.CdsBaixaAutomaticaChequePre, 'bbtn_GravaContasPagarClick');

        DM.CdsMovimentoCaixa.Close;
        DM.CdsMovimentoCaixa.Params[0].AsFloat := -1;
        DM.CdsMovimentoCaixa.Params[1].AsFloat := -1;
        DM.CdsMovimentoCaixa.Open;

        DM.CdsMovimentoCaixa.Append;
        DM.CdsMovimentoCaixaANOREFERENCIA.AsString := FormatDateTime('yyyy', Date);
        DM.CdsMovimentoCaixaCD_CONTA.AsFloat := DM.CdsBaixaAutomaticaChequePreCD_CONTA.AsFloat;
        DM.CdsMovimentoCaixaCD_CONTAS_RECEBER.AsFloat := DM.CdsBaixaAutomaticaChequePreCD_CONTAS_RECEBER.AsFloat;
        DM.CdsMovimentoCaixaCD_FILIAL.AsFloat := DM.CdsBaixaAutomaticaChequePreCD_FILIAL.AsFloat;
        DM.CdsMovimentoCaixaCD_MOVIMENTOCAIXA.AsFloat := RetornaID('MOVIMENTOCAIXA','CD_MOVIMENTOCAIXA');
        Case DM.CdsBaixaAutomaticaChequePreCD_FORMA_PAGAMENTO.AsInteger of
          2 : DM.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 12;
          3 : DM.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 13;
          4 : DM.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 11;
          5 : DM.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 10;
          6 : DM.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 14;
        else
          DM.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 15;
        end;
        DM.CdsMovimentoCaixaDATA.AsDateTime := DM.CdsBaixaAutomaticaChequePreDT_PAGAMENTO.AsDateTime;
        DM.CdsMovimentoCaixaDOCUMENTO.AsString := DM.CdsBaixaAutomaticaChequePreDOCUMENTO.AsString;
        DM.CdsMovimentoCaixaHISTORICO.AsString := DM.CdsBaixaAutomaticaChequePreHISTORICO.AsString;
        DM.CdsMovimentoCaixaMESREFERENCIA.AsString := FormatDateTime('mm', Date);
        DM.CdsMovimentoCaixaTIPO_MOVIMENTO.AsString := 'C';
        DM.CdsMovimentoCaixaVALOR.AsFloat := DM.CdsBaixaAutomaticaChequePreVL_PAGAMENTO.AsFloat;
        FazLogErroApply(DM.CdsMovimentoCaixa, 'bbtn_GravaContasPagarClick');

        AtualizaSaldo(DM.CdsSaldo,DM.CdsSaldoCD_CONTA,DM.CdsSaldoDATA,DM.CdsSaldoSALDO,
                      DM.CdsMovimentoCaixaVALOR.AsFloat,0, DM.CdsMovimentoCaixaTIPO_MOVIMENTO.AsString, '',
                      DM.CdsMovimentoCaixaDATA.AsDateTime,DM.CdsMovimentoCaixaDATA.AsDateTime,
                      DM.CdsMovimentoCaixaCD_CONTA.AsInteger, 0);
      end;
     DM.CdsBaixaAutomaticaChequePre.Next;
   end;
end;




function TForm1.GravaEventos(Codigo : Real; Evento : String; Inicio, Erro : Boolean) : Real;
begin
  Result := 0;
  DM.CdsEventos.Close;
  if Cd_Evento = 0 then
   begin
      DM.CdsEventos.Params[0].AsFloat := -1;
      DM.CdsEventos.Open;
      DM.CdsEventos.Append;
      DM.CdsEventosCD_EVENTO.AsFloat := RetornaID('EVENTOS', 'CD_EVENTO');
      DM.CdsEventosDESCRICAO.AsString := Trim(Evento);
      DM.CdsEventosDATA.AsDateTime := Date;
      DM.CdsEventosHORAINICIO.AsDateTime := Time;
      DM.CdsEventosSTATUS.AsString := 'A';
      DM.CdsEventosENVIADO.AsString := '';
   end
  else
   begin
      DM.CdsEventos.Params[0].AsFloat := Cd_Evento;
      DM.CdsEventos.Open;
      DM.CdsEventos.Edit;
      DM.CdsEventosHORAFIM.AsDateTime := Time;
      if Erro then
         DM.CdsEventosSTATUS.AsString := 'E'
      else
         DM.CdsEventosSTATUS.AsString := 'C';
   end;
  DM.CdsEventos.Post;
  DM.CdsEventos.ApplyUpdates(0);
  Result := DM.CdsEventosCD_EVENTO.AsFloat;
  DM.CdsEventos.Close;
end;



procedure TForm1.AbreTransacao;
begin
  if not(DM.SQLConn.InTransaction) then
  begin
    TD.TransactionID := StrToInt(FormatDateTime('NNSSZZZ', now) + IntToStr(Random(9)));
    TD.GlobalID := TD.TransactionID;
    TD.IsolationLevel := xilREADCOMMITTED;
    DM.SQLConn.StartTransaction(TD);
  end;
end;

procedure TForm1.CancelaTransacao;
begin
  if DM.SQLConn.InTransaction then
     DM.SQLConn.Rollback(TD);
end;

procedure TForm1.ConfirmaTransacao;
begin
  if DM.SQLConn.InTransaction then
     DM.SQLConn.Commit(TD);
end;

end.
