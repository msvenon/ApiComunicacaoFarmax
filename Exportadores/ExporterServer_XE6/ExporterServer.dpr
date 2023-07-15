program ExporterServer;
//library ExporterServer;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  MidasLib,
  UWm in 'UWm.pas' {WebModule1: TWebModule},
  ServicosImpl in 'ServicosImpl.pas',
  ServicosIntf in 'ServicosIntf.pas',
  UDm in 'UDm.pas' {Dm: TSoapDataModule};

{$R *.res}

{exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;}

begin
  //CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
