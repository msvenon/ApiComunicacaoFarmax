unit Controlle.clientes;

interface
uses Horse,System.Json,System.SysUtils,DataSet.Serialize,Data.DB,FireDac.Comp.Client;

procedure registry;
procedure Listarclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Listarclientesfilial(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Putclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses Udm;
procedure registry;
begin
  THorse.Get('/clientes', Listarclientes);
  THorse.Get('/clientes/:id', Listarclientesfilial);
  THorse.put('/clientes/:id', Listarclientesfilial);
end;

procedure Putclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 erro,sql :string;
 qry :TFDQuery;
 arrayfilial :TJSONArray;
begin

  // dm.FDStored.StoredProcName:= 'sp_atualiza_clientes' (



 if dm.sqlClientes.RecordCount >0 then
   begin
    res.Send<TJSONArray>(dm.sqlClientes.ToJSONArray());
    end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;


end;



procedure Listarclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 erro,sql :string;
 qry :TFDQuery;
 arrayfilial :TJSONArray;
begin
  sql:=' SELECT cd_filial,cd_cliente,nome,cidade,fone,uf FROM CLIENTES';
  //dm.sqlClientes.SQL.Clear;
  dm.sqlClientes.Open(sql);

 if dm.sqlClientes.RecordCount >0 then
   begin
    res.Send<TJSONArray>(dm.sqlClientes.ToJSONArray());
    end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;


end;

procedure Listarclientesfilial(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 erro,sql,cd_filial :string;
 qry :TFDQuery;
 arrayfilial :TJSONArray;
begin
  cd_filial := req.Params['id'];
  sql:=' SELECT cd_filial,cd_cliente,nome,cidade,fone,uf FROM CLIENTES where cd_filial='+cd_filial;
  //dm.sqlClientes.SQL.Clear;
  dm.sqlClientes.Open(sql);

 if dm.sqlClientes.RecordCount >0 then
   begin
    res.Send<TJSONArray>(dm.sqlClientes.ToJSONArray());
    end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;


end;


end.
