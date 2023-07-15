unit Udm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Vcl.Dialogs,inifiles,Vcl.Forms, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    SqlProdutos: TFDQuery;
    SqlFiliais: TFDQuery;
    sqlClientes: TFDQuery;
    Query: TFDQuery;
    FDConstrole: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    dspControle: TDataSetProvider;
    cdsControle: TClientDataSet;
    cdsControleCAMPO: TStringField;
    cdsControleVALOR: TFloatField;
    FDStored: TFDStoredProc;
    SqlAtualizaClientes: TFDQuery;
    FDMemTableClientes: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
   procedure ValidaBd;
   function  Crypt(Action, Src: String): String;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.Crypt(Action, Src: String): String;
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

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 ValidaBd;
end;

procedure TDM.ValidaBd;

var
 Servidor, CaminhoBD,NOmeServidor, Aux1 : String;
 Posicao, Aux2 : Integer;
 ini:TInifile;
begin


    if not FileExists(extractFilePath(ParamStr(0))+'CaminhoBD.ini') then
    begin
      showmessage(' Instalar na Pasta do Farmax'+#13+ 'para pegar as configurações do servidor.');
                 exit;
    end;

    ini := TiniFile.Create(ExtractFilePath(Application.ExeName)+'CaminhoBD.ini');
    CaminhoBD    := Crypt('D', ini.ReadString('CAMINHO','CAMINHO','Caminho'));
    NomeServidor := Crypt('D', ini.ReadString('NOME','NOME','NomedoServidorDB'));
    ini.Free;

     begin

       try

         Fdconn.Connected:=false;
         Fdconn.Close;
         Fdconn.Params.Values['DriverID']  :='FB';
         Fdconn.Params.Values['Server']    := NomeServidor;
         Fdconn.Params.Values['Database']  := CaminhoBD;
         Fdconn.Params.Values['User_Name'] :='sysdba';
         Fdconn.Params.Values['Password']  :='masterkey';
         Fdconn.Params.Values['Port']      :='3050';
         Fdconn.Params.Values['Protocol']  :='TCPIP';
         Fdconn.Connected;
         Fdconn.Connected:=true;

       except on E: Exception do

         showmessage('Erro ao conectar no servidor :'+E.Message);
        end;


     end;


end;

end.
