
unit Controller.Produto;

interface
uses Horse,System.Json,System.SysUtils,DataSet.Serialize,Data.DB,FireDac.Comp.Client;

 procedure registry;
 procedure ListarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 procedure ListarProdutoId(Req: THorseRequest; Res: THorseResponse; Next: TProc);


implementation

uses  Udm;


procedure registry;
begin
 //as rotas
  THorse.Get('/produto',ListarProduto);
  THorse.Get('/produto/:id',ListarProdutoId);
end;

procedure ListarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 sql,teste :String;
begin
   sql:='select id_produto , cd_produto, codigo_barras_1, descricao, estoque_1 from produtos ';
   dm.SqlProdutos.SQL.clear;
   dm.SqlProdutos.Open(sql);

 if dm.SqlProdutos.RecordCount >0 then
   begin
     teste:= dm.SqlProdutos.FieldByName( 'codigo_barras_1').Value;
     res.Send<TJSONArray>(dm.SqlProdutos.ToJSONArray()).Status(200);
   end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;


end;


procedure ListarProdutoId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 sql,teste, barra :String;
begin
   barra:='';
   barra := req.Params['id'];
   dm.SqlProdutos.SQL.clear;
   sql:='select * from produtos where id_produto ='+barra;
   dm.SqlProdutos.Open(sql);

 if dm.SqlProdutos.RecordCount >0 then
   begin
     teste:= dm.SqlProdutos.FieldByName( 'codigo_barras_1').Value;
     res.Send<TJSONObject>(dm.SqlProdutos.ToJSONObject()).Status(200);
   end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(404);
   end;
end;


end.

