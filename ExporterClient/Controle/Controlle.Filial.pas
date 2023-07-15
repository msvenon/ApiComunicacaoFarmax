unit Controlle.Filial;



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
  Horse,DataSet.Serialize,RESTRequest4D;



function validafilial:boolean;


implementation

uses Udm, Funcoes;


function validafilial:boolean;
var
  sql,cnpjloja,cnpj:string;
  LResponse: IResponse;
  TJsonfilial :TJSONObject;

begin

   Result:=false;

   sql:=' select  cd_filial, cgc from parametros' ;

   try

     DM.Query.Open(sql);

     if DM.Query.RecordCount>0 then
       begin

        TJsonfilial:=TJSONObject.Create;
        TJsonfilial.AddPair('cnpj',DM.Query.FieldByName('cgc').value);
        cnpjloja:= DM.Query.FieldByName('cgc').value;

         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
           .Resource('filial/'+cnpjloja)
          //.AddBody(TJsonfilial.ToString)
            .Accept('application/json')
              .Get;

         if LResponse.StatusCode = 200 then
         begin
           geralog('Conexao da Filial validada na matriz cnpj:'+cnpjloja);
           Result:=true;
         end
         else
         begin

           GeraLog('Erro ao Validar Cnpj da filial na matriz :[ '+ cnpjloja +' ] erro:' +LResponse.Content);

           Result:=false;
         end;

       end;

   except  on E: Exception do

         begin
           geralog('Erro ao consultar dados da filial em parametros:'+ e.message);
           result:=false;
         end;

   end;



end;



end.
