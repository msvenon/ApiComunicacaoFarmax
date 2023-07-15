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
  private
    { Private declarations }
  public
   function EnviandoClientes : Boolean;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Controlle.Filial, Udm, Funcoes;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
 EnviandoClientes;
end;

function TFrmPrincipal.EnviandoClientes: Boolean;
var
 Dados : Variant;
 Sql, sql2,sql3: String;
LResponse: IResponse;
TJsonfilial ,TjsonClienteObj:TJSONObject;
arrayclientes :TJSONArray;
begin
  //envia para a matriz os dados de Clientes
  Try
     Result :=false;


         Sql :='SELECT * FROM CLIENTES, TEMP_PRODUTOS2 WHERE TEMP_PRODUTOS2.PROCESSO = 14 AND CLIENTES.CD_CLIENTE = TEMP_PRODUTOS2.ID_PRODUTO';

         dm.Query.SQL.Clear;
         dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 14');
         dm.Query.ExecSQL(false);

         dm.Query.SQL.Clear;
         dm.Query.SQL.Add('INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 300 * FROM TEMP_PRODUTOS WHERE PROCESSO = 14');
         dm.Query.ExecSQL(false);


         dm.Query.SQL.Clear;
         dm.Query.Open(Sql);
         TDataSetSerializeConfig.GetInstance.Export.FormatDate :='DD/MM/YYYY';

        if dm.Query.RecordCount <> 0 then
          begin

             try

               GeraLog(TimetoStr(Time) + ' - Enviando Clientes');

               arrayclientes :=TJSONArray.Create;
               arrayclientes := dm.Query.ToJSONArray();

               //Memo1.Text:= arrayclientes.ToString;
              // Memo1.lines.SaveToFile(ExtractFilePath(Application.ExeName)+ 'testejson.txt');

               LResponse := TRequest.New.BaseURL(dm.BaseUrl )
                .Resource('clientes')
                  .AddBody(arrayclientes.ToString)
                    .Accept('application/json')
                     .Post;
                        FreeAndNil(arrayclientes);

               if LResponse.StatusCode = 200 then
               begin
                 GeraLog(TimetoStr(Time) + ' - total: '+FloatToStr(dm.Query.RecordCount) + ' - de Clientes enviado.' );
                 Result:=true;
                 Memo1.Clear;
                 memo1.Text:='200';

                 dm.Query.SQL.Clear;
                 dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 14 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 14)');
                 dm.Query.ExecSQL(false);

                 dm.Query.SQL.Clear;
                 dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 14');
                 dm.Query.ExecSQL(false);


               end
               else
               begin
                GeraLog('Erro no envio de cliente:');
                Result:=false;
               end;

             except
               Result := False;
             end;
          end
         else
          begin
            Result := False;
          end;



  Except
     on E:Exception do
      begin

      end;
  End;


end;

end.
