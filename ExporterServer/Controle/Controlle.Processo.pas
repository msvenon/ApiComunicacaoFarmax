unit Controlle.Processo;

interface

uses Horse,System.Json,System.SysUtils,DataSet.Serialize,Data.DB,FireDac.Comp.Client;

procedure registry;

procedure GetProcessos(Req: THorseRequest; Res: THorseResponse; Next: TProc);

//function Processo (cd_filial :integer ) :

implementation

uses Udm;


procedure registry;

begin

   THorse.Get('/processos/:cd_filial', GetProcessos);

end;


procedure GetProcessos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 erro,sql,cd_filial :string;
 qry :TFDQuery;
 arrayfilial :TJSONArray;
begin

  cd_filial := req.Params['cd_filial'];

  sql:=' select * from temp_produtos where cd_filial='+cd_filial;

  dm.Query.Open(sql);

   if dm.Query.RecordCount >0 then
   begin
    res.Send<TJSONArray>(dm.Query.ToJSONArray());
    end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','No Content')).Status(204);
   end;



end;


end.
