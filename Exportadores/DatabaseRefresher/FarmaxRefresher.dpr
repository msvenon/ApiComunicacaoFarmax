program FarmaxRefresher;

uses
  Forms,
  TlHelp32,
  SysUtils,
  uDmRefresher in 'uDmRefresher.pas' {DmRefresher: TDataModule},
  UPrincipalRefresher in 'UPrincipalRefresher.pas' {FrmPrincipalRefresher},
  UBackup in 'UBackup.pas' {FrmBackup};

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(TDmRefresher, DmRefresher);
  Application.CreateForm(TFrmPrincipalRefresher, FrmPrincipalRefresher);
  Application.CreateForm(TFrmBackup, FrmBackup);
  Application.Run;
end.
