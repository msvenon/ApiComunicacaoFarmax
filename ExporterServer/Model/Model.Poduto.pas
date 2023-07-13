unit Model.Poduto;
interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Vcl.Dialogs,inifiles,Vcl.Forms;

function GetProduto( out erro: string ):TFDQuery;

implementation

uses Udm;

function GetProduto(out erro: string ):TFDQuery;
 var
 sql,teste :String;
begin
   sql:='select id_produto , cd_produto, codigo_barras_1, descricao, estoque_1 from produtos ';
   dm.SqlProdutos.Active:=false;
   dm.SqlProdutos.Active:=true;
   dm.SqlProdutos.SQL.clear;
   dm.SqlProdutos.Open(sql);

 if dm.SqlProdutos.RecordCount >0 then
   begin
     teste:= dm.SqlProdutos.FieldByName( 'codigo_barras_1').Value;
     result:=dm.SqlProdutos;
     erro:='';
   end
   else
   begin
    result:=nil;
    erro:='Nao foi encontrado produto!';
   end;

end;

end.
