unit Controlle.ClientQuick;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.WinXPanels, Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB,Forms,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, DBClient, Provider, FMTBcd,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.WinXCtrls,system.json,REST.Client,
  REST.Types, dxGDIPlusClasses, FireDAC.Stan.StorageXML,midaslib,
  JPeg,IdHTTP, Winapi.CommCtrl, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient,ShellAPI,Wininet,
  Horse,
  DataSet.Serialize,
  RESTRequest4D;

    Function  StrTran( cString, cProcura, cTroca : string ): string;
    function EnviarContasReceber : Boolean;
    function EnviarProdutosLotes : Boolean;
    function EnviarProdutosLotesST : Boolean;
    function BuscaMatrizProdutosIncluidos : Boolean;
    function EnviandoEstoque : Boolean;
    function EnviandoClientes: Boolean;
    function EnviandoPosicaoEstoque : Boolean;

    procedure EnvioLotes;
    procedure EnvioLotesAPrazo;
    procedure EnvioCaixa;
    procedure EnviandoOperadoresCaixa;
    procedure EnviandoCRM;
    procedure EnviandoEntregas;
    procedure EnviandoChequesRecebidos;
    procedure EnviandoItensTransfer;
    procedure EnviandoTransfer;
    procedure EnviandoTransfer1;
    procedure EnviandoCadernoFaltas;
    Procedure EnviandoPrecosFilial;
    procedure EnviandoConferenciaNota;
    procedure EnviandoContasPagar;
    procedure EnviandoContasPagarCompras;
    procedure EnviandoCompras;
    procedure EnviandoItensCompras;
    procedure EnviandoItensComprasLote;

     {  Sintegra  }
    procedure EnviandoSintegraNotas;
    procedure EnviandoSintegraNotasItens;
//    procedure EnviandoSintegraPedidos;
//    procedure EnviandoSintegraR60;
//    procedure EnviandoSintegraR60I;
//
//
//    procedure EnviandoVendasItensExcluidos;
//
//    procedure RecebendoItensTransfer;
//    procedure RecebendoTransfer;
//    procedure RecebendoProdutosQuantidade;
//    procedure RecebendoProdutosFP;
//    procedure RecebendoProdutosFidelidade;
//    function  RecebendoCadastro : Boolean;
//    function  RecebendoEstoques : Boolean;
//    Function  RecebendoPrecos : Boolean;
//    procedure RecebendoProdutosDeletados;
//    procedure RecebendoProdutosFidelidadeDeletados;
//    procedure RecebendoProdutosQuantidadeDeletados;





    procedure ConsistenciaDados;
    procedure MontaSQL_Precos(Filial : String);
    procedure CriaCamposPrecos(sFilial : String);


var
  ExecutaConferencia : Boolean;

  Id_Produto, Cd_Produto, CodigoBarras, CodigoBarras2, Descricao, Cd_Laboratorio,
  Cd_Grupo, TipoProduto, Identificador, Qt_Embalagem, Comissao,
  CustoUnitario, Preco_Venda, Preco_Promocao, Icms, Margem, Margem_Promocao,
  Dt_Cadastro, Curva, Cd_Classe, EntraPE, TxDesconto, Unidade, Balanca,
  Cd_Principio, Cd_Lista, UsoContinuo, Pis_Cofins, NCM, Cd_GrupoBalanco, Cd_GrupoCompra,
  Id_Familia, Cd_SubGrupo, CEST, CD_CFOP, SituacaoTributaria, Origem, CSOSN,
  IAT, IPPT, ComprimidosCaixa, Controlado, Generico, Dt_Vencimento_Promocao,
  Observacao , Status: String;

  NLancamentos, NCaixa, NTransfer, NItensTransfer, NContasReceber : Integer;
  NLancamentosLoja, NCaixaLoja, NTransferLoja, NItensTransferLoja, NContasReceberLoja : Integer;





const
  EstoqueFiliais : array[1..30] of string =
  ('ESTOQUE_1','ESTOQUE_2','ESTOQUE_3','ESTOQUE_4','ESTOQUE_5',
   'ESTOQUE_6','ESTOQUE_7','ESTOQUE_8','ESTOQUE_9','ESTOQUE_10',
   'ESTOQUE_11','ESTOQUE_12', 'ESTOQUE_13', 'ESTOQUE_14', 'ESTOQUE_15',
   'ESTOQUE_16','ESTOQUE_17', 'ESTOQUE_18', 'ESTOQUE_19', 'ESTOQUE_20',
   'ESTOQUE_21', 'ESTOQUE_22', 'ESTOQUE_23', 'ESTOQUE_24', 'ESTOQUE_25',
   'ESTOQUE_26', 'ESTOQUE_27', 'ESTOQUE_28', 'ESTOQUE_29', 'ESTOQUE_30');


implementation

uses UExporterClient, Udm, Funcoes, Controlle.Filial, Winapi.ActiveX;

function EnviandoClientes: Boolean;
var
 Sql: String;
LResponse: IResponse;
arrayclientes :TJSONArray;
begin
  //envia para a matriz os dados de Clientes

  try
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
             FrmPrincipal.Memo1.Clear;
             FrmPrincipal.memo1.Text:='200';

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
              on E:Exception do
                begin
                 Result := False;
                end;

         end;
      end
     else
      begin
        Result := False;
      end;

  finally

  end;



end;

function  EnviarContasReceber : Boolean;
var
Sql: String;
LResponse: IResponse;
arrayconstasreceber :TJSONArray;
begin
  //processamento e envio de contas receber
  Try

        //Result := True;

        Sql := 'SELECT CONTAS_RECEBER.* FROM CONTAS_RECEBER, TEMP_PRODUTOS2 WHERE TEMP_PRODUTOS2.PROCESSO = 3 AND CONTAS_RECEBER.CD_CONTAS_RECEBER = TEMP_PRODUTOS2.ID_PRODUTO';

         dm.Query.SQL.Clear;
         dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 3');
         dm.Query.ExecSQL(false);

         dm.Query.SQL.Clear;
         dm.Query.SQL.Add('INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE PROCESSO = 3');
         dm.Query.ExecSQL(false);

         dm.Query.SQL.Clear;
         dm.Query.Open(sql);

         TDataSetSerializeConfig.GetInstance.Export.FormatDate :='DD/MM/YYYY';

        if dm.Query.RecordCount <> 0 then
         begin
            GravaLog(TimetoStr(Time) + ' - Enviando Contas a Receber: ' + FloatToStr(dm.Query.RecordCount));

            arrayconstasreceber :=TJSONArray.Create;
            arrayconstasreceber := dm.Query.ToJSONArray();

               //Memo1.Text:= arrayclientes.ToString;
              // Memo1.lines.SaveToFile(ExtractFilePath(Application.ExeName)+ 'testejson.txt');

           LResponse := TRequest.New.BaseURL(dm.BaseUrl )
            .Resource('contasreceber')
              .AddBody(arrayconstasreceber.ToString)
                .Accept('application/json')
                 .Post;
                    FreeAndNil(arrayconstasreceber);


            try

              if LResponse.StatusCode = 200 then
                 begin
                   GeraLog(TimetoStr(Time) + ' - total: '+FloatToStr(dm.Query.RecordCount) + ' - de Contas receber enviado.' );
                   Result:=true;

                   dm.Query.SQL.Clear;
                   dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 3 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 3)');
                   dm.Query.ExecSQL(false);

                   dm.Query.SQL.Clear;
                   dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 3');
                   dm.Query.ExecSQL(false);

                 end
                 else
                 begin
                   Result := false;
                   exit;
                 end;

             Except
              on E:Exception do
                 begin
                    GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Contas a Receber - ' +LResponse.Content );
                   dm.Query.SQL.Clear;
                   dm.Query.SQL.Add('ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE');
                   dm.Query.ExecSQL(false);

                   Result := False;
                 end;

             end;

         end
        else
         begin
           Result := False;
           GravaLog(TimetoStr(Time) + ' - Não foi encontrado Contas a Receber para envio. ' );
         end;

  Finally

    dm.Query.SQL.Clear;
    dm.Query.SQL.Add('ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE');
    dm.Query.ExecSQL(false);

    dm.Query.SQL.Clear;
    dm.Query.Open(sql);

  End;

end;

function EnviarProdutosLotes : Boolean;
var
  Sql: String;
  LResponse: IResponse;
  arrayprodutoslotes :TJSONArray;

begin

    //processamento e envio de Produtos Lotes
  Try

    Result := True;

    Sql := 'SELECT PRODUTOS_LOTES.* FROM PRODUTOS_LOTES, TEMP_PRODUTOS_LOTES2 WHERE TEMP_PRODUTOS_LOTES2.PROCESSO = 66 AND PRODUTOS_LOTES.ID_PRODUTO = TEMP_PRODUTOS_LOTES2.ID_PRODUTO AND PRODUTOS_LOTES.LOTE = TEMP_PRODUTOS_LOTES2.LOTE';

    dm.Query.SQL.Clear;
    dm.Query.SQL.Add('INSERT INTO TEMP_PRODUTOS_LOTES2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS_LOTES WHERE PROCESSO = 66');
    dm.Query.ExecSQL(false);

    dm.Query.SQL.Clear;
    dm.Query.Open(Sql);

   if dm.Query.RecordCount <> 0 then
     begin
        GravaLog(TimetoStr(Time) + ' - Enviando Produtos Lotes: ' + FloatToStr(dm.Query.RecordCount));

      arrayprodutoslotes :=TJSONArray.Create;
      arrayprodutoslotes := dm.Query.ToJSONArray();

       //Memo1.Text:= arrayclientes.ToString;
      // Memo1.lines.SaveToFile(ExtractFilePath(Application.ExeName)+ 'testejson.txt');

       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
        .Resource('clientes')
          .AddBody(arrayprodutoslotes.ToString)
            .Accept('application/json')
             .Post;
                FreeAndNil(arrayprodutoslotes);

          try

             if LResponse.StatusCode = 200 then
               begin

                  dm.Query.SQL.Clear;
                  dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS_LOTES WHERE PROCESSO = 66 AND ID_PRODUTO||LOTE IN (SELECT ID_PRODUTO||LOTE FROM TEMP_PRODUTOS_LOTES2 WHERE PROCESSO = 66)');
                  dm.Query.ExecSQL(false);

                  dm.Query.SQL.Clear;
                  dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS_LOTES2 WHERE PROCESSO = 66');
                  dm.Query.ExecSQL(false);
               end
               else
               begin
                 Result := False;
               end;

          except on E:exception do
                  begin

                    GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Produtos Lotes - ' + E.Message +' - '+LResponse.Content);

                    dm.Query.SQL.Clear;
                    dm.Query.SQL.Add('ALTER TRIGGER PRODUTOS_LOTES_BIU0 ACTIVE');
                    dm.Query.ExecSQL(false);
                    Result := False;
                    Exit;
                  end;

          end;

     end
    else
     begin
       Result := False;
     end;

  Finally

     dm.Query.SQL.Clear;
     dm.Query.SQL.Add('ALTER TRIGGER PRODUTOS_LOTES_BIU0 ACTIVE');
     dm.Query.ExecSQL(false);
  End;


end;

function  EnviarProdutosLotesST : Boolean;
var
  Sql: String;
  LResponse: IResponse;
  arrayprodutoslotesSt :TJSONArray;

begin
   //processamento e envio de Produtos Lotes ST
  Try

      Result := True;

      Sql := 'SELECT PRODUTOS_LOTES_ST.* FROM PRODUTOS_LOTES_ST, TEMP_PRODUTOS_LOTES_ST2 ' +
             'WHERE TEMP_PRODUTOS_LOTES_ST2.PROCESSO = 70 AND ' +
             ' PRODUTOS_LOTES_ST.ID_PRODUTO = TEMP_PRODUTOS_LOTES_ST2.ID_PRODUTO AND ' +
             ' PRODUTOS_LOTES_ST.CD_FILIAL = TEMP_PRODUTOS_LOTES_ST2.CD_FILIAL AND ' +
             ' PRODUTOS_LOTES_ST.DATA = TEMP_PRODUTOS_LOTES_ST2.DATA AND ' +
             ' PRODUTOS_LOTES_ST.CD_DISTRIBUIDOR = TEMP_PRODUTOS_LOTES_ST2.CD_DISTRIBUIDOR AND ' +
             ' PRODUTOS_LOTES_ST.NOTA_FISCAL = TEMP_PRODUTOS_LOTES_ST2.NOTA_FISCAL AND ' +
             ' PRODUTOS_LOTES_ST.SERIE = TEMP_PRODUTOS_LOTES_ST2.SERIE AND ' +
             ' PRODUTOS_LOTES_ST.LOTE = TEMP_PRODUTOS_LOTES_ST2.LOTE';

       dm.Query.SQL.Clear;
       dm.Query.SQL.Add('INSERT INTO TEMP_PRODUTOS_LOTES_ST2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS_LOTES_ST WHERE PROCESSO = 70');
       dm.Query.ExecSQL(false);

       dm.Query.SQL.Clear;
       dm.Query.Open(sql);

      if dm.Query.RecordCount <> 0 then
       begin

          try

            GravaLog(TimetoStr(Time) + ' - Enviando Produtos Lotes ST: ' + FloatToStr(dm.Query.RecordCount));

            arrayprodutoslotesst :=TJSONArray.Create;
            arrayprodutoslotesst := dm.Query.ToJSONArray();

             //Memo1.Text:= arrayclientes.ToString;
            // Memo1.lines.SaveToFile(ExtractFilePath(Application.ExeName)+ 'testejson.txt');

             LResponse := TRequest.New.BaseURL(dm.BaseUrl )
              .Resource('clientes')
                .AddBody(arrayprodutoslotesst.ToString)
                  .Accept('application/json')
                   .Post;
                      FreeAndNil(arrayprodutoslotesst);


             if LResponse.StatusCode=200 then
             begin

               dm.Query.SQL.Clear;
               dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS_LOTES_ST ' +
                                'WHERE PROCESSO = 70 AND ID_PRODUTO||CD_FILIAL||DATA||CD_DISTRIBUIDOR||NOTA_FISCAL||SERIE||LOTE IN ' +
                                '(SELECT ID_PRODUTO||CD_FILIAL||DATA||CD_DISTRIBUIDOR||NOTA_FISCAL||SERIE||LOTE FROM TEMP_PRODUTOS_LOTES_ST2 WHERE PROCESSO = 70)');
               dm.Query.ExecSQL(false);

               dm.Query.SQL.Clear;
               dm.Query.SQL.Add('DELETE FROM TEMP_PRODUTOS_LOTES_ST2 WHERE PROCESSO = 70');
               dm.Query.ExecSQL(false);

             end
             else
             begin
               Result:=False;
               exit
             end;


          except on E:Exception do
                  begin
                    GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Produtos Lotes ST - ' + E.Message);

                   dm.Query.SQL.Clear;
                   dm.Query.SQL.Add('ALTER TRIGGER PRODUTOS_LOTES_ST_BIU0 ACTIVE');
                   dm.Query.ExecSQL(false);
                   Result := False;
                    Exit;
                  end;
            end;
       end
      else
      begin
        Result := False;
      end;

  Finally

     dm.Query.SQL.Clear;
     dm.Query.SQL.Add('ALTER TRIGGER PRODUTOS_LOTES_ST_BIU0 ACTIVE');
     dm.Query.ExecSQL(false);

  End;

end;

procedure EnvioLotes;
var
  Sql: String;
  LResponse: IResponse;
  arrayLotes :TJSONArray;
begin
   //processamento e envio de lotes

  Try

    Sql :=dm.FDCeLotes.SQL.Text;

    if ExecutaConferencia then
      begin
        GravaLog(TimetoStr(Time) + ' - Iniciando processo de Conferência de Lancamentos.');

         try

         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
        .Resource('lancamentos/cd_filial')
          .AddBody(arrayLotes.ToString)
            .Accept('application/json')
             .Get;
                FreeAndNil(arrayLotes);

                  //   processa 1000 na matriz  //Conferencia dos lancamentos

            if LResponse.StatusCode=200 then
            begin
            //   NLancamentos := //receber o retorno do get da matriz

               dm.cdsNumeroLancamentosLoja.close;
               dm.cdsNumeroLancamentosLoja.open;


               NLancamentosLoja := dm.cdsNumeroLancamentosLojaCOUNT.AsInteger;

               GravaLog(TimetoStr(Time) + ' - Lancamentos Loja : ' + InttoStr(NLancamentosLoja) + ' - Lancamentos Matriz : ' + InttoStr(NLancamentos));

               if NLancamentosLoja <> NLancamentos then
                begin
                  dm.CdsCdLancamento.Close;
                  Dm.CdsCdLancamento.CreateDataSet;
                 // Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1002, Filial, 'A');
                //  recebe os codigos de lancamentos da matriz
                    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
                    .Resource('lancamentos/cd_filial')
                      .AddBody(arrayLotes.ToString)
                        .Accept('application/json')
                         .Get;
                            FreeAndNil(arrayLotes);

                  if LResponse.StatusCode=200 then
                   begin
//                      Dm.CdsCdLancamento.Data := ///retornro do get feito na matriz Dados;
                      Dm.CdsCdLancamento.Open; // virtual
                      Dm.CdsCdLancamento.IndexFieldNames := 'CD_LANCAMENTO';
                      Dm.CdsCdLancamento.First;

                      GravaLog(TimetoStr(Time) + ' - Retornou ' + InttoStr(Dm.CdsCdLancamento.RecordCount) + ' CD_LANCAMENTO da Matriz.');

                      Dm.cdsLancamentosLoja.Close;
                      Dm.cdsLancamentosLoja.Open;
                      Dm.cdsLancamentosLoja.IndexFieldNames := 'CD_LANCAMENTO';
                      Dm.cdsLancamentosLoja.First;

                      GravaLog(TimetoStr(Time) + ' - INSERT em TEMP_LANCAMENTOS.');

                      while not Dm.cdsLancamentosLoja.Eof do
                       begin
                         if not Dm.CdsCdLancamento.FindKey([Dm.cdsLancamentosLojaCD_LANCAMENTO.AsFloat]) then
                          begin
                            dm.FDCeLotes.SQL.Text := 'INSERT INTO TEMP_LANCAMENTOS VALUES (' + Dm.cdsLancamentosLojaCD_LANCAMENTO.AsString + ')';
                            dm.FDCeLotes.ExecSQL(True);
                           end;
                          Dm.cdsLancamentosLoja.Next;
                       end;
                   end
                  else
                   begin
                     GravaLog(TimetoStr(Time) + ' - Não retornou CD_LANCAMENTO da Matriz.');
                   end;
                end;
            end;

         Except  on E:Exception do
            begin
              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Lancamentos - '+E.Message);

              dm.cdsNumeroLancamentosLoja.Close;
              Dm.CdsCdLancamento.Close;
              Dm.CdsCeLotes.Close;

              dm.FDCeLotes.SQL.clear;
              dm.FDCeLotes.SQL.Text := 'DELETE FROM TEMP_LANCAMENTOS2';
              dm.FDCeLotes.ExecSQL(True);
              Exit;
            end;

        end;
      end;
      Dm.CdsNumeroLancamentosLoja.Close;
      Dm.CdsCdLancamento.Close;


       repeat
         dm.FDCeLotes.SQL.clear;
         dm.FDCeLotes.SQL.Text := 'INSERT INTO TEMP_LANCAMENTOS2 SELECT FIRST 1000 CD_LANCAMENTO FROM TEMP_LANCAMENTOS';
         dm.FDCeLotes.ExecSQL(True);

         dm.FDCeLotes.SQL.Clear;
         dm.FDCeLotes.Open(Sql);

         Dm.CdsCeLotes.FetchParams;
         Dm.CdsCeLotes.Open;

         if Dm.CdsCeLotes.RecordCount <> 0 then
          begin
           GravaLog(TimetoStr(Time) + ' - Enviando Lancamentos: ' + FloatToStr(Dm.CdsCeLotes.RecordCount));
           //DmExporterQuick.CdsCeLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'DmExporterQuick.CdsLotes.xml', dfXML);

             try

                LResponse := TRequest.New.BaseURL(dm.BaseUrl )
                .Resource('cdsCelotes')
                  .AddBody(arrayLotes.ToString)
                    .Accept('application/json')
                     .Get;
                    FreeAndNil(arrayLotes);

               //if (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1, Filial, DmExporterQuick.CdsCeLotes.Data) then
                if LResponse.StatusCode=200 then
                 begin
                   dm.FDCeLotes.SQL.clear;
                   dm.FDCeLotes.SQL.Text := 'DELETE FROM TEMP_LANCAMENTOS WHERE CD_LANCAMENTO IN (SELECT CD_LANCAMENTO FROM TEMP_LANCAMENTOS2)';
                   dm.FDCeLotes.ExecSQL(True);

                   dm.FDCeLotes.SQL.Clear;
                   dm.FDCeLotes.SQL.Text := 'DELETE FROM TEMP_LANCAMENTOS2';
                   dm.FDCeLotes.ExecSQL(True);
                 end;

             except on E:Exception do
                     begin
                         GravaLog(TimetoStr(Time) + ' - Erro no Enviando Lancamentos - '+ LResponse.Content);
                         exit;
                     end;

             end;

           end;

        until Dm.CdsCeLotes.RecordCount = 0;


  Finally
    Dm.CdsCeLotes.Close;
  End;

end;

procedure ConsistenciaDados;
var
 Classes, Grupos, Laboratorios, Distribuidores,
 Familias, GruposBalanco, GruposCompras, Cartoes,
 Lancamentos, Caixas, ContasReceber : Real;
 LResponse: IResponse;
arrayConsistenciaDados :TJSONArray;
begin

    //determino somatorios de itens, unidades, precos e custos para consistencia na matriz...
    GravaLog(TimetoStr(Time) + ' - Consistencia de Dados - Inicio ');
    Dm.CdsControlador.Close;
    Dm.FDControlador.sql.Text :=  'SELECT COUNT(ID_PRODUTO) AS N_ITENS, ' +
                                  'SUM(ESTOQUE_' + DM.cdfilialparametro + ') AS N_UNIDADES, ' +
                                  'SUM(CAST(CAST(CUSTO_UNITARIO_' + DM.cdfilialparametro + ' AS NUMERIC(10,2)) AS DOUBLE PRECISION)) AS T_CUSTO, ' +
                                  'SUM(CAST(CAST(PRECO_VENDA AS NUMERIC(10,2)) AS DOUBLE PRECISION)) AS T_VENDA, ' +
                                  'SUM(CAST(CAST(PRECO_PROMOCAO AS NUMERIC(10,2)) AS DOUBLE PRECISION)) AS T_PROMOCAO, ' +
                                  'SUM(PRECO_VENDA) AS CLASSES, ' +
                                  'SUM(PRECO_VENDA) AS GRUPOS, ' +
                                  'SUM(PRECO_VENDA) AS LABORATORIOS, ' +
                                  'SUM(PRECO_VENDA) AS DISTRIBUIDORES, ' +
                                  'SUM(PRECO_VENDA) AS FAMILIAS, ' +
                                  'SUM(PRECO_VENDA) AS GRUPOSBALANCO, ' +
                                  'SUM(PRECO_VENDA) AS GRUPOSCOMPRAS, ' +
                                  'SUM(PRECO_VENDA) AS CARTOES, ' +
                                  'SUM(PRECO_VENDA) AS LANCAMENTOS, ' +
                                  'SUM(PRECO_VENDA) AS CAIXAS, ' +
                                  'SUM(PRECO_VENDA) AS CONTASRECEBER ' +
                                  'FROM PRODUTOS';

    Dm.CdsControlador.Open;

    Dm.Cdssql1.Close;
    Dm.fdSql1.sql.Text := 'SELECT COUNT(*) AS CLASSE FROM CLASSES';
    Dm.Cdssql1.Open;
    Classes := Dm.cdsSql1.FieldByName('CLASSE').AsFloat;

    Dm.Cdssql1.Close;
    Dm.fdSql1.sql.Text := 'SELECT COUNT(*) AS GRUPO FROM GRUPOS';
    Dm.Cdssql1.Open;
    Grupos := Dm.Cdssql1.FieldByName('GRUPO').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.text := 'SELECT COUNT(*) AS LABORATORIO FROM LABORATORIOS';
    dm.Cdssql1.Open;
    Laboratorios := Dm.Cdssql1.FieldByName('LABORATORIO').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(*) AS DISTRIBUIDOR FROM DISTRIBUIDORES';
    dm.Cdssql1.Open;
    Distribuidores := Dm.Cdssql1.FieldByName('DISTRIBUIDOR').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(*) AS FAMILIA FROM FAMILIAS';
    dm.Cdssql1.Open;
    Familias := Dm.Cdssql1.FieldByName('FAMILIA').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(*) AS GRUPOSBALANCO FROM GRUPOSBALANCO';
    dm.Cdssql1.Open;
    GruposBalanco := Dm.Cdssql1.FieldByName('GRUPOSBALANCO').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(*) AS GRUPOSCOMPRAS FROM GRUPOSCOMPRAS';
    dm.Cdssql1.Open;
    GruposCompras := Dm.Cdssql1.FieldByName('GRUPOSCOMPRAS').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(*) AS CARTOES FROM CARTOES';
    dm.Cdssql1.Open;
    Cartoes := Dm.Cdssql1.FieldByName('CARTOES').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(DISTINCT CD_LANCAMENTO) AS LANCAMENTOS FROM LANCAMENTOS WHERE CD_FILIAL = ' + Dm.CdsParametrosCD_FILIAL.AsString + ' AND DATA_LANCAMENTO >= CURRENT_DATE - 30';
    dm.Cdssql1.Open;
    Lancamentos := Dm.Cdssql1.FieldByName('LANCAMENTOS').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(DISTINCT CD_CAIXA) AS CAIXAS FROM CAIXA WHERE CD_FILIAL = ' + Dm.CdsParametrosCD_FILIAL.AsString + ' AND DATA_CAIXA >= CURRENT_DATE - 30';
    dm.Cdssql1.Open;
    Caixas := Dm.Cdssql1.FieldByName('CAIXAS').AsFloat;

    dm.Cdssql1.Close;
    dm.fdSql1.sql.Text := 'SELECT COUNT(DISTINCT CD_CONTAS_RECEBER) AS CONTASRECEBER FROM CONTAS_RECEBER WHERE CD_FILIAL = ' + Dm.CdsParametrosCD_FILIAL.AsString + ' AND DT_LANCAMENTO >= CURRENT_DATE - 30';
    dm.Cdssql1.Open;
    ContasReceber := Dm.Cdssql1.FieldByName('CONTASRECEBER').AsFloat;

    dm.Cdssql1.Close;

    dm.CdsControlador.Edit;
    dm.CdsControladorCLASSES.AsFloat       := Classes;
    dm.CdsControladorGRUPOS.AsFloat        := Grupos;
    dm.CdsControladorLABORATORIOS.AsFloat  := Laboratorios;
    dm.CdsControladorDISTRIBUIDORES.AsFloat:= Distribuidores;
    dm.CdsControladorFAMILIAS.AsFloat      := Familias;
    dm.CdsControladorGRUPOSBALANCO.AsFloat := GruposBalanco;
    dm.CdsControladorGRUPOSCOMPRAS.AsFloat := GruposCompras;
    dm.CdsControladorCARTOES.AsFloat       := Cartoes;
    dm.CdsControladorLANCAMENTOS.AsFloat   := Lancamentos;
    dm.CdsControladorCAIXAS.AsFloat        := Caixas;
    dm.CdsControladorCONTASRECEBER.AsFloat := ContasReceber;
    dm.CdsControlador.Post;

     try

      LResponse := TRequest.New.BaseURL(dm.BaseUrl )
      .Resource('cdsCelotes')
        .AddBody(arrayConsistenciaDados.ToString)
          .Accept('application/json')
           .post;
          FreeAndNil(arrayConsistenciaDados);

       //  (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(0, Filial, DmExporterQuick.CdsControlador.Data);
        if LResponse.StatusCode=200 then
        begin
          Dm.CdsControlador.Close;
          GravaLog(TimetoStr(Time) + ' - Consistencia de Dados - Final do Processo ');
        end;



     except on E:Exception do
        begin

      GravaLog(TimetoStr(Time) + ' - Não foi possível fazer a consistencia de dados. 2');
      Dm.CdsControlador.Close;
        end;

     end;


end;

procedure EnvioLotesAPrazo;
var
 sql:string;
 LResponse: IResponse;
arrayLotesAprazo :TJSONArray;

begin

  Try

     Dm.CdsNumeroLancamentosLoja.Close;
     Dm.CdsCdLancamento.Close;

     Sql := 'SELECT LANCAMENTOS_APRAZO.ID_PRODUTO, LANCAMENTOS_APRAZO.CD_FILIAL, LANCAMENTOS_APRAZO.CD_PRODUTO, LANCAMENTOS_APRAZO.DESCRICAO, ' +
            'LANCAMENTOS_APRAZO.CD_LABORATORIO, LANCAMENTOS_APRAZO.CD_GRUPO, LANCAMENTOS_APRAZO.CD_CONVENIO, LANCAMENTOS_APRAZO.CD_CLIENTE, ' +
            'LANCAMENTOS_APRAZO.CD_VENDEDOR, LANCAMENTOS_APRAZO.CD_OPERADOR, LANCAMENTOS_APRAZO.CD_USUARIO, LANCAMENTOS_APRAZO.CD_FORMA_PAGAMENTO, ' +
            'LANCAMENTOS_APRAZO.CD_VENDA, CAST(LANCAMENTOS_APRAZO.CUSTO_MEDIO AS NUMERIC(10,2)) AS CUSTO_MEDIO, CAST(LANCAMENTOS_APRAZO.CUSTO_UNITARIO AS NUMERIC(10,2)) AS CUSTO_UNITARIO, ' +
            'LANCAMENTOS_APRAZO.DATA_LANCAMENTO, LANCAMENTOS_APRAZO.DATA_CAIXA, LANCAMENTOS_APRAZO.QUANTIDADE, CAST(LANCAMENTOS_APRAZO.VALOR AS NUMERIC(10,2)) AS VALOR, ' +
            'LANCAMENTOS_APRAZO.NOTA_FISCAL, CAST(LANCAMENTOS_APRAZO.DESCONTO AS NUMERIC(10,2)) AS DESCONTO, CAST(LANCAMENTOS_APRAZO.PROMOCAO AS NUMERIC(10,2)) AS PROMOCAO, ' +
            'LANCAMENTOS_APRAZO.TIPO_VENDA, LANCAMENTOS_APRAZO.TIPO_PAGAMENTO, LANCAMENTOS_APRAZO.ENTRADA_SAIDA, LANCAMENTOS_APRAZO.ETIQUETA, ' +
            'LANCAMENTOS_APRAZO.ENTREGA, LANCAMENTOS_APRAZO.HORA, LANCAMENTOS_APRAZO.ESTOQUE_POSVENDA, LANCAMENTOS_APRAZO.TROCA, LANCAMENTOS_APRAZO.ENVIADO, ' +
            'LANCAMENTOS_APRAZO.NUMERO, LANCAMENTOS_APRAZO.TERMINAL, LANCAMENTOS_APRAZO.USUARIO, LANCAMENTOS_APRAZO.CD_LANCAMENTO, ' +
            'CAST(LANCAMENTOS_APRAZO.COMISSAO AS NUMERIC(10,2)) AS COMISSAO, CAST(LANCAMENTOS_APRAZO.ARREDONDAMENTO AS NUMERIC(10,2)) AS ARREDONDAMENTO, ' +
            'LANCAMENTOS_APRAZO.CD_CLASSE, LANCAMENTOS_APRAZO.ID_OPERADORCAIXA, LANCAMENTOS_APRAZO.OBSERVACAO, LANCAMENTOS_APRAZO.TRN, LANCAMENTOS_APRAZO.TRANSACAOTRN, ' +
            'LANCAMENTOS_APRAZO.LOTETRN, LANCAMENTOS_APRAZO.AUTORIZACAOTRN, LANCAMENTOS_APRAZO.SUBSIDIOTRN, LANCAMENTOS_APRAZO.NOTAMANUAL ' +
            'FROM LANCAMENTOS_APRAZO, TEMP_LANCAMENTOS_APRAZO2 ' +
            'WHERE LANCAMENTOS_APRAZO.CD_FILIAL = :CD_FILIAL AND LANCAMENTOS_APRAZO.CD_LANCAMENTO = TEMP_LANCAMENTOS_APRAZO2.CD_LANCAMENTO';

     repeat
       Dm.CdsCeLotes2.Close;
       Dm.FDceLotes2.SQL.Text:= 'INSERT INTO TEMP_LANCAMENTOS_APRAZO2 SELECT FIRST 1000 * FROM TEMP_LANCAMENTOS_APRAZO';
       Dm.FDceLotes2.ExecSQL(True);

       Dm.FDceLotes2.Open(Sql);
       Dm.FDceLotes2.Params[0].DataType := ftFloat;
       Dm.CdsCeLotes2.FetchParams;
       Dm.CdsCeLotes2.Params[0].AsFloat :=StrToFloat(dm.cdfilialparametro);
       Dm.CdsCeLotes2.Open;

       if Dm.CdsCeLotes2.RecordCount <> 0 then
        begin

         GravaLog(TimetoStr(Time) + ' - Enviando Lancamentos a Prazo: ' + FloatToStr(Dm.CdsCeLotes2.RecordCount));

//             if (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(16, Filial, DmExporterQuick.CdsCeLotes2.Data) then

           try

            LResponse := TRequest.New.BaseURL(dm.BaseUrl )
            .Resource('cdsCelotes')
              .AddBody(arrayLotesAprazo.ToString)
                .Accept('application/json')
                 .post;
                FreeAndNil(arrayLotesAprazo);
            if LResponse.StatusCode=200 then
             begin
               Dm.FDceLotes2.Close;
               Dm.FDceLotes2.SQL.Text := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO WHERE CD_LANCAMENTO IN (SELECT CD_LANCAMENTO FROM TEMP_LANCAMENTOS_APRAZO2)';
               Dm.FDceLotes2.ExecSQL(True);

               Dm.FDceLotes2.SQL.Text := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO2';
               Dm.FDceLotes2.ExecSQL(True);
             end;
           except on E:Exception do
                begin

                    GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Lancamentos a Prazo - '+E.Message);

                    Dm.CdsNumeroLancamentosLoja.Close;
                    Dm.CdsCdLancamento.Close;
                    Dm.CdsCeLotes2.Close;

                    Dm.FDceLotes2.Close;
                    Dm.FDceLotes2.sql.Text := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO2';
                    Dm.FDceLotes2.ExecSQL(True);
                end;
           end;

        end;

     until Dm.CdsCeLotes2.RecordCount = 0;


  Finally
    Dm.CdsCeLotes2.Close;
  End;
end;

procedure EnvioCaixa;
var
sql :string;
LResponse: IResponse;
arraycaixa,arrayfilial :TJSONArray;
begin
  //processamento e envio de Cecaixa
  Try
      Try
        Sql := 'SELECT CAIXA.* FROM CAIXA, TEMP_CAIXA2 WHERE CAIXA.CD_CAIXA = TEMP_CAIXA2.CD_CAIXA';

        if ExecutaConferencia then
          begin
            GravaLog(TimetoStr(Time) + ' - Iniciando processo de Conferência de Caixa.');

           // Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1001, Filial, 'A');

           LResponse := TRequest.New.BaseURL(dm.BaseUrl )
            .Resource('filial/1001')
              .AddBody(arrayfilial.ToString)
                .Accept('application/json')
                 .get;
                FreeAndNil(arrayfilial);

            if LResponse.StatusCode=200 then
             begin
              //  NCaixa := retorno do get

                Dm.CdsNumeroCaixaLoja.Close;
                Dm.CdsNumeroCaixaLoja.Open;
                NCaixaLoja := Dm.CdsNumeroCaixaLojaCOUNT.AsInteger;

                GravaLog(TimetoStr(Time) + ' - Caixas da Loja = ' + InttoStr(NCaixaLoja) + ' - Caixas da Matriz : ' + InttoStr(NCaixa) + '.');

                if NCaixaLoja <> NCaixa then
                 begin
                   Dm.CdsCdCaixa.Close;
                   Dm.CdsCdCaixa.CreateDataSet;

                   //Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1003, Filial, 'A');
                   LResponse := TRequest.New.BaseURL(dm.BaseUrl )
                    .Resource('processa/1001')
                      .AddBody(arraycaixa.ToString)
                        .Accept('application/json')
                         .get;
                        FreeAndNil(arraycaixa);

                  if LResponse.StatusCode=200 then
                    begin
                       //Dm.CdsCdCaixa.Data := Dados;  verificar aqui o retorno
                       Dm.CdsCdCaixa.Open; // virtual
                       Dm.CdsCdCaixa.IndexFieldNames := 'CD_CAIXA';
                       Dm.CdsCdCaixa.First;

                       Dm.CdsCaixaLoja.Close;
                       Dm.CdsCaixaLoja.Open;
                       Dm.CdsCaixaLoja.IndexFieldNames := 'CD_CAIXA';
                       Dm.CdsCaixaLoja.First;

                       GravaLog(TimetoStr(Time) + ' - INSERT em TEMP_CAIXA.');

                       while not Dm.CdsCaixaLoja.Eof do
                        begin
                          if not Dm.CdsCdCaixa.FindKey([Dm.CdsCaixaLojaCD_CAIXA.AsFloat]) then
                           begin

                             Dm.FDCaixaLoja.sql.Text := 'INSERT INTO TEMP_CAIXA VALUES (' + Dm.CdsCaixaLojaCD_CAIXA.AsString + ')';
                             Dm.FDCaixaLoja.ExecSQL(True);
                           end;
                          Dm.CdsCaixaLoja.Next;
                        end;
                    end
                   else
                    begin
                      GravaLog(TimetoStr(Time) + ' - Dados = null. Processo 1003.');
                    end;
                 end;
             end
            else
             begin
               GravaLog(TimetoStr(Time) + ' - Dados = null. Processo 1001.');
             end;
          end;

        Dm.CdsCaixaLoja.Close;
        Dm.CdsCdCaixa.Close;

        repeat
           Dm.CdsCeCaixa.Close;
           Dm.FdCeCaixa.sql.text := 'INSERT INTO TEMP_CAIXA2 SELECT FIRST 1000 CD_CAIXA FROM TEMP_CAIXA';
           Dm.FdCeCaixa.ExecSQL(True);
           Dm.FdCeCaixa.sql.Text := Sql;
           Dm.CdsCeCaixa.FetchParams;
           Dm.CdsCeCaixa.Open;

           if Dm.CdsCeCaixa.RecordCount <> 0 then
            begin
             GravaLog(TimetoStr(Time) + ' - Enviando Caixa: ' + FloatToStr(Dm.CdsCeCaixa.RecordCount));

//             if (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(2, Filial, DmExporterQuick.CdsCeCaixa.Data) then
            LResponse := TRequest.New.BaseURL(dm.BaseUrl )
            .Resource('processa/1001')
              .AddBody(arrayCaixa.ToString)
                .Accept('application/json')
                 .get;
                FreeAndNil(arraycaixa);

              if LResponse.StatusCode=200 then
               begin
                 Dm.FdCeCaixa.Close;
                 Dm.FdCeCaixa.sql.Text := 'DELETE FROM TEMP_CAIXA WHERE CD_CAIXA IN (SELECT CD_CAIXA FROM TEMP_CAIXA2)';
                 Dm.FdCeCaixa.ExecSQL(True);
                 Dm.FdCeCaixa.sql.Text := 'DELETE FROM TEMP_CAIXA2';
                 Dm.FdCeCaixa.ExecSQL(True);
               end;
            end;

        until Dm.CdsCeCaixa.RecordCount = 0;
      Except
        on E:Exception do
          begin
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Caixa - '+ E.Message);

            Dm.CdsCaixaLoja.Close;
            Dm.CdsCdCaixa.Close;
            Exit;
          end;
      End;
  Finally
    Dm.CdsCeCaixa.Close;
  End;

end;

function  BuscaMatrizProdutosIncluidos : Boolean;
var
LResponse: IResponse;
arrayProdutos:TJSONArray;
begin
  //Busca na matriz os novos produtos incluidos

     Result := True;
     Dm.CdsIncluiProdutos.Close;
     Dm.CdsIncluiProdutos.CreateDataSet;

    try
     //Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(103, Filial, 'A');
     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
            .Resource('produtosnovos')
              .AddBody(arrayProdutos.ToString)
                .Accept('application/json')
                 .get;
                FreeAndNil(arrayProdutos);

     if LResponse.StatusCode=200 then
       begin

        Dm.CdsIncluiProdutos.Data := LResponse.Content; //retorno dos produtos novos
        Dm.CdsIncluiProdutos.Open; // virtual
        if Dm.CdsIncluiProdutos.RecordCount > 0 then
         begin
           Dm.CdsIncluiProdutos.First;
           GravaLog(TimetoStr(Time) + ' - Novos Produtos Recebidos: ' + FloatToStr(Dm.CdsIncluiProdutos.RecordCount));
           while not Dm.CdsIncluiProdutos.Eof do
            begin
              Dm.CdsCeProdutos.Close;
              Dm.FDCeProdutos.sql.Text := 'SELECT ID_PRODUTO FROM PRODUTOS WHERE ID_PRODUTO = ' + Dm.CdsIncluiProdutosID_PRODUTO.AsString;
              Dm.CdsCeProdutos.FetchParams;
              Dm.CdsCeProdutos.Open;
              if Dm.CdsCeProdutos.RecordCount = 0 then
               begin
                 Id_Produto       := Dm.CdsIncluiProdutosID_PRODUTO.AsString;
                 Cd_Produto       := QuotedStr(Dm.CdsIncluiProdutosCD_PRODUTO.AsString);
                 CodigoBarras     := QuotedStr(Dm.CdsIncluiProdutosCODIGO_BARRAS_1.AsString);
                 if Dm.CdsIncluiProdutosCODIGO_BARRAS_2.IsNull then
                     CodigoBarras2     := QuotedStr(Dm.CdsIncluiProdutosCD_PRODUTO.AsString)
                 else
                     CodigoBarras2     := QuotedStr(Dm.CdsIncluiProdutosCODIGO_BARRAS_2.AsString);
                 Descricao        := QuotedStr(Dm.CdsIncluiProdutosDESCRICAO.AsString);
                 if not (Dm.CdsIncluiProdutosCD_LABORATORIO.IsNull) then
                    Cd_Laboratorio   := Dm.CdsIncluiProdutosCD_LABORATORIO.AsString
                 else
                    Cd_Laboratorio   := 'NULL';
                 if not (Dm.CdsIncluiProdutosCD_GRUPO.IsNull) then
                    Cd_Grupo         := Dm.CdsIncluiProdutosCD_GRUPO.AsString
                 else
                    Cd_Grupo         := 'NULL';
                 if not (Dm.CdsIncluiProdutosCD_GRUPOBALANCO.IsNull) then
                    Cd_GrupoBalanco         := Dm.CdsIncluiProdutosCD_GRUPOBALANCO.AsString
                 else
                    Cd_GrupoBalanco         := 'NULL';
                 if not ( Dm.CdsIncluiProdutosCD_GRUPOCOMPRA.IsNull) then
                    Cd_GrupoCompra         := Dm.CdsIncluiProdutosCD_GRUPOCOMPRA.AsString
                 else
                    Cd_GrupoCompra         := 'NULL';
                 if not ( Dm.CdsIncluiProdutosCD_CLASSE.IsNull) then
                    Cd_Classe        := Dm.CdsIncluiProdutosCD_CLASSE.AsString
                 else
                    Cd_Classe        := 'NULL';
                 if not ( Dm.CdsIncluiProdutosID_FAMILIA.IsNull) then
                    Id_Familia        := Dm.CdsIncluiProdutosID_FAMILIA.AsString
                 else
                    Id_Familia        := 'NULL';
                 if not ( Dm.CdsIncluiProdutosTIPO_PRODUTO.IsNull) and ( Dm.CdsIncluiProdutosTIPO_PRODUTO.AsString <> '') then
                    TipoProduto      := QuotedStr( Dm.CdsIncluiProdutosTIPO_PRODUTO.AsString)
                 else
                    TipoProduto      := QuotedStr('OU');
                 if not ( Dm.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.IsNull) and ( Dm.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.AsString <> '') then
                    EntraPE          := QuotedStr( Dm.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.AsString)
                 else
                    EntraPE          := QuotedStr('N');
                 if not ( Dm.CdsIncluiProdutosCD_LISTA.IsNull) then
                    Cd_Lista         := StrTran(StrTran( Dm.CdsIncluiProdutosCD_LISTA.AsString, '.', ''), ',', '.')
                 else
                    Cd_Lista         := 'NULL';
                 if not ( Dm.CdsIncluiProdutosCD_PRINCIPIO.IsNull) then
                    Cd_Principio     := StrTran(StrTran( Dm.CdsIncluiProdutosCD_PRINCIPIO.AsString, '.', ''), ',', '.')
                 else
                    Cd_Principio     := 'NULL';
                 if not ( Dm.CdsIncluiProdutosTX_DESCONTO.IsNull) then
                    TxDesconto       := StrTran(StrTran( Dm.CdsIncluiProdutosTX_DESCONTO.AsString, '.', ''), ',', '.')
                 else
                    TxDesconto       := '0';
                 if not ( Dm.CdsIncluiProdutosIDENTIFICADOR.IsNull) and ( Dm.CdsIncluiProdutosIDENTIFICADOR.AsString <> '')  then
                    Identificador    := QuotedStr( Dm.CdsIncluiProdutosIDENTIFICADOR.AsString)
                 else
                    Identificador    := QuotedStr('M');
                 if not ( Dm.CdsIncluiProdutosBALANCA.IsNull) and ( Dm.CdsIncluiProdutosBALANCA.AsString <> '')  then
                    Balanca          := QuotedStr( Dm.CdsIncluiProdutosBALANCA.AsString)
                 else
                    Balanca          := QuotedStr('N');
                 if not ( Dm.CdsIncluiProdutosUNIDADE.IsNull) and ( Dm.CdsIncluiProdutosUNIDADE.AsString <> '')  then
                    Unidade          := QuotedStr( Dm.CdsIncluiProdutosUNIDADE.AsString)
                 else
                    Unidade          := QuotedStr('UN');
                 if not Dm.CdsIncluiProdutosQT_EMBALAGEM.IsNull then
                    Qt_Embalagem     := StrTran(StrTran( Dm.CdsIncluiProdutosQT_EMBALAGEM.AsString, '.', ''), ',', '.')
                 else
                    Qt_Embalagem     := '0';
                 if not Dm.CdsIncluiProdutosCOMISSAO.IsNull then
                    Comissao         := StrTran(StrTran( Dm.CdsIncluiProdutosCOMISSAO.AsString, '.', ''), ',', '.')
                 else
                    Comissao         := '0';
                 if not Dm.CdsIncluiProdutosCUSTO_UNITARIO.IsNull then
                    CustoUnitario    := StrTran(StrTran( Dm.CdsIncluiProdutosCUSTO_UNITARIO.AsString, '.', ''), ',', '.')
                 else
                    CustoUnitario    := '0';
                 if not Dm.CdsIncluiProdutosPRECO_VENDA.IsNull then
                    Preco_Venda      := StrTran(StrTran( Dm.CdsIncluiProdutosPRECO_VENDA.AsString, '.', ''), ',', '.')
                 else
                    Preco_Venda      := '0';
                 if not Dm.CdsIncluiProdutosPRECO_PROMOCAO.IsNull then
                    Preco_Promocao   := StrTran(StrTran( Dm.CdsIncluiProdutosPRECO_PROMOCAO.AsString, '.', ''), ',', '.')
                 else
                    Preco_Promocao   := '0';
                 if not Dm.CdsIncluiProdutosICMS.IsNull then
                    Icms             := QuotedStr( Dm.CdsIncluiProdutosICMS.AsString)
                 else
                    Icms             := QuotedStr('FF');
                 if not Dm.CdsIncluiProdutosMARGEM.IsNull then
                    Margem           := StrTran(StrTran( Dm.CdsIncluiProdutosMARGEM.AsString, '.', ''), ',', '.')
                 else
                    Margem           := '0';
                 if not ( Dm.CdsIncluiProdutosMARGEM_PROMOCAO.IsNull) then
                    Margem_Promocao  := StrTran(StrTran( Dm.CdsIncluiProdutosMARGEM_PROMOCAO.AsString, '.', ''), ',', '.')
                 else
                    Margem_Promocao  := '0';
                 if not Dm.CdsIncluiProdutosDT_CADASTRO.IsNull then
                    Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsIncluiProdutosDT_CADASTRO.AsDateTime))
                 else
                    Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', Date));
                 if not ( Dm.CdsIncluiProdutosCURVA.IsNull) and ( Dm.CdsIncluiProdutosCURVA.AsString <> '') then
                    Curva            := QuotedStr( Dm.CdsIncluiProdutosCURVA.AsString)
                 else
                    Curva            := QuotedStr('C');
                 if not ( Dm.CdsIncluiProdutosSTATUS.IsNull) and ( Dm.CdsIncluiProdutosSTATUS.AsString <> '') then
                    Status           := QuotedStr( Dm.CdsIncluiProdutosSTATUS.AsString)
                 else
                    Status           := QuotedStr('A');
                 if not ( Dm.CdsIncluiProdutosUSOCONTINUO.IsNull) and ( Dm.CdsIncluiProdutosUSOCONTINUO.AsString <> '') then
                    UsoContinuo      := QuotedStr( Dm.CdsIncluiProdutosUSOCONTINUO.AsString)
                 else
                    UsoContinuo      := QuotedStr('N');
                 if not ( Dm.CdsIncluiProdutosPIS_COFINS.IsNull) and ( Dm.CdsIncluiProdutosPIS_COFINS.AsString <> '') then
                    Pis_Cofins       := QuotedStr( Dm.CdsIncluiProdutosPIS_COFINS.AsString)
                 else
                    Pis_Cofins       := QuotedStr('N');
                 if not ( Dm.CdsIncluiProdutosNCM.IsNull) and ( Dm.CdsIncluiProdutosNCM.AsString <> '') then
                    NCM              := QuotedStr( Dm.CdsIncluiProdutosNCM.AsString)
                 else
                    NCM              := QuotedStr('');
                 if not ( Dm.CdsIncluiProdutosCD_SUBGRUPO.IsNull) then
                    Cd_SubGrupo         := Dm.CdsIncluiProdutosCD_SUBGRUPO.AsString
                 else
                    Cd_SubGrupo         := 'NULL';
                 if not ( Dm.CdsIncluiProdutosCEST.IsNull) and ( Dm.CdsIncluiProdutosCEST.AsString <> '') then
                    CEST             := QuotedStr( Dm.CdsIncluiProdutosCEST.AsString)
                 else
                    CEST             := QuotedStr('');
                 if not ( Dm.CdsIncluiProdutosCD_CFOP.IsNull) then
                    CD_CFOP          := Dm.CdsIncluiProdutosCD_CFOP.AsString
                 else
                    CD_CFOP          := 'NULL';
                 if not ( Dm.CdsIncluiProdutosSITUACAOTRIBUTARIA.IsNull) then
                    SituacaoTributaria  := QuotedStr( Dm.CdsIncluiProdutosSITUACAOTRIBUTARIA.AsString)
                 else
                    SituacaoTributaria  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosORIGEM.IsNull) then
                    Origem  := QuotedStr( Dm.CdsIncluiProdutosORIGEM.AsString)
                 else
                    Origem  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosCSOSN.IsNull) then
                    CSOSN  := QuotedStr( Dm.CdsIncluiProdutosCSOSN.AsString)
                 else
                    CSOSN  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosIAT.IsNull) then
                    IAT  := QuotedStr( Dm.CdsIncluiProdutosIAT.AsString)
                 else
                    IAT  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosIPPT.IsNull) then
                    IPPT  := QuotedStr( Dm.CdsIncluiProdutosIPPT.AsString)
                 else
                    IPPT  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosCOMPRIMIDOSCAIXA.IsNull) then
                    ComprimidosCaixa  := InttoStr( Dm.CdsIncluiProdutosCOMPRIMIDOSCAIXA.AsInteger)
                 else
                    ComprimidosCaixa  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosCONTROLADO.IsNull) then
                    Controlado  := QuotedStr( Dm.CdsIncluiProdutosCONTROLADO.AsString)
                 else
                    Controlado  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosGENERICO.IsNull) then
                    Generico  := QuotedStr( Dm.CdsIncluiProdutosGENERICO.AsString)
                 else
                    Generico  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO.IsNull) then
                    Dt_Vencimento_Promocao  := QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO.AsDateTime))
                 else
                    Dt_Vencimento_Promocao  := 'NULL';
                 if not ( Dm.CdsIncluiProdutosOBSERVACAO.IsNull) then
                    Observacao  := QuotedStr( Dm.CdsIncluiProdutosOBSERVACAO.AsString)
                 else
                    Observacao  := 'NULL';


                  Dm.Query.SQL.Text := 'INSERT INTO PRODUTOS (ID_PRODUTO, CD_PRODUTO, CODIGO_BARRAS_1, CODIGO_BARRAS_2, DESCRICAO, ' +
                                     ' CD_LABORATORIO, CD_GRUPO, CD_CLASSE, TIPO_PRODUTO, IDENTIFICADOR, QT_EMBALAGEM, ' +
                                     ' COMISSAO, CUSTO_UNITARIO, CUSTO_UNITARIO_' + dm.cdfilialparametro + ', CUSTO_MEDIO, CUSTO_MEDIO_' + dm.cdfilialparametro +
                                     ', PRECO_VENDA, PRECO_PROMOCAO, ICMS, MARGEM, MARGEM_PROMOCAO, DT_CADASTRO, CURVA, ENTRA_PEDIDO_ELETRONICO, STATUS, ' +
                                     ' CD_LISTA, CD_PRINCIPIO, USOCONTINUO, PIS_COFINS, NCM, CD_GRUPOBALANCO, CD_GRUPOCOMPRA, ID_FAMILIA, CD_SUBGRUPO, CEST, ' +
                                     ' CD_CFOP, SITUACAOTRIBUTARIA, ORIGEM, CSOSN, IAT, IPPT, COMPRIMIDOSCAIXA, CONTROLADO, GENERICO, DT_VENCIMENTO_PROMOCAO, OBSERVACAO ) VALUES (' +
                                     Id_Produto + ',' + Cd_Produto + ',' + CodigoBarras + ',' + CodigoBarras2 + ',' + Descricao + ',' +
                                     Cd_Laboratorio + ',' + Cd_Grupo + ',' + Cd_Classe + ',' + TipoProduto + ',' +
                                     Identificador + ',' + Qt_Embalagem + ',' + Comissao + ',' +
                                     CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' +
                                     Preco_Venda + ',' + Preco_Promocao + ',' + Icms + ',' + Margem + ',' +
                                     Margem_Promocao + ',' + Dt_Cadastro + ',' + Curva + ',' + EntraPE + ',' + Status + ',' +
                                     Cd_Lista + ',' + Cd_Principio + ',' + UsoContinuo + ',' + Pis_Cofins + ',' + NCM +  ',' +
                                     Cd_GrupoBalanco + ',' + Cd_GrupoCompra + ',' + Id_Familia + ',' + Cd_SubGrupo + ',' + CEST + ',' +
                                     CD_CFOP + ', ' + SituacaoTributaria + ',' + Origem + ',' + CSOSN + ',' + IAT + ',' + IPPT + ',' + ComprimidosCaixa + ',' +
                                     Controlado + ',' + Generico + ',' + Dt_Vencimento_Promocao + ',' + Observacao + ')';

                 Try
                    Dm.query.ExecSQL(True);
                 Except
                   on E:Exception do
                    begin
                      GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos novos - '+E.Message);
                    end;
                 End;
               end;
              Dm.CdsIncluiProdutos.Next;
            end;
            Dm.CdsIncluiProdutos.Close;
            Dm.CdsCeProdutos.Close;
         end;
       end;
    except on E:Exception  do
        begin
         Result := False;
        Exit;

         GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Recebendo Novos Produtos - '+ E.Message);

         GravaLog(TimetoStr(Time) + ' SQL : ' +  Dm.Query.sql.Text);
         Dm.CdsIncluiProdutos.Close;
        Dm.CdsCeProdutos.Close;
         Try
            Dm.Query.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
            Dm.Query.ExecSQL(True);
         Except
           Result := False;
         End;
         Exit;
       end;
    end;


   Try
      Dm.Query.sql.Text  := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
      Dm.Query.ExecSQL(True);
   Except
     Result := False;
    End;

   Dm.CdsCeProdutos.Close;

end;

Function  StrTran( cString, cProcura, cTroca : string ): string;
Var posatu, posAtuAnt : integer;
Begin
   cTroca := LowerCase(cTroca);
   posatu := Pos( cProcura, cString );
   While PosAtu <> 0 do Begin
       PosAtuAnt := PosAtu + Length( cTroca );
       Try
        Delete( cString, PosAtu, Length(cProcura) );
        Insert( cTroca, cString, PosAtu );
       Finally
        PosAtu := Pos( cProcura, cString );
       End;
       if PosAtu < PosAtuAnt then Break;
   End;
   result := cString

end;

function  EnviandoEstoque : Boolean;
var
 LResponse: IResponse;
arrayEstoque:TJSONArray;
begin

    Result := True;

    Dm.fdCeProdutos.sql.Text := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 7';
    Dm.fdCeProdutos.ExecSQL(True);

    Dm.fdCeProdutos.sql.Text:= 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE PROCESSO = 7';
    Dm.fdCeProdutos.ExecSql(True);

    Dm.fdCeProdutos.sql.Text :=
              'SELECT PRODUTOS.ID_PRODUTO, PRODUTOS.ESTOQUE_' + dm.cdfilialparametro + ', ' +
              '       PRODUTOS.DT_ULT_VENDA_' + dm.cdfilialparametro + ' ,' +
              '       PRODUTOS.DT_ULT_COMPRA_' + dm.cdfilialparametro + ', ' +
              '       CAST(PRODUTOS.CUSTO_UNITARIO_' + dm.cdfilialparametro + ' AS NUMERIC(10,2)) AS CUSTO_UNITARIO_' + dm.cdfilialparametro + ', ' +
              '       CAST(PRODUTOS.CUSTO_MEDIO_' + dm.cdfilialparametro + ' AS NUMERIC(10,2)) AS CUSTO_MEDIO_' + dm.cdfilialparametro + ', ' +
              '       PRODUTOS.FACE_' + dm.cdfilialparametro + ', IDENTIFICADOR FROM PRODUTOS, TEMP_PRODUTOS2 ' +
              'WHERE  TEMP_PRODUTOS2.PROCESSO = 7 AND PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS2.ID_PRODUTO';

    Dm.CdsCeProdutos.Params.Clear;
    Dm.CdsCeProdutos.Open;

    if Dm.CdsCeProdutos.RecordCount <> 0 then
     begin
        GravaLog(TimetoStr(Time) + ' - Enviando Estoque: ' + FloatToStr(Dm.CdsCeProdutos.RecordCount));

        Dm.CdsCeProdutos.IndexFieldNames := 'ID_PRODUTO';

        //Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(7, Filial, Dm.CdsCeProdutos.Data);


        try

         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
            .Resource('produtosnovos')
              .AddBody(arrayEstoque.ToString)
                .Accept('application/json')
                 .get;
                FreeAndNil(arrayEstoque);

           if LResponse.StatusCode=200 then
             begin
                Dm.CdsCeProdutos.Close;
                Dm.FdCeProdutos.Close;
                Dm.FdCeProdutos.sql.Text := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 7 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 7)';
                Dm.FdCeProdutos.ExecSQL(True);

                Dm.FdCeProdutos.sql.Text := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 7';
                Dm.FdCeProdutos.ExecSQL(True);
             end;
         Except
            on E:Exception do
             begin

               GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Estoques dos Produtos - '+E.Message);
               Dm.CdsCeProdutos.Close;

             end;

        end;

     end
    else
    begin
     Result := False;
     Dm.CdsCeProdutos.Close;
    end;

end;

procedure EnviandoOperadoresCaixa;
var
  sql :string;
 LResponse: IResponse;
arrayEstoque:TJSONArray;
begin
  //envia para a matriz os dados de operadores de caixa

   Sql := Dm.FDOperadores.sql.Text;
   Try
    Dm.FdOperadores.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_OPERADORES INACTIVE';
    Dm.FdOperadores.ExecSQL(True);
   Except
    Dm.FdOperadores.close;
    exit ;
   End;

   Dm.FDOperadores.sql.Text := 'UPDATE OPERADORES SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
   Dm.FDOperadores.ExecSQL;
   Dm.FDOperadores.sql.Text := Sql;
   Dm.CdsOperadores.Open;

   if Dm.CdsOperadores.RecordCount <> 0 then
    begin

       GravaLog(TimetoStr(Time) + ' - Enviando Operadores de Caixa: ' + FloatToStr(Dm.CdsOperadores.RecordCount));


    //   Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(8, Filial, DmExporterQuick.CdsOperadores.Data);

      try
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('produtosnovos')
         .AddBody(arrayEstoque.ToString)
         .Accept('application/json')
         .get;
         FreeAndNil(arrayEstoque);

        if LResponse.StatusCode=200 then
          begin
            Dm.CdsOperadores.Close;
            Dm.FDOperadores.Close;
            Dm.FDOperadores.sql.Text := 'UPDATE OPERADORES SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' +  QuotedStr('9');
            Dm.FDOperadores.ExecSQL(True);
          end;

      Except on E:Exception do
        begin

          Try
           Dm.FDOperadores.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_OPERADORES ACTIVE';
           Dm.FDOperadores.ExecSQL(True);
          Except
            GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Operadores de Caixa - '+E.Message);
          End;
          GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Operadores de Caixa - '+E.Message);
          Dm.CdsOperadores.Close;
          Exit;
        end;
      end;
    end;


    Try
     Dm.FdOperadores.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_OPERADORES ACTIVE';
     Dm.FDOperadores.ExecSQL(True);
    Except
     exit
    End;
    Dm.CdsOperadores.Close;

end;

procedure EnviandoCRM;
var
 sql:string;
 LResponse: IResponse;
arrayEstoque:TJSONArray;
begin

  Sql :=  Dm.FdCRM.sql.text;

  Try
   Dm.FdCRM.sql.text := 'ALTER TRIGGER CRM_BIU0 INACTIVE';
   Dm.FDCRM.ExecSQL(True);
  Except
   abort
  End;


 Dm.FdCRM.sql.text := 'UPDATE CRM SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
 Dm.FdCRM.ExecSQL;
 Dm.FdCRM.sql.Text := Sql;
 Dm.CdsCRM.Open;

 if  Dm.CdsCRM.RecordCount <> 0 then
  begin
     GravaLog(TimetoStr(Time) + ' - Enviando CRM: ' + FloatToStr( Dm.CdsCRM.RecordCount));

     //VerificaConexao('');

  //   Dados := ( Dm.HTTPRIO1 as IDmProcessa).Processa(15, Filial,  Dm.CdsCRM.Data);
    try

       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('produtosnovos')
       .AddBody(arrayEstoque.ToString)
       .Accept('application/json')
       .get;
       FreeAndNil(arrayEstoque);

        if LResponse.StatusCode=200 then
          begin
             Dm.CdsCRM.Close;
             Dm.fDCRM.Close;
             Dm.fDCRM.SQL.Text := 'UPDATE CRM SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' +  QuotedStr('9');
             Dm.fDCRM.ExecSQL(True);

            Try
              Dm.fDCRM.SQL.Text := 'ALTER TRIGGER CRM_BIU0 ACTIVE';
              Dm.FDCRM.ExecSQL(True);
             Except
             ABORT
            End;
          end;

    Except
       on E:Exception do
        begin
          GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de CRM - '+E.Message);
          Dm.CdsCRM.Close;

         Dm.FDCRM.SQL.Text := 'ALTER TRIGGER CRM_BIU0 ACTIVE';
         Dm.FDCRM.ExecSQL(True);

          Exit;
        end;
    end;
  end;
  Dm.CdsCRM.Close;
end;

procedure EnviandoEntregas;
var
  sql:string;
LResponse: IResponse;
arrayEstoque:TJSONArray;
begin

  //envia para a matriz os dados de entregas
  Try

     Sql :=  Dm.FdEntregas.sql.Text;

     Try
       Dm.FdEntregas.sql.text := 'ALTER TRIGGER TG_AT_ENVIADO_ENTREGAS INACTIVE';
       Dm.FdEntregas.ExecSQL;
      Except
       Dm.FdEntregas.Close;
     End;

      Dm.FdEntregas.sql.text := 'UPDATE ENTREGAS SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
      Dm.FdEntregas.ExecSQL;
      Dm.FdEntregas.sql.text := Sql;
      Dm.CdsEntregas.Open;
     if  Dm.CdsEntregas.RecordCount <> 0 then
      begin
        //
        try

         //VerificaConexao('');
         GravaLog(TimetoStr(Time) + ' - Enviando Entregas: ' + FloatToStr( Dm.CdsEntregas.RecordCount));

        // Dados := ( Dm.HTTPRIO1 as IDmProcessa).Processa(9, Filial,  Dm.CdsEntregas.Data);

         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('produtosnovos')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arrayEstoque.ToString)
         .Accept('application/json')
         .get;
         FreeAndNil(arrayEstoque);

          if LResponse.StatusCode=200 then
           begin
              Dm.CdsEntregas.Close;
              Dm.FdEntregas.Close;
              Dm.FdEntregas.sql.text := 'UPDATE ENTREGAS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
              Dm.FdEntregas.ExecSQL(True);
           end;
        Except
           on E:Exception do
            begin

              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Entregas - '+E.Message);
               Dm.CdsEntregas.Close;
              Try
               Dm.FdEntregas.sql.text := 'ALTER TRIGGER TG_AT_ENVIADO_ENTREGAS ACTIVE';
               Dm.FdEntregas.ExecSQL;
              Except
                Dm.FdEntregas.Close;
              End;
              Exit;
            end;
        end;
      end;


  Finally
     Dm.CdsEntregas.Close;
    Try
       Dm.FdEntregas.sql.text := 'ALTER TRIGGER TG_AT_ENVIADO_ENTREGAS ACTIVE';
       Dm.FdEntregas.ExecSQL;
    Except
      Dm.FdEntregas.Close;
    End;

  End;

end;

procedure EnviandoChequesRecebidos;
var
  sql:string;
LResponse: IResponse;
arrayChequerecebidos:TJSONArray;
begin

 //envia para a matriz os dados de cheques recebidos
  Try

   Try
     DM.Query.SQL.Clear;
     DM.Query.SQL.Text := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 INACTIVE';
     DM.Query.ExecSQL;

   Except
     DM.Query.SQL.Clear;
   End;

   Sql :=' SELECT  * FROM  CHEQUESRECEBIDOS WHERE  ENVIADO = ''9''';
   DM.Query.SQL.Text := 'UPDATE CHEQUESRECEBIDOS SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
   DM.Query.ExecSQL(false);

   DM.Query.SQL.Text := Sql;
   DM.Query.Open();

   if  DM.Query.RecordCount <> 0 then
    begin
      // VerificaConexao('');

      try

       GravaLog(TimetoStr(Time) + ' - Enviando Cheques Recebidos: ' + FloatToStr(DM.Query.RecordCount));
//             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(10, Filial, DmExporterQuick.CdsCheques.Data);
       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('produtosnovos')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arrayChequerecebidos.ToString)
       .Accept('application/json')
       .post;
       FreeAndNil(arrayChequerecebidos);

       if LResponse.StatusCode=200 then
         begin
           DM.Query.SQL.Clear;
           DM.Query.SQL.Text := 'UPDATE CHEQUESRECEBIDOS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
           DM.Query.ExecSQL(True);
         end;
      Except on E:Exception do
            begin

              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Cheques - '+E.Message);


              Try

                DM.Query.SQL.Text:= 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 ACTIVE';
                DM.Query.ExecSQL(True);

              Except
                 DM.Query.SQL.Clear;
              End;

              Exit;
            end;

      end;
    end;


  Finally
     DM.Query.sql.Clear;

    Try
      DM.Query.sql.Text := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 ACTIVE';
      DM.Query.ExecSQL(false);
    Except
      DM.Query.sql.Clear;
    End;
  End;

end;

procedure EnviandoItensTransfer;
var
  sql:string;
LResponse: IResponse;
arrayItensTransfer:TJSONArray;
begin
   //envia para a matriz os dados de ItensTransfer
  Try
   Dm.CdsCeItensTransfer.Open;
    If Dm.CdsCeItensTransfer.RecordCount <> 0 then
    begin
       //VerificaConexao('');

       GravaLog(TimetoStr(Time) + ' - Enviando ItensTransfer: ' + FloatToStr(Dm.CdsCeItensTransfer.RecordCount));
      // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(12, Filial, Dm.CdsCeItensTransfer.Data);
      try

       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('produtosnovos')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arrayItensTransfer.ToString)
       .Accept('application/json')
       .post;
       FreeAndNil(arrayItensTransfer);
         if LResponse.StatusCode=200 then
         begin
          Dm.CdsCeItensTransfer.Close;
         end;

      Except  on E:Exception do
            begin
              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  ItensTransfer - '+E.Message);
              Dm.CdsCeItensTransfer.Close;
            end;


      end;
    end;

  Finally
    Dm.CdsCeItensTransfer.Close;
  End;


end;

procedure EnviandoTransfer;
var
 sql :String;
 LResponse: IResponse;
arrayTransfer:TJSONArray;
begin
  //envia para a matriz os dados de cabeçalho da Transfer
  Try

    Try
      Dm.Query.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER INACTIVE';
      Dm.Query.ExecSQL(True);
    Except
      Dm.Query.SQL.Clear;
    End;

   Sql := 'SELECT * FROM TRANSFER WHERE STATUS <> '''+'A'+''' AND ENVIADO = '''+'9'+'''';
   Dm.CdsCeTransfer.Close;

     Dm.FDTransfer.sql.Text := 'UPDATE TRANSFER SET ENVIADO = '+QuotedStr('9')+' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> '+QuotedStr('2')+')) AND (STATUS <> ''' + 'A' + ''')';
     Dm.FDTransfer.ExecSQL;
     Dm.CdsCeTransfer.Close;

     GravaLog(TimetoStr(Time) + ' - Inicio do processo de ItensTransfer');

     Try
       EnviandoItensTransfer;
     Except
       on E:Exception do
         begin
           GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de ItensTransfer - ' + E.Message);
           Dm.CdsCeItensTransfer.Close;
         end;
     end;

     GravaLog(TimetoStr(Time) + ' - Fim do processo de ItensTransfer');

     GravaLog(TimetoStr(Time) + ' - Inicio do processo de Transfer');
     Dm.FDTransfer.sql.Text := Sql;
     Dm.CdsCeTransfer.Open;
     if Dm.CdsCeTransfer.RecordCount > 0 then
      begin

        GravaLog(TimetoStr(Time) + ' - Enviando Transfer: ' + FloatToStr(Dm.CdsCeTransfer.RecordCount));

        // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(11, Filial, Dm.CdsCeTransfer.Data);
         try

           LResponse := TRequest.New.BaseURL(dm.BaseUrl )
           .Resource('produtosnovos')
           .AcceptEncoding('gzip, deflate')
           .AddBody(arrayTransfer.ToString)
           .Accept('application/json')
           .post;
            FreeAndNil(arrayTransfer);

           if LResponse.StatusCode=200 then
             begin
               Dm.CdsCeTransfer.Close;
               Dm.FDTransfer.Close;
               Dm.FDTransfer.sql.Text := 'UPDATE TRANSFER SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
               Dm.FDTransfer.ExecSQL(True);
              end;

          Except  on E:Exception do
              begin

                GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Transfer - '+E.Message);
                Dm.CdsCeTransfer.Close;
                Try
                  Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
                  Dm.query.ExecSQL(True);
                Except
                End;
                Dm.CdsCeTransfer.Close;
                Exit;

              end;
         end;
      end;

     GravaLog(TimetoStr(Time) + ' - Fim do processo de Transfer');

  Finally
    Dm.CdsCeTransfer.Close;
    Try
      Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
      Dm.query.ExecSQL(True);
    Except
      Dm.query.sql.Clear;
    End;
  End;

end;

procedure EnviandoTransfer1;
var
sql:String;
LResponse: IResponse;
arrayTransfer:TJSONArray;
begin

  //envia para a matriz os dados de Transfer
  Try

  Try
    Dm.query.SQL.Text:= 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER INACTIVE';
    Dm.query.ExecSQL(True);
  Except
    Dm.query.sql.Clear;
  End;

  Sql := 'SELECT * FROM TRANSFER WHERE STATUS <> '''+'A'+''' AND ENVIADO = '''+'9'+'''';
  Dm.CdsCeTransfer.Close;

     GravaLog(TimetoStr(Time) + ' - Inicio do processo Transfer1');

     Dm.FDTransfer.sql.Text := 'UPDATE TRANSFER SET ENVIADO = '+QuotedStr('9')+' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> '+QuotedStr('2')+')) AND (STATUS <> ''' + 'A' + ''')';

     Dm.FDTransfer.ExecSQL;

     Dm.CdsCeTransfer.Close;
     Dm.FDTransfer.sql.Text := Sql;
     Dm.CdsCeTransfer.Open;

     if Dm.CdsCeTransfer.RecordCount > 0 then
      begin
         GravaLog(TimetoStr(Time) + ' - Verificando conexao');
         //VerificaConexao('');

         GravaLog(TimetoStr(Time) + ' - Enviando Transfer: ' + FloatToStr(Dm.CdsCeTransfer.RecordCount));

         //Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(11, Filial, Dm.CdsCeTransfer.Data);
       try
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('transfer')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arrayTransfer.ToString)
         .Accept('application/json')
         .post;
          FreeAndNil(arrayTransfer);

          if LResponse.StatusCode=200 then
           begin
             GravaLog(TimetoStr(Time) + ' - Fim do processo Transfer1');

             Dm.CdsCeTransfer.Close;
             Dm.FDTransfer.Close;
             Dm.FDTransfer.sql.Text := 'UPDATE TRANSFER SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
             Dm.FDTransfer.ExecSQL(True);

             GravaLog(TimetoStr(Time) + ' - Inicio do processo ItensTransfer1');

             Try
               EnviandoItensTransfer;
               GravaLog(TimetoStr(Time) + ' - Fim do processo ItensTransfer1');
             Except
               on E:Exception do
                 begin
                   GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de ItensTransfer - ' + E.Message);
                   Dm.CdsCeItensTransfer.Close;
                 end;
             end;

           end;

       Except on E:Exception do
          begin
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Transfer - '+E.Message);
            Dm.CdsCeTransfer.Close;
            Try
              Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
              Dm.query.ExecSQL(True);
            Except

            End;
            Dm.CdsCeTransfer.Close;
            Exit;
          end;

       end;

      end;

  Finally
    Dm.CdsCeTransfer.Close;
    Try
      Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
      Dm.query.ExecSQL(True);
    Except
      Dm.query.sql.Clear;
    End;
  End;

end;

procedure EnviandoCadernoFaltas;
var
sql:String;
LResponse: IResponse;
arrayCadernoFaltas:TJSONArray;
begin
 //envia para a matriz os dados de CadernoFaltas

  Try

   Dm.CdsCadernoFaltas.Open;
   if Dm.CdsCadernoFaltas.RecordCount <> 0 then
    begin
     GravaLog(TimetoStr(Time) + ' - Enviando Caderno Faltas: ' + FloatToStr(Dm.CdsCadernoFaltas.RecordCount));

       try
          // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(13, Filial, Dm.CdsCadernoFaltas.Data);

       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('cadernodefaltas')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arrayCadernoFaltas.ToString)
       .Accept('application/json')
       .post;
        FreeAndNil(arrayCadernoFaltas);

         if LResponse.StatusCode=200 then
           begin
             Dm.CdsCadernoFaltas.Close;
           end;

       except
          on E:Exception do
            begin
              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Caderno Faltas - '+E.Message);
              Dm.CdsCadernoFaltas.Close;
              Exit;
            end;
       end;
    end;

  Finally
    Dm.CdsCadernoFaltas.Close;
    Dm.query.sql.Text := 'UPDATE CADERNO_FALTAS SET STATUS = ' + QuotedStr('E') + ' WHERE (STATUS IS NULL) OR (STATUS <> ' + QuotedStr('E') + ')';
    Try
     Dm.query.ExecSQL(True);
    Except
      Dm.query.sql.Clear;
    end;
  End;

end;

Procedure EnviandoPrecosFilial;
var
sql:String;
LResponse: IResponse;
arrayCadernoFaltas:TJSONArray;
begin

   Try
     Dm.CdsPrecoVenda.Close;
     MontaSQL_Precos(dm.cdfilialparametro);
     Dm.CdsPrecoVenda.Open;

     if Dm.CdsPrecoVenda.RecordCount <> 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Enviando Precos de Venda: ' + FloatToStr(Dm.CdsPrecoVenda.RecordCount));
       //  Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(52, Filial, Dm.CdsPrecoVenda.Data);

         try

           LResponse := TRequest.New.BaseURL(dm.BaseUrl )
           .Resource('precosfilial')
           .AcceptEncoding('gzip, deflate')
           .AddBody(arrayCadernoFaltas.ToString)
           .Accept('application/json')
           .post;
           FreeAndNil(arrayCadernoFaltas);
          if lresponse.statuscode=200 then
            begin
               Dm.CdsPrecoVenda.Close;
            end;

          Except
         on E:Exception do
            begin
              Dm.CdsPrecoVenda.Close;
              GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Preco de Venda - '+ E.Message);
            end;

         end;

      end
     else
      begin
        Exit;
      end;

     Dm.query.sql.Text := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 52 AND ENVIADO = '+QuotedStr('9');
     Dm.query.ExecSQL(True);
     Dm.query.sql.Text := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 52';
     Dm.query.ExecSQL(True);

   finally
    Dm.CdsPrecoVenda.Close;
    Dm.query.sql.Clear;
   End;

end;

procedure MontaSQL_Precos(Filial : String);
var
 ComandoSQL : String;
begin

  dm.query.sql.Text := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 52';
  Dm.query.ExecSQL(True);

  ComandoSQL := '';
  ComandoSQL := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS ' +
                'WHERE PROCESSO = 52';
  Dm.FDPrecoVenda.sql.Text := ComandoSql;
  Dm.FDPrecoVenda.ExecSQL(True);

  ComandoSQL := '';
  ComandoSQL := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') +
                ' WHERE ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2)';

  Dm.FDPrecoVenda.sql.Text := ComandoSql;
  Dm.FDPrecoVenda.ExecSQL(True);


  ComandoSQL := '';
  ComandoSQL := 'SELECT FIRST 1000 PRODUTOS.ID_PRODUTO, ' +
                ' CAST(CAST(PRODUTOS.PRECO_VENDA AS NUMERIC(10,2)) AS DOUBLE PRECISION) AS PRECO_VENDA, ' +
                ' CAST(CAST(PRODUTOS.PRECO_PROMOCAO AS NUMERIC(10,2)) AS DOUBLE PRECISION) AS PRECO_PROMOCAO, ' +
                ' PRODUTOS.DT_VENCIMENTO_PROMOCAO, PRODUTOS.DT_REAJUSTE, PRODUTOS.USUARIO ' +
                ' FROM PRODUTOS, TEMP_PRODUTOS ' +
                ' WHERE PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS.ID_PRODUTO AND ' +
                ' TEMP_PRODUTOS.PROCESSO = 52 AND TEMP_PRODUTOS.ENVIADO = ' + QuotedStr('9');
  Dm.FDPrecoVenda.sql.Text := ComandoSQL;
  Dm.FDPrecoVenda.Params.Clear;
  CriaCamposPrecos(dm.cdfilialparametro);

end;

procedure CriaCamposPrecos(sFilial : String);
var
fIdProduto, fPrecoVenda, fPrecoPromocao : TFloatField;
fDtVencimentoPromocao, fDtReajuste : TDateField;
fUsuario : TstringField;

begin

 fIdProduto               := TFloatField.Create(nil);
 fIdProduto.FieldName     := 'ID_PRODUTO';
 fIdProduto.FieldKind     := fkData;
 fIdProduto.DisplayLabel  := 'ID_PRODUTO';
 fIdProduto.Visible       := True;
 fIdProduto.Name          := Dm.CdsPrecoVenda.Name + fIdProduto.FieldName;
 fIdProduto.Index         := 0;
 fIdProduto.DataSet       :=  (Dm.CdsPrecoVenda as TDataSet);

 fPrecoVenda              := TFloatField.Create(nil);
 fPrecoVenda.FieldName    := 'PRECO_VENDA';
 fPrecoVenda.FieldKind    := fkData;
 fPrecoVenda.DisplayLabel := 'PRECO_VENDA';
 fPrecoVenda.Visible      := True;
 fPrecoVenda.Name         := Dm.CdsPrecoVenda.Name + fPrecoVenda.FieldName;
 fPrecoVenda.Index        := 1;
 fPrecoVenda.DataSet      := (Dm.CdsPrecoVenda as TDataSet);

 fPrecoPromocao           := TFloatField.Create(nil);
 fPrecoPromocao.FieldName := 'PRECO_PROMOCAO';
 fPrecoPromocao.FieldKind := fkData;
 fPrecoPromocao.DisplayLabel := 'PRECO_PROMOCAO';
 fPrecoPromocao.Visible   := True;
 fPrecoPromocao.Name      := Dm.CdsPrecoVenda.Name + fPrecoPromocao.FieldName;
 fPrecoPromocao.Index     := 2;
 fPrecoPromocao.DataSet   := (Dm.CdsPrecoVenda as TDataSet);

 fDtVencimentoPromocao    := TDateField.Create(nil);
 fDtVencimentoPromocao.FieldName := 'DT_VENCIMENTO_PROMOCAO';
 fDtVencimentoPromocao.FieldKind := fkData;
 fDtVencimentoPromocao.DisplayLabel := 'DT_VENCIMENTO_PROMOCAO';
 fDtVencimentoPromocao.Visible := True;
 fDtVencimentoPromocao.Name := Dm.CdsPrecoVenda.Name + fDtVencimentoPromocao.FieldName;
 fDtVencimentoPromocao.Index := 3;
 fDtVencimentoPromocao.DataSet := (Dm.CdsPrecoVenda as TDataSet);

 fDtReajuste              := TDateField.Create(nil);
 fDtReajuste.FieldName    := 'DT_REAJUSTE';
 fDtReajuste.FieldKind    := fkData;
 fDtReajuste.DisplayLabel := 'DT_REAJUSTE';
 fDtReajuste.Visible      := True;
 fDtReajuste.Name         := Dm.CdsPrecoVenda.Name + fDtReajuste.FieldName;
 fDtReajuste.Index        := 4;
 fDtReajuste.DataSet      := (Dm.CdsPrecoVenda as TDataSet);

 fUsuario              := TStringField.Create(nil);
 fUsuario.FieldName    := 'USUARIO';
 fUsuario.FieldKind    := fkData;
 fUsuario.DisplayLabel := 'USUARIO';
 fUsuario.Visible      := True;
 fUsuario.Name         := Dm.CdsPrecoVenda.Name + fUsuario.FieldName;
 fUsuario.Index        := 5;
 fUsuario.DataSet      := (Dm.CdsPrecoVenda as TDataSet);

 Dm.CdsPrecoVenda.FieldDefs.Update;

end;

procedure EnviandoConferenciaNota;
var
Sql : String;
LResponse: IResponse;
arrayConferenciaNota:TJSONArray;

begin
  //processamento e envio de Conferencia Nota
  Try

    Sql := 'SELECT CONFERENCIA_NOTA.* FROM CONFERENCIA_NOTA WHERE ENVIADO = ' + QuotedStr('9');

    Dm.CdsConferenciaNota.Close;

    Dm.FdConferenciaNota.sql.Text := 'ALTER TRIGGER CONFERENCIA_NOTA_BIU0 INACTIVE';
    Dm.FdConferenciaNota.ExecSQL(True);

    Dm.fdConferenciaNota.sql.Text := 'UPDATE CONFERENCIA_NOTA SET ENVIADO = ' + QuotedStr('9') + ' WHERE (ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')';
    Dm.fdConferenciaNota.ExecSql(True);

    Dm.FDConferenciaNota.sql.Text := Sql;
    Dm.CdsConferenciaNota.Open;

    if Dm.CdsConferenciaNota.RecordCount <> 0 then
     begin
        GravaLog(TimetoStr(Time) + ' - Enviando Conferencia Nota: ' + FloatToStr(Dm.CdsConferenciaNota.RecordCount));

      //  Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(67, Filial, Dm.CdsConferenciaNota.Data);
      try

        LResponse := TRequest.New.BaseURL(dm.BaseUrl )
        .Resource('conferencianotas')
        .AcceptEncoding('gzip, deflate')
        .AddBody(arrayConferenciaNota.ToString)
        .Accept('application/json')
        .post;
        FreeAndNil(arrayConferenciaNota);

        if lresponse.statuscode=200 then
          begin
            Dm.CdsConferenciaNota.Close;
            Dm.fdConferenciaNota.sql.Text := 'UPDATE CONFERENCIA_NOTA SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
            Dm.fdConferenciaNota.ExecSQL(True);
           end;
       Except
      on E:Exception do
            begin
              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Conferencia Nota - ' + E.Message);
              Dm.FdConferenciaNota.sql.Text := 'ALTER TRIGGER CONFERENCIA_NOTA_BIU0 ACTIVE';
              Dm.fdConferenciaNota.ExecSQL(True);
              Dm.CdsConferenciaNota.Close;
              Exit;
            end;
      end;
     end;

  Finally
    Dm.fdConferenciaNota.sql.Text := 'ALTER TRIGGER CONFERENCIA_NOTA_BIU0 ACTIVE';
    Dm.fdConferenciaNota.ExecSQL(True);

    Dm.fdConferenciaNota.sql.Text := Sql;
    Dm.CdsConferenciaNota.Close;
  End;

end;

procedure EnviandoUsuarios;
var
 Sql : String;
 LResponse: IResponse;
arrayUsuarios:TJSONArray;
begin
  //envia para a matriz os dados de Clientes

   Sql := Dm.FdUsu.sql.Text;

   Try
    Dm.FdOperadores.sql.Text := 'ALTER TRIGGER USUARIOS_BIU0 INACTIVE';
    Dm.FDOperadores.ExecSQL(True);
   Except
   End;

   Dm.FDUsu.sql.Text := 'UPDATE USUARIOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2');
   Dm.FDUsu.ExecSQL(True);
   Dm.FDUsu.sql.Text := Sql;
   Dm.CdsCeUsu.Open;
   if Dm.CdsCeUsu.RecordCount <> 0 then
    begin
       try
           GravaLog(TimetoStr(Time) + ' - Enviando Usuarios: '+ FloatToStr(Dm.CdsCeUsu.RecordCount));

           //Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(55, Filial, Dm.CdsCeUsu.Data);
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('usuarios')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arrayUsuarios.ToString)
         .Accept('application/json')
         .post;
         FreeAndNil(arrayUsuarios);

            if lresponse.statuscode=200 then
            begin
              Dm.CdsCeUsu.Close;
            end;

       except
          on E:Exception do
            begin

              GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Envio de Usuarios - '+E.Message);

              Try
               Dm.FdOperadores.sql.Text := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
               Dm.fdOperadores.ExecSQL(True);

              Except
               Dm.FdOperadores.SQL.Clear;
               Dm.CdsCeUsu.Close;
              End;

              Exit;
            end;

       end;
    end;

   Dm.FDUsu.sql.Text := 'UPDATE USUARIOS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
   Dm.FDUsu.ExecSQL(True);


   Try

    Dm.FDOperadores.sql.Text := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
    Dm.FDOperadores.ExecSQL(True);

   Except
    Dm.FdOperadores.SQL.Clear;
    Dm.CdsCeUsu.Close;
   End;



end;

function  EnviandoPosicaoEstoque : Boolean;
var
sql:string;
LResponse: IResponse;
arrayPosicaoEstoque:TJSONArray;


begin

   Try

   Result := True;

   Sql := 'SELECT * FROM POSICAOESTOQUEDATA WHERE ENVIADO = ' + QuotedStr('9');

     Dm.CdsPosicaoEstoque.Close;
     Dm.FDPosicaoEstoque.sql.Text := 'INSERT INTO TEMP_POSICAOESTOQUE2 SELECT FIRST 1000 * FROM TEMP_POSICAOESTOQUE';
     Dm.FDPosicaoEstoque.ExecSQL(True);


     Dm.FDPosicaoEstoque.sql.Text := 'UPDATE POSICAOESTOQUEDATA SET ENVIADO = ' + QuotedStr('9') + ' WHERE (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ' ) AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_POSICAOESTOQUE2)';
     Dm.FDPosicaoEstoque.ExecSQL(True);


     Dm.FDPosicaoEstoque.sql.Text := Sql;
     Dm.CdsPosicaoEstoque.FetchParams;
     Dm.CdsPosicaoEstoque.Open;

     if Dm.CdsPosicaoEstoque.RecordCount <> 0 then
      begin
       GravaLog(TimetoStr(Time) + ' - Enviando Posicao de Estoque: ' + FloatToStr(Dm.CdsPosicaoEstoque.RecordCount));
       //Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(63, Filial, Dm.CdsPosicaoEstoque.Data);

       try

         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('precosfilial')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arrayPosicaoEstoque.ToString)
         .Accept('application/json')
         .post;
         FreeAndNil(arrayPosicaoEstoque);


         if lresponse.statuscode=200 then
           begin
             Dm.CdsPosicaoEstoque.Close;
             Dm.fdPosicaoEstoque.sql.Text := 'DELETE FROM TEMP_POSICAOESTOQUE WHERE ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_POSICAOESTOQUE2)';
             Dm.FDPosicaoEstoque.ExecSQL(True);

             Dm.FDPosicaoEstoque.sql.Text := 'UPDATE POSICAOESTOQUEDATA SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
             Dm.FDPosicaoEstoque.ExecSQL(True);

             Dm.FDPosicaoEstoque.sql.Text := 'DELETE FROM TEMP_POSICAOESTOQUE2';
             Dm.FDPosicaoEstoque.ExecSQL(True);
           end;

        Except
           on E:Exception do
            begin
              Result := False;
              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Posicao de Estoque - '+E.Message);
              Dm.CdsPosicaoEstoque.Close;

              Dm.FDPosicaoEstoque.Close;
              Dm.FDPosicaoEstoque.sql.Text := 'DELETE FROM TEMP_POSICAOESTOQUE2';
              Dm.FDPosicaoEstoque.ExecSQL(True);
              Result := False;
              Exit;
            end;

       end;
      end
     else
      Result := False;
     // VerificaConexao('');

  Finally
    Dm.CdsPosicaoEstoque.Close;
  End;

end;

procedure EnviandoContasPagar;
var
 sql:string;
 LResponse: IResponse;
arrayContasPagar:TJSONArray;
begin
  //processamento e envio de Ceduplic.dat

  Sql := Dm.FDDuplic.sql.Text;
  Dm.FDDuplic.sql.Text := 'UPDATE CONTAS_PAGAR SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
  Dm.FDDuplic.ExecSQL;

  Dm.FDDuplic.sql.Text := Sql;
  Dm.CdsCeDuplic.Open;

  if Dm.CdsCeDuplic.RecordCount <> 0 then
   begin
//          VerificaConexao('');
      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Contas a Pagar: '+ FloatToStr(Dm.CdsCeDuplic.RecordCount));

     // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(6, Filial, Dm.CdsCeDuplic.Data);
    try
        LResponse := TRequest.New.BaseURL(dm.BaseUrl )
        .Resource('contaspagar')
        .AcceptEncoding('gzip, deflate')
        .AddBody(arrayContasPagar.ToString)
        .Accept('application/json')
        .post;
        FreeAndNil(arrayContasPagar);


        if lresponse.statuscode=200 then
          begin
            Dm.CdsCeDuplic.First;
            Dm.FDDuplic.sql.Text := 'UPDATE CONTAS_PAGAR SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
            Dm.FDDuplic.ExecSQL;
            Dm.FDDuplic.Close;
          end;

    Except  on E:Exception do
        begin
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Contas Pagar - ' + E.Message);
          Dm.CdsCeDuplic.Close;
          Exit;
        end;


    end;
   end;

end;

procedure EnviandoCompras;
var
 Sql:string;
LResponse: IResponse;
arrayCompras:TJSONArray;
begin

    //processamento e envio de compras

  Sql := Dm.FDPedid1.sql.Text;

  Dm.FDPedid1.sql.Text := 'UPDATE TEMP_COMPRAS SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2') + ')';
  Dm.FDPedid1.ExecSQL;

  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Executada selecao em Temp_Compras');
  Dm.FDPedid1.sql.Text := Sql;
  Dm.CdsCePedid1.Open;


    Try
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando o envio de Itens Compras');
      EnviandoItensCompras; //envia os itens desta Compra
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Finalizado o envio de Itens Compras');
    Except
      on E:Exception do
        begin
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  ItensCompras - ' + E.Message);
          Dm.CdsCePedid1.Close;
          Exit;
        end;
    end;

    if Dm.CdsCePedid1.RecordCount <> 0 then
    begin
     // VerificaConexao('');

      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Compras: ' + FloatToStr(Dm.CdsCePedid1.RecordCount));
      //Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(4, Filial, Dm.CdsCePedid1.Data);

      try
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
           .Resource('compras')
           .AcceptEncoding('gzip, deflate')
           .AddBody(arrayCompras.ToString)
           .Accept('application/json')
           .post;
           FreeAndNil(arrayCompras);

        if lresponse.statuscode=200 then
          begin
            Dm.FDPedid1.sql.Text := 'DELETE FROM TEMP_COMPRAS WHERE ENVIADO = '+QuotedStr('9');
            Dm.FDPedid1.ExecSQL;
          end;
       Except
        on E:Exception do
          begin

            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Compras - ' + E.Message);
            Dm.CdsCePedid1.Close;
            Exit;
          end;

      end;
    end;
  Dm.CdsCePedid1.Close;

end;

procedure EnviandoItensCompras;
var
 LResponse: IResponse;
arrayItensCompras:TJSONArray;
begin
   //processamento e envio de Cepedido.dat

  Dm.CdsCePedido.Close;
  Dm.CdsCePedido.Open;

  if Dm.CdsCePedido.RecordCount <> 0 then
   begin
     // VerificaConexao('');
      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando ItensCompras do Pedido ' + Dm.CdsCePedid1CD_COMPRAS.AsString);


     // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(5, Filial, Dm.CdsCePedido.Data);
      try
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('itenscompras')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arrayItensCompras.ToString)
         .Accept('application/json')
         .post;
         FreeAndNil(arrayItensCompras);
         if lresponse.statuscode=200 then
          begin
           Dm.CdsCePedido.Close;
          end;
       Except
        on E:Exception do
          begin

            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Itens Compras - '+E.Message);
            Dm.CdsCePedido.Close;
            Exit;
          end;

      end;
   end;
  Dm.CdsCePedido.Close;

end;

procedure EnviandoItensComprasLote;
var
 sql: string;
 LResponse: IResponse;
 arrayCadernoFaltas:TJSONArray;
begin

  Sql := Dm.FDLotesItensCompra.sql.Text;
  Try
    Dm.FDLotesItensCompra.sql.Text := 'UPDATE TEMP_ITENS_COMPRA_LOTE SET ENVIADO = ''' + '9' + ''' WHERE (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ')';
    Dm.FDLotesItensCompra.ExecSQL(True);
  Except
    Dm.FDLotesItensCompra.SQL.Clear;
  End;

  Dm.FDLotesItensCompra.sql.Text := Sql;
  Dm.CdsLotesItensCompra.Close;

  Dm.CdsLotesItensCompra.Open;
  //GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - LotesItensCompras : ' + Sql);
  GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Regsitros encontrados LotesItensCompras : ' + InttoStr(Dm.CdsLotesItensCompra.RecordCount));

  if Dm.CdsLotesItensCompra.RecordCount <> 0 then
   begin

      try

       // VerificaConexao('');
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando LotesItensCompras do Pedido ' + Dm.CdsLotesItensCompraCD_COMPRAS.AsString);
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
        .Resource('precosfilial')
        .AcceptEncoding('gzip, deflate')
        .AddBody(arrayCadernoFaltas.ToString)
        .Accept('application/json')
        .post;
        FreeAndNil(arrayCadernoFaltas);

       //Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(68, Filial, Dm.CdsLotesItensCompra.Data);

        if lresponse.statuscode=200 then
         begin
            Dm.CdsLotesItensCompra.Close;
         end;

      Except
        on E:Exception do
          begin
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Lotes Itens Compras - '+E.Message);
            Dm.CdsLotesItensCompra.Close;
            Exit;
          end;

      end;

   end;

  Sql := Dm.FDLotesItensCompra.sql.Text;
  Try
    Dm.FDLotesItensCompra.sql.Text := 'DELETE FROM TEMP_ITENS_COMPRA_LOTE WHERE ENVIADO = ' + QuotedStr('9');
    Dm.FDLotesItensCompra.ExecSQL(True);
  Except
    Dm.FDLotesItensCompra.SQL.Clear;
  End;
  Dm.FDLotesItensCompra.sql.Text := Sql;
  Dm.CdsLotesItensCompra.Close;


end;

procedure EnviandoContasPagarCompras;
var
 LResponse: IResponse;
arrayContaspagarCompras:TJSONArray;

begin
 //processamento e envio de ContasPagarCompras

  Dm.CdsContasPagarCompras.Close;
  Dm.CdsContasPagarCompras.Open;

  if Dm.CdsContasPagarCompras.RecordCount <> 0 then
   begin
     // VerificaConexao('');

      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando ContasPagarCompras : ' + InttoStr(Dm.CdsContasPagarCompras.RecordCount));
    try
//       Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(71, Filial, Dm.CdsContasPagarCompras.Data);
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('contaspagarcompras')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arrayContaspagarCompras.ToString)
         .Accept('application/json')
         .post;
         FreeAndNil(arrayContaspagarCompras);


      if lresponse.statuscode=200 then
       begin
          Dm.CdsContasPagarCompras.Close;
       end;
     Except
        on E:Exception do
          begin
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  ContasPagarCompras - '+E.Message);
            Dm.CdsContasPagarCompras.Close;
            Exit;
          end;
    end;

   end;

  Dm.CdsComprasBoletos.Close;

end;

procedure EnviandoSintegraNotas;
var
 sql:string;
 LResponse: IResponse;
 arrayEnviandoSintegraNotas:TJSONArray;

begin

   //processamento e envio de SintegraNotas


  Sql := Dm.FDSintegraNF.sql.Text;
  Dm.FDSintegraNF.sql.Text := 'UPDATE SINTEGRA_NF_ENTRADA SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');

  Dm.FDSintegraNF.ExecSQL;
  Dm.FDSintegraNF.sql.Text := Sql;
  Dm.CdsSintegraNF.Open;

  if Dm.CdsSintegraNF.RecordCount <> 0 then
   begin

      //VerificaConexao('');

      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra Notas: '+ FloatToStr(Dm.CdsSintegraNF.RecordCount));

       // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(56, Filial, Dm.CdsSintegraNF.Data);
      try
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('sintegranf')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arrayEnviandoSintegraNotas.ToString)
         .Accept('application/json')
         .post;
         FreeAndNil(arrayEnviandoSintegraNotas);

        if lresponse.statuscode=200 then
          begin
            Dm.CdsSintegraNF.First;
            Dm.FDSintegraNF.sql.Text := 'UPDATE SINTEGRA_NF_ENTRADA SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
            Dm.FDSintegraNF.ExecSQL;
            Dm.FDSintegraNF.Close;
          end;

      Except
          on E:Exception do
            begin

              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra Notas - ' + E.Message);
              Dm.CdsSintegraNF.Close;
              Exit;
            end;

      end;

   end;
  Dm.CdsSintegraNF.Close;

end;

procedure EnviandoSintegraNotasItens;
var
 sql:string;
 LResponse: IResponse;
 arraySintegraNotasItens:TJSONArray;
begin

  //processamento e envio de sintegranotasitens

  Sql := Dm.FDSintegraItensNF.sql.Text;
  Dm.FDSintegraItensNF.sql.Text := 'UPDATE SINTEGRA_NF_ENTRADA_ITENS SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
  Dm.FDSintegraItensNF.ExecSQL;

  Dm.FDSintegraItensNF.sql.Text := Sql;
  Dm.CdsSintegraItensNF.Open;

  if (Dm.CdsSintegraItensNF.RecordCount <> 0) and (Dm.CdsSintegraItensNF.RecordCount < 10000)  then
   begin
    //  VerificaConexao('');
      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra Notas Itens: '+ FloatToStr(Dm.CdsSintegraItensNF.RecordCount));

       // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(57, Filial, Dm.CdsSintegraItensNF.Data);
      try
         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('precosfilial')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arraySintegraNotasItens.ToString)
         .Accept('application/json')
         .post;
         FreeAndNil(arraySintegraNotasItens);



        if lresponse.statuscode=200 then
          begin
            Dm.CdsSintegraItensNF.First;
            Dm.FDSintegraItensNF.sql.Text := 'UPDATE SINTEGRA_NF_ENTRADA_ITENS SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
            Dm.FDSintegraItensNF.ExecSQL;
            Dm.FDSintegraItensNF.Close;
          end;

       Except
          on E:Exception do
            begin

              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra Notas Itens - ' + E.Message);
              Dm.CdsSintegraItensNF.Close;
              Exit;
            end;

      end;

   end;

  Dm.CdsSintegraItensNF.Close;


end;

end.
