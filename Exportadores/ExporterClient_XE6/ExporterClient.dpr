program ExporterClient;

uses
  Forms,
  TlHelp32,
  SysUtils,
  UExporterClient in 'UExporterClient.pas' {FrmExporterClient},
  uDMExporterClient in 'uDMExporterClient.pas' {DmExporterClient: TDataModule},
  UDmExporterClient2 in 'UDmExporterClient2.pas' {DmExporterClient2: TDataModule};

{$R *.res}

//rotina que vai verificar se o processo de um determinado sistema ainda esta em execucao.
Function VerificaProcesso(Arquivo : string) : Boolean;
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  Looper : Boolean;
  Contador : Integer;
begin
  Contador := 0;
  SnapShot:=CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize:=sizeof(TProcessEntry32);
  Looper := Process32First(SnapShot,pe);
  Result := False;
  while Integer(Looper) <> 0 do
   begin
    if ExtractFileName(pe.szExeFile) = arquivo then
     begin
        Inc(Contador);
        if Contador > 1 then
         begin
           Result := True;
           Break;
         end;
     end;
    Looper := Process32Next(SnapShot,pe);
   end;
end;


begin
  if not VerificaProcesso('ExporterClient.exe') then
   begin
      Application.Initialize;
      Application.Title := 'ExporterClient';
  Application.CreateForm(TDmExporterClient, DmExporterClient);
  Application.CreateForm(TDmExporterClient2, DmExporterClient2);
  Application.CreateForm(TFrmExporterClient, FrmExporterClient);
  Application.Run;
   end;   
end.