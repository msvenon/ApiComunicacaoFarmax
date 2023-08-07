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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    Image1: TImage;
    PnConfig: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpbConfig: TSpeedButton;
    EditDns: TEdit;
    Label1: TLabel;
    EditPort: TEdit;
    Label2: TLabel;
    EditTimeEnvio: TEdit;
    Label3: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Memo1: TMemo;
    EditAtualPreco: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpbConfigClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  var
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
 //EnviandoClientes;
 processar;

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
// dm.cdsParametros.Close;
// dm.cdsParametros.open;
// dm.cdfilialparametro:=dm.cdsParametrosCD_FILIAL.Value;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
 CardPanel1.ActiveCard:=Card1;
end;

procedure TFrmPrincipal.processar;
begin

end;
procedure TFrmPrincipal.SpbConfigClick(Sender: TObject);
begin
 PnConfig.Visible:=true;
 CardPanel1.ActiveCard:=Card2;
 SpbConfig.Visible:=false;
end;

procedure TFrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
 PnConfig.Visible:=false;
 CardPanel1.ActiveCard:=Card1;
 SpbConfig.Visible:=true;
end;

end.
