unit Controlle.clientes;

interface
uses Horse,System.Json,System.SysUtils,DataSet.Serialize,Data.DB,FireDac.Comp.Client,System.Classes,FireDAC.Stan.Param;

procedure registry;
procedure Listarclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Listarclientesfilial(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Postclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure deletarclientesfilial(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses Udm, Funcoes, UServerPrincipal, Vcl.Forms;
procedure registry;
begin

  THorse.Get('/clientes/:cd_filial/:id', Listarclientes);
  THorse.post('/clientes', Postclientes);
  THorse.delete('/clientes/:cd_filial/:id', deletarclientesfilial);

end;

procedure deletarclientesfilial(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cd_filial,id ,sql :string;
begin

end;

procedure Postclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 teste:string;
 JsonArrayCliente :TJSONArray;
 JsonValueCliente :TJSONValue;
 JsonObjetcCliente :TJSONObject;
 i ,C:integer;
begin
     c:=0;
   try

     try
       dm.FDMemTableClientes.LoadFromJSON(TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body),0) as TJSONArray);
       StrFilial:=FloatToStr(dm.FDMemTableClientes.FieldByName('CD_FILIAL').value);

       if dm.FDMemTableClientes.RecordCount>0 then
       begin
         dm.FDMemTableClientes.First;
         while not dm.FDMemTableClientes.Eof do
           begin
              dm.SqlAtualizaClientes.Params[0].value     := dm.FDMemTableClientes.FieldByName('CD_FILIAL').value;
              dm.SqlAtualizaClientes.Params[1].value     := dm.FDMemTableClientes.FieldByName('CD_CLIENTE').value;
              dm.SqlAtualizaClientes.Params[2].value     := dm.FDMemTableClientes.FieldByName('CD_VENDEDOR').value;
              dm.SqlAtualizaClientes.Params[3].value     := dm.FDMemTableClientes.FieldByName('CD_CONVENIO').value;
              dm.SqlAtualizaClientes.Params[4].AsString  := dm.FDMemTableClientes.FieldByName('NOME').AsString;
              dm.SqlAtualizaClientes.Params[5].AsString  := dm.FDMemTableClientes.FieldByName('ENDERECO').AsString;
              dm.SqlAtualizaClientes.Params[6].AsString  := dm.FDMemTableClientes.FieldByName('BAIRRO').AsString;
              dm.SqlAtualizaClientes.Params[7].AsString  := dm.FDMemTableClientes.FieldByName('CIDADE').AsString;
              dm.SqlAtualizaClientes.Params[8].AsString  := dm.FDMemTableClientes.FieldByName('UF').AsString;
              dm.SqlAtualizaClientes.Params[9].AsString  := dm.FDMemTableClientes.FieldByName('CEP').AsString;
              dm.SqlAtualizaClientes.Params[10].AsString := dm.FDMemTableClientes.FieldByName('CAIXA_POSTAL').AsString;
              dm.SqlAtualizaClientes.Params[11].AsString := dm.FDMemTableClientes.FieldByName('FONE').AsString;
              dm.SqlAtualizaClientes.Params[12].AsString := dm.FDMemTableClientes.FieldByName('FAX').AsString;
              dm.SqlAtualizaClientes.Params[13].AsString := dm.FDMemTableClientes.FieldByName('CONTATO').AsString;
              dm.SqlAtualizaClientes.Params[14].AsString := dm.FDMemTableClientes.FieldByName('CNPJ').AsString;
              dm.SqlAtualizaClientes.Params[15].AsString := dm.FDMemTableClientes.FieldByName('INSCRICAO').AsString;
              dm.SqlAtualizaClientes.Params[16].AsString := dm.FDMemTableClientes.FieldByName('PRACA').AsString;
              dm.SqlAtualizaClientes.Params[17].AsDate   := dm.FDMemTableClientes.FieldByName('DATA_FICHA').AsDateTime;
              dm.SqlAtualizaClientes.Params[18].AsString := dm.FDMemTableClientes.FieldByName('RG').AsString;
              dm.SqlAtualizaClientes.Params[19].AsString := dm.FDMemTableClientes.FieldByName('CPF').AsString;
              dm.SqlAtualizaClientes.Params[20].AsString := dm.FDMemTableClientes.FieldByName('TITULO_ELEITO').AsString;
              dm.SqlAtualizaClientes.Params[21].value    := dm.FDMemTableClientes.FieldByName('DT_NASCIMENTO').value;
              dm.SqlAtualizaClientes.Params[22].AsString := dm.FDMemTableClientes.FieldByName('SEXO').AsString;
              dm.SqlAtualizaClientes.Params[23].AsString := dm.FDMemTableClientes.FieldByName('ESTADO_CIVIL').AsString;
              dm.SqlAtualizaClientes.Params[24].AsString := dm.FDMemTableClientes.FieldByName('NATURALIDADE').AsString;
              dm.SqlAtualizaClientes.Params[25].AsString := dm.FDMemTableClientes.FieldByName('FILIACAO').AsString;
              dm.SqlAtualizaClientes.Params[26].value    := dm.FDMemTableClientes.FieldByName('NUMERO_DEPENDENTES').value;
              dm.SqlAtualizaClientes.Params[27].AsString := dm.FDMemTableClientes.FieldByName('CONJUGE').AsString;
              dm.SqlAtualizaClientes.Params[28].AsString := dm.FDMemTableClientes.FieldByName('DT_NASC_CONJUGE').AsString;
              dm.SqlAtualizaClientes.Params[29].AsString := dm.FDMemTableClientes.FieldByName('ALUGUEL').AsString;
              dm.SqlAtualizaClientes.Params[30].value    := dm.FDMemTableClientes.FieldByName('VL_ALUGUEL').value;
              dm.SqlAtualizaClientes.Params[31].AsString := dm.FDMemTableClientes.FieldByName('TEMPO_RESIDENCIA').AsString;
              dm.SqlAtualizaClientes.Params[32].AsString := dm.FDMemTableClientes.FieldByName('EMPRESA').AsString;
              dm.SqlAtualizaClientes.Params[33].AsString := dm.FDMemTableClientes.FieldByName('FONE_COMERCIAL').AsString;
              dm.SqlAtualizaClientes.Params[34].AsString := dm.FDMemTableClientes.FieldByName('DT_ADMISSAO').AsString;
              dm.SqlAtualizaClientes.Params[35].AsString := dm.FDMemTableClientes.FieldByName('CEP_COMERCIAL').AsString;
              dm.SqlAtualizaClientes.Params[36].AsString := dm.FDMemTableClientes.FieldByName('CIDADE_COMERCIAL').AsString;
              dm.SqlAtualizaClientes.Params[37].AsString := dm.FDMemTableClientes.FieldByName('UF_COMERCIAL').AsString;
              dm.SqlAtualizaClientes.Params[38].AsString := dm.FDMemTableClientes.FieldByName('FUNCAO').AsString;
              dm.SqlAtualizaClientes.Params[39].AsString := dm.FDMemTableClientes.FieldByName('EMPRESA_ANTERIOR').AsString;
              dm.SqlAtualizaClientes.Params[40].AsString := dm.FDMemTableClientes.FieldByName('TEMPO_SERVICO').AsString;
              dm.SqlAtualizaClientes.Params[41].AsString := dm.FDMemTableClientes.FieldByName('REFERENCIA_COMERCIAL').AsString;
              dm.SqlAtualizaClientes.Params[42].AsString := dm.FDMemTableClientes.FieldByName('REFERENCIA_BANCARIA').AsString;
              dm.SqlAtualizaClientes.Params[43].AsString := dm.FDMemTableClientes.FieldByName('CONSULTA_SPC').AsString;
              dm.SqlAtualizaClientes.Params[44].AsString := dm.FDMemTableClientes.FieldByName('OBSERVACAO_SPC').AsString;
              dm.SqlAtualizaClientes.Params[45].AsString := dm.FDMemTableClientes.FieldByName('OBSERVACAO_GERAL').AsString;
              dm.SqlAtualizaClientes.Params[46].AsString := dm.FDMemTableClientes.FieldByName('ENDERECO_COBRANCA').AsString;
              dm.SqlAtualizaClientes.Params[47].AsString := dm.FDMemTableClientes.FieldByName('BAIRRO_COBRANCA').AsString;
              dm.SqlAtualizaClientes.Params[48].AsString := dm.FDMemTableClientes.FieldByName('CIDADE_COBRANCA').AsString;
              dm.SqlAtualizaClientes.Params[49].AsString := dm.FDMemTableClientes.FieldByName('UF_COBRANCA').AsString;
              dm.SqlAtualizaClientes.Params[50].AsString := dm.FDMemTableClientes.FieldByName('CEP_COBRANCA').AsString;
              dm.SqlAtualizaClientes.Params[51].AsString := dm.FDMemTableClientes.FieldByName('ICMS_IPI').AsString;
              dm.SqlAtualizaClientes.Params[52].AsString := dm.FDMemTableClientes.FieldByName('NOME_MAE').AsString;
              dm.SqlAtualizaClientes.Params[53].value    := dm.FDMemTableClientes.FieldByName('MES_NASCIMENTO').value;
              dm.SqlAtualizaClientes.Params[54].value    := dm.FDMemTableClientes.FieldByName('RENDA').value;
              dm.SqlAtualizaClientes.Params[55].value    := dm.FDMemTableClientes.FieldByName('LIMITE_PERCENTUAL').value;
              dm.SqlAtualizaClientes.Params[56].value    := dm.FDMemTableClientes.FieldByName('LIMITE_CREDITO').value;
              dm.SqlAtualizaClientes.Params[57].AsString := dm.FDMemTableClientes.FieldByName('EMAIL').AsString;
              dm.SqlAtualizaClientes.Params[58].AsString := dm.FDMemTableClientes.FieldByName('HOMEPAGE').AsString;
              dm.SqlAtualizaClientes.Params[59].AsString := dm.FDMemTableClientes.FieldByName('MATRICULA').AsString;
              dm.SqlAtualizaClientes.Params[60].value    := dm.FDMemTableClientes.FieldByName('SALDO').value;
              dm.SqlAtualizaClientes.Params[61].value    := dm.FDMemTableClientes.FieldByName('DT_VENCIMENTO').value;
              dm.SqlAtualizaClientes.Params[62].value    := dm.FDMemTableClientes.FieldByName('DESCONTO').value;
              dm.SqlAtualizaClientes.Params[63].value    := dm.FDMemTableClientes.FieldByName('DT_ULTIMA_COMPRA').value;
              dm.SqlAtualizaClientes.Params[64].AsString := dm.FDMemTableClientes.FieldByName('STATUS').AsString;
              dm.SqlAtualizaClientes.Params[65].AsString := dm.FDMemTableClientes.FieldByName('REFERENCIA').AsString;
              dm.SqlAtualizaClientes.Params[66].value    := dm.FDMemTableClientes.FieldByName('DT_ALTERACAO').value;
              dm.SqlAtualizaClientes.Params[67].AsString := dm.FDMemTableClientes.FieldByName('COMPRAOUTRALOJA').AsString;
              dm.SqlAtualizaClientes.Params[68].AsString := dm.FDMemTableClientes.FieldByName('CARTAOFIDELIDADE').AsString;
              dm.SqlAtualizaClientes.Params[69].AsString := dm.FDMemTableClientes.FieldByName('ENVIADO').AsString;
              dm.SqlAtualizaClientes.Params[70].AsString := dm.FDMemTableClientes.FieldByName('NUMERO').AsString;
              dm.SqlAtualizaClientes.Params[71].AsString := dm.FDMemTableClientes.FieldByName('COMPLEMENTO').AsString;
              dm.SqlAtualizaClientes.Params[72].AsString := dm.FDMemTableClientes.FieldByName('CD_MUNICIPIO').AsString;
              dm.SqlAtualizaClientes.Params[73].AsString := dm.FDMemTableClientes.FieldByName('CD_PAIS').AsString;
              dm.SqlAtualizaClientes.Params[74].value    := dm.FDMemTableClientes.FieldByName('ID_PERFIL_CLIENTE').value;

            try

              dm.SqlAtualizaClientes.ExecSQL(false);
              inc(c);
              dm.FDMemTableClientes.Next;

            except on E:Exception do
                     begin
                     GeraLog('Erro na atualização de Clientes - ' + E.Message);
                      dm.FDMemTableClientes.Next;

                     end;

            end;

           end;

       end;


     except on E:Exception do
              begin

                GeraLog('Erro ao receber Cliente.'+e.Message);
                dm.FDMemTableClientes.Next;
                exit;

              end;

     end;

   finally
      dm.FDMemTableClientes.open;
      dm.FDMemTableClientes.Edit;
      dm.FDMemTableClientes.ClearFields;
      res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','ok')).Status(200);
      GravaLog(FormatDateTime('dd/mm/yyyy - hh:mm:ss', Now)+'- Recebendo Clientes - '+IntToStr(c));
      c:=0;
   end;

end;



procedure Listarclientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 sql,id,cd_filial:string;
begin
  cd_filial:=req.Params['cd_filial'];
  id       :=req.Params['id'];

  sql:=' SELECT * FROM CLIENTES where cd_cliente ='+id+' and cd_filial= '+ cd_filial;
  dm.sqlClientes.Open(sql);

 if dm.sqlClientes.RecordCount >0 then
   begin
    res.Send<TJSONArray>(dm.sqlClientes.ToJSONArray()).Status(200);
    end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;


end;

procedure Listarclientesfilial(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 sql,cd_filial :string;
begin
  cd_filial := req.Params['id'];
  cd_filial := req.Params['id'];
  sql:=' SELECT cd_filial,cd_cliente,nome,cidade,fone,uf FROM CLIENTES where cd_filial='+cd_filial;
  //dm.sqlClientes.SQL.Clear;
  dm.sqlClientes.Open(sql);

 if dm.sqlClientes.RecordCount >0 then
   begin
    res.Send<TJSONArray>(dm.sqlClientes.ToJSONArray()).Status(200);
    end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;


end;


end.
