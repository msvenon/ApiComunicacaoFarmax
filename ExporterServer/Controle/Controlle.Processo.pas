unit Controlle.Processo;

interface

uses Horse,System.Json,System.SysUtils,DataSet.Serialize,Data.DB,FireDac.Comp.Client;

procedure registry;

procedure GetProcessos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure DeleteProcessos(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses Udm;


procedure registry;

begin

   THorse.Get('/processos/:cd_filial', GetProcessos);
   THorse.Delete('/processos/:cd_filial/:processo/:id_produto', DeleteProcessos);

end;


procedure DeleteProcessos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 id_produto,sql,cd_filial,processo :string ;
begin
 cd_filial  := req.Params['cd_filial'];
 id_produto := req.Params['id_produto'];
 processo   := req.Params['processo'];

  sql:='delete from temp_produtos where cd_filial='+cd_filial +' and '+ 'id_produto='+id_produto +' and processo = '+processo ;

  try

    TRY
      dm.Query.sql.Add(sql);
      dm.Query.ExecSQL(false);

    except on E:Exception do
         res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Acceptable')).Status(406);
    END;

  finally
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Accepted')).Status(202);
  end;
end;


procedure GetProcessos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 erro,sql,cd_filial :string;
 qry :TFDQuery;
 arrayfilial :TJSONArray;
begin

  cd_filial := req.Params['cd_filial'];
  sql:=' select distinct(processo) from temp_produtos where cd_filial='+cd_filial;
  dm.Query.Open(sql);

   if dm.Query.RecordCount >0 then
     begin
      res.Send<TJSONobject>(TJSONObject.Create.AddPair('processos',dm.Query.ToJSONArray()));
      end
     else
     begin
       res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','No Content')).Status(204);
     end;

end;


end.
