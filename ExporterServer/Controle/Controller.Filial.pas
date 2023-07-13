unit Controller.Filial;

interface

uses Horse,System.Json,System.SysUtils,DataSet.Serialize,Data.DB,FireDac.Comp.Client;

procedure registry;
procedure Listarloglinteligacao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure ValidaFilialcnpj(Req: THorseRequest; Res: THorseResponse; Next: TProc);


implementation

uses  Udm, Funcoes;


procedure registry;
begin

  THorse.Get('/interligacao', Listarloglinteligacao);
  THorse.Get('/filial/:cnpj', ValidaFilialcnpj);

end;


procedure Listarloglinteligacao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 erro,sql :string;
 qry :TFDQuery;
 arrayfilial :TJSONArray;
begin

 sql:=' SELECT CD_FILIAL, DATA, HORA,NUMERO_ITENS, CNPJ FROM SP_INTERLIGACAO';
  dm.SqlFiliais.Open(sql);

 if dm.SqlFiliais.RecordCount >0 then
   begin
    res.Send<TJSONArray>(dm.SqlFiliais.ToJSONArray());
    end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;

end;

procedure ValidaFilialcnpj(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 erro,sql,cnpj :string;
 qry :TFDQuery;
 arrayfilial :TJSONArray;
begin

  cnpj:= req.Params['cnpj'];


  try

    sql:=' SELECT  cd_filial, cnpj, nome FROM  FILIAIS WHERE CNPJ=' + cnpj + '  AND  EXPORTAR =''S''';
    dm.SqlFiliais.SQL.Clear;
    dm.SqlFiliais.Open(sql);

    if dm.SqlFiliais.RecordCount >0 then
       begin
        res.Send<TJSONArray>(dm.SqlFiliais.ToJSONArray()).Status(200);
       end
       else
       begin
        res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
       end;



  Except  on  E:Exception do

     begin

      res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Internal Server Error')).Status(500);

      GeraLog('Erro ao validar filial na matriz :CNPJ ['+cnpj+ ' ]' +E.Message);

     end;


  end;


end;

end.
