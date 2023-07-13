program ServerMatriz;

uses
  Vcl.Forms,
  UServerPrincipal in 'UServerPrincipal.pas' {ServerPrincipal},
  Udm in 'Module\Udm.pas' {DM: TDataModule},
  Controller.Filial in 'Controle\Controller.Filial.pas',
  Controller.Produto in 'Controle\Controller.Produto.pas',
  Controlle.clientes in 'Controle\Controlle.clientes.pas',
  Funcoes in 'Controle\Funcoes.pas',
  Controlle.Processo in 'Controle\Controlle.Processo.pas';

{$R *.res}

begin
  Application.Initialize;
  //ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TServerPrincipal, ServerPrincipal);
  Application.Run;
end.
