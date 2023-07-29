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

    Function StrTran( cString, cProcura, cTroca : string ): string;
          // Envio //
    function  EnviarContasReceber : Boolean;
    function  EnviarProdutosLotes : Boolean;
    function  EnviarProdutosLotesST : Boolean;
    function  EnviandoEstoque : Boolean;
    function  EnviandoClientes: Boolean;
    function  EnviandoPosicaoEstoque : Boolean;
    procedure EnvioLancamentos;
    procedure EnvioLancamentosAPrazo;{Lancamentos a prazo}
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
    procedure EnviandoUsuarios;
    procedure EnviandoVendasItensExcluidos;
     {  Sintegra  }
    procedure EnviandoSintegraNotas;
    procedure EnviandoSintegraNotasItens;
    procedure EnviandoSintegraPedidos;
    procedure EnviandoSintegraR60;
    procedure EnviandoSintegraR60I;
       //recebimento//
    procedure RecebendoItensTransfer;
    procedure RecebendoTransfer;
    procedure RecebendoProdutosQuantidade;
    procedure RecebendoProdutosFP;
    procedure RecebendoProdutosFidelidade;
    procedure RecebendoProdutosFidelidadeDeletados;
    procedure RecebendoProdutosQuantidadeDeletados;
    procedure RecebendoProdutosDeletados;
    function  BuscaMatrizProdutosIncluidos : Boolean;
    function  RecebendoCadastro : Boolean;
    function  RecebendoEstoques : Boolean;
    Function  RecebendoPrecos : Boolean;



       {consistencia}
    procedure ConsistenciaDados;
    procedure MontaSQL_Precos(Filial : String);
    procedure CriaCamposPrecos(sFilial : String);
    function  SetaEnviado9 : Boolean;


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
                 GeraLog('Erro no envio de cliente:');
                 Result := False;
                end;

         end;
      end
     else
      begin
        Result := False;
      end;

  finally
     dm.Query.SQL.Clear;
  end;



end;

function  EnviarContasReceber : Boolean;
var
Sql: String;
LResponse: IResponse;
arrayconstasreceber :TJSONArray;
begin

  //processamento e envio de contas receber
 
   try
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

         Except  on E:Exception do
             begin
                GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Contas a Receber - ' +LResponse.Content );
               dm.Query.SQL.Clear;
               dm.Query.SQL.Add('ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE');
               dm.Query.ExecSQL(false);

               Result := False;
             end;            

         end ;
         
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

procedure EnvioLancamentos;
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
                                  'SUM(ESTOQUE_' + FloatToStr(dM.cdfilialparametro)+ ') AS N_UNIDADES, ' +
                                  'SUM(CAST(CAST(CUSTO_UNITARIO_' + FloatToStr(DM.cdfilialparametro) + ' AS NUMERIC(10,2)) AS DOUBLE PRECISION)) AS T_CUSTO, ' +
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

procedure EnvioLancamentosAPrazo;
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
       Dm.CdsCeLotes2.Params[0].AsFloat :=dm.cdfilialparametro;
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
                                     ' COMISSAO, CUSTO_UNITARIO, CUSTO_UNITARIO_' + FloatToStr(dm.cdfilialparametro) + ', CUSTO_MEDIO, CUSTO_MEDIO_' + FloatToStr(dm.cdfilialparametro) +
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
              'SELECT PRODUTOS.ID_PRODUTO, PRODUTOS.ESTOQUE_' + FloatToStr(dm.cdfilialparametro) + ', ' +
              '       PRODUTOS.DT_ULT_VENDA_'        + FloatToStr(dm.cdfilialparametro) + ' ,' +
              '       PRODUTOS.DT_ULT_COMPRA_'       + FloatToStr(dm.cdfilialparametro) + ', ' +
              '       CAST(PRODUTOS.CUSTO_UNITARIO_' + FloatToStr(dm.cdfilialparametro) + ' AS NUMERIC(10,2)) AS CUSTO_UNITARIO_' + FloatToStr(dm.cdfilialparametro) + ', ' +
              '       CAST(PRODUTOS.CUSTO_MEDIO_'    + FloatToStr(dm.cdfilialparametro) + ' AS NUMERIC(10,2)) AS CUSTO_MEDIO_' + FloatToStr(dm.cdfilialparametro) + ', ' +
              '       PRODUTOS.FACE_'                + FloatToStr(dm.cdfilialparametro) + ', IDENTIFICADOR FROM PRODUTOS, TEMP_PRODUTOS2 ' +
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
LResponse: IResponse;
arrayCadernoFaltas:TJSONArray;
begin

   Try
     Dm.CdsPrecoVenda.Close;
     MontaSQL_Precos(FloatToStr(dm.cdfilialparametro));
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
  CriaCamposPrecos(FloatToStr(dm.cdfilialparametro));

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

procedure EnviandoSintegraPedidos;
var
  sql:string;
   LResponse: IResponse;
   arraySintegraPedidos:TJSONArray;
begin

 Sql := Dm.FDSintegraPedidos.sql.Text;
  Dm.FDSintegraPedidos.sql.Text := 'UPDATE SINTEGRA_PEDIDOS_ITENS SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
 Dm.FDSintegraPedidos.ExecSQL;

  Dm.FDSintegraPedidos.sql.Text := Sql;
  Dm.CdsSintegraPedidos.Open;

  if Dm.CdsSintegraPedidos.RecordCount <> 0 then
   begin
     // VerificaConexao('');
      //Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(58, Filial, Dm.CdsSintegraPedidos.Data);

      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra Pedidos: '+ FloatToStr(Dm.CdsSintegraPedidos.RecordCount));

      try

       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('sintegrapedidos')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arraySintegraPedidos.ToString)
       .Accept('application/json')
       .post;
        FreeAndNil(arraySintegrapedidos);

        if LResponse.StatusCode=200  then
          begin
            Dm.CdsSintegraPedidos.First;
            Dm.FDSintegraPedidos.sql.Text := 'UPDATE SINTEGRA_PEDIDOS_ITENS SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
            Dm.FDSintegraPedidos.ExecSQL;
            Dm.FDSintegraPedidos.Close;
          end;
      Except  on E:Exception do
              begin
                GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra Pedidos - ' + E.Message);
                Dm.CdsSintegraPedidos.Close;
                Exit;
              end;

      end;
   end;

 Dm.CdsSintegraPedidos.Close;

end;

procedure EnviandoSintegraR60;
var
sql :string;
LResponse: IResponse;
arraySintegraR60:TJSONArray;
begin

  Sql := Dm.FDSintegraR60.sql.Text;
  Dm.FDSintegraR60.sql.Text := 'UPDATE SINTEGRA_R60 SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');

  Dm.FDSintegraR60.ExecSQL;
  Dm.FDSintegraR60.sql.Text := Sql;
  Dm.CdsSintegraR60.Open;

  if Dm.CdsSintegraR60.RecordCount <> 0 then
   begin
     // VerificaConexao('');
     // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(59, Filial, Dm.CdsSintegraR60.Data);

     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra R60: '+ FloatToStr(Dm.CdsSintegraR60.RecordCount));
      try
        LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('precosfilial')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arraySintegraR60.ToString)
       .Accept('application/json')
       .post;
       FreeAndNil(arraySintegraR60);

        if LResponse.StatusCode=200 then
          begin
            Dm.CdsSintegraR60.First;
            Dm.FDSintegraR60.sql.Text := 'UPDATE SINTEGRA_R60 SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
            Dm.FDSintegraR60.ExecSQL;
            Dm.FDSintegraR60.Close;
          end;
      Except  on E:Exception do
            begin
              GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra R60 - ' + E.Message);
              Dm.CdsSintegraR60.Close;
              Exit;
            end;

      end;
   end;
  Dm.CdsSintegraR60.Close;

end;

procedure EnviandoSintegraR60I;
var
sql :string;
 LResponse: IResponse;
 arraySintegraR60I:TJSONArray;
begin
  Sql := Dm.FDSintegraR60I.sql.Text;
  Dm.FDSintegraR60I.sql.Text := 'UPDATE SINTEGRA_R60I SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
  Dm.FDSintegraR60I.ExecSQL;
  Dm.FDSintegraR60I.sql.Text := Sql;
  Dm.CdsSintegraR60I.Open;

  if Dm.CdsSintegraR60I.RecordCount <> 0 then
   begin
    //  VerificaConexao('');
    //  Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(60, Filial, Dm.CdsSintegraR60I.Data);
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra R60I: '+ FloatToStr(Dm.CdsSintegraR60I.RecordCount));
      try
       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('precosfilial')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arraySintegraR60I.ToString)
       .Accept('application/json')
       .post;
       FreeAndNil(arraySintegraR60I);

        if LResponse.StatusCode=200 then
          begin
            Dm.CdsSintegraR60I.First;
            Dm.FDSintegraR60I.sql.Text := 'UPDATE SINTEGRA_R60I SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
            Dm.FDSintegraR60I.ExecSQL;
            Dm.FDSintegraR60I.Close;
          end;
      Except on E:Exception do
              begin
                GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra R60I - ' + E.Message);
                Dm.CdsSintegraR60I.Close;
                Exit;
              end;


      end;

   end;

Dm.CdsSintegraR60I.Close;

end;

procedure EnviandoVendasItensExcluidos;
var
sql :string;
LResponse: IResponse;
arrayEnvioVendasItensExcluidos:TJSONArray;
begin

  Dm.CdsVendasItensExcluidos.Close;
  Sql := Dm.FDVendasItensExcluidos.sql.Text;
  Dm.FDConferenciaNota.sql.Text := 'ALTER TRIGGER VENDAS_ITENS_EXCLUIDOS_BI0 INACTIVE';
  Dm.FDConferenciaNota.ExecSQL(True);

  Dm.FDVendasItensExcluidos.sql.Text := 'UPDATE VENDAS_ITENS_EXCLUIDOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2');
  Dm.FDVendasItensExcluidos.ExecSQL(True);
  Dm.FDVendasItensExcluidos.sql.Text := Sql;
  Dm.CdsVendasItensExcluidos.Open;

  if Dm.CdsVendasItensExcluidos.RecordCount <> 0 then
   begin
     // VerificaConexao('');
      GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando VendasItensExcluidos : ' + InttoStr(Dm.CdsVendasItensExcluidos.RecordCount));
     // Dados := (Dm.HTTPRIO1 as IDmProcessa).Processa(72, Filial, Dm.CdsVendasItensExcluidos.Data);

     try
      LResponse := TRequest.New.BaseURL(dm.BaseUrl )
      .Resource('precosfilial')
      .AcceptEncoding('gzip, deflate')
      .AddBody(arrayEnvioVendasItensExcluidos.ToString)
      .Accept('application/json')
      .post;
       FreeAndNil(arrayEnvioVendasItensExcluidos);


      if LResponse.StatusCode=200 then
      begin
          Dm.CdsVendasItensExcluidos.Close;
      end;

     Except   on E:Exception do
            begin
             Dm.FDConferenciaNota.sql.Text := 'ALTER TRIGGER VENDAS_ITENS_EXCLUIDOS_BI0 ACTIVE';
             Dm.FDConferenciaNota.ExecSQL(True);

             GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  VendasItensExcluidos - '+E.Message);
             Dm.CdsVendasItensExcluidos.Close;
              Exit;
            end;

     end;
   end;

  Dm.CdsVendasItensExcluidos.Close;
  Sql := Dm.FDVendasItensExcluidos.sql.Text;
  Dm.FDVendasItensExcluidos.sql.Text := 'UPDATE VENDAS_ITENS_EXCLUIDOS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO <> ' + QuotedStr('9');
  Dm.FDVendasItensExcluidos.ExecSQL(True);

  Dm.FDConferenciaNota.sql.Text := 'ALTER TRIGGER VENDAS_ITENS_EXCLUIDOS_BI0 ACTIVE';
  Dm.FDConferenciaNota.ExecSQL(True);
  Dm.CdsVendasItensExcluidos.Close;

end;

function SetaEnviado9 : Boolean;
begin

  Result := True;
  Try
    Dm.CdsCeProdutos.Close;
    Dm.FDCeProdutos.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
    Dm.CdsCeProdutos.Params.Clear;
    Dm.FDCeProdutos.ExecSQL(True);
  Except
    GravaLog(TimetoStr(Time) + ' - Não foi possível desativar a trigger TG_AT_DT_ALTERACAO_PRODUTO.');
    Result := False;
  End;

  if not Result then
    Exit;

  Try
      Dm.CdsCeProdutos.Close;
      Dm.FDCeProdutos.sql.Text := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 ID_PRODUTO, ID_PRODUTO, ID_PRODUTO, STATUS FROM PRODUTOS ' +
                                                  'WHERE ((ENVIADO <> '+ QuotedStr('2') +') OR (ENVIADO IS NULL))';
      Dm.FDCeProdutos.ExecSQL(True);

      Dm.CdsCeProdutos.Close;
      Dm.FDCeProdutos.sql.Text := 'UPDATE PRODUTOS SET ENVIADO = '+''''+'9'+''''+' WHERE ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2)';

      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Seta Enviado 9  - ' + InttoStr(Dm.FDCeProdutos.ExecSQL(True)));
      Dm.CdsCeProdutos.Close;
      Dm.FDCeProdutos.sql.Text := 'DELETE FROM TEMP_PRODUTOS2';
      Dm.FDCeProdutos.ExecSQL(True);

  Except
      on E:Exception do
       begin
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - SetaEnviado9 - '+ E.Message);
        Result := False;
       end;
  End;

  if not Result then
     Exit;

  //Habilita a TRIGGER de alteracao de produtos
  Try
    Dm.CdsCeProdutos.Close;
    Dm.FDCeProdutos.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
    Dm.CdsCeProdutos.Params.Clear;
    Dm.FDCeProdutos.ExecSQL(True);
  Except
    GravaLog(TimetoStr(Time) + ' - Não foi possível ativar a trigger TG_AT_DT_ALTERACAO_PRODUTO.');
    Result := False;
  End;


end;

procedure RecebendoItensTransfer;
var
 i : integer;
LResponse: IResponse;
arraItensTrasnfer:TJSONArray;
begin

  //Busca na matriz ItensTransfer

   Try
     Dm.CdsItensTransfer.Close;
     Dm.CdsItensTransfer.CreateDataSet;

     //DAdos := (Dm.HTTPRIO1 AS IDmProcessa).Processa(118, Filial, 'A');

     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
     .Resource('itensTransfer')
     .AcceptEncoding('gzip, deflate')
     .AddBody(arraItensTrasnfer.ToString)
     .Accept('application/json')
     .get;
     FreeAndNil(arraItensTrasnfer);

     if LResponse.StatusCode<>200 then
      begin   Exit;
      end
      else
      begin

       Dm.CdsItensTransfer.Data := LResponse.Content;
       Dm.CdsItensTransfer.Open; // virtual
       Dm.CdsItensTransfer.First;
       if Dm.CdsItensTransfer.RecordCount > 0 then
          begin
             GravaLog(TimetoStr(Time) + ' - Itens_Transfer Recebidos: ' + FloatToStr(Dm.CdsItensTransfer.RecordCount));

             while not Dm.CdsItensTransfer.Eof do
              begin
                 Dm.QryItensTransfer.Close;
                 Dm.QryItensTransfer.Params[0].AsFloat := Dm.CdsItensTransferCD_TRANSFER.AsFloat;
                 Dm.QryItensTransfer.Params[1].AsFloat := Dm.CdsItensTransferID_PRODUTO.AsFloat;
                 Dm.QryItensTransfer.Open;

                 if Dm.QryItensTransfer.RecordCount = 0 then
                    Dm.QryItensTransfer.Append
                 else
                  begin
                     if Dm.QryItensTransferSTATUS.AsString = 'G' then
                      begin
                        if Dm.CdsItensTransferSTATUS.AsString <> 'G' then
                           Dm.QryItensTransfer.Edit;
                      end
                     else
                     if Dm.QryItensTransferSTATUS.AsString = 'E' then
                      begin
                        if (Dm.CdsItensTransferSTATUS.AsString = 'C') or (Dm.CdsItensTransferSTATUS.AsString = 'X') then
                           Dm.QryItensTransfer.Edit;
                      end;
                  end;
                 if Dm.QryItensTransfer.State in [dsInsert, dsEdit] then
                  begin
                     for i := 0 to Dm.QryItensTransfer.FieldCount - 1 do
                       Dm.QryItensTransfer.Fields[i].Value := Dm.CdsItensTransfer.Fields[i].Value;
                       Dm.QryItensTransfer.ApplyUpdates(0);

                  end;
                 Dm.CdsItensTransfer.Next;
              end;

             Dm.CdsItensTransfer.Close;
             Dm.QryItensTransfer.Close;
          end;

      end;

   Except
      on E:Exception do
       begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Itens Transferencias - '+ E.Message);
         Dm.CdsItensTransfer.Close;
         Dm.CdsItensTransfer.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoTransfer;
var
   i : integer;
LResponse: IResponse;
arrayTransfer:TJSONArray;

begin   

  //Busca na matriz Transfer
   Try
   
     Dm.CdsTransfer.Close;
     Dm.CdsTransfer.CreateDataSet;  
          
    // Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(117, Filial, 'A');    
         
       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('transfer')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arrayTransfer.ToString)
       .Accept('application/json')
       .get;
        FreeAndNil(arrayTransfer);

       if LResponse.StatusCode<>200 then
        begin         
          Exit;
      
        end
        else
        begin  
    
        
           Dm.CdsTransfer.Data := LResponse.Content;
           Dm.CdsTransfer.Open; 

           if Dm.CdsTransfer.RecordCount <> 0 then
            begin
               GravaLog(TimetoStr(Time) + ' - Transferencias Recebidas: ' + FloatToStr(Dm.CdsTransfer.RecordCount));
               Dm.CdsTransfer.First;
               while not Dm.CdsTransfer.Eof do
                begin
                   Dm.QryTransfer.Close;
                   Dm.QryTransfer.Params[0].AsFloat := Dm.CdsTransferCD_TRANSFER.AsFloat;                
                   Dm.QryTransfer.Open;                  

                   if Dm.QryTransfer.RecordCount = 0 then
                      Dm.QryTransfer.Append
                   else
                    begin
                      if Dm.QryTransferSTATUS.AsString = 'G' then
                       begin
                         if Dm.CdsTransferSTATUS.AsString <> 'G' then
                            Dm.QryTransfer.Edit;
                       end
                      else
                      if Dm.QryTransferSTATUS.AsString = 'E' then
                       begin
                         if (Dm.CdsTransferSTATUS.AsString = 'C') or (Dm.CdsTransferSTATUS.AsString = 'X') then
                            Dm.QryTransfer.Edit;
                       end;
                    end;
                   if Dm.QryTransfer.State in [dsEdit, dsInsert] then
                    begin
                       for i := 0 to Dm.QryTransfer.FieldCount - 1 do
                           Dm.QryTransfer.Fields[i].Value := Dm.CdsTransfer.Fields[i].Value;
                       Dm.QryTransfer.Post; 
                       Dm.QryTransfer.ApplyUpdates(0);                
                    end;
                
                   Dm.CdsTransfer.Next;
                end;
            end;
      
        end;
  
    
     
   Except
      on E:Exception do
       begin         
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Transferencias - '+ E.Message);
         Dm.CdsTransfer.Close;
         Dm.QryTransfer.Close;

         Try
           Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';        
           Dm.query.ExecSQL(True);       
         Except
           Dm.query.sql.clear;
         End;

         Exit;
       end;
   end;
  Dm.CdsTransfer.Close;
  Dm.QryTransfer.Close;


end;

procedure RecebendoProdutosQuantidade;
var
  LResponse: IResponse;
  arraySintegraNotasItens:TJSONArray;
begin

   Try
     // Atualização dos Produtos Quantidade
     
     Dm.CdsProdutosQuantidade.Close;
     Dm.CdsProdutosQuantidade.CreateDataSet;
    // Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(154, Filial, 'A');


     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
     .Resource('produtoquantidade')
     .AcceptEncoding('gzip, deflate')
     .AddBody(arraySintegraNotasItens.ToString)
     .Accept('application/json')
     .get;
     FreeAndNil(arraySintegraNotasItens);

     if LResponse.StatusCode<>200 then
      begin          
       Exit;         
      end
      else
      begin     
    
       Dm.CdsProdutosQuantidade.Data := LResponse.Content;
       Dm.CdsProdutosQuantidade.Open; // virtual
       Dm.CdsProdutosQuantidade.First;
       GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Quantidade: '+ FloatToStr(Dm.CdsProdutosQuantidade.RecordCount));
       while not Dm.CdsProdutosQuantidade.Eof do
        begin
            Dm.FDAtualizaProdutosQuantidade.Params[0].AsFloat := Dm.CdsProdutosQuantidadeID_PRODUTO.AsFloat;
            Dm.FDAtualizaProdutosQuantidade.Params[1].AsFloat := Dm.CdsProdutosQuantidadeQUANTIDADEINICIAL.AsFloat;
            Dm.FDAtualizaProdutosQuantidade.Params[2].AsFloat := Dm.CdsProdutosQuantidadePRECO_VENDA.AsFloat;
          
            Try
              Dm.FDAtualizaProdutosQuantidade.ExecSQL(False);
          
            Except
               on E:Exception do
                begin                  
                  GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos preço quantidade - '+E.Message);
                end;
            End;

            Dm.CdsProdutosQuantidade.Next;
        end;
      end;
     Dm.CdsProdutosQuantidade.Close;
   Except
      on E:Exception do
       begin          
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Quantidade');
         Dm.CdsProdutosQuantidade.Close;
         Exit;
       end;
   end;

end;

procedure RecebendoProdutosFP;
var
LResponse: IResponse;
 arraySintegraNotasItens:TJSONArray;
begin

   Try
       // Atualização dos Produtos Farmacia Popular
       Dm.CdsProdutosFP.Close;
       Dm.CdsProdutosFP.CreateDataSet;
       LResponse := TRequest.New.BaseURL(dm.BaseUrl )
       .Resource('produtosfp')
       .AcceptEncoding('gzip, deflate')
       .AddBody(arraySintegraNotasItens.ToString)
       .Accept('application/json')
       .get;
       FreeAndNil(arraySintegraNotasItens);


      // Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(155, Filial, 'A');
       if LResponse.StatusCode=200 then
        begin

           Dm.CdsProdutosFP.Data := LResponse.Content;
           Dm.CdsProdutosFP.Open; // virtual

           Dm.CdsProdutosFP.First;
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Farmacia Popular : '+ FloatToStr(Dm.CdsProdutosFP.RecordCount));
           while not Dm.CdsProdutosFP.Eof do
            begin
                Dm.FdAtualizaProdutosFP.Params[0].AsFloat := Dm.CdsProdutosFPID_PRODUTO.AsFloat;
                Dm.FdAtualizaProdutosFP.Params[1].AsString := Dm.CdsProdutosFPCD_PRODUTO.AsString;
                Dm.FdAtualizaProdutosFP.Params[2].AsFloat := Dm.CdsProdutosFPCD_LABORATORIO.AsFloat;
                Dm.FdAtualizaProdutosFP.Params[3].AsString := Dm.CdsProdutosFPDESCRICAO.AsString;
                Dm.FdAtualizaProdutosFP.Params[4].AsFloat := Dm.CdsProdutosFPPRECO.AsFloat;
                Dm.FdAtualizaProdutosFP.Params[5].AsString := Dm.CdsProdutosFPUSAPRECOLOJA.AsString;
                Try
                  Dm.FdAtualizaProdutosFP.ExecSQL(False);
                Except
                   on E:Exception do
                    begin
                      GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos farmacia popular - '+E.Message);
                    end;
                End;

                Dm.CdsProdutosFP.Next;
            end;

        end
        else
        begin
         Exit;
        end;

    Dm.CdsProdutosFP.Close;
     Except
        on E:Exception do
         begin

           GravaLog(TimetoStr(Time) + ' - ' + E.Message);
           GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Farmacia Popular');
           Dm.CdsProdutosFP.Close;
           Exit;
         end;
    end;
end;

procedure RecebendoProdutosFidelidade;
var
LResponse: IResponse;
 arrayprodutosfidelidade:TJSONArray;
begin
  Try
     // Atualização dos Produtos Fidelidade
     Dm.CdsProdutosFidelidade.Close;
     Dm.CdsProdutosFidelidade.CreateDataSet;

    // Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(158, Filial, 'A');

    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('produtosfidelidade')
    .AcceptEncoding('gzip, deflate')
    .AddBody(arrayprodutosfidelidade.ToString)
    .Accept('application/json')
    .get;
    FreeAndNil(arrayprodutosfidelidade);
    if LResponse.StatusCode =200 then
    begin
     Dm.CdsProdutosFidelidade.LoadFromJSON(LResponse.Content) ;
     Dm.CdsProdutosFidelidade.Open; // virtual
     Dm.CdsProdutosFidelidade.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Fidelidade : '+ FloatToStr(Dm.CdsProdutosFidelidade.RecordCount));
     while not Dm.CdsProdutosFidelidade.Eof do
      begin
          Dm.FDAtualizaProdutosFidelidade.Params[0].AsFloat := Dm.CdsProdutosFidelidadeID_PRODUTO.AsFloat;
          Dm.FDAtualizaProdutosFidelidade.Params[1].AsString := Dm.CdsProdutosFidelidadeCD_PRODUTO.AsString;
          Dm.FDAtualizaProdutosFidelidade.Params[2].AsFloat := Dm.CdsProdutosFidelidadeCD_LABORATORIO.AsFloat;
          Dm.FDAtualizaProdutosFidelidade.Params[3].AsString := Dm.CdsProdutosFidelidadeDESCRICAO.AsString;
          Dm.FDAtualizaProdutosFidelidade.Params[4].AsFloat := Dm.CdsProdutosFidelidadePRECO.AsFloat;
          Dm.FDAtualizaProdutosFidelidade.Params[5].AsFloat := Dm.CdsProdutosFidelidadeCD_GRUPO.AsFloat;
          Dm.FDAtualizaProdutosFidelidade.Params[6].AsDateTime := Dm.CdsProdutosFidelidadeDT_ALTERACAO.AsDateTime;
          Try
            Dm.FDAtualizaProdutosFidelidade.ExecSQL(False);
          Except
             on E:Exception do
              begin
                //;
                GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos fidelidade - '+E.Message);
              end;
          End;

          Dm.CdsProdutosFidelidade.Next;
      end;

     Dm.CdsProdutosFidelidade.Close;
    end
    else
    begin
     Exit;
    end;

   Except
      on E:Exception do
       begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Fidelidade');
         Dm.CdsProdutosFidelidade.Close;
         Exit;
       end;
   end;

end;

function RecebendoCadastro : Boolean;
var
LResponse: IResponse;
arrayFiliais:TJSONArray;
begin
     //busca cadastro na matriz

    Try
     // Atualiza produtos
     Result := True;
     Dm.CdsFiliais.Close;
     Dm.CdsFiliais.Params[0].AsFloat :=dm.cdfilialparametro;
     Dm.CdsFiliais.Open;
     Dm.CdsFiliais.First;
     Dm.CdsCadastro.Close;

    // Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(119, cdfilialparametro, 'A');

     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
     .Resource('precosfilial')
     .AcceptEncoding('gzip, deflate')
     .AddBody(arrayFiliais.ToString)
     .Accept('application/json')
     .get;
     FreeAndNil(arrayFiliais);

     if LResponse.StatusCode=200 then
      begin
         Dm.CdsCadastro.Data := LResponse.Content;
         Dm.CdsCadastro.Open; // virtual
         if Dm.CdsCadastro.RecordCount > 0 then
          begin
             Try
               GravaLog(TimetoStr(Time) + ' - ' + IntToStr(Dm.CdsCadastro.RecordCount) + ' cadastros recebidos.');
               Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
               Dm.query.ExecSQL(True);
             Except
               Dm.query.sql.Clear;
             End;

             Dm.CdsCadastro.First;
             while not Dm.CdsCadastro.Eof do
              begin
                 //GravaLog(TimetoStr(Time) + ' - ' + (Dm.CdsCadastro.RecordCount) + ' cadastro recebido - Processado item: '+ FloatToStr(Dm.CdsCadastro.RecNo));
                 Dm.query.sql.Text := 'UPDATE PRODUTOS SET ' +
                                     ' CD_PRODUTO = '      + QuotedStr(Dm.CdsCadastro.FieldByName('CD_PRODUTO').AsString) + ' , ' +
                                     ' CD_LABORATORIO = '  + Dm.CdsCadastro.FieldByName('CD_LABORATORIO').AsString + ' , ' +
                                     ' CD_GRUPO = '        + Dm.CdsCadastro.FieldByName('CD_GRUPO').AsString + ' , ' +
                                     ' CD_CLASSE = '       + Dm.CdsCadastro.FieldByName('CD_CLASSE').AsString + ' , ' +
                                     ' CD_GRUPOBALANCO = ' + Dm.CdsCadastro.FieldByName('CD_GRUPOBALANCO').AsString + ' , ' +
                                     ' CD_GRUPOCOMPRA = '  + Dm.CdsCadastro.FieldByName('CD_GRUPOCOMPRA').AsString + ' , ' +
                                     ' CODIGO_BARRAS_1 = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CODIGO_BARRAS_1').AsString) + ' , ' +
                                     ' DESCRICAO = '       + QuotedStr(Dm.CdsCadastro.FieldByName('DESCRICAO').AsString) + ' , ' +
                                     ' TIPO_PRODUTO = '    + QuotedStr(Dm.CdsCadastro.FieldByName('TIPO_PRODUTO').AsString) + ' , ' +
                                     ' UNIDADE = '         + QuotedStr(Dm.CdsCadastro.FieldByName('UNIDADE').AsString) + ' , ' +
                                     ' STATUS = '          + QuotedStr(Dm.CdsCadastro.FieldByName('STATUS').asString) + ' , ' +
                                     ' ESTOQUE_MINIMO_'    + FloatToStr(dm.cdfilialparametro) + ' = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('ESTOQUE_MINIMO').asString, '.', ''), ',', '.') + ' , ' +
                                     ' ESTOQUE_MAXIMO_'    + FloatToStr(dm.cdfilialparametro) + ' = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('ESTOQUE_MAXIMO').asString, '.', ''), ',', '.') + ' , ' +
                                     ' MEDIAF_'            + FloatToStr(dm.cdfilialparametro) + ' = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('MEDIAF').asString, '.', ''), ',', '.') + ' , ' +
                                     ' CURVA_UNITARIA_'    + FloatToStr(dm.cdfilialparametro) + ' = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CURVA_UNITARIA').asString) + ' , ' +
                                     ' CURVA_FINANCEIRA_'  + FloatToStr(dm.cdfilialparametro) + ' = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CURVA_FINANCEIRA').asString);


                 //gravacao dos estoques das demais filiais...
                 while not (Dm.CdsFiliais.Eof) do
                  begin
                    try
                      Dm.query.sql.Text := Dm.query.sql.Text + ', ' +
                                          EstoqueFiliais[Dm.CdsFiliais.FieldByName('CD_FILIAL').AsInteger] + ' = ' +
                                          StrTran(StrTran(Dm.CdsCadastro.FieldByName(EstoqueFiliais[Dm.CdsFiliais.FieldByName('CD_FILIAL').AsInteger]).AsString, '.', ''), ',', '.');
                    except
                     Dm.query.sql.Clear;
                    end;
                    Dm.CdsFiliais.Next;
                    if Dm.CdsFiliais.FieldByName('CD_FILIAL').AsInteger > 30 then
                       Break;
                  end;
                 Dm.CdsFiliais.First;
                 if not Dm.CdsCadastro.FieldByName('PRINCIPIOATIVO').IsNull then
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +  ' ,PRINCIPIOATIVO = ' + QuotedStr(Dm.CdsCadastro.FieldByName('PRINCIPIOATIVO').AsString);
                  end
                 else
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,PRINCIPIOATIVO = ' + QuotedStr('');
                  end;
                 if not Dm.CdsCadastro.FieldByName('IDENTIFICADOR').IsNull then
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text + ' ,IDENTIFICADOR = ' + QuotedStr(Dm.CdsCadastro.FieldByName('IDENTIFICADOR').AsString);
                  end
                 else
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text + ' ,IDENTIFICADOR = ' + QuotedStr('');
                  end;
                 if not Dm.CdsCadastro.FieldByName('ID_FAMILIA').IsNull then
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text + ' ,ID_FAMILIA = ' + Dm.CdsCadastro.FieldByName('ID_FAMILIA').AsString;
                  end
                 else
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,ID_FAMILIA = NULL';
                  end;
                 if not Dm.CdsCadastro.FieldByName('CD_LISTA').IsNull then
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,CD_LISTA = ' + Dm.CdsCadastro.FieldByName('CD_LISTA').AsString;
                  end
                 else
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,CD_LISTA = NULL';
                  end;
                 if not Dm.CdsCadastro.FieldByName('CD_SUBGRUPO').IsNull then
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,CD_SUBGRUPO = ' + Dm.CdsCadastro.FieldByName('CD_SUBGRUPO').AsString;
                  end
                 else
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,CD_SUBGRUPO = NULL';
                  end;
                 if not Dm.CdsCadastro.FieldByName('CD_PRINCIPIO').IsNull then
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,CD_PRINCIPIO = ' + Dm.CdsCadastro.FieldByName('CD_PRINCIPIO').AsString;
                  end
                 else
                  begin
                    Dm.query.sql.Text := Dm.query.sql.Text +' ,CD_PRINCIPIO = NULL';
                  end;
                 if not (Dm.CdsCadastro.FieldByName('QT_EMBALAGEM').IsNull) and (Dm.CdsCadastro.FieldByName('QT_EMBALAGEM').AsFloat > 0) then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,QT_EMBALAGEM = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('QT_EMBALAGEM').AsString, '.', ''), ',', '.')
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,QT_EMBALAGEM = 1';

                 if not (Dm.CdsCadastro.FieldByName('CODIGO_BARRAS_2').IsNull) and (Dm.CdsCadastro.FieldByName('CODIGO_BARRAS_2').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CODIGO_BARRAS_2 = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CODIGO_BARRAS_2').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,CODIGO_BARRAS_2 = '''+''+'''';

                 if not (Dm.CdsCadastro.FieldByName('MARGEM_PROMOCAO').IsNull) and (Dm.CdsCadastro.FieldByName('MARGEM_PROMOCAO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,MARGEM_PROMOCAO = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('MARGEM_PROMOCAO').AsString, '.', ''), ',', '.')
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,MARGEM_PROMOCAO = 0';

                 if not (Dm.CdsCadastro.FieldByName('MARGEM').IsNull) and (Dm.CdsCadastro.FieldByName('MARGEM').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,MARGEM = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('MARGEM').AsString, '.', ''), ',', '.')
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text + ' ,MARGEM = 0';

                 if not (Dm.CdsCadastro.FieldByName('COMISSAO').IsNull) and (Dm.CdsCadastro.FieldByName('COMISSAO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,COMISSAO = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('COMISSAO').AsString, '.', ''), ',', '.')
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,COMISSAO = 0';

                 if not (Dm.CdsCadastro.FieldByName('USOCONTINUO').IsNull) and (Dm.CdsCadastro.FieldByName('USOCONTINUO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,USOCONTINUO = ' + QuotedStr(Dm.CdsCadastro.FieldByName('USOCONTINUO').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,USOCONTINUO = ''' + 'N' + ''' ';

                 if not (Dm.CdsCadastro.FieldByName('COMPRIMIDOSCAIXA').IsNull) and (Dm.CdsCadastro.FieldByName('COMPRIMIDOSCAIXA').AsFloat > 0) then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,COMPRIMIDOSCAIXA = ' + Dm.CdsCadastro.FieldByName('COMPRIMIDOSCAIXA').AsString
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,COMPRIMIDOSCAIXA = 0';

                 if not (Dm.CdsCadastro.FieldByName('TX_DESCONTO').IsNull) and (Dm.CdsCadastro.FieldByName('TX_DESCONTO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,TX_DESCONTO = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('TX_DESCONTO').AsString, '.', ''), ',', '.')
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,TX_DESCONTO = 0';

                 if not (Dm.CdsCadastro.FieldByName('CONTROLADO').IsNull) and (Dm.CdsCadastro.FieldByName('CONTROLADO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CONTROLADO = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CONTROLADO').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,CONTROLADO = ' + QuotedStr('N');

                 if not (Dm.CdsCadastro.FieldByName('PIS_COFINS').IsNull) and (Dm.CdsCadastro.FieldByName('PIS_COFINS').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,PIS_COFINS = ' + QuotedStr(Dm.CdsCadastro.FieldByName('PIS_COFINS').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,PIS_COFINS = ' + QuotedStr('N');

                 if not (Dm.CdsCadastro.FieldByName('OBSERVACAO').IsNull) and (Dm.CdsCadastro.FieldByName('OBSERVACAO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,OBSERVACAO = ' + QuotedStr(Dm.CdsCadastro.FieldByName('OBSERVACAO').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,OBSERVACAO = ' + QuotedStr('');

                 {if not (Dm.CdsCadastro.FieldByName('NCM').IsNull) and (Dm.CdsCadastro.FieldByName('NCM').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,NCM = ' + QuotedStr(Dm.CdsCadastro.FieldByName('NCM').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,NCM = ' + QuotedStr('');

                 if not (Dm.CdsCadastro.FieldByName('CEST').IsNull) and (Dm.CdsCadastro.FieldByName('CEST').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CEST = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CEST').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CEST = ' + QuotedStr('');

                 if not (Dm.CdsCadastro.FieldByName('ICMS').IsNull) and (Dm.CdsCadastro.FieldByName('ICMS').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,ICMS = ' + QuotedStr(Dm.CdsCadastro.FieldByName('ICMS').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,ICMS = ' + QuotedStr('FF');}

                 if not (Dm.CdsCadastro.FieldByName('GENERICO').IsNull) and (Dm.CdsCadastro.FieldByName('GENERICO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,GENERICO = ' + QuotedStr(Dm.CdsCadastro.FieldByName('GENERICO').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text + ' ,GENERICO = ' + QuotedStr('N');

                 if not (Dm.CdsCadastro.FieldByName('ENTRA_PEDIDO_ELETRONICO').IsNull) and (Dm.CdsCadastro.FieldByName('ENTRA_PEDIDO_ELETRONICO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,ENTRA_PEDIDO_ELETRONICO = ' + QuotedStr(Dm.CdsCadastro.FieldByName('ENTRA_PEDIDO_ELETRONICO').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,ENTRA_PEDIDO_ELETRONICO = ' + QuotedStr('N');

                 if not (Dm.CdsCadastro.FieldByName('BALANCA').IsNull) and (Dm.CdsCadastro.FieldByName('BALANCA').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,BALANCA = ' + QuotedStr(Dm.CdsCadastro.FieldByName('BALANCA').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,BALANCA = ' + QuotedStr('N');

                 if not (Dm.CdsCadastro.FieldByName('IPPT').IsNull) and (Dm.CdsCadastro.FieldByName('IPPT').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,IPPT = ' + QuotedStr(Dm.CdsCadastro.FieldByName('IPPT').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,IPPT = ' + QuotedStr('T');

                 if not (Dm.CdsCadastro.FieldByName('IAT').IsNull) and (Dm.CdsCadastro.FieldByName('IAT').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,IAT = ' + QuotedStr(Dm.CdsCadastro.FieldByName('IAT').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text + ' ,IAT = ' + QuotedStr('T');

                 {if not (Dm.CdsCadastro.FieldByName('CD_CFOP').IsNull) and (Dm.CdsCadastro.FieldByName('CD_CFOP').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CD_CFOP = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CD_CFOP').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CD_CFOP = NULL';}

                 if not (Dm.CdsCadastro.FieldByName('REGISTROMS').IsNull) and (Dm.CdsCadastro.FieldByName('REGISTROMS').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,REGISTROMS = ' + QuotedStr(Dm.CdsCadastro.FieldByName('REGISTROMS').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,REGISTROMS = ' + QuotedStr('');

                 if not (Dm.CdsCadastro.FieldByName('COMPOSTO').IsNull) and (Dm.CdsCadastro.FieldByName('COMPOSTO').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,COMPOSTO = ' + QuotedStr(Dm.CdsCadastro.FieldByName('COMPOSTO').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +' ,COMPOSTO = ' + QuotedStr('');

                 {if not (Dm.CdsCadastro.FieldByName('ORIGEM').IsNull) and (Dm.CdsCadastro.FieldByName('ORIGEM').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,ORIGEM = ' + QuotedStr(Dm.CdsCadastro.FieldByName('ORIGEM').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,ORIGEM = ' + QuotedStr('0');

                 if not (Dm.CdsCadastro.FieldByName('CSOSN').IsNull) and (Dm.CdsCadastro.FieldByName('CSOSN').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CSOSN = ' + QuotedStr(Dm.CdsCadastro.FieldByName('CSOSN').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,CSOSN = ' + QuotedStr('');

                 if not (Dm.CdsCadastro.FieldByName('SITUACAOTRIBUTARIA').IsNull) and (Dm.CdsCadastro.FieldByName('SITUACAOTRIBUTARIA').AsString <> '') then
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,SITUACAOTRIBUTARIA = ' + QuotedStr(Dm.CdsCadastro.FieldByName('SITUACAOTRIBUTARIA').AsString)
                 else
                   Dm.query.sql.Text := Dm.query.sql.Text +
                   ' ,SITUACAOTRIBUTARIA = ' + QuotedStr('60');}

                   Dm.query.sql.Text := Dm.query.sql.Text +
                 ' WHERE ID_PRODUTO = ' + StrTran(StrTran(Dm.CdsCadastro.FieldByName('ID_PRODUTO').AsString, '.' , ''), ',', '.');

                 try
                   Dm.query.ExecSQL(True);
                 except
                  GravaLog(TimetoStr(Time) + ' - ' + Dm.query.sql.Text);
                 end;
                 Dm.CdsCadastro.Next;
              end;
          end;
         Dm.CdsCadastro.Close;
      end
      else
      begin
       exit;
      end;
   Except
      on E:Exception do
       begin
         Result := False;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebimento de Cadastro de Produtos - '+ E.Message);
         Dm.CdsCadastro.Close;
         Try
           Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
           Dm.query.ExecSQL(True);
         Except
           Result := False;
         End;
       end;
   end;


   Try
     Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
     Dm.query.ExecSQL(True);
   Except
    Result := False;
   End;

end;

function RecebendoEstoques : Boolean;
var
 i : Integer;
 Sql : String;
 ParamsFloat : Array of Real;
 ParamsString : Array of String;
 LResponse: IResponse;
arrayRecebendoEstoque:TJSONArray;
begin
 //busca na matriz os estoques
   Try
      // Atualiza produtos
      Result := True;
      Dm.CdsCadastro.Close;

      LResponse := TRequest.New.BaseURL(dm.BaseUrl )
      .Resource('produtoestoque')
      .AcceptEncoding('gzip, deflate')
      .AddBody(arrayRecebendoEstoque.ToString)
      .Accept('application/json')
      .get;
       FreeAndNil(arrayRecebendoEstoque);
        //     Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(1191, Filial, 'A');

       if LResponse.StatusCode=200 then
        begin
         SetLength(ParamsString, 30);
         SetLength(ParamsFloat, 32);
         Dm.CdsCadastro.Data := LResponse.Content;
         Dm.CdsCadastro.Open; // virtual
         if Dm.CdsCadastro.RecordCount > 0 then
          begin
             Try
               GravaLog(TimetoStr(Time) + ' - ' + InttoStr(Dm.CdsCadastro.RecordCount) + ' estoques recebidos.');
               Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
               Dm.query.ExecSQL(True);
             Except
               Result := False;
             End;

             Dm.CdsCadastro.First;
             while not Dm.CdsCadastro.Eof do
              begin
                  ParamsFloat[0] :=dm.cdfilialparametro;
                  ParamsFloat[1] := Dm.CdsCadastro.FieldByName('ID_PRODUTO').AsFloat;

                  ParamsFloat[2] := 0;
                  ParamsFloat[3] := 0;
                  ParamsFloat[4] := 0;
                  ParamsFloat[5] := 0;
                  ParamsFloat[6] := 0;
                  ParamsFloat[7] := 0;
                  ParamsFloat[8] := 0;
                  ParamsFloat[9] := 0;
                  ParamsFloat[10] := 0;
                  ParamsFloat[11] := 0;
                  ParamsFloat[12] := 0;
                  ParamsFloat[13] := 0;
                  ParamsFloat[14] := 0;
                  ParamsFloat[15] := 0;
                  ParamsFloat[16] := 0;
                  ParamsFloat[17] := 0;
                  ParamsFloat[18] := 0;
                  ParamsFloat[19] := 0;
                  ParamsFloat[20] := 0;
                  ParamsFloat[21] := 0;
                  ParamsFloat[22] := 0;
                  ParamsFloat[23] := 0;
                  ParamsFloat[24] := 0;
                  ParamsFloat[25] := 0;
                  ParamsFloat[26] := 0;
                  ParamsFloat[27] := 0;
                  ParamsFloat[28] := 0;
                  ParamsFloat[29] := 0;
                  ParamsFloat[30] := 0;
                  ParamsFloat[31] := 0;
                  ParamsString[0]  := '';
                  ParamsString[1]  := '';
                  ParamsString[2]  := '';
                  ParamsString[3]  := '';
                  ParamsString[4]  := '';
                  ParamsString[5]  := '';
                  ParamsString[6]  := '';
                  ParamsString[7]  := '';
                  ParamsString[8]  := '';
                  ParamsString[9]  := '';
                  ParamsString[10] := '';
                  ParamsString[11] := '';
                  ParamsString[12] := '';
                  ParamsString[13] := '';
                  ParamsString[14] := '';
                  ParamsString[15] := '';
                  ParamsString[16] := '';
                  ParamsString[17] := '';
                  ParamsString[18] := '';
                  ParamsString[19] := '';
                  ParamsString[20] := '';
                  ParamsString[21] := '';
                  ParamsString[22] := '';
                  ParamsString[23] := '';
                  ParamsString[24] := '';
                  ParamsString[25] := '';
                  ParamsString[26] := '';
                  ParamsString[27] := '';
                  ParamsString[28] := '';
                  ParamsString[29] := '';

                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_1').IsNull) then
                      ParamsFloat[2] := Dm.CdsCadastro.FieldByName('ESTOQUE_1').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_2').IsNull) then
                      ParamsFloat[3] := Dm.CdsCadastro.FieldByName('ESTOQUE_2').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_3').IsNull) then
                      ParamsFloat[4] := Dm.CdsCadastro.FieldByName('ESTOQUE_3').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_4').IsNull) then
                      ParamsFloat[5] := Dm.CdsCadastro.FieldByName('ESTOQUE_4').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_5').IsNull) then
                      ParamsFloat[6] := Dm.CdsCadastro.FieldByName('ESTOQUE_5').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_6').IsNull) then
                      ParamsFloat[7] := Dm.CdsCadastro.FieldByName('ESTOQUE_6').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_7').IsNull) then
                      ParamsFloat[8] := Dm.CdsCadastro.FieldByName('ESTOQUE_7').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_8').IsNull) then
                      ParamsFloat[9] := Dm.CdsCadastro.FieldByName('ESTOQUE_8').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_9').IsNull) then
                      ParamsFloat[10] := Dm.CdsCadastro.FieldByName('ESTOQUE_9').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_10').IsNull) then
                      ParamsFloat[11] := Dm.CdsCadastro.FieldByName('ESTOQUE_10').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_11').IsNull) then
                      ParamsFloat[12] := Dm.CdsCadastro.FieldByName('ESTOQUE_11').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_12').IsNull) then
                      ParamsFloat[13] := Dm.CdsCadastro.FieldByName('ESTOQUE_12').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_13').IsNull) then
                      ParamsFloat[14] := Dm.CdsCadastro.FieldByName('ESTOQUE_13').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_14').IsNull) then
                      ParamsFloat[15] := Dm.CdsCadastro.FieldByName('ESTOQUE_14').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_15').IsNull) then
                      ParamsFloat[16] := Dm.CdsCadastro.FieldByName('ESTOQUE_15').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_16').IsNull) then
                      ParamsFloat[17] := Dm.CdsCadastro.FieldByName('ESTOQUE_16').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_17').IsNull) then
                      ParamsFloat[18] := Dm.CdsCadastro.FieldByName('ESTOQUE_17').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_18').IsNull) then
                      ParamsFloat[19] := Dm.CdsCadastro.FieldByName('ESTOQUE_18').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_19').IsNull) then
                      ParamsFloat[20] := Dm.CdsCadastro.FieldByName('ESTOQUE_19').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_20').IsNull) then
                      ParamsFloat[21] := Dm.CdsCadastro.FieldByName('ESTOQUE_20').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_21').IsNull) then
                      ParamsFloat[22] := Dm.CdsCadastro.FieldByName('ESTOQUE_21').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_22').IsNull) then
                      ParamsFloat[23] := Dm.CdsCadastro.FieldByName('ESTOQUE_22').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_23').IsNull) then
                      ParamsFloat[24] := Dm.CdsCadastro.FieldByName('ESTOQUE_23').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_24').IsNull) then
                      ParamsFloat[25] := Dm.CdsCadastro.FieldByName('ESTOQUE_24').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_25').IsNull) then
                      ParamsFloat[26] := Dm.CdsCadastro.FieldByName('ESTOQUE_25').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_26').IsNull) then
                      ParamsFloat[27] := Dm.CdsCadastro.FieldByName('ESTOQUE_26').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_27').IsNull) then
                      ParamsFloat[28] := Dm.CdsCadastro.FieldByName('ESTOQUE_27').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_28').IsNull) then
                      ParamsFloat[29] := Dm.CdsCadastro.FieldByName('ESTOQUE_28').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_29').IsNull) then
                      ParamsFloat[30] := Dm.CdsCadastro.FieldByName('ESTOQUE_29').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('ESTOQUE_30').IsNull) then
                      ParamsFloat[31] := Dm.CdsCadastro.FieldByName('ESTOQUE_30').AsFloat;
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_1').IsNull) then
                      ParamsString[0]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_1').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_2').IsNull) then
                      ParamsString[1]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_2').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_3').IsNull) then
                      ParamsString[2]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_3').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_4').IsNull) then
                      ParamsString[3]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_4').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_5').IsNull) then
                      ParamsString[4]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_5').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_6').IsNull) then
                      ParamsString[5]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_6').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_7').IsNull) then
                      ParamsString[6]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_7').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_8').IsNull) then
                      ParamsString[7]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_8').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_9').IsNull) then
                      ParamsString[8]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_9').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_10').IsNull) then
                      ParamsString[9]  := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_10').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_11').IsNull) then
                      ParamsString[10] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_11').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_12').IsNull) then
                      ParamsString[11] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_12').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_13').IsNull) then
                      ParamsString[12] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_13').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_14').IsNull) then
                      ParamsString[13] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_14').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_15').IsNull) then
                      ParamsString[14] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_15').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_16').IsNull) then
                      ParamsString[15] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_16').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_17').IsNull) then
                      ParamsString[16] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_17').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_18').IsNull) then
                      ParamsString[17] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_18').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_19').IsNull) then
                      ParamsString[18] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_19').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_20').IsNull) then
                      ParamsString[19] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_20').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_21').IsNull) then
                      ParamsString[20] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_21').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_22').IsNull) then
                      ParamsString[21] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_22').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_23').IsNull) then
                      ParamsString[22] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_23').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_24').IsNull) then
                      ParamsString[23] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_24').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_25').IsNull) then
                      ParamsString[24] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_25').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_26').IsNull) then
                      ParamsString[25] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_26').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_27').IsNull) then
                      ParamsString[26] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_27').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_28').IsNull) then
                      ParamsString[27] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_28').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_29').IsNull) then
                      ParamsString[28] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_29').AsDateTime);
                  if not (Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_30').IsNull) then
                      ParamsString[29] := FormatDateTime('mm/dd/yyyy', Dm.CdsCadastro.FieldByName('DT_ULT_VENDA_30').AsDateTime);

                  Sql := 'EXECUTE PROCEDURE SP_ATUALIZA_ESTOQUE( ' +
                  StrTran(FloattoStr(ParamsFloat[0]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[1]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[2]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[3]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[4]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[5]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[6]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[7]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[8]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[9]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[10]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[11]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[12]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[13]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[14]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[15]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[16]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[17]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[18]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[19]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[20]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[21]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[22]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[23]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[24]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[25]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[26]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[27]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[28]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[29]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[30]), ',', '.') + ',' +
                  StrTran(FloattoStr(ParamsFloat[31]), ',', '.') + ',' +
                  QuotedStr(ParamsString[0])  + ',' +
                  QuotedStr(ParamsString[1])  + ',' +
                  QuotedStr(ParamsString[2])  + ',' +
                  QuotedStr(ParamsString[3])  + ',' +
                  QuotedStr(ParamsString[4])  + ',' +
                  QuotedStr(ParamsString[5])  + ',' +
                  QuotedStr(ParamsString[6])  + ',' +
                  QuotedStr(ParamsString[7])  + ',' +
                  QuotedStr(ParamsString[8])  + ',' +
                  QuotedStr(ParamsString[9])  + ',' +
                  QuotedStr(ParamsString[10])  + ',' +
                  QuotedStr(ParamsString[11])  + ',' +
                  QuotedStr(ParamsString[12])  + ',' +
                  QuotedStr(ParamsString[13])  + ',' +
                  QuotedStr(ParamsString[14])  + ',' +
                  QuotedStr(ParamsString[15])  + ',' +
                  QuotedStr(ParamsString[16])  + ',' +
                  QuotedStr(ParamsString[17])  + ',' +
                  QuotedStr(ParamsString[18])  + ',' +
                  QuotedStr(ParamsString[19])  + ',' +
                  QuotedStr(ParamsString[20])  + ',' +
                  QuotedStr(ParamsString[21])  + ',' +
                  QuotedStr(ParamsString[22])  + ',' +
                  QuotedStr(ParamsString[23])  + ',' +
                  QuotedStr(ParamsString[24])  + ',' +
                  QuotedStr(ParamsString[25])  + ',' +
                  QuotedStr(ParamsString[26])  + ',' +
                  QuotedStr(ParamsString[27])  + ',' +
                  QuotedStr(ParamsString[28])  + ',' +
                  QuotedStr(ParamsString[29]) + ')';

                  Dm.FdAtualizaEstoque.sql.Text := Sql;
                  Try
                    Dm.FdAtualizaEstoque.ExecSQL(False);
                  Except
                    Dm.FdAtualizaEstoque.sql.Clear;
                  End;
                 Dm.CdsCadastro.Next;
              end;
          end;
         Dm.CdsCadastro.Close;
        end
        else
        begin
         Result := False;
        Exit;
        end;

     Try
       Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
       Dm.query.ExecSQL(True);
     Except
       Result := False;
     End;

   Except
       on E:Exception do
       begin
         Result := False;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebimento de Estoques - '+ E.Message);
         Dm.CdsCadastro.Close;
         Try
           Dm.query.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
           Dm.query.ExecSQL(True);
         Except
           Result := False;
         End;
       end;
   end;


end;

Function RecebendoPrecos : Boolean;
var
LResponse: IResponse;
arraySintegraNotasItens:TJSONArray;
begin

  Result := False;

  //busca na matriz os preço de Venda dos Produtos

  if dm.AtualizaPrecoVenda = 'S' then
   begin

       Try
         // Atualiza produtos
         Result := True;

         // Verificando a existencia de precos a serem enviados para a gestão
         // Caso existam forçar o envio e não receber os da gestão no mesmo processo

         Dm.Cds1.Close;
         Dm.FDcds1.sql.Text := 'SELECT COUNT(*) FROM TEMP_PRODUTOS WHERE PROCESSO = 52';
         Dm.Cds1.Params.Clear;
         Dm.Cds1.Open;

         if Dm.Cds1.Fields[0].Value > 0 then
          begin
             Dm.Cds1.Close;
             try
               GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Precos na Filial através do processo de Recebimento de Preços da gestão');
               EnviandoPrecosFilial;
             except
              Dm.Cds1.Close;
             end;
             Result := False;
             Exit;
          end;
         Dm.Cds1.Close;

         Dm.CdsFiliais.Close;
         Dm.CdsFiliais.Params[0].AsFloat := dm.cdfilialparametro;
         Dm.CdsFiliais.Open;
         Dm.CdsFiliais.First;
         Dm.CdsPrecos.Close;

         //Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(125, Filial, 'A');

         LResponse := TRequest.New.BaseURL(dm.BaseUrl )
         .Resource('recebendopreco')
         .AcceptEncoding('gzip, deflate')
         .AddBody(arraySintegraNotasItens.ToString)
         .Accept('application/json')
         .get;
         FreeAndNil(arraySintegraNotasItens);

         if  LResponse.StatusCode =200 then
          begin

           Dm.CdsPrecos.Data := LResponse.Content;
           Dm.CdsPrecos.Open; // virtual
           if Dm.CdsPrecos.RecordCount > 0 then
            begin
              Try

               Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO INACTIVE';
               Dm.FDcds1.ExecSQL(True);

               Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 INACTIVE';
               Dm.FDcds1.ExecSQL(True);

               Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
               Dm.FDcds1.ExecSQL(True);

              Except on E:Exception do
                  begin
                    GravaLog('erro ao inativar as triggers de alteracao de produto - '+E.Message) ;
                   Dm.FDcds1.SQL.Clear;
                  end;
               End;

               Dm.CdsPrecos.First;
               GravaLog(TimetoStr(Time) + ' - ' + InttoStr(Dm.CdsPrecos.RecordCount) + ' precos recebidos.');
               while not Dm.CdsPrecos.Eof do
                begin
                   if (Dm.CdsPrecos.FieldByName('DATA_REAJUSTE').AsDateTime >= Date) then
                    begin
                       Dm.FDcds1.sql.Text := 'INSERT INTO REAJUSTE VALUES (' +
                                       Dm.CdsPrecos.FieldByName('CD_FILIAL').AsString + ', ' +
                                       Dm.CdsPrecos.FieldByName('ID_PRODUTO').AsString + ', ' +
                                       QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('DATA').AsDateTime)) + ', ' +
                                       QuotedStr(FormatDateTime('hh:mm:ss', Dm.CdsPrecos.FieldByName('HORA').AsDateTime)) + ', ' +
                                       StrTran(Dm.CdsPrecos.FieldByName('PRECO_ANTERIOR').AsString, ',', '.') + ', ' +
                                       StrTran(Dm.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.') + ', ' +
                                       StrTran(Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_ANTERIOR').AsString, ',', '.') + ', ' +
                                       StrTran(Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, ',', '.') + ', ';
                       if not Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').IsNull then
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                       QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').AsDateTime)) + ', '
                       else
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + ' NULL, ';
                       if not Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').IsNull then
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                       QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime)) + ', '
                       else
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + ' NULL, ';
                       Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                                           QuotedStr('N') + ', ';
                       if not Dm.CdsPrecos.FieldByName('DATA_REAJUSTE').IsNull then
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                                              QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('DATA_REAJUSTE').AsDateTime))
                       else
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                                              ' NULL ';

                       if Dm.CdsPrecos.FieldByName('USUARIO').AsString = 'SP' then
                        begin
                           Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + ', ' +
                                                               QuotedStr('ExporterClientQuick') + ', ' + QuotedStr(Dm.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                        end
                       else
                        begin
                           Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + ', ' +
                                                               QuotedStr(Dm.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr(Dm.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                        end;

                    end
                   else
                    begin
                          //para nao incluir os reajustes em caso de reexportacao de precos
                      if Dm.CdsPrecos.FieldByName('USUARIO').AsString <> 'SP' then
                        begin
                           Dm.FDcds1.sql.Text := 'INSERT INTO REAJUSTE VALUES (' +
                                           Dm.CdsPrecos.FieldByName('CD_FILIAL').AsString + ', ' +
                                           Dm.CdsPrecos.FieldByName('ID_PRODUTO').AsString + ', ' +
                                           QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('DATA').AsDateTime)) + ', ' +
                                           QuotedStr(FormatDateTime('hh:mm:ss', Dm.CdsPrecos.FieldByName('HORA').AsDateTime)) + ', ';
                           if not (Dm.CdsPrecos.FieldByName('PRECO_ANTERIOR').IsNull) then
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                    StrTran(Dm.CdsPrecos.FieldByName('PRECO_ANTERIOR').AsString, ',', '.') + ', '
                           else
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + 'NULL, ';

                           Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + StrTran(Dm.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.') + ', ';

                           if not (Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_ANTERIOR').IsNull) then
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                  StrTran(Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_ANTERIOR').AsString, ',', '.') + ', '
                           else
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + 'NULL, ';

                           if not (Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').IsNull) then
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                 StrTran(Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, ',', '.') + ', '
                           else
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + 'NULL, ';

                           if not Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').IsNull then
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                           QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').AsDateTime)) + ', '
                           else
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + ' NULL, ';
                           if not Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').IsNull then
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                           QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime)) + ', '
                           else
                              Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text + ' NULL, ';
                           Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                                               QuotedStr('S') + ', ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ' , ';

                           if Dm.CdsPrecos.FieldByName('USUARIO').AsString = 'SP' then
                            begin
                               Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                                                   QuotedStr('ExporterClientQuick') + ', ' + QuotedStr(Dm.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                            end
                           else
                            begin
                               Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                                                                   QuotedStr(Dm.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr(Dm.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                            end;

                           try
                             Dm.FDcds1.ExecSQL(True);
                           except
                             GravaLog(TimetoStr(Time) + ' - ' + Dm.FDcds1.sql.Text);
                           end;
                        end;

                       Dm.FDcds1.sql.Text := 'UPDATE PRODUTOS SET ' +
                           ' PRECO_VENDA  = ' + StrTran(Dm.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.') + ', '+
                           ' PRECO_VENDA_' + FloatToStr(dm.cdfilialparametro) + ' = ' + StrTran(Dm.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.');

                       if not Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').IsNull then
                        begin
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                          ' ,DT_VENCIMENTO_PROMOCAO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime)) +
                          ' ,DT_VENCIMENTO_PROMOCAO_' + FloatToStr(dm.cdfilialparametro) + ' = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime));
                        end
                       else
                        begin
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                          ' ,DT_VENCIMENTO_PROMOCAO = NULL ' +
                          ' ,DT_VENCIMENTO_PROMOCAO_' + FloatToStr(dm.cdfilialparametro) + ' = NULL ';
                        end;

                       if not Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').IsNull then
                        begin
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                          ' ,PRECO_PROMOCAO = ' + StrTran(StrTran(Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, '.', ''), ',', '.') +
                          ' ,PRECO_PROMOCAO_' + FloatToStr(dm.cdfilialparametro) + ' = ' + StrTran(StrTran(Dm.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, '.', ''), ',', '.')
                        end
                       else
                        begin
                           Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                           ' ,PRECO_PROMOCAO = 0, PRECO_PROMOCAO_' + FloatToStr(dm.cdfilialparametro) + ' = 0 ';
                        end;


                       if not Dm.CdsPrecos.FieldByName('DATA').IsNull then
                          Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                          ' ,DT_REAJUSTE = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Dm.CdsPrecos.FieldByName('DATA').AsDateTime));

                       Dm.FDcds1.sql.Text := Dm.FDcds1.sql.Text +
                         ' WHERE ID_PRODUTO = ' + StrTran(StrTran(Dm.CdsPrecos.FieldByName('ID_PRODUTO').AsString, '.' , ''), ',', '.');
                    end;

                   try
                     Dm.FDcds1.ExecSQL(True);
                   except
                     GravaLog(TimetoStr(Time) + ' - ' + Dm.FDcds1.sql.Text);
                   end;
                   Dm.CdsPrecos.Next;
                end;
            end;
           Dm.CdsPrecos.Close;

         end
         else
         begin
          exit ;
         end;

       Except
          on E:Exception do
           begin
             Result := False;
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Preco de Venda - '+ E.Message +' -' +LResponse.Content);
             Dm.CdsPrecos.Close;
             Try
               Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO ACTIVE';
               Dm.FDcds1.ExecSQL(True);

               Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 ACTIVE';
               Dm.FDcds1.ExecSQL(True);

             Except on E:exception do
                begin
                  GravaLog('Erro na ativacao das trigger de alteracao de precos - ' +E.Message);
                  Dm.FDcds1.SQL.Clear;
                  Result := False;
                end;
             End;

             Try
               Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
               Dm.FDcds1.ExecSQL(True);
             Except
               Dm.FDcds1.SQL.Clear;
             End;
           end;
       end;

       Try

         Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO ACTIVE';
         Dm.FDcds1.ExecSQL(True);

         Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 ACTIVE';
         Dm.FDcds1.ExecSQL(True);

       Except

         Result := False;
       End;

       Try
         Dm.FDcds1.sql.Text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
         Dm.FDcds1.ExecSQL(True);

       Except

       End;
   end;

end;

procedure RecebendoProdutosDeletados;
 var
LResponse: IResponse;
arrayProdutosDeletados:TJSONArray;
begin
  //busca na matriz os produtos deletados
   Try
     // Atualiza produtos
     Dm.CdsDeletados.Close;
     Dm.CdsDeletados.CreateDataSet;

     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
     .Resource('produtosdeletados')
     .AcceptEncoding('gzip, deflate')
     .AddBody(arrayProdutosDeletados.ToString)
     .Accept('application/json')
     .post;
     FreeAndNil(arrayProdutosDeletados);

     //Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS');

     if LResponse.StatusCode = 200  then
      begin
         Dm.CdsDeletados.Data := LResponse.Content;
         Dm.CdsDeletados.Open; // virtual
         Dm.CdsDeletados.IndexFieldNames := 'CAMPO2';

         if Dm.CdsDeletados.RecordCount > 0 then
          begin
             GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Produtos Deletados recebidos: ' + FloatToStr(Dm.CdsDeletados.RecordCount));
             Dm.CdsDeletados.First;
             while not Dm.CdsDeletados.Eof do
              begin
                 Dm.query.sql.Text := 'DELETE FROM PRODUTOS WHERE ID_PRODUTO = ' + Dm.CdsDeletadosCAMPO2.AsString;
                 Dm.query.ExecSQL(True);
                 Dm.CdsDeletados.Next;
              end;
          end;
         Dm.CdsDeletados.Close;
      end
      else
      begin
        Exit;
      end;
   Except
      on E:Exception do
       begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Produtos Deletados - '+ E.Message +' - '+ LResponse.Content);
         Dm.CdsDeletados.Close;
         Exit;
       end;
   end;

end;

procedure RecebendoProdutosFidelidadeDeletados;
var
 LResponse: IResponse;
arrayDados:TJSONArray;
begin
   //busca na matriz os Produtos Fidelidade Deletados
   Try
     Dm.CdsDeletados.Close;
     Dm.CdsDeletados.CreateDataSet;

    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('produtofidelidadedeletados')
    .AcceptEncoding('gzip, deflate')
    .AddBody(arrayDados.ToString)
    .Accept('application/json')
    .get;
    FreeAndNil(arrayDados);

     if LResponse.StatusCode=200 then
     begin
      //Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FILIAIS_FIDELIDADE');

     Dm.CdsDeletados.Data := LResponse.Content;
     Dm.CdsDeletados.Open; // virtual

     if Dm.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Fidelidade Deletados - ' + FloatToStr(Dm.CdsDeletados.RecordCount));

         Dm.CdsDeletados.First;
         while not Dm.CdsDeletados.Eof do
          begin
            Dm.query.sql.Text := 'DELETE FROM PRODUTOS_FIDELIDADE WHERE ID_PRODUTO = ' + Dm.CdsDeletadosCAMPO1.AsString;
            Try
              Dm.query.ExecSQL(True);
            Except
             Dm.query.SQL.Clear;
            End;

            Dm.CdsDeletados.Next;
          end;
      end;

     Dm.CdsDeletados.Close;
     end
     else
     begin
       exit
     end;
   Except
      on E:Exception do
       begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Farmacia Fidelidade Deletados');
         Dm.CdsDeletados.Close;
         Exit;
       end;
   end;

end;

procedure RecebendoProdutosQuantidadeDeletados;
var
 LResponse: IResponse;
 arrayDados:TJSONArray;
begin
   //busca na matriz os Produtos Quantidade Deletados
   Try


     Dm.CdsDeletados.Close;
     Dm.CdsDeletados.CreateDataSet;

    //  Dados := (Dm.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS_PRECO_QUANTIDADE');

     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
     .Resource('precosfilial')
     .AcceptEncoding('gzip, deflate')
     .AddBody(arrayDados.ToString)
     .Accept('application/json')
     .post;
     FreeAndNil(arrayDados);

     if LResponse.StatusCode=200 then
     begin

      Dm.CdsDeletados.Data := LResponse.Content;
      Dm.CdsDeletados.Open; // virtual

     if Dm.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Quantidade Deletados - ' + FloatToStr(Dm.CdsDeletados.RecordCount));

         Dm.CdsDeletados.First;
         while not Dm.CdsDeletados.Eof do
          begin
            Dm.query.sql.Text:= 'DELETE FROM PRODUTOS_PRECO_QUANTIDADE WHERE ID_PRODUTO = ' + Dm.CdsDeletadosCAMPO1.AsString +
                                ' AND QUANTIDADEINICIAL = ' + Dm.CdsDeletadosCAMPO2.AsString;
            Try
              Dm.query.ExecSQL(True);
            Except
            End;

            Dm.CdsDeletados.Next;
          end;
      end;

     Dm.CdsDeletados.Close;
     end;
   Except
      on E:Exception do
       begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Quantidade Deletados');
         Dm.CdsDeletados.Close;
         Exit;
       end;
   end;

end;


end.
