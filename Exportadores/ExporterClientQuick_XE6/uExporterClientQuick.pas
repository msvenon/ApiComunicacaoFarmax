unit uExporterClientQuick;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Provider, InvokeRegistry, Rio, SOAPHTTPClient,
  MidasLib, StdCtrls, FMTBcd, SqlExpr, SOAPConn, IniFiles,InterfaceProcessa;

type
  TFrmExporterClientQuick = class(TForm)
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

    function  EnviarContasReceber : Boolean; //
    function  EnviarProdutosLotes : Boolean; //
    function  EnviarProdutosLotesST : Boolean; //

    procedure EnvioLotes; //
    procedure EnvioLotesAPrazo;  //
    procedure EnvioCaixa; //
    function  BuscaMatrizProdutosIncluidos : Boolean;   //
    function  EnviandoEstoque : Boolean;  //
    procedure EnviandoOperadoresCaixa;  //
    function  EnviandoClientes : Boolean; //
    procedure EnviandoCRM; //
    procedure EnviandoEntregas;//
    procedure EnviandoChequesRecebidos; //
    procedure EnviandoItensTransfer;   //
    procedure EnviandoTransfer; //
    procedure EnviandoTransfer1; //
    procedure EnviandoCadernoFaltas;  //
    procedure EnviandoPrecosFilial; //
    procedure EnviandoConferenciaNota; //
    procedure EnviandoUsuarios;//
    function  EnviandoPosicaoEstoque : Boolean; //
    procedure EnviandoContasPagar; //
    procedure EnviandoCompras; //
    procedure EnviandoItensCompras; //
    procedure EnviandoItensComprasLote; //
    procedure EnviandoComprasBoletos; //
    procedure EnviandoContasPagarCompras; //
    {  Sintegra  }
    procedure EnviandoSintegraNotas;//
    procedure EnviandoSintegraNotasItens; //
    procedure EnviandoSintegraPedidos; ///
    procedure EnviandoSintegraR60; //
    procedure EnviandoSintegraR60I;  //

    procedure EnviandoVendasItensExcluidos; //

    procedure RecebendoItensTransfer;  //
    procedure RecebendoTransfer;  //
    procedure RecebendoProdutosQuantidade; //
    procedure RecebendoProdutosFP; //
    procedure RecebendoProdutosFidelidade;  //
    function  RecebendoCadastro : Boolean;//
    function  RecebendoEstoques : Boolean;//
    Function  RecebendoPrecos : Boolean; //
    procedure RecebendoProdutosDeletados;  //
    procedure RecebendoProdutosFidelidadeDeletados;  //
    procedure RecebendoProdutosQuantidadeDeletados; //

    procedure MontaSQL_Precos(Filial : String); //
    procedure CriaCamposPrecos(sFilial : String); //
    procedure ConsistenciaDados;  //


    function SetaEnviado9 : Boolean;
    procedure FecharTodosDataSets;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Procedure FecharDataSet(Cds : TClientDataSet);
  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  function Alltrim(Text : string) : string;
  function Crypt(Action, Src: String): String;

var
  FrmExporterClientQuick: TFrmExporterClientQuick;
  Caminho, Servidor, Intervalo, Intervalo2, AtualizaPrecoVenda, Status: String;
  Importer : TextFile;
  Log : TextFile;
  TD : TTransactionDesc;

  Filial : Integer;
  Sql : String;

  ExecutaConferencia : Boolean;

  Id_Produto, Cd_Produto, CodigoBarras, CodigoBarras2, Descricao, Cd_Laboratorio,
  Cd_Grupo, TipoProduto, Identificador, Qt_Embalagem, Comissao,
  CustoUnitario, Preco_Venda, Preco_Promocao, Icms, Margem, Margem_Promocao,
  Dt_Cadastro, Curva, Cd_Classe, EntraPE, TxDesconto, Unidade, Balanca,
  Cd_Principio, Cd_Lista, UsoContinuo, Pis_Cofins, NCM, Cd_GrupoBalanco, Cd_GrupoCompra,
  Id_Familia, Cd_SubGrupo, CEST, CD_CFOP, SituacaoTributaria, Origem, CSOSN,
  IAT, IPPT, ComprimidosCaixa, Controlado, Generico, Dt_Vencimento_Promocao,
  Observacao : String;

  NLancamentos, NCaixa, NTransfer, NItensTransfer, NContasReceber : Integer;
  NLancamentosLoja, NCaixaLoja, NTransferLoja, NItensTransferLoja, NContasReceberLoja : Integer;

  CaminhoBanco : TIniFile;
  Senha : String;

const
  EstoqueFiliais : array[1..30] of string =
  ('ESTOQUE_1','ESTOQUE_2','ESTOQUE_3','ESTOQUE_4','ESTOQUE_5',
   'ESTOQUE_6','ESTOQUE_7','ESTOQUE_8','ESTOQUE_9','ESTOQUE_10',
   'ESTOQUE_11','ESTOQUE_12', 'ESTOQUE_13', 'ESTOQUE_14', 'ESTOQUE_15',
   'ESTOQUE_16','ESTOQUE_17', 'ESTOQUE_18', 'ESTOQUE_19', 'ESTOQUE_20',
   'ESTOQUE_21', 'ESTOQUE_22', 'ESTOQUE_23', 'ESTOQUE_24', 'ESTOQUE_25',
   'ESTOQUE_26', 'ESTOQUE_27', 'ESTOQUE_28', 'ESTOQUE_29', 'ESTOQUE_30');

implementation

uses uDmExporterQuick;

{$R *.dfm}


function Crypt(Action, Src: String): String;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Exit;
  end;
  Key :=
'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToIntDef('$'+ copy(Src,1,2),0);
    SrcPos := 3;
  repeat
    SrcAsc := StrToIntDef('$'+ copy(Src,SrcPos,2),0);
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
end;


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

  Timer2.Enabled := True;
  AssignFile(Importer, ExtractFilePath(Application.ExeName)+'ExporterClient.TXT');
  Reset(Importer);
  Readln(Importer, Caminho);
  ReadLn(Importer, Servidor);
  ReadLn(Importer, Intervalo);
  ReadLn(Importer, Intervalo2);
  ReadLn(Importer, AtualizaPrecoVenda);
  CloseFile(Importer);
  // FML - 22.09.2020
  ExecutaConferencia := ParamStr(1) = 'Consistencia';
  GravaLog(TimetoStr(Time) + 'ParamStr : ' + ParamStr(1));

  // FML - 22.09.2020

  CaminhoBanco := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CaminhoBD.Ini');
  Senha := Crypt('D', CaminhoBanco.ReadString('FARMAX', 'FARMAX', ''));
  CaminhoBanco.Free;
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
  //RxTrayIcon1.Animated := True;
  //RxTrayIcon1.Active := True;
  try
    Processar;
  except
  end;
  //RxTrayIcon1.Animated := False;
  //RxTrayIcon1.Active := False;
  Application.ProcessMessages;
  Application.Terminate;
  Halt;
end;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////// inicio do processamento  1 //////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFrmExporterClientQuick.Processar;
begin

  if (Servidor = '') then
   begin
     ShowMessage('O Nome do Servidor Matriz Está Vazio....');
     GravaLog('O Nome do Servidor Matriz Está Vazio....');
     Close;
     //RxTrayIcon1.Animated := True;
     Application.Terminate;
     Halt;
     Exit;
   end;

  if (Caminho = '') then
   begin
     ShowMessage('O Caminho dos Arquivos de Dados Está Vazio....');
     GravaLog('O Caminho dos Arquivos de Dados Está Vazio....');
     Close;
     //RxTrayIcon1.Animated := True;
     //RxTrayIcon1.Active := False;
     Application.Terminate;
     Halt;
     Exit;
   end;

  try
    DmExporterQuick.SQLConnection1.Close;
    DmExporterQuick.SQLConnection1.Params.Values['Database'] := Caminho + '\Farmax.fdb';
    if Senha <> '' then
       DmExporterQuick.SQLConnection1.Params.Values['Password'] := Senha
    else
       DmExporterQuick.SQLConnection1.Params.Values['Password'] := 'masterkey';
    DmExporterQuick.SQLConnection1.Open;
  except
    GravaLog('Sem conexão com o banco ' + Caminho + '\Farmax.fdb');
    Close;
    //RxTrayIcon1.Animated := True;
    //RxTrayIcon1.Active := False;
    Application.Terminate;
    Halt;
    Exit;
  end;

  DmExporterQuick.HTTPRIO1.URL := 'http://' + Servidor + '/ExporterServer/ExporterServer.exe/soap/IDmProcessa';
  //DmExporterQuick.HTTPRIO1.URL := 'http://' + Servidor + '/Exporter/Exporter.exe/soap/IDmProcessa';

  GravaLog(' ');
  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ======== Iniciando novo processo de exportacao do ClientQuick ========');

  //RxTrayIcon1.Animated := True;

  AbreTransacao;
  DmExporterQuick.CdsParametros.Open;
  ConfirmaTransacao;


/////////////////////area de testes/////////////////
  {fILIAL := 5;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Lancamentos');
    DmExporterQuick.SQLConnection1.Open;
    EnvioLotes;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;}


///////////////////////////////////////////////////


  if DmExporterQuick.CdsParametrosTIPO_LOJA.AsString = 'U' then
   begin
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja cadastrada como loja única.');
     Exit;
   end;

  Filial := DmExporterQuick.CdsParametros.Fields[0].AsInteger;
  if Filial = 0 then
   begin
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja cadastrada como Matriz - loja 0.');
     Exit;
   end;

  VerificaConexao('Inicial');


  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Contas a Receber');
    DmExporterQuick.SQLConnection1.Open;
    while EnviarContasReceber do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Clientes');
    DmExporterQuick.SQLConnection1.Open;
    while EnviandoClientes do sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  
  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Transferencias');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoTransfer;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Itens de Trensferencias');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoTransfer1;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Transferencias');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoTransfer;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Itens de Transferencias');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoItensTransfer;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  Try
    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ProdutosPrecoQuantidadeDeletados... ');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoProdutosQuantidadeDeletados;
    DmExporterQuick.SQLConnection1.Close;
  except
  End;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Preço Quantidade');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoProdutosQuantidade;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Farmacia Popular');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoProdutosFP;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Fidelidade Deletados');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoProdutosFidelidadeDeletados;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;


  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Fidelidade');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoProdutosFidelidade;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Lancamentos');
    DmExporterQuick.SQLConnection1.Open;
    EnvioLotes;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Lancamentos a Prazo');
    DmExporterQuick.SQLConnection1.Open;
    EnvioLotesaPrazo;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Caixa');
    DmExporterQuick.SQLConnection1.Open;
    EnvioCaixa;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Operadores de Caixa');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoOperadoresCaixa;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de CRM');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoCRM;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Entregas');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoEntregas;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Cheques Recebidos');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoChequesRecebidos;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Contas a Pagar');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoContasPagar;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Compras');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoCompras;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de ItensCompraLote');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoItensComprasLote;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Compras Boletos');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoComprasBoletos;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de ContasPagarCompras');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoContasPagarCompras;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Usuarios');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoUsuarios;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Caderno de Faltas');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoCadernoFaltas;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

{  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Sintegra Notas');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoSintegraNotas;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Sintegra Notas Itens');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoSintegraNotasItens;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Sintegra Pedidos');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoSintegraPedidos;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Sintegra 60R');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoSintegraR60;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Sintegra 60R Itens');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoSintegraR60I;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;}

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Deletados');
    DmExporterQuick.SQLConnection1.Open;
    RecebendoProdutosDeletados;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Incluidos');
    DmExporterQuick.SQLConnection1.Open;
    while BuscaMatrizProdutosIncluidos do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Cadastros');
    DmExporterQuick.SQLConnection1.Open;
    while RecebendoCadastro do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Estoques');
    DmExporterQuick.SQLConnection1.Open;
    while RecebendoEstoques do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Precos na Filial');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoPrecosFilial;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Conferencia Nota');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoConferenciaNota;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Recebimento de Produtos Precos');
    DmExporterQuick.SQLConnection1.Open;
    while RecebendoPrecos do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Vendas Itens Excluidos');
    DmExporterQuick.SQLConnection1.Open;
    EnviandoVendasItensExcluidos;
    DmExporterQuick.SQLConnection1.Close;
  except
  end;


  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Produtos Lotes');
    DmExporterQuick.SQLConnection1.Open;
    while EnviarProdutosLotes do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Produtos Lotes ST');
    DmExporterQuick.SQLConnection1.Open;
    while EnviarProdutosLotesST do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Contas a Receber');
    DmExporterQuick.SQLConnection1.Open;
    while EnviarContasReceber do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Clientes');
    DmExporterQuick.SQLConnection1.Open;
    while EnviandoClientes do sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Posicao Estoque');
    DmExporterQuick.SQLConnection1.Open;
    while EnviandoPosicaoEstoque do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  try
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Estoques');
    DmExporterQuick.SQLConnection1.Open;
    while EnviandoEstoque do Sleep(1);
    DmExporterQuick.SQLConnection1.Close;
  except
  end;

  //FML - 25.05.2023
  Try
    ConsistenciaDados;
  except
  End;
  //FML - 25.05.2023

  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - =======================================================');

  FecharTodosDataSets;

  DmExporterQuick.SQLConnection1.Close;

  //RxTrayIcon1.Animated := False;
  //RxTrayIcon1.Active := False;
  Application.ProcessMessages;
end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



function TFrmExporterClientQuick.EnviarContasReceber : Boolean;
var Dados : Variant;
    Sql,sql2 : String;
begin
  //processamento e envio de Cecadfin.dat
  Try
      Try
        Result := True;

        Sql := 'SELECT CONTAS_RECEBER.* FROM CONTAS_RECEBER, TEMP_PRODUTOS2 WHERE TEMP_PRODUTOS2.PROCESSO = 3 AND CONTAS_RECEBER.CD_CONTAS_RECEBER = TEMP_PRODUTOS2.ID_PRODUTO';

        DmExporterQuick.CdsCeCadfin.Close;
        DmExporterQuick.TbCeCadFin.Close;
        DmExporterQuick.TbCeCadFin.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 3';
        AbreTransacao;
        DmExporterQuick.TbCeCadFin.ExecSQL(True);
        ConfirmaTransacao;

        DmExporterQuick.TbCeCadFin.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE PROCESSO = 3';
        AbreTransacao;
        DmExporterQuick.TbCeCadFin.ExecSql(True);
        ConfirmaTransacao;
        DmExporterQuick.CdsCeCadfin.Close;
        DmExporterQuick.TbCeCadFin.Close;

        DmExporterQuick.TbCeCadFin.CommandText := Sql;
        AbreTransacao;
        DmExporterQuick.TbCeCadFin.Close;
        DmExporterQuick.CdsCeCadfin.Close;
        DmExporterQuick.CdsCeCadfin.Open;
        ConfirmaTransacao;
        if DmExporterQuick.CdsCeCadfin.RecordCount <> 0 then
         begin
            GravaLog(TimetoStr(Time) + ' - Enviando Contas a Receber: ' + FloatToStr(DmExporterQuick.CdsCeCadfin.RecordCount));
            Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(3, Filial, DmExporterQuick.CdsCeCadfin.Data);
            if (Dados <> Null) and (Dados) then
              begin
                DmExporterQuick.CdsCeCadfin.Close;
                DmExporterQuick.TbCeCadFin.Close;
                DmExporterQuick.TbCeCadFin.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 3 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 3)';
                AbreTransacao;
                DmExporterQuick.TbCeCadFin.ExecSQL(True);
                ConfirmaTransacao;

                DmExporterQuick.CdsCeCadfin.Close;
                DmExporterQuick.TbCeCadFin.Close;
                DmExporterQuick.TbCeCadFin.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 3';
                AbreTransacao;
                DmExporterQuick.TbCeCadFin.ExecSQL(True);
                ConfirmaTransacao;
              end
             else
              Result := False;
         end
        else
              Result := False;
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
            Result := False;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.TbCeCadFin.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
    AbreTransacao;
    DmExporterQuick.TbCeCadFin.ExecSQL(True);
    ConfirmaTransacao;
    DmExporterQuick.TbCeCadFin.CommandText := Sql;
    DmExporterQuick.CdsCeCadfin.Close;
    DmExporterQuick.TbCeCadFin.Close;
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
          VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Contas a Pagar: '+ FloatToStr(DmExporterQuick.CdsCeDuplic.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(6, Filial, DmExporterQuick.CdsCeDuplic.Data);
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
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Executada selecao em Temp_Compras');

      DmExporterQuick.TbCePedid1.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsCePedid1.Open;
      ConfirmaTransacao;

      Try
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando o envio de Itens Compras');
        EnviandoItensCompras; //envia os itens desta Compra
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Finalizado o envio de Itens Compras');
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
          VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Compras: ' + FloatToStr(DmExporterQuick.CdsCePedid1.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(4, Filial, DmExporterQuick.CdsCePedid1.Data);
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
        VerificaConexao('');
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando ItensCompras do Pedido ' + DmExporterQuick.CdsCePedid1CD_COMPRAS.AsString);
        Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(5, Filial, DmExporterQuick.CdsCePedido.Data);
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


procedure TFrmExporterClientQuick.EnviandoItensComprasLote;
var
 Dados : Variant;
 Sql : String;
begin
  Try
    Sql := DmExporterQuick.SqlLotesItensCompra.CommandText;
    Try
      DmExporterQuick.SqlLotesItensCompra.CommandText := 'UPDATE TEMP_ITENS_COMPRA_LOTE SET ENVIADO = ''' + '9' + ''' WHERE (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ')';
      AbreTransacao;
      DmExporterQuick.SqlLotesItensCompra.ExecSQL(True);
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    End;

    DmExporterQuick.SqlLotesItensCompra.CommandText := Sql;
    DmExporterQuick.CdsLotesItensCompra.Close;
    AbreTransacao;
    DmExporterQuick.CdsLotesItensCompra.Open;
    //GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - LotesItensCompras : ' + Sql);
    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Regsitros encontrados LotesItensCompras : ' + InttoStr(DmExporterQuick.CdsLotesItensCompra.RecordCount));
    ConfirmaTransacao;
    if DmExporterQuick.CdsLotesItensCompra.RecordCount <> 0 then
     begin
        VerificaConexao('');
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando LotesItensCompras do Pedido ' + DmExporterQuick.CdsLotesItensCompraCD_COMPRAS.AsString);
        Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(68, Filial, DmExporterQuick.CdsLotesItensCompra.Data);
        if  Dados = null then
            DmExporterQuick.CdsLotesItensCompra.Close;
     end;

    Sql := DmExporterQuick.SqlLotesItensCompra.CommandText;
    Try
      DmExporterQuick.SqlLotesItensCompra.CommandText := 'DELETE FROM TEMP_ITENS_COMPRA_LOTE WHERE ENVIADO = ' + QuotedStr('9');
      AbreTransacao;
      DmExporterQuick.SqlLotesItensCompra.ExecSQL(True);
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    End;
    DmExporterQuick.SqlLotesItensCompra.CommandText := Sql;

  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Lotes Itens Compras - '+E.Message);
        DmExporterQuick.CdsLotesItensCompra.Close;
        Exit;
      end;
  end;
  DmExporterQuick.CdsLotesItensCompra.Close;
end;


procedure TFrmExporterClientQuick.EnviandoComprasBoletos;
var Dados : Variant;
begin
  //processamento e envio de Cepedido.dat
  Try
    DmExporterQuick.CdsComprasBoletos.Close;
    AbreTransacao;
    DmExporterQuick.CdsComprasBoletos.Open;
    ConfirmaTransacao;
    if DmExporterQuick.CdsComprasBoletos.RecordCount <> 0 then
     begin
        VerificaConexao('');
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Compras Boletos : ' + InttoStr(DmExporterQuick.CdsComprasBoletos.RecordCount));
        Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(17, Filial, DmExporterQuick.CdsComprasBoletos.Data);
        if  Dados = null then
            DmExporterQuick.CdsComprasBoletos.Close;
     end;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Compras Boletos - '+E.Message);
        DmExporterQuick.CdsComprasBoletos.Close;
        Exit;
      end;
  end;
  DmExporterQuick.CdsComprasBoletos.Close;
end;


procedure TFrmExporterClientQuick.EnviandoContasPagarCompras;
var Dados : Variant;
begin
  //processamento e envio de ContasPagarCompras
  Try
    DmExporterQuick.CdsContasPagarCompras.Close;
    AbreTransacao;
    DmExporterQuick.CdsContasPagarCompras.Open;
    ConfirmaTransacao;
    if DmExporterQuick.CdsContasPagarCompras.RecordCount <> 0 then
     begin
        VerificaConexao('');
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando ContasPagarCompras : ' + InttoStr(DmExporterQuick.CdsContasPagarCompras.RecordCount));
        Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(71, Filial, DmExporterQuick.CdsContasPagarCompras.Data);
        if  Dados = null then
            DmExporterQuick.CdsContasPagarCompras.Close;
     end;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  ContasPagarCompras - '+E.Message);
        DmExporterQuick.CdsContasPagarCompras.Close;
        Exit;
      end;
  end;
  DmExporterQuick.CdsComprasBoletos.Close;
end;


procedure TFrmExporterClientQuick.EnviandoVendasItensExcluidos;
var
 Dados : Variant;
 Sql : String;
begin
  //processamento e envio de VendasItensExcluidos
  Try
    DmExporterQuick.CdsVendasItensExcluidos.Close;
    Sql := DmExporterQuick.SqlVendasItensExcluidos.CommandText;

    DmExporterQuick.SqlConferenciaNota.CommandText := 'ALTER TRIGGER VENDAS_ITENS_EXCLUIDOS_BI0 INACTIVE';
    AbreTransacao;
    DmExporterQuick.SqlConferenciaNota.ExecSQL(True);
    ConfirmaTransacao;

    DmExporterQuick.SqlVendasItensExcluidos.CommandText := 'UPDATE VENDAS_ITENS_EXCLUIDOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2');
    AbreTransacao;
    DmExporterQuick.SqlVendasItensExcluidos.ExecSQL(True);
    ConfirmaTransacao;

    DmExporterQuick.SqlVendasItensExcluidos.CommandText := Sql;
    AbreTransacao;
    DmExporterQuick.CdsVendasItensExcluidos.Open;
    ConfirmaTransacao;
    if DmExporterQuick.CdsVendasItensExcluidos.RecordCount <> 0 then
     begin
        VerificaConexao('');
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando VendasItensExcluidos : ' + InttoStr(DmExporterQuick.CdsVendasItensExcluidos.RecordCount));
        Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(72, Filial, DmExporterQuick.CdsVendasItensExcluidos.Data);
        if  Dados = null then
            DmExporterQuick.CdsVendasItensExcluidos.Close;
     end;

    DmExporterQuick.CdsVendasItensExcluidos.Close;
    Sql := DmExporterQuick.SqlVendasItensExcluidos.CommandText;
    DmExporterQuick.SqlVendasItensExcluidos.CommandText := 'UPDATE VENDAS_ITENS_EXCLUIDOS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO <> ' + QuotedStr('9');
    AbreTransacao;
    DmExporterQuick.SqlVendasItensExcluidos.ExecSQL(True);
    ConfirmaTransacao;

    DmExporterQuick.SqlConferenciaNota.CommandText := 'ALTER TRIGGER VENDAS_ITENS_EXCLUIDOS_BI0 ACTIVE';
    AbreTransacao;
    DmExporterQuick.SqlConferenciaNota.ExecSQL(True);
    ConfirmaTransacao;

  Except
    on E:Exception do
      begin
        CancelaTransacao;

        DmExporterQuick.SqlConferenciaNota.CommandText := 'ALTER TRIGGER VENDAS_ITENS_EXCLUIDOS_BI0 ACTIVE';
        AbreTransacao;
        DmExporterQuick.SqlConferenciaNota.ExecSQL(True);
        ConfirmaTransacao;

        GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  VendasItensExcluidos - '+E.Message);
        DmExporterQuick.CdsVendasItensExcluidos.Close;
        Exit;
      end;
  end;
  DmExporterQuick.CdsVendasItensExcluidos.Close;
end;


function TFrmExporterClientQuick.EnviarProdutosLotes : Boolean;
var Dados : Variant;
    Sql : String;
begin
  //processamento e envio de Produtos Lotes
  Try
      Try
        Result := True;

        Sql := 'SELECT PRODUTOS_LOTES.* FROM PRODUTOS_LOTES, TEMP_PRODUTOS_LOTES2 WHERE TEMP_PRODUTOS_LOTES2.PROCESSO = 66 AND PRODUTOS_LOTES.ID_PRODUTO = TEMP_PRODUTOS_LOTES2.ID_PRODUTO AND PRODUTOS_LOTES.LOTE = TEMP_PRODUTOS_LOTES2.LOTE';

        DmExporterQuick.SqlProdutosLotes.CommandText := 'INSERT INTO TEMP_PRODUTOS_LOTES2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS_LOTES WHERE PROCESSO = 66';
        AbreTransacao;
        DmExporterQuick.SqlProdutosLotes.ExecSql(True);
        ConfirmaTransacao;
        DmExporterQuick.CdsProdutosLotes.Close;
        DmExporterQuick.SqlProdutosLotes.CommandText := Sql;
        AbreTransacao;
        DmExporterQuick.CdsProdutosLotes.Open;
        ConfirmaTransacao;
        if DmExporterQuick.CdsProdutosLotes.RecordCount <> 0 then
         begin
            GravaLog(TimetoStr(Time) + ' - Enviando Produtos Lotes: ' + FloatToStr(DmExporterQuick.CdsProdutosLotes.RecordCount));
            Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(66, Filial, DmExporterQuick.CdsProdutosLotes.Data);
            if (Dados <> Null) and (Dados) then
              begin
                DmExporterQuick.CdsProdutosLotes.Close;

                DmExporterQuick.SqlProdutosLotes.CommandText := 'DELETE FROM TEMP_PRODUTOS_LOTES WHERE PROCESSO = 66 AND ID_PRODUTO||LOTE IN (SELECT ID_PRODUTO||LOTE FROM TEMP_PRODUTOS_LOTES2 WHERE PROCESSO = 66)';
                AbreTransacao;
                DmExporterQuick.SqlProdutosLotes.ExecSQL(True);
                ConfirmaTransacao;

                DmExporterQuick.SqlProdutosLotes.CommandText := 'DELETE FROM TEMP_PRODUTOS_LOTES2 WHERE PROCESSO = 66';
                AbreTransacao;
                DmExporterQuick.SqlProdutosLotes.ExecSQL(True);
                ConfirmaTransacao;
              end
             else
              Result := False;
         end
        else
              Result := False;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Produtos Lotes - ' + E.Message);
            DmExporterQuick.SqlProdutosLotes.CommandText := 'ALTER TRIGGER PRODUTOS_LOTES_BIU0 ACTIVE';
            AbreTransacao;
            DmExporterQuick.SqlProdutosLotes.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterQuick.CdsProdutosLotes.Close;
            Result := False;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.SqlProdutosLotes.CommandText := 'ALTER TRIGGER PRODUTOS_LOTES_BIU0 ACTIVE';
    AbreTransacao;
    DmExporterQuick.SqlProdutosLotes.ExecSQL(True);
    ConfirmaTransacao;
    DmExporterQuick.SqlProdutosLotes.CommandText := Sql;
    DmExporterQuick.CdsProdutosLotes.Close;
  End;
end;


function TFrmExporterClientQuick.EnviarProdutosLotesST : Boolean;
var Dados : Variant;
    Sql : String;
begin
  //processamento e envio de Produtos Lotes ST
  Try
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


        DmExporterQuick.SqlProdutosLotesST.CommandText := 'INSERT INTO TEMP_PRODUTOS_LOTES_ST2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS_LOTES_ST WHERE PROCESSO = 70';
        AbreTransacao;
        DmExporterQuick.SqlProdutosLotesST.ExecSql(True);
        ConfirmaTransacao;
        DmExporterQuick.CdsProdutosLotesST.Close;
        DmExporterQuick.SqlProdutosLotesST.CommandText := Sql;
        AbreTransacao;
        DmExporterQuick.CdsProdutosLotesST.Open;
        ConfirmaTransacao;
        if DmExporterQuick.CdsProdutosLotesST.RecordCount <> 0 then
         begin
            GravaLog(TimetoStr(Time) + ' - Enviando Produtos Lotes ST: ' + FloatToStr(DmExporterQuick.CdsProdutosLotesST.RecordCount));
            Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(70, Filial, DmExporterQuick.CdsProdutosLotesST.Data);
            if (Dados <> Null) and (Dados) then
              begin
                DmExporterQuick.CdsProdutosLotesST.Close;

                DmExporterQuick.SqlProdutosLotesST.CommandText := 'DELETE FROM TEMP_PRODUTOS_LOTES_ST ' +
                                                                  'WHERE PROCESSO = 70 AND ID_PRODUTO||CD_FILIAL||DATA||CD_DISTRIBUIDOR||NOTA_FISCAL||SERIE||LOTE IN ' +
                                                                  '(SELECT ID_PRODUTO||CD_FILIAL||DATA||CD_DISTRIBUIDOR||NOTA_FISCAL||SERIE||LOTE FROM TEMP_PRODUTOS_LOTES_ST2 WHERE PROCESSO = 70)';
                AbreTransacao;
                DmExporterQuick.SqlProdutosLotesST.ExecSQL(True);
                ConfirmaTransacao;

                DmExporterQuick.SqlProdutosLotesST.CommandText := 'DELETE FROM TEMP_PRODUTOS_LOTES_ST2 WHERE PROCESSO = 70';
                AbreTransacao;
                DmExporterQuick.SqlProdutosLotesST.ExecSQL(True);
                ConfirmaTransacao;
              end
             else
              Result := False;
         end
        else
              Result := False;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Produtos Lotes ST - ' + E.Message);
            DmExporterQuick.SqlProdutosLotesST.CommandText := 'ALTER TRIGGER PRODUTOS_LOTES_ST_BIU0 ACTIVE';
            AbreTransacao;
            DmExporterQuick.SqlProdutosLotesST.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterQuick.CdsProdutosLotesST.Close;
            Result := False;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.SqlProdutosLotesST.CommandText := 'ALTER TRIGGER PRODUTOS_LOTES_ST_BIU0 ACTIVE';
    AbreTransacao;
    DmExporterQuick.SqlProdutosLotesST.ExecSQL(True);
    ConfirmaTransacao;
    DmExporterQuick.SqlProdutosLotesST.CommandText := Sql;
    DmExporterQuick.CdsProdutosLotesST.Close;
  End;
end;


procedure TFrmExporterClientQuick.EnviandoConferenciaNota;
var Dados : Variant;
    Sql : String;
begin
  //processamento e envio de Conferencia Nota
  Try
      Try
        Sql := 'SELECT CONFERENCIA_NOTA.* FROM CONFERENCIA_NOTA WHERE ENVIADO = ' + QuotedStr('9');

        DmExporterQuick.CdsConferenciaNota.Close;

        DmExporterQuick.SqlConferenciaNota.CommandText := 'ALTER TRIGGER CONFERENCIA_NOTA_BIU0 INACTIVE';
        AbreTransacao;
        DmExporterQuick.SqlConferenciaNota.ExecSQL(True);
        ConfirmaTransacao;

        DmExporterQuick.SqlConferenciaNota.CommandText := 'UPDATE CONFERENCIA_NOTA SET ENVIADO = ' + QuotedStr('9') + ' WHERE (ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')';
        AbreTransacao;
        DmExporterQuick.SqlConferenciaNota.ExecSql(True);
        ConfirmaTransacao;

        DmExporterQuick.SqlConferenciaNota.CommandText := Sql;
        AbreTransacao;
        DmExporterQuick.CdsConferenciaNota.Open;
        ConfirmaTransacao;

        if DmExporterQuick.CdsConferenciaNota.RecordCount <> 0 then
         begin
            GravaLog(TimetoStr(Time) + ' - Enviando Conferencia Nota: ' + FloatToStr(DmExporterQuick.CdsConferenciaNota.RecordCount));
            Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(67, Filial, DmExporterQuick.CdsConferenciaNota.Data);
            if (Dados <> Null) and (Dados) then
              begin
                DmExporterQuick.CdsConferenciaNota.Close;
                DmExporterQuick.SqlConferenciaNota.CommandText := 'UPDATE CONFERENCIA_NOTA SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                AbreTransacao;
                DmExporterQuick.SqlConferenciaNota.ExecSQL(True);
                ConfirmaTransacao;
              end;
         end;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Conferencia Nota - ' + E.Message);
            DmExporterQuick.SqlConferenciaNota.CommandText := 'ALTER TRIGGER CONFERENCIA_NOTA_BIU0 ACTIVE';
            AbreTransacao;
            DmExporterQuick.SqlConferenciaNota.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterQuick.CdsConferenciaNota.Close;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.SqlConferenciaNota.CommandText := 'ALTER TRIGGER CONFERENCIA_NOTA_BIU0 ACTIVE';
    AbreTransacao;
    DmExporterQuick.SqlConferenciaNota.ExecSQL(True);
    ConfirmaTransacao;
    DmExporterQuick.SqlConferenciaNota.CommandText := Sql;
    DmExporterQuick.CdsConferenciaNota.Close;
  End;
end;


procedure TFrmExporterClientQuick.EnvioLotes;
var Dados : Variant;
begin
  //processamento e envio de Celotes.dat
  Try
      Try
         Sql := DmExporterQuick.TbCeLotes.CommandText;
          if ExecutaConferencia then
            begin
              GravaLog(TimetoStr(Time) + ' - Iniciando processo de Conferência de Lancamentos.');

              Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1000, Filial, 'A');
              if Dados <> null then
              begin
                 NLancamentos := Dados;

                 DmExporterQuick.CdsNumeroLancamentosLoja.Close;
                 AbreTransacao;
                 DmExporterQuick.CdsNumeroLancamentosLoja.Open;
                 ConfirmaTransacao;

                 NLancamentosLoja := DmExporterQuick.CdsNumeroLancamentosLojaCOUNT.AsInteger;

                 GravaLog(TimetoStr(Time) + ' - Lancamentos Loja : ' + InttoStr(NLancamentosLoja) + ' - Lancamentos Matriz : ' + InttoStr(NLancamentos));

                 if NLancamentosLoja <> NLancamentos then
                  begin
                    DmExporterQuick.CdsCdLancamento.Close;
                    DmExporterQuick.CdsCdLancamento.CreateDataSet;
                    Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1002, Filial, 'A');
                    if Dados <> null then
                     begin
                        DmExporterQuick.CdsCdLancamento.Data := Dados;
                        DmExporterQuick.CdsCdLancamento.Open; // virtual
                        DmExporterQuick.CdsCdLancamento.IndexFieldNames := 'CD_LANCAMENTO';
                        DmExporterQuick.CdsCdLancamento.First;

                        GravaLog(TimetoStr(Time) + ' - Retornou ' + InttoStr(DmExporterQuick.CdsCdLancamento.RecordCount) + ' CD_LANCAMENTO da Matriz.');

                        DmExporterQuick.CdsCdLancamentoLoja.Close;
                        DmExporterQuick.CdsCdLancamentoLoja.Open;
                        DmExporterQuick.CdsCdLancamentoLoja.IndexFieldNames := 'CD_LANCAMENTO';
                        DmExporterQuick.CdsCdLancamentoLoja.First;

                        GravaLog(TimetoStr(Time) + ' - INSERT em TEMP_LANCAMENTOS.');

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
                     end
                    else
                     begin
                       GravaLog(TimetoStr(Time) + ' - Não retornou CD_LANCAMENTO da Matriz.');
                     end;
                  end;
              end
             else
              begin
                GravaLog(TimetoStr(Time) + ' - Dados = nulo - Não retornou nada em Lancamentos. Processo 1000');
              end;
            end;
            DmExporterQuick.CdsNumeroLancamentosLoja.Close;
            DmExporterQuick.CdsCdLancamento.Close;


         repeat
           DmExporterQuick.CdsCeLotes.Close;
           DmExporterQuick.TbCeLotes.CommandText := 'INSERT INTO TEMP_LANCAMENTOS2 SELECT FIRST 1000 CD_LANCAMENTO FROM TEMP_LANCAMENTOS';
           AbreTransacao;
           DmExporterQuick.TbCeLotes.ExecSQL(True);
           ConfirmaTransacao;

           DmExporterQuick.TbCeLotes.CommandText := Sql;
           DmExporterQuick.CdsCeLotes.FetchParams;
           AbreTransacao;
           DmExporterQuick.CdsCeLotes.Open;
           ConfirmaTransacao;
           if DmExporterQuick.CdsCeLotes.RecordCount <> 0 then
            begin
             GravaLog(TimetoStr(Time) + ' - Enviando Lancamentos: ' + FloatToStr(DmExporterQuick.CdsCeLotes.RecordCount));
             //DmExporterQuick.CdsCeLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'DmExporterQuick.CdsLotes.xml', dfXML);
             if (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1, Filial, DmExporterQuick.CdsCeLotes.Data) then
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
            VerificaConexao('');
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

procedure TFrmExporterClientQuick.EnvioLotesaPrazo;
begin
  //processamento e envio de Celotes.dat
  Try
      Try
         DmExporterQuick.CdsNumeroLancamentosLoja.Close;
         DmExporterQuick.CdsCdLancamento.Close;

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
           DmExporterQuick.CdsCeLotes2.Close;
           DmExporterQuick.TbCeLotes2.CommandText := 'INSERT INTO TEMP_LANCAMENTOS_APRAZO2 SELECT FIRST 1000 * FROM TEMP_LANCAMENTOS_APRAZO';
           AbreTransacao;
           DmExporterQuick.TbCeLotes2.ExecSQL(True);
           ConfirmaTransacao;

           DmExporterQuick.TbCeLotes2.CommandText := Sql;
           DmExporterQuick.TbCeLotes2.Params[0].DataType := ftFloat;
           DmExporterQuick.CdsCeLotes2.FetchParams;
           DmExporterQuick.CdsCeLotes2.Params[0].AsFloat := Filial;
           AbreTransacao;
           DmExporterQuick.CdsCeLotes2.Open;
           ConfirmaTransacao;
           if DmExporterQuick.CdsCeLotes2.RecordCount <> 0 then
            begin
             GravaLog(TimetoStr(Time) + ' - Enviando Lancamentos a Prazo: ' + FloatToStr(DmExporterQuick.CdsCeLotes2.RecordCount));
             if (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(16, Filial, DmExporterQuick.CdsCeLotes2.Data) then
               begin
                 DmExporterQuick.TbCeLotes2.Close;
                 DmExporterQuick.TbCeLotes2.CommandText := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO WHERE CD_LANCAMENTO IN (SELECT CD_LANCAMENTO FROM TEMP_LANCAMENTOS_APRAZO2)';
                 AbreTransacao;
                 DmExporterQuick.TbCeLotes2.ExecSQL(True);
                 ConfirmaTransacao;
                 DmExporterQuick.TbCeLotes2.CommandText := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO2';
                 AbreTransacao;
                 DmExporterQuick.TbCeLotes2.ExecSQL(True);
                 ConfirmaTransacao;
               end;
            end;
            VerificaConexao('');
         until DmExporterQuick.CdsCeLotes2.RecordCount = 0;

      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Lancamentos a Prazo - '+E.Message);
            DmExporterQuick.CdsNumeroLancamentosLoja.Close;
            DmExporterQuick.CdsCdLancamento.Close;
            DmExporterQuick.CdsCeLotes2.Close;

            DmExporterQuick.TbCeLotes2.Close;
            DmExporterQuick.TbCeLotes2.CommandText := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO2';
            AbreTransacao;
            DmExporterQuick.TbCeLotes2.ExecSQL(True);
            ConfirmaTransacao;

            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsCeLotes2.Close;
  End;
end;

procedure TFrmExporterClientQuick.EnvioCaixa;
var Dados : Variant;
begin
  //processamento e envio de Cecaixa.dat
  Try
      Try
        Sql := 'SELECT CAIXA.* FROM CAIXA, TEMP_CAIXA2 WHERE CAIXA.CD_CAIXA = TEMP_CAIXA2.CD_CAIXA';

        if ExecutaConferencia then
          begin
            GravaLog(TimetoStr(Time) + ' - Iniciando processo de Conferência de Caixa.');

            Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1001, Filial, 'A');
            if Dados <> null then
             begin
                NCaixa := Dados;

                DmExporterQuick.CdsNumeroCaixaLoja.Close;
                AbreTransacao;
                DmExporterQuick.CdsNumeroCaixaLoja.Open;
                ConfirmaTransacao;
                NCaixaLoja := DmExporterQuick.CdsNumeroCaixaLojaCOUNT.AsInteger;

                GravaLog(TimetoStr(Time) + ' - Caixas da Loja = ' + InttoStr(NCaixaLoja) + ' - Caixas da Matriz : ' + InttoStr(NCaixa) + '.');

                if NCaixaLoja <> NCaixa then
                 begin
                   DmExporterQuick.CdsCdCaixa.Close;
                   DmExporterQuick.CdsCdCaixa.CreateDataSet;
                   Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(1003, Filial, 'A');
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

                       GravaLog(TimetoStr(Time) + ' - INSERT em TEMP_CAIXA.');

                       while not DmExporterQuick.CdsCdCaixaLoja.Eof do
                        begin
                          if not DmExporterQuick.CdsCdCaixa.FindKey([DmExporterQuick.CdsCdCaixaLojaCD_CAIXA.AsFloat]) then
                           begin
                             //DmExporterQuick.TbCeLotes.CommandText := 'INSERT INTO TEMP_CAIXA VALUES (' + DmExporterQuick.CdsCdCaixaLojaCD_CAIXA.AsString + ')';
                             DmExporterQuick.TbCeCaixa.CommandText := 'INSERT INTO TEMP_CAIXA VALUES (' + DmExporterQuick.CdsCdCaixaLojaCD_CAIXA.AsString + ')';
                             AbreTransacao;
                             DmExporterQuick.TbCeCaixa.ExecSQL(True);
                             ConfirmaTransacao;
                           end;
                          DmExporterQuick.CdsCdCaixaLoja.Next;
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

        DmExporterQuick.CdsCdCaixaLoja.Close;
        DmExporterQuick.CdsCdCaixa.Close;

        repeat
           DmExporterQuick.CdsCeCaixa.Close;
           DmExporterQuick.TbCeCaixa.CommandText := 'INSERT INTO TEMP_CAIXA2 SELECT FIRST 1000 CD_CAIXA FROM TEMP_CAIXA';
           AbreTransacao;
           DmExporterQuick.TbCeCaixa.ExecSQL(True);
           ConfirmaTransacao;

           DmExporterQuick.TbCeCaixa.CommandText := Sql;
           DmExporterQuick.CdsCeCaixa.FetchParams;
           AbreTransacao;
           DmExporterQuick.CdsCeCaixa.Open;
           ConfirmaTransacao;
           if DmExporterQuick.CdsCeCaixa.RecordCount <> 0 then
            begin
             GravaLog(TimetoStr(Time) + ' - Enviando Caixa: ' + FloatToStr(DmExporterQuick.CdsCeCaixa.RecordCount));
             if (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(2, Filial, DmExporterQuick.CdsCeCaixa.Data) then
               begin
                 DmExporterQuick.TbCeCaixa.Close;
                 DmExporterQuick.TbCeCaixa.CommandText := 'DELETE FROM TEMP_CAIXA WHERE CD_CAIXA IN (SELECT CD_CAIXA FROM TEMP_CAIXA2)';
                 AbreTransacao;
                 DmExporterQuick.TbCeCaixa.ExecSQL(True);
                 ConfirmaTransacao;
                 DmExporterQuick.TbCeCaixa.CommandText := 'DELETE FROM TEMP_CAIXA2';
                 AbreTransacao;
                 DmExporterQuick.TbCeCaixa.ExecSQL(True);
                 ConfirmaTransacao;
               end;
            end;
            VerificaConexao('');
        until DmExporterQuick.CdsCeCaixa.RecordCount = 0;
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


function TFrmExporterClientQuick.BuscaMatrizProdutosIncluidos : Boolean;
var Dados : Variant;
begin
  //Busca na matriz os novos produtos incluidos
   Try
     Result := True;
     DmExporterQuick.CdsIncluiProdutos.Close;
     DmExporterQuick.CdsIncluiProdutos.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(103, Filial, 'A');
     if Dados = null then
      begin
        Result := False;
        Exit;
      end;
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
                     CodigoBarras2     := QuotedStr(DmExporterQuick.CdsIncluiProdutosCD_PRODUTO.AsString)
                 else
                     CodigoBarras2     := QuotedStr(DmExporterQuick.CdsIncluiProdutosCODIGO_BARRAS_2.AsString);
                 Descricao        := QuotedStr(DmExporterQuick.CdsIncluiProdutosDESCRICAO.AsString);
                 if not (DmExporterQuick.CdsIncluiProdutosCD_LABORATORIO.IsNull) then
                    Cd_Laboratorio   := DmExporterQuick.CdsIncluiProdutosCD_LABORATORIO.AsString
                 else
                    Cd_Laboratorio   := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCD_GRUPO.IsNull) then
                    Cd_Grupo         := DmExporterQuick.CdsIncluiProdutosCD_GRUPO.AsString
                 else
                    Cd_Grupo         := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCD_GRUPOBALANCO.IsNull) then
                    Cd_GrupoBalanco         := DmExporterQuick.CdsIncluiProdutosCD_GRUPOBALANCO.AsString
                 else
                    Cd_GrupoBalanco         := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCD_GRUPOCOMPRA.IsNull) then
                    Cd_GrupoCompra         := DmExporterQuick.CdsIncluiProdutosCD_GRUPOCOMPRA.AsString
                 else
                    Cd_GrupoCompra         := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCD_CLASSE.IsNull) then
                    Cd_Classe        := DmExporterQuick.CdsIncluiProdutosCD_CLASSE.AsString
                 else
                    Cd_Classe        := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosID_FAMILIA.IsNull) then
                    Id_Familia        := DmExporterQuick.CdsIncluiProdutosID_FAMILIA.AsString
                 else
                    Id_Familia        := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosTIPO_PRODUTO.IsNull) and (DmExporterQuick.CdsIncluiProdutosTIPO_PRODUTO.AsString <> '') then
                    TipoProduto      := QuotedStr(DmExporterQuick.CdsIncluiProdutosTIPO_PRODUTO.AsString)
                 else
                    TipoProduto      := QuotedStr('OU');
                 if not (DmExporterQuick.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.IsNull) and (DmExporterQuick.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.AsString <> '') then
                    EntraPE          := QuotedStr(DmExporterQuick.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.AsString)
                 else
                    EntraPE          := QuotedStr('N');
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
                    TxDesconto       := '0';
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
                    Qt_Embalagem     := '0';
                 if not DmExporterQuick.CdsIncluiProdutosCOMISSAO.IsNull then
                    Comissao         := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosCOMISSAO.AsString, '.', ''), ',', '.')
                 else
                    Comissao         := '0';
                 if not DmExporterQuick.CdsIncluiProdutosCUSTO_UNITARIO.IsNull then
                    CustoUnitario    := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosCUSTO_UNITARIO.AsString, '.', ''), ',', '.')
                 else
                    CustoUnitario    := '0';
                 if not DmExporterQuick.CdsIncluiProdutosPRECO_VENDA.IsNull then
                    Preco_Venda      := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosPRECO_VENDA.AsString, '.', ''), ',', '.')
                 else
                    Preco_Venda      := '0';
                 if not DmExporterQuick.CdsIncluiProdutosPRECO_PROMOCAO.IsNull then
                    Preco_Promocao   := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosPRECO_PROMOCAO.AsString, '.', ''), ',', '.')
                 else
                    Preco_Promocao   := '0';
                 if not DmExporterQuick.CdsIncluiProdutosICMS.IsNull then
                    Icms             := QuotedStr(DmExporterQuick.CdsIncluiProdutosICMS.AsString)
                 else
                    Icms             := QuotedStr('FF');
                 if not DmExporterQuick.CdsIncluiProdutosMARGEM.IsNull then
                    Margem           := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosMARGEM.AsString, '.', ''), ',', '.')
                 else
                    Margem           := '0';
                 if not (DmExporterQuick.CdsIncluiProdutosMARGEM_PROMOCAO.IsNull) then
                    Margem_Promocao  := StrTran(StrTran(DmExporterQuick.CdsIncluiProdutosMARGEM_PROMOCAO.AsString, '.', ''), ',', '.')
                 else
                    Margem_Promocao  := '0';
                 if not DmExporterQuick.CdsIncluiProdutosDT_CADASTRO.IsNull then
                    Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsIncluiProdutosDT_CADASTRO.AsDateTime))
                 else
                    Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', Date));
                 if not (DmExporterQuick.CdsIncluiProdutosCURVA.IsNull) and (DmExporterQuick.CdsIncluiProdutosCURVA.AsString <> '') then
                    Curva            := QuotedStr(DmExporterQuick.CdsIncluiProdutosCURVA.AsString)
                 else
                    Curva            := QuotedStr('C');
                 if not (DmExporterQuick.CdsIncluiProdutosSTATUS.IsNull) and (DmExporterQuick.CdsIncluiProdutosSTATUS.AsString <> '') then
                    Status           := QuotedStr(DmExporterQuick.CdsIncluiProdutosSTATUS.AsString)
                 else
                    Status           := QuotedStr('A');
                 if not (DmExporterQuick.CdsIncluiProdutosUSOCONTINUO.IsNull) and (DmExporterQuick.CdsIncluiProdutosUSOCONTINUO.AsString <> '') then
                    UsoContinuo      := QuotedStr(DmExporterQuick.CdsIncluiProdutosUSOCONTINUO.AsString)
                 else
                    UsoContinuo      := QuotedStr('N');
                 if not (DmExporterQuick.CdsIncluiProdutosPIS_COFINS.IsNull) and (DmExporterQuick.CdsIncluiProdutosPIS_COFINS.AsString <> '') then
                    Pis_Cofins       := QuotedStr(DmExporterQuick.CdsIncluiProdutosPIS_COFINS.AsString)
                 else
                    Pis_Cofins       := QuotedStr('N');
                 if not (DmExporterQuick.CdsIncluiProdutosNCM.IsNull) and (DmExporterQuick.CdsIncluiProdutosNCM.AsString <> '') then
                    NCM              := QuotedStr(DmExporterQuick.CdsIncluiProdutosNCM.AsString)
                 else
                    NCM              := QuotedStr('');
                 if not (DmExporterQuick.CdsIncluiProdutosCD_SUBGRUPO.IsNull) then
                    Cd_SubGrupo         := DmExporterQuick.CdsIncluiProdutosCD_SUBGRUPO.AsString
                 else
                    Cd_SubGrupo         := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCEST.IsNull) and (DmExporterQuick.CdsIncluiProdutosCEST.AsString <> '') then
                    CEST             := QuotedStr(DmExporterQuick.CdsIncluiProdutosCEST.AsString)
                 else
                    CEST             := QuotedStr('');
                 if not (DmExporterQuick.CdsIncluiProdutosCD_CFOP.IsNull) then
                    CD_CFOP          := DmExporterQuick.CdsIncluiProdutosCD_CFOP.AsString
                 else
                    CD_CFOP          := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosSITUACAOTRIBUTARIA.IsNull) then
                    SituacaoTributaria  := QuotedStr(DmExporterQuick.CdsIncluiProdutosSITUACAOTRIBUTARIA.AsString)
                 else
                    SituacaoTributaria  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosORIGEM.IsNull) then
                    Origem  := QuotedStr(DmExporterQuick.CdsIncluiProdutosORIGEM.AsString)
                 else
                    Origem  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCSOSN.IsNull) then
                    CSOSN  := QuotedStr(DmExporterQuick.CdsIncluiProdutosCSOSN.AsString)
                 else
                    CSOSN  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosIAT.IsNull) then
                    IAT  := QuotedStr(DmExporterQuick.CdsIncluiProdutosIAT.AsString)
                 else
                    IAT  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosIPPT.IsNull) then
                    IPPT  := QuotedStr(DmExporterQuick.CdsIncluiProdutosIPPT.AsString)
                 else
                    IPPT  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCOMPRIMIDOSCAIXA.IsNull) then
                    ComprimidosCaixa  := InttoStr(DmExporterQuick.CdsIncluiProdutosCOMPRIMIDOSCAIXA.AsInteger)
                 else
                    ComprimidosCaixa  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosCONTROLADO.IsNull) then
                    Controlado  := QuotedStr(DmExporterQuick.CdsIncluiProdutosCONTROLADO.AsString)
                 else
                    Controlado  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosGENERICO.IsNull) then
                    Generico  := QuotedStr(DmExporterQuick.CdsIncluiProdutosGENERICO.AsString)
                 else
                    Generico  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO.IsNull) then
                    Dt_Vencimento_Promocao  := QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO.AsDateTime))
                 else
                    Dt_Vencimento_Promocao  := 'NULL';
                 if not (DmExporterQuick.CdsIncluiProdutosOBSERVACAO.IsNull) then
                    Observacao  := QuotedStr(DmExporterQuick.CdsIncluiProdutosOBSERVACAO.AsString)
                 else
                    Observacao  := 'NULL';


                 DmExporterQuick.SQL1.CommandText := 'INSERT INTO PRODUTOS (ID_PRODUTO, CD_PRODUTO, CODIGO_BARRAS_1, CODIGO_BARRAS_2, DESCRICAO, ' +
                                     ' CD_LABORATORIO, CD_GRUPO, CD_CLASSE, TIPO_PRODUTO, IDENTIFICADOR, QT_EMBALAGEM, ' +
                                     ' COMISSAO, CUSTO_UNITARIO, CUSTO_UNITARIO_' + IntToStr(Filial) + ', CUSTO_MEDIO, CUSTO_MEDIO_' + IntToStr(Filial) +
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
                 AbreTransacao;
                 Try
                   DmExporterQuick.SQL1.ExecSQL(True);
                   ConfirmaTransacao;
                 Except
                   on E:Exception do
                    begin
                      CancelaTransacao;
                      GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos novos - '+E.Message);
                    end;
                 End;
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
         GravaLog(TimetoStr(Time) + ' SQL : ' + DmExporterQuick.SQL1.CommandText);
         DmExporterQuick.CdsIncluiProdutos.Close;
         DmExporterQuick.CdsCeProdutos.Close;
         Try
           DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
           AbreTransacao;
           DmExporterQuick.SQL1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           Result := False;
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
     Result := False;
     CancelaTransacao;
   End;

   DmExporterQuick.CdsCeProdutos.Close;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//envia para a matriz a posicao de estoque, estoque minimo, data ultima venda de cada produto da filial
function TFrmExporterClientQuick.EnviandoEstoque : Boolean;
var
 Dados : Variant;
 Classes, Grupos, Laboratorios, Distribuidores,
 Familias, GruposBalanco, GruposCompras, Cartoes : Real;
 Tentativas : Integer;
 cSQL : String;
begin
   Result := True;
   Try
      DmExporterQuick.TbCeProdutos.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 7';
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSQL(True);
      ConfirmaTransacao;

      //Inserido por GML em 20230517
      {cSQL := 'INSERT INTO TEMP_PRODUTOS select ID_PRODUTO, (SELECT CD_FILIAL FROM PARAMETROS), 7,' + QuotedStr('') + ' FROM PRODUTOS ';
      cSQL := cSQL + 'WHERE PRODUTOS.ID_PRODUTO IN (SELECT DISTINCT LANCAMENTOS.ID_PRODUTO FROM LANCAMENTOS WHERE LANCAMENTOS.DATA_LANCAMENTO = CURRENT_DATE )';
      DmExporterQuick.TbCeProdutos.CommandText := cSQL;
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSql(True);
      ConfirmaTransacao;

      DmExporterQuick.TbCeProdutos.CommandText := 'SELECT * FROM TEMP_PRODUTOS WHERE PROCESSO = 7';
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSql(True);
      ConfirmaTransacao;
      GravaLog(TimetoStr(Time) + ' - Incluindo Estoque de Produtos Movimentados: ' + FloatToStr(DmExporterQuick.TbCeProdutos.RecordCount));}


      DmExporterQuick.TbCeProdutos.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE PROCESSO = 7';
      //DmExporterQuick.TbCeProdutos.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT * FROM TEMP_PRODUTOS WHERE PROCESSO = 7';
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSql(True);
      ConfirmaTransacao;

      DmExporterQuick.TbCeProdutos.CommandText :=
                'SELECT PRODUTOS.ID_PRODUTO, PRODUTOS.ESTOQUE_' + FloatToStr(Filial) + ', ' +
                '       PRODUTOS.DT_ULT_VENDA_' + FloatToStr(Filial) + ' ,' +
                '       PRODUTOS.DT_ULT_COMPRA_' + FloatToStr(Filial) + ', ' +
                '       CAST(PRODUTOS.CUSTO_UNITARIO_' + FloatToStr(Filial) + ' AS NUMERIC(10,2)) AS CUSTO_UNITARIO_' + FloatToStr(Filial) + ', ' +
                '       CAST(PRODUTOS.CUSTO_MEDIO_' + FloatToStr(Filial) + ' AS NUMERIC(10,2)) AS CUSTO_MEDIO_' + FloatToStr(Filial) + ', ' +
                '       PRODUTOS.FACE_' + FloatToStr(Filial) + ', IDENTIFICADOR FROM PRODUTOS, TEMP_PRODUTOS2 ' +
                'WHERE  TEMP_PRODUTOS2.PROCESSO = 7 AND PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS2.ID_PRODUTO';

      DmExporterQuick.CdsCeProdutos.Params.Clear;
      AbreTransacao;
      DmExporterQuick.CdsCeProdutos.Open;
      ConfirmaTransacao;

      if DmExporterQuick.CdsCeProdutos.RecordCount <> 0 then
       begin
          GravaLog(TimetoStr(Time) + ' - Enviando Estoque: ' + FloatToStr(DmExporterQuick.CdsCeProdutos.RecordCount));
          DmExporterQuick.CdsCeProdutos.IndexFieldNames := 'ID_PRODUTO';
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(7, Filial, DmExporterQuick.CdsCeProdutos.Data);
          if (Dados <> null) and (Dados) then
           begin
              DmExporterQuick.CdsCeProdutos.Close;
              DmExporterQuick.TbCeProdutos.Close;
              DmExporterQuick.TbCeProdutos.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 7 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 7)';
              AbreTransacao;
              DmExporterQuick.TbCeProdutos.ExecSQL(True);
              ConfirmaTransacao;

              DmExporterQuick.TbCeProdutos.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 7';
              AbreTransacao;
              DmExporterQuick.TbCeProdutos.ExecSQL(True);
              ConfirmaTransacao;
           end;
       end
      else
       Result := False;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Estoques dos Produtos - '+E.Message);
         DmExporterQuick.CdsCeProdutos.Close;
       end;
   End;
   DmExporterQuick.CdsCeProdutos.Close;
end;


function TFrmExporterClientQuick.SetaEnviado9 : Boolean;
begin
  Result := True;
  Try
    DmExporterQuick.CdsCeProdutos.Close;
    DmExporterQuick.TbCeProdutos.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
    DmExporterQuick.CdsCeProdutos.Params.Clear;
    AbreTransacao;
    DmExporterQuick.TbCeProdutos.ExecSQL(True);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
    GravaLog(TimetoStr(Time) + ' - Não foi possível desativar a trigger TG_AT_DT_ALTERACAO_PRODUTO.');
    Result := False;
  End;

  if not Result then
    Exit;

  Try
      DmExporterQuick.CdsCeProdutos.Close;
      DmExporterQuick.TbCeProdutos.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 ID_PRODUTO, ID_PRODUTO, ID_PRODUTO, STATUS FROM PRODUTOS ' +
                                                  'WHERE ((ENVIADO <> '+ QuotedStr('2') +') OR (ENVIADO IS NULL))'; 
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSQL(True);
      ConfirmaTransacao;

      DmExporterQuick.CdsCeProdutos.Close;
      DmExporterQuick.TbCeProdutos.CommandText := 'UPDATE PRODUTOS SET ENVIADO = '+''''+'9'+''''+' WHERE ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2)';
      AbreTransacao;
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Seta Enviado 9  - ' + InttoStr(DmExporterQuick.TbCeProdutos.ExecSQL(True)));
      ConfirmaTransacao;

      DmExporterQuick.CdsCeProdutos.Close;
      DmExporterQuick.TbCeProdutos.CommandText := 'DELETE FROM TEMP_PRODUTOS2';
      AbreTransacao;
      DmExporterQuick.TbCeProdutos.ExecSQL(True);
      ConfirmaTransacao;
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
    DmExporterQuick.CdsCeProdutos.Close;
    DmExporterQuick.TbCeProdutos.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
    DmExporterQuick.CdsCeProdutos.Params.Clear;
    AbreTransacao;
    DmExporterQuick.TbCeProdutos.ExecSQL(True);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
    GravaLog(TimetoStr(Time) + ' - Não foi possível ativar a trigger TG_AT_DT_ALTERACAO_PRODUTO.');
    Result := False;
  End;
end;


procedure TFrmExporterClientQuick.ConsistenciaDados;
var
 Dados : Variant;
 Classes, Grupos, Laboratorios, Distribuidores,
 Familias, GruposBalanco, GruposCompras, Cartoes,
 Lancamentos, Caixas, ContasReceber : Real;
begin
    try
      //determino somatorios de itens, unidades, precos e custos para consistencia na matriz...
      GravaLog(TimetoStr(Time) + ' - Consistencia de Dados - Inicio ');
      DmExporterQuick.CdsControlador.Close;
      DmExporterQuick.SqlControlador.CommandText := 'SELECT COUNT(ID_PRODUTO) AS N_ITENS, ' +
                                    'SUM(ESTOQUE_' + InttoStr(Filial) + ') AS N_UNIDADES, ' +
                                    'SUM(CAST(CAST(CUSTO_UNITARIO_' + InttoStr(Filial) + ' AS NUMERIC(10,2)) AS DOUBLE PRECISION)) AS T_CUSTO, ' +
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
      DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(DISTINCT CD_LANCAMENTO) AS LANCAMENTOS FROM LANCAMENTOS WHERE CD_FILIAL = ' + DmExporterQuick.CdsParametrosCD_FILIAL.AsString + ' AND DATA_LANCAMENTO >= CURRENT_DATE - 30';
      DmExporterQuick.Cds1.Open;
      Lancamentos := DmExporterQuick.Cds1.FieldByName('LANCAMENTOS').AsFloat;

      DmExporterQuick.Cds1.Close;
      DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(DISTINCT CD_CAIXA) AS CAIXAS FROM CAIXA WHERE CD_FILIAL = ' + DmExporterQuick.CdsParametrosCD_FILIAL.AsString + ' AND DATA_CAIXA >= CURRENT_DATE - 30';
      DmExporterQuick.Cds1.Open;
      Caixas := DmExporterQuick.Cds1.FieldByName('CAIXAS').AsFloat;

      DmExporterQuick.Cds1.Close;
      DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(DISTINCT CD_CONTAS_RECEBER) AS CONTASRECEBER FROM CONTAS_RECEBER WHERE CD_FILIAL = ' + DmExporterQuick.CdsParametrosCD_FILIAL.AsString + ' AND DT_LANCAMENTO >= CURRENT_DATE - 30';
      DmExporterQuick.Cds1.Open;
      ContasReceber := DmExporterQuick.Cds1.FieldByName('CONTASRECEBER').AsFloat;

      DmExporterQuick.Cds1.Close;

      DmExporterQuick.CdsControlador.Edit;
      DmExporterQuick.CdsControladorCLASSES.AsFloat       := Classes;
      DmExporterQuick.CdsControladorGRUPOS.AsFloat        := Grupos;
      DmExporterQuick.CdsControladorLABORATORIOS.AsFloat  := Laboratorios;
      DmExporterQuick.CdsControladorDISTRIBUIDORES.AsFloat:= Distribuidores;
      DmExporterQuick.CdsControladorFAMILIAS.AsFloat      := Familias;
      DmExporterQuick.CdsControladorGRUPOSBALANCO.AsFloat := GruposBalanco;
      DmExporterQuick.CdsControladorGRUPOSCOMPRAS.AsFloat := GruposCompras;
      DmExporterQuick.CdsControladorCARTOES.AsFloat       := Cartoes;
      DmExporterQuick.CdsControladorLANCAMENTOS.AsFloat   := Lancamentos;
      DmExporterQuick.CdsControladorCAIXAS.AsFloat        := Caixas;
      DmExporterQuick.CdsControladorCONTASRECEBER.AsFloat := ContasReceber;
      DmExporterQuick.CdsControlador.Post;

      (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(0, Filial, DmExporterQuick.CdsControlador.Data);
      DmExporterQuick.CdsControlador.Close;
      GravaLog(TimetoStr(Time) + ' - Consistencia de Dados - Final do Processo ');

    except
      CancelaTransacao;
      GravaLog(TimetoStr(Time) + ' - Não foi possível fazer a consistencia de dados. 2');
      DmExporterQuick.CdsControlador.Close;
    end;

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
         VerificaConexao('');
         Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(8, Filial, DmExporterQuick.CdsOperadores.Data);
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


function TFrmExporterClientQuick.EnviandoClientes : Boolean;
var
 Dados : Variant;
 Sql : String;
begin
  //envia para a matriz os dados de Clientes
  Try
     Result := True;
     Sql := 'SELECT * FROM CLIENTES, TEMP_PRODUTOS2 WHERE TEMP_PRODUTOS2.PROCESSO = 14 AND CLIENTES.CD_CLIENTE = TEMP_PRODUTOS2.ID_PRODUTO';

     DmExporterQuick.TbCeClientes.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 14';
     AbreTransacao;
     DmExporterQuick.TbCeClientes.ExecSQL(True);
     ConfirmaTransacao;

     DmExporterQuick.TbCeClientes.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE PROCESSO = 14';
     AbreTransacao;
     DmExporterQuick.TbCeClientes.ExecSQL(True);
     ConfirmaTransacao;
     DmExporterQuick.CdsCeClientes.Close;
     DmExporterQuick.TbCeClientes.CommandText := Sql;
     DmExporterQuick.CdsCeClientes.Close;
     DmExporterQuick.CdsCeClientes.Open;
     if DmExporterQuick.CdsCeClientes.RecordCount <> 0 then
      begin
         try
             GravaLog(TimetoStr(Time) + ' - Enviando Clientes: '+ FloatToStr(DmExporterQuick.CdsCeClientes.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(14, Filial, DmExporterQuick.CdsCeClientes.Data);
             if (Dados <> null) then
                DmExporterQuick.CdsCeClientes.Close
             else
                Result := False;   
         except
           Result := False;
           CancelaTransacao;
         end;
      end
     else
      begin
        Result := False;
      end;
     DmExporterQuick.TbCeClientes.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 14 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 14)';
     AbreTransacao;
     DmExporterQuick.TbCeClientes.ExecSQL(True);
     ConfirmaTransacao;

     DmExporterQuick.TbCeClientes.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 14';
     AbreTransacao;
     DmExporterQuick.TbCeClientes.ExecSQL(True);
     ConfirmaTransacao;
  Except
     on E:Exception do
      begin
        Result := False;
        CancelaTransacao;
        GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Envio de Clientes - '+E.Message);
        Result := False;
        Exit;
      end;
  End;
  DmExporterQuick.CdsCeClientes.Close;
end;



procedure TFrmExporterClientQuick.EnviandoUsuarios;
var
 Dados : Variant;
 Sql : String;
begin
  //envia para a matriz os dados de Clientes
  Try
     Sql := DmExporterQuick.TbCeUsu.CommandText;

     Try
      DmExporterQuick.TbOperadores.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 INACTIVE';
      AbreTransacao;
      DmExporterQuick.TbOperadores.ExecSQL(True);
      ConfirmaTransacao;
     Except
      CancelaTransacao;
     End;

     DmExporterQuick.TbCeUsu.CommandText := 'UPDATE USUARIOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2');
     AbreTransacao;
     DmExporterQuick.TbCeUsu.ExecSQL(True);
     ConfirmaTransacao;
     DmExporterQuick.TbCeUsu.CommandText := Sql;
     DmExporterQuick.CdsCeUsu.Open;
     if DmExporterQuick.CdsCeUsu.RecordCount <> 0 then
      begin
         try
             GravaLog(TimetoStr(Time) + ' - Enviando Usuarios: '+ FloatToStr(DmExporterQuick.CdsCeUsu.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(55, Filial, DmExporterQuick.CdsCeUsu.Data);
             if (Dados <> null) and (Dados) then
                DmExporterQuick.CdsCeUsu.Close;
         except
           CancelaTransacao;
         end;
      end;
     DmExporterQuick.TbCeUsu.CommandText := 'UPDATE USUARIOS SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
     AbreTransacao;
     DmExporterQuick.TbCeUsu.ExecSQL(True);
     ConfirmaTransacao;

     Try
      DmExporterQuick.TbOperadores.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
      AbreTransacao;
      DmExporterQuick.TbOperadores.ExecSQL(True);
      ConfirmaTransacao;
     Except
      CancelaTransacao;
     End;

  Except
     on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de Envio de Usuarios - '+E.Message);

        Try
         DmExporterQuick.TbOperadores.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
         AbreTransacao;
         DmExporterQuick.TbOperadores.ExecSQL(True);
         ConfirmaTransacao;
        Except
         CancelaTransacao;
        End;

        Exit;
      end;
  End;
  DmExporterQuick.CdsCeUsu.Close;
end;


procedure TFrmExporterClientQuick.EnviandoCRM;
var Dados : Variant;
begin
  //envia para a matriz os dados de CRM

  Sql := DmExporterQuick.SqlCRM.CommandText;

  Try
   DmExporterQuick.SqlCRM.CommandText := 'ALTER TRIGGER CRM_BIU0 INACTIVE';
   AbreTransacao;
   DmExporterQuick.SqlCRM.ExecSQL(True);
   ConfirmaTransacao;
  Except
   CancelaTransacao;
  End;


  Try
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
         VerificaConexao('');
         Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(15, Filial, DmExporterQuick.CdsCRM.Data);
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

    Try
     DmExporterQuick.SqlCRM.CommandText := 'ALTER TRIGGER CRM_BIU0 ACTIVE';
     AbreTransacao;
     DmExporterQuick.SqlCRM.ExecSQL(True);
     ConfirmaTransacao;
    Except
     CancelaTransacao;
    End;

  Except
     on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(FormatDateTime('hh:mm:ss',Time)+ ' - Falha de conexao no processo de CRM - '+E.Message);
        DmExporterQuick.CdsCRM.Close;

        Try
         DmExporterQuick.SqlCRM.CommandText := 'ALTER TRIGGER CRM_BIU0 ACTIVE';
         AbreTransacao;
         DmExporterQuick.SqlCRM.ExecSQL(True);
         ConfirmaTransacao;
        Except
         CancelaTransacao;
        End;

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
             VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando Entregas: ' + FloatToStr(DmExporterQuick.CdsEntregas.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(9, Filial, DmExporterQuick.CdsEntregas.Data);
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
         Try
           DmExporterQuick.TbEntregas.CommandText := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 INACTIVE';
           AbreTransacao;
           DmExporterQuick.TbEntregas.ExecSQL;
           ConfirmaTransacao;
         Except
           CancelaTransacao;
         End;

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
             VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando Cheques Recebidos: ' + FloatToStr(DmExporterQuick.CdsCheques.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(10, Filial, DmExporterQuick.CdsCheques.Data);
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

            Try
              DmExporterQuick.TbEntregas.CommandText := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 ACTIVE';
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
    DmExporterQuick.CdsCheques.Close;
    
    Try
      DmExporterQuick.TbEntregas.CommandText := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 ACTIVE';
      AbreTransacao;
      DmExporterQuick.TbEntregas.ExecSQL;
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    End;
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

         GravaLog(TimetoStr(Time) + ' - Inicio do processo de ItensTransfer');
         Try
           EnviandoItensTransfer;
         Except
           on E:Exception do
             begin
               CancelaTransacao;
               GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de ItensTransfer - ' + E.Message);
               DmExporterQuick.CdsCeItensTransfer.Close;
             end;
         end;
         GravaLog(TimetoStr(Time) + ' - Fim do processo de ItensTransfer');

         GravaLog(TimetoStr(Time) + ' - Inicio do processo de Transfer');
         DmExporterQuick.TbTransfer.CommandText := Sql;
         AbreTransacao;
         DmExporterQuick.CdsCeTransfer.Open;
         ConfirmaTransacao;
         if DmExporterQuick.CdsCeTransfer.RecordCount > 0 then
          begin
             GravaLog(TimetoStr(Time) + ' - Enviando Transfer: ' + FloatToStr(DmExporterQuick.CdsCeTransfer.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(11, Filial, DmExporterQuick.CdsCeTransfer.Data);
             if (Dados <> null) and (Dados) then
               begin
                 DmExporterQuick.CdsCeTransfer.Close;
                 DmExporterQuick.TbTransfer.Close;
                 DmExporterQuick.TbTransfer.CommandText := 'UPDATE TRANSFER SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                 AbreTransacao;
                 DmExporterQuick.TbTransfer.ExecSQL(True);
                 ConfirmaTransacao;
               end;
          end;
         GravaLog(TimetoStr(Time) + ' - Fim do processo de Transfer');
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

procedure TFrmExporterClientQuick.EnviandoTransfer1;
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
         GravaLog(TimetoStr(Time) + ' - Inicio do processo Transfer1');
         DmExporterQuick.TbTransfer.CommandText := 'UPDATE TRANSFER SET ENVIADO = '+QuotedStr('9')+' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> '+QuotedStr('2')+')) AND (STATUS <> ''' + 'A' + ''')';
         AbreTransacao;
         DmExporterQuick.TbTransfer.ExecSQL;
         ConfirmaTransacao;
         DmExporterQuick.CdsCeTransfer.Close;

         DmExporterQuick.TbTransfer.CommandText := Sql;
         AbreTransacao;
         DmExporterQuick.CdsCeTransfer.Open;
         ConfirmaTransacao;
         if DmExporterQuick.CdsCeTransfer.RecordCount > 0 then
          begin
             GravaLog(TimetoStr(Time) + ' - Verificando conexao');
             VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando Transfer: ' + FloatToStr(DmExporterQuick.CdsCeTransfer.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(11, Filial, DmExporterQuick.CdsCeTransfer.Data);
             GravaLog(TimetoStr(Time) + ' - Fim do processo Transfer1');

             GravaLog(TimetoStr(Time) + ' - Inicio do processo ItensTransfer1');
             Try
               EnviandoItensTransfer;
               GravaLog(TimetoStr(Time) + ' - Fim do processo ItensTransfer1');
             Except
               on E:Exception do
                 begin
                   CancelaTransacao;
                   GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de ItensTransfer - ' + E.Message);
                   DmExporterQuick.CdsCeItensTransfer.Close;
                 end;
             end;

             if (Dados <> null) and (Dados) then
               begin
                 DmExporterQuick.CdsCeTransfer.Close;
                 DmExporterQuick.TbTransfer.Close;
                 DmExporterQuick.TbTransfer.CommandText := 'UPDATE TRANSFER SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                 AbreTransacao;
                 DmExporterQuick.TbTransfer.ExecSQL(True);
                 ConfirmaTransacao;
               end;
          end
         else
           GravaLog(TimetoStr(Time) + ' - Fim do processo Transfer1');
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
             VerificaConexao('');
             GravaLog(TimetoStr(Time) + ' - Enviando ItensTransfer: ' + FloatToStr(DmExporterQuick.CdsCeItensTransfer.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(12, Filial, DmExporterQuick.CdsCeItensTransfer.Data);
             if (Dados <> null) and (Dados) then
                 DmExporterQuick.CdsCeItensTransfer.Close;
          end;
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  ItensTransfer - '+E.Message);
            DmExporterQuick.CdsCeItensTransfer.Close;
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
               Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(13, Filial, DmExporterQuick.CdsCadernoFaltas.Data);
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
    DmExporterQuick.SQL1.CommandText := 'UPDATE CADERNO_FALTAS SET STATUS = ' + QuotedStr('E') + ' WHERE (STATUS IS NULL) OR (STATUS <> ' + QuotedStr('E') + ')';
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
           Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(52, Filial, DmExporterQuick.CdsPrecoVenda.Data);
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

       DmExporterQuick.SQL1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 52';
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
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(117, Filial, 'A');
     if Dados = null then
        Exit;
     DmExporterQuick.CdsTransfer.Data := Dados;
     DmExporterQuick.CdsTransfer.Open; // virtual

     if DmExporterQuick.CdsTransfer.RecordCount <> 0 then
        begin
           GravaLog(TimetoStr(Time) + ' - Transferencias Recebidas: ' + FloatToStr(DmExporterQuick.CdsTransfer.RecordCount));
           DmExporterQuick.CdsTransfer.First;
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

         Try
           DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
           AbreTransacao;
           DmExporterQuick.SQL1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           CancelaTransacao;
         End;

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
     DAdos := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(118, Filial, 'A');
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
   Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(119, Filial, 'A');
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
           //GravaLog(TimetoStr(Time) + ' - ' + InttoStr(DmExporterQuick.CdsCadastro.RecordCount) + ' cadastro recebido - Processado item: '+ FloatToStr(DmExporterQuick.CdsCadastro.RecNo));
           DmExporterQuick.SQL1.CommandText := 'UPDATE PRODUTOS SET ' +
                               ' CD_PRODUTO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CD_PRODUTO').AsString) + ' , ' +
                               ' CD_LABORATORIO = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_LABORATORIO').AsString + ' , ' +
                               ' CD_GRUPO = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_GRUPO').AsString + ' , ' +
                               ' CD_CLASSE = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_CLASSE').AsString + ' , ' +
                               ' CD_GRUPOBALANCO = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_GRUPOBALANCO').AsString + ' , ' +
                               ' CD_GRUPOCOMPRA = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_GRUPOCOMPRA').AsString + ' , ' +
                               ' CODIGO_BARRAS_1 = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CODIGO_BARRAS_1').AsString) + ' , ' +
                               ' DESCRICAO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('DESCRICAO').AsString) + ' , ' +
                               ' TIPO_PRODUTO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('TIPO_PRODUTO').AsString) + ' , ' +
                               ' UNIDADE = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('UNIDADE').AsString) + ' , ' +
                               ' STATUS = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('STATUS').asString) + ' , ' +
                               ' ESTOQUE_MINIMO_' + InttoStr(Filial) + ' = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_MINIMO').asString, '.', ''), ',', '.') + ' , ' +
                               ' ESTOQUE_MAXIMO_' + InttoStr(Filial) + ' = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_MAXIMO').asString, '.', ''), ',', '.') + ' , ' +
                               ' MEDIAF_' + InttoStr(Filial) + ' = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('MEDIAF').asString, '.', ''), ',', '.') + ' , ' +
                               ' CURVA_UNITARIA_' + InttoStr(Filial) + ' = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CURVA_UNITARIA').asString) + ' , ' +
                               ' CURVA_FINANCEIRA_' + InttoStr(Filial) + ' = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CURVA_FINANCEIRA').asString);


           //gravacao dos estoques das demais filiais...
           while not (DmExporterQuick.CdsFiliais.Eof) do
            begin
              try
                DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ', ' +
                                    EstoqueFiliais[DmExporterQuick.CdsFiliais.FieldByName('CD_FILIAL').AsInteger] + ' = ' +
                                    StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName(EstoqueFiliais[DmExporterQuick.CdsFiliais.FieldByName('CD_FILIAL').AsInteger]).AsString, '.', ''), ',', '.');
              except
              end;
              DmExporterQuick.CdsFiliais.Next;
              if DmExporterQuick.CdsFiliais.FieldByName('CD_FILIAL').AsInteger > 30 then
                 Break;
            end;
           DmExporterQuick.CdsFiliais.First;
           if not DmExporterQuick.CdsCadastro.FieldByName('PRINCIPIOATIVO').IsNull then
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,PRINCIPIOATIVO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('PRINCIPIOATIVO').AsString);
            end
           else
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,PRINCIPIOATIVO = ' + QuotedStr('');
            end;
           if not DmExporterQuick.CdsCadastro.FieldByName('IDENTIFICADOR').IsNull then
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,IDENTIFICADOR = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('IDENTIFICADOR').AsString);
            end
           else
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,IDENTIFICADOR = ' + QuotedStr('');
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
           if not DmExporterQuick.CdsCadastro.FieldByName('CD_SUBGRUPO').IsNull then
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,CD_SUBGRUPO = ' + DmExporterQuick.CdsCadastro.FieldByName('CD_SUBGRUPO').AsString;
            end
           else
            begin
              DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
              ' ,CD_SUBGRUPO = NULL';
            end;
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

           if not (DmExporterQuick.CdsCadastro.FieldByName('MARGEM').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('MARGEM').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,MARGEM = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('MARGEM').AsString, '.', ''), ',', '.')
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,MARGEM = 0';

           if not (DmExporterQuick.CdsCadastro.FieldByName('COMISSAO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('COMISSAO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,COMISSAO = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('COMISSAO').AsString, '.', ''), ',', '.')
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,COMISSAO = 0';

           if not (DmExporterQuick.CdsCadastro.FieldByName('USOCONTINUO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('USOCONTINUO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,USOCONTINUO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('USOCONTINUO').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,USOCONTINUO = ''' + 'N' + ''' ';

           if not (DmExporterQuick.CdsCadastro.FieldByName('COMPRIMIDOSCAIXA').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('COMPRIMIDOSCAIXA').AsFloat > 0) then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,COMPRIMIDOSCAIXA = ' + DmExporterQuick.CdsCadastro.FieldByName('COMPRIMIDOSCAIXA').AsString
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,COMPRIMIDOSCAIXA = 0';

           if not (DmExporterQuick.CdsCadastro.FieldByName('TX_DESCONTO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('TX_DESCONTO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,TX_DESCONTO = ' + StrTran(StrTran(DmExporterQuick.CdsCadastro.FieldByName('TX_DESCONTO').AsString, '.', ''), ',', '.')
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,TX_DESCONTO = 0';

           if not (DmExporterQuick.CdsCadastro.FieldByName('CONTROLADO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('CONTROLADO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CONTROLADO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CONTROLADO').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CONTROLADO = ' + QuotedStr('N');

           if not (DmExporterQuick.CdsCadastro.FieldByName('PIS_COFINS').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('PIS_COFINS').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,PIS_COFINS = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('PIS_COFINS').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,PIS_COFINS = ' + QuotedStr('N');

           if not (DmExporterQuick.CdsCadastro.FieldByName('OBSERVACAO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('OBSERVACAO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,OBSERVACAO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('OBSERVACAO').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,OBSERVACAO = ' + QuotedStr('');

           {if not (DmExporterQuick.CdsCadastro.FieldByName('NCM').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('NCM').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,NCM = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('NCM').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,NCM = ' + QuotedStr('');

           if not (DmExporterQuick.CdsCadastro.FieldByName('CEST').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('CEST').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CEST = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CEST').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CEST = ' + QuotedStr('');

           if not (DmExporterQuick.CdsCadastro.FieldByName('ICMS').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('ICMS').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,ICMS = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('ICMS').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,ICMS = ' + QuotedStr('FF');}

           if not (DmExporterQuick.CdsCadastro.FieldByName('GENERICO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('GENERICO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,GENERICO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('GENERICO').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,GENERICO = ' + QuotedStr('N');

           if not (DmExporterQuick.CdsCadastro.FieldByName('ENTRA_PEDIDO_ELETRONICO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('ENTRA_PEDIDO_ELETRONICO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,ENTRA_PEDIDO_ELETRONICO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('ENTRA_PEDIDO_ELETRONICO').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,ENTRA_PEDIDO_ELETRONICO = ' + QuotedStr('N');

           if not (DmExporterQuick.CdsCadastro.FieldByName('BALANCA').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('BALANCA').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,BALANCA = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('BALANCA').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,BALANCA = ' + QuotedStr('N');

           if not (DmExporterQuick.CdsCadastro.FieldByName('IPPT').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('IPPT').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,IPPT = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('IPPT').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,IPPT = ' + QuotedStr('T');

           if not (DmExporterQuick.CdsCadastro.FieldByName('IAT').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('IAT').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,IAT = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('IAT').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,IAT = ' + QuotedStr('T');

           {if not (DmExporterQuick.CdsCadastro.FieldByName('CD_CFOP').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('CD_CFOP').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CD_CFOP = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CD_CFOP').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CD_CFOP = NULL';}

           if not (DmExporterQuick.CdsCadastro.FieldByName('REGISTROMS').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('REGISTROMS').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,REGISTROMS = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('REGISTROMS').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,REGISTROMS = ' + QuotedStr('');

           if not (DmExporterQuick.CdsCadastro.FieldByName('COMPOSTO').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('COMPOSTO').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,COMPOSTO = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('COMPOSTO').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,COMPOSTO = ' + QuotedStr('');

           {if not (DmExporterQuick.CdsCadastro.FieldByName('ORIGEM').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('ORIGEM').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,ORIGEM = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('ORIGEM').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,ORIGEM = ' + QuotedStr('0');

           if not (DmExporterQuick.CdsCadastro.FieldByName('CSOSN').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('CSOSN').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CSOSN = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('CSOSN').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,CSOSN = ' + QuotedStr('');

           if not (DmExporterQuick.CdsCadastro.FieldByName('SITUACAOTRIBUTARIA').IsNull) and (DmExporterQuick.CdsCadastro.FieldByName('SITUACAOTRIBUTARIA').AsString <> '') then
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,SITUACAOTRIBUTARIA = ' + QuotedStr(DmExporterQuick.CdsCadastro.FieldByName('SITUACAOTRIBUTARIA').AsString)
           else
             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
             ' ,SITUACAOTRIBUTARIA = ' + QuotedStr('60');}

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
         Result := False;
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
   Result := False;
 End;
end;


function TFrmExporterClientQuick.RecebendoEstoques : Boolean;
var
 Dados : Variant;
 i : Integer;
 Sql : String;
 ParamsFloat : Array of Real;
 ParamsString : Array of String;
begin
 //busca na matriz os estoques
 Try
   // Atualiza produtos
   Result := True;
   DmExporterQuick.CdsCadastro.Close;
   Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(1191, Filial, 'A');
   if Dados = null then
    begin
      Result := False;
      Exit;
    end;
   SetLength(ParamsString, 30);
   SetLength(ParamsFloat, 32);
   DmExporterQuick.CdsCadastro.Data := Dados;
   DmExporterQuick.CdsCadastro.Open; // virtual
   if DmExporterQuick.CdsCadastro.RecordCount > 0 then
    begin
       Try
         GravaLog(TimetoStr(Time) + ' - ' + InttoStr(DmExporterQuick.CdsCadastro.RecordCount) + ' estoques recebidos.');
         DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
         AbreTransacao;
         DmExporterQuick.SQL1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
         Result := False;
       End;

       DmExporterQuick.CdsCadastro.First;
       while not DmExporterQuick.CdsCadastro.Eof do
        begin
            ParamsFloat[0] := Filial;
            ParamsFloat[1] := DmExporterQuick.CdsCadastro.FieldByName('ID_PRODUTO').AsFloat;

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

            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_1').IsNull) then
                ParamsFloat[2] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_1').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_2').IsNull) then
                ParamsFloat[3] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_2').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_3').IsNull) then
                ParamsFloat[4] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_3').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_4').IsNull) then
                ParamsFloat[5] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_4').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_5').IsNull) then
                ParamsFloat[6] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_5').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_6').IsNull) then
                ParamsFloat[7] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_6').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_7').IsNull) then
                ParamsFloat[8] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_7').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_8').IsNull) then
                ParamsFloat[9] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_8').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_9').IsNull) then
                ParamsFloat[10] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_9').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_10').IsNull) then
                ParamsFloat[11] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_10').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_11').IsNull) then
                ParamsFloat[12] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_11').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_12').IsNull) then
                ParamsFloat[13] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_12').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_13').IsNull) then
                ParamsFloat[14] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_13').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_14').IsNull) then
                ParamsFloat[15] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_14').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_15').IsNull) then
                ParamsFloat[16] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_15').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_16').IsNull) then
                ParamsFloat[17] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_16').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_17').IsNull) then
                ParamsFloat[18] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_17').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_18').IsNull) then
                ParamsFloat[19] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_18').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_19').IsNull) then
                ParamsFloat[20] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_19').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_20').IsNull) then
                ParamsFloat[21] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_20').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_21').IsNull) then
                ParamsFloat[22] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_21').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_22').IsNull) then
                ParamsFloat[23] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_22').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_23').IsNull) then
                ParamsFloat[24] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_23').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_24').IsNull) then
                ParamsFloat[25] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_24').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_25').IsNull) then
                ParamsFloat[26] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_25').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_26').IsNull) then
                ParamsFloat[27] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_26').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_27').IsNull) then
                ParamsFloat[28] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_27').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_28').IsNull) then
                ParamsFloat[29] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_28').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_29').IsNull) then
                ParamsFloat[30] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_29').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_30').IsNull) then
                ParamsFloat[31] := DmExporterQuick.CdsCadastro.FieldByName('ESTOQUE_30').AsFloat;
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_1').IsNull) then
                ParamsString[0]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_1').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_2').IsNull) then
                ParamsString[1]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_2').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_3').IsNull) then
                ParamsString[2]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_3').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_4').IsNull) then
                ParamsString[3]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_4').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_5').IsNull) then
                ParamsString[4]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_5').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_6').IsNull) then
                ParamsString[5]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_6').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_7').IsNull) then
                ParamsString[6]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_7').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_8').IsNull) then
                ParamsString[7]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_8').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_9').IsNull) then
                ParamsString[8]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_9').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_10').IsNull) then
                ParamsString[9]  := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_10').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_11').IsNull) then
                ParamsString[10] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_11').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_12').IsNull) then
                ParamsString[11] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_12').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_13').IsNull) then
                ParamsString[12] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_13').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_14').IsNull) then
                ParamsString[13] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_14').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_15').IsNull) then
                ParamsString[14] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_15').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_16').IsNull) then
                ParamsString[15] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_16').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_17').IsNull) then
                ParamsString[16] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_17').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_18').IsNull) then
                ParamsString[17] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_18').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_19').IsNull) then
                ParamsString[18] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_19').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_20').IsNull) then
                ParamsString[19] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_20').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_21').IsNull) then
                ParamsString[20] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_21').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_22').IsNull) then
                ParamsString[21] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_22').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_23').IsNull) then
                ParamsString[22] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_23').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_24').IsNull) then
                ParamsString[23] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_24').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_25').IsNull) then
                ParamsString[24] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_25').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_26').IsNull) then
                ParamsString[25] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_26').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_27').IsNull) then
                ParamsString[26] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_27').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_28').IsNull) then
                ParamsString[27] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_28').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_29').IsNull) then
                ParamsString[28] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_29').AsDateTime);
            if not (DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_30').IsNull) then
                ParamsString[29] := FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsCadastro.FieldByName('DT_ULT_VENDA_30').AsDateTime);

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

            DmExporterQuick.SqlAtualizaEstoque.CommandText := Sql;
            Try
              DmExporterQuick.SqlAtualizaEstoque.ExecSQL(False);
            Except
            End;  

           DmExporterQuick.CdsCadastro.Next;
        end;
    end;
   DmExporterQuick.CdsCadastro.Close;

   Try
     DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
     AbreTransacao;
     DmExporterQuick.SQL1.ExecSQL(True);
     ConfirmaTransacao;
   Except
     CancelaTransacao;
     Result := False;
   End;

 Except
     on E:Exception do
     begin
       Result := False;
       CancelaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo de Recebimento de Estoques - '+ E.Message);
       DmExporterQuick.CdsCadastro.Close;
       Try
         DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
         AbreTransacao;
         DmExporterQuick.SQL1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
         Result := False;
       End;
     end;
 end;
end;



Function TFrmExporterClientQuick.RecebendoPrecos : Boolean;
var
 Dados : Variant;
begin
  Result := False;
  //busca na matriz os preço de Venda dos Produtos
  if AtualizaPrecoVenda = 'S' then
   begin
       Try
         // Atualiza produtos
         Result := True;

         // Verificando a existencia de precos a serem enviados para a gestão
         // Caso existam forçar o envio e não receber os da gestão no mesmo processo
         AbreTransacao;
         DmExporterQuick.Cds1.Close;
         DmExporterQuick.Sql1.CommandText := 'SELECT COUNT(*) FROM TEMP_PRODUTOS WHERE PROCESSO = 52';
         DmExporterQuick.Cds1.Params.Clear;
         DmExporterQuick.Cds1.Open;

         ConfirmaTransacao;
         if DmExporterQuick.Cds1.Fields[0].Value > 0 then
          begin
             DmExporterQuick.Cds1.Close;
             try
               GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Iniciando Envio de Precos na Filial através do processo de Recebimento de Preços da gestão');
               EnviandoPrecosFilial;
             except
             end;
             Result := False;
             Exit;
          end;
         DmExporterQuick.Cds1.Close;

         DmExporterQuick.CdsFiliais.Close;
         DmExporterQuick.CdsFiliais.Params[0].AsFloat := Filial;
         DmExporterQuick.CdsFiliais.Open;
         DmExporterQuick.CdsFiliais.First;
         DmExporterQuick.CdsPrecos.Close;
         Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(125, Filial, 'A');
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
               DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO INACTIVE';
               AbreTransacao;
               DmExporterQuick.SQL1.ExecSQL(True);
               ConfirmaTransacao;
               DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 INACTIVE';
               AbreTransacao;
               DmExporterQuick.SQL1.ExecSQL(True);
               ConfirmaTransacao;
               DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE';
               AbreTransacao;
               DmExporterQuick.SQL1.ExecSQL(True);
               ConfirmaTransacao;
             Except
               CancelaTransacao;
             End;

             DmExporterQuick.CdsPrecos.First;
             GravaLog(TimetoStr(Time) + ' - ' + InttoStr(DmExporterQuick.CdsPrecos.RecordCount) + ' precos recebidos.');
             while not DmExporterQuick.CdsPrecos.Eof do
              begin
                 if (DmExporterQuick.CdsPrecos.FieldByName('DATA_REAJUSTE').AsDateTime >= Date) then
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
                                                         QuotedStr('N') + ', ';
                     if not DmExporterQuick.CdsPrecos.FieldByName('DATA_REAJUSTE').IsNull then
                        DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                                            QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('DATA_REAJUSTE').AsDateTime))
                     else
                        DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                                            ' NULL ';

                     if DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString = 'SP' then
                      begin
                         DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ', ' +
                                                             QuotedStr('ExporterClientQuick') + ', ' + QuotedStr(DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                      end
                     else
                      begin
                         DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText + ', ' +
                                                             QuotedStr(DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr(DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                      end;

                  end
                 else
                  begin //incluido tratamento da SP de exportacao por GML em 13.07.2012
                        //para nao incluir os reajustes em caso de reexportacao de precos
                    if DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString <> 'SP' then
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
                                                             QuotedStr('S') + ', ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ' , ';

                         if DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString = 'SP' then
                          begin
                             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                                                 QuotedStr('ExporterClientQuick') + ', ' + QuotedStr(DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                          end
                         else
                          begin
                             DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                                                                 QuotedStr(DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr(DmExporterQuick.CdsPrecos.FieldByName('USUARIO').AsString) + ', ' + QuotedStr('2') + ')';
                          end;

                         try
                           AbreTransacao;
                           DmExporterQuick.SQL1.ExecSQL(True);
                           ConfirmaTransacao;
                         except
                           GravaLog(TimetoStr(Time) + ' - ' + DmExporterQuick.SQL1.CommandText);
                           CancelaTransacao;
                         end;
                      end;
                      
                     DmExporterQuick.SQL1.CommandText := 'UPDATE PRODUTOS SET ' +
                         ' PRECO_VENDA  = ' + StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.') + ', '+
                         ' PRECO_VENDA_' + IntToStr(Filial) + ' = ' + StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_NOVO').AsString, ',', '.');

                     if not DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').IsNull then
                      begin
                        DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                        ' ,DT_VENCIMENTO_PROMOCAO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime)) +
                        ' ,DT_VENCIMENTO_PROMOCAO_' + InttoStr(Filial) + ' = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('VENCIMENTO_PROMOCAO_NOVO').AsDateTime));
                      end
                     else
                      begin
                        DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                        ' ,DT_VENCIMENTO_PROMOCAO = NULL ' +
                        ' ,DT_VENCIMENTO_PROMOCAO_' + InttoStr(Filial) + ' = NULL ';
                      end;

                     if not DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').IsNull then
                      begin
                        DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                        ' ,PRECO_PROMOCAO = ' + StrTran(StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, '.', ''), ',', '.') +
                        ' ,PRECO_PROMOCAO_' + InttoStr(Filial) + ' = ' + StrTran(StrTran(DmExporterQuick.CdsPrecos.FieldByName('PRECO_PROMOCAO_NOVO').AsString, '.', ''), ',', '.')
                      end
                     else
                      begin
                         DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                         ' ,PRECO_PROMOCAO = 0, PRECO_PROMOCAO_' + InttoStr(Filial) + ' = 0 ';
                      end;


                     if not DmExporterQuick.CdsPrecos.FieldByName('DATA').IsNull then
                        DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
                        ' ,DT_REAJUSTE = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterQuick.CdsPrecos.FieldByName('DATA').AsDateTime));

                     DmExporterQuick.SQL1.CommandText := DmExporterQuick.SQL1.CommandText +
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
               DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO ACTIVE';
               AbreTransacao;
               DmExporterQuick.SQL1.ExecSQL(True);
               ConfirmaTransacao;
               DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 ACTIVE';
               AbreTransacao;
               DmExporterQuick.SQL1.ExecSQL(True);
               ConfirmaTransacao;
             Except
               CancelaTransacao;
               Result := False;
             End;

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
         DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO ACTIVE';
         AbreTransacao;
         DmExporterQuick.SQL1.ExecSQL(True);
         ConfirmaTransacao;
         DmExporterQuick.SQL1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 ACTIVE';
         AbreTransacao;
         DmExporterQuick.SQL1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
         Result := False;
       End;

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


procedure TFrmExporterClientQuick.RecebendoProdutosDeletados;
var Dados : Variant;
begin
  //busca na matriz os produtos deletados
   Try
     // Atualiza produtos
     DmExporterQuick.CdsDeletados.Close;
     DmExporterQuick.CdsDeletados.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS');
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


procedure TFrmExporterClientQuick.RecebendoProdutosFidelidadeDeletados;
var Dados : Variant;
begin
  //busca na matriz os Produtos Fidelidade Deletados
   Try
     DmExporterQuick.CdsDeletados.Close;
     DmExporterQuick.CdsDeletados.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FILIAIS_FIDELIDADE');
     if (Dados = null) then
        Exit;
     DmExporterQuick.CdsDeletados.Data := Dados;
     DmExporterQuick.CdsDeletados.Open; // virtual

     if DmExporterQuick.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Fidelidade Deletados - ' + FloatToStr(DmExporterQuick.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterQuick.CdsDeletados.First;
         while not DmExporterQuick.CdsDeletados.Eof do
          begin
            DmExporterQuick.Sql1.CommandText := 'DELETE FROM PRODUTOS_FIDELIDADE WHERE ID_PRODUTO = ' + DmExporterQuick.CdsDeletadosCAMPO1.AsString;
            Try
              DmExporterQuick.Sql1.ExecSQL(True);
            Except
            End;

            DmExporterQuick.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterQuick.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Farmacia Fidelidade Deletados');
         DmExporterQuick.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClientQuick.MontaSQL_Precos(Filial : String);
var
 ComandoSQL : String;
begin

  DmExporterQuick.SQL1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 52';
  AbreTransacao;
  DmExporterQuick.SQL1.ExecSQL(True);
  ConfirmaTransacao;

  ComandoSQL := '';
  ComandoSQL := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS ' +
                'WHERE PROCESSO = 52';
  DmExporterQuick.SqlPrecoVenda.CommandText := ComandoSql;
  AbreTransacao;
  DmExporterQuick.SqlPrecoVenda.ExecSQL(True);
  ConfirmaTransacao;

  ComandoSQL := '';
  ComandoSQL := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') +
                ' WHERE ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2)';
  DmExporterQuick.SqlPrecoVenda.CommandText := ComandoSql;
  AbreTransacao;
  DmExporterQuick.SqlPrecoVenda.ExecSQL(True);
  ConfirmaTransacao;

  ComandoSQL := '';
  ComandoSQL := 'SELECT FIRST 1000 PRODUTOS.ID_PRODUTO, ' +
                ' CAST(CAST(PRODUTOS.PRECO_VENDA AS NUMERIC(10,2)) AS DOUBLE PRECISION) AS PRECO_VENDA, ' +
                ' CAST(CAST(PRODUTOS.PRECO_PROMOCAO AS NUMERIC(10,2)) AS DOUBLE PRECISION) AS PRECO_PROMOCAO, ' +
                ' PRODUTOS.DT_VENCIMENTO_PROMOCAO, PRODUTOS.DT_REAJUSTE, PRODUTOS.USUARIO ' +
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
    fUsuario : TstringField;
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
 fPrecoVenda.FieldName    := 'PRECO_VENDA';
 fPrecoVenda.FieldKind    := fkData;
 fPrecoVenda.DisplayLabel := 'PRECO_VENDA';
 fPrecoVenda.Visible      := True;
 fPrecoVenda.Name         := DmExporterQuick.CdsPrecoVenda.Name + fPrecoVenda.FieldName;
 fPrecoVenda.Index        := 1;
 fPrecoVenda.DataSet      := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fPrecoPromocao           := TFloatField.Create(Self);
 fPrecoPromocao.FieldName := 'PRECO_PROMOCAO';
 fPrecoPromocao.FieldKind := fkData;
 fPrecoPromocao.DisplayLabel := 'PRECO_PROMOCAO';
 fPrecoPromocao.Visible   := True;
 fPrecoPromocao.Name      := DmExporterQuick.CdsPrecoVenda.Name + fPrecoPromocao.FieldName;
 fPrecoPromocao.Index     := 2;
 fPrecoPromocao.DataSet   := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fDtVencimentoPromocao    := TDateField.Create(Self);
 fDtVencimentoPromocao.FieldName := 'DT_VENCIMENTO_PROMOCAO';
 fDtVencimentoPromocao.FieldKind := fkData;
 fDtVencimentoPromocao.DisplayLabel := 'DT_VENCIMENTO_PROMOCAO';
 fDtVencimentoPromocao.Visible := True;
 fDtVencimentoPromocao.Name := DmExporterQuick.CdsPrecoVenda.Name + fDtVencimentoPromocao.FieldName;
 fDtVencimentoPromocao.Index := 3;
 fDtVencimentoPromocao.DataSet := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fDtReajuste              := TDateField.Create(Self);
 fDtReajuste.FieldName    := 'DT_REAJUSTE';
 fDtReajuste.FieldKind    := fkData;
 fDtReajuste.DisplayLabel := 'DT_REAJUSTE';
 fDtReajuste.Visible      := True;
 fDtReajuste.Name         := DmExporterQuick.CdsPrecoVenda.Name + fDtReajuste.FieldName;
 fDtReajuste.Index        := 4;
 fDtReajuste.DataSet      := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 fUsuario              := TStringField.Create(Self);
 fUsuario.FieldName    := 'USUARIO';
 fUsuario.FieldKind    := fkData;
 fUsuario.DisplayLabel := 'USUARIO';
 fUsuario.Visible      := True;
 fUsuario.Name         := DmExporterQuick.CdsPrecoVenda.Name + fUsuario.FieldName;
 fUsuario.Index        := 5;
 fUsuario.DataSet      := (DmExporterQuick.CdsPrecoVenda as TDataSet);

 DmExporterQuick.CdsPrecoVenda.FieldDefs.Update;
end;


procedure TFrmExporterClientQuick.VerificaConexao(TipoConexao : String);
var Dados : Variant;
begin
  try
      AbreTransacao;
      if not DmExporterQuick.CdsConexao.Active then
       begin
         DmExporterQuick.CdsConexao.Close;
         DmExporterQuick.CdsConexao.Open;
       end;
      Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(999, Filial, 'A');
      ConfirmaTransacao;
      if Dados = null then
       begin
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Filial (CNPJ) não encontrada na gestão.');
          Close;
          Application.Terminate;
          Halt;
          Exit;
       end
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
        if Copy(DmExporterQuick.CdsConexaoCGC.AsString, 1, 8) <> Copy(Dados,1,8) then
         begin
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - CNPJ Filial = ' + DmExporterQuick.CdsConexaoCGC.AsString + ' nao cadastrado na Matriz.');
           Close;
           Application.Terminate;
           Halt;
           Exit;
         end
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


{  Sintegra  }

procedure TFrmExporterClientQuick.EnviandoSintegraNotas;
var Dados : Variant;
begin
  //processamento e envio de Ceduplic.dat
    Try
      Sql := DmExporterQuick.SqlSintegraNF.CommandText;
      DmExporterQuick.SqlSintegraNF.CommandText := 'UPDATE SINTEGRA_NF_ENTRADA SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
      AbreTransacao;
      DmExporterQuick.SqlSintegraNF.ExecSQL;
      ConfirmaTransacao;
      DmExporterQuick.SqlSintegraNF.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsSintegraNF.Open;
      ConfirmaTransacao;
      if DmExporterQuick.CdsSintegraNF.RecordCount <> 0 then
       begin
          VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra Notas: '+ FloatToStr(DmExporterQuick.CdsSintegraNF.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(56, Filial, DmExporterQuick.CdsSintegraNF.Data);
          if (Dados <> Null) and (Dados) then
            begin
              DmExporterQuick.CdsSintegraNF.First;
              DmExporterQuick.SqlSintegraNF.CommandText := 'UPDATE SINTEGRA_NF_ENTRADA SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.SqlSintegraNF.ExecSQL;
              ConfirmaTransacao;
              DmExporterQuick.SqlSintegraNF.Close;
            end;
       end;
    Except
      on E:Exception do
        begin
          CancelaTransacao;
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra Notas - ' + E.Message);
          DmExporterQuick.CdsSintegraNF.Close;
          Exit;
        end;

    End;
    DmExporterQuick.CdsSintegraNF.Close;
end;

procedure TFrmExporterClientQuick.EnviandoSintegraNotasItens;
var Dados : Variant;
begin
  //processamento e envio de Ceduplic.dat
    Try
      Sql := DmExporterQuick.SqlSintegraItensNF.CommandText;
      DmExporterQuick.SqlSintegraItensNF.CommandText := 'UPDATE SINTEGRA_NF_ENTRADA_ITENS SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
      AbreTransacao;
      DmExporterQuick.SqlSintegraItensNF.ExecSQL;
      ConfirmaTransacao;
      DmExporterQuick.SqlSintegraItensNF.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsSintegraItensNF.Open;
      ConfirmaTransacao;
      if (DmExporterQuick.CdsSintegraItensNF.RecordCount <> 0) and (DmExporterQuick.CdsSintegraItensNF.RecordCount < 10000)  then
       begin
          VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra Notas Itens: '+ FloatToStr(DmExporterQuick.CdsSintegraItensNF.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(57, Filial, DmExporterQuick.CdsSintegraItensNF.Data);
          if (Dados <> Null) and (Dados) then
            begin
              DmExporterQuick.CdsSintegraItensNF.First;
              DmExporterQuick.SqlSintegraItensNF.CommandText := 'UPDATE SINTEGRA_NF_ENTRADA_ITENS SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.SqlSintegraItensNF.ExecSQL;
              ConfirmaTransacao;
              DmExporterQuick.SqlSintegraItensNF.Close;
            end;
       end;
    Except
      on E:Exception do
        begin
          CancelaTransacao;
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra Notas Itens - ' + E.Message);
          DmExporterQuick.CdsSintegraItensNF.Close;
          Exit;
        end;
    End;
    DmExporterQuick.CdsSintegraItensNF.Close;
end;

procedure TFrmExporterClientQuick.EnviandoSintegraPedidos;
var Dados : Variant;
begin
  //processamento e envio de Ceduplic.dat
    Try
      Sql := DmExporterQuick.SqlSintegraPedidos.CommandText;
      DmExporterQuick.SqlSintegraPedidos.CommandText := 'UPDATE SINTEGRA_PEDIDOS_ITENS SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
      AbreTransacao;
      DmExporterQuick.SqlSintegraPedidos.ExecSQL;
      ConfirmaTransacao;
      DmExporterQuick.SqlSintegraPedidos.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsSintegraPedidos.Open;
      ConfirmaTransacao;
      if DmExporterQuick.CdsSintegraPedidos.RecordCount <> 0 then
       begin
          VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra Pedidos: '+ FloatToStr(DmExporterQuick.CdsSintegraPedidos.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(58, Filial, DmExporterQuick.CdsSintegraPedidos.Data);
          if (Dados <> Null) and (Dados) then
            begin
              DmExporterQuick.CdsSintegraPedidos.First;
              DmExporterQuick.SqlSintegraPedidos.CommandText := 'UPDATE SINTEGRA_PEDIDOS_ITENS SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.SqlSintegraPedidos.ExecSQL;
              ConfirmaTransacao;
              DmExporterQuick.SqlSintegraPedidos.Close;
            end;
       end;
    Except
      on E:Exception do
        begin
          CancelaTransacao;
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra Pedidos - ' + E.Message);
          DmExporterQuick.CdsSintegraPedidos.Close;
          Exit;
        end;
    End;
    DmExporterQuick.CdsSintegraPedidos.Close;
end;


procedure TFrmExporterClientQuick.EnviandoSintegraR60;
var Dados : Variant;
begin
  //processamento e envio de Ceduplic.dat
    Try
      Sql := DmExporterQuick.SqlSintegraR60.CommandText;
      DmExporterQuick.SqlSintegraR60.CommandText := 'UPDATE SINTEGRA_R60 SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
      AbreTransacao;
      DmExporterQuick.SqlSintegraR60.ExecSQL;
      ConfirmaTransacao;
      DmExporterQuick.SqlSintegraR60.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsSintegraR60.Open;
      ConfirmaTransacao;
      if DmExporterQuick.CdsSintegraR60.RecordCount <> 0 then
       begin
          VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra R60: '+ FloatToStr(DmExporterQuick.CdsSintegraR60.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(59, Filial, DmExporterQuick.CdsSintegraR60.Data);
          if (Dados <> Null) and (Dados) then
            begin
              DmExporterQuick.CdsSintegraR60.First;
              DmExporterQuick.SqlSintegraR60.CommandText := 'UPDATE SINTEGRA_R60 SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.SqlSintegraR60.ExecSQL;
              ConfirmaTransacao;
              DmExporterQuick.SqlSintegraR60.Close;
            end;
       end;
    Except
      on E:Exception do
        begin
          CancelaTransacao;
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra R60 - ' + E.Message);
          DmExporterQuick.CdsSintegraR60.Close;
          Exit;
        end;
    End;
    DmExporterQuick.CdsSintegraR60.Close;
end;

procedure TFrmExporterClientQuick.EnviandoSintegraR60I;
var Dados : Variant;
begin
  //processamento e envio de Ceduplic.dat
    Try
      Sql := DmExporterQuick.SqlSintegraR60I.CommandText;
      DmExporterQuick.SqlSintegraR60I.CommandText := 'UPDATE SINTEGRA_R60I SET ENVIADO = '+QuotedStr('9')+' WHERE ENVIADO IS NULL OR ENVIADO <> '+QuotedStr('2');
      AbreTransacao;
      DmExporterQuick.SqlSintegraR60I.ExecSQL;
      ConfirmaTransacao;
      DmExporterQuick.SqlSintegraR60I.CommandText := Sql;
      AbreTransacao;
      DmExporterQuick.CdsSintegraR60I.Open;
      ConfirmaTransacao;
      if DmExporterQuick.CdsSintegraR60I.RecordCount <> 0 then
       begin
          VerificaConexao('');
          GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Sintegra R60I: '+ FloatToStr(DmExporterQuick.CdsSintegraR60I.RecordCount));
          Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(60, Filial, DmExporterQuick.CdsSintegraR60I.Data);
          if (Dados <> Null) and (Dados) then
            begin
              DmExporterQuick.CdsSintegraR60I.First;
              DmExporterQuick.SqlSintegraR60I.CommandText := 'UPDATE SINTEGRA_R60I SET ENVIADO = '+QuotedStr('2')+' WHERE ENVIADO = '+QuotedStr('9');
              AbreTransacao;
              DmExporterQuick.SqlSintegraR60I.ExecSQL;
              ConfirmaTransacao;
              DmExporterQuick.SqlSintegraR60I.Close;
            end;
       end;
    Except
      on E:Exception do
        begin
          CancelaTransacao;
          GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de  Sintegra R60I - ' + E.Message);
          DmExporterQuick.CdsSintegraR60I.Close;
          Exit;
        end;
    End;
    DmExporterQuick.CdsSintegraR60I.Close;
end;


Function TFrmExporterClientQuick.EnviandoPosicaoEstoque : Boolean;
var Dados : Variant;
begin
  Try
      Try
         Result := True;

         Sql := 'SELECT * FROM POSICAOESTOQUEDATA WHERE ENVIADO = ' + QuotedStr('9');

           DmExporterQuick.CdsPosicaoEstoque.Close;
           DmExporterQuick.TbPosicaoEstoque.CommandText := 'INSERT INTO TEMP_POSICAOESTOQUE2 SELECT FIRST 1000 * FROM TEMP_POSICAOESTOQUE';
           AbreTransacao;
           DmExporterQuick.TbPosicaoEstoque.ExecSQL(True);
           ConfirmaTransacao;

           DmExporterQuick.TbPosicaoEstoque.CommandText := 'UPDATE POSICAOESTOQUEDATA SET ENVIADO = ' + QuotedStr('9') + ' WHERE (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ' ) AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_POSICAOESTOQUE2)';
           AbreTransacao;
           DmExporterQuick.TbPosicaoEstoque.ExecSQL(True);
           ConfirmaTransacao;

           DmExporterQuick.TbPosicaoEstoque.CommandText := Sql;
           DmExporterQuick.CdsPosicaoEstoque.FetchParams;
           AbreTransacao;
           DmExporterQuick.CdsPosicaoEstoque.Open;
           ConfirmaTransacao;
           if DmExporterQuick.CdsPosicaoEstoque.RecordCount <> 0 then
            begin
             GravaLog(TimetoStr(Time) + ' - Enviando Posicao de Estoque: ' + FloatToStr(DmExporterQuick.CdsPosicaoEstoque.RecordCount));
             Dados := (DmExporterQuick.HTTPRIO1 as IDmProcessa).Processa(63, Filial, DmExporterQuick.CdsPosicaoEstoque.Data);
             if (Dados <> null) and (Dados) then
               begin
                 DmExporterQuick.CdsPosicaoEstoque.Close;
                 DmExporterQuick.TbPosicaoEstoque.CommandText := 'DELETE FROM TEMP_POSICAOESTOQUE WHERE ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_POSICAOESTOQUE2)';
                 AbreTransacao;
                 DmExporterQuick.TbPosicaoEstoque.ExecSQL(True);
                 ConfirmaTransacao;

                 DmExporterQuick.TbPosicaoEstoque.CommandText := 'UPDATE POSICAOESTOQUEDATA SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
                 AbreTransacao;
                 DmExporterQuick.TbPosicaoEstoque.ExecSQL(True);
                 ConfirmaTransacao;

                 DmExporterQuick.TbPosicaoEstoque.CommandText := 'DELETE FROM TEMP_POSICAOESTOQUE2';
                 AbreTransacao;
                 DmExporterQuick.TbPosicaoEstoque.ExecSQL(True);
                 ConfirmaTransacao;
               end;
            end
           else
            Result := False;
            VerificaConexao('');

      Except
         on E:Exception do
          begin
            Result := False;
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - Falha de conexao no processo de Posicao de Estoque - '+E.Message);
            DmExporterQuick.CdsPosicaoEstoque.Close;

            DmExporterQuick.TbPosicaoEstoque.Close;
            DmExporterQuick.TbPosicaoEstoque.CommandText := 'DELETE FROM TEMP_POSICAOESTOQUE2';
            AbreTransacao;
            DmExporterQuick.TbPosicaoEstoque.ExecSQL(True);
            ConfirmaTransacao;
            Result := False;
            Exit;
          end;
      End;
  Finally
    DmExporterQuick.CdsPosicaoEstoque.Close;
  End;
end;


procedure TFrmExporterClientQuick.RecebendoProdutosQuantidadeDeletados;
var Dados : Variant;
begin
  //busca na matriz os Produtos Quantidade Deletados
   Try
     // Atualiza grupos
     DmExporterQuick.CdsDeletados.Close;
     DmExporterQuick.CdsDeletados.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS_PRECO_QUANTIDADE');
     if (Dados = null) then
        Exit;
     DmExporterQuick.CdsDeletados.Data := Dados;
     DmExporterQuick.CdsDeletados.Open; // virtual

     if DmExporterQuick.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Quantidade Deletados - ' + FloatToStr(DmExporterQuick.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterQuick.CdsDeletados.First;
         while not DmExporterQuick.CdsDeletados.Eof do
          begin
            DmExporterQuick.Sql1.CommandText := 'DELETE FROM PRODUTOS_PRECO_QUANTIDADE WHERE ID_PRODUTO = ' + DmExporterQuick.CdsDeletadosCAMPO1.AsString +
                                ' AND QUANTIDADEINICIAL = ' + DmExporterQuick.CdsDeletadosCAMPO2.AsString;
            Try
              DmExporterQuick.Sql1.ExecSQL(True);
            Except
            End;

            DmExporterQuick.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterQuick.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Quantidade Deletados');
         DmExporterQuick.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClientQuick.RecebendoProdutosQuantidade;
var
  Dados : Variant;
begin
   Try
     // Atualização dos Produtos Quantidade
     DmExporterQuick.CdsProdutosQuantidade.Close;
     DmExporterQuick.CdsProdutosQuantidade.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(154, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterQuick.CdsProdutosQuantidade.Data := Dados;
     DmExporterQuick.CdsProdutosQuantidade.Open; // virtual
     DmExporterQuick.CdsProdutosQuantidade.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Quantidade: '+ FloatToStr(DmExporterQuick.CdsProdutosQuantidade.RecordCount));
     while not DmExporterQuick.CdsProdutosQuantidade.Eof do
      begin
          DmExporterQuick.SqlAtualizaProdutosQuantidade.Params[0].AsFloat := DmExporterQuick.CdsProdutosQuantidadeID_PRODUTO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosQuantidade.Params[1].AsFloat := DmExporterQuick.CdsProdutosQuantidadeQUANTIDADEINICIAL.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosQuantidade.Params[2].AsFloat := DmExporterQuick.CdsProdutosQuantidadePRECO_VENDA.AsFloat;
          AbreTransacao;
          Try
            DmExporterQuick.SqlAtualizaProdutosQuantidade.ExecSQL(False);
            ConfirmaTransacao;
          Except
             on E:Exception do
              begin
                CancelaTransacao;
                GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos preço quantidade - '+E.Message);
              end;
          End;

          DmExporterQuick.CdsProdutosQuantidade.Next;
      end;
     DmExporterQuick.CdsProdutosQuantidade.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Quantidade');
         DmExporterQuick.CdsProdutosQuantidade.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClientQuick.RecebendoProdutosFP;
var
  Dados : Variant;
begin
   Try
     // Atualização dos Produtos Farmacia Popular
     DmExporterQuick.CdsProdutosFP.Close;
     DmExporterQuick.CdsProdutosFP.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(155, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterQuick.CdsProdutosFP.Data := Dados;
     DmExporterQuick.CdsProdutosFP.Open; // virtual
     AbreTransacao;
     DmExporterQuick.CdsProdutosFP.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Farmacia Popular : '+ FloatToStr(DmExporterQuick.CdsProdutosFP.RecordCount));
     while not DmExporterQuick.CdsProdutosFP.Eof do
      begin
          DmExporterQuick.SqlAtualizaProdutosFP.Params[0].AsFloat := DmExporterQuick.CdsProdutosFPID_PRODUTO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosFP.Params[1].AsString := DmExporterQuick.CdsProdutosFPCD_PRODUTO.AsString;
          DmExporterQuick.SqlAtualizaProdutosFP.Params[2].AsFloat := DmExporterQuick.CdsProdutosFPCD_LABORATORIO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosFP.Params[3].AsString := DmExporterQuick.CdsProdutosFPDESCRICAO.AsString;
          DmExporterQuick.SqlAtualizaProdutosFP.Params[4].AsFloat := DmExporterQuick.CdsProdutosFPPRECO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosFP.Params[5].AsString := DmExporterQuick.CdsProdutosFPUSAPRECOLOJA.AsString;
          Try
            DmExporterQuick.SqlAtualizaProdutosFP.ExecSQL(False);
          Except
             on E:Exception do
              begin
                //CancelaTransacao;
                GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos farmacia popular - '+E.Message);
              end;
          End;

          DmExporterQuick.CdsProdutosFP.Next;
      end;
     ConfirmaTransacao;
     DmExporterQuick.CdsProdutosFP.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Farmacia Popular');
         DmExporterQuick.CdsProdutosFP.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClientQuick.RecebendoProdutosFidelidade;
var
  Dados : Variant;
begin
   Try
     // Atualização dos Produtos Fidelidade
     DmExporterQuick.CdsProdutosFidelidade.Close;
     DmExporterQuick.CdsProdutosFidelidade.CreateDataSet;
     Dados := (DmExporterQuick.HTTPRIO1 AS IDmProcessa).Processa(158, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterQuick.CdsProdutosFidelidade.Data := Dados;
     DmExporterQuick.CdsProdutosFidelidade.Open; // virtual
     AbreTransacao;
     DmExporterQuick.CdsProdutosFidelidade.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Fidelidade : '+ FloatToStr(DmExporterQuick.CdsProdutosFidelidade.RecordCount));
     while not DmExporterQuick.CdsProdutosFidelidade.Eof do
      begin
          DmExporterQuick.SqlAtualizaProdutosFidelidade.Params[0].AsFloat := DmExporterQuick.CdsProdutosFidelidadeID_PRODUTO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosFidelidade.Params[1].AsString := DmExporterQuick.CdsProdutosFidelidadeCD_PRODUTO.AsString;
          DmExporterQuick.SqlAtualizaProdutosFidelidade.Params[2].AsFloat := DmExporterQuick.CdsProdutosFidelidadeCD_LABORATORIO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosFidelidade.Params[3].AsString := DmExporterQuick.CdsProdutosFidelidadeDESCRICAO.AsString;
          DmExporterQuick.SqlAtualizaProdutosFidelidade.Params[4].AsFloat := DmExporterQuick.CdsProdutosFidelidadePRECO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosFidelidade.Params[5].AsFloat := DmExporterQuick.CdsProdutosFidelidadeCD_GRUPO.AsFloat;
          DmExporterQuick.SqlAtualizaProdutosFidelidade.Params[6].AsDateTime := DmExporterQuick.CdsProdutosFidelidadeDT_ALTERACAO.AsDateTime;
          Try
            DmExporterQuick.SqlAtualizaProdutosFidelidade.ExecSQL(False);
          Except
             on E:Exception do
              begin
                //CancelaTransacao;
                GravaLog(TimetoStr(Time) + ' - Falha no processo de produtos fidelidade - '+E.Message);
              end;
          End;

          DmExporterQuick.CdsProdutosFidelidade.Next;
      end;
     ConfirmaTransacao;
     DmExporterQuick.CdsProdutosFidelidade.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Fidelidade');
         DmExporterQuick.CdsProdutosFidelidade.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClientQuick.FecharTodosDataSets;
var z, i : Integer;
begin
  for i := 0 to Application.ComponentCount - 1 do
     begin
       if Application.Components[i].ClassParent = TDataModule then
           if Assigned((Application.Components[i] as TDataModule)) then
              for z := 0 to (Application.Components[i] as TDataModule).ComponentCount - 1 do
                  if (Application.Components[i] as TDataModule).Components[z].ClassName = 'TClientDataSet' then
                       begin
                          FecharDataSet(((Application.Components[i] as TDataModule).Components[z] as TClientDataSet));
                          Application.ProcessMessages;
                       end;
     end;
   DmExporterQuick.SQLConnection1.Close;
end;

Procedure FecharDataSet(Cds : TClientDataSet);
begin
  Cds.Close;
  Cds.IndexFieldNames := '';
  Cds.IndexName := '';
  Cds.Filter := '';
  Cds.Filtered := False;
end;


end.
