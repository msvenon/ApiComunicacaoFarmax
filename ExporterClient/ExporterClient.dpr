program ExporterClient;

uses
  Vcl.Forms,
  UExporterClient in 'Model\UExporterClient.pas' {FrmPrincipal},
  Udm in 'Module\Udm.pas' {DM: TDataModule},
  Funcoes in 'Controle\Funcoes.pas',
  Controlle.Filial in 'Controle\Controlle.Filial.pas',
  Controlle.ClientQuick in 'Controle\Controlle.ClientQuick.pas',
  Controlle.Client in 'Controle\Controlle.Client.pas',
  UDm2 in 'Module\UDm2.pas' {DM2: TDataModule},
  UDm3 in 'Module\UDm3.pas' {DM3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDM2, DM2);
  Application.CreateForm(TDM3, DM3);
  Application.Run;
end.
