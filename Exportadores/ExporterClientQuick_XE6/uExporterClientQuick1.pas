unit uExporterClientQuick;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Provider, InvokeRegistry, Rio, SOAPHTTPClient,
  MidasLib, StdCtrls, FMTBcd, RXShell, DBXpress, SqlExpr, SOAPConn;

type                                     
  TFrmExporterClientQuick = class(TForm)
    RxTrayIcon1: TRxTrayIcon;
    Timer2: TTimer;
    procedure VerificaConexao(TipoConexao : String);
    procedure Timer2Timer(Sender: TObject);
    procedure Processar;
    procedure FormCreate(Sender: TObject);
    procedure GravaLog(cMensagem: string);
    procedure Delay(Tempo: Word);
    Function  StrTran( cString, cProcura, cTroca : string ): string;
    procedure AbreTransacao;
    procedure ConfirmaTransacao;
    procedure CancelaTransacao;

    procedure BuscaMatrizContasReceber;
    procedure EnviarContasReceber;
    procedure EnvioLotes;
    procedure EnvioCaixa;
    procedure BuscaMatrizProdutosIncluidos;
    procedure EnviandoEstoque;
    procedure EnviandoOperadoresCaixa;
    procedure EnviandoClientes;
    procedure EnviandoCRM;
    procedure EnviandoEntregas;
    procedure EnviandoChequesRecebidos;
    procedure EnviandoItensTransfer;
    procedure EnviandoTransfer;
    procedure EnviandoCadernoFaltas;
    procedure EnviandoPrecosFilial;

    procedure EnviandoContasPagar;
    procedure EnviandoCompras;
    procedure EnviandoItensCompras;
    procedure RecebendoItensTransfer;
    procedure RecebendoTransfer;
    function  RecebendoCadastro : Boolean;
    Function  RecebendoPrecos : Boolean;
    procedure RecebendoProdutosDeletados;
    procedure Teste;
    procedure Testando;
    procedure MontaSQL_Precos(Filial : String);
    procedure CriaCamposPrecos(sFilial : String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  function Alltrim(Text : string) : string;

var
  FrmExporterClientQuick: TFrmExporterClientQuick;
  Caminho, Servidor, Intervalo, Intervalo2, AtualizaPrecoVenda, Status: String;
  Importer : TextFile;
  Log : TextFile;
  TD : TTransactionDesc;

  Filial : Integer;
  Sql : String;

  Id_Produto, Cd_Produto, CodigoBarras, CodigoBarras2, Descricao, Cd_Laboratorio,
  Cd_Grupo, TipoProduto, Identificador, Qt_Embalagem, Comissao,
  CustoUnitario, Preco_Venda, Preco_Promocao, Icms, Margem, Margem_Promocao,
  Dt_Cadastro, Curva, Cd_Classe, EntraPE, TxDesconto, Unidade, Balanca,
  Cd_Principio, Cd_Lista, UsoContinuo : String;

  NLancamentos, NCaixa, NTransfer, NItensTransfer, NContasReceber : Integer;
  NLancamentosLoja, NCaixaLoja, NTransferLoja, NItensTransferLoja, NContasReceberLoja : Integer;

  Teste : Variant;

const
  EstoqueFiliais : array[1..10] of string =
  ('ESTOQUE_1','ESTOQUE_2','ESTOQUE_3','ESTOQUE_4','ESTOQUE_5',
   'ESTOQUE_6','ESTOQUE_7','ESTOQUE_8','ESTOQUE_9','ESTOQUE_10');

implementation

uses IDm1, uDmExporterQuick;

{$R *.dfm}


// Função para Colocar zeros à esquerda de valores
function StrZero(Num : Real ; Zeros,Deci: integer): string;
var tam,z : integer;
    res,zer : string;
begin
   Str(Num:Zeros:Deci, res);
   res := Alltrim(res);
   tam := length(res);
   zer := '';
   for z := 1 to (Zeros-tam) do zer := zer + '0';
   Result := zer+res;
end;


//esperar numero de segundos....
procedure TFrmExporterClientQuick.Delay(Tempo: Word);
var
x1: Double;
begin
    x1:= now;
    repeat until ((now-x1)*86400) > Tempo;
end;


function Alltrim(Text : string) : string;
begin
while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
Result := Text;
end;



procedure TFrmExporterClientQuick.GravaLog(cMensagem: string);
var Log : TextFile;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogExporter' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
   begin
     AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogExporter' + FormatDateTime('ddmmyyyy',Date) + '.txt');
     Append(Log);
   end
  else
    begin
     AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogExporter' + FormatDateTime('ddmmyyyy',Date) + '.txt');
     Rewrite(Log);
     Writeln(Log, ' - Iniciando o Dia ' + FormatDateTime('dd/mm/yyyy',Date) + ' as ' + FormatDateTime('hh:mm:ss',Time) + ' horas');
    end;

  Writeln(Log, cMensagem);
  CloseFile(Log);
end;


procedure TFrmExporterClientQuick.FormCreate(Sender: TObject);
begin
  TD.TransactionID  := 1;
  TD.IsolationLevel := xilREADCOMMITTED;
  if not FileExists(ExtractFilePath(Application.ExeName)+'ExporterClient.TXT') then
   begin
     ShowMessage('O arquivo de configuração (ExporterClient.txt) não existe. Configure-o antes de prosseguir');
     GravaLog('O arquivo de configuração (ExporterClient.txt) não existe. Configure-o antes de prosseguir');
     Close;
     Application.Terminate;
     Halt;
     Exit;
   end;

  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Logs') then
     CreateDir(ExtractFilePath(Application.ExeName)+'Logs');

  Timer2.Interval := 10;
  Timer2.Enabled := True;
  AssignFile(Importer, ExtractFilePath(Application.ExeName)+'ExporterClient.TXT');
  Reset(Importer);
  Readln(Importer, Caminho);
  ReadLn(Importer, Servidor);
  ReadLn(Importer, Intervalo);
  ReadLn(Importer, Intervalo2);
  ReadLn(Importer, AtualizaPrecoVenda);
  CloseFile(Importer);
end;


Function TFrmExporterClientQuick.StrTran( cString, cProcura, cTroca : string ): string;
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
End;


procedure TFrmExporterClientQuick.AbreTransacao;
begin
 if DmExporterQuick.SQLConnection1.InTransaction then
  begin
    DmExporterQuick.SQLConnection1.Rollback(TD);
  end;
 DmExporterQuick.SQLConnection1.StartTransaction(TD);
end;

procedure TFrmExporterClientQuick.CancelaTransacao;
begin
 if DmExporterQuick.SQLConnection1.InTransaction then
  begin
    DmExporterQuick.SQLConnection1.Rollback(TD);
  end;
end;

procedure TFrmExporterClientQuick.ConfirmaTransacao;
begin
 if DmExporterQuick.SQLConnection1.InTransaction then
  begin
    DmExporterQuick.SQLConnection1.Commit(TD);
  end;
end;



//aciona o processo de envio dos dados
procedure TFrmExporterClientQuick.Timer2Timer(Sender: TObject);
begin
  FrmExporterClientQuick.Hide;
  Timer2.Enabled := False;
  Processar;
  RxTrayIcon1.Animated := False;
  RxTrayIcon1.Active := False;
  Application.ProcessMessages;
  Application.Terminate;
  Halt;
end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////// inicio do processamento  1 //////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFrmExporterClientQuick.Processar;
begin
  if Time <= StrToTime('07:00:00') then
    begin
      Close;
      Application.Terminate;
      Halt;
      Exit;
    end;

  if (Servidor = '') then
   begin
     ShowMessage('O Nome do Servidor Matriz Está Vazio....');
     GravaLog('O Nome do Servidor Matriz Está Vazio....');
     Close;
     Application.Terminate;
     Halt;
     Exit;
   end;

  if (Caminho = '') then
   begin
     ShowMessage('O Caminho dos Arquivos de Dados Está Vazio....');
     GravaLog('O Caminho dos Arquivos de Dados Está Vazio....');
     Close;
     Application.Terminate;
     Halt;
     Exit;
   end;

  try
    DmExporterQuick.SQLConnection1.Close;
    DmExporterQuick.SQLConnection1.Params.Values['Database'] := Caminho + '\Farmax.fdb';
    DmExporterQuick.SQLConnection1.Open;
  except
    GravaLog('Sem conexão com o banco.');
    Close;
    Application.Terminate;
    Halt;
    Exit;
  end;

  DmExporterQuick.HTTPRIO1.URL := 'http://' + Servidor + '/ExporterServer/ExporterServer.exe/soap/IDm';

  GravaLog(' ');
  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ======== Iniciando novo processo de exportacao ========');

  RxTrayIcon1.Animated := True;

  AbreTransacao;
  DmExporterQuick.CdsParametros.Open;
  ConfirmaTransacao;
  Filial := DmExporterQuick.CdsParametros.Fields[0].AsInteger;

  //VerificaConexao('Inicial');

  while RecebendoPrecos do sleep(1);
  EnvioLotes;
  EnvioCaixa;
  EnviandoOperadoresCaixa;
  EnviandoCRM;
  EnviandoEntregas;
  EnviandoChequesRecebidos;
  EnviandoTransfer;
  EnviandoContasPagar;
  EnviandoCompras;
  EnviandoClientes;
  EnviandoCadernoFaltas;
  RecebendoTransfer;
  RecebendoItensTransfer;
  RecebendoProdutosDeletados;
  BuscaMatrizProdutosIncluidos;
  while RecebendoCadastro do Sleep(1);
  EnviandoEstoque;
  while RecebendoPrecos do sleep(1);
  EnviarContasReceber;
  EnviandoPrecosFilial;

  RxTrayIcon1.Animated := False;
  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - =======================================================');
  DmExporterQuick.SQLConnection1.Close;
end;



procedure TFrmExporterClientQuick.BuscaMatrizContasReceber;
var
 i : integer;
 Dados : Variant;
begin
  //Busca na matriz as Contas a Receber
   GravaLog(TimetoStr(Time) + ' - Recebendo Contas a Receber.');
   Try
     DmExporterQuick.CdsContas_Receber.Close;
     DmExporterQuick.CdsContas_Receber.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(121, Filial, 'A');
     if Dados = null then
        Exit;
     DmExporterQuick.CdsCOntas_Receber.Data := Dados;
     DmExporterQuick.CdsCOntas_Receber.Open;  // virtual
     if DmExporterQuick.CdsCOntas_Receber.RecordCount > 0 then
        begin
           Try
             DmExporterQuick.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR INACTIVE';
             AbreTransacao;
             DmExporterQuick.Sql1.ExecSQL(True);
             ConfirmaTransacao;
           Except
             CancelaTransacao;
             exit;
           End;
           DmExporterQuick.CdsCOntas_Receber.First;
           while not DmExporterQuick.CdsContas_Receber.Eof do
            begin
              DmExporterQuick.QryCOntas_Receber.Close;
              DmExporterQuick.QryCOntas_Receber.Params[0].AsFloat := DmExporterQuick.CdsContas_ReceberCD_CONTAS_RECEBER.AsFloat;
              AbreTransacao;
              DmExporterQuick.QryCOntas_Receber.Open;
              ConfirmaTransacao;

              if DmExporterQuick.QryCOntas_Receber.RecordCount = 0 then
                 DmExporterQuick.QryCOntas_Receber.Append
              else
                 DmExporterQuick.QryCOntas_Receber.Edit;

              for i := 0 to DmExporterQuick.QryCOntas_Receber.FieldCount - 1 do
               begin
                  if (DmExporterQuick.QryCOntas_Receber.Fields[i].FieldName <> 'DT_ALTERACAO') and
                     (DmExporterQuick.QryCOntas_Receber.Fields[i].FieldName <> 'ENVIADO') then
                     DmExporterQuick.QryCOntas_Receber.Fields[i].Value := DmExporterQuick.CdsContas_Receber.Fields[i].Value;
               end;
              DmExporterQuick.QryCOntas_Receber.Post;
              AbreTransacao;
              DmExporterQuick.QryCOntas_Receber.ApplyUpdates(0);
              ConfirmaTransacao;
              DmExporterQuick.CdsContas_Receber.Next;
            end;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         Try
           DmExporterQuick.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
           AbreTransacao;
           DmExporterQuick.Sql1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           CancelaTransacao;
         End;
         DmExporterQuick.CdsContas_Receber.Close;
         DmExporterQuick.QryCOntas_Receber.Close;
         Exit;
       end;
   end;
   DmExporterQuick.CdsContas_Receber.Close;
   DmExporterQuick.QryCOntas_Receber.Close;

   Try
     DmExporterQuick.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
     AbreTransacao;
     DmExporterQuick.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
     CancelaTransacao;
   End;
end;

procedure TFrmExporterClientQuick.EnviarContasReceber;
var Dados : Variant;
begin
  //processamento e envio de Cecadfin.dat
  Try
      Try
        Sql := DmExporterQuick.TbCeCadFin.CommandText;
        DmExporterQuick.TbCeCadFin.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR INACTIVE';
        AbreTransacao;
        DmExporterQuick.TbCeCadFin.ExecSQL(True);
        ConfirmaTransacao;

        DmExporterQuick.TbCeCadFin.CommandText := 'UPDATE CONTAS_RECEBER SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
        AbreTransacao;
        DmExporterQuick.TbCeCadFin.ExecSQL;
        ConfirmaTransacao;
        DmExporterQuick.TbCeCadFin.CommandText := Sql;

        AbreTransacao;
        DmExporterQuick.CdsCeCadfin.Open;
        ConfirmaTransacao;
        if DmExporterQuick.CdsCeCadfin.RecordCount <> 0 then
         begin
            GravaLog(TimetoStr(Time) + ' - Enviando Contas a Receber: ' + FloatToStr(DmExporterQuick.CdsCeCadfin.RecordCount));
            Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(3, Filial, DmExporterQuick.CdsCeCadfin.Data);
            if (Dados <> Null) and (Dados) then
              begin
                DmExporterQuick.CdsCeCadfin.Close;
                DmExporterQuick.TbCeCadFin.Close;
                DmExporterQuick.TbCeCadFin.CommandText := 'UPDATE CONTAS_RECEBER SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                AbreTransacao;
                DmExporterQuick.TbCeCadFin.ExecSQL(True);
                ConfirmaTransacao;
              end;
         end;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Contas a Receber - ' + E.Message);
            DmExporterQuick.TbCeCadFin.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
            AbreTransacao;
            DmExporterQuick.TbCeCadFin.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterQuick.CdsCeCadfin.Close;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.TbCeCadFin.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
    AbreTransacao;
    DmExporterQuick.TbCeCadFin.ExecSQL(True);
    ConfirmaTransacao;
    DmExporterQuick.CdsCeCadfin.Close;
  End;
end;


procedure TFrmExporterClientQuick.EnviandoContasPagar;
var Dados : Variant;
begin
  //processamento e envio de Ceduplic.dat
    Try
      Sql := DmExporterQuick.TbCeDuplic.CommandText;
      DmExporterQuick.TbCeDuplic.CommandText := 'UPDATE CONTAS_PAGAR SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
      AbreTransacao;
      DmExporterQuick.TbCeDuplic.ExecSQL;
      ConfirmaTransacao;
      DmExporterQuick.TbCeDuplic.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsCeDuplic.Open;
      ConfirmaTransacao;
      if DmExporterQuick.CdsCeDuplic.RecordCount <> 0 then
       begin
          //VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Contas a Pagar: '+ FloatToStr(DmExporterQuick.CdsCeDuplic.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(6, Filial, DmExporterQuick.CdsCeDuplic.Data);
          if (Dados <> Null) and (Dados) then
            begin
              DmExporterQuick.CdsCeDuplic.First;
              DmExporterQuick.TbCeDuplic.CommandText := 'UPDATE CONTAS_PAGAR SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.TbCeDuplic.ExecSQL;
              ConfirmaTransacao;
              DmExporterQuick.TbCeDuplic.Close;
            end;
       end;
    Except
      on E:Exception do
        begin
          CancelaTransacao;
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Contas Pagar - ' + E.Message);
          DmExporterQuick.CdsCeDuplic.Close;
          Exit;
        end;
    End;
    DmExporterQuick.CdsCeDuplic.Close;
end;


procedure TFrmExporterClientQuick.EnviandoCompras;
var Dados : Variant;
begin
  //processamento e envio de Cepedid1.dat
    Try
      Sql := DmExporterQuick.TbCePedid1.CommandText;
      DmExporterQuick.TbCePedid1.CommandText := 'UPDATE TEMP_COMPRAS SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2') + ')';
      AbreTransacao;
      DmExporterQuick.TbCePedid1.ExecSQL;
      ConfirmaTransacao;

      DmExporterQuick.TbCePedid1.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsCePedid1.Open;
      ConfirmaTransacao;

      Try
        EnviandoItensCompras;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  ItensCompras - ' + E.Message);
            DmExporterQuick.CdsCePedid1.Close;
            Exit;
          end;
      end;

      if DmExporterQuick.CdsCePedid1.RecordCount <> 0 then
       begin
          //VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Compras: ' + FloatToStr(DmExporterQuick.CdsCePedid1.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(4, Filial, DmExporterQuick.CdsCePedid1.Data);
          if (Dados <> Null) and (Dados) then
            begin
              DmExporterQuick.TbCePedid1.CommandText := 'DELETE FROM TEMP_COMPRAS WHERE ENVIADO = '+QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.TbCePedid1.ExecSQL;
              ConfirmaTransacao;
            end;
       end;
    Except
      on E:Exception do
        begin
          CancelaTransacao;
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Compras - ' + E.Message);
          DmExporterQuick.CdsCePedid1.Close;
          Exit;
        end;
    End;
    DmExporterQuick.CdsCePedid1.Close;
end;


procedure TFrmExporterClientQuick.EnviandoItensCompras;
var Dados : Variant;
begin
  //processamento e envio de Cepedido.dat
      Try
        DmExporterQuick.CdsCePedido.Close;
        AbreTransacao;
        DmExporterQuick.CdsCePedido.Open;
        ConfirmaTransacao;
        if DmExporterQuick.CdsCePedido.RecordCount <> 0 then
         begin
            //VerificaConexao('');
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando ItensCompras do Pedido ' + DmExporterQuick.CdsCePedid1CD_COMPRAS.AsString);
            Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(5, Filial, DmExporterQuick.CdsCePedido.Data);
            if  Dados = null then
                DmExporterQuick.CdsCePedido.Close;
         end;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Itens Compras - '+E.Message);
            DmExporterQuick.CdsCePedido.Close;
            Exit;
          end;
      end;
      DmExporterQuick.CdsCePedido.Close;
end;


procedure TFrmExporterClientQuick.EnvioLotes;
var Dados : Variant;
begin
  //processamento e envio de Celotes.dat
  Try
      Try
         Sql := DmExporterQuick.TbCeLotes.CommandText;

         Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(1000, Filial, 'A');
         if Dados <> null then
          begin
             NLancamentos := Dados;

             DmExporterQuick.CdsNumeroLancamentosLoja.Close;
             AbreTransacao;
             DmExporterQuick.CdsNumeroLancamentosLoja.Open;
             ConfirmaTransacao;

             NLancamentosLoja := DmExporterQuick.CdsNumeroLancamentosLojaCOUNT.AsInteger;

             if NLancamentosLoja <> NLancamentos then
              begin
                DmExporterQuick.CdsCdLancamento.Close;
                DmExporterQuick.CdsCdLancamento.CreateDataSet;
                Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(1002, Filial, 'A');
                if Dados <> null then
                 begin
                    DmExporterQuick.CdsCdLancamento.Data := Dados;
                    DmExporterQuick.CdsCdLancamento.Open; // virtual
                    DmExporterQuick.CdsCdLancamento.IndexFieldNames := 'CD_LANCAMENTO';
                    DmExporterQuick.CdsCdLancamento.First;

                    DmExporterQuick.CdsCdLancamentoLoja.Close;
                    DmExporterQuick.CdsCdLancamentoLoja.Open;
                    DmExporterQuick.CdsCdLancamentoLoja.IndexFieldNames := 'CD_LANCAMENTO';
                    DmExporterQuick.CdsCdLancamentoLoja.First;
                    while not DmExporterQuick.CdsCdLancamentoLoja.Eof do
                     begin
                       if not DmExporterQuick.CdsCdLancamento.FindKey([DmExporterQuick.CdsCdLancamentoLojaCD_LANCAMENTO.AsFloat]) then
                        begin
                          DmExporterQuick.TbCeLotes.CommandText := 'INSERT INTO TEMP_LANCAMENTOS VALUES (' + DmExporterQuick.CdsCdLancamentoLojaCD_LANCAMENTO.AsString + ')';
                          AbreTransacao;
                          DmExporterQuick.TbCeLotes.ExecSQL(True);
                          ConfirmaTransacao;
                        end;
                       DmExporterQuick.CdsCdLancamentoLoja.Next;
                     end;
                 end;
              end;
          end;

         DmExporterQuick.CdsNumeroLancamentosLoja.Close;
         DmExporterQuick.CdsCdLancamento.Close;

         repeat
           DmExporterQuick.CdsCeLotes.Close;
           DmExporterQuick.TbCeLotes.CommandText := 'INSERT INTO TEMP_LANCAMENTOS2 SELECT FIRST 2000 CD_LANCAMENTO FROM TEMP_LANCAMENTOS';
           DmExporterQuick.TbCeLotes.ExecSQL(True);

           DmExporterQuick.TbCeLotes.CommandText := Sql;
           AbreTransacao;
           DmExporterQuick.CdsCeLotes.Open;
           ConfirmaTransacao;
           if DmExporterQuick.CdsCeLotes.RecordCount <> 0 then
            begin
             GravaLog(TimetoStr(Time) + ' - Enviando Lancamentos: ' + FloatToStr(DmExporterQuick.CdsCeLotes.RecordCount));
             //DmExporterQuick.CdsCeLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'DmExporterQuick.CdsLotes.xml', dfXML);
             if (DmExporterQuick.HTTPRIO1 as IDm).Processa(1, Filial, DmExporterQuick.CdsCeLotes.Data) then
               begin
                 DmExporterQuick.TbCeLotes.Close;
                 DmExporterQuick.TbCeLotes.CommandText := 'DELETE FROM TEMP_LANCAMENTOS WHERE CD_LANCAMENTO IN (SELECT CD_LANCAMENTO FROM TEMP_LANCAMENTOS2)';
                 AbreTransacao;
                 DmExporterQuick.TbCeLotes.ExecSQL(True);
                 ConfirmaTransacao;
                 DmExporterQuick.TbCeLotes.CommandText := 'DELETE FROM TEMP_LANCAMENTOS2';
                 AbreTransacao;
                 DmExporterQuick.TbCeLotes.ExecSQL(True);
                 ConfirmaTransacao;
               end;
            end;
            //VerificaConexao('');
         until DmExporterQuick.CdsCeLotes.RecordCount = 0;

      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Lancamentos - '+E.Message);
            DmExporterQuick.CdsNumeroLancamentosLoja.Close;
            DmExporterQuick.CdsCdLancamento.Close;
            DmExporterQuick.CdsCeLotes.Close;

            DmExporterQuick.TbCeLotes.Close;
            DmExporterQuick.TbCeLotes.CommandText := 'DELETE FROM TEMP_LANCAMENTOS2';
            AbreTransacao;
            DmExporterQuick.TbCeLotes.ExecSQL(True);
            ConfirmaTransacao;

            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsCeLotes.Close;
  End;
end;


procedure TFrmExporterClientQuick.EnvioCaixa;
var Dados : Variant;
begin
  //processamento e envio de Cecaixa.dat
  Try
      Try
        Sql := DmExporterQuick.TbCeCaixa.CommandText;

        Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(1001, Filial, 'A');
        if Dados <> null then
         begin
            NCaixa := Dados;

            DmExporterQuick.CdsNumeroCaixaLoja.Close;
            AbreTransacao;
            DmExporterQuick.CdsNumeroCaixaLoja.Open;
            ConfirmaTransacao;
            NCaixaLoja := DmExporterQuick.CdsNumeroCaixaLojaCOUNT.AsInteger;

            if NCaixaLoja <> NCaixa then
             begin
               DmExporterQuick.CdsCdCaixa.Close;
               DmExporterQuick.CdsCdCaixa.CreateDataSet;
               Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(1003, Filial, 'A');
               if Dados <> null then
                begin
                   DmExporterQuick.CdsCdCaixa.Data := Dados;
                   DmExporterQuick.CdsCdCaixa.Open; // virtual
                   DmExporterQuick.CdsCdCaixa.IndexFieldNames := 'CD_CAIXA';
                   DmExporterQuick.CdsCdCaixa.First;

                   DmExporterQuick.CdsCdCaixaLoja.Close;
                   AbreTransacao;
                   DmExporterQuick.CdsCdCaixaLoja.Open;
                   ConfirmaTransacao;
                   DmExporterQuick.CdsCdCaixaLoja.IndexFieldNames := 'CD_CAIXA';
                   DmExporterQuick.CdsCdCaixaLoja.First;
                   while not DmExporterQuick.CdsCdCaixaLoja.Eof do
                    begin
                      if not DmExporterQuick.CdsCdCaixa.FindKey([DmExporterQuick.CdsCdCaixaLojaCD_CAIXA.AsFloat]) then
                       begin
                         DmExporterQuick.TbCeCaixa.CommandText := 'UPDATE CAIXA SET ENVIADO = ' + '''' + ' ' + '''' +
                                                  ' WHERE CD_CAIXA = ' + InttoStr(DmExporterQuick.CdsCdCaixaLojaCD_CAIXA.AsInteger);
                         AbreTransacao;
                         DmExporterQuick.TbCeCaixa.ExecSQL(True);
                         ConfirmaTransacao;
                       end;
                      DmExporterQuick.CdsCdCaixaLoja.Next;
                    end;
                end;
             end;
         end;

        DmExporterQuick.CdsCdCaixaLoja.Close;
        DmExporterQuick.CdsCdCaixa.Close;

        DmExporterQuick.TbCeCaixa.CommandText := 'UPDATE CAIXA SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
        AbreTransacao;
        DmExporterQuick.TbCeCaixa.ExecSQL;
        ConfirmaTransacao;
        DmExporterQuick.TbCeCaixa.CommandText := Sql;

        AbreTransacao;
        DmExporterQuick.CdsCeCaixa.Open;
        ConfirmaTransacao;
        if DmExporterQuick.CdsCeCaixa.RecordCount <> 0 then
         begin
          GravaLog(TimetoStr(Time) + ' - Enviando Caixa: ' + FloatToStr(DmExporterQuick.CdsCeCaixa.RecordCount));
          //VerificaConexao('');
          if (DmExporterQuick.HTTPRIO1 as IDm).Processa(2, Filial, DmExporterQuick.CdsCeCaixa.Data) then
            begin
              DmExporterQuick.CdsCeCaixa.Close;
              DmExporterQuick.TbCeCaixa.Close;
              DmExporterQuick.TbCeCaixa.CommandText := 'UPDATE CAIXA SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.TbCeCaixa.ExecSQL(True);
              ConfirmaTransacao;
            end;
         end;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Caixa - '+ E.Message);
            DmExporterQuick.CdsCdCaixaLoja.Close;
            DmExporterQuick.CdsCdCaixa.Close;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsCeCaixa.Close;
  End;
end;


procedure TFrmExporterClientQuick.BuscaMatrizProdutosIncluidos;
var Dados : Variant;
begin
  //Busca na matriz os novos produtos incluidos
   Try
     DmExporterQuick.CdsIncluiProdutos.Close;
     DmExporterQuick.CdsIncluiProdutos.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(103, Filial, 'A');
     if Dados = null then
        Exit;
     DmExporterQuick.CdsIncluiProdutos.Data := Dados;
     DmExporterQuick.CdsIncluiProdutos.Open; // virtual
     if DmExporterQuick.CdsIncluiProdutos.RecordCount > 0 then
        begin
           DmExporterQuick.CdsIncluiProdutos.First;
           GravaLog(TimetoStr(Time) + ' - Novos Produtos Recebidos: ' + FloatToStr(DmExporterQuick.CdsIncluiProdutos.RecordCount));
           while not DmExporterQuick.CdsIncluiProdutos.Eof do
            begin
              DmExporterQuick.CdsCeProdutos.Close;
              DmExporterQuick.TbCeProdutos.CommandText := 'SELECT ID_PRODUTO FROM PRODUTOS WHERE ID_PRODUTO = ' + DmExporterQuick.CdsIncluiProdutosID_PRODUTO.AsString;
              DmExporterQuick.CdsCeProdutos.FetchParams;
              DmExporterQuick.CdsCeProdutos.Open;
              if DmExporterQuick.CdsCeProdutos.RecordCount = 0 then
               begin
                 Id_Produto       := DmExporterQuick.CdsIncluiProdutosID_PRODUTO.AsString;
                 Cd_Produto       := QuotedStr(DmExporterQuick.CdsIncluiProdutosCD_PRODUTO.AsString);
                 CodigoBarras     := QuotedStr(DmExporterQuick.CdsIncluiProdutosCODIGO_BARRAS_1.AsString);
                 if DmExporterQuick.CdsIncluiProdutosCODIGO_BARRAS_2.IsNull then
                     CodigoBarras2     := QuotedStr('')
                 else
                     CodigoBarras2     := QuotedStr(DmExporterQuick.CdsIncluiProdutosCODIGO_BARRAS_2.AsString);
                 Descricao        := QuotedStr(DmExporterQuick.CdsIncluiProdutosDESCRICAO.AsString);
                 Cd_Laboratorio   := DmExporterQuick.CdsIncluiProdutosCD_LABORATORIO.AsString;
                 Cd_Grupo         := DmExporterQuick.CdsIncluiProdutosCD_GRUPO.AsString;
                 Cd_Classe        := DmExporterQuick.CdsIncluiProdutosCD_CLASSE.AsString;
                 TipoProduto      := QuotedStr(DmExporterQuick.CdsIncluiProdutosTIPO_PRODUTO.AsString);
                 EntraPE          := QuotedStr(DmExporterQuick.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.AsString);

                 if not (DmExporterQuick.CdsIncluiProdutosCD_LISTA.IsNull) then
                    Cd_Lista         := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosCD_LISTA.AsString, '.', ''), ',', '.')
                 else
                    Cd_Lista         := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCD_PRINCIPIO.IsNull) then
                    Cd_Principio     := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosCD_PRINCIPIO.AsString, '.', ''), ',', '.')
                 else
                    Cd_Principio     := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosTX_DESCONTO.IsNull) then
                    TxDesconto       := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosTX_DESCONTO.AsString, '.', ''), ',', '.')
                 else
                    TxDesconto       := QuotedStr('0');
                 if not (DmExporterQuick.CdsIncluiProdutosIDENTIFICADOR.IsNull) and (DmExporterQuick.CdsIncluiProdutosIDENTIFICADOR.AsString <> '')  then
                    Identificador    := QuotedStr(DmExporterQuick.CdsIncluiProdutosIDENTIFICADOR.AsString)
                 else
                    Identificador    := QuotedStr('M');
                 if not (DmExporterQuick.CdsIncluiProdutosBALANCA.IsNull) and (DmExporterQuick.CdsIncluiProdutosBALANCA.AsString <> '')  then
                    Balanca          := QuotedStr(DmExporterQuick.CdsIncluiProdutosBALANCA.AsString)
                 else
                    Balanca          := QuotedStr('N');
                 if not (DmExporterQuick.CdsIncluiProdutosUNIDADE.IsNull) and (DmExporterQuick.CdsIncluiProdutosUNIDADE.AsString <> '')  then
                    Unidade          := QuotedStr(DmExporterQuick.CdsIncluiProdutosUNIDADE.AsString)
                 else
                    Unidade          := QuotedStr('UN');
                 if not DmExporterQuick.CdsIncluiProdutosQT_EMBALAGEM.IsNull then
                    Qt_Embalagem     := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosQT_EMBALAGEM.AsString, '.', ''), ',', '.')
                 else
                    Qt_Embalagem     := QuotedStr('0');
                 if not DmExporterQuick.CdsIncluiProdutosCOMISSAO.IsNull then
                    Comissao         := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosCOMISSAO.AsString, '.', ''), ',', '.')
                 else
                    Comissao         := QuotedStr('0');
                 if not DmExporterQuick.CdsIncluiProdutosCUSTO_UNITARIO.IsNull then
                    CustoUnitario    := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosCUSTO_UNITARIO.AsString, '.', ''), ',', '.')
                 else
                    CustoUnitario    := QuotedStr('0');
                 if not DmExporterQuick.CdsIncluiProdutosPRECO_VENDA.IsNull then
                    Preco_Venda      := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosPRECO_VENDA.AsString, '.', ''), ',', '.')
                 else
                    Preco_Venda      := QuotedStr('0');
                 if not DmExporterQuick.CdsIncluiProdutosPRECO_PROMOCAO.IsNull then
                    Preco_Promocao   := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosPRECO_PROMOCAO.AsString, '.', ''), ',', '.')
                 else
                    Preco_Promocao   := QuotedStr('0');
                 if not DmExporterQuick.CdsIncluiProdutosICMS.IsNull then
                    Icms             := QuotedStr(DmExporterQuick.CdsIncluiProdutosICMS.AsString)
                 else
                    Icms             := QuotedStr('FF');
                 if not DmExporterQuick.CdsIncluiProdutosMARGEM.IsNull then
                    Margem           := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosMARGEM.AsString, '.', ''), ',', '.')
                 else
                    Margem           := QuotedStr('0');
                 if not DmExporterQuick.CdsIncluiProdutosMARGEM_PROMOCAO.IsNull then
                    Margem_Promocao  := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosMARGEM_PROMOCAO.AsString, '.', ''), ',', '.')
                 else
                    Margem_Promocao  := QuotedStr('0');
                 if not DmExporterQuick.CdsIncluiProdutosDT_CADASTRO.IsNull then
                    Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsIncluiProdutosDT_CADASTRO.AsDateTime))
                 else
                    Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', Date));
                 if not DmExporterQuick.CdsIncluiProdutosCURVA.IsNull then
                    Curva            := QuotedStr(DmExporterQuick.CdsIncluiProdutosCURVA.AsString)
                 else
                    Curva            := QuotedStr('C');
                 if not DmExporterQuick.CdsIncluiProdutosSTATUS.IsNull then
                    Status           := QuotedStr(DmExporterQuick.CdsIncluiProdutosSTATUS.AsString)
                 else
                    Status           := QuotedStr('A');
                 if not DmExporterQuick.CdsIncluiProdutosUSOCONTINUO.IsNull then
                    UsoContinuo      := QuotedStr(DmExporterQuick.CdsIncluiProdutosUSOCONTINUO.AsString)
                 else
                    UsoContinuo      := QuotedStr('N');

                 DmExporterQuick.SQL1.CommandText := 'INSERT INTO PRODUTOS (ID_PRODUTO, CD_PRODUTO, CODIGO_BARRAS_1, CODIGO_BARRAS_2, DESCRICAO, ' +
                                     ' CD_LABORATORIO, CD_GRUPO, CD_CLASSE, TIPO_PRODUTO, IDENTIFICADOR, QT_EMBALAGEM, ' +
                                     ' COMISSAO, CUSTO_UNITARIO, CUSTO_UNITARIO_' + IntToStr(Filial) + ', CUSTO_MEDIO, CUSTO_MEDIO_' + IntToStr(Filial) +
                                     ', PRECO_VENDA, PRECO_PROMOCAO, ICMS, ' +
                                     ' MARGEM, MARGEM_PROMOCAO, DT_CADASTRO, CURVA, ENTRA_PEDIDO_ELETRONICO, STATUS, ' +
                                     ' CD_LISTA, CD_PRINCIPIO, USOCONTINUO ) VALUES (' +
                                     Id_Produto + ',' + Cd_Produto + ',' + CodigoBarras + ',' + CodigoBarras2 + ',' + Descricao + ',' +
                                     Cd_Laboratorio + ',' + Cd_Grupo + ',' + Cd_Classe + ',' + TipoProduto + ',' +
                                     Identificador + ',' + Qt_Embalagem + ',' + Comissao + ',' +
                                     CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' +
                                     Preco_Venda + ',' + Preco_Promocao + ',' + Icms + ',' + Margem + ',' +
                                     Margem_Promocao + ',' + Dt_Cadastro + ',' + Curva + ',' + EntraPE + ',' + Status + ',' +
                                     Cd_Lista + ',' + Cd_Principio + ',' + UsoContinuo + ')';
                 AbreTransacao;
                 DmExporterQuick.SQL1.ExecSQL(True);
                 ConfirmaTransacao;
               end;
              DmExporterQuick.CdsIncluiProdutos.Next;
            end;
           DmExporterQuick.CdsIncluiProdutos.Close;
           DmExporterQuick.CdsCeProdutos.Close;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Recebendo Novos Produtos - '+ E.Message);
         DmExporterQuick.CdsIncluiProdutos.Close;
         DmExporterQuick.CdsCeProdutos.Close;
         Try
           DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
           AbreTransacao;
           DmExporterQuick.SQL1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           CancelaTransacao;
         End;
         Exit;
       end;
   end;
   DmExporterQuick.CdsCeProdutos.Close;
   Try
     DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
     AbreTransacao;
     DmExporterQuick.SQL1.ExecSQL(True);
     ConfirmaTransacao;
   Except
     CancelaTransacao;
   End;

   DmExporterQuick.CdsCeProdutos.Close;
end;


procedure TFrmExporterClientQuick.EnviandoEstoque;
var
 Dados : Variant;
 Classes, Grupos, Laboratorios, Distribuidores,
 Familias, GruposBalanco, GruposCompras, Cartoes : Real;
begin
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //envia para a matriz a posicao de estoque, estoque minimo, data ultima venda de cada produto da filial
   Try
      DmExporterQuick.TbCeProdutos.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSQL(True);
      ConfirmaTransacao;

      DmExporterQuick.CdsCeProdutos.Close;
      DmExporterQuick.TbCeProdutos.CommandText := 'UPDATE PRODUTOS SET ENVIADO = '+''''+'9'+''''+' WHERE (ENVIADO <> '+''''+'2'+''''+' OR ENVIADO IS NULL)';
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSQL(True);
      ConfirmaTransacao;

      try
        DmExporterQuick.CdsControlador.Close;
        DmExporterQuick.SqlControlador.CommandText := 'SELECT COUNT(ID_PRODUTO) AS N_ITENS, ' +
                                      'SUM(ESTOQUE_' + InttoStr(Filial) + ') AS N_UNIDADES, ' +
                                      'SUM(CUSTO_UNITARIO_' + InttoStr(Filial) + ') AS T_CUSTO, ' +
                                      'SUM(PRECO_VENDA) AS T_VENDA, ' +
                                      'SUM(PRECO_VENDA) AS CLASSES, ' +
                                      'SUM(PRECO_VENDA) AS GRUPOS, ' +
                                      'SUM(PRECO_VENDA) AS LABORATORIOS, ' +
                                      'SUM(PRECO_VENDA) AS DISTRIBUIDORES, ' +
                                      'SUM(PRECO_VENDA) AS FAMILIAS, ' +
                                      'SUM(PRECO_VENDA) AS GRUPOSBALANCO, ' +
                                      'SUM(PRECO_VENDA) AS GRUPOSCOMPRAS, ' +
                                      'SUM(PRECO_VENDA) AS CARTOES ' +
                                      'FROM PRODUTOS';

        DmExporterQuick.CdsControlador.Open;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS CLASSE FROM CLASSES';
        DmExporterQuick.Cds1.Open;
        Classes := DmExporterQuick.Cds1.FieldByName('CLASSE').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS GRUPO FROM GRUPOS';
        DmExporterQuick.Cds1.Open;
        Grupos := DmExporterQuick.Cds1.FieldByName('GRUPO').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS LABORATORIO FROM LABORATORIOS';
        DmExporterQuick.Cds1.Open;
        Laboratorios := DmExporterQuick.Cds1.FieldByName('LABORATORIO').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS DISTRIBUIDOR FROM DISTRIBUIDORES';
        DmExporterQuick.Cds1.Open;
        Distribuidores := DmExporterQuick.Cds1.FieldByName('DISTRIBUIDOR').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS FAMILIA FROM FAMILIAS';
        DmExporterQuick.Cds1.Open;
        Familias := DmExporterQuick.Cds1.FieldByName('FAMILIA').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS GRUPOSBALANCO FROM GRUPOSBALANCO';
        DmExporterQuick.Cds1.Open;
        GruposBalanco := DmExporterQuick.Cds1.FieldByName('GRUPOSBALANCO').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS GRUPOSCOMPRAS FROM GRUPOSCOMPRAS';
        DmExporterQuick.Cds1.Open;
        GruposCompras := DmExporterQuick.Cds1.FieldByName('GRUPOSCOMPRAS').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS CARTOES FROM CARTOES';
        DmExporterQuick.Cds1.Open;
        Cartoes := DmExporterQuick.Cds1.FieldByName('CARTOES').AsFloat;

        DmExporterQuick.Cds1.Close;

        DmExporterQuick.CdsControlador.Edit;
        DmExporterQuick.CdsControladorCLASSES.AsFloat := Classes;
        DmExporterQuick.CdsControladorGRUPOS.AsFloat := Grupos;
        DmExporterQuick.CdsControladorLABORATORIOS.AsFloat := Laboratorios;
        DmExporterQuick.CdsControladorDISTRIBUIDORES.AsFloat := Distribuidores;
        DmExporterQuick.CdsControladorFAMILIAS.AsFloat := Familias;
        DmExporterQuick.CdsControladorGRUPOSBALANCO.AsFloat := GruposBalanco;
        DmExporterQuick.CdsControladorGRUPOSCOMPRAS.AsFloat := GruposCompras;
        DmExporterQuick.CdsControladorCARTOES.AsFloat := Cartoes;
        DmExporterQuick.CdsControlador.Post;
        
        (DmExporterQuick.HTTPRIO1 as IDm).Processa(0, Filial, DmExporterQuick.CdsControlador.Data);
        DmExporterQuick.CdsControlador.Close;
      except
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - Não foi possível fazer a consistencia de dados. 1');
        DmExporterQuick.CdsControlador.Close;
        Exit;
      end;

      DmExporterQuick.TbCeProdutos.CommandText :=  'SELECT ID_PRODUTO, CD_PRODUTO, CODIGO_BARRAS_1, ' +
                                   ' ESTOQUE_' + FloatToStr(Filial) + ', ' +
                                   ' ESTOQUE_MINIMO_' + FloatToStr(Filial) + ', ' +
                                   ' ESTOQUE_MAXIMO_' + FloatToStr(Filial) + ', ' +
                                   ' DT_ULT_VENDA_' + FloatToStr(Filial) + ' ,' +
                                   ' DT_ULT_COMPRA_' + FloatToStr(Filial) + ', ' +
                                   ' CAST(CUSTO_UNITARIO_' + FloatToStr(Filial) + ' AS NUMERIC(10,2)) AS CUSTO_UNITARIO_' + FloatToStr(Filial) + ', ' +
                                   ' CAST(CUSTO_MEDIO_' + FloatToStr(Filial) + ' AS NUMERIC(10,2)) AS CUSTO_MEDIO_' + FloatToStr(Filial) + ', ' +
                                   ' FACE_' + FloatToStr(Filial) + ', ' +
                                   ' CURVA_UNITARIA_' + FloatToStr(Filial) + ', ' +
                                   ' CURVA_FINANCEIRA_' + FloatToStr(Filial) + ', ' +
                                   ' CAST(MEDIAF_' + FloatToStr(Filial)+ ' AS NUMERIC(10,2)) AS MEDIAF_' + FloatToStr(Filial);

      DmExporterQuick.TbCeProdutos.CommandText := DmExporterQuick.TbCeProdutos.CommandText + ' FROM PRODUTOS ' +
                                                             ' WHERE ENVIADO = ' + '''' + '9' + '''';

      DmExporterQuick.CdsCeProdutos.FetchParams;
      AbreTransacao;
      DmExporterQuick.CdsCeProdutos.Open;
      ConfirmaTransacao;

      try
        DmExporterQuick.CdsControlador.Close;
        DmExporterQuick.SqlControlador.CommandText := 'SELECT COUNT(ID_PRODUTO) AS N_ITENS, ' +
                                      'SUM(ESTOQUE_' + InttoStr(Filial) + ') AS N_UNIDADES, ' +
                                      'SUM(CUSTO_UNITARIO_' + InttoStr(Filial) + ') AS T_CUSTO, ' +
                                      'SUM(PRECO_VENDA) AS T_VENDA, ' +
                                      'SUM(PRECO_VENDA) AS CLASSES, ' +
                                      'SUM(PRECO_VENDA) AS GRUPOS, ' +
                                      'SUM(PRECO_VENDA) AS LABORATORIOS, ' +
                                      'SUM(PRECO_VENDA) AS DISTRIBUIDORES, ' +
                                      'SUM(PRECO_VENDA) AS FAMILIAS, ' +
                                      'SUM(PRECO_VENDA) AS GRUPOSBALANCO, ' +
                                      'SUM(PRECO_VENDA) AS GRUPOSCOMPRAS, ' +
                                      'SUM(PRECO_VENDA) AS CARTOES ' +
                                      'FROM PRODUTOS';

        DmExporterQuick.CdsControlador.Open;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS CLASSE FROM CLASSES';
        DmExporterQuick.Cds1.Open;
        Classes := DmExporterQuick.Cds1.FieldByName('CLASSE').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS GRUPO FROM GRUPOS';
        DmExporterQuick.Cds1.Open;
        Grupos := DmExporterQuick.Cds1.FieldByName('GRUPO').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS LABORATORIO FROM LABORATORIOS';
        DmExporterQuick.Cds1.Open;
        Laboratorios := DmExporterQuick.Cds1.FieldByName('LABORATORIO').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS DISTRIBUIDOR FROM DISTRIBUIDORES';
        DmExporterQuick.Cds1.Open;
        Distribuidores := DmExporterQuick.Cds1.FieldByName('DISTRIBUIDOR').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS FAMILIA FROM FAMILIAS';
        DmExporterQuick.Cds1.Open;
        Familias := DmExporterQuick.Cds1.FieldByName('FAMILIA').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS GRUPOSBALANCO FROM GRUPOSBALANCO';
        DmExporterQuick.Cds1.Open;
        GruposBalanco := DmExporterQuick.Cds1.FieldByName('GRUPOSBALANCO').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS GRUPOSCOMPRAS FROM GRUPOSCOMPRAS';
        DmExporterQuick.Cds1.Open;
        GruposCompras := DmExporterQuick.Cds1.FieldByName('GRUPOSCOMPRAS').AsFloat;

        DmExporterQuick.Cds1.Close;
        DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) AS CARTOES FROM CARTOES';
        DmExporterQuick.Cds1.Open;
        Cartoes := DmExporterQuick.Cds1.FieldByName('CARTOES').AsFloat;

        DmExporterQuick.Cds1.Close;

        DmExporterQuick.CdsControlador.Edit;
        DmExporterQuick.CdsControladorCLASSES.AsFloat := Classes;
        DmExporterQuick.CdsControladorGRUPOS.AsFloat := Grupos;
        DmExporterQuick.CdsControladorLABORATORIOS.AsFloat := Laboratorios;
        DmExporterQuick.CdsControladorDISTRIBUIDORES.AsFloat := Distribuidores;
        DmExporterQuick.CdsControladorFAMILIAS.AsFloat := Familias;
        DmExporterQuick.CdsControladorGRUPOSBALANCO.AsFloat := GruposBalanco;
        DmExporterQuick.CdsControladorGRUPOSCOMPRAS.AsFloat := GruposCompras;
        DmExporterQuick.CdsControladorCARTOES.AsFloat := Cartoes;
        DmExporterQuick.CdsControlador.Post;

        (DmExporterQuick.HTTPRIO1 as IDm).Processa(0, Filial, DmExporterQuick.CdsControlador.Data);
        DmExporterQuick.CdsControlador.Close;
      except
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - Não foi possível fazer a consistencia de dados. 2');
        DmExporterQuick.CdsControlador.Close;
        Exit;
      end;

      if DmExporterQuick.CdsCeProdutos.RecordCount <> 0 then
       begin
          //DmExporterQuick.CdsCeProdutos.SaveToFile(ExtractFilePath(Application.ExeName)+'DmExporterQuick.CdsPrecos.xml', dfXML);
          GravaLog(TimetoStr(Time) + ' - Enviando Estoque: ' + FloatToStr(DmExporterQuick.CdsCeProdutos.RecordCount));
          DmExporterQuick.CdsCeProdutos.IndexFieldNames := 'ID_PRODUTO';
          Dados := (DmExporterQuick.HTTPRIO1 as IDM).Processa(7, Filial, DmExporterQuick.CdsCeProdutos.Data);
          if (Dados <> null) and (Dados) then
           begin
              DmExporterQuick.TbCeProdutos.CommandText := 'UPDATE PRODUTOS SET ENVIADO = '+''''+'2'+''''+' WHERE ENVIADO = '+''''+'9'+'''';
              AbreTransacao;
              DmExporterQuick.TbCeProdutos.ExecSQL(True);
              ConfirmaTransacao;
           end;
       end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Estoques dos Produtos - '+E.Message);
         DmExporterQuick.CdsCeProdutos.Close;
         Try
          DmExporterQuick.TbCeProdutos.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
          AbreTransacao;
          DmExporterQuick.TbCeProdutos.ExecSQL(True);
          ConfirmaTransacao;
         Except
          CancelaTransacao;
         End;
         Exit;
       end;
   End;
   DmExporterQuick.CdsCeProdutos.Close;


  Try
   DmExporterQuick.TbCeProdutos.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
   AbreTransacao;
   DmExporterQuick.TbCeProdutos.ExecSQL(True);
   ConfirmaTransacao;
  Except
   CancelaTransacao;
  End;
end;


procedure TFrmExporterClientQuick.EnviandoOperadoresCaixa;
var Dados : Variant;
begin
  //envia para a matriz os dados de operadores de caixa
  Try
     Sql := DmExporterQuick.TbOperadores.CommandText;
     Try
      DmExporterQuick.TbOperadores.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_OPERADORES INACTIVE';
      AbreTransacao;
      DmExporterQuick.TbOperadores.ExecSQL(True);
      ConfirmaTransacao;
     Except
      CancelaTransacao;
     End;

     DmExporterQuick.TbOperadores.CommandText := 'UPDATE OPERADORES SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
     AbreTransacao;
     DmExporterQuick.TbOperadores.ExecSQL;
     ConfirmaTransacao;
     DmExporterQuick.TbOperadores.CommandText := Sql;
     AbreTransacao;
     DmExporterQuick.CdsOperadores.Open;
     ConfirmaTransacao;
     if DmExporterQuick.CdsOperadores.RecordCount <> 0 then
      begin
         GravaLog(TimetoStr(Time) + ' - Enviando Operadores de Caixa: ' + FloatToStr(DmExporterQuick.CdsOperadores.RecordCount));
         //VerificaConexao('');
         Dados := (DmExporterQuick.HTTPRIO1 as IDM).Processa(8, Filial, DmExporterQuick.CdsOperadores.Data);
         if Dados <> null then
          begin
            DmExporterQuick.CdsOperadores.Close;
            DmExporterQuick.TbOperadores.Close;
            DmExporterQuick.TbOperadores.CommandText := 'UPDATE OPERADORES SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' +  QuotedStr('9');
            AbreTransacao;
            DmExporterQuick.TbOperadores.ExecSQL(True);
            ConfirmaTransacao;
          end;
      end;
  Except
     on E:Exception do
      begin
        CancelaTransacao;
        Try
         DmExporterQuick.TbOperadores.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_OPERADORES ACTIVE';
         AbreTransacao;
         DmExporterQuick.TbOperadores.ExecSQL(True);
         ConfirmaTransacao;
        Except
         CancelaTransacao;
        End;
        GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Operadores de Caixa - '+E.Message);
        DmExporterQuick.CdsOperadores.Close;
        Exit;
      end;
  End;
  Try
   DmExporterQuick.TbOperadores.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_OPERADORES ACTIVE';
   AbreTransacao;
   DmExporterQuick.TbOperadores.ExecSQL(True);
   ConfirmaTransacao;
  Except
   CancelaTransacao;
  End;
  DmExporterQuick.CdsOperadores.Close;
end;


procedure TFrmExporterClientQuick.EnviandoClientes;
var
 Dados : Variant;
 Sql : String;
begin
  //envia para a matriz os dados de Clientes
  Try
     Sql := DmExporterQuick.TbCeClientes.CommandText;
     DmExporterQuick.TbCeClientes.CommandText := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE PROCESSO = 14';
     AbreTransacao;
     DmExporterQuick.TbCeClientes.ExecSQL(True);
     ConfirmaTransacao;
     DmExporterQuick.TbCeClientes.CommandText := Sql;
     DmExporterQuick.CdsCeClientes.Open;
     if DmExporterQuick.CdsCeClientes.RecordCount <> 0 then
      begin
         try
             GravaLog(TimetoStr(Time) + ' - Enviando Clientes: '+ FloatToStr(DmExporterQuick.CdsCeClientes.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDM).Processa(14, Filial, DmExporterQuick.CdsCeClientes.Data);
             if (Dados <> null) and (Dados) then
              begin
                DmExporterQuick.CdsCeClientes.Close;
              end;
         except
           CancelaTransacao;
         end;
      end;
     DmExporterQuick.TbCeClientes.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 14';
     AbreTransacao;
     DmExporterQuick.TbCeClientes.ExecSQL(True);
     ConfirmaTransacao;
  Except
     on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Envio de Clientes - '+E.Message);
        Exit;
      end;
  End;
  DmExporterQuick.CdsCeClientes.Close;
end;


procedure TFrmExporterClientQuick.EnviandoCRM;
var Dados : Variant;
begin
  //envia para a matriz os dados de CRM
  Try
     Sql := DmExporterQuick.SqlCRM.CommandText;
     DmExporterQuick.SqlCRM.CommandText := 'UPDATE CRM SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
     AbreTransacao;
     DmExporterQuick.SqlCRM.ExecSQL;
     ConfirmaTransacao;
     DmExporterQuick.SqlCRM.CommandText := Sql;
     AbreTransacao;
     DmExporterQuick.CdsCRM.Open;
     ConfirmaTransacao;
     if DmExporterQuick.CdsCRM.RecordCount <> 0 then
      begin
         GravaLog(TimetoStr(Time) + ' - Enviando CRM: ' + FloatToStr(DmExporterQuick.CdsCRM.RecordCount));
         //VerificaConexao('');
         Dados := (DmExporterQuick.HTTPRIO1 as IDM).Processa(15, Filial, DmExporterQuick.CdsCRM.Data);
         if (Dados <> null) and (Dados) then
          begin
            DmExporterQuick.CdsCRM.Close;
            DmExporterQuick.SqlCRM.Close;
            DmExporterQuick.SqlCRM.CommandText := 'UPDATE CRM SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' +  QuotedStr('9');
            AbreTransacao;
            DmExporterQuick.SqlCRM.ExecSQL(True);
            ConfirmaTransacao;
          end;
      end;
  Except
     on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de CRM - '+E.Message);
        DmExporterQuick.CdsCRM.Close;
        Exit;
      end;
  End;
  DmExporterQuick.CdsCRM.Close;
end;


procedure TFrmExporterClientQuick.EnviandoEntregas;
var Dados : Variant;
begin
  //envia para a matriz os dados de entregas
  Try
      Try
         Sql := DmExporterQuick.TbEntregas.CommandText;
         Try
           DmExporterQuick.TbEntregas.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_ENTREGAS INACTIVE';
           AbreTransacao;
           DmExporterQuick.TbEntregas.ExecSQL;
           ConfirmaTransacao;
         Except
           CancelaTransacao;
         End;

         DmExporterQuick.TbEntregas.CommandText := 'UPDATE ENTREGAS SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
         AbreTransacao;
         DmExporterQuick.TbEntregas.ExecSQL;
         ConfirmaTransacao;
         DmExporterQuick.TbEntregas.CommandText := Sql;
         AbreTransacao;
         DmExporterQuick.CdsEntregas.Open;
         ConfirmaTransacao;
         if DmExporterQuick.CdsEntregas.RecordCount <> 0 then
          begin
             //VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando Entregas: ' + FloatToStr(DmExporterQuick.CdsEntregas.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(9, Filial, DmExporterQuick.CdsEntregas.Data);
             if (Dados <> null) and (Dados) then
               begin
                 DmExporterQuick.CdsEntregas.Close;
                 DmExporterQuick.TbEntregas.Close;
                 DmExporterQuick.TbEntregas.CommandText := 'UPDATE ENTREGAS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                 AbreTransacao;
                 DmExporterQuick.TbEntregas.ExecSQL(True);
                 ConfirmaTransacao;
               end;
          end;
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Entregas - '+E.Message);
            DmExporterQuick.CdsEntregas.Close;
            Try
              DmExporterQuick.TbEntregas.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_ENTREGAS ACTIVE';
              AbreTransacao;
              DmExporterQuick.TbEntregas.ExecSQL;
              ConfirmaTransacao;
            Except
              CancelaTransacao;
            End;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsEntregas.Close;
    Try
      DmExporterQuick.TbEntregas.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_ENTREGAS ACTIVE';
      AbreTransacao;
      DmExporterQuick.TbEntregas.ExecSQL;
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    End;

  End;
end;


procedure TFrmExporterClientQuick.EnviandoChequesRecebidos;
var Dados : Variant;
begin
  //envia para a matriz os dados de cheques recebidos
  Try
      Try
         Sql := DmExporterQuick.TbCheques.CommandText;
         DmExporterQuick.TbCheques.CommandText := 'UPDATE CHEQUESRECEBIDOS SET ENVIADO = '+QuotedStr('9')+' WHERE (ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2')+')';
         AbreTransacao;
         DmExporterQuick.TbCheques.ExecSQL;
         ConfirmaTransacao;
         DmExporterQuick.TbCheques.CommandText := Sql;
         AbreTransacao;
         DmExporterQuick.CdsCheques.Open;
         ConfirmaTransacao;
         if DmExporterQuick.CdsCheques.RecordCount <> 0 then
          begin
             //VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando Cheques Recebidos: ' + FloatToStr(DmExporterQuick.CdsCheques.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(10, Filial, DmExporterQuick.CdsCheques.Data);
             if (Dados <> null) and (Dados) then
               begin
                 DmExporterQuick.CdsCheques.Close;
                 DmExporterQuick.TbCheques.Close;
                 DmExporterQuick.TbCheques.CommandText := 'UPDATE CHEQUESRECEBIDOS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                 AbreTransacao;
                 DmExporterQuick.TbCheques.ExecSQL(True);
                 ConfirmaTransacao;
               end;
          end;
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Cheques - '+E.Message);
            DmExporterQuick.CdsCheques.Close;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsCheques.Close;
  End;
end;


procedure TFrmExporterClientQuick.EnviandoTransfer;
var Dados : Variant;
begin
  //envia para a matriz os dados de Transfer
  Try
      Try
        DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER INACTIVE';
        AbreTransacao;
        DmExporterQuick.SQL1.ExecSQL(True);
        ConfirmaTransacao;
      Except
        CancelaTransacao;
      End;

      Sql := 'SELECT * FROM TRANSFER WHERE STATUS <> '''+'A'+''' AND ENVIADO = '''+'9'+'''';
      DmExporterQuick.CdsCeTransfer.Close;
      Try
         DmExporterQuick.TbTransfer.CommandText := 'UPDATE TRANSFER SET ENVIADO = '+QuotedStr('9')+' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> '+QuotedStr('2')+')) AND (STATUS <> ''' + 'A' + ''')';
         AbreTransacao;
         DmExporterQuick.TbTransfer.ExecSQL;
         ConfirmaTransacao;
         DmExporterQuick.CdsCeTransfer.Close;

         Try
           EnviandoItensTransfer;
         Except
           on E:Exception do
             begin
               CancelaTransacao;
               GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de ItensTransfer - ' + E.Message);
               DmExporterQuick.CdsCeItensTransfer.Close;
               Exit;
             end;
         end;
         
         DmExporterQuick.TbTransfer.CommandText := Sql;
         AbreTransacao;
         DmExporterQuick.CdsCeTransfer.Open;
         ConfirmaTransacao;
         if DmExporterQuick.CdsCeTransfer.RecordCount > 0 then
          begin
             //VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando Transfer: ' + FloatToStr(DmExporterQuick.CdsCeTransfer.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(11, Filial, DmExporterQuick.CdsCeTransfer.Data);
             if (Dados <> null) and (Dados) then
               begin
                 DmExporterQuick.CdsCeTransfer.Close;
                 DmExporterQuick.TbTransfer.Close;
                 DmExporterQuick.TbTransfer.CommandText := 'UPDATE TRANSFER SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                 DmExporterQuick.TbTransfer.ExecSQL(True);
               end;
          end;
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Transfer - '+E.Message);
            DmExporterQuick.CdsCeTransfer.Close;
            Try
              DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
              AbreTransacao;
              DmExporterQuick.SQL1.ExecSQL(True);
              ConfirmaTransacao;
            Except
              CancelaTransacao;
            End;
            DmExporterQuick.CdsCeTransfer.Close;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsCeTransfer.Close;
    Try
      DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
      AbreTransacao;
      DmExporterQuick.SQL1.ExecSQL(True);
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    End;
  End;
end;


procedure TFrmExporterClientQuick.EnviandoItensTransfer;
var Dados : Variant;
begin
  //envia para a matriz os dados de ItensTransfer
  Try
      Try
         AbreTransacao;
         DmExporterQuick.CdsCeItensTransfer.Open;
         ConfirmaTransacao;
         if DmExporterQuick.CdsCeItensTransfer.RecordCount <> 0 then
          begin
             //VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando ItensTransfer: ' + FloatToStr(DmExporterQuick.CdsCeItensTransfer.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(12, Filial, DmExporterQuick.CdsCeItensTransfer.Data);
             if (Dados <> null) and (Dados) then
                 DmExporterQuick.CdsCeItensTransfer.Close;
          end;
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  ItensTransfer - '+E.Message);
            DmExporterQuick.CdsCeItensTransfer.Close;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsCeItensTransfer.Close;
  End;
end;


procedure TFrmExporterClientQuick.EnviandoCadernoFaltas;
var Dados : Variant;
begin
  //envia para a matriz os dados de CadernoFaltas
  Try
      Try
         AbreTransacao;
         DmExporterQuick.CdsCadernoFaltas.Open;
         ConfirmaTransacao;
         if DmExporterQuick.CdsCadernoFaltas.RecordCount <> 0 then
          begin
           GravaLog(TimetoStr(Time) + ' - Enviando Caderno Faltas: ' + FloatToStr(DmExporterQuick.CdsCadernoFaltas.RecordCount));
           try
               Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(13, Filial, DmExporterQuick.CdsCadernoFaltas.Data);
               if (Dados <> null) and (Dados) then
                 begin
                   DmExporterQuick.CdsCadernoFaltas.Close;
                 end;
           except
           end;
          end;
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Caderno Faltas - '+E.Message);
            DmExporterQuick.CdsCadernoFaltas.Close;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsCadernoFaltas.Close;
    DmExporterQuick.SQL1.CommandText := 'DELETE FROM CADERNO_FALTAS';
    Try
      AbreTransacao;
      DmExporterQuick.SQL1.ExecSQL(True);
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    end;
  End;
end;

procedure TFrmExporterClientQuick.EnviandoPrecosFilial;
var Dados : Variant;
begin
     Try
       AbreTransacao;
       DmExporterQuick.CdsPrecoVenda.Close;
       MontaSQL_Precos(InttoStr(Filial));
       DmExporterQuick.CdsPrecoVenda.Open;
       ConfirmaTransacao;
       if DmExporterQuick.CdsPrecoVenda.RecordCount <> 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Enviando Precos de Venda: ' + FloatToStr(DmExporterQuick.CdsPrecoVenda.RecordCount));
           Dados := (DmExporterQuick.HTTPRIO1 as IDm).Processa(52, Filial, DmExporterQuick.CdsPrecoVenda.Data);
           if (Dados <> null) and (Dados) then
              DmExporterQuick.CdsPrecoVenda.Close;
        end
       else
        begin
          Exit;
        end;
        
       DmExporterQuick.SQL1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 52 AND ENVIADO = '+QuotedStr('9');
       AbreTransacao;
       DmExporterQuick.SQL1.ExecSQL(True);
       ConfirmaTransacao;

       DmExporterQuick.SQL1.CommandText := 'DELETE FROM TEMP_PRODUTOS2';
       AbreTransacao;
       DmExporterQuick.SQL1.ExecSQL(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Preco de Venda - '+ E.Message);
          end;
     End;
end;

procedure TFrmExporterClientQuick.RecebendoTransfer;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz Transfer
   Try
     DmExporterQuick.CdsTransfer.Close;
     DmExporterQuick.CdsTransfer.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(117, Filial, 'A');
     if Dados = null then
        Exit;
     DmExporterQuick.CdsTransfer.Data := Dados;
     DmExporterQuick.CdsTransfer.Open; // virtual

     if DmExporterQuick.CdsTransfer.RecordCount <> 0 then
        begin
           GravaLog(TimetoStr(Time) + ' - Transferencias Recebidas: ' + FloatToStr(DmExporterQuick.CdsTransfer.RecordCount));
           while not DmExporterQuick.CdsTransfer.Eof do
            begin
               DmExporterQuick.QryTransfer.Close;
               DmExporterQuick.QryTransfer.Params[0].AsFloat := DmExporterQuick.CdsTransferCD_TRANSFER.AsFloat;

               AbreTransacao;
               DmExporterQuick.QryTransfer.Open;
               ConfirmaTransacao;

               if DmExporterQuick.QryTransfer.RecordCount = 0 then
                  DmExporterQuick.QryTransfer.Append
               else
                begin
                  if DmExporterQuick.QryTransferSTATUS.AsString = 'G' then
                   begin
                     if DmExporterQuick.CdsTransferSTATUS.AsString <> 'G' then
                        DmExporterQuick.QryTransfer.Edit;
                   end
                  else
                  if DmExporterQuick.QryTransferSTATUS.AsString = 'E' then
                   begin
                     if (DmExporterQuick.CdsTransferSTATUS.AsString = 'C') or (DmExporterQuick.CdsTransferSTATUS.AsString = 'X') then
                        DmExporterQuick.QryTransfer.Edit;
                   end;
                end;
               if DmExporterQuick.QryTransfer.State in [dsEdit, dsInsert] then
                begin
                   for i := 0 to DmExporterQuick.QryTransfer.FieldCount - 1 do
                       DmExporterQuick.QryTransfer.Fields[i].Value := DmExporterQuick.CdsTransfer.Fields[i].Value;
                   DmExporterQuick.QryTransfer.Post;

                   AbreTransacao;
                   DmExporterQuick.QryTransfer.ApplyUpdates(0);
                   ConfirmaTransacao;

                end;
               DmExporterQuick.CdsTransfer.Next;
            end;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Transferencias - '+ E.Message);
         DmExporterQuick.CdsTransfer.Close;
         DmExporterQuick.QryTransfer.Close;
         Exit;
       end;
   end;
  DmExporterQuick.CdsTransfer.Close;
  DmExporterQuick.QryTransfer.Close;
end;


procedure TFrmExporterClientQuick.RecebendoItensTransfer;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz ItensTransfer
   Try
     DmExporterQuick.CdsItensTransfer.Close;
     DmExporterQuick.CdsItensTransfer.CreateDataSet;
     DAdos := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(118, Filial, 'A');
     if Dados = null then
        Exit;
     DmExporterQuick.CdsItensTransfer.Data := Dados;
     DmExporterQuick.CdsItensTransfer.Open; // virtual
     DmExporterQuick.CdsItensTransfer.First;
     if DmExporterQuick.CdsItensTransfer.RecordCount > 0 then
        begin
           GravaLog(TimetoStr(Time) + ' - Itens_Transfer Recebidos: ' + FloatToStr(DmExporterQuick.CdsItensTransfer.RecordCount));
           while not DmExporterQuick.CdsItensTransfer.Eof do
            begin
               DmExporterQuick.QryItensTransfer.Close;
               DmExporterQuick.QryItensTransfer.Params[0].AsFloat := DmExporterQuick.CdsItensTransferCD_TRANSFER.AsFloat;
               DmExporterQuick.QryItensTransfer.Params[1].AsFloat := DmExporterQuick.CdsItensTransferID_PRODUTO.AsFloat;

               AbreTransacao;
               DmExporterQuick.QryItensTransfer.Open;
               ConfirmaTransacao;

               if DmExporterQuick.QryItensTransfer.RecordCount = 0 then
                  DmExporterQuick.QryItensTransfer.Append
               else
                begin
                   if DmExporterQuick.QryItensTransferSTATUS.AsString = 'G' then
                    begin
                      if DmExporterQuick.CdsItensTransferSTATUS.AsString <> 'G' then
                         DmExporterQuick.QryItensTransfer.Edit;
                    end
                   else
                   if DmExporterQuick.QryItensTransferSTATUS.AsString = 'E' then
                    begin
                      if (DmExporterQuick.CdsItensTransferSTATUS.AsString = 'C') or (DmExporterQuick.CdsTransferSTATUS.AsString = 'X') then
                         DmExporterQuick.QryItensTransfer.Edit;
                    end;
                end;
               if DmExporterQuick.QryItensTransfer.State in [dsInsert, dsEdit] then
                begin
                   for i := 0 to DmExporterQuick.QryItensTransfer.FieldCount - 1 do
                       DmExporterQuick.QryItensTransfer.Fields[i].Value := DmExporterQuick.CdsItensTransfer.Fields[i].Value;

                   AbreTransacao;
                   DmExporterQuick.QryItensTransfer.ApplyUpdates(0);
                   ConfirmaTransacao;
                end;
               DmExporterQuick.CdsItensTransfer.Next;
            end;
           DmExporterQuick.CdsItensTransfer.Close;
           DmExporterQuick.QryItensTransfer.Close;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Itens Transferencias - '+ E.Message);
         DmExporterQuick.CdsItensTransfer.Close;
         DmExporterQuick.CdsItensTransfer.Close;
         Exit;
       end;
   end;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function TFrmExporterClientQuick.RecebendoCadastro : Boolean;
var Dados : Variant;
begin
 //busca na matriz os cadastros dos produtos
 Try
   // Atualiza produtos
   Result := True;
   DmExporterQuick.CdsFiliais.Close;
   DmExporterQuick.CdsFiliais.Params[0].AsFloat := Filial;
   DmExporterQuick.CdsFiliais.Open;
   DmExporterQuick.CdsFiliais.First;
   DmExporterQuick.CdsCadastro.Close;
   Dados := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(119, Filial, 'A');
   if Dados = null then
    begin
      Result := False;
      Exit;
    end;
   DmExporterQuick.CdsCadastro.Data := Dados;
   DmExporterQuick.CdsCadastro.Open; // virtual
   if DmExporterQuick.CdsCadastro.RecordCount > 0 then
    begin
       Try
         GravaLog(TimetoStr(Time) + ' - ' + InttoStr(DmExporterQuick.CdsCadastro.RecordCount) + ' cadastros recebidos.');
         DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
         AbreTransacao;
         DmExporterQuick.SQL1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       DmExporterQuick.CdsCadastro.First;
       while not DmExporterQuick.CdsCadastro.Eof do
        begin
           DmExporterQuick.SQL1.CommandText := 'UPDATE PRODUTOS SET ' +
                               ' CD_PRODUTO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CD_PRODUTO').AsString) + ' , ' +
                               ' CD_LABORATORIO = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_LABORATORIO').AsString + ' , ' +
                               ' CD_GRUPO = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_GRUPO').AsString + ' , ' +
                               ' CD_CLASSE = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_CLASSE').AsString + ' , ' +
                               ' CODIGO_BARRAS_1 = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CODIGO_BARRAS_1').AsString) + ' , ' +
                               ' DESCRICAO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('DESCRICAO').AsString) + ' , ' +
                               ' TIPO_PRODUTO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('TIPO_PRODUTO').AsString) + ' , ' +
                               ' UNIDADE = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('UNIDADE').AsString) + ' , ' +
                               ' STATUS = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('STATUS').asString);

           //gravacao dos estoques das demais filiais...
           while not DmExporterQuick.CdsFiliais.Eof do
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ', ' +
                                  EstoqueFiliais[DmExporterQuick.CdsFiliais.FieldByName('CD_FILIAL').AsInteger] + ' = ' +
                                  StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName(EstoqueFiliais[DmExporterQuick.CdsFiliais.FieldByName('CD_FILIAL').AsInteger]).AsString, '.', ''), ',', '.');
              DmExporterQuick.CdsFiliais.Next;
            end;
           DmExporterQuick.CdsFiliais.First;

           if not DmExporterQuick.CdsCadastro.FieldByName('CD_PRINCIPIO').IsNull then
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,CD_PRINCIPIO = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_PRINCIPIO').AsString;
            end
           else
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,CD_PRINCIPIO = NULL';
            end;
           if not DmExporterQuick.CdsCadastro.FieldByName('ID_FAMILIA').IsNull then
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,ID_FAMILIA = ' + DmExporterQuick.CdsCadastro.FieldByName('ID_FAMILIA').AsString;
            end
           else
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,ID_FAMILIA = NULL';
            end;
           if not DmExporterQuick.CdsCadastro.FieldByName('CD_LISTA').IsNull then
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,CD_LISTA = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_LISTA').AsString;
            end
           else
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,CD_LISTA = NULL';
            end;
           if not (DmExporterQuick.CdsCadastro.FieldByName('QT_EMBALAGEM').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('QT_EMBALAGEM').AsFloat > 0) then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,QT_EMBALAGEM = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('QT_EMBALAGEM').AsString, '.', ''), ',', '.')
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,QT_EMBALAGEM = 1';

           if not (DmExporterQuick.CdsCadastro.FieldByName('CODIGO_BARRAS_2').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('CODIGO_BARRAS_2').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CODIGO_BARRAS_2 = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CODIGO_BARRAS_2').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CODIGO_BARRAS_2 = '''+''+'''';

           if not (DmExporterQuick.CdsCadastro.FieldByName('MARGEM_PROMOCAO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('MARGEM_PROMOCAO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,MARGEM_PROMOCAO = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('MARGEM_PROMOCAO').AsString, '.', ''), ',', '.')
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,MARGEM_PROMOCAO = 0';

           if not (DmExporterQuick.CdsCadastro.FieldByName('USOCONTINUO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('USOCONTINUO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,USOCONTINUO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('USOCONTINUO').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,USOCONTINUO = ''' + 'N' + ''' ';

             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
           ' WHERE ID_PRODUTO = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('ID_PRODUTO').AsString, '.' , ''), ',', '.');
           try
             AbreTransacao;
             DmExporterQuick.SQL1.ExecSQL(True);
             ConfirmaTransacao;
           except
             CancelaTransacao;
             GravaLog(TimetoStr(Time) + ' - ' + DmExporterQuick.SQL1.CommandText);
           end;
           DmExporterQuick.CdsCadastro.Next;
        end;
    end;
   DmExporterQuick.CdsCadastro.Close;
 Except
    on E:Exception do
     begin
       Result := False;
       CancelaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebimento de Cadastro de Produtos - '+ E.Message);
       DmExporterQuick.CdsCadastro.Close;
       Try
         DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
         AbreTransacao;
         DmExporterQuick.SQL1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
     end;
 end;
 Try
   DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
   AbreTransacao;
   DmExporterQuick.SQL1.ExecSQL(True);
   ConfirmaTransacao;
 Except
   CancelaTransacao;
 End;
end;


Function TFrmExporterClientQuick.RecebendoPrecos : Boolean;
var
 Dados : Variant;
begin
   Result := True;
   //busca na matriz os preço de Venda dos Produtos
   if AtualizaPrecoVenda <> 'S' then
       begin
        GravaLog(TimetoStr(Time) + ' - ' + 'Atualizacao de Precos esta DESATIVADA no ExporterClientQuick.');
        Exit;
       end;

   Try
     //Atualiza produtos
     DmExporterQuick.CdsFiliais.Close;
     DmExporterQuick.CdsFiliais.Params[0].AsFloat := Filial;
     DmExporterQuick.CdsFiliais.Open;
     DmExporterQuick.CdsFiliais.First;
     DmExporterQuick.CdsPrecos.Close;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(125, Filial, 'A');
     if Dados = null then
      begin
        Result := False;
        Exit;
      end;

     DmExporterQuick.CdsPrecos.Data := Dados;
     DmExporterQuick.CdsPrecos.Open; // virtual
     if DmExporterQuick.CdsPrecos.RecordCount > 0 then
      begin
         Try
           DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
           AbreTransacao;
           DmExporterQuick.SQL1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           CancelaTransacao;
         End;

         //DmExporterQuick.CdsPrecos.SaveToFile(ExtractFilePath(Application.ExeName)+'DmExporterQuick.CdsPrecos.xml', dfXML);
         DmExporterQuick.CdsPrecos.First;
         GravaLog(TimetoStr(Time) + ' - ' + InttoStr(DmExporterQuick.CdsPrecos.RecordCount) + ' precos recebidos.');
         while not DmExporterQuick.CdsPrecos.Eof do
          begin
             //se existe data reajuste definida, coloca os dados em REAJUSTE para o operador aplicar quando conveniente.
             if not (DmExporterQuick.CdsPrecos.FieldByName('DATA_REAJUSTE').IsNull) then
              begin
                 DmExporterQuick.SQL1.CommandText := 'INSERT INTO REAJUSTE VALUES (' +
                                 DmExporterQuick.CdsPrecos.FieldByName('CD_FILIAL').AsString + ', ' +
                                 DmExporterQuick.CdsPrecos.FieldByName('ID_PRODUTO').AsString + ', ' +
                                 QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('DATA').AsDateTime)) + ', ' +
                                 QuotedStr(FormatDateTime('hh:mm:ss', DmExporterQuick.CdsPrecos.FieldByName('HORA').AsDateTime)) + ', ' +
                                 StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_ANTERIOR').AsString, ',', '.') + ', ' +
                                 StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.') + ', ' +
                                 StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_ANTERIOR').AsString, ',', '.') + ', ' +
                                 StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, ',', '.') + ', ';
                 if not DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').IsNull then
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                 QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').AsDateTime)) + ', '
                 else
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ' NULL, ';
                 if not DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').IsNull then
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                 QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime)) + ', '
                 else
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ' NULL, ';
                 DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                                     QuotedStr('N') + ', NULL, ' + QuotedStr('') + ', ' + QuotedStr('2') + ')';
              end

             else
              //nao existe data reajuste definida, aplicacao do preco sera imediata.
              begin
                 DmExporterQuick.SQL1.CommandText := 'INSERT INTO REAJUSTE VALUES (' +
                                 DmExporterQuick.CdsPrecos.FieldByName('CD_FILIAL').AsString + ', ' +
                                 DmExporterQuick.CdsPrecos.FieldByName('ID_PRODUTO').AsString + ', ' +
                                 QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('DATA').AsDateTime)) + ', ' +
                                 QuotedStr(FormatDateTime('hh:mm:ss', DmExporterQuick.CdsPrecos.FieldByName('HORA').AsDateTime)) + ', ';
                 if not (DmExporterQuick.CdsPrecos.FieldByName('PRECO_ANTERIOR').IsNull) then
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                          StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_ANTERIOR').AsString, ',', '.') + ', '
                 else
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + 'NULL, ';

                 DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.') + ', ';

                 if not (DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_ANTERIOR').IsNull) then
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                        StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_ANTERIOR').AsString, ',', '.') + ', '
                 else
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + 'NULL, ';

                 if not (DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').IsNull) then
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                       StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, ',', '.') + ', '
                 else
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + 'NULL, ';

                 if not DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').IsNull then
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                 QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_ANTERIOR').AsDateTime)) + ', '
                 else
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ' NULL, ';
                 if not DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').IsNull then
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                 QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime)) + ', '
                 else
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ' NULL, ';
                 DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                                     QuotedStr('S') + ', ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ' , ' + QuotedStr('ExporterClientQuick') + ', ' + QuotedStr('2') + ')';

                 //insere na tabela REAJUSTE os precos recebidos da matriz, para efeito de registro.
                 try
                   AbreTransacao;
                   DmExporterQuick.SQL1.ExecSQL(True);
                   ConfirmaTransacao;
                 except
                   GravaLog(TimetoStr(Time) + ' - ' + DmExporterQuick.SQL1.CommandText);
                   CancelaTransacao;
                 end;

                 //grava em PRODUTOS os precos recebidos da Matriz, que tenham aplicacao imediata.
                 DmExporterQuick.SQL1.CommandText := 'UPDATE PRODUTOS SET ' +
                   ' PRECO_VENDA  = ' + StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.') + ', ' +
                   ' PRECO_VENDA_' + IntToStr(Filial) + ' = ' + StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.');

                 if not DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').IsNull then
                  begin
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                    ' ,DT_VENCIMENTO_PROMOCAO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime)) ;
                  end
                 else
                  begin
                    DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                    ' ,DT_VENCIMENTO_PROMOCAO = NULL ';
                  end;

                 if not DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').IsNull then
                   DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                   ' ,PRECO_PROMOCAO = ' + StrTran(StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, '.', ''), ',', '.')
                 else
                   DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                   ' ,PRECO_PROMOCAO = 0';

                 DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                 ' ,DT_REAJUSTE = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) +
                 ' WHERE ID_PRODUTO = ' + StrTran(StrTran(DmExporterQuick.CdsPrecos.FieldByName('ID_PRODUTO').AsString, '.' , ''), ',', '.');
              end;

              try
               AbreTransacao;
               DmExporterQuick.SQL1.ExecSQL(True);
               ConfirmaTransacao;
              except
               GravaLog(TimetoStr(Time) + ' - ' + DmExporterQuick.SQL1.CommandText);
               CancelaTransacao;
              end;
              DmExporterQuick.CdsPrecos.Next;
          end;
      end;
     DmExporterQuick.CdsPrecos.Close;
   Except
      on E:Exception do
       begin
         Result := False;
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Preco de Venda - '+ E.Message);
         DmExporterQuick.CdsPrecos.Close;
         Try
           DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
           AbreTransacao;
           DmExporterQuick.SQL1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           CancelaTransacao;
         End;
       end;
   end;
   Try
     DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
     AbreTransacao;
     DmExporterQuick.SQL1.ExecSQL(True);
     ConfirmaTransacao;
   Except
     CancelaTransacao;
   End;
end;


procedure TFrmExporterClientQuick.RecebendoProdutosDeletados;
var Dados : Variant;
begin
  //busca na matriz os produtos deletados
   Try
     // Atualiza produtos
     DmExporterQuick.CdsDeletados.Close;
     DmExporterQuick.CdsDeletados.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(108, Filial, 'PRODUTOS');
     if Dados = null then
        Exit;
     DmExporterQuick.CdsDeletados.Data := Dados;
     DmExporterQuick.CdsDeletados.Open; // virtual
     DmExporterQuick.CdsDeletados.IndexFieldNames := 'CAMPO2';

     if DmExporterQuick.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Produtos Deletados recebidos: ' + FloatToStr(DmExporterQuick.CdsDeletados.RecordCount));
         DmExporterQuick.CdsDeletados.First;
         while not DmExporterQuick.CdsDeletados.Eof do
          begin
             DmExporterQuick.SQL1.CommandText := 'DELETE FROM PRODUTOS WHERE ID_PRODUTO = ' + DmExporterQuick.CdsDeletadosCAMPO2.AsString;
             AbreTransacao;
             DmExporterQuick.SQL1.ExecSQL(True);
             ConfirmaTransacao;
             DmExporterQuick.CdsDeletados.Next;
          end;
      end;
     DmExporterQuick.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebendo Produtos Deletados - '+ E.Message);
         DmExporterQuick.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClientQuick.Teste;
var
  Inicio : TDateTime;
  Periodo : Real;
begin
  DmExporterQuick.ClientDataSet1.Close;
  Inicio := Time;
  DmExporterQuick.ClientDataSet1.Data := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(5000, Filial, 'A');
  Periodo := Time - Inicio;
  ShowMessage(FloattoStr(Periodo));
  DmExporterQuick.ClientDataSet1.Open;
end;

procedure TFrmExporterClientQuick.Testando;
begin
  InputBox('ClientQuick', 'ClientQuick', 'ClientQuick');
end;

procedure TFrmExporterClientQuick.MontaSQL_Precos(Filial : String);
var
 ComandoSQL : String;
begin
  ComandoSQL := '';
  ComandoSQL := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 2000 * FROM TEMP_PRODUTOS ' +
                'WHERE PROCESSO = 52';
  DmExporterQuick.SqlPrecoVenda.CommandText := ComandoSql;
  DmExporterQuick.SqlPrecoVenda.ExecSQL(True);

  ComandoSQL := '';
  ComandoSQL := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') +
                ' WHERE ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2)';
  DmExporterQuick.SqlPrecoVenda.CommandText := ComandoSql;
  DmExporterQuick.SqlPrecoVenda.ExecSQL(True);

  ComandoSQL := '';
  ComandoSQL := 'SELECT FIRST 2000 PRODUTOS.ID_PRODUTO, PRODUTOS.PRECO_VENDA_' + Filial + ', PRODUTOS.PRECO_PROMOCAO_' + Filial +
                ' , PRODUTOS.DT_VENCIMENTO_PROMOCAO_' + Filial + ', PRODUTOS.DT_REAJUSTE_' + Filial +
                ' FROM PRODUTOS, TEMP_PRODUTOS ' +
                ' WHERE PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS.ID_PRODUTO AND ' +
                ' TEMP_PRODUTOS.PROCESSO = 52 AND TEMP_PRODUTOS.ENVIADO = ' + QuotedStr('9');
  DmExporterQuick.SqlPrecoVenda.CommandText := ComandoSQL;
  DmExporterQuick.SqlPrecoVenda.Params.Clear;
  CriaCamposPrecos(Filial);
end;

procedure TFrmExporterClientQuick.CriaCamposPrecos(sFilial : String);
var fIdProduto, fPrecoVenda, fPrecoPromocao : TFloatField;
    fDtVencimentoPromocao, fDtReajuste : TDateField;
begin
 fIdProduto               := TFloatField.Create(Self);
 fIdProduto.FieldName     := 'ID_PRODUTO';
 fIdProduto.FieldKind     := fkData;
 fIdProduto.DisplayLabel  := 'ID_PRODUTO';
 fIdProduto.Visible       := True;
 fIdProduto.Name          := DmExporterQuick.CdsPrecoVenda.Name + fIdProduto.FieldName;
 fIdProduto.Index         := 0;
 fIdProduto.DataSet       :=  (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fPrecoVenda              := TFloatField.Create(Self);
 fPrecoVenda.FieldName    := 'PRECO_VENDA_' + sFilial;
 fPrecoVenda.FieldKind    := fkData;
 fPrecoVenda.DisplayLabel := 'PRECO_VENDA_' + sFilial;
 fPrecoVenda.Visible      := True;
 fPrecoVenda.Name         := DmExporterQuick.CdsPrecoVenda.Name + fPrecoVenda.FieldName;
 fPrecoVenda.Index        := 1;
 fPrecoVenda.DataSet      := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fPrecoPromocao           := TFloatField.Create(Self);
 fPrecoPromocao.FieldName := 'PRECO_PROMOCAO_' + sFilial;
 fPrecoPromocao.FieldKind := fkData;
 fPrecoPromocao.DisplayLabel := 'PRECO_PROMOCAO_' + sFilial;
 fPrecoPromocao.Visible   := True;
 fPrecoPromocao.Name      := DmExporterQuick.CdsPrecoVenda.Name + fPrecoPromocao.FieldName;
 fPrecoPromocao.Index     := 2;
 fPrecoPromocao.DataSet   := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fDtVencimentoPromocao    := TDateField.Create(Self);
 fDtVencimentoPromocao.FieldName := 'DT_VENCIMENTO_PROMOCAO_' + sFilial;
 fDtVencimentoPromocao.FieldKind := fkData;
 fDtVencimentoPromocao.DisplayLabel := 'DT_VENCIMENTO_PROMOCAO_' + sFilial;
 fDtVencimentoPromocao.Visible := True;
 fDtVencimentoPromocao.Name := DmExporterQuick.CdsPrecoVenda.Name + fDtVencimentoPromocao.FieldName;
 fDtVencimentoPromocao.Index := 3;
 fDtVencimentoPromocao.DataSet := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fDtReajuste              := TDateField.Create(Self);
 fDtReajuste.FieldName    := 'DT_REAJUSTE_' + sFilial;
 fDtReajuste.FieldKind    := fkData;
 fDtReajuste.DisplayLabel := 'DT_REAJUSTE_' + sFilial;
 fDtReajuste.Visible      := True;
 fDtReajuste.Name         := DmExporterQuick.CdsPrecoVenda.Name + fDtReajuste.FieldName;
 fDtReajuste.Index        := 4;
 fDtReajuste.DataSet      := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 DmExporterQuick.CdsPrecoVenda.FieldDefs.Update;
end;


procedure TFrmExporterClientQuick.VerificaConexao(TipoConexao : String);
var Dados : Variant;
begin
  try
      AbreTransacao;
      DmExporterQuick.CdsConexao.Close;
      DmExporterQuick.CdsConexao.Open;
      Dados := (DmExporterQuick.HTTPRIO1 AS IDM).Processa(999, Filial, 'A');
      ConfirmaTransacao;
      if Dados = null then
        Exit
      else
      if Dados = 'FALHA' then
         begin
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Excesso de arquivos XML para tratamento na Matriz. Conexao interrompida.');
          Close;
          Application.Terminate;
          Halt;
          Exit;
         end;

      if TipoConexao = 'Inicial' then
        if DmExporterQuick.CdsConexaoCGC.AsString <> Dados then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - CNPJ Filial = ' + DmExporterQuick.CdsConexaoCGC.AsString + ' nao cadastrado na Matriz.')
        else
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - CNPJ da Filial foi validado com sucesso.');

  Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao na verificacao de internet - '+ E.Message);
         Close;
         Application.Terminate;
         Halt;
         Exit;
       end;
   end;
end;

end.
