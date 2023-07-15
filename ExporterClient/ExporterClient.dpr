program ExporterClient;

uses
  Vcl.Forms,
  UExporterClient in 'Model\UExporterClient.pas' {FrmPrincipal},
  Udm in 'Module\Udm.pas' {DM: TDataModule},
  Funcoes in 'Controle\Funcoes.pas',
  Controlle.Processos in 'Controle\Controlle.Processos.pas',
  Controlle.Filial in 'Controle\Controlle.Filial.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.