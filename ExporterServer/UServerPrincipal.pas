unit UServerPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,midaslib;

type
  TServerPrincipal = class(TForm)
    EditPort: TEdit;
    SpbStart: TSpeedButton;
    SpbStop: TSpeedButton;
    Label1: TLabel;
    Memo1: TMemo;
    procedure SpbStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpbStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Stop;
    procedure Status;
    procedure Start;
  end;

var
  ServerPrincipal: TServerPrincipal;

implementation
uses
    Horse,
    Horse.Jhonson,
    Horse.Compression,
    System.JSON, Controller.Filial, Controller.Produto, Controlle.clientes,
  Controlle.Processo;

{$R *.dfm}

procedure TServerPrincipal.FormCreate(Sender: TObject);
begin

   THorse.KeepConnectionAlive:=true;  //false aproveitar conexao fazedr tread sempre
   THorse.MaxConnections:=200;
   Thorse.Version;
   THorse.Use(Compression());
   THorse.Use(Jhonson());


   Controller.Filial.Registry;
   Controller.Produto.Registry;
   controlle.clientes.Registry;
   Controlle.Processo.registry;

end;

procedure TServerPrincipal.SpbStartClick(Sender: TObject);
begin
  Start;
  Status;
end;

procedure TServerPrincipal.SpbStopClick(Sender: TObject);
begin

   Stop;
  Status;

end;

procedure TServerPrincipal.Start;
 begin
  // Need to set "HORSE_VCL" compilation directive
  THorse.Listen(StrToInt(EditPort.Text));
end;

procedure TServerPrincipal.Status;
begin
  SpbStop.Enabled := THorse.IsRunning;
  SpbStart.Enabled := not THorse.IsRunning;
  EditPort.Enabled := not THorse.IsRunning;
end;

procedure TServerPrincipal.Stop;
begin
   THorse.StopListen;
end;

end.
