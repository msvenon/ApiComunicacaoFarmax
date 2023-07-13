unit Model.Filial;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Vcl.Dialogs,inifiles,Vcl.Forms;

function GetFilial( out erro: string ):TFDQuery;

implementation

uses Udm;

function GetFilial(out erro: string ):TFDQuery;
var
 sql:string;
begin

  sql:=' SELECT CD_FILIAL, DATA, HORA, CNPJ FROM SP_INTERLIGACAO';
  dm.SqlFiliais.Open(sql);

 if dm.SqlFiliais.RecordCount >0 then
   begin
     result:= dm.SqlFiliais;
     erro:='';

     dm.SqlFiliais.Free;

    end
   else
   begin
    result:=nil;
    erro:='Nao foi encontrado filial!';
    dm.SqlFiliais.Free;
   end;


end;

end.
