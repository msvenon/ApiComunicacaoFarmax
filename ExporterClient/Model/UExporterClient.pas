unit UExporterClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.WinXPanels, Vcl.DBCtrls, {dxGDIPlusClasses,} Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.WinXCtrls,system.json,REST.Client,
  REST.Types, dxGDIPlusClasses, FireDAC.Stan.StorageXML,midaslib,
  JPeg,IdHTTP, Winapi.CommCtrl, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient,ShellAPI,Wininet,
  Horse,
  DataSet.Serialize,
  RESTRequest4D;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    procedure Delay(Tempo: Word);
    procedure processar;


  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Controlle.Filial, Udm, Funcoes, Controlle.ClientQuick;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
 EnviandoClientes;
end;


procedure TFrmPrincipal.Delay(Tempo: Word);
var
x1: Double;
begin
    x1:= now;
    repeat until ((now-x1)*86400) > Tempo;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
 dm.cdsParametros.Close;
 dm.cdsParametros.open;

 dm.cdfilialparametro:=FloatToStr(dm.cdsParametrosCD_FILIAL.Value);
end;

procedure TFrmPrincipal.processar;
begin

end;
end.
