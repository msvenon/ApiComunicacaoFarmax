unit UExporterClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Provider, InvokeRegistry, Rio, SOAPHTTPClient,
  MidasLib, StdCtrls, FMTBcd, RXShell, DBXpress, SqlExpr, Grids, DBGrids,
  SOAPConn, IniFiles;

type
  TFrmExporterClient = class(TForm)
    Timer2: TTimer;
    RxTrayIcon1: TRxTrayIcon;
    HTTPRIO1: THTTPRIO;
    HTTPRIO2: THTTPRIO;
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure RegistraHoraInicio;
    procedure Delay(Tempo: Word);
    procedure GravaLog(cMensagem: string);
    Function  StrTran( cString, cProcura, cTroca : string ): string;
    procedure AbreTransacao;
    procedure ConfirmaTransacao;
    procedure CancelaTransacao;
    procedure Processar;
    procedure ProcessarConcistencia;

    procedure EnviandoComprasDeletadas;
    procedure EnviandoContasPagarDeletadas;
    procedure EnviandoClientesDeletados;
    procedure EnviandoSintegraNFEntrada;
    procedure RecebendoCompras;
    procedure RecebendoItensCompras;
    function  RecebendoContasReceber : Boolean;
    function  RecebendoClientes : Boolean;
    procedure RecebendoLimiteSaldoClientes;
    function  EnviandoBalancosFilial : Boolean;
    procedure RecebendoGrupos;
    procedure RecebendoLaboratorios;
    procedure RecebendoVendedores;
    procedure RecebendoVendedoresClasses;
    procedure RecebendoConveniosClasses;
    procedure RecebendoMetasFiliais;
    procedure RecebendoMetasVendedores;
    procedure RecebendoClasses;
    procedure RecebendoClassesDeletadas;
    procedure RecebendoFamilias;
    procedure RecebendoFamiliasDeletadas;
    procedure RecebendoGruposBalanco;
    procedure RecebendoGruposBalancoDeletados;
    procedure RecebendoGruposCompra;
    procedure RecebendoGruposCompraDeletados;
    procedure RecebendoGruposCurvas;
    procedure RecebendoGruposCurvasDeletados;
    procedure RecebendoDistribuidores;
    procedure RecebendoProdutosDeletados;
    procedure RecebendoGruposDeletados;
    procedure RecebendoLaboratoriosDeletados;
    procedure RecebendoVendedoresDeletados;
    procedure RecebendoPlanosContasDeletados;
    procedure RecebendoClientesDeletados;
    procedure RecebendoConveniosDeletados;
    procedure RecebendoTransportadorasDeletados;
    procedure RecebendoCartoesDeletados;
    procedure RecebendoDistribuidoresDeletados;
    procedure RecebendoFiliaisDeletados;
    procedure RecebendoFormasPagamentoDeletados;
    procedure RecebendoBalancosDeletados;
    procedure RecebendoComprasDeletados;
    procedure RecebendoItensComprasDeletados;
    procedure RecebendoMetasFiliaisDeletados;
    procedure RecebendoMetasVendedoresDeletados;
    procedure RecebendoPlanosContas;
    procedure RecebendoConvenios;
    procedure RecebendoTransportadoras;
    procedure RecebendoCartoes;
    procedure RecebendoFiliais;
    procedure RecebendoBalancos;
    procedure RecebendoUsuarios;
    procedure RecebendoUsuariosDeletados;
    procedure RecebendoPermissoesModulos;
    procedure RecebendoPermissoes;
    procedure EnviandoProdutosTotais;
    procedure RecebendoLancamentosaPrazo;
    procedure RecebendoEncartes;
    procedure RecebendoItensEncartes;
    procedure RecebendoRedes;
    procedure RecebendoConcorrentes;
    procedure RecebendoPrecosConcorrentes;
    procedure RecebendoPrecosConcorrentesDeletados;
    procedure RecebendoProjetosPharmalink;
    procedure RecebendoPerfilCliente;
    function  RecebendoContasReceberDeletados : Boolean;
    function  EnviandoContasReceberDeletados : Boolean;

    procedure Controlador;
    procedure Testando;
    procedure VerificaConexao(TipoConexao : String);

    procedure ConfereProdutos;

    procedure ConsistenciaClasses;
    procedure ConsistenciaGrupos;
    procedure ConsistenciaLaboratorios;
    procedure ConsistenciaFamilias;
    procedure ConsistenciaGruposCompras;
    procedure ConsistenciaGruposBalanco;
    procedure ConsistenciaDistribuidores;
    procedure ConsistenciaCartoes;
    procedure ConsistenciaPlanoContas;
    procedure ConsistenciaVendedores;
    procedure ConsistenciaConvenios;
    procedure ConsistenciaClientes;
    procedure ConsistenciaContasReceber;
  end;

  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  function Alltrim(Text : string) : string;
  function Crypt(Action, Src: String): String;


var
  FrmExporterClient: TFrmExporterClient;
  Caminho, Servidor, Intervalo, AtualizaPrecoVenda: String;
  Importer : TextFile;
  Log : TextFile;
  TD : TTransactionDesc;
  Filial : Integer;
  Sql : String;
  Id_Produto, Cd_Produto, CodigoBarras, Descricao, Cd_Laboratorio,
  Cd_Grupo, TipoProduto, Identificador, Qt_Embalagem, Comissao,
  CustoUnitario, Preco_Venda, Preco_Promocao, Icms, Margem, Margem_Promocao,
  CodigoBarras2, Cd_Classe, EntraPE, TxDesconto, Unidade, Balanca,
  Cd_Principio, Cd_Lista, UsoContinuo, Dt_Cadastro, Curva , Status, PisCofins, NCM: String;
  NLancamentos, NContasReceber, NCaixa : Integer;
  NLancamentosLoja, NContasReceberLoja, NCaixaLoja : Integer;
  Senha : String;
  CaminhoBanco : TIniFile;


implementation

{$R *.dfm}

uses InterfaceProcessa, uDMExporterClient, UDmExporterClient2;

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

function Alltrim(Text : string) : string;
begin
while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
Result := Text;
end;

//esperar numero de segundos....
procedure TFrmExporterClient.Delay(Tempo: Word);
var
x1: Double;
begin
    x1:= now;
    repeat until ((now-x1)*86400) > Tempo;
end;

procedure TFrmExporterClient.GravaLog(cMensagem: string);
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
     Writeln(Log, '>>>>>>>>>>>>>>>Iniciando o Dia ' + FormatDateTime('ddmmyyyy',Date) + ' as ' + FormatDateTime('hh:mm:ss',Time) + ' horas');
    end;

  Writeln(Log, cMensagem);
  CloseFile(Log);
end;

procedure TFrmExporterClient.FormCreate(Sender: TObject);
begin
  TD.TransactionID := 1;
  TD.IsolationLevel := xilREADCOMMITTED;
  if not FileExists(ExtractFilePath(Application.ExeName)+'ExporterClient.TXT') then
   begin
     ShowMessage('O arquivo de configuração não existe. Configure-o antes de prosseguir');
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
  ReadLn(Importer, AtualizaPrecoVenda);
  CloseFile(Importer);

  CaminhoBanco := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CaminhoBD.Ini');
  Senha := Crypt('D', CaminhoBanco.ReadString('FARMAX', 'FARMAX', ''));
  CaminhoBanco.Free;
end;

//aciona o processo de envio dos dados
procedure TFrmExporterClient.Timer2Timer(Sender: TObject);
begin
  FrmExporterClient.Hide;
  Timer2.Enabled := False;
  if ParamStr(1) = 'Consistencia' then
     ProcessarConcistencia
  else
     Processar;
  RxTrayIcon1.Animated := False;
  RxTrayIcon1.Active := False;
  Application.ProcessMessages;
  Application.Terminate;
  Halt;
end;

Function TFrmExporterClient.StrTran( cString, cProcura, cTroca : string ): string;
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


procedure TFrmExporterClient.AbreTransacao;
begin
  if DmExporterClient.SQLConnection1.InTransaction then
     DmExporterClient.SQLConnection1.Rollback(TD);
  DmExporterClient.SQLConnection1.StartTransaction(TD);
end;

procedure TFrmExporterClient.CancelaTransacao;
begin
  if DmExporterClient.SQLConnection1.InTransaction then
     DmExporterClient.SQLConnection1.Rollback(TD);
end;

procedure TFrmExporterClient.ConfirmaTransacao;
begin
  if DmExporterClient.SQLConnection1.InTransaction then
     DmExporterClient.SQLConnection1.Commit(TD);
end;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////// inicio do processamento  1 //////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFrmExporterClient.Processar;
var i : integer;
 Dados : Variant;
begin
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

  Try
      DmExporterClient.SQLConnection1.Close;
      DmExporterClient.SQLConnection1.Params.Values['Database'] := Caminho + '\Farmax.fdb';
      if Senha <> '' then
         DmExporterClient.SQLConnection1.Params.Values['Password'] := Senha
      else
         DmExporterClient.SQLConnection1.Params.Values['Password'] := 'masterkey';
      DmExporterClient.SQLConnection1.Open;
  Except
      GravaLog('Sem conexão com o banco no caminho: ' + Caminho + '\Farmax.fdb');
      RxTrayIcon1.Animated := False;
      Close;
      Application.Terminate;
      Halt;
      Exit;
  End;

  DmExporterClient.HTTPRIO1.URL := 'http://' + Servidor + '/ExporterServer/ExporterServer.exe/soap/IDm';

  RxTrayIcon1.Animated := True;

  GravaLog(' ');
  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ======== Iniciando novo processo de Importacao/Exportacao pelo Client ========');

  //tenta disparar o servidor de aplicacao na matriz....caso nao consiga, grava no log e sai.
  Filial := 0;
  for i := 1 to 10 do
    begin
      try
        AbreTransacao;
        DmExporterClient.CdsParametros.Open;
        ConfirmaTransacao;
        if DmExporterClient.CdsParametrosTIPO_LOJA.AsString = 'U' then
         begin
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja cadastrada como loja única.');
           Exit;
         end;
        Filial := DmExporterClient.CdsParametros.Fields[0].AsInteger;
      except
        on E:Exception do
         begin
          GravaLog(TimetoStr(Time) + ' - ' + E.Message);
          CancelaTransacao;
          Delay(5);
         end;
      end;
      if Filial <> 0 then
        break;
    end;

    if Filial = 0 then
      begin
        GravaLog('O Servidor Matriz não foi localizado... - '+ FormatDateTime('hh:mm:ss',Time));
        RxTrayIcon1.Animated := False;
        Close;
        Application.Terminate;
        Halt;
        Exit;
      end;

    VerificaConexao('Inicial');


    DmExporterClient.SQLConnection1.Open;
    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Compras... ');
    while EnviandoBalancosFilial do Sleep(1);
    DmExporterClient.SQLConnection1.Close;
    RegistraHoraInicio;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Compras Deletadas... ');
    DmExporterClient.SQLConnection1.Open;
    EnviandoComprasDeletadas;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Contas Pagar Deletadas... ');
    DmExporterClient.SQLConnection1.Open;
    EnviandoContasPagarDeletadas;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Clientes Deletados... ');
    DmExporterClient.SQLConnection1.Open;
    EnviandoClientesDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando SintegraNFentradas... ');
    DmExporterClient.SQLConnection1.Open;
    EnviandoSintegraNFentrada;
    DmExporterClient.SQLConnection1.Close;

    {DmExporterClient.SQLConnection1.Open;
    EnviandoProdutosTotais;
    DmExporterClient.SQLConnection1.Close;
    RegistraHoraInicio;}

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Envio Contas Receber Deletados... ');
    DmExporterClient.SQLConnection1.Open;
    while EnviandoContasReceberDeletados do Sleep(1);
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Lancamentos a Prazo... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoLancamentosaPrazo;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de Compras... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoCompras;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ItensCompras... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoItensCompras;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ContasReceber... ');
    RegistraHoraInicio;
    DmExporterClient.SQLConnection1.Open;
    while RecebendoContasReceber do Sleep(1);
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando ContasReceber Deletadas... ');
    DmExporterClient.SQLConnection1.Open;
    while RecebendoContasReceberDeletados do Sleep(1);
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de Clientes... ');
    RegistraHoraInicio;
    DmExporterClient.SQLConnection1.Open;
    while RecebendoClientes do Sleep(1);
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Limite de Clientes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoLimiteSaldoClientes;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Classes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoClasses;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Familias... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoFamilias;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Ditribuidores... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoDistribuidores;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Grupos de Balanco... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoGruposBalanco; // fazer
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Grupos de Compra... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoGruposCompra; // fazer
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposCurvas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoGruposCurvas; // fazer
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Grupos... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoGrupos;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Laboratorios... ');
    RegistraHoraInicio;
    DmExporterClient.SQLConnection1.Open;
    RecebendoLaboratorios;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Vendedores... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoVendedores;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo VendedoresClasses... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoVendedoresClasses; // fazer
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ConveniosClasses... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoConveniosClasses; // fazer
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PlanoContas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoPlanosContas;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Convenios... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoConvenios;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Transportadores... ');
    RegistraHoraInicio;
    DmExporterClient.SQLConnection1.Open;
    RecebendoTransportadoras;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Cartoes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoCartoes;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Filiais... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoFiliais;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Balancos... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoBalancos;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasFiliais... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoMetasFiliais; // fazer
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasVendedores... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoMetasVendedores; // fazer
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ProdutosDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoProdutosDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ClassesDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoClassesDeletadas;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FamiliasDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoFamiliasDeletadas;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposBalancoDeletados... ');
    RegistraHoraInicio;
    DmExporterClient.SQLConnection1.Open;
    RecebendoGruposBalancoDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposCompraDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoGruposCompraDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoGruposDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposCurvasDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoGruposCurvasDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo LaboratoriosDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoLaboratoriosDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo VendedoresDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoVendedoresDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PlanoContasDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoPlanosContasDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ClientesDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoClientesDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ConveniosDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoConveniosDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo TransportadoresDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoTransportadorasDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo CartoesDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoCartoesDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo DistribuidoresDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoDistribuidoresDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FiliaisDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoFiliaisDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FormasPagamentoDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoFormasPagamentoDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo BalancosDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoBalancosDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ComprasDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoComprasDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ItesnCompraDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoItensComprasDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasFiliaisDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoMetasFiliaisDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasVendedoresDeletadas... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoMetasVendedoresDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Usuarios.. ');
    RegistraHoraInicio;
    DmExporterClient.SQLConnection1.Open;
    RecebendoUsuarios;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo UsuariosDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoUsuariosDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Permissoes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoPermissoes;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PermissoesModulos... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoPermissoesModulos;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Encartes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoEncartes;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ItensEncartes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoItensEncartes;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Redes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoRedes;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Concorrentes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoConcorrentes;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ProjetosPharmalink... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoProjetosPharmalink;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PerfilClientes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoPerfilCliente;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PrecosConcorrentesDeletados... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoPrecosConcorrentesDeletados;
    DmExporterClient.SQLConnection1.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PrecosConcorrentes... ');
    DmExporterClient.SQLConnection1.Open;
    RecebendoPrecosConcorrentes;
    DmExporterClient.SQLConnection1.Close;

    if ((FormatDateTime('hh:mm:ss', Time) >= '10:00:00') and (FormatDateTime('hh:mm:ss', Time) <= '11:30:00')) or
       ((FormatDateTime('hh:mm:ss', Time) >= '15:00:00') and (FormatDateTime('hh:mm:ss', Time) <= '16:30:00')) or
       ((FormatDateTime('hh:mm:ss', Time) >= '19:00:00') and (FormatDateTime('hh:mm:ss', Time) <= '20:30:00')) then
     begin
        DmExporterClient.SQLConnection1.Open;
        ConfereProdutos;
        DmExporterClient.SQLConnection1.Close;
     end;

    RxTrayIcon1.Animated := False;
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - =======================================================');
end;


Procedure TFrmExporterClient.RegistraHoraInicio;
Var Txt : TextFile;
begin
  ///////////////// tratamento do tempo de atividade dos clients
  if not FileExists(ExtractFilePath(Application.ExeName) + 'ExporterTime.TXT') then
   begin
    AssignFile(Txt, ExtractFilePath(Application.ExeName) + 'ExporterTime.TXT');
    Rewrite(Txt);
    Writeln(Txt, TimetoStr(Time));
    CloseFile(Txt);
   end;

  AssignFile(Txt, ExtractFilePath(Application.ExeName) + 'ExporterTime.TXT');
  ReWrite(Txt);
  Writeln(Txt, TimetoStr(Time));
  CloseFile(Txt);
  ////////////////////////////////////////////////////////////////////////////////
end;


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////   recebendo os dados da Matriz   //////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFrmExporterClient.RecebendoCompras;
var
 i : integer;
 Dados : Variant;
begin
   Try
     DmExporterClient.CdsCompras.Close;
     DmExporterClient.CdsCompras.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(105, Filial, 'A');
     if Dados = null then
        Exit;
     DmExporterClient.CdsCompras.Data := Dados;
     DmExporterClient.CdsCompras.Open; // virtual
     DmExporterClient.CdsCompras.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Compras: '+ FloatToStr(DmExporterClient.CdsCompras.RecordCount));
     while not DmExporterClient.CdsCompras.Eof do
      begin
        DmExporterClient.SqlAtualizaCompras.Params[0].AsFloat := DmExporterClient.CdsComprasCD_COMPRAS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[1].AsFloat := DmExporterClient.CdsComprasCD_FILIAL.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[2].AsFloat := DmExporterClient.CdsComprasCD_DISTRIBUIDOR.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[3].AsFloat := DmExporterClient.CdsComprasCD_PLANO_CONTAS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[4].AsFloat := DmExporterClient.CdsComprasCD_OBSERVACAO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[5].AsFloat := DmExporterClient.CdsComprasCD_TRANSPORTADORA.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[6].AsDateTime := DmExporterClient.CdsComprasDT_PEDIDO.AsDateTime;
        DmExporterClient.SqlAtualizaCompras.Params[7].AsString := DmExporterClient.CdsComprasNOTA_FISCAL.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[8].AsString := DmExporterClient.CdsComprasSERIE_NOTA_FISCAL.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[9].AsDateTime := DmExporterClient.CdsComprasDT_EMISSAO.AsDateTime;
        DmExporterClient.SqlAtualizaCompras.Params[10].AsString := DmExporterClient.CdsComprasBOLETO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[11].AsDateTime := DmExporterClient.CdsComprasDT_BOLETO.AsDateTime;
        DmExporterClient.SqlAtualizaCompras.Params[12].AsFloat := DmExporterClient.CdsComprasCD_CFOP.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[13].AsDateTime := DmExporterClient.CdsComprasDT_ENTRADA.AsDateTime;
        DmExporterClient.SqlAtualizaCompras.Params[14].AsFloat := DmExporterClient.CdsComprasVL_IPI.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[15].AsFloat := DmExporterClient.CdsComprasVL_ICM.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[16].AsFloat := DmExporterClient.CdsComprasTOTAL_NOTA.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[17].AsFloat := DmExporterClient.CdsComprasICM_BASE_CALCULO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[18].AsFloat := DmExporterClient.CdsComprasICM_ISENTO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[19].AsFloat := DmExporterClient.CdsComprasICM_OUTROS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[20].AsFloat := DmExporterClient.CdsComprasICM_BASESUBST.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[21].AsFloat := DmExporterClient.CdsComprasICM_VALORSUBST.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[22].AsFloat := DmExporterClient.CdsComprasVL_TOTALPRODUTOS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[23].AsFloat := DmExporterClient.CdsComprasVL_SEGURO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[24].AsFloat := DmExporterClient.CdsComprasOUTRAS_DESPESAS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[25].AsFloat := DmExporterClient.CdsComprasVL_FRETE.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[26].AsFloat := DmExporterClient.CdsComprasIPI_BASE_CALCULO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[27].AsFloat := DmExporterClient.CdsComprasIPI_ISENTO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[28].AsFloat := DmExporterClient.CdsComprasIPI_OUTROS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[29].AsFloat := DmExporterClient.CdsComprasD_ICMV.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[30].AsFloat := DmExporterClient.CdsComprasD_IPIV.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[31].AsFloat := DmExporterClient.CdsComprasD_TOTNT.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[32].AsFloat := DmExporterClient.CdsComprasUNIDADES.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[33].AsFloat := DmExporterClient.CdsComprasNUMERO_ITENS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[34].AsString := DmExporterClient.CdsComprasFATURAMENTO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[35].AsString := DmExporterClient.CdsComprasMOTIVO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[36].AsString := DmExporterClient.CdsComprasENVIADO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[37].AsString := DmExporterClient.CdsComprasSTATUS.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[38].AsFloat := DmExporterClient.CdsComprasVL_DESCONTO_NOTA.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[39].AsFloat := DmExporterClient.CdsComprasCD_USUARIO_CRIACAO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[40].AsString := DmExporterClient.CdsComprasUSUARIO_DIGITACAO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[41].AsFloat := DmExporterClient.CdsComprasCD_USUARIO_DIGITACAO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[42].AsString := DmExporterClient.CdsComprasUSUARIO_CRIACAO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[43].AsFloat := DmExporterClient.CdsComprasCD_USUARIO_CONCLUSAO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[44].AsString := DmExporterClient.CdsComprasUSUARIO_CONCLUSAO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[45].AsFloat := DmExporterClient.CdsComprasCD_USUARIO_ENVIO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[46].AsString := DmExporterClient.CdsComprasUSUARIO_ENVIO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[47].AsString := DmExporterClient.CdsComprasVINCULADO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[48].AsFloat := DmExporterClient.CdsComprasCD_COMPRAS_VINCULADO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[49].AsString := DmExporterClient.CdsComprasTEMVINCULADO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[50].AsString := DmExporterClient.CdsComprasSTATUSCONFERENCIA.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[51].AsFloat := DmExporterClient.CdsComprasCD_USUARIO_CONFERENCIA.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[52].AsString := DmExporterClient.CdsComprasUSUARIO_CONFERENCIA.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[53].AsString := DmExporterClient.CdsComprasCONFIGGERACAO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[54].AsString := DmExporterClient.CdsComprasLOCALGERACAO.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[55].AsString := DmExporterClient.CdsComprasMODELONF.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[56].AsFloat := DmExporterClient.CdsComprasVL_ISENTOICMS.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[57].AsFloat := DmExporterClient.CdsComprasICMS_RETIDO.AsFloat;
        DmExporterClient.SqlAtualizaCompras.Params[58].AsString := DmExporterClient.CdsComprasPHARMALINK.AsString;
        DmExporterClient.SqlAtualizaCompras.Params[59].AsString := DmExporterClient.CdsComprasBONIFICACAO.AsString;
        DmExporterClient.SqlAtualizaCompras.ExecSql(False);

        DmExporterClient.CdsCompras.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsCompras.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Compras');
         DmExporterClient.CdsCompras.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoItensCompras;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient.CdsItensCompra.Close;
     DmExporterClient.CdsItensCompra.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(106, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsItensCompra.Data := Dados;
     DmExporterClient.CdsItensCompra.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsItensCompra.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ItensCompras: '+ FloatToStr(DmExporterClient.CdsItensCompra.RecordCount));
     while not DmExporterClient.CdsItensCompra.Eof do
      begin
        DmExporterClient.SqlAtualizaItensCompra.Params[0].AsFloat := DmExporterClient.CdsItensCompraCD_COMPRAS.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[1].AsFloat := DmExporterClient.CdsItensCompraID_PRODUTO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[2].AsFloat := DmExporterClient.CdsItensCompraCD_PRODUTO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[3].AsFloat := DmExporterClient.CdsItensCompraCD_FILIAL.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[4].AsFloat := DmExporterClient.CdsItensCompraCD_FILIAL_DESTINO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[5].AsString := DmExporterClient.CdsItensCompraCODIGO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[6].AsString := DmExporterClient.CdsItensCompraDESCRICAO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[7].AsFloat := DmExporterClient.CdsItensCompraSALDO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[8].AsFloat := DmExporterClient.CdsItensCompraESTOQUE_MINIMO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[9].AsFloat := DmExporterClient.CdsItensCompraESTOQUE_MAXIMO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[10].AsFloat := DmExporterClient.CdsItensCompraMEDIAF.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[11].AsString := DmExporterClient.CdsItensCompraCURVA.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[12].AsString := DmExporterClient.CdsItensCompraLABORATORIO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[13].AsString := DmExporterClient.CdsItensCompraGRUPO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[14].AsString := DmExporterClient.CdsItensCompraCLASSE.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[15].AsFloat := DmExporterClient.CdsItensCompraCD_SITUACAO_TRIB.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[16].AsFloat := DmExporterClient.CdsItensCompraQUANTIDADE.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[17].AsFloat := DmExporterClient.CdsItensCompraVL_UNITARIO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[18].AsFloat := DmExporterClient.CdsItensCompraPERCENTUAL_ICMS.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[19].AsFloat := DmExporterClient.CdsItensCompraREDUCAO_ICMS.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[20].AsFloat := DmExporterClient.CdsItensCompraVL_ICMS.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[21].AsFloat := DmExporterClient.CdsItensCompraPERCENTUAL_DESCONTO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[22].AsFloat := DmExporterClient.CdsItensCompraVL_DESCONTO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[23].AsFloat := DmExporterClient.CdsItensCompraPERCENTUAL_IPI.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[24].AsFloat := DmExporterClient.CdsItensCompraVL_IPI.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[25].AsFloat := DmExporterClient.CdsItensCompraVL_TOTAL.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[26].AsFloat := DmExporterClient.CdsItensCompraPERCENTUAL_MARGEM.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[27].AsString := DmExporterClient.CdsItensCompraCD_ATENDIMENTO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[28].AsFloat := DmExporterClient.CdsItensCompraNOVO_PRECO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[29].AsFloat := DmExporterClient.CdsItensCompraNOVO_CUSTO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[30].AsString := DmExporterClient.CdsItensCompraATUALIZAR_PRECO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[31].AsFloat := DmExporterClient.CdsItensCompraPRECO_VENDA.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[32].AsFloat := DmExporterClient.CdsItensCompraQT_EMBALAGEM.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[33].AsFloat := DmExporterClient.CdsItensCompraULTIMOCUSTO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[34].AsString := DmExporterClient.CdsItensCompraPRECO_REAJUSTADO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[35].AsString := DmExporterClient.CdsItensCompraCODIGO_BARRAS.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[36].AsString := DmExporterClient.CdsItensCompraUNIDADE.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[37].AsString := DmExporterClient.CdsItensCompraICMS.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[38].AsFloat := DmExporterClient.CdsItensCompraBASEICMS.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[39].AsFloat := DmExporterClient.CdsItensCompraBASEICMSSUBSTITUICAO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[40].AsString := DmExporterClient.CdsItensCompraSITUACAOTRIBITARIA.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[41].AsString := DmExporterClient.CdsItensCompraLOTE.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[42].AsDateTime := DmExporterClient.CdsItensCompraFABRICACAO.AsDateTime;
        DmExporterClient.SqlAtualizaItensCompra.Params[43].AsDateTime := DmExporterClient.CdsItensCompraVALIDADE.AsDateTime;
        DmExporterClient.SqlAtualizaItensCompra.Params[44].AsFloat := DmExporterClient.CdsItensCompraPRECO_PROMOCAO_ATUAL.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[45].AsFloat := DmExporterClient.CdsItensCompraPRECO_PROMOCAO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[46].AsFloat := DmExporterClient.CdsItensCompraDESCONTO_OUTROS.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.Params[47].AsString := DmExporterClient.CdsItensCompraDIASSEMVENDER.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[48].AsString := DmExporterClient.CdsItensCompraENVIADO.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[49].AsString := DmExporterClient.CdsItensCompraCFOP.AsString;
        DmExporterClient.SqlAtualizaItensCompra.Params[50].AsFloat := DmExporterClient.CdsItensCompraVALORICMSSUBTITUICAO.AsFloat;
        DmExporterClient.SqlAtualizaItensCompra.ExecSql(False);

        DmExporterClient.CdsItensCompra.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsItensCompra.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Itens Compra');
         DmExporterClient.CdsItensCompra.Close;
         Exit;
       end;
   end;
end;



function TFrmExporterClient.RecebendoContasReceber : Boolean;
var
 i : integer;
 Dados : Variant;
begin
   Result := True;
   Try
     DmExporterClient.CdsContas_Receber.Close;
     DmExporterClient.CdsContas_Receber.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(121, Filial, 'A');
     if (Dados = null) then
      begin
        Result := False;
        Exit;
      end;

     Try
       DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR INACTIVE';
       AbreTransacao;
       DmExporterClient.Sql1.ExecSQL(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
        begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         CancelaTransacao;
        end;
     End;

     DmExporterClient.CdsContas_Receber.Data := Dados;
     DmExporterClient.CdsContas_Receber.Open; // virtual
     if DmExporterClient.CdsContas_Receber.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Contas a Receber: '+ FloatToStr(DmExporterClient.CdsCOntas_Receber.RecordCount));
           AbreTransacao;
           DmExporterClient.CdsContas_Receber.First;
           while not DmExporterClient.CdsContas_Receber.Eof do
            begin
              DmExporterClient.SqlAtualizaContasReceber.Params[0].asFloat := DmExporterClient.CdsContas_ReceberCD_CONTAS_RECEBER.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[1].asFloat := DmExporterClient.CdsContas_ReceberCD_CLIENTE.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[2].asFloat := DmExporterClient.CdsContas_ReceberCD_PLANO_CONTAS.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[3].asFloat := DmExporterClient.CdsContas_ReceberCD_FILIAL.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[4].asFloat := DmExporterClient.CdsContas_ReceberCD_CONVENIO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[5].asFloat := DmExporterClient.CdsContas_ReceberCD_VENDEDOR.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[6].asFloat := DmExporterClient.CdsContas_ReceberCD_VENDA.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[7].asFloat := DmExporterClient.CdsContas_ReceberCD_FORMA_PAGAMENTO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[8].asFloat := DmExporterClient.CdsContas_ReceberCD_CONTA.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[9].asFloat := DmExporterClient.CdsContas_ReceberCD_CARTAO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[10].asFloat := DmExporterClient.CdsContas_ReceberCD_BORDERO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[11].AsDateTime := DmExporterClient.CdsContas_ReceberDT_LANCAMENTO.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[12].AsDateTime := DmExporterClient.CdsContas_ReceberDT_VENCIMENTO.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[13].AsString := DmExporterClient.CdsContas_ReceberNOTA_FISCAL.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[14].AsString := DmExporterClient.CdsContas_ReceberSERIE_NOTA.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[15].AsString := DmExporterClient.CdsContas_ReceberDOCUMENTO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[16].AsDateTime := DmExporterClient.CdsContas_ReceberDT_NOTA_FISCAL.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[17].AsDateTime := DmExporterClient.CdsContas_ReceberVENCTO.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[18].asFloat := DmExporterClient.CdsContas_ReceberVALOR.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[19].AsString := DmExporterClient.CdsContas_ReceberHISTORICO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[20].asFloat := DmExporterClient.CdsContas_ReceberCD_CHEQUE_RECEBIDO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[21].AsString := DmExporterClient.CdsContas_ReceberNR_CHEQUE.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[22].AsString := DmExporterClient.CdsContas_ReceberNR_BANCO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[23].AsDateTime := DmExporterClient.CdsContas_ReceberDT_PAGAMENTO.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[24].asFloat := DmExporterClient.CdsContas_ReceberVL_PAGAMENTO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[25].asFloat := DmExporterClient.CdsContas_ReceberVL_JUROS.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[26].asFloat := DmExporterClient.CdsContas_ReceberVL_DESCONTO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[27].asFloat := DmExporterClient.CdsContas_ReceberVL_SALDO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[28].AsString := DmExporterClient.CdsContas_ReceberNOSSO_NUMERO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[29].AsString := DmExporterClient.CdsContas_ReceberBANCO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[30].AsString := DmExporterClient.CdsContas_ReceberAGENCIA.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[31].AsString := DmExporterClient.CdsContas_ReceberCONTA.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[32].AsString := DmExporterClient.CdsContas_ReceberHISTORICO_BANCO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[33].AsString := DmExporterClient.CdsContas_ReceberSTATUS.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[34].AsString := DmExporterClient.CdsContas_ReceberGERABOLETO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[35].AsString := DmExporterClient.CdsContas_ReceberBOLETOGERADO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[36].AsDateTime := DmExporterClient.CdsContas_ReceberDT_ALTERACAO.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[37].asFloat := DmExporterClient.CdsContas_ReceberTEFTRANSACAO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[38].asFloat := DmExporterClient.CdsContas_ReceberTEFLOTE.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[39].asFloat := DmExporterClient.CdsContas_ReceberTEFAUTORIZACAO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[40].AsDateTime := DmExporterClient.CdsContas_ReceberTEFDATA.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[41].AsDateTime := DmExporterClient.CdsContas_ReceberTEFHORA.AsDateTime;
              DmExporterClient.SqlAtualizaContasReceber.Params[42].AsString := DmExporterClient.CdsContas_ReceberTEFNOMEREDE.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[43].asFloat := DmExporterClient.CdsContas_ReceberTEFVALOR.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[44].AsString := DmExporterClient.CdsContas_ReceberENVIADO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[45].AsString := DmExporterClient.CdsContas_ReceberTRNTRANSACAO.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[46].AsString := DmExporterClient.CdsContas_ReceberTRNLOTE.AsString;;
              DmExporterClient.SqlAtualizaContasReceber.Params[47].AsString := DmExporterClient.CdsContas_ReceberTRNAUTORIZACAO.AsString;;
              DmExporterClient.SqlAtualizaContasReceber.Params[48].AsString := DmExporterClient.CdsContas_ReceberTRN.AsString;
              DmExporterClient.SqlAtualizaContasReceber.Params[49].asFloat := DmExporterClient.CdsContas_ReceberCD_FILIAL_PAGAMENTO.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[50].AsInteger := DmExporterClient.CdsContas_ReceberPARCELA.AsInteger;
              DmExporterClient.SqlAtualizaContasReceber.Params[51].asFloat := DmExporterClient.CdsContas_ReceberCD_CAIXA.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.Params[52].asFloat := DmExporterClient.CdsContas_ReceberCD_FILIAL_ORIGEM.AsFloat;
              DmExporterClient.SqlAtualizaContasReceber.ExecSql(False);

              DmExporterClient.CdsContas_Receber.Next;
            end;
           ConfirmaTransacao;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Contas Receber');
         DmExporterClient.CdsContas_Receber.Close;
         Try
           DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
           AbreTransacao;
           DmExporterClient.Sql1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           on E:Exception do
            begin
             GravaLog(TimetoStr(Time) + ' - ' + E.Message);
             CancelaTransacao;
            end;
         End;
         Exit;
       end;
   end;
   DmExporterClient.CdsContas_Receber.Close;
   Try
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
     AbreTransacao;
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
     on E:Exception do
      begin
       GravaLog(TimetoStr(Time) + ' - ' + E.Message);
       CancelaTransacao;
      end;
   End;
end;


function TFrmExporterClient.RecebendoClientes : Boolean;
var i : integer;
    Dados : Variant;
begin
   Result := True;
   Try
     DmExporterClient.CdsClientes.Close;
     DmExporterClient.CdsClientes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(110, Filial, 'A');
     if (Dados = null) then
      begin
        Result := False;
        Exit;
      end;

     Try
       DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES INACTIVE';
       AbreTransacao;
       DmExporterClient.Sql1.ExecSQL(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
        begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         CancelaTransacao;
        end;
     End;

     DmExporterClient.CdsClientes.Data := Dados;
     DmExporterClient.CdsClientes.Open; // virtual
     if DmExporterClient.CdsClientes.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Clientes: '+ FloatToStr(DmExporterClient.CdsClientes.RecordCount));
           AbreTransacao;
           DmExporterClient.CdsClientes.First;
           while not DmExporterClient.CdsClientes.Eof do
            begin
              DmExporterClient.SqlAtualizaClientes.Params[0].AsFloat := DmExporterClient.CdsClientesCD_FILIAL.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[1].AsFloat := DmExporterClient.CdsClientesCD_CLIENTE.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[2].AsFloat := DmExporterClient.CdsClientesCD_VENDEDOR.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[3].AsFloat := DmExporterClient.CdsClientesCD_CONVENIO.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[4].AsString := DmExporterClient.CdsClientesNOME.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[5].AsString := DmExporterClient.CdsClientesENDERECO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[6].AsString := DmExporterClient.CdsClientesBAIRRO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[7].AsString := DmExporterClient.CdsClientesCIDADE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[8].AsString := DmExporterClient.CdsClientesUF.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[9].AsString := DmExporterClient.CdsClientesCEP.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[10].AsString := DmExporterClient.CdsClientesCAIXA_POSTAL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[11].AsString := DmExporterClient.CdsClientesFONE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[12].AsString := DmExporterClient.CdsClientesFAX.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[13].AsString := DmExporterClient.CdsClientesCONTATO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[14].AsString := DmExporterClient.CdsClientesCNPJ.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[15].AsString := DmExporterClient.CdsClientesINSCRICAO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[16].AsString := DmExporterClient.CdsClientesPRACA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[17].AsDate := DmExporterClient.CdsClientesDATA_FICHA.AsDateTime;
              DmExporterClient.SqlAtualizaClientes.Params[18].AsString := DmExporterClient.CdsClientesRG.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[19].AsString := DmExporterClient.CdsClientesCPF.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[20].AsString := DmExporterClient.CdsClientesTITULO_ELEITO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[21].AsDate := DmExporterClient.CdsClientesDT_NASCIMENTO.AsDateTime;
              DmExporterClient.SqlAtualizaClientes.Params[22].AsString := DmExporterClient.CdsClientesSEXO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[23].AsString := DmExporterClient.CdsClientesESTADO_CIVIL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[24].AsString := DmExporterClient.CdsClientesNATURALIDADE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[25].AsString := DmExporterClient.CdsClientesFILIACAO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[26].AsFloat := DmExporterClient.CdsClientesNUMERO_DEPENDENTES.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[27].AsString := DmExporterClient.CdsClientesCONJUGE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[28].AsString := DmExporterClient.CdsClientesDT_NASC_CONJUGE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[29].AsString := DmExporterClient.CdsClientesALUGUEL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[30].AsFloat := DmExporterClient.CdsClientesVL_ALUGUEL.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[31].AsString := DmExporterClient.CdsClientesTEMPO_RESIDENCIA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[32].AsString := DmExporterClient.CdsClientesEMPRESA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[33].AsString := DmExporterClient.CdsClientesFONE_COMERCIAL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[34].AsString := DmExporterClient.CdsClientesDT_ADMISSAO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[35].AsString := DmExporterClient.CdsClientesCEP_COMERCIAL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[36].AsString := DmExporterClient.CdsClientesCIDADE_COMERCIAL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[37].AsString := DmExporterClient.CdsClientesUF_COMERCIAL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[38].AsString := DmExporterClient.CdsClientesFUNCAO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[39].AsString := DmExporterClient.CdsClientesEMPRESA_ANTERIOR.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[40].AsString := DmExporterClient.CdsClientesTEMPO_SERVICO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[41].AsString := DmExporterClient.CdsClientesREFERENCIA_COMERCIAL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[42].AsString := DmExporterClient.CdsClientesREFERENCIA_BANCARIA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[43].AsString := DmExporterClient.CdsClientesCONSULTA_SPC.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[44].AsString := DmExporterClient.CdsClientesOBSERVACAO_SPC.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[45].AsString := DmExporterClient.CdsClientesOBSERVACAO_GERAL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[46].AsString := DmExporterClient.CdsClientesENDERECO_COBRANCA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[47].AsString := DmExporterClient.CdsClientesBAIRRO_COBRANCA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[48].AsString := DmExporterClient.CdsClientesCIDADE_COBRANCA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[49].AsString := DmExporterClient.CdsClientesUF_COBRANCA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[50].AsString := DmExporterClient.CdsClientesCEP_COBRANCA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[51].AsString := DmExporterClient.CdsClientesICMS_IPI.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[52].AsString := DmExporterClient.CdsClientesNOME_MAE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[53].AsFloat := DmExporterClient.CdsClientesMES_NASCIMENTO.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[54].AsFloat := DmExporterClient.CdsClientesRENDA.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[55].AsFloat := DmExporterClient.CdsClientesLIMITE_PERCENTUAL.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[56].AsFloat := DmExporterClient.CdsClientesLIMITE_CREDITO.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[57].AsString := DmExporterClient.CdsClientesEMAIL.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[58].AsString := DmExporterClient.CdsClientesHOMEPAGE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[59].AsString := DmExporterClient.CdsClientesMATRICULA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[60].AsFloat := DmExporterClient.CdsClientesSALDO.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[61].AsFloat := DmExporterClient.CdsClientesDT_VENCIMENTO.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[62].AsFloat := DmExporterClient.CdsClientesDESCONTO.AsFloat;
              DmExporterClient.SqlAtualizaClientes.Params[63].ASDate := DmExporterClient.CdsClientesDT_ULTIMA_COMPRA.AsDateTime;
              DmExporterClient.SqlAtualizaClientes.Params[64].AsString := DmExporterClient.CdsClientesSTATUS.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[65].AsString := DmExporterClient.CdsClientesREFERENCIA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[66].AsDate := DmExporterClient.CdsClientesDT_ALTERACAO.AsDateTime;
              DmExporterClient.SqlAtualizaClientes.Params[67].AsString := DmExporterClient.CdsClientesCOMPRAOUTRALOJA.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[68].AsString := DmExporterClient.CdsClientesCARTAOFIDELIDADE.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[69].AsString := DmExporterClient.CdsClientesENVIADO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[70].AsString := DmExporterClient.CdsClientesNUMERO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[71].AsString := DmExporterClient.CdsClientesCOMPLEMENTO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[72].AsString := DmExporterClient.CdsClientesCD_MUNICIPIO.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[73].AsString := DmExporterClient.CdsClientesCD_PAIS.AsString;
              DmExporterClient.SqlAtualizaClientes.Params[74].AsFloat := DmExporterClient.CdsClientesID_PERFIL_CLIENTE.AsFloat;
              DmExporterClient.SqlAtualizaClientes.ExecSQL(False);

              DmExporterClient.CdsClientes.Next;
            end;
        end;
       ConfirmaTransacao;
       DmExporterClient.CdsClientes.Close;
       Try
         DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
         AbreTransacao;
         DmExporterClient.Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         on E:Exception do
          begin
           GravaLog(TimetoStr(Time) + ' - ' + E.Message);
           CancelaTransacao;
          end;
       End;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Clientes');
         DmExporterClient2.CdsClientes.Close;
         Try
           DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
           AbreTransacao;
           DmExporterClient.Sql1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           on E:Exception do
            begin
             GravaLog(TimetoStr(Time) + ' - ' + E.Message);
             CancelaTransacao;
            end;
         End;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoLimiteSaldoClientes;
var i : integer;
    Dados : Variant;
begin
   Try
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES INACTIVE';
     AbreTransacao;
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
     on E:Exception do
      begin
       GravaLog(TimetoStr(Time) + ' - ' + E.Message);
       CancelaTransacao;
      end;
   End;

   Try
     DmExporterClient2.CdsLimiteSaldoClientes.Close;
     DmExporterClient2.CdsLimiteSaldoClientes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(151, Filial, 'A');
     if (Dados = null) then
      begin
        Try
          DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
          AbreTransacao;
          DmExporterClient.Sql1.ExecSQL(True);
          ConfirmaTransacao;
        Except
          on E:Exception do
           begin
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            CancelaTransacao;
           end;
        End;
        Exit;
      end;
     DmExporterClient2.CdsLimiteSaldoClientes.Data := Dados;
     DmExporterClient2.CdsLimiteSaldoClientes.Open; // virtual
     if DmExporterClient2.CdsLimiteSaldoClientes.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Limite e Saldo dos Clientes: '+ FloatToStr(DmExporterClient2.CdsLimiteSaldoClientes.RecordCount));
           DmExporterClient2.CdsLimiteSaldoClientes.First;
           while not DmExporterClient2.CdsLimiteSaldoClientes.Eof do
            begin
              DmExporterClient2.QryLimiteSaldoClientes.Close;
              DmExporterClient2.QryLimiteSaldoClientes.Params[0].AsFloat := DmExporterClient2.CdsLimiteSaldoClientesCD_CLIENTE.AsFloat;
              DmExporterClient2.QryLimiteSaldoClientes.Open;

              if DmExporterClient2.QryLimiteSaldoClientes.RecordCount > 0 then
               begin
                 DmExporterClient2.QryLimiteSaldoClientes.Edit;
                 for i := 0 to DmExporterClient2.QryLimiteSaldoClientes.FieldCount - 1 do
                    if DmExporterClient2.QryLimiteSaldoClientes.Fields[i].FieldName <> 'CD_CLIENTE' then
                       DmExporterClient2.QryLimiteSaldoClientes.Fields[i].Value := DmExporterClient2.CdsLimiteSaldoClientes.Fields[i].Value;
                 DmExporterClient2.QryLimiteSaldoClientes.Post;
                 AbreTransacao;
                 DmExporterClient2.QryLimiteSaldoClientes.ApplyUpdates(0);
                 ConfirmaTransacao;
               end;
              DmExporterClient2.CdsLimiteSaldoClientes.Next;
            end;
        end;
       DmExporterClient2.CdsLimiteSaldoClientes.Close;
       DmExporterClient2.QryLimiteSaldoClientes.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Clientes');
         DmExporterClient2.CdsLimiteSaldoClientes.Close;
         DmExporterClient2.QryLimiteSaldoClientes.Close;
         Try
           DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
           AbreTransacao;
           DmExporterClient.Sql1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           on E:Exception do
            begin
             GravaLog(TimetoStr(Time) + ' - ' + E.Message);
             CancelaTransacao;
            end;
         End;
         Exit;
       end;
   end;
   Try
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
     AbreTransacao;
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
     on E:Exception do
      begin
       GravaLog(TimetoStr(Time) + ' - ' + E.Message);
       CancelaTransacao;
      end;
   End;
end;


procedure TFrmExporterClient.RecebendoGrupos;
var
  i : integer;
  Dados : Variant;
begin
   Try
     // Atualização dos grupos na filial
     DmExporterClient.CdsGrupos.Close;
     DmExporterClient.CdsGrupos.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(100, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsGrupos.Data := Dados;
     DmExporterClient.CdsGrupos.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsGrupos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos: '+ FloatToStr(DmExporterClient.CdsGrupos.RecordCount));
     while not DmExporterClient.CdsGrupos.Eof do
      begin
          DmExporterClient.SqlAtualizaGrupos.Params[0].AsFloat := DmExporterClient.CdsGruposCD_GRUPO.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[1].AsString := DmExporterClient.CdsGruposDESCRICAO.AsString;
          DmExporterClient.SqlAtualizaGrupos.Params[2].AsFloat := DmExporterClient.CdsGruposTX_MARCACAO.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[3].AsString := DmExporterClient.CdsGruposDESCONTO.AsString;
          DmExporterClient.SqlAtualizaGrupos.Params[4].AsFloat := DmExporterClient.CdsGruposTX_DESCONTO.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[5].AsFloat := DmExporterClient.CdsGruposTX_DESCONTO_MAXIMO.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[6].AsFloat := DmExporterClient.CdsGruposTX_COMISSAO.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[7].AsString := DmExporterClient.CdsGruposDIAS_EST_MIN.AsString;
          DmExporterClient.SqlAtualizaGrupos.Params[8].AsString := DmExporterClient.CdsGruposTIPO.AsString;
          DmExporterClient.SqlAtualizaGrupos.Params[9].AsDateTime := DmExporterClient.CdsGruposDT_ALTERACAO.AsDateTime;
          DmExporterClient.SqlAtualizaGrupos.Params[10].AsFloat := DmExporterClient.CdsGruposNPRODUTOS.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[11].AsFloat := DmExporterClient.CdsGruposNITENS.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[12].AsFloat := DmExporterClient.CdsGruposVPRODUTOS.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[13].AsFloat := DmExporterClient.CdsGruposCPRODUTOS.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[14].AsString := DmExporterClient.CdsGruposEXIGERECEITA.AsString;
          DmExporterClient.SqlAtualizaGrupos.Params[15].AsString := DmExporterClient.CdsGruposVENDEESTOQUENEGATIVO.AsString;
          DmExporterClient.SqlAtualizaGrupos.Params[16].AsString := DmExporterClient.CdsGruposPEDECRM.AsString;
          DmExporterClient.SqlAtualizaGrupos.Params[17].AsFloat := DmExporterClient.CdsGruposMETA.AsFloat;
          DmExporterClient.SqlAtualizaGrupos.Params[18].AsString := DmExporterClient.CdsGruposENVIADO.AsString;
          DmExporterClient.SqlAtualizaGrupos.ExecSQL(False);

          DmExporterClient.CdsGrupos.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsGrupos.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos');
         DmExporterClient.CdsGrupos.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoLaboratorios;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualização dos laboratorios na filial
     DmExporterClient.CdsLaboratorios.Close;
     DmExporterClient.CdsLaboratorios.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(101, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsLaboratorios.Data := Dados;
     DmExporterClient.CdsLaboratorios.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsLaboratorios.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Laboratorios: '+ FloatToStr(DmExporterClient.CdsLaboratorios.RecordCount));
     while not DmExporterClient.CdsLaboratorios.Eof do
      begin
        DmExporterClient.SqlAtualizaLaboratorios.Params[0].AsFloat := DmExporterClient.CdsLaboratoriosCD_LABORATORIO.AsFloat;
        DmExporterClient.SqlAtualizaLaboratorios.Params[1].AsFloat := DmExporterClient.CdsLaboratoriosID_AREA.AsFloat;
        DmExporterClient.SqlAtualizaLaboratorios.Params[2].AsString := DmExporterClient.CdsLaboratoriosNOME.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[3].AsString := DmExporterClient.CdsLaboratoriosRAZAO.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[4].AsString := DmExporterClient.CdsLaboratoriosCNPJ.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[5].AsString := DmExporterClient.CdsLaboratoriosENDERECO.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[6].AsString := DmExporterClient.CdsLaboratoriosCIDADE.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[7].AsString := DmExporterClient.CdsLaboratoriosFONE.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[8].AsString := DmExporterClient.CdsLaboratoriosCONTATO.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[9].AsFloat := DmExporterClient.CdsLaboratoriosTX_DESCONTO.AsFloat;
        DmExporterClient.SqlAtualizaLaboratorios.Params[10].AsString := DmExporterClient.CdsLaboratoriosCONTROLE.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.Params[11].AsDate := DmExporterClient.CdsLaboratoriosDT_ALTERACAO.AsDateTime;
        DmExporterClient.SqlAtualizaLaboratorios.Params[12].AsFloat := DmExporterClient.CdsLaboratoriosNPRODUTOS.AsFloat;
        DmExporterClient.SqlAtualizaLaboratorios.Params[13].AsFloat := DmExporterClient.CdsLaboratoriosNITENS.AsFloat;
        DmExporterClient.SqlAtualizaLaboratorios.Params[14].AsFloat := DmExporterClient.CdsLaboratoriosVPRODUTOS.AsFloat;
        DmExporterClient.SqlAtualizaLaboratorios.Params[15].AsFloat := DmExporterClient.CdsLaboratoriosCPRODUTOS.AsFloat;
        DmExporterClient.SqlAtualizaLaboratorios.Params[16].AsString := DmExporterClient.CdsLaboratoriosENVIADO.AsString;
        DmExporterClient.SqlAtualizaLaboratorios.ExecSQL(False);

        DmExporterClient.CdsLaboratorios.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsLaboratorios.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Laboratorios');
         DmExporterClient.CdsLaboratorios.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoVendedores;
var i : integer;
Dados : Variant;
begin
   DmExporterClient.CdsVendedores.Close;
   DmExporterClient.CdsVendedores.CreateDataSet;
   Try
     // Atualiza vendedores
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(104, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsVendedores.Data := Dados;
     DmExporterClient.CdsVendedores.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsVendedores.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Vendedores: '+ FloatToStr(DmExporterClient.CdsVendedores.RecordCount));
     while not DmExporterClient.CdsVendedores.Eof do
      begin
        DmExporterClient.SqlAtualizaVendedores.Params[0].AsFloat   := DmExporterClient.CdsVendedoresCD_VENDEDOR.AsFloat;
        DmExporterClient.SqlAtualizaVendedores.Params[1].AsFloat   := DmExporterClient.CdsVendedoresCD_FILIAL.AsFloat;
        DmExporterClient.SqlAtualizaVendedores.Params[2].AsDate    := DmExporterClient.CdsVendedoresDT_ADMISSAO.AsDateTime;
        DmExporterClient.SqlAtualizaVendedores.Params[3].AsDate    := DmExporterClient.CdsVendedoresDT_NASCIMENTO.AsDateTime;
        DmExporterClient.SqlAtualizaVendedores.Params[4].AsString  := DmExporterClient.CdsVendedoresTIPO_FUNCIONARIO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[5].AsString  := DmExporterClient.CdsVendedoresCODIGO_BARRAS.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[6].AsString  := DmExporterClient.CdsVendedoresNOME.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[7].AsString  := DmExporterClient.CdsVendedoresRUA.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[8].AsString  := DmExporterClient.CdsVendedoresBAIRRO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[9].AsString  := DmExporterClient.CdsVendedoresCIDADE.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[10].AsString := DmExporterClient.CdsVendedoresUF.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[11].AsString := DmExporterClient.CdsVendedoresCEP.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[12].AsString := DmExporterClient.CdsVendedoresFONE.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[13].AsString := DmExporterClient.CdsVendedoresREFERENCIA.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[14].AsString := DmExporterClient.CdsVendedoresRG.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[15].AsString := DmExporterClient.CdsVendedoresCPF.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[16].AsString := DmExporterClient.CdsVendedoresJORNADA.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[17].AsString := DmExporterClient.CdsVendedoresINTERVALO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[18].AsString := DmExporterClient.CdsVendedoresREPOUSO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[19].AsString := DmExporterClient.CdsVendedoresNR_REGISTRO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[20].AsString := DmExporterClient.CdsVendedoresCTPS.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[21].AsString := DmExporterClient.CdsVendedoresFUNCAO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[22].AsFloat  := DmExporterClient.CdsVendedoresSALARIO.AsFloat;
        DmExporterClient.SqlAtualizaVendedores.Params[23].AsFloat  := DmExporterClient.CdsVendedoresTX_COMISSAO.AsFloat;
        DmExporterClient.SqlAtualizaVendedores.Params[24].AsFloat  := DmExporterClient.CdsVendedoresCOMISSAO.AsFloat;
        DmExporterClient.SqlAtualizaVendedores.Params[25].AsFloat  := DmExporterClient.CdsVendedoresVENDA.AsFloat;
        DmExporterClient.SqlAtualizaVendedores.Params[26].AsString := DmExporterClient.CdsVendedoresENVIADO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[27].AsString := DmExporterClient.CdsVendedoresSEXO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[28].AsString := DmExporterClient.CdsVendedoresESTADO_CIVIL.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[29].AsString := DmExporterClient.CdsVendedoresNATURALIDADE.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[30].AsString := DmExporterClient.CdsVendedoresCONJUGE.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[31].AsDate   := DmExporterClient.CdsVendedoresDT_NASC_CONJUGE.AsDateTime;
        DmExporterClient.SqlAtualizaVendedores.Params[32].AsString := DmExporterClient.CdsVendedoresNUM_DEPEND.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[33].AsString := DmExporterClient.CdsVendedoresNOMEMAE.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[34].AsString := DmExporterClient.CdsVendedoresNOMEPAI.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[35].AsString := DmExporterClient.CdsVendedoresEMPRESA_ANTERIOR.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[36].AsString := DmExporterClient.CdsVendedoresTEMPO_SERVICO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[37].AsString := DmExporterClient.CdsVendedoresREFERENCIA_COMERCIAL.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[38].AsString := DmExporterClient.CdsVendedoresREFERENCIA_BANCARIA.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[39].AsString := DmExporterClient.CdsVendedoresDESCONTO.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[40].AsString := DmExporterClient.CdsVendedoresCOMISSAO_MEDICAMENTOS.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[41].AsString := DmExporterClient.CdsVendedoresCOMISSAO_BONIFICADOS.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[42].AsString := DmExporterClient.CdsVendedoresCOMISSAO_PERFUMARIA.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[43].AsString := DmExporterClient.CdsVendedoresCOMISSAO_OUTROS.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[44].AsFloat  := DmExporterClient.CdsVendedoresCOTA.AsFloat;
        DmExporterClient.SqlAtualizaVendedores.Params[45].AsString := DmExporterClient.CdsVendedoresSENHA.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[46].AsDate   := DmExporterClient.CdsVendedoresDT_ALTERACAO.AsDateTime;
        DmExporterClient.SqlAtualizaVendedores.Params[47].AsString := DmExporterClient.CdsVendedoresSTATUS.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[48].AsString := DmExporterClient.CdsVendedoresVENDEOUTRALOJA.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[49].AsString := DmExporterClient.CdsVendedoresUSUARIOFARMACIAPOPULAR.AsString;
        DmExporterClient.SqlAtualizaVendedores.Params[50].AsString := DmExporterClient.CdsVendedoresSENHAFARMACIAPOPULAR.AsString;
        DmExporterClient.SqlAtualizaVendedores.ExecSQL(False);

        DmExporterClient.CdsVendedores.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsVendedores.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Vendedores');
         DmExporterClient.CdsVendedores.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoVendedoresClasses;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza  Vendedores_Classes
     DmExporterClient.CdsVendedores_Classes.Close;
     DmExporterClient.CdsVendedores_Classes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(123, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsVendedores_Classes.Data := Dados;
     DmExporterClient.CdsVendedores_Classes.Open; // virtual

     DmExporterClient.CdsVendedores_Classes.First;
     GravaLog(TimetoStr(Time) + ' - Recebendo Vendedores_Classes: '+ FloatToStr(DmExporterClient.CdsVendedores_Classes.RecordCount));
     while not DmExporterClient.CdsVendedores_Classes.Eof do
      begin
        DmExporterClient.QryVendedoresClasses.Close;
        DmExporterClient.QryVendedoresClasses.Params[0].AsFloat := DmExporterClient.CdsVendedores_ClassesCD_VENDEDOR.AsFloat;
        DmExporterClient.QryVendedoresClasses.Params[1].AsFloat := DmExporterClient.CdsVendedores_ClassesCD_CLASSE.AsFloat;
        DmExporterClient.QryVendedoresClasses.Open;
        if DmExporterClient.QryVendedoresClasses.RecordCount = 0 then
           DmExporterClient.QryVendedoresClasses.Append
        else
           DmExporterClient.QryVendedoresClasses.Edit;
        for i := 0 to DmExporterClient.QryVendedoresClasses.FieldCount - 1 do
           DmExporterClient.QryVendedoresClasses.Fields[i].Value := DmExporterClient.CdsVendedores_Classes.Fields[i].Value;
        DmExporterClient.QryVendedoresClasses.Post;
        AbreTransacao;
        DmExporterClient.QryVendedoresClasses.ApplyUpdates(0);
        ConfirmaTransacao;
        DmExporterClient.CdsVendedores_Classes.Next;
      end;
     DmExporterClient.CdsVendedores_Classes.Close;
     DmExporterClient.QryVendedoresClasses.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Vendedores Classes');
         DmExporterClient.CdsVendedores_Classes.Close;
         DmExporterClient.QryVendedoresClasses.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoConveniosClasses;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza  Convenios_Classes
     DmExporterClient.CdsConvenios_Classes.Close;
     DmExporterClient.CdsConvenios_Classes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(124, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsConvenios_Classes.Data := Dados;
     DmExporterClient.CdsConvenios_Classes.Open; // virtual

     AbreTransacao;
     DmExporterClient.QryConveniosClasses.Open;
     ConfirmaTransacao;

     DmExporterClient.CdsConvenios_Classes.First;
     GravaLog(TimetoStr(Time) + ' - Recebendo Convenios_Classes: '+ FloatToStr(DmExporterClient.CdsConvenios_Classes.RecordCount));
     while not DmExporterClient.CdsConvenios_Classes.Eof do
      begin
        DmExporterClient.QryConveniosClasses.Close;
        DmExporterClient.QryConveniosClasses.Params[0].AsFloat := DmExporterClient.CdsConvenios_ClassesCD_CONVENIO.AsFloat;
        DmExporterClient.QryConveniosClasses.Params[1].AsFloat := DmExporterClient.CdsConvenios_ClassesCD_CLASSE.AsFloat;
        DmExporterClient.QryConveniosClasses.Open;
        if DmExporterClient.QryConveniosClasses.RecordCount = 0 then
           DmExporterClient.QryConveniosClasses.Append
        else
           DmExporterClient.QryConveniosClasses.Edit;
         for i := 0 to DmExporterClient.QryConveniosClasses.FieldCount - 1 do
            DmExporterClient.QryConveniosClasses.Fields[i].Value := DmExporterClient.CdsConvenios_Classes.Fields[i].Value;
         AbreTransacao;
         DmExporterClient.QryConveniosClasses.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient.CdsConvenios_Classes.Next;
      end;
     DmExporterClient.CdsConvenios_Classes.Close;
     DmExporterClient.QryConveniosClasses.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Convenios Classes');
         DmExporterClient.CdsConvenios_Classes.Close;
         DmExporterClient.QryConveniosClasses.Close;
         Exit;
       end;
   end;
end;



procedure TFrmExporterClient.RecebendoMetasFiliais;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Cepedid1.dat
     DmExporterClient.CdsMetasFiliais.Close;
     DmExporterClient.CdsMetasFiliais.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(127, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsMetasFiliais.Data := Dados;
     DmExporterClient.CdsMetasFiliais.Open; // virtual
     DmExporterClient.CdsMetasFiliais.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasFiliais: '+ FloatToStr(DmExporterClient.CdsMetasFiliais.RecordCount));
     while not DmExporterClient.CdsMetasFiliais.Eof do
      begin
        DmExporterClient.QryMetasFiliais.Close;
        DmExporterClient.QryMetasFiliais.Params[0].AsFloat := DmExporterClient.CdsMetasFiliaisID_META.AsFloat;
        DmExporterClient.QryMetasFiliais.Open;
        if DmExporterClient.QryMetasFiliais.RecordCount = 0 then
           DmExporterClient.QryMetasFiliais.Append
        else
           DmExporterClient.QryMetasFiliais.Edit;
        if DmExporterClient.QryMetasFiliais.State in [dsInsert, dsedit] then
          begin
           for i := 0 to DmExporterClient.QryMetasFiliais.FieldCount - 1 do
               DmExporterClient.QryMetasFiliais.Fields[i].Value := DmExporterClient.CdsMetasFiliais.Fields[i].Value;

           DmExporterClient.QryMetasFiliais.Post;
           AbreTransacao;
           DmExporterClient.QryMetasFiliais.ApplyUpdates(0);
           ConfirmaTransacao;
         end;
        DmExporterClient.CdsMetasFiliais.Next;
      end;
     DmExporterClient.CdsMetasFiliais.Close;
     DmExporterClient.QryMetasFiliais.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Metas Filiais');
         DmExporterClient.CdsMetasFiliais.Close;
         DmExporterClient.QryMetasFiliais.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoMetasVendedores;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient.CdsMetasVendedores.Close;
     DmExporterClient.CdsMetasVendedores.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(128, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsMetasVendedores.Data := Dados;
     DmExporterClient.CdsMetasVendedores.Open; // virtual
     DmExporterClient.CdsMetasVendedores.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasVendedores: ' + FloatToStr(DmExporterClient.CdsMetasVendedores.RecordCount));
     while not DmExporterClient.CdsMetasVendedores.Eof do
      begin
        DmExporterClient.QryMetasVendedores.Close;
        DmExporterClient.QryMetasVendedores.Params[0].AsFloat := DmExporterClient.CdsMetasVendedoresID_META.AsFloat;
        DmExporterClient.QryMetasVendedores.Params[1].AsFloat := DmExporterClient.CdsMetasVendedoresCD_VENDEDOR.AsFloat;
        DmExporterClient.QryMetasVendedores.Open;
        if DmExporterClient.QryMetasVendedores.RecordCount = 0 then
           DmExporterClient.QryMetasVendedores.Append
        else
           DmExporterClient.QryMetasVendedores.Edit;
        if DmExporterClient.QryMetasVendedores.State in [dsInsert, dsedit] then
          begin
           for i := 0 to DmExporterClient.QryMetasVendedores.FieldCount - 1 do
               DmExporterClient.QryMetasVendedores.Fields[i].Value := DmExporterClient.CdsMetasVendedores.Fields[i].Value;

           DmExporterClient.QryMetasVendedores.Post;
           AbreTransacao;
           DmExporterClient.QryMetasVendedores.ApplyUpdates(0);
           ConfirmaTransacao;
         end;
        DmExporterClient.CdsMetasVendedores.Next;
      end;
     DmExporterClient.CdsMetasVendedores.Close;
     DmExporterClient.QryMetasVendedores.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Metas Vendedores');
         DmExporterClient.CdsMetasVendedores.Close;
         DmExporterClient.QryMetasVendedores.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoClasses;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient.CdsClasses.Close;
     DmExporterClient.CdsClasses.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(120, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsClasses.Data := Dados;
     DmExporterClient.CdsClasses.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsClasses.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Classes: '+ FloatToStr(DmExporterClient.CdsClasses.RecordCount));
     while not DmExporterClient.CdsClasses.Eof do
      begin
        DmExporterClient.SqlAtualizaClasses.Params[0].AsFloat := DmExporterClient.CdsClassesCD_CLASSE.AsFloat;
        DmExporterClient.SqlAtualizaClasses.Params[1].AsString := DmExporterClient.CdsClassesDESCRICAO.AsString;
        DmExporterClient.SqlAtualizaClasses.Params[2].AsString := DmExporterClient.CdsClassesTIPO.AsString;
        DmExporterClient.SqlAtualizaClasses.Params[3].AsString := DmExporterClient.CdsClassesVENDEESTOQUENEGATIVO.AsString;
        DmExporterClient.SqlAtualizaClasses.Params[4].AsDate := DmExporterClient.CdsClassesDT_CALCULOCURVA.AsDateTime;
        DmExporterClient.SqlAtualizaClasses.Params[5].AsInteger := DmExporterClient.CdsClassesFREQUENCIA.AsInteger;
        DmExporterClient.SqlAtualizaClasses.Params[6].AsFloat := DmExporterClient.CdsClassesNPRODUTOS.AsFloat;
        DmExporterClient.SqlAtualizaClasses.Params[7].AsFloat := DmExporterClient.CdsClassesNITENS.AsFloat;
        DmExporterClient.SqlAtualizaClasses.Params[8].AsFloat := DmExporterClient.CdsClassesVPRODUTOS.AsFloat;
        DmExporterClient.SqlAtualizaClasses.Params[9].AsFloat := DmExporterClient.CdsClassesCPRODUTOS.AsFloat;
        DmExporterClient.SqlAtualizaClasses.Params[10].AsString := DmExporterClient.CdsClassesCONTROLALOTES.AsString;
        DmExporterClient.SqlAtualizaClasses.Params[11].AsString := DmExporterClient.CdsClassesENVIADO.AsString;
        DmExporterClient.SqlAtualizaClasses.ExecSql(False);

        DmExporterClient.CdsClasses.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsClasses.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Classes');
         DmExporterClient.CdsClasses.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoClassesDeletadas;
var Dados : Variant;
begin
  //busca na matriz as classes deletadas
   Try
     // Atualiza grupos
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CLASSES');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Classes Deletadas - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'CLASSES';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_CLASSE';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Classes Deletadas');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoUsuariosDeletados;
var Dados : Variant;
begin
  //busca na matriz as usuarios deletados
   Try
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'USUARIOS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Usuarios Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            AbreTransacao;
            DmExporterClient.Sql1.CommandText := 'DELETE FROM USUARIOS WHERE CD_USUARIO = ' + DmExporterClient.CdsDeletadosCAMPO1.AsString;
            ConfirmaTransacao;
            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Usuarios Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoFamilias;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Classes
     DmExporterClient.CdsFamilias.Close;
     DmExporterClient.CdsFamilias.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(129, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsFamilias.Data := Dados;
     DmExporterClient.CdsFamilias.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsFamilias.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Familias - ' + FloattoStr(DmExporterClient.CdsFamilias.RecordCount));
     while not DmExporterClient.CdsFamilias.Eof do
      begin
         DmExporterClient.SqlAtualizaFamilias.Params[0].AsFloat := DmExporterClient.CdsFamiliasID_FAMILIA.AsFloat;
         DmExporterClient.SqlAtualizaFamilias.Params[1].AsString := DmExporterClient.CdsFamiliasDESCRICAO.AsString;
         DmExporterClient.SqlAtualizaFamilias.Params[2].AsString := DmExporterClient.CdsFamiliasSTATUS.AsString;
         DmExporterClient.SqlAtualizaFamilias.Params[3].AsDate := DmExporterClient.CdsFamiliasDT_ALTERACAO.AsDateTime;
         DmExporterClient.SqlAtualizaFamilias.Params[4].AsString := DmExporterClient.CdsFamiliasALTERAPRECOFAMILIA.AsString;
         DmExporterClient.SqlAtualizaFamilias.Params[5].AsString := DmExporterClient.CdsFamiliasENVIADO.AsString;
         DmExporterClient.SqlAtualizaFamilias.ExecSQL(False);

         DmExporterClient.CdsFamilias.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsFamilias.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Familias');
         DmExporterClient.CdsFamilias.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoFamiliasDeletadas;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FAMILIAS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Familias Deletadas - ' + FloatToStr( DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'FAMILIAS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'ID_FAMILIA';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Familias Deletadas');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoGruposBalanco;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Grupos
     DmExporterClient.CdsGruposBalanco.Close;
     DmExporterClient.CdsGruposBalanco.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(130, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsGruposBalanco.Data := Dados;
     DmExporterClient.CdsGruposBalanco.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsGruposBalanco.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Balanco - ' + FloattoStr(DmExporterClient.CdsGruposBalanco.RecordCount));
     while not DmExporterClient.CdsGruposBalanco.Eof do
      begin
         DmExporterClient.SqlAtualizaGruposBalanco.Params[0].AsFloat := DmExporterClient.CdsGruposBalancoCD_GRUPOBALANCO.AsFloat;
         DmExporterClient.SqlAtualizaGruposBalanco.Params[1].AsString := DmExporterClient.CdsGruposBalancoDESCRICAO.AsString;
         DmExporterClient.SqlAtualizaGruposBalanco.Params[2].AsString := DmExporterClient.CdsGruposBalancoSTATUS.AsString;
         DmExporterClient.SqlAtualizaGruposBalanco.Params[3].AsDate := DmExporterClient.CdsGruposBalancoDT_ALTERACAO.AsDateTime;
         DmExporterClient.SqlAtualizaGruposBalanco.Params[4].AsString := DmExporterClient.CdsGruposBalancoENVIADO.AsString;
         DmExporterClient.SqlAtualizaGruposBalanco.ExecSQL(False);

         DmExporterClient.CdsGruposBalanco.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsGruposBalanco.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos de Balanco');
         DmExporterClient.CdsGruposBalanco.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoGruposBalancoDeletados;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOSBALANCO');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Balancos Deletados: '+ FloatToStr(DmExporterClient.CdsDeletados.RecordCount));

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'GRUPOSBALANCO';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_GRUPOBALANCO';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos de Balanco Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoGruposCurvasDeletados;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOSCURVAS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos Curvas Deletados: '+ FloatToStr(DmExporterClient.CdsDeletados.RecordCount));

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'GRUPOSCURVAS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos Curvas Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoGruposCompra;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Grupos
     DmExporterClient.CdsGruposCompra.Close;
     DmExporterClient.CdsGruposCompra.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(131, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsGruposCompra.Data := Dados;
     DmExporterClient.CdsGruposCompra.Open; // virtual
     DmExporterClient.CdsGruposCompra.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Compra: ' + FloatToStr(DmExporterClient.CdsGruposCompra.RecordCount));
     while not DmExporterClient.CdsGruposCompra.Eof do
      begin
          DmExporterClient.SqlAtualizaGruposCompras.Params[0].AsFloat := DmExporterClient.CdsGruposCompraCD_GRUPOCOMPRA.AsFloat;
          DmExporterClient.SqlAtualizaGruposCompras.Params[1].AsString := DmExporterClient.CdsGruposCompraDESCRICAO.AsString;
          DmExporterClient.SqlAtualizaGruposCompras.Params[2].AsString := DmExporterClient.CdsGruposCompraSTATUS.AsString;
          DmExporterClient.SqlAtualizaGruposCompras.Params[3].AsDate := DmExporterClient.CdsGruposCompraDT_ALTERACAO.AsDateTime;
          DmExporterClient.SqlAtualizaGruposCompras.Params[4].AsString := DmExporterClient.CdsGruposCompraENVIADO.AsString;
          DmExporterClient.SqlAtualizaGruposCompras.ExecSQL(False);

          DmExporterClient.CdsGruposCompra.Next;
      end;
     DmExporterClient.CdsGruposCompra.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos de Compra');
         DmExporterClient.CdsGruposCompra.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoGruposCompraDeletados;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOSCOMPRAS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Compras Deletados: ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'GRUPOSCOMPRAS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_GRUPOCOMPRA';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos de Compra Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoGruposCurvas;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Grupos
     DmExporterClient.CdsGruposCurvas.Close;
     DmExporterClient.CdsGruposCurvas.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(132, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsGruposCurvas.Data := Dados;
     DmExporterClient.CdsGruposCurvas.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsGruposCurvas.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos Curvas: ' + FloatToStr(DmExporterClient.CdsGruposCurvas.RecordCount));
     while not DmExporterClient.CdsGruposCurvas.Eof do
      begin
           DmExporterClient.SqlAtualizaGruposCurva.Params[0].AsFloat := DmExporterClient.CdsGruposCurvasCD_FILIAL.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[1].AsFloat := DmExporterClient.CdsGruposCurvasCD_GRUPO.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[2].AsString := DmExporterClient.CdsGruposCurvasGRUPO.AsString;
          DmExporterClient.SqlAtualizaGruposCurva.Params[3].AsFloat := DmExporterClient.CdsGruposCurvasCD_CURVA.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[4].AsString := DmExporterClient.CdsGruposCurvasCURVA.AsString;
          DmExporterClient.SqlAtualizaGruposCurva.Params[5].AsString := DmExporterClient.CdsGruposCurvasSIGLA.AsString;
          DmExporterClient.SqlAtualizaGruposCurva.Params[6].AsFloat := DmExporterClient.CdsGruposCurvasDIASESTOQUE.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[7].AsFloat := DmExporterClient.CdsGruposCurvasESEG.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[8].AsFloat := DmExporterClient.CdsGruposCurvasP1.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[9].AsFloat := DmExporterClient.CdsGruposCurvasP2.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[10].AsFloat := DmExporterClient.CdsGruposCurvasP1SAZ.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[11].AsFloat := DmExporterClient.CdsGruposCurvasP2SAZ.AsFloat;
          DmExporterClient.SqlAtualizaGruposCurva.Params[12].AsDate := DmExporterClient.CdsGruposCurvasDT_ALTERACAO.AsDateTime;
          DmExporterClient.SqlAtualizaGruposCurva.ExecSQL(False);

          DmExporterClient.CdsGruposCurvas.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsGruposCurvas.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos Curvas');
         DmExporterClient.CdsGruposCurvas.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoDistribuidores;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Distribuidores
     DmExporterClient.CdsDistribuidores.Close;
     DmExporterClient.CdsDistribuidores.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(114, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDistribuidores.Data := Dados;
     DmExporterClient.CdsDistribuidores.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsDistribuidores.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Distribuidores: ' + FloatToStr(DmExporterClient.CdsDistribuidores.RecordCount));
     while not DmExporterClient.CdsDistribuidores.Eof do
      begin
          DmExporterClient.SqlAtualizaDistribuidores.Params[0].AsFloat := DmExporterClient.CdsDistribuidoresCD_DISTRIBUIDOR.AsFloat;
          DmExporterClient.SqlAtualizaDistribuidores.Params[1].AsString := DmExporterClient.CdsDistribuidoresNOME.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[2].AsString := DmExporterClient.CdsDistribuidoresAPELIDO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[3].AsString := DmExporterClient.CdsDistribuidoresENDERECO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[4].AsString := DmExporterClient.CdsDistribuidoresBAIRRO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[5].AsString := DmExporterClient.CdsDistribuidoresCIDADE.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[6].AsString := DmExporterClient.CdsDistribuidoresUF.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[7].AsString := DmExporterClient.CdsDistribuidoresCEP.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[8].AsString := DmExporterClient.CdsDistribuidoresCAIXA_POSTAL.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[9].AsString := DmExporterClient.CdsDistribuidoresFONE.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[10].AsString := DmExporterClient.CdsDistribuidoresFAX.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[11].AsString := DmExporterClient.CdsDistribuidoresCONTATO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[12].AsString := DmExporterClient.CdsDistribuidoresCNPJ.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[13].AsString := DmExporterClient.CdsDistribuidoresIE.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[14].AsString := DmExporterClient.CdsDistribuidoresPRACA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[15].AsDateTime := DmExporterClient.CdsDistribuidoresDT_FICHA.AsDateTime;
          DmExporterClient.SqlAtualizaDistribuidores.Params[16].AsString := DmExporterClient.CdsDistribuidoresRG.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[17].AsString := DmExporterClient.CdsDistribuidoresCPF.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[18].AsString := DmExporterClient.CdsDistribuidoresEMPRESA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[19].AsString := DmExporterClient.CdsDistribuidoresFONE_COMERCIAL.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[20].AsString := DmExporterClient.CdsDistribuidoresCEP_COMERCIAL.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[21].AsString := DmExporterClient.CdsDistribuidoresCIDADE_COMERCIAL.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[22].AsString := DmExporterClient.CdsDistribuidoresUF_COMERCIAL.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[23].AsString := DmExporterClient.CdsDistribuidoresREFERENCIA_COMERCIAL.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[24].AsString := DmExporterClient.CdsDistribuidoresREFERENCIA_BANCARIA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[25].AsDateTime := DmExporterClient.CdsDistribuidoresDT_CONSULTA_SPC.AsDateTime;
          DmExporterClient.SqlAtualizaDistribuidores.Params[26].AsString := DmExporterClient.CdsDistribuidoresOBS_SPC.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[27].AsString := DmExporterClient.CdsDistribuidoresTIPO_ATIVIDADE.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[28].AsString := DmExporterClient.CdsDistribuidoresVENDEDOR.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[29].AsString := DmExporterClient.CdsDistribuidoresENDERECO_COBRANCA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[30].AsString := DmExporterClient.CdsDistribuidoresBAIRRO_COBRANCA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[31].AsString := DmExporterClient.CdsDistribuidoresCIDADE_COBRANCA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[32].AsString := DmExporterClient.CdsDistribuidoresUF_COBRANCA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[33].AsString := DmExporterClient.CdsDistribuidoresCEP_COBRANCA.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[34].AsFloat := DmExporterClient.CdsDistribuidoresICM_IPI.AsFloat;
          DmExporterClient.SqlAtualizaDistribuidores.Params[35].AsFloat := DmExporterClient.CdsDistribuidoresLIMITE_CREDITO.AsFloat;
          DmExporterClient.SqlAtualizaDistribuidores.Params[36].AsString := DmExporterClient.CdsDistribuidoresEMAIL.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[37].AsString := DmExporterClient.CdsDistribuidoresHOMEPAGE.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[38].AsFloat := DmExporterClient.CdsDistribuidoresCD_PLANO_CONTAS.AsFloat;
          DmExporterClient.SqlAtualizaDistribuidores.Params[39].AsString := DmExporterClient.CdsDistribuidoresRAZAO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[40].AsDateTime := DmExporterClient.CdsDistribuidoresDT_ALTERACAO.AsDateTime;
          DmExporterClient.SqlAtualizaDistribuidores.Params[41].AsString := DmExporterClient.CdsDistribuidoresARQUIVO_ENVIO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[42].AsString := DmExporterClient.CdsDistribuidoresARQUIVO_RETORNO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[43].AsString := DmExporterClient.CdsDistribuidoresPROGRAMAENVIO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[44].AsFloat := DmExporterClient.CdsDistribuidoresCODIGODICIONARIO.AsFloat;
          DmExporterClient.SqlAtualizaDistribuidores.Params[45].AsString := DmExporterClient.CdsDistribuidoresCODIGOFATURAMENTO.AsString;
          DmExporterClient.SqlAtualizaDistribuidores.Params[46].AsFloat := DmExporterClient.CdsDistribuidoresCFOP.AsFloat;
          DmExporterClient.SqlAtualizaDistribuidores.ExecSQL(False);

          DmExporterClient.CdsDistribuidores.Next;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDistribuidores.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Distribuidores');
         DmExporterClient.CdsDistribuidores.Close;
         Exit;
       end;
   end;
end;



procedure TFrmExporterClient.RecebendoProdutosDeletados;
var Dados : Variant;
begin
  //busca na matriz os produtos deletados
   Try
     // Atualiza produtos
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO2';

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
             DmExporterClient.Sql1.CommandText := 'DELETE FROM PRODUTOS WHERE ID_PRODUTO = ' + DmExporterClient.CdsDeletadosCAMPO2.AsString;
             AbreTransacao;
             DmExporterClient.Sql1.ExecSQL(True);
             ConfirmaTransacao;
             DmExporterClient.CdsDeletados.Next;
          end;
      end;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoGruposDeletados;
var Dados : Variant;
begin
  //busca na matriz os grupos deletados
   Try
     // Atualiza grupos
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'GRUPOS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Grupos Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;



procedure TFrmExporterClient.RecebendoLaboratoriosDeletados;
var Dados : Variant;
begin
  //busca na matriz os laboratorios deletados
   Try
     // Atualiza laboratorios
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'LABORATORIOS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Laboratorios Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'LABORATORIOS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_LABORATORIO';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Laboratorios');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoVendedoresDeletados;
var Dados : Variant;
begin
  //busca na matriz os Vendedores deletados
   Try
     // Atualiza vendedores
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'VENDEDORES');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Vendedores Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'VENDEDORES';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_VENDEDOR';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Vendedores');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoPlanosContasDeletados;
var Dados : Variant;
begin
  //busca na matriz os Plano de Contas deletados
   Try
     // Atualiza Plano de Contas
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PLANO_CONTAS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Planos de Contas Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'PLANO_CONTAS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_PLANO_CONTAS';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Plano de Contas Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoClientesDeletados;
var Dados : Variant;
begin
  //busca na matriz os Clientes deletados
{   Try
     // Atualiza Clientes
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CLIENTES');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Clientes Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.QryClientes.Close;
            DmExporterClient.QryClientes.Params[0].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.QryClientes.Open;
            if DmExporterClient.QryClientes.RecordCount <> 0 then
             begin
               DmExporterClient.QryClientes.Delete;
               AbreTransacao;
               DmExporterClient.QryClientes.ApplyUpdates(0);
               ConfirmaTransacao;
             end;
            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     DmExporterClient.QryClientes.Close;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Clientes Deletados');
         DmExporterClient.QryClientes.Close;
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;}
end;

procedure TFrmExporterClient.RecebendoConveniosDeletados;
var Dados : Variant;
begin
  //busca na matriz os Convênios deletados
   Try
     // Atualiza Convenios
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CONVENIOS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Convenios Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'CONVENIOS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_CONVENIO';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Convenios Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoTransportadorasDeletados;
var Dados : Variant;
begin
  //busca na matriz os Transportadoras deletados
   Try
     // Atualiza Transportadoras
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'TRANSPORTADORAS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Transportadoras Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'TRANSPORTADORAS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_TRANSPORTADORA';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Transportadoras Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoCartoesDeletados;
var Dados : Variant;
begin
  //busca na matriz os Cartões deletados
   Try
     // Atualiza Cartões
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CARTOES');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Cartoes Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'CARTOES';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_CARTAO';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Cartoes Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoDistribuidoresDeletados;
var Dados : Variant;
begin
  //busca na matriz os Distribuidores deletados
   Try
     // Atualiza Distribuidores
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados :=(DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'DISTRIBUIDORES');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Distribuidores Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'DISTRIBUIDORES';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_DISTRIBUIDOR';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Distribuidores Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoFiliaisDeletados;
var Dados : Variant;
begin
  //busca na matriz os Filiais deletados
   Try
     // Atualiza Filiais
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FILIAIS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Filiais Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'FILIAIS';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_FILIAL';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Filiais Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoFormasPagamentoDeletados;
var Dados : Variant;
begin
  //busca na matriz os Formas de Pagamento deletados
   Try
     // Atualiza Formas de Pagamento
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FORMAS_PAGAMENTO');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Formas de Pagamento Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'FORMAS_PAGAMENTO';
            DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_FORMA_PAGAMENTO';
            DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient.CdsDeletadosCAMPO1.AsString;
            DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     ConfirmaTransacao;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Formas Pagamento Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoBalancosDeletados;
var Dados : Variant;
begin
  //busca na matriz os Balancox deletados
   Try
     // Atualiza Balanços
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'BALANCO');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     DmExporterClient.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Balanços Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.QryBalancos.Close;
            DmExporterClient.QryBalancos.Params[0].AsFloat := DmExporterClient.CdsDeletadosCAMPO1.AsFloat;
            DmExporterClient.QryBalancos.Open;
            if DmExporterClient.QryBalancos.RecordCount <> 0 then
             begin
               if DmExporterClient.QryBalancosSTATUS.AsString = 'G' then
                begin
                  while not DmExporterClient.QryBalancos.Eof do
                     DmExporterClient.QryBalancos.Delete;
                  AbreTransacao;
                  DmExporterClient.QryBalancos.ApplyUpdates(0);
                  ConfirmaTransacao;
                end;
             end;
            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     DmExporterClient.QryBalancos.Close;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Balancos Deletados');
         DmExporterClient.QryBalancos.Close;
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoComprasDeletados;
var Dados : Variant;
begin
  //busca na matriz as Compras deletados
   Try
     // Atualiza Compras
     Try
       DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_COMPRAS INACTIVE';
       AbreTransacao;
       DmExporterClient.Sql1.ExecSQL(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
        begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         CancelaTransacao;
        end;
     End;

     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'COMPRAS');
     if (Dados = null) then
      begin
        Try
          DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';
          AbreTransacao;
          DmExporterClient.Sql1.ExecSQL(True);
          ConfirmaTransacao;
        Except
          on E:Exception do
           begin
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            CancelaTransacao;
           end;
        End;
        Exit;
      end;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Compras Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.Sql1.CommandText := 'DELETE FROM COMPRAS WHERE CD_COMPRAS = ' + DmExporterClient.CdsDeletadosCAMPO1.AsString;
            AbreTransacao;
            DmExporterClient.Sql1.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterClient.Sql1.CommandText := 'DELETE FROM ITENS_COMPRA WHERE CD_COMPRAS = ' + DmExporterClient.CdsDeletadosCAMPO1.AsString;
            AbreTransacao;
            DmExporterClient.Sql1.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Compras Deletados');
         DmExporterClient.CdsDeletados.Close;
         Try
           DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';
           AbreTransacao;
           DmExporterClient.Sql1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           on E:Exception do
            begin
             GravaLog(TimetoStr(Time) + ' - ' + E.Message);
             CancelaTransacao;
            end;
         End;
         Exit;
       end;
   end;
  Try
    DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';
    AbreTransacao;
    DmExporterClient.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  Except
    on E:Exception do
     begin
      GravaLog(TimetoStr(Time) + ' - ' + E.Message);
      CancelaTransacao;
     end;
  End;
end;

procedure TFrmExporterClient.RecebendoItensComprasDeletados;
var Dados : Variant;
begin
  //busca na matriz as Itens Compra deletados
   Try
    Try
      DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA INACTIVE';
      AbreTransacao;
      DmExporterClient.Sql1.ExecSQL(True);
      ConfirmaTransacao;
    Except
      on E:Exception do
       begin
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        CancelaTransacao;
       end;
    End;
     // Atualiza Compras
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'ITENS_COMPRA');
     if (Dados = null) then
      begin
        Try
          DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA ACTIVE';
          AbreTransacao;
          DmExporterClient.Sql1.ExecSQL(True);
          ConfirmaTransacao;
        Except
          on E:Exception do
           begin
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            CancelaTransacao;
           end;
        End;
        Exit;
      end;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ItensCompras Deletados - ' + FloatToStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         AbreTransacao;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.Sql1.CommandText := 'DELETE FROM ITENS_COMPRA WHERE CD_COMPRAS = ' + DmExporterClient.CdsDeletadosCAMPO1.AsString +
                                ' AND ID_PRODUTO = ' + DmExporterClient.CdsDeletadosCAMPO2.AsString;
            DmExporterClient.Sql1.ExecSQL(True);
            DmExporterClient.CdsDeletados.Next;
          end;
          ConfirmaTransacao;
      end;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Itens Compra Deletados');
         Try
           DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA ACTIVE';
           AbreTransacao;
           DmExporterClient.Sql1.ExecSQL(True);
           ConfirmaTransacao;
         Except
           on E:Exception do
            begin
             GravaLog(TimetoStr(Time) + ' - ' + E.Message);
             CancelaTransacao;
            end;
         End;
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
  Try
    DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA ACTIVE';
    AbreTransacao;
    DmExporterClient.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  Except
    on E:Exception do
     begin
      GravaLog(TimetoStr(Time) + ' - ' + E.Message);
      CancelaTransacao;
     end;
  End;
end;


procedure TFrmExporterClient.RecebendoMetasFiliaisDeletados;
var Dados : Variant;
begin
  //busca na matriz as Compras deletados
   Try
     // Atualiza Compras
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'METAS_FILIAIS');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasFiliais Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.Sql1.CommandText := 'DELETE FROM METAS_FILIAIS WHERE ID_META = ' + DmExporterClient.CdsDeletadosCAMPO1.AsString;
            AbreTransacao;
            DmExporterClient.Sql1.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Metas Filiais Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoMetasVendedoresDeletados;
var Dados : Variant;
begin
  //busca na matriz as Compras deletados
   Try
     // Atualiza Compras
     DmExporterClient.CdsDeletados.Close;
     DmExporterClient.CdsDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'METAS_VENDEDORES');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsDeletados.Data := Dados;
     DmExporterClient.CdsDeletados.Open; // virtual
     if DmExporterClient.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasVendedores Deletados - ' + FloattoStr(DmExporterClient.CdsDeletados.RecordCount));
         DmExporterClient.CdsDeletados.First;
         while not DmExporterClient.CdsDeletados.Eof do
          begin
            DmExporterClient.Sql1.CommandText := 'DELETE FROM METAS_VENDEDORES WHERE ID_META = ' + DmExporterClient.CdsDeletadosCAMPO1.AsString  +
            ' AND CD_VENDEDOR = ' + DmExporterClient.CdsDeletadosCAMPO2.AsString;
            AbreTransacao;
            DmExporterClient.Sql1.ExecSQL(True);
            ConfirmaTransacao;
            DmExporterClient.CdsDeletados.Next;
          end;
      end;
     DmExporterClient.CdsDeletados.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Metas Vendedores Deletados');
         DmExporterClient.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoPlanosContas;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Planos de Contas incluidos
   Try
     DmExporterClient.CdsPlanoContas.Close;
     DmExporterClient.CdsPlanoContas.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(109, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsPlanoContas.Data := Dados;
     DmExporterClient.CdsPlanoContas.Open; // virtual
     if DmExporterClient.CdsPlanoContas.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Planos de Contas - ' + FloattoStr(DmExporterClient.CdsPlanoContas.RecordCount));
           AbreTransacao;
           DmExporterClient.CdsPlanoContas.First;
           while not DmExporterClient.CdsPlanoContas.Eof do
            begin
              DmExporterClient.SqlAtualizaPlanoContas.Params[0].AsFloat := DmExporterClient.CdsPlanoContasCD_PLANO_CONTAS.AsFloat;
              DmExporterClient.SqlAtualizaPlanoContas.Params[1].AsFloat := DmExporterClient.CdsPlanoContasCD_HISTORICO.AsFloat;
              DmExporterClient.SqlAtualizaPlanoContas.Params[2].AsString := DmExporterClient.CdsPlanoContasHISTORICO.AsString;
              DmExporterClient.SqlAtualizaPlanoContas.Params[3].AsString := DmExporterClient.CdsPlanoContasGRAU.AsString;
              DmExporterClient.SqlAtualizaPlanoContas.Params[4].AsString := DmExporterClient.CdsPlanoContasSISTEMA.AsString;
              DmExporterClient.SqlAtualizaPlanoContas.Params[5].AsString := DmExporterClient.CdsPlanoContasTIPO_CONTA.AsString;
              DmExporterClient.SqlAtualizaPlanoContas.Params[6].AsInteger := DmExporterClient.CdsPlanoContasAPURACAO.AsInteger;
              DmExporterClient.SqlAtualizaPlanoContas.Params[7].AsString := DmExporterClient.CdsPlanoContasENVIADO.AsString;
              DmExporterClient.SqlAtualizaPlanoContas.ExecSQL(False);

              DmExporterClient.CdsPlanoContas.Next;
            end;
           ConfirmaTransacao;
           DmExporterClient.CdsPlanoContas.Close;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Plano de Contas');
         DmExporterClient.CdsPlanoContas.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoConvenios;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Convenios
   Try
     DmExporterClient.CdsConvenios.Close;
     DmExporterClient.CdsConvenios.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(111, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsConvenios.Data := Dados;
     DmExporterClient.CdsConvenios.Open; // virtual
     if DmExporterClient.CdsConvenios.RecordCount > 0 then
       begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Convenios - ' + FloatToStr(DmExporterClient.CdsConvenios.RecordCount));
         AbreTransacao;
         DmExporterClient.CdsConvenios.First;
         while not DmExporterClient.CdsConvenios.Eof do
          begin
            DmExporterClient.SqlAtualizaConvenios.Params[0].AsFloat := DmExporterClient.CdsConveniosCD_CONVENIO.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[1].AsString := DmExporterClient.CdsConveniosNOME.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[2].AsString := DmExporterClient.CdsConveniosRAZAO.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[3].AsString := DmExporterClient.CdsConveniosENDERECO.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[4].AsString := DmExporterClient.CdsConveniosBAIRRO.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[5].AsString := DmExporterClient.CdsConveniosCIDADE.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[6].AsString := DmExporterClient.CdsConveniosUF.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[7].AsString := DmExporterClient.CdsConveniosCEP.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[8].AsString := DmExporterClient.CdsConveniosCAIXA_POSTAL.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[9].AsString := DmExporterClient.CdsConveniosFONE.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[10].AsString := DmExporterClient.CdsConveniosFAX.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[11].AsString := DmExporterClient.CdsConveniosCONTATO.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[12].AsString := DmExporterClient.CdsConveniosCNPJ.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[13].AsString := DmExporterClient.CdsConveniosIE.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[14].AsString := DmExporterClient.CdsConveniosPRACA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[15].AsDate := DmExporterClient.CdsConveniosDT_FICHA.AsDateTime;
            DmExporterClient.SqlAtualizaConvenios.Params[16].AsString := DmExporterClient.CdsConveniosRG.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[17].AsString := DmExporterClient.CdsConveniosCPF.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[18].AsString := DmExporterClient.CdsConveniosEMPRESA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[19].AsString := DmExporterClient.CdsConveniosFONE_COMERCIAL.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[20].AsString := DmExporterClient.CdsConveniosCEP_COMERCIAL.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[21].AsString := DmExporterClient.CdsConveniosCIDADE_COMERCIAL.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[22].AsString := DmExporterClient.CdsConveniosUF_COMERCIAL.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[23].AsString := DmExporterClient.CdsConveniosREFERENCIA_COMERCIAL.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[24].AsString := DmExporterClient.CdsConveniosREFERENCIA_BANCARIA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[25].AsDate := DmExporterClient.CdsConveniosDT_CONSULTA_SPC.AsDateTime;
            DmExporterClient.SqlAtualizaConvenios.Params[26].AsString := DmExporterClient.CdsConveniosOBS_SPC.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[27].AsString := DmExporterClient.CdsConveniosTIPO_ATIVIDADE.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[28].AsFloat := DmExporterClient.CdsConveniosCD_VENDEDOR.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[29].AsString := DmExporterClient.CdsConveniosENDERECO_COBRANCA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[30].AsString := DmExporterClient.CdsConveniosBAIRRO_COBRANCA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[31].AsString := DmExporterClient.CdsConveniosCIDADE_COBRANCA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[32].AsString := DmExporterClient.CdsConveniosUF_COBRANCA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[33].AsString := DmExporterClient.CdsConveniosCEP_COBRANCA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[34].AsFloat := DmExporterClient.CdsConveniosICM_IPI.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[35].AsFloat := DmExporterClient.CdsConveniosLIMITE_CREDITO.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[36].AsString := DmExporterClient.CdsConveniosEMAIL.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[37].AsString := DmExporterClient.CdsConveniosHOMEPAGE.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[38].AsString := DmExporterClient.CdsConveniosMULTI.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[39].AsFloat := DmExporterClient.CdsConveniosTX_DESCONTO.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[40].AsFloat := DmExporterClient.CdsConveniosDT_VENCIMENTO.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[41].AsFloat := DmExporterClient.CdsConveniosDT_FECHAMENTO.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[42].AsFloat := DmExporterClient.CdsConveniosSALDO.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[43].AsFloat := DmExporterClient.CdsConveniosJAN.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[44].AsFloat := DmExporterClient.CdsConveniosFEV.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[45].AsFloat := DmExporterClient.CdsConveniosMAR.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[46].AsFloat := DmExporterClient.CdsConveniosABR.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[47].AsFloat := DmExporterClient.CdsConveniosMAI.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[48].AsFloat := DmExporterClient.CdsConveniosJUN.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[49].AsFloat := DmExporterClient.CdsConveniosJUL.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[50].AsFloat := DmExporterClient.CdsConveniosAGO.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[51].AsFloat := DmExporterClient.CdsConveniosSET_.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[52].AsFloat := DmExporterClient.CdsConveniosOUT.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[53].AsFloat := DmExporterClient.CdsConveniosNOV.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[54].AsFloat := DmExporterClient.CdsConveniosDEZ.AsFloat;
            DmExporterClient.SqlAtualizaConvenios.Params[55].AsDate := DmExporterClient.CdsConveniosDT_ALTERACAO.AsDateTime;
            DmExporterClient.SqlAtualizaConvenios.Params[56].AsString := DmExporterClient.CdsConveniosUSUARIOSITE.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[57].AsString := DmExporterClient.CdsConveniosSENHASITE.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[58].AsString := DmExporterClient.CdsConveniosPERMITEPARCELAMENTO.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[59].AsString := DmExporterClient.CdsConveniosPAGACOMISSAO.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[60].AsString := DmExporterClient.CdsConveniosPAGAAVISTA.AsString;
            DmExporterClient.SqlAtualizaConvenios.Params[61].AsString := DmExporterClient.CdsConveniosSTATUS.AsString;
            DmExporterClient.SqlAtualizaConvenios.ExecSQL(False);

            DmExporterClient.CdsConvenios.Next;
          end;
       end;
     ConfirmaTransacao;
     DmExporterClient.CdsConvenios.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Convenios');
         DmExporterClient.CdsConvenios.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoTransportadoras;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Transportadoras
   Try
     DmExporterClient.CdsTransportadoras.Close;
     DmExporterClient.CdsTransportadoras.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(112, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsTransportadoras.Data := Dados;
     DmExporterClient.CdsTransportadoras.Open; // virtual
     if DmExporterClient.CdsTransportadoras.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Transportadoras - ' + FloattoStr(DmExporterClient.CdsTransportadoras.RecordCount));
           AbreTransacao;
           DmExporterClient.CdsTransportadoras.First;
           while not DmExporterClient.CdsTransportadoras.Eof do
            begin
              DmExporterClient.SqlAtualizaTransportadoras.Params[0].AsFloat := DmExporterClient.CdsTransportadorasCD_TRANSPORTADORA.AsFloat;
              DmExporterClient.SqlAtualizaTransportadoras.Params[1].AsString := DmExporterClient.CdsTransportadorasNOME.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[2].AsString := DmExporterClient.CdsTransportadorasRAZAO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[3].AsString := DmExporterClient.CdsTransportadorasCNPJ.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[4].AsString := DmExporterClient.CdsTransportadorasINSCRICAO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[5].AsString := DmExporterClient.CdsTransportadorasENDERECO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[6].AsString := DmExporterClient.CdsTransportadorasNUMERO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[7].AsString := DmExporterClient.CdsTransportadorasCOMPLEMENTO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[8].AsString := DmExporterClient.CdsTransportadorasBAIRRO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[9].AsString := DmExporterClient.CdsTransportadorasCIDADE.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[10].AsString := DmExporterClient.CdsTransportadorasUF.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[11].AsString := DmExporterClient.CdsTransportadorasCEP.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[12].AsString := DmExporterClient.CdsTransportadorasCD_MUNICIPIO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[13].AsString := DmExporterClient.CdsTransportadorasFONE.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[14].AsString := DmExporterClient.CdsTransportadorasFAX.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[15].AsString := DmExporterClient.CdsTransportadorasCAIXA_POSTAL.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[16].AsString := DmExporterClient.CdsTransportadorasCONTATO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[17].AsString := DmExporterClient.CdsTransportadorasEMAIL.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[18].AsString := DmExporterClient.CdsTransportadorasURL.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[19].AsString := DmExporterClient.CdsTransportadorasCD_PAIS.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[20].AsString := DmExporterClient.CdsTransportadorasPAIS.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.Params[21].AsDateTime := DmExporterClient.CdsTransportadorasDT_ALTERACAO.AsDateTime;
              DmExporterClient.SqlAtualizaTransportadoras.Params[22].AsString := DmExporterClient.CdsTransportadorasENVIADO.AsString;
              DmExporterClient.SqlAtualizaTransportadoras.ExecSQL(False);

              DmExporterClient.CdsTransportadoras.Next;
            end;
           ConfirmaTransacao;
           DmExporterClient.CdsTransportadoras.Close;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Transportadoras');
         DmExporterClient.CdsTransportadoras.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoCartoes;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Cartoes
   Try
     DmExporterClient.CdsCartoes.Close;
     DmExporterClient.CdsCartoes.CreateDataSet;
     DAdos := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(113, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsCartoes.Data := Dados;
     DmExporterClient.CdsCartoes.Open; // virtual
     if DmExporterClient.CdsCartoes.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Cartoes - ' + FloattoStr(DmExporterClient.CdsCartoes.RecordCount));
           AbreTransacao;
           DmExporterClient.CdsCartoes.First;
           while not DmExporterClient.CdsCartoes.Eof do
            begin
              DmExporterClient.SqlAtualizaCartoes.Params[0].AsFloat := DmExporterClient.CdsCartoesCD_CARTAO.AsFloat;
              DmExporterClient.SqlAtualizaCartoes.Params[1].AsFloat := DmExporterClient.CdsCartoesCD_CONTA.AsFloat;
              DmExporterClient.SqlAtualizaCartoes.Params[2].AsString := DmExporterClient.CdsCartoesDESCRICAO.AsString;
              DmExporterClient.SqlAtualizaCartoes.Params[3].AsString := DmExporterClient.CdsCartoesTIPO_CARTAO.AsString;
              DmExporterClient.SqlAtualizaCartoes.Params[4].AsFloat := DmExporterClient.CdsCartoesTX_ADM.AsFloat;
              DmExporterClient.SqlAtualizaCartoes.Params[5].AsFloat := DmExporterClient.CdsCartoesTX_ADM_PARC.AsFloat;
              DmExporterClient.SqlAtualizaCartoes.Params[6].AsFloat := DmExporterClient.CdsCartoesPRAZO_PG.AsFloat;
              DmExporterClient.SqlAtualizaCartoes.Params[7].AsFloat := DmExporterClient.CdsCartoesIMAGEM.AsFloat;
              DmExporterClient.SqlAtualizaCartoes.Params[8].AsString := DmExporterClient.CdsCartoesUSATEF.AsString;
              DmExporterClient.SqlAtualizaCartoes.Params[9].AsString := DmExporterClient.CdsCartoesTRNCENTRE.AsString;
              DmExporterClient.SqlAtualizaCartoes.Params[10].AsString := DmExporterClient.CdsCartoesFIDELIZE.AsString;
              DmExporterClient.SqlAtualizaCartoes.Params[11].AsString := DmExporterClient.CdsCartoesHIPERCARD.AsString;
              DmExporterClient.SqlAtualizaCartoes.Params[12].AsString := DmExporterClient.CdsCartoesREDEVESPAGUE.AsString;
              DmExporterClient.SqlAtualizaCartoes.Params[13].AsString := DmExporterClient.CdsCartoesENVIADO.AsString;
              DmExporterClient.SqlAtualizaCartoes.ExecSQL(False);

              DmExporterClient.CdsCartoes.Next;
            end;
           ConfirmaTransacao;
           DmExporterClient.CdsCartoes.Close;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Cartoes');
         DmExporterClient.CdsCartoes.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoFiliais;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz as Filiais
   Try
     DmExporterClient.CdsFiliais.Close;
     DmExporterClient.CdsFiliais.CreateDataSet;
     DAdos := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(115, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsFiliais.Data := Dados;
     DmExporterClient.CdsFiliais.Open; // virtual
     if DmExporterClient.CdsFiliais.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Filiais - ' + FloattoStr(DmExporterClient.CdsFiliais.RecordCount));
           AbreTransacao;
           DmExporterClient.CdsFiliais.First;
           while not DmExporterClient.CdsFiliais.Eof do
            begin
              DmExporterClient.SqlAtualizaFiliais.Params[0].AsFloat := DmExporterClient.CdsFiliaisCD_FILIAL.AsFloat;
              DmExporterClient.SqlAtualizaFiliais.Params[1].AsString := DmExporterClient.CdsFiliaisNOME.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[2].AsString := DmExporterClient.CdsFiliaisRAZAO.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[3].AsString := DmExporterClient.CdsFiliaisCNPJ.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[4].AsString := DmExporterClient.CdsFiliaisINSCRICAO.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[5].AsString := DmExporterClient.CdsFiliaisRUA.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[6].AsString := DmExporterClient.CdsFiliaisNUMERO.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[7].AsString := DmExporterClient.CdsFiliaisCOMPLEMENTO.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[8].AsString := DmExporterClient.CdsFiliaisBAIRRO.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[9].AsString := DmExporterClient.CdsFiliaisCIDADE.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[10].AsString := DmExporterClient.CdsFiliaisUF.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[11].AsString := DmExporterClient.CdsFiliaisCEP.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[12].AsString := DmExporterClient.CdsFiliaisFONE.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[13].AsString := DmExporterClient.CdsFiliaisFONE_1.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[14].AsString := DmExporterClient.CdsFiliaisFAX.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[15].AsString := DmExporterClient.CdsFiliaisCONTATO.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[16].AsFloat := DmExporterClient.CdsFiliaisCD_DISTRIBUIDOR.AsFloat;
              DmExporterClient.SqlAtualizaFiliais.Params[17].AsFloat := DmExporterClient.CdsFiliaisCD_CLIENTE.AsFloat;
              DmExporterClient.SqlAtualizaFiliais.Params[18].AsString := DmExporterClient.CdsFiliaisENDERECOWEB.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[19].AsString := DmExporterClient.CdsFiliaisEXPORTAR.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[20].AsFloat := DmExporterClient.CdsFiliaisMETROSQUADRADOS.AsFloat;
              DmExporterClient.SqlAtualizaFiliais.Params[21].AsFloat := DmExporterClient.CdsFiliaisNUMEROFUNCIONARIOS.AsFloat;
              DmExporterClient.SqlAtualizaFiliais.Params[22].AsFloat := DmExporterClient.CdsFiliaisNUMEROPDVS.AsFloat;
              DmExporterClient.SqlAtualizaFiliais.Params[23].AsString := DmExporterClient.CdsFiliaisSTATUS.AsString;
              DmExporterClient.SqlAtualizaFiliais.Params[24].AsString := DmExporterClient.CdsFiliaisCD_MUNICIPIO.AsString;
              DmExporterClient.SqlAtualizaFiliais.ExecSQL(False);

              DmExporterClient.CdsFiliais.Next;
            end;
           ConfirmaTransacao;
           DmExporterClient.CdsFiliais.Close;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Filiais');
         DmExporterClient.CdsFiliais.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoBalancos;
var i : integer;
    Dados : Variant;
begin
  //Busca na matriz os Balancos
   Try
     DmExporterClient.CdsBalancos.Close;
     DmExporterClient.CdsBalancos.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(126, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsBalancos.Data := Dados;
     DmExporterClient.CdsBalancos.Open; // virtual
     if DmExporterClient.CdsBalancos.RecordCount > 0 then
        begin
           AbreTransacao;
           DmExporterClient.CdsBalancos.First;
           while not DmExporterClient.CdsBalancos.Eof do
            begin
              DmExporterClient.SqlAtualizaBalancoLoja.Params[0].AsFloat := DmExporterClient.CdsBalancosID_BALANCO.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[1].AsFloat := DmExporterClient.CdsBalancosID_MOTIVO.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[2].AsDate := DmExporterClient.CdsBalancosDATA.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[3].AsTime := DmExporterClient.CdsBalancosHORA.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[4].AsDate := DmExporterClient.CdsBalancosDATA_ABERTURA.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[5].AsTime := DmExporterClient.CdsBalancosHORA_ABERTURA.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[6].AsDate := DmExporterClient.CdsBalancosDATA_CONTAGEM.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[7].AsTime := DmExporterClient.CdsBalancosHORA_CONTAGEM.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[8].AsDate := DmExporterClient.CdsBalancosDATA_CONCLUSAO.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[9].AsTime := DmExporterClient.CdsBalancosHORA_CONCLUSAO.AsDateTime;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[10].AsFloat := DmExporterClient.CdsBalancosCD_FILIAL.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[11].AsFloat := DmExporterClient.CdsBalancosID_PRODUTO.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[12].AsString := DmExporterClient.CdsBalancosCD_PRODUTO.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[13].AsString := DmExporterClient.CdsBalancosCODIGO_BARRAS_1.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[14].AsString := DmExporterClient.CdsBalancosCODIGO_BARRAS_2.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[15].AsString := DmExporterClient.CdsBalancosDESCRICAO.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[16].AsFloat := DmExporterClient.CdsBalancosCD_GRUPO.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[17].AsString := DmExporterClient.CdsBalancosGRUPO.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[18].AsFloat := DmExporterClient.CdsBalancosCD_LABORATORIO.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[19].AsString := DmExporterClient.CdsBalancosLABORATORIO.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[20].AsFloat := DmExporterClient.CdsBalancosCD_CLASSE.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[21].AsString := DmExporterClient.CdsBalancosCLASSE.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[22].AsFloat := DmExporterClient.CdsBalancosCUSTO_UNITARIO.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[23].AsFloat := DmExporterClient.CdsBalancosPRECO_VENDA.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[24].AsFloat := DmExporterClient.CdsBalancosPRECO_VENDA_ANTERIOR.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[25].AsFloat := DmExporterClient.CdsBalancosESTOQUE.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[26].AsFloat := DmExporterClient.CdsBalancosESTOQUE_ANTERIOR.AsFloat;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[27].AsString := DmExporterClient.CdsBalancosSUBSTITUIESTOQUE.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[28].AsString := DmExporterClient.CdsBalancosSTATUS.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.Params[29].AsString := DmExporterClient.CdsBalancosENVIADO.AsString;
              DmExporterClient.SqlAtualizaBalancoLoja.ExecSQL(False);

              DmExporterClient.CdsBalancos.Next;
            end;
           ConfirmaTransacao;
           DmExporterClient.CdsBalancos.Close;
        end;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Balancos');
         DmExporterClient.CdsBalancos.Close;
         Exit;
       end;
   end;
end;


function TFrmExporterClient.EnviandoBalancosFilial : Boolean;
var
 Dados : Variant;
 Sql : String;
begin
  //processamento e envio de Balancos Concluidos
  Try
      Result := True;
      Try
          DmExporterClient.CdsBalancosFilial.Close;
          Sql := 'SELECT ID_BALANCO, DATA, HORA, DATA_ABERTURA, HORA_ABERTURA, DATA_CONCLUSAO, HORA_CONCLUSAO, '+
                 'CD_FILIAL, ID_PRODUTO, CD_PRODUTO, CODIGO_BARRAS_1, DESCRICAO, CD_GRUPO, GRUPO, CD_LABORATORIO,'+
                 'LABORATORIO, CD_CLASSE, CLASSE, CAST(CUSTO_UNITARIO AS NUMERIC(10,2)) AS CUSTO_UNITARIO,'+
                 'CAST(PRECO_VENDA AS NUMERIC(10,2)) AS PRECO_VENDA, CAST(PRECO_VENDA_ANTERIOR AS NUMERIC(10,2)) AS PRECO_VENDA_ANTERIOR,'+
                 'ESTOQUE, ESTOQUE_ANTERIOR, SUBSTITUIESTOQUE, STATUS, ENVIADO ' +
                 'FROM BALANCO WHERE ENVIADO = ' + QuotedStr('9');

          DmExporterClient.SqlBalancosFilial.CommandText := 'INSERT INTO TEMP_BALANCO SELECT FIRST 2000 ID_BALANCO, ID_PRODUTO FROM BALANCO WHERE (ENVIADO = ' + QuotedStr('C') + ') OR (ENVIADO = ' + QuotedStr('A') + ')';
          AbreTransacao;
          DmExporterClient.SqlBalancosFilial.ExecSQL;
          ConfirmaTransacao;

          DmExporterClient.SqlBalancosFilial.CommandText := 'UPDATE BALANCO SET ENVIADO = ' + QuotedStr('9') + ' WHERE ' +
                                                            ' ID_BALANCO IN ' +
                                                            ' (SELECT ID_BALANCO FROM TEMP_BALANCO) AND ' +
                                                            ' ID_PRODUTO IN ' +
                                                            ' (SELECT ID_PRODUTO FROM TEMP_BALANCO)';
          AbreTransacao;
          DmExporterClient.SqlBalancosFilial.ExecSQL;
          ConfirmaTransacao;

          DmExporterClient.SqlBalancosFilial.CommandText := Sql;
          AbreTransacao;
          DmExporterClient.CdsBalancosFilial.Open;
          ConfirmaTransacao;

          if DmExporterClient.CdsBalancosFilial.RecordCount > 0 then
           begin
             GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Balancos Filial - ' + FloattoStr(DmExporterClient.CdsBalancosFilial.RecordCount));
             Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(51, Filial, DmExporterClient.CdsBalancosFilial.Data);
             DmExporterClient.CdsBalancosFilial.Close;
             DmExporterClient.SqlBalancosFilial.CommandText := 'UPDATE BALANCO SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');
             AbreTransacao;
             DmExporterClient.SqlBalancosFilial.ExecSQL;
             ConfirmaTransacao;

             DmExporterClient.SqlBalancosFilial.CommandText := 'DELETE FROM TEMP_BALANCO' ;
             AbreTransacao;
             DmExporterClient.SqlBalancosFilial.ExecSQL;
             ConfirmaTransacao;
             Result := True;
           end
          else
           begin
             Result := False;
           end;
          DmExporterClient.CdsBalancosFilial.Close;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Balancos Filial ');
            DmExporterClient.CdsBalancosFilial.Close;
            Result := False;
            Exit;
          end;
      End;
  Finally
  End;
end;


function TFrmExporterClient.EnviandoContasReceberDeletados : Boolean;
var
 Dados : Variant;
 Sql : String;
begin
  //processamento e envio de Contas a Receber Deletados
  Try
      Result := True;
      Try
          DmExporterClient2.CdsCRDeletados.Close;
          Sql := DmExporterClient2.SqlCRDeletados.CommandText;

          DmExporterClient2.SqlCRDeletados.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE PROCESSO = 64';
          AbreTransacao;
          DmExporterClient2.SqlCRDeletados.ExecSQL;
          ConfirmaTransacao;

          DmExporterClient2.SqlCRDeletados.CommandText := Sql;
          AbreTransacao;
          DmExporterClient2.CdsCRDeletados.Open;
          ConfirmaTransacao;

          if DmExporterClient2.CdsCRDeletados.RecordCount > 0 then
           begin
             GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Contas Receber Deletados - ' + FloattoStr(DmExporterClient2.CdsCRDeletados.RecordCount));
             Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(64, Filial, DmExporterClient2.CdsCRDeletados.Data);
             DmExporterClient2.CdsCRDeletados.Close;
             DmExporterClient2.SqlCRDeletados.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 64 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 64)';
             AbreTransacao;
             DmExporterClient2.SqlCRDeletados.ExecSQL;
             ConfirmaTransacao;

             DmExporterClient2.SqlCRDeletados.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 64' ;
             AbreTransacao;
             DmExporterClient2.SqlCRDeletados.ExecSQL;
             ConfirmaTransacao;
           end
          else
           begin
             Result := False;
           end;
          DmExporterClient2.CdsCRDeletados.Close;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Contas Receber Deletados ');
            DmExporterClient2.CdsCRDeletados.Close;
            Result := False;
            Exit;
          end;
      End;
  Finally
  End;
end;

procedure TFrmExporterClient.EnviandoComprasDeletadas;
var Dados : Variant;
begin
  //processamento e envio de Balancos Concluidos
  Try
      Try
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('COMPRAS');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;

        AbreTransacao;
        DmExporterClient.CdsComprasDeletadas.Open;
        ConfirmaTransacao;
        if DmExporterClient.CdsComprasDeletadas.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Compras Deletadas - ' + FloattoStr(DmExporterClient.CdsComprasDeletadas.RecordCount));
            Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(53, Filial, DmExporterClient.CdsComprasDeletadas.Data);
         end;

        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('COMPRAS');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Compras Deletadas ');
            DmExporterClient.CdsComprasDeletadas.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure TFrmExporterClient.EnviandoContasPagarDeletadas;
var Dados : Variant;
begin
  //processamento e envio de Balancos Concluidos
  Try
      Try
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('CONTAS_PAGAR');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;

        AbreTransacao;
        DmExporterClient2.CdsContasPagarDeletadas.Open;
        ConfirmaTransacao;
        if DmExporterClient2.CdsContasPagarDeletadas.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Contas a Pagar Deletadas - ' + FloattoStr(DmExporterClient2.CdsContasPagarDeletadas.RecordCount));
            Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(61, Filial, DmExporterClient2.CdsContasPagarDeletadas.Data);
         end;

        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('CONTAS_PAGAR');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Contas a Pagar Deletadas ');
            DmExporterClient2.CdsContasPagarDeletadas.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure TFrmExporterClient.EnviandoClientesDeletados;
var Dados : Variant;
begin
  //processamento e envio de Clientes Deletados
  Try
      Try
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('CLIENTES');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;

        AbreTransacao;
        DmExporterClient.CdsClientesDeletados.Open;
        ConfirmaTransacao;
        if DmExporterClient.CdsClientesDeletados.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Clientes Deletados - ' + FloattoStr(DmExporterClient.CdsClientesDeletados.RecordCount));
            Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(62, Filial, DmExporterClient.CdsClientesDeletados.Data);
         end;

        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('CLIENTES');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Clientes Deletados ');
            DmExporterClient.CdsClientesDeletados.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;

procedure TFrmExporterClient.EnviandoSintegraNFEntrada;
var Dados : Variant;
begin
  //processamento e envio de Sintegra_NF_Entrada Deletados
  Try
      Try
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('SINTEGRA_NF_ENTRADA');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;

        AbreTransacao;
        DmExporterClient2.CdsSintegraNFEntradaDeletados.Open;
        ConfirmaTransacao;
        if DmExporterClient2.CdsSintegraNFEntradaDeletados.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Clientes Deletados - ' + FloattoStr(DmExporterClient2.CdsSintegraNFEntradaDeletados.RecordCount));
            Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(65, Filial, DmExporterClient2.CdsSintegraNFEntradaDeletados.Data);
         end;

        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('SINTEGRA_NF_ENTRADA');
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Clientes Deletados ');
            DmExporterClient2.CdsSintegraNFEntradaDeletados.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure TFrmExporterClient.EnviandoProdutosTotais;
var
 Dados : Variant;
 Mes : Integer;
begin
  Try
      Try
        DmExporterClient2.CdsProdutosTotais.Close;
        Mes := StrtoInt(FormatDateTime('mm', Date));
        case Mes of
          1  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.JANVENDA, PRODUTOS_TOTAIS.JANCOMPRA';
          2  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.FEVVENDA, PRODUTOS_TOTAIS.FEVCOMPRA';
          3  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.MARVENDA, PRODUTOS_TOTAIS.MARCOMPRA';
          4  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.ABRVENDA, PRODUTOS_TOTAIS.ABRCOMPRA';
          5  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.MAIVENDA, PRODUTOS_TOTAIS.MAICOMPRA';
          6  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.JUNVENDA, PRODUTOS_TOTAIS.JUNCOMPRA';
          7  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.JULVENDA, PRODUTOS_TOTAIS.JULCOMPRA';
          8  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.AGOVENDA, PRODUTOS_TOTAIS.AGOCOMPRA';
          9  : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.SETVENDA, PRODUTOS_TOTAIS.SETCOMPRA';
          10 : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.OUTVENDA, PRODUTOS_TOTAIS.OUTCOMPRA';
          11 : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.NOVVENDA, PRODUTOS_TOTAIS.NOVCOMPRA';
          12 : DmExporterClient2.SqlProdutosTotais.CommandText := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.DEZVENDA, PRODUTOS_TOTAIS.DEZCOMPRA';
        end;

        DmExporterClient2.SqlProdutosTotais.CommandText := DmExporterClient2.SqlProdutosTotais.CommandText +
        ' FROM PRODUTOS_TOTAIS WHERE PRODUTOS_TOTAIS.CD_FILIAL = ' + InttoStr(Filial) + ' AND (PRODUTOS_TOTAIS.ENVIADO IS NULL OR PRODUTOS_TOTAIS.ENVIADO <> ' + QuotedStr('2') + ')';

        AbreTransacao;
        DmExporterClient2.CdsProdutosTotais.Open;
        ConfirmaTransacao;
        if DmExporterClient2.CdsProdutosTotais.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Produtos Totais - ' + FloattoStr(DmExporterClient2.CdsProdutosTotais.RecordCount));
            Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(54, Filial, DmExporterClient2.CdsProdutosTotais.Data);
            DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 INACTIVE';
            DmExporterClient.Sql1.ExecSQL(True);
            DmExporterClient.Sql1.CommandText := 'UPDATE PRODUTOS_TOTAIS SET ENVIADO = ' + QuotedStr('2') + ' WHERE CD_FILIAL = ' + InttoStr(Filial);
            DmExporterClient.Sql1.ExecSQL(True);
            DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 ACTIVE';
            DmExporterClient.Sql1.ExecSQL(True);
         end;
      Except
        on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Produtos Totais ');
            DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 ACTIVE';
            DmExporterClient.Sql1.ExecSQL(True);
            DmExporterClient2.CdsProdutosTotais.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;

procedure TFrmExporterClient.RecebendoUsuarios;
var i : integer;
Dados : Variant;
begin
   Try
     Try
       DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 INACTIVE';
       AbreTransacao;
       DmExporterClient.Sql1.ExecSql(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
        begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         CancelaTransacao;
        end;
     End;

     DmExporterClient2.CdsUsuarios.Close;
     DmExporterClient2.CdsUsuarios.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(142, Filial, 'A');
     if (Dados = null) then
      begin
        Try
          DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
          AbreTransacao;
          DmExporterClient.Sql1.ExecSql(True);
          ConfirmaTransacao;
        Except
          on E:Exception do
           begin
            GravaLog(TimetoStr(Time) + ' - ' + E.Message);
            CancelaTransacao;
           end;
        End;
        Exit;
      end;
     DmExporterClient2.CdsUsuarios.Data := Dados;
     DmExporterClient2.CdsUsuarios.Open; // virtual
     DmExporterClient2.CdsUsuarios.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Usuarios: '+ FloatToStr(DmExporterClient2.CdsUsuarios.RecordCount));
     while not DmExporterClient2.CdsUsuarios.Eof do
      begin
        DmExporterClient2.QryUsuarios.Close;
        DmExporterClient2.QryUsuarios.Params[0].AsFloat := DmExporterClient2.CdsUsuariosCD_USUARIO.AsFloat;
        DmExporterClient2.QryUsuarios.Open;
        if DmExporterClient2.QryUsuarios.RecordCount = 0 then
           DmExporterClient2.QryUsuarios.Append
        else
           DmExporterClient2.QryUsuarios.Edit;
         for i := 0 to DmExporterClient2.QryUsuarios.FieldCount - 1 do
            DmExporterClient2.QryUsuarios.Fields[i].Value := DmExporterClient2.CdsUsuarios.Fields[i].Value;
         DmExporterClient2.QryUsuarios.Post;
         AbreTransacao;
         DmExporterClient2.QryUsuarios.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsUsuarios.Next;
      end;
     DmExporterClient2.CdsUsuarios.Close;
     DmExporterClient2.QryUsuarios.Close;

     Try
       DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
       AbreTransacao;
       DmExporterClient.Sql1.ExecSql(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
        begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         CancelaTransacao;
        end;
     End;

   Except
      on E:Exception do
       begin
         CancelaTransacao;
         
         Try
           DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
           AbreTransacao;
           DmExporterClient.Sql1.ExecSql(True);
           ConfirmaTransacao;
         Except
           on E:Exception do
            begin
             GravaLog(TimetoStr(Time) + ' - ' + E.Message);
             CancelaTransacao;
            end;
         End;

         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Usuarios');
         DmExporterClient2.CdsUsuarios.Close;
         DmExporterClient2.QryUsuarios.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoPermissoes;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient2.CdsPermissoes.Close;
     DmExporterClient2.CdsPermissoes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(143, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient2.CdsPermissoes.Data := Dados;
     DmExporterClient2.CdsPermissoes.Open; // virtual
     DmExporterClient2.CdsPermissoes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Permissoes: '+ FloatToStr(DmExporterClient2.CdsPermissoes.RecordCount));
     while not DmExporterClient2.CdsPermissoes.Eof do
      begin
        DmExporterClient2.QryPermissoes.Close;
        DmExporterClient2.QryPermissoes.Params[0].AsFloat := DmExporterClient2.CdsPermissoesCD_PERMISSAO.AsFloat;
        DmExporterClient2.QryPermissoes.Open;
        if DmExporterClient2.QryPermissoes.RecordCount = 0 then
           DmExporterClient2.QryPermissoes.Append
        else
           DmExporterClient2.QryPermissoes.Edit;
         for i := 0 to DmExporterClient2.QryPermissoes.FieldCount - 1 do
            DmExporterClient2.QryPermissoes.Fields[i].Value := DmExporterClient2.CdsPermissoes.Fields[i].Value;
         DmExporterClient2.QryPermissoes.Post;
         AbreTransacao;
         DmExporterClient2.QryPermissoes.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsPermissoes.Next;
      end;
     DmExporterClient2.CdsPermissoes.Close;
     DmExporterClient2.QryPermissoes.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Permissoes');
         DmExporterClient2.CdsPermissoes.Close;
         DmExporterClient2.QryPermissoes.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoPermissoesModulos;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient2.CdsPermissoesModulos.Close;
     DmExporterClient2.CdsPermissoesModulos.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(144, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient2.CdsPermissoesModulos.Data := Dados;
     DmExporterClient2.CdsPermissoesModulos.Open; // virtual
     DmExporterClient2.CdsPermissoesModulos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Permissoes Modulos: '+ FloatToStr(DmExporterClient2.CdsPermissoesModulos.RecordCount));
     while not DmExporterClient2.CdsPermissoesModulos.Eof do
      begin
        DmExporterClient2.QryPermissoesModulos.Close;
        DmExporterClient2.QryPermissoesModulos.Params[0].AsFloat := DmExporterClient2.CdsPermissoesModulosCD_PERMISSAO.AsFloat;
        DmExporterClient2.QryPermissoesModulos.Params[1].AsFloat := DmExporterClient2.CdsPermissoesModulosCD_MODULO.AsFloat;
        DmExporterClient2.QryPermissoesModulos.Open;
        if DmExporterClient2.QryPermissoesModulos.RecordCount = 0 then
           DmExporterClient2.QryPermissoesModulos.Append
        else
           DmExporterClient2.QryPermissoesModulos.Edit;
         for i := 0 to DmExporterClient2.QryPermissoesModulos.FieldCount - 1 do
            DmExporterClient2.QryPermissoesModulos.Fields[i].Value := DmExporterClient2.CdsPermissoesModulos.Fields[i].Value;
         DmExporterClient2.QryPermissoesModulos.Post;
         AbreTransacao;
         DmExporterClient2.QryPermissoesModulos.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsPermissoesModulos.Next;
      end;
     DmExporterClient2.CdsPermissoesModulos.Close;
     DmExporterClient2.QryPermissoesModulos.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Permissoes Modulos');
         DmExporterClient2.CdsPermissoesModulos.Close;
         DmExporterClient2.QryPermissoesModulos.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoLancamentosaPrazo;
var i : integer;
    Dados : Variant;
begin
   Try
     DmExporterClient.CdsLancamentosaPrazo.Close;
     DmExporterClient.CdsLancamentosaPrazo.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(145, Filial, 'A');
     if (Dados = null) then
        Exit;

     Try
       DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER LANCAMENTOS_APRAZO_AI0 INACTIVE';
       AbreTransacao;
       DmExporterClient.Sql1.ExecSql(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
        begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         CancelaTransacao;
        end;
     End;
     
     DmExporterClient.CdsLancamentosaPrazo.Data := Dados;
     DmExporterClient.CdsLancamentosaPrazo.Open; // virtual
     AbreTransacao;
     DmExporterClient.CdsLancamentosaPrazo.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Lancamentos a Prazo: '+ FloatToStr(DmExporterClient.CdsLancamentosaPrazo.RecordCount));
     while not DmExporterClient.CdsLancamentosaPrazo.Eof do
      begin
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[0].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_LANCAMENTO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[1].AsFloat := DmExporterClient.CdsLancamentosaPrazoID_PRODUTO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[2].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_FILIAL.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[3].AsString := DmExporterClient.CdsLancamentosaPrazoCD_PRODUTO.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[4].AsString := DmExporterClient.CdsLancamentosaPrazoDESCRICAO.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[5].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_LABORATORIO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[6].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_GRUPO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[7].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_CLASSE.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[8].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_CONVENIO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[9].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_CLIENTE.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[10].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_VENDEDOR.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[11].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_OPERADOR.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[12].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_USUARIO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[13].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_FORMA_PAGAMENTO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[14].AsFloat := DmExporterClient.CdsLancamentosaPrazoCD_VENDA.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[15].AsFloat := DmExporterClient.CdsLancamentosaPrazoID_OPERADORCAIXA.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[16].AsFloat := DmExporterClient.CdsLancamentosaPrazoCUSTO_MEDIO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[17].AsFloat := DmExporterClient.CdsLancamentosaPrazoCUSTO_UNITARIO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[18].AsDate := DmExporterClient.CdsLancamentosaPrazoDATA_LANCAMENTO.AsDateTime;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[19].AsDate := DmExporterClient.CdsLancamentosaPrazoDATA_CAIXA.AsDateTime;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[20].AsFloat := DmExporterClient.CdsLancamentosaPrazoQUANTIDADE.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[21].AsFloat := DmExporterClient.CdsLancamentosaPrazoVALOR.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[22].AsFloat := DmExporterClient.CdsLancamentosaPrazoCOMISSAO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[23].AsString := DmExporterClient.CdsLancamentosaPrazoNOTA_FISCAL.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[24].AsFloat := DmExporterClient.CdsLancamentosaPrazoDESCONTO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[25].AsFloat := DmExporterClient.CdsLancamentosaPrazoPROMOCAO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[26].AsString := DmExporterClient.CdsLancamentosaPrazoTIPO_VENDA.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[27].AsString := DmExporterClient.CdsLancamentosaPrazoTIPO_PAGAMENTO.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[28].AsString := DmExporterClient.CdsLancamentosaPrazoENTRADA_SAIDA.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[29].AsString := DmExporterClient.CdsLancamentosaPrazoETIQUETA.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[30].AsString := DmExporterClient.CdsLancamentosaPrazoENTREGA.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[31].AsTime := DmExporterClient.CdsLancamentosaPrazoHORA.AsDateTime;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[32].AsFloat := DmExporterClient.CdsLancamentosaPrazoESTOQUE_POSVENDA.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[33].AsString := DmExporterClient.CdsLancamentosaPrazoTROCA.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[34].AsString := DmExporterClient.CdsLancamentosaPrazoENVIADO.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[35].AsFloat := DmExporterClient.CdsLancamentosaPrazoNUMERO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[36].AsFloat := DmExporterClient.CdsLancamentosaPrazoTERMINAL.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[37].AsString := DmExporterClient.CdsLancamentosaPrazoUSUARIO.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[38].AsString := DmExporterClient.CdsLancamentosaPrazoOBSERVACAO.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[39].AsFloat := DmExporterClient.CdsLancamentosaPrazoARREDONDAMENTO.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[40].AsString := DmExporterClient.CdsLancamentosaPrazoTRN.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[41].AsString := DmExporterClient.CdsLancamentosaPrazoTRANSACAOTRN.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[42].AsString := DmExporterClient.CdsLancamentosaPrazoLOTETRN.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[43].AsString := DmExporterClient.CdsLancamentosaPrazoAUTORIZACAOTRN.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[44].AsFloat := DmExporterClient.CdsLancamentosaPrazoSUBSIDIOTRN.AsFloat;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.Params[45].AsString := DmExporterClient.CdsLancamentosaPrazoNOTAMANUAL.AsString;
          DmExporterClient.SqlAtualizaLancamentosAPrazo.ExecSQL(False);

          DmExporterClient.CdsLancamentosaPrazo.Next;
      end;
     ConfirmaTransacao;

     Try
       DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER LANCAMENTOS_APRAZO_AI0 ACTIVE';
       AbreTransacao;
       DmExporterClient.Sql1.ExecSql(True);
       ConfirmaTransacao;
     Except
       on E:Exception do
        begin
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         CancelaTransacao;
        end;
     End;

     DmExporterClient.CdsLancamentosaPrazo.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Lancamentos a Prazo');
         Try
           DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER LANCAMENTOS_APRAZO_AI0 ACTIVE';
           AbreTransacao;
           DmExporterClient.Sql1.ExecSql(True);
           ConfirmaTransacao;
         Except
           on E:Exception do
            begin
             GravaLog(TimetoStr(Time) + ' - ' + E.Message);
             CancelaTransacao;
            end;
         End;
         DmExporterClient.CdsLancamentosaPrazo.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.Controlador;
begin
  GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Controlador...');
  try
    DmExporterClient.CdsControlador.Close;
    DmExporterClient.SqlControlador.CommandText := 'SELECT COUNT(ID_PRODUTO) AS N_ITENS, ' +
                                  'SUM(ESTOQUE_' + InttoStr(Filial) + ') AS N_UNIDADES, ' +
                                  'SUM(CUSTO_UNITARIO_' + InttoStr(Filial) + ') AS T_CUSTO, ' +
                                  'SUM(PRECO_VENDA) AS T_VENDA ' +
                                  'FROM PRODUTOS';
    AbreTransacao;
    DmExporterClient.CdsControlador.Open;
    ConfirmaTransacao;
    (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(0, Filial, DmExporterClient.CdsControlador.Data);
  except
    on E:Exception do
     begin
      GravaLog(TimetoStr(Time) + ' - ' + E.Message);
      CancelaTransacao;
      DmExporterClient.CdsControlador.Close;
      Exit;
    end;
  end;
end;

procedure TFrmExporterClient.Testando;
begin
  InputBox('Client', 'Client', 'Client');
end;

procedure TFrmExporterClient.VerificaConexao(TipoConexao : String);
var Dados : Variant;
begin
  try
      AbreTransacao;
      DmExporterClient.CdsConexao.Close;
      DmExporterClient.CdsConexao.Open;
      Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(999, Filial, 'A');
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
        if DmExporterClient.CdsConexaoCGC.AsString <> Dados then
         begin
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - CNPJ Filial = ' + DmExporterClient.CdsConexaoCGC.AsString + ' nao cadastrado na Matriz.');
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



procedure TFrmExporterClient.ConfereProdutos;
var Dados : Variant;
    nDeletados : Integer;
begin
  Try
    nDeletados := 0;
    DmExporterClient.CdsIdProduto.Close;
    DmExporterClient.CdsIdProduto.CreateDataSet;
    Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(1010, Filial, 'A');
    if Dados <> null then
     begin
       DmExporterClient.CdsIdProduto.Data := Dados;
       DmExporterClient.CdsIdProduto.Open;
       if DmExporterClient.CdsIdProduto.RecordCount > 0 then
        begin
              AbreTransacao;
              DmExporterClient.CdsIdProdutosLoja.Open;
              DmExporterClient.CdsIdProduto.IndexFieldNames := 'ID_PRODUTO';
              DmExporterClient.CdsIdProdutosLoja.IndexFieldNames := 'ID_PRODUTO';
              DmExporterClient.CdsIdProdutosLoja.Open;
              DmExporterClient.CdsIdProdutosLoja.First;
              while not DmExporterClient.CdsIdProdutosLoja.Eof do
               begin
                 if not DmExporterClient.CdsIdProduto.FindKey([DmExporterClient.CdsIdProdutosLojaID_PRODUTO.AsFloat]) then
                   begin
                    DmExporterClient.CdsIdProdutosLoja.Delete;
                    Inc(nDeletados);
                   end
                 else
                    DmExporterClient.CdsIdProdutosLoja.Next;
               end;
              DmExporterClient.CdsIdProdutosLoja.ApplyUpdates(0);
              ConfirmaTransacao;
              GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Na consistencia de Produtos foram deletados: ' + FloatToStr(nDeletados));
        end;

       nDeletados := 0;
       if DmExporterClient.CdsIdProdutosLoja.RecordCount > 0 then
        begin
              AbreTransacao;
              DmExporterClient.CdsIdProduto.First;
              while not DmExporterClient.CdsIdProduto.Eof do
               begin
                 if DmExporterClient.CdsIdProdutosLoja.FindKey([DmExporterClient.CdsIdProdutoID_PRODUTO.AsFloat]) then
                   begin
                    DmExporterClient.CdsIdProduto.Delete;
                    Inc(nDeletados);
                   end
                 else
                    DmExporterClient.CdsIdProduto.Next;
               end;
              ConfirmaTransacao;

              Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(1011, Filial, DmExporterClient.CdsIdProduto.Data);
              
              if Dados <> null then
               begin

                 DmExporterClient.CdsIncluiProdutos.Data := Dados;
                 DmExporterClient.CdsIncluiProdutos.Open; // virtual
                 if DmExporterClient.CdsIncluiProdutos.RecordCount > 0 then
                    begin
                       DmExporterClient.CdsIncluiProdutos.First;
                       GravaLog(TimetoStr(Time) + ' - Novos Produtos Recebidos: ' + FloatToStr(DmExporterClient.CdsIncluiProdutos.RecordCount));
                       while not DmExporterClient.CdsIncluiProdutos.Eof do
                        begin
                          DmExporterClient.CdsCeProdutos.Close;
                          DmExporterClient.TbCeProdutos.CommandText := 'SELECT ID_PRODUTO FROM PRODUTOS WHERE ID_PRODUTO = ' + DmExporterClient.CdsIncluiProdutosID_PRODUTO.AsString;
                          DmExporterClient.CdsCeProdutos.FetchParams;
                          DmExporterClient.CdsCeProdutos.Open;
                          if DmExporterClient.CdsCeProdutos.RecordCount = 0 then
                           begin
                             Id_Produto       := DmExporterClient.CdsIncluiProdutosID_PRODUTO.AsString;
                             Cd_Produto       := QuotedStr(DmExporterClient.CdsIncluiProdutosCD_PRODUTO.AsString);
                             CodigoBarras     := QuotedStr(DmExporterClient.CdsIncluiProdutosCODIGO_BARRAS_1.AsString);
                             if DmExporterClient.CdsIncluiProdutosCODIGO_BARRAS_2.IsNull then
                                 CodigoBarras2     := QuotedStr('')
                             else
                                 CodigoBarras2     := QuotedStr(DmExporterClient.CdsIncluiProdutosCODIGO_BARRAS_2.AsString);
                             Descricao        := QuotedStr(DmExporterClient.CdsIncluiProdutosDESCRICAO.AsString);
                             Cd_Laboratorio   := DmExporterClient.CdsIncluiProdutosCD_LABORATORIO.AsString;
                             Cd_Grupo         := DmExporterClient.CdsIncluiProdutosCD_GRUPO.AsString;
                             Cd_Classe        := DmExporterClient.CdsIncluiProdutosCD_CLASSE.AsString;
                             TipoProduto      := QuotedStr(DmExporterClient.CdsIncluiProdutosTIPO_PRODUTO.AsString);
                             EntraPE          := QuotedStr(DmExporterClient.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.AsString);

                             if not (DmExporterClient.CdsIncluiProdutosCD_LISTA.IsNull) then
                                Cd_Lista         := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosCD_LISTA.AsString, '.', ''), ',', '.')
                             else
                                Cd_Lista         := 'NULL';
                             if not (DmExporterClient.CdsIncluiProdutosCD_PRINCIPIO.IsNull) then
                                Cd_Principio     := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosCD_PRINCIPIO.AsString, '.', ''), ',', '.')
                             else
                                Cd_Principio     := 'NULL';
                             if not (DmExporterClient.CdsIncluiProdutosTX_DESCONTO.IsNull) then
                                TxDesconto       := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosTX_DESCONTO.AsString, '.', ''), ',', '.')
                             else
                                TxDesconto       := QuotedStr('0');
                             if not (DmExporterClient.CdsIncluiProdutosIDENTIFICADOR.IsNull) and (DmExporterClient.CdsIncluiProdutosIDENTIFICADOR.AsString <> '')  then
                                Identificador    := QuotedStr(DmExporterClient.CdsIncluiProdutosIDENTIFICADOR.AsString)
                             else
                                Identificador    := QuotedStr('M');
                             if not (DmExporterClient.CdsIncluiProdutosBALANCA.IsNull) and (DmExporterClient.CdsIncluiProdutosBALANCA.AsString <> '')  then
                                Balanca          := QuotedStr(DmExporterClient.CdsIncluiProdutosBALANCA.AsString)
                             else
                                Balanca          := QuotedStr('N');
                             if not (DmExporterClient.CdsIncluiProdutosUNIDADE.IsNull) and (DmExporterClient.CdsIncluiProdutosUNIDADE.AsString <> '')  then
                                Unidade          := QuotedStr(DmExporterClient.CdsIncluiProdutosUNIDADE.AsString)
                             else
                                Unidade          := QuotedStr('UN');
                             if not DmExporterClient.CdsIncluiProdutosQT_EMBALAGEM.IsNull then
                                Qt_Embalagem     := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosQT_EMBALAGEM.AsString, '.', ''), ',', '.')
                             else
                                Qt_Embalagem     := QuotedStr('0');
                             if not DmExporterClient.CdsIncluiProdutosCOMISSAO.IsNull then
                                Comissao         := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosCOMISSAO.AsString, '.', ''), ',', '.')
                             else
                                Comissao         := QuotedStr('0');
                             if not DmExporterClient.CdsIncluiProdutosCUSTO_UNITARIO.IsNull then
                                CustoUnitario    := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosCUSTO_UNITARIO.AsString, '.', ''), ',', '.')
                             else
                                CustoUnitario    := QuotedStr('0');
                             if not DmExporterClient.CdsIncluiProdutosPRECO_VENDA.IsNull then
                                Preco_Venda      := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosPRECO_VENDA.AsString, '.', ''), ',', '.')
                             else
                                Preco_Venda      := QuotedStr('0');
                             if not DmExporterClient.CdsIncluiProdutosPRECO_PROMOCAO.IsNull then
                                Preco_Promocao   := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosPRECO_PROMOCAO.AsString, '.', ''), ',', '.')
                             else
                                Preco_Promocao   := QuotedStr('0');
                             if not DmExporterClient.CdsIncluiProdutosICMS.IsNull then
                                Icms             := QuotedStr(DmExporterClient.CdsIncluiProdutosICMS.AsString)
                             else
                                Icms             := QuotedStr('FF');
                             if not DmExporterClient.CdsIncluiProdutosMARGEM.IsNull then
                                Margem           := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosMARGEM.AsString, '.', ''), ',', '.')
                             else
                                Margem           := QuotedStr('0');
                             if not DmExporterClient.CdsIncluiProdutosMARGEM_PROMOCAO.IsNull then
                                Margem_Promocao  := StrTran(StrTran(DmExporterClient.CdsIncluiProdutosMARGEM_PROMOCAO.AsString, '.', ''), ',', '.')
                             else
                                Margem_Promocao  := QuotedStr('0');
                             if not DmExporterClient.CdsIncluiProdutosDT_CADASTRO.IsNull then
                                Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', DmExporterClient.CdsIncluiProdutosDT_CADASTRO.AsDateTime))
                             else
                                Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', Date));
                             if not DmExporterClient.CdsIncluiProdutosCURVA.IsNull then
                                Curva            := QuotedStr(DmExporterClient.CdsIncluiProdutosCURVA.AsString)
                             else
                                Curva            := QuotedStr('C');
                             if not DmExporterClient.CdsIncluiProdutosSTATUS.IsNull then
                                Status           := QuotedStr(DmExporterClient.CdsIncluiProdutosSTATUS.AsString)
                             else
                                Status           := QuotedStr('A');
                             if not DmExporterClient.CdsIncluiProdutosUSOCONTINUO.IsNull then
                                UsoContinuo      := QuotedStr(DmExporterClient.CdsIncluiProdutosUSOCONTINUO.AsString)
                             else
                                UsoContinuo      := QuotedStr('N');
                             if not DmExporterClient.CdsIncluiProdutosPIS_COFINS.IsNull then
                                PisCofins      := QuotedStr(DmExporterClient.CdsIncluiProdutosPIS_COFINS.AsString)
                             else
                                PisCofins      := QuotedStr('N');
                             if not DmExporterClient.CdsIncluiProdutosNCM.IsNull then
                                NCM      := QuotedStr(DmExporterClient.CdsIncluiProdutosNCM.AsString)
                             else
                                NCM      := QuotedStr('');

                             DmExporterClient.SQL1.CommandText := 'INSERT INTO PRODUTOS (ID_PRODUTO, CD_PRODUTO, CODIGO_BARRAS_1, CODIGO_BARRAS_2, DESCRICAO, ' +
                                                 ' CD_LABORATORIO, CD_GRUPO, CD_CLASSE, TIPO_PRODUTO, IDENTIFICADOR, QT_EMBALAGEM, ' +
                                                 ' COMISSAO, CUSTO_UNITARIO, CUSTO_UNITARIO_' + IntToStr(Filial) + ', CUSTO_MEDIO, CUSTO_MEDIO_' + IntToStr(Filial) +
                                                 ', PRECO_VENDA, PRECO_PROMOCAO, ICMS, ' +
                                                 ' MARGEM, MARGEM_PROMOCAO, DT_CADASTRO, CURVA, ENTRA_PEDIDO_ELETRONICO, STATUS, ' +
                                                 ' CD_LISTA, CD_PRINCIPIO, USOCONTINUO, PIS_COFINS, NCM ) VALUES (' +
                                                 Id_Produto + ',' + Cd_Produto + ',' + CodigoBarras + ',' + CodigoBarras2 + ',' + Descricao + ',' +
                                                 Cd_Laboratorio + ',' + Cd_Grupo + ',' + Cd_Classe + ',' + TipoProduto + ',' +
                                                 Identificador + ',' + Qt_Embalagem + ',' + Comissao + ',' +
                                                 CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' +
                                                 Preco_Venda + ',' + Preco_Promocao + ',' + Icms + ',' + Margem + ',' +
                                                 Margem_Promocao + ',' + Dt_Cadastro + ',' + Curva + ',' + EntraPE + ',' + Status + ',' +
                                                 Cd_Lista + ',' + Cd_Principio + ',' + UsoContinuo + ',' + PisCofins + ',' + NCM + ')';
                             AbreTransacao;
                             DmExporterClient.SQL1.ExecSQL(True);
                             ConfirmaTransacao;
                           end;
                          DmExporterClient.CdsIncluiProdutos.Next;
                        end;
                       DmExporterClient.CdsIncluiProdutos.Close;
                       DmExporterClient.CdsCeProdutos.Close;
                    end;

                  //GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Na consistencia de Produtos foram incluidos: ' + FloatToStr(nDeletados));
               end;
        end;
     end;
  except
    on E:Exception do
     begin
       CancelaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro conferindo produtos - '+ E.Message + ' --- ' + DmExporterClient.SQL1.CommandText);
       DmExporterClient.CdsIdProdutosLoja.Close;
       DmExporterClient.CdsIdProduto.Close;
       Exit;
     end;
  End;

end;


procedure TFrmExporterClient.RecebendoEncartes;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient2.CdsEncartes.Close;
     DmExporterClient2.CdsEncartes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(146, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient2.CdsEncartes.Data := Dados;
     DmExporterClient2.CdsEncartes.Open; // virtual
     DmExporterClient2.CdsEncartes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Encartes: '+ FloatToStr(DmExporterClient2.CdsEncartes.RecordCount));
     while not DmExporterClient2.CdsEncartes.Eof do
      begin
        DmExporterClient2.QryEncartes.Close;
        DmExporterClient2.QryEncartes.Params[0].AsFloat := DmExporterClient2.CdsEncartesID_ENCARTE.AsFloat;
        DmExporterClient2.QryEncartes.Open;
        if DmExporterClient2.QryEncartes.RecordCount = 0 then
           DmExporterClient2.QryEncartes.Append
        else
           DmExporterClient2.QryEncartes.Edit;
         for i := 0 to DmExporterClient2.QryEncartes.FieldCount - 1 do
            DmExporterClient2.QryEncartes.Fields[i].Value := DmExporterClient2.CdsEncartes.Fields[i].Value;
         DmExporterClient2.QryEncartes.Post;
         AbreTransacao;
         DmExporterClient2.QryEncartes.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsEncartes.Next;
      end;
     DmExporterClient2.CdsEncartes.Close;
     DmExporterClient2.QryEncartes.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Encartes');
         DmExporterClient2.CdsEncartes.Close;
         DmExporterClient2.QryEncartes.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoItensEncartes;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient2.CdsItensEncartes.Close;
     DmExporterClient2.CdsItensEncartes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(147, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient2.CdsItensEncartes.Data := Dados;
     DmExporterClient2.CdsItensEncartes.Open; // virtual
     DmExporterClient2.CdsItensEncartes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Itens Encartes: '+ FloatToStr(DmExporterClient2.CdsItensEncartes.RecordCount));
     while not DmExporterClient2.CdsItensEncartes.Eof do
      begin
        DmExporterClient2.QryItensEncartes.Close;
        DmExporterClient2.QryItensEncartes.Params[0].AsFloat := DmExporterClient2.CdsItensEncartesID_ENCARTE.AsFloat;
        DmExporterClient2.QryItensEncartes.Params[1].AsFloat := DmExporterClient2.CdsItensEncartesID_PRODUTO.AsFloat;
        DmExporterClient2.QryItensEncartes.Open;
        if DmExporterClient2.QryItensEncartes.RecordCount = 0 then
           DmExporterClient2.QryItensEncartes.Append
        else
           DmExporterClient2.QryItensEncartes.Edit;
         for i := 0 to DmExporterClient2.QryItensEncartes.FieldCount - 1 do
            DmExporterClient2.QryItensEncartes.Fields[i].Value := DmExporterClient2.CdsItensEncartes.Fields[i].Value;
         DmExporterClient2.QryItensEncartes.Post;
         AbreTransacao;
         DmExporterClient2.QryItensEncartes.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsItensEncartes.Next;
      end;
     DmExporterClient2.CdsItensEncartes.Close;
     DmExporterClient2.QryItensEncartes.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Itens Encartes');
         DmExporterClient2.CdsItensEncartes.Close;
         DmExporterClient2.QryItensEncartes.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoRedes;
var i : integer;
Dados : Variant;
begin
   Try
     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_CADASTRO_REDES INACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;

     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_INC_REDES INACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;

     DmExporterClient2.CdsRedes.Close;
     DmExporterClient2.CdsRedes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(133, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient2.CdsRedes.Data := Dados;
     DmExporterClient2.CdsRedes.Open; // virtual
     DmExporterClient2.CdsRedes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Redes: '+ FloatToStr(DmExporterClient2.CdsRedes.RecordCount));
     while not DmExporterClient2.CdsRedes.Eof do
      begin
        DmExporterClient2.QryRedes.Close;
        DmExporterClient2.QryRedes.Params[0].AsFloat := DmExporterClient2.CdsRedesID_REDE.AsFloat;
        DmExporterClient2.QryRedes.Open;
        if DmExporterClient2.QryRedes.RecordCount = 0 then
           DmExporterClient2.QryRedes.Append
        else
           DmExporterClient2.QryRedes.Edit;
         for i := 0 to DmExporterClient2.QryRedes.FieldCount - 1 do
            DmExporterClient2.QryRedes.Fields[i].Value := DmExporterClient2.CdsRedes.Fields[i].Value;
         DmExporterClient2.QryRedes.Post;
         AbreTransacao;
         DmExporterClient2.QryRedes.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsRedes.Next;
      end;
     DmExporterClient2.CdsRedes.Close;
     DmExporterClient2.QryRedes.Close;

     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_CADASTRO_REDES ACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;

     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_INC_REDES ACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Redes');

         AbreTransacao;
         DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_CADASTRO_REDES ACTIVE';
         DmExporterClient.Sql1.ExecSQL(True);
         ConfirmaTransacao;

         AbreTransacao;
         DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_INC_REDES ACTIVE';
         DmExporterClient.Sql1.ExecSQL(True);
         ConfirmaTransacao;

         DmExporterClient2.CdsRedes.Close;
         DmExporterClient2.QryRedes.Close;
         Exit;
       end;
   end;
end;


procedure TFrmExporterClient.RecebendoConcorrentes;
var i : integer;
Dados : Variant;
begin
   Try
     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 INACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;

     DmExporterClient2.CdsConcorrentes.Close;
     DmExporterClient2.CdsConcorrentes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(134, Filial, 'A');
     if (Dados = null) then
      begin
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
        Exit;
      end;
     DmExporterClient2.CdsConcorrentes.Data := Dados;
     DmExporterClient2.CdsConcorrentes.Open; // virtual
     DmExporterClient2.CdsConcorrentes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Concorrentes: '+ FloatToStr(DmExporterClient2.CdsConcorrentes.RecordCount));
     while not DmExporterClient2.CdsConcorrentes.Eof do
      begin
        DmExporterClient2.QryConcorrentes.Close;
        DmExporterClient2.QryConcorrentes.Params[0].AsFloat := DmExporterClient2.CdsConcorrentesID_CONCORRENTE.AsFloat;
        DmExporterClient2.QryConcorrentes.Open;
        if DmExporterClient2.QryConcorrentes.RecordCount = 0 then
           DmExporterClient2.QryConcorrentes.Append
        else
           DmExporterClient2.QryConcorrentes.Edit;
         for i := 0 to DmExporterClient2.QryConcorrentes.FieldCount - 1 do
            DmExporterClient2.QryConcorrentes.Fields[i].Value := DmExporterClient2.CdsConcorrentes.Fields[i].Value;
         DmExporterClient2.QryConcorrentes.Post;
         AbreTransacao;
         DmExporterClient2.QryConcorrentes.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsConcorrentes.Next;
      end;
     DmExporterClient2.CdsConcorrentes.Close;
     DmExporterClient2.QryConcorrentes.Close;

     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Concorrentes');

         AbreTransacao;
         DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
         DmExporterClient.Sql1.ExecSQL(True);
         ConfirmaTransacao;

         DmExporterClient2.CdsConcorrentes.Close;
         DmExporterClient2.QryConcorrentes.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoProjetosPharmalink;
var i : integer;
Dados : Variant;
begin
   Try
     //DmExporterClient.CdsProjetosPharmalink.Close;
     DmExporterClient.CdsProjetosPharmalink.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(152, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient.CdsProjetosPharmalink.Data := Dados;
     DmExporterClient.CdsProjetosPharmalink.Open; // virtual
     DmExporterClient.CdsProjetosPharmalink.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Projetos Pharmalink: '+ FloatToStr(DmExporterClient.CdsProjetosPharmalink.RecordCount));
     while not DmExporterClient.CdsProjetosPharmalink.Eof do
      begin
        DmExporterClient.QryProjetosPharmalink.Close;
        DmExporterClient.QryProjetosPharmalink.Params[0].AsFloat := DmExporterClient.CdsProjetosPharmalinkID_PROJETO.AsFloat;
        DmExporterClient.QryProjetosPharmalink.Open;
        if DmExporterClient.QryProjetosPharmalink.RecordCount = 0 then
           DmExporterClient.QryProjetosPharmalink.Append
        else
           DmExporterClient.QryProjetosPharmalink.Edit;
         for i := 0 to DmExporterClient.QryProjetosPharmalink.FieldCount - 1 do
            DmExporterClient.QryProjetosPharmalink.Fields[i].Value := DmExporterClient.CdsProjetosPharmalink.Fields[i].Value;
         DmExporterClient.QryProjetosPharmalink.Post;
         AbreTransacao;
         DmExporterClient.QryProjetosPharmalink.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient.CdsProjetosPharmalink.Next;
      end;
     DmExporterClient.CdsProjetosPharmalink.Close;
     DmExporterClient.QryProjetosPharmalink.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Concorrentes');

         AbreTransacao;
         DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
         DmExporterClient.Sql1.ExecSQL(True);
         ConfirmaTransacao;

         DmExporterClient.QryProjetosPharmalink.Close;
         DmExporterClient.CdsProjetosPharmalink.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoPerfilCliente;
var i : integer;
Dados : Variant;
begin
   Try
     DmExporterClient2.CdsPerfilCliente.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(153, Filial, 'A');
     if (Dados = null) then
        Exit;
     DmExporterClient2.CdsPerfilCliente.Data := Dados;
     DmExporterClient2.CdsPerfilCliente.Open; // virtual
     DmExporterClient2.CdsPerfilCliente.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Perfis de Cliente: '+ FloatToStr(DmExporterClient2.CdsPerfilCliente.RecordCount));
     while not DmExporterClient2.CdsPerfilCliente.Eof do
      begin
        DmExporterClient2.QryPerfilCliente.Close;
        DmExporterClient2.QryPerfilCliente.Params[0].AsFloat := DmExporterClient2.CdsPerfilClienteID_PERFIL_CLIENTE.AsFloat;
        DmExporterClient2.QryPerfilCliente.Open;
        if DmExporterClient2.QryPerfilCliente.RecordCount = 0 then
           DmExporterClient2.QryPerfilCliente.Append
        else
           DmExporterClient2.QryPerfilCliente.Edit;
        for i := 0 to DmExporterClient2.QryPerfilCliente.FieldCount - 1 do
           DmExporterClient2.QryPerfilCliente.Fields[i].Value := DmExporterClient2.CdsPerfilCliente.Fields[i].Value;
        DmExporterClient2.QryPerfilCliente.Post;
        AbreTransacao;
        DmExporterClient2.QryPerfilCliente.ApplyUpdates(0);
        ConfirmaTransacao;
        DmExporterClient2.CdsPerfilCliente.Next;
      end;
     DmExporterClient2.CdsPerfilCliente.Close;
     DmExporterClient2.QryPerfilCliente.Close;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Perfis de Cliente');

         DmExporterClient2.QryPerfilCliente.Close;
         DmExporterClient2.CdsPerfilCliente.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoPrecosConcorrentes;
var i : integer;
Dados : Variant;
begin
   Try
     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES INACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;

     DmExporterClient2.CdsPrecosConcorrentes.Close;
     DmExporterClient2.CdsPrecosConcorrentes.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(148, Filial, 'A');
     if (Dados = null) then
      begin
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES ACTIVE';
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
        Exit;
      end;
     DmExporterClient2.CdsPrecosConcorrentes.Data := Dados;
     DmExporterClient2.CdsPrecosConcorrentes.Open; // virtual
     DmExporterClient2.CdsPrecosConcorrentes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Precos Concorrentes: '+ FloatToStr(DmExporterClient2.CdsPrecosConcorrentes.RecordCount));
     while not DmExporterClient2.CdsPrecosConcorrentes.Eof do
      begin
        DmExporterClient2.QryPrecosConcorrentes.Close;
        DmExporterClient2.QryPrecosConcorrentes.Params[0].AsFloat := DmExporterClient2.CdsPrecosConcorrentesID_CONCORRENTE.AsFloat;
        DmExporterClient2.QryPrecosConcorrentes.Params[1].AsFloat := DmExporterClient2.CdsPrecosConcorrentesID_PRODUTO.AsFloat;
        DmExporterClient2.QryPrecosConcorrentes.Open;
        if DmExporterClient2.QryPrecosConcorrentes.RecordCount = 0 then
           DmExporterClient2.QryPrecosConcorrentes.Append
        else
           DmExporterClient2.QryPrecosConcorrentes.Edit;
         for i := 0 to DmExporterClient2.QryPrecosConcorrentes.FieldCount - 1 do
            DmExporterClient2.QryPrecosConcorrentes.Fields[i].Value := DmExporterClient2.CdsPrecosConcorrentes.Fields[i].Value;
         DmExporterClient2.QryPrecosConcorrentes.Post;
         AbreTransacao;
         DmExporterClient2.QryPrecosConcorrentes.ApplyUpdates(0);
         ConfirmaTransacao;
         DmExporterClient2.CdsPrecosConcorrentes.Next;
      end;
     DmExporterClient2.CdsPrecosConcorrentes.Close;
     DmExporterClient2.QryPrecosConcorrentes.Close;

     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES ACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Precos Concorrentes');

         AbreTransacao;
         DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES ACTIVE';
         DmExporterClient.Sql1.ExecSQL(True);
         ConfirmaTransacao;

         DmExporterClient2.CdsPrecosConcorrentes.Close;
         DmExporterClient2.QryPrecosConcorrentes.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.RecebendoPrecosConcorrentesDeletados;
var
  Dados : Variant;
begin
   Try
     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES INACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;

     DmExporterClient2.CdsPrecosConcorrentesDeletados.Close;
     DmExporterClient2.CdsPrecosConcorrentesDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(149, Filial, 'A');
     if (Dados = null) then
      begin
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES ACTIVE';
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
        Exit;
      end;
     DmExporterClient2.CdsPrecosConcorrentesDeletados.Data := Dados;
     DmExporterClient2.CdsPrecosConcorrentesDeletados.Open; // virtual
     DmExporterClient2.CdsPrecosConcorrentesDeletados.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Precos Concorrentes Deletados: '+ FloatToStr(DmExporterClient2.CdsPrecosConcorrentesDeletados.RecordCount));
     while not DmExporterClient2.CdsPrecosConcorrentesDeletados.Eof do
      begin
        AbreTransacao;
        DmExporterClient.Sql1.CommandText := 'DELETE FROM PROD_CONCORRENTES WHERE ID_CONCORRENTE = ' + DmExporterClient2.CdsPrecosConcorrentesDeletados.FieldByName('ID_CONCORRENTE').AsString +
                                             ' AND ID_PRODUTO = ' + DmExporterClient2.CdsPrecosConcorrentesDeletados.FieldByName('ID_PRODUTO').AsString;
        DmExporterClient.Sql1.ExecSQL(True);
        ConfirmaTransacao;
        DmExporterClient2.CdsPrecosConcorrentesDeletados.Next;
      end;
     DmExporterClient2.CdsPrecosConcorrentesDeletados.Close;

     AbreTransacao;
     DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES ACTIVE';
     DmExporterClient.Sql1.ExecSQL(True);
     ConfirmaTransacao;
   Except
      on E:Exception do
       begin
         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Precos Concorrentes Deletados');

         AbreTransacao;
         DmExporterClient.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES ACTIVE';
         DmExporterClient.Sql1.ExecSQL(True);
         ConfirmaTransacao;

         DmExporterClient2.CdsPrecosConcorrentesDeletados.Close;
         Exit;
       end;
   end;
end;

function TFrmExporterClient.RecebendoContasReceberDeletados : Boolean;
var
  Dados : Variant;
begin
   Try
     Result := True;

     DmExporterClient2.CdsContasReceberDeletados.Close;
     DmExporterClient2.CdsContasReceberDeletados.CreateDataSet;
     Dados := (DmExporterClient.HTTPRIO1 AS IDmProcessa).Processa(150, Filial, 'A');
     if (Dados = null) then
      begin
        Result := False;
        Exit;
      end;
     DmExporterClient2.CdsContasReceberDeletados.Data := Dados;
     DmExporterClient2.CdsContasReceberDeletados.Open; // virtual

     if DmExporterClient2.CdsContasReceberDeletados.RecordCount > 0 then
        begin
           DmExporterClient2.CdsContasReceberDeletados.First;
           AbreTransacao;
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Contas Receber Deletadas: '+ FloatToStr(DmExporterClient2.CdsContasReceberDeletados.RecordCount));
           while not DmExporterClient2.CdsContasReceberDeletados.Eof do
            begin
              DmExporterClient.SqlAtualizaDeletados.Params[0].AsString := 'CONTAS_RECEBER';
              DmExporterClient.SqlAtualizaDeletados.Params[1].AsString := 'CD_CONTAS_RECEBER';
              DmExporterClient.SqlAtualizaDeletados.Params[2].AsString := DmExporterClient2.CdsContasReceberDeletadosID_PRODUTO.AsString;
              DmExporterClient.SqlAtualizaDeletados.ExecSQL(False);

              DmExporterClient2.CdsContasReceberDeletados.Next;
            end;
        end;
     ConfirmaTransacao;
     DmExporterClient2.CdsContasReceberDeletados.Close;
   Except
      on E:Exception do
       begin
         Result := False;

         CancelaTransacao;
         GravaLog(TimetoStr(Time) + ' - ' + E.Message);
         GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Deletar Contas Receber');
         DmExporterClient2.CdsContasReceberDeletados.Close;
         Exit;
       end;
   end;
end;

procedure TFrmExporterClient.ProcessarConcistencia;
var i : integer;
 Dados : Variant;
begin
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

  Try
      DmExporterClient.SQLConnection1.Close;
      DmExporterClient.SQLConnection1.Params.Values['Database'] := Caminho + '\Farmax.fdb';
      if Senha <> '' then
         DmExporterClient.SQLConnection1.Params.Values['Password'] := Senha
      else
         DmExporterClient.SQLConnection1.Params.Values['Password'] := 'masterkey';
      DmExporterClient.SQLConnection1.Open;
  Except
      GravaLog('Sem conexão com o banco no caminho: ' + Caminho + '\Farmax.fdb');
      RxTrayIcon1.Animated := False;
      Close;
      Application.Terminate;
      Halt;
      Exit;
  End;

  DmExporterClient.HTTPRIO1.URL := 'http://' + Servidor + '/ExporterServer/ExporterServer.exe/soap/IDm';

  RxTrayIcon1.Animated := True;

  //tenta disparar o servidor de aplicacao na matriz....caso nao consiga, grava no log e sai.
  Filial := 0;
  for i := 1 to 10 do
    begin
      try
        AbreTransacao;
        DmExporterClient.CdsParametros.Open;
        ConfirmaTransacao;
        if DmExporterClient.CdsParametrosTIPO_LOJA.AsString = 'U' then
         begin
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja cadastrada como loja única.');
           Exit;
         end;
        Filial := DmExporterClient.CdsParametros.Fields[0].AsInteger;
      except
        on E:Exception do
         begin
          GravaLog(TimetoStr(Time) + ' - ' + E.Message);
          CancelaTransacao;
          Delay(5);
         end;
      end;
      if Filial <> 0 then
        break;
    end;

    if Filial = 0 then
      begin
        GravaLog('O Servidor Matriz não foi localizado... - '+ FormatDateTime('hh:mm:ss',Time));
        RxTrayIcon1.Animated := False;
        Close;
        Application.Terminate;
        Halt;
        Exit;
      end;

  GravaLog(' ');
  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ======== Iniciando novo processo de Consistencia de Dados entre Loja e Gestao ========');

  VerificaConexao('Inicial');

  ConsistenciaClasses;
  ConsistenciaGrupos;
  ConsistenciaLaboratorios;
  ConsistenciaFamilias;
  ConsistenciaGruposCompras;
  ConsistenciaGruposBalanco;
  ConsistenciaDistribuidores;
  ConsistenciaCartoes;
  ConsistenciaPlanoContas;
  ConsistenciaVendedores;
  ConsistenciaConvenios;
  //ConsistenciaClientes;
  ConsistenciaContasReceber;

  RxTrayIcon1.Animated := False;
  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - =======================================================');

end;

procedure TFrmExporterClient.ConsistenciaClasses;
var Dados : Variant;
begin
  // Consistencia de Classes
  Try
    AbreTransacao;
    DmExporterClient2.CdsClasses.Close;
    DmExporterClient2.CdsClasses.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Classes - ' + FloattoStr(DmExporterClient2.CdsClasses.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2001, Filial, DmExporterClient2.CdsClasses.Data);

    DmExporterClient2.CdsClasses.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Classes');
        DmExporterClient2.CdsClasses.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaGrupos;
var Dados : Variant;
begin
  // Consistencia de Grupos
  Try
    AbreTransacao;
    DmExporterClient2.CdsGrupos.Close;
    DmExporterClient2.CdsGrupos.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Grupos - ' + FloattoStr(DmExporterClient2.CdsGrupos.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2002, Filial, DmExporterClient2.CdsGrupos.Data);

    DmExporterClient2.CdsGrupos.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Grupos');
        DmExporterClient2.CdsGrupos.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaLaboratorios;
var Dados : Variant;
begin
  // Consistencia de Laboratorios
  Try
    AbreTransacao;
    DmExporterClient2.CdsLaboratorios.Close;
    DmExporterClient2.CdsLaboratorios.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Laboratorios - ' + FloattoStr(DmExporterClient2.CdsLaboratorios.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2003, Filial, DmExporterClient2.CdsLaboratorios.Data);

    DmExporterClient2.CdsLaboratorios.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Laboratorios');
        DmExporterClient2.CdsLaboratorios.Close;
        Exit;
      end;
  End;
end;


procedure TFrmExporterClient.ConsistenciaFamilias;
var Dados : Variant;
begin
  // Consistencia de Familias
  Try
    AbreTransacao;
    DmExporterClient2.CdsFamilias.Close;
    DmExporterClient2.CdsFamilias.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Familias - ' + FloattoStr(DmExporterClient2.CdsFamilias.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2004, Filial, DmExporterClient2.CdsFamilias.Data);

    DmExporterClient2.CdsFamilias.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Familias');
        DmExporterClient2.CdsFamilias.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaGruposCompras;
var Dados : Variant;
begin
  // Consistencia de Grupos de Compras
  Try
    AbreTransacao;
    DmExporterClient2.CdsGruposCompras.Close;
    DmExporterClient2.CdsGruposCompras.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Grupos de Compras - ' + FloattoStr(DmExporterClient2.CdsGruposCompras.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2005, Filial, DmExporterClient2.CdsGruposCompras.Data);

    DmExporterClient2.CdsGruposCompras.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Grupos de Compras');
        DmExporterClient2.CdsGruposCompras.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaGruposBalanco;
var Dados : Variant;
begin
  // Consistencia de Grupos de Balanco
  Try
    AbreTransacao;
    DmExporterClient2.CdsGruposBalanco.Close;
    DmExporterClient2.CdsGruposBalanco.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Grupos de Balanco - ' + FloattoStr(DmExporterClient2.CdsGruposBalanco.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2006, Filial, DmExporterClient2.CdsGruposBalanco.Data);

    DmExporterClient2.CdsGruposBalanco.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Grupos de Balanco');
        DmExporterClient2.CdsGruposBalanco.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaDistribuidores;
var Dados : Variant;
begin
  // Consistencia de Grupos de Distribuidores
  Try
    AbreTransacao;
    DmExporterClient2.CdsDistribuidores.Close;
    DmExporterClient2.CdsDistribuidores.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Distribuidores - ' + FloattoStr(DmExporterClient2.CdsDistribuidores.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2007, Filial, DmExporterClient2.CdsDistribuidores.Data);

    DmExporterClient2.CdsDistribuidores.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Distribuidores');
        DmExporterClient2.CdsDistribuidores.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaCartoes;
var Dados : Variant;
begin
  // Consistencia de Cartoes
  Try
    AbreTransacao;
    DmExporterClient2.CdsCartoes.Close;
    DmExporterClient2.CdsCartoes.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Cartoes - ' + FloattoStr(DmExporterClient2.CdsCartoes.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2008, Filial, DmExporterClient2.CdsCartoes.Data);

    DmExporterClient2.CdsCartoes.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Cartoes');
        DmExporterClient2.CdsCartoes.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaPlanoContas;
var Dados : Variant;
begin
  // Consistencia de Plano de Contas
  Try
    AbreTransacao;
    DmExporterClient2.CdsPlanoContas.Close;
    DmExporterClient2.CdsPlanoContas.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Plano de Contas - ' + FloattoStr(DmExporterClient2.CdsPlanoContas.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2009, Filial, DmExporterClient2.CdsPlanoContas.Data);

    DmExporterClient2.CdsPlanoContas.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Plano de Contas');
        DmExporterClient2.CdsPlanoContas.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaVendedores;
var Dados : Variant;
begin
  // Consistencia de Vendedores
  Try
    AbreTransacao;
    DmExporterClient2.CdsVendedores.Close;
    DmExporterClient2.CdsVendedores.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Vendedores - ' + FloattoStr(DmExporterClient2.CdsVendedores.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2010, Filial, DmExporterClient2.CdsVendedores.Data);

    DmExporterClient2.CdsVendedores.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Vendedores');
        DmExporterClient2.CdsVendedores.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaConvenios;
var Dados : Variant;
begin
  // Consistencia de Convenios
  Try
    AbreTransacao;
    DmExporterClient2.CdsConvenios.Close;
    DmExporterClient2.CdsConvenios.Open;
    ConfirmaTransacao;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Convenios - ' + FloattoStr(DmExporterClient2.CdsConvenios.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2011, Filial, DmExporterClient2.CdsConvenios.Data);

    DmExporterClient2.CdsConvenios.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Convenios');
        DmExporterClient2.CdsConvenios.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaClientes;
var Dados : Variant;
begin
  // Consistencia de Clientes
  Try
    AbreTransacao;
    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Consistencia de Clientes - ' + FloattoStr(DmExporterClient2.CdsClientes.RecordCount));
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2012, Filial, '');
    if Dados <> null then
     begin
        DmExporterClient2.CdsVirtualClientes.CreateDataSet;
        DmExporterClient2.CdsVirtualClientes.Data := Dados;
        DmExporterClient2.CdsVirtualClientes.Open;
        if DmExporterClient2.CdsVirtualClientes.RecordCount > 0 then
         begin
            DmExporterClient2.CdsVirtualClientes.First;
            DmExporterClient2.CdsVirtualClientes.Filtered := True;
            DmExporterClient2.CdsClientes.Close;
            DmExporterClient2.CdsClientes.Open;
            DmExporterClient2.CdsClientes.First;
            while not DmExporterClient2.CdsClientes.Eof do
             begin
               DmExporterClient2.CdsVirtualClientes.Filter := 'CD_CLIENTE = ' + DmExporterClient2.CdsClientesCD_CLIENTE.AsString;
               if DmExporterClient2.CdsVirtualClientes.RecordCount = 0 then
                  DmExporterClient.Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' +  DmExporterClient2.CdsClientesCD_CLIENTE.AsString + ', ' + DmExporterClient2.CdsParametrosCD_FILIAL.AsString + ', 14, ' + QuotedStr('') + ')';
               DmExporterClient2.CdsClientes.Next;
             end;
         end;
     end;

    ConfirmaTransacao;

    DmExporterClient2.CdsVirtualClientes.Close;
    DmExporterClient2.CdsVirtualClientes.Filter := '';
    DmExporterClient2.CdsVirtualClientes.Filtered := False;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Clientes');
        DmExporterClient2.CdsClientes.Close;
        Exit;
      end;
  End;
end;

procedure TFrmExporterClient.ConsistenciaContasReceber;
var
 Dados : Variant;
 GeraTemp : Boolean;
 Dias : String;
 Alterados : Integer;
begin
  //Consistencia de Contas a Receber Loja Matriz
  Try
    AbreTransacao;
    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Consistencia de Contas a Receber Loja Matriz');
    Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2013, Filial, '');
    if (Dados <> null) then
     begin
        DmExporterClient2.CdsVirtualContasReceber.CreateDataSet;
        DmExporterClient2.CdsVirtualContasReceber.Data := Dados;
        DmExporterClient2.CdsVirtualContasReceber.Open;

        DmExporterClient2.CdsVirtualCD.CreateDataSet;
        DmExporterClient2.CdsVirtualCD.Open;
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - ' + InttoStr(DmExporterClient2.CdsVirtualContasReceber.RecordCount) + ' - registros recebidos');
        if DmExporterClient2.CdsVirtualContasReceber.RecordCount > 0 then
         begin
            DmExporterClient2.CdsVirtualContasReceber.Last;
            Dias := DmExporterClient2.CdsVirtualContasReceberCD_CONTAS_RECEBER.AsString;
            DmExporterClient2.CdsVirtualContasReceber.Delete;
            DmExporterClient2.CdsVirtualContasReceber.First;
            while not DmExporterClient2.CdsVirtualContasReceber.Eof do
             begin
               DmExporterClient2.CdsContasReceber.Close;
               DmExporterClient2.CdsContasReceber.Params[0].AsFloat := DmExporterClient2.CdsVirtualContasReceber.Fields[0].AsFloat;
               DmExporterClient2.CdsContasReceber.Open;
               if DmExporterClient2.CdsContasReceber.RecordCount = 0 then
                begin
                  DmExporterClient2.CdsVirtualCD.Append;
                  DmExporterClient2.CdsVirtualCDCD.AsFloat := DmExporterClient2.CdsVirtualContasReceberCD_CONTAS_RECEBER.AsFloat;
                  DmExporterClient2.CdsVirtualCD.Post;
                end;
               DmExporterClient2.CdsVirtualContasReceber.Next;
             end;
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Codigos CR para Gestao Loja -> Matriz: ' + IntToSTr(DmExporterClient2.CdsVirtualCD.RecordCount));
            if DmExporterClient2.CdsVirtualCD.RecordCount > 0 then
               Dados := (DmExporterClient.HTTPRIO1 as IDmProcessa).Processa(2014, Filial, DmExporterClient2.CdsVirtualCD.Data);
         end;
        DmExporterClient2.CdsVirtualCD.Close;

        GeraTemp := True;
        DmExporterClient2.CdsVirtualContasReceber.IndexFieldNames := 'CD_CONTAS_RECEBER';
        DmExporterClient2.CdsVirtualContasReceber.Filtered := True;
        DmExporterClient2.CdsVirtualContasReceber.First;

        if StrtoFloatDef(Dias, 0) = 0 then
           Dias := '30';

        Alterados := 0;
        DmExporterClient2.CdsContasReceberTodas.Close;
        DmExporterClient2.SqlContasReceberTodas.CommandText := DmExporterClient2.SqlContasReceberTodas.CommandText + ' WHERE DT_LANCAMENTO >= CURRENT_DATE - ' + Dias;
        DmExporterClient2.CdsContasReceberTodas.Open;
        DmExporterClient2.CdsContasReceberTodas.IndexFieldNames := 'CD_CONTAS_RECEBER';
        DmExporterClient2.CdsContasReceberTodas.First;
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Processando no banco local Contas Receber Matriz -> Loja: ' + IntToSTr(DmExporterClient2.CdsContasReceberTodas.RecordCount));
        while not DmExporterClient2.CdsContasReceberTodas.Eof do
         begin
           if not DmExporterClient2.CdsVirtualContasReceber.FindKey([DmExporterClient2.CdsContasReceberTodasCD_CONTAS_RECEBER.AsFloat]) then
            begin
              try
                DmExporterClient.Sql1.CommandText := 'UPDATE CONTAS_RECEBER SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CONTAS_RECEBER = ' + DmExporterClient2.CdsContasReceberTodasCD_CONTAS_RECEBER.AsString;
                DmExporterClient.Sql1.ExecSQL(True);
                Inc(Alterados);
              except
              end;
            end;
           DmExporterClient2.CdsContasReceberTodas.Next;
         end;
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Contas Receber Reenviados para a Gestao: ' + IntToSTr(Alterados));
     end;
    ConfirmaTransacao;
    DmExporterClient2.CdsVirtualContasReceber.Close;
    DmExporterClient2.CdsContasReceber.Close;
    DmExporterClient2.CdsContasReceberTodas.Close;
  Except
    on E:Exception do
      begin
        CancelaTransacao;
        GravaLog(TimetoStr(Time) + ' - ' + E.Message);
        GravaLog(TimetoStr(Time) + ' - Erro ocorrido no processo de Consistencia de Contas a Receber');
        DmExporterClient2.CdsVirtualContasReceber.Close;
        DmExporterClient2.CdsContasReceber.Close;
        DmExporterClient2.CdsContasReceberTodas.Close;
        Exit;
      end;
  End;
end; 
end.
