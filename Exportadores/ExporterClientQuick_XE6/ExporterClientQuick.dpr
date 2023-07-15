program ExporterClientQuick;

uses
  Forms,
  TlHelp32,
  SysUtils,
  uExporterClientQuick in 'uExporterClientQuick.pas' {FrmExporterClientQuick},
  uDmExporterQuick in 'uDmExporterQuick.pas' {DmExporterQuick: TDataModule};

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
  if not VerificaProcesso('ExporterClientQuick.exe') then
   begin
     Application.Initialize;
     Application.CreateForm(TDmExporterQuick, DmExporterQuick);
  Application.CreateForm(TFrmExporterClientQuick, FrmExporterClientQuick);
  Application.Run;
   end; 
end.
