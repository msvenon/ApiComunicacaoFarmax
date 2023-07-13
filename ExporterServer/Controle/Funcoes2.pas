unit Funcoes2;

interface

uses
  Windows, Graphics, Jpeg, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  ExtCtrls, Db,
   DBCtrls, Registry, StdCtrls, Printers,

   ComCtrls, DbClient, TLHelp32, WinSpool, StrUtils, IniFiles, Gauges,
  ShellAPI, Variants, Buttons, wwdbgrid, wwdbigrd, WwExport,

  wwdblook, Wwdbdlg, Wwkeycb, wwdbdatetimepicker, wwdbedit, Wwdotdot,
  Wwdbcomb, wwFrame,  Rio, SOAPHTTPClient, ComObj, ActiveX, UrlMon,
  IdHTTP, Winsock, IdStack, IdIPWatch, WinInet, IdBaseComponent, IdComponent,
  IdRawBase, IdRawClient, IdIcmpClient, SqlExpr, ImageHlp,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.DBX.Migrate;

type
  TFrmMensagemProgresso = class(TForm)
    Panel1: TPanel;
    Gauge1: TGauge;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure MSGAguarde(strTexto: String = ''; boolAguarde: Boolean = true);
procedure MSGAguarde2;
procedure Aguarde(Formulario: TForm; Mensagem: string = '');
procedure FimAguarde(Formulario: TForm);

function EnviaTecla(key : string) : string;
function PegaSysDir: string;
Function ExtractSystemDir : String;

function FormataValor(var sValor : String; Decimais : Integer) : String;
function TruncFix( X : Double ) : Real;

//Funcao de encriptacao de dados
function EncryptMsg (Msg1: string; EncryptNo: integer): string;
//Funcao de decriptacao de dados
function DecryptMsg (Msg1: string; DecryptNo: integer): string;
// Função que reverte as Strings
function Reverse (S: string): string;

// Verifica o numero de Serie do HD
function SerialHD(Drive: String): String;
Function SerialNum(FDrive:String) :String;
// Retorna o serial lógico do HD
function GetIdeDiskSerialNumber : String;
function GetSataDiskSerialNumber : String;
//Retorna o serial físico do HD
Function SerialNumHD(FDrive:String) :String;

// Função para extrair o valor em Real e retornar um Inteiro
function ExtValor(Valor: Real): Integer;
// Função para imprimir o cabecalho
function Cabecalho(Pagina: Integer; var ArqImp: TextFile; NomeEmp, TitRel, ModoImp: String): Boolean;
// Função para verificar Tabela vazia
function VerificaTabelaVazia(QryBusca: TFDQuery; Select, Where: String): Boolean;
// Função para buscar os dados de uma tabela via SQL
function BuscaRegistro(QryBusca: TFDQuery; Select, Where: String): Boolean;
//function ErroSQL(Erro: EDBEngineError; Mensagem: String): Boolean;
// Função para Colocar zeros à esquerda de strings
function Zeros(Texto: String; TamanhoRet: Integer): String;
// Função para replicar um caracter x vezes
function Replicar(Caracter: Char; TamanhoRepl: Integer): String;

function Centrar(Texto: String; TamanhoRet: Integer): String;
// Função para adicionar espaços à esquerda de uma string
function LeftSpace(Texto: String; TamanhoRet: Integer): String;
// Função para espaços a direita
function RightSpace(Text: String; TamanhoRet: Integer): String;
// Função para adicionar espaços
function Space(Tamanho: Integer): String;
// Função para Decifrar siglas de Empresa
function DecifraEmp(Texto: String): String;
//Função para formatr CEP
function FormataCEP(Texto: String): String;
//Função para formatr CPF
function FormataCPF(Texto: String): String;
function FormataCPF2(Texto: String): String;
//Função para formatr CGC
function FormataCGC(Texto: String): String;
// remove os pontos do CNPJ caso existam 
function RemovePontoCNPJ(CNPJ : String) : String;
// remove caracteres invalidos
function RemoveCaracteresInvalidos(Texto : String) : String;
//Função para formatr Telefone
function FormataFone(Texto: String): String;
//Função para formatr Placa
function FormataPlaca(Texto: String): String;

function Possibilidades(Texto: String; Caso1: String; Caso2: String; Caso3: String; Caso4: String;
         Caso5: String; Retorno1: String; Retorno2: String; Retorno3: String; Retorno4: String; Retorno5: String): String;
// Função para converter valores String para Real é testar se e um valor válido
function ConvFloat(Valor: String): Real;
// Busca Código Máximo da tabela
function BuscaMax(QryMax: TFDQuery; Select, Where: String): Integer;
// Função para seleciona os registro com parametros
function BuscaSelecao(QrySelecao: TFDQuery; Select, Where, Order: String): Boolean;
// Função para somar os campos da tabela
function Soma(QrySoma: TFDQuery; Select, Where: String): Boolean;

//Funcao para validar CPF
function ValidaCPF(Dado : string) : boolean;  // Valida CPF

//Funcao para validar CGC
function ValidaCGC(Dado : string) : boolean;  // Valida CGC

//Funcao para validar Inscricao Estadual
Function ValidaInscricao(Inscricao, Tipo : String) : Boolean;
Function Mascara_Inscricao(Inscricao, Estado : String) : String;

Function ValidaUF( Estado : String ) : Boolean;

//***
//***  Novas funções
//***
function MDRegistry(LSvouf : String; NTFDnovapath: String) : String;
//Converte String para PChar
function StrToPChar(const Str: string): PChar;
function CopiaTabela(TabFonte, TabDestino:String):Boolean;
function AdicionaAlias(NomeAlias, Caminho, Driver : String):Boolean;
function RemoveAlias(NomeAlias : String):Boolean;
function ManipulaForm(nomform : TForm; Tnomform : TFormClass; comando : integer = 1; esquerda : integer = 0; altura : integer = 108; largura : integer = 468; tamanho : integer = 800; capt: string = ''):boolean;
function ComponenteToString(Component: TComponent): string;
function StringToComponente(Value: string): TComponent;
function Checalog(user, senha, privl, privlcheck : string):boolean;

//funcoes flavio

//funcao que formata valores flutuantes adicionando a máscara '#,##0.00'
function FF(Valor : Real) : Real;

//função para validar o valor do campo caso o mesmo seja requerido
function ValidaCampoRequerido(Cds: TClientDataSet; Formulario : TForm): Boolean;

//procedure que seta o foco em um objeto através do nome do campo ao qual o mesmo está conectado
//procedure utilizada pela função 'ValidaCampoRequerido' (acima)
procedure SetaFoco(Formulario : TForm; Campo : String);

//função que retorna uma string com a primeira letra maiuscula inclusive apos os espacos
function PrimeiraMaiuscula(Texto : String) : String;
//função que preenche os espaços vazios de uma string com um caracter
function PreencheEspacos(Texto, Caracter : String) : String;
//função que adiciona espacos em branco na frente de uma string
function AdicionaEspacos(Texto : String; Qtd: Integer): String;

//as funções abaixo antes estava em funcoes3
// Testa se a string representa um numero
function TestNumero(oNumero:String):Boolean;
//Execute um programa e espera seu fechamento
function ExecAndWait(const FileName, Params: string; const WindowState: Word; ProcessName : String): boolean;
// Adiciona zeros a frente de um valor
function StrZero(Num : Real ; Zeros,Deci: integer): string;
// Elimina todos os espacos vazios de ums string
function Alltrim(Text : string) : string;
function LTrim(Text : string) : string;


// Funcao para atualizar saldo de contas
function AtualizaSaldo(Tabela: TClientDataSet; ID: TFloatField; Data: TDateField; Saldo: TFloatField;
                       ValorAtual,ValorAnterior : Extended; TipoAtual,TipoAnterior : String;
                       DataAtual, DataAnterior : TDateTime; ContaAtual,ContaAnterior : Extended):Boolean;

function AtualizaSaldoEstoque(Tabela: TClientDataSet; Cd_Filial: TIntegerField; Cd_Vendedor: TIntegerField;
                              Data: TSqlTimeStampField; Saldo: TFloatField; ValorAtual, ValorAnterior: Extended;
                              TipoAtual, TipoAnterior: String; DataAtual, DataAnterior: TDateTime;
                              FilialAtual, FilialAnterior: Integer; ContaAtual, ContaAnterior: Integer): Boolean;

procedure ChangeByteOrder( var Data; Size : Integer );
//Converte os caracteres de uma string para código ASCII
function AnyStrtoIntStr(Texto : String) : String;
//Converte um hexadecimal em numérico inteiro
function HexToInt(const HexStr: string): longint;
// Funcao de encriptação de strings
function Crypt(Action, Src: String): String;
// Funcao de encriptação de strings
function EncryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
// Funcao de decriptação de strings
function DecryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;


/////////  funcoes com datas ///////////////
// Função para Extrair as barras e Inverter a data e retornar uma String
function ExtInvData(VarData: TDate): String;
// Função para extrair da data e retornar uma String
function ExtData(VarData: TDate): String;
// Função para adicionar x meses em uma data
function DataFinal(Inicio: TDate; TotalMeses: Integer): String;

function DecodificarData(vencimento: TDateTime): string;
function DataInicial(Inicio : TDateTime) : TDateTime;
Function ProximoDiaUtil (dData : TDateTime) : TDateTime;
Function DiadaSemana(Data : TDateTime) : string;
Function PrimeiroDiaUtilSemana(Data : TDateTime) : TDateTime;
Function Dias_Uteis(DataI,DataF:TDateTime):Integer;

Function PrimeiroDiaDoMes(dData : TdateTime) : TDateTime;
Function UltimoDiadoMes(dData: TDateTime) : TDateTime;


Function VerificaProcesso(Arquivo : string) : Boolean;
Function VerificaProcesso2(Arquivo : string) : Boolean;


Function Verifica1Processo(Arquivo : string) : Boolean;


function Extenso(Valor:Extended):String;
function FormataPlanoContas(Texto : String) : String;
function PadR(Texto : String; Tamanho : Integer) : String;
function PadL(Texto : String; Tamanho : Integer) : String;
function RemovePonto(Texto : String) : String;
procedure Delay(Tempo: Real);
//procedure TimeDelay(Tempo: Real);

function AcessoOperacaoGerencial(DataSet : TClientDataSet; Modulo, OperacaoModulo : String) : Boolean;
function AcessoManutencao : Boolean;
function SuperUsuario(Usuario : String) : Boolean;
function SuperSenha(Senha : String) : Boolean;
function SuperSenhaHora(Senha : String) : Boolean;
function GeraSuperSenha : String;
function GeraSuperSenhaHora : String;

function AcessoGerencial(DataSet : TClientDataSet; Modulo : String) : Boolean;
function AcessoGerencial2(DataSet : TClientDataSet; Modulo : String) : Boolean;
  // aletrar FarmaxProdutos
function AcessoGerencialVenda(DataSet : TClientDataSet; Modulo : String; Cd_VendaGerencial, Id_Produto : Real) : Boolean;
function VerificaAutorizacao(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String) : Boolean;
function VerificaAutorizacao2(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String) : Boolean;
function VerificaAutorizacaoVenda(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String; Cd_VendaGerencial, Id_Produto : Real) : Boolean;
  // aletrar FarmaxProdutos
function VerificaAutorizacaoInversa(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String) : Boolean;
function VerificaOperacao(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente, Operacao : String) : Boolean;
function FormataSemArredondar(Value : Real; Decimais : Integer) : Extended;
function LePortasSeriais : TStrings;

function MudaResolucao(Resolucao, Bits : Integer) : Boolean;

Function Trunca( valor: currency): currency;
function ArredondaPara(valor: Currency; decimais: Integer=2): Currency;

Procedure TrataErros(Mensagem : String);
Function StrTran( cString, cProcura, cTroca : string ): string;
Function VerificaImpressoraInstalada : Boolean;

Function FazLogErroApply(Cds : TClientDataSet; Evento : String) : Boolean;
Procedure FecharDataSet(Cds : TClientDataSet);

Function Preenche(Texto, Caracter, Posicao : String; Tamanho : Integer) : String;

Procedure ExibeInformation(Texto : String);
Procedure ExibeMensagemPAF(Texto : String);
Procedure ExibeWarning(Texto : String);
procedure ExibeMensagem(Texto : String; Exibe : Boolean);
//mensagem com um gauge exibindo o andamento de um processo


Procedure ExibeError(Texto : String);
Function ExibeYesNo(Texto : String; Default : String) : Boolean;

Procedure FormPos(Form: TForm; const Horz, Vert, MaisUm: byte);

Function TiraCaracteresInvalidos(Texto : String) : String;
Function UltimoDiaMes(Mes : Real) : Real;

//Retorna o nome do computador
function NomeMaquina: string;
function NomeComputador : string;
//Retorna o nome do usuário do computador
function NomeUsuarioComputador: string;

function DiretorioSistema: String;
function FormatPath(path : String):string;

function VerImpressoraONLINE: Cardinal;
function GetCurrentPrinterHandle: THandle;

//* Verifica se o valor está em branco [FB]
function ChkValorVazio( varValor : Variant ) : Boolean;

//* Retorna uma string contendo os valores de um StringList separado por um separador [FB]
function GetStlLisSeparado( stlSepara : TStringList; strSeparador : String = ';') : String;

//* Retorna um StringList a partir de uma string com separador [FB]
function GetStrDeStringList( strOrigem : String; strSeparador : String = ';' ) : TStringList;

//* Retorna um stringlist contendo os campos que compoe o indice [FB]
function GetCamIndComposto( ClientDataSet : TClientDataSet ) : TStringList;

//* Adiciona um indice ao ClientDataSet [FB]
procedure SetIndice(ClientDataSet1 : TClientDataSet; stlNomColuna : TStringList; blnAdicionar : Boolean = False );
procedure GridTitleClick(FieldName : String; ClientDataSet: TClientDataSet);

procedure AbrirDocumento(f_name: string);

{ retorna a versão do executavel }
function VersaoExe(const Filename: String): String;
// Retorna o número de linhas que um arquivo possui
function NumLinhasArq(Arqtexto : String): integer;
// Funcao que habilita e dasabilita bitbtns
procedure ControlaBotoes(Formulario : TForm);
// Centraliza objeto descendente de TControl no formulario (horizontal)
procedure CentralizaTControl(Objeto : TControl);
procedure ExportarWwDbGridExcel(Grid : TWwDbGrid; Arquivo : String);
procedure GeraLog(Mensagem : String);
procedure GravaLogErroBanco(Mensagem : String);
procedure GeraLogNotasFiscais(Mensagem : String);

function ConectadoInternet: boolean;
function ConectadoServidor(IP : String): boolean;
function estaConectado: boolean;
function VerificaIPnaRede(IP : String) : Boolean;

//seta cor dos objetos de acordo com um arquivo de configuração
procedure ConfiguraCor(Formulario : TForm; Esquema : String);
procedure MudaCorForm(Formulario : TForm);

//-------------- arquivos txt ---------------//
procedure CriaArquivoIni;
function  LeIni(IniFile:String;Secao:String;Chave:String):String;
procedure CriaIni(IniFile:String);
procedure GravaIni(IniFile:String;Secao:String;Chave:String;valor:String);

procedure GravaControleINI(Venda, Status, Cd_operador, Id_OperadorCaixa, DataCaixa : String);

//funcoes de tratamento de Driver Logico
Function CreateDrive(DriveLetter, DrivePath:String):Boolean;
Function RemoveDrive(DriveLetter:String):Boolean;
Function GetDrivePath(DriveLetter:String):String;
Function MapearUnidade(DriveLetter, DrivePath:String):String;
function CancelaMapeamento(Mapeamento: PChar; CanForce: Boolean): String;
function MapearRede3(var NetResource: TNetResource; Usuario, Senha: string): string;
function MapearRede2(var NetResource: TNetResource; Usuario, Senha: string): string;
function MapearRede(UnidadeRede, Letra, Senha: Pchar): String;

function AcessoSuperSenha : Boolean;
function AcessoSuperSenhaHora : Boolean;

Function GetSysDrive: String;

function SysComputerName: string;

function AssinaturaHash(Arq : String) : String;

function RemoveZeroInicial(Texto : String) : String;

procedure FormataForm(Sender:TComponent);

function MesPorExtenso(Mes : Integer) : String;

function RemoveCaracteresInvalidos2(Texto: String): String;

function VerificaPastaVersao : Boolean;

procedure TrataRetornoSMS(Retorno : String);

function SetIpConfig(AGateWay : string) : integer;

function EnviaSMS(Telefone, Mensagem : String) : Boolean;

function RetornaIPexterno : String;

function RetornaIPinterno : String;
function PingaIP(IP : String): Boolean;

function RetornaDataArquivo(Arquivo: String): TDateTime;

Procedure AlterarPapelParede;

function TamanhoArquivo(Arquivo: string): Integer;

procedure BMPtoJPEG (ABitmap : TBitmap; var AJPEG: TJPEGImage);

function ValidaEAN(Numero:string): Boolean;


procedure DesabilitaPortaFirewall(Nome:String);
procedure HabilitaPortaFirewall(Nome:String);
function  StatusPortaFirewall(Nome:String):String;
procedure AdicionaPortaFirewall(Nome, Porta:String);
procedure RemovePortaFirewall(Nome:String);
procedure IniciaFirewall;
procedure ParaFirewall;
function  CalculaDigEAN13(Cod:String):String;

function VersaoArquivo(const Filename: String): String;

function SearchForFile(const ARootPath: string;
                       const AFileName: string;
                       var APathFound: string): Boolean;

function FileExistsSomewhere(FileName : String; var Path : String) : Boolean;

function ExibeMensagemTEFNFCe(Msg :String; AType: TMsgDlgType; AButtons : TMsgDlgButtons;
  IndiceHelp : LongInt; DefButton : TModalResult=MrNone) : Word;


//mauricio

function  RetornaId ( Campo : String ) : Double;
function  AtualizaEstoque (Id_produto: Double):Double;
function  GravarDataInvertidaYYYYMMDD(Data:String):String;
function  ExibeDataInvertidaYYYYMMDDparaDDMMYYYY(Data:String):TDate;
function  TamanhoDeString (Texto :String):Integer;
function  RemovePontoValorString(Valor:String):String;
function  ExibeDataOrdemBr(Data:string):String;
Function  RemoveTags (HTML :String):String;
function  RetiraAspasSimples(Texto:String):String;





function ApagaArquivosExtensao(Diretorio, Extensao : String) : Boolean;


const
  vCtrlPrtNormal     = #18;
  vCtrlPrtCondensa   = #15;
  vCtrlPrtExpande    = #14;
  vCtrlPrtDesExpande = #20;
  vCtrlPrtNegrita    = #27+'E';
  vCtrlPrtDesNegrita = #27+'F';
  vCtrlPrtMeiaPag    = #27+'C'+'0'+'5.5';
  vCtrlPrtUmaPag     = #27+'C'+'0'+'11';

  //* Constantes do Sistema (CS) [FB]
  CS_IndMaxName = 31;

 SqlProdutos =
   'SELECT PRODUTOS.ID_PRODUTO, PRODUTOS.CD_PRODUTO, PRODUTOS.DESCRICAO, PRODUTOS.PRECO_VENDA, PRODUTOS.CD_GRUPOBALANCO, PRODUTOS.CD_GRUPOCOMPRA,' +
   'PRODUTOS.PRECO_VENDA_ANTERIOR, PRODUTOS.CD_GRUPO, PRODUTOS.CD_CLASSE, PRODUTOS.CD_LABORATORIO, PRODUTOS.ID_FAMILIA,' +
   'PRODUTOS.QT_EMBALAGEM, PRODUTOS.PRECO_PROMOCAO, PRODUTOS.MARGEM, PRODUTOS.CODIGO_BARRAS_1, PRODUTOS.CODIGO_BARRAS_2, PRODUTOS.CD_LISTA, ' +
   'PRODUTOS.DT_REAJUSTE, PRODUTOS.DT_VENCIMENTO_PROMOCAO, PRODUTOS.DT_ALTERACAO, PRODUTOS.IDENTIFICADOR, ' +
   'PRODUTOS.CUSTO_UNITARIO, PRODUTOS.CUSTO_MEDIO, PRODUTOS.UNIDADE, PRODUTOS.ICMS, PRODUTOS.SITUACAOTRIBUTARIA, '+
   'PRODUTOS.CUSTO_UNITARIO_1, PRODUTOS.CUSTO_UNITARIO_2, PRODUTOS.CUSTO_UNITARIO_3, PRODUTOS.CUSTO_UNITARIO_4, ' +
   'PRODUTOS.CUSTO_UNITARIO_5, PRODUTOS.CUSTO_UNITARIO_6, PRODUTOS.CUSTO_UNITARIO_7, PRODUTOS.CUSTO_UNITARIO_8, ' +
   'PRODUTOS.CUSTO_UNITARIO_9, PRODUTOS.CUSTO_UNITARIO_10, PRODUTOS.CUSTO_UNITARIO_11, PRODUTOS.CUSTO_UNITARIO_12, ' +
   'PRODUTOS.CUSTO_UNITARIO_13, PRODUTOS.CUSTO_UNITARIO_14, PRODUTOS.CUSTO_UNITARIO_15, ' +
   'PRODUTOS.CUSTO_UNITARIO_16, PRODUTOS.CUSTO_UNITARIO_17, PRODUTOS.CUSTO_UNITARIO_18, ' +
   'PRODUTOS.CUSTO_UNITARIO_19, PRODUTOS.CUSTO_UNITARIO_20, ' +
   'PRODUTOS.CUSTO_UNITARIO_21, PRODUTOS.CUSTO_UNITARIO_22, PRODUTOS.CUSTO_UNITARIO_23, PRODUTOS.CUSTO_UNITARIO_24, ' +
   'PRODUTOS.CUSTO_UNITARIO_25, PRODUTOS.CUSTO_UNITARIO_26, PRODUTOS.CUSTO_UNITARIO_27, PRODUTOS.CUSTO_UNITARIO_28, ' +
   'PRODUTOS.CUSTO_UNITARIO_29, PRODUTOS.CUSTO_UNITARIO_30, ' +
   'PRODUTOS.CUSTO_MEDIO_1, PRODUTOS.CUSTO_MEDIO_2, PRODUTOS.CUSTO_MEDIO_3, PRODUTOS.CUSTO_MEDIO_4, ' +
   'PRODUTOS.CUSTO_MEDIO_5, PRODUTOS.CUSTO_MEDIO_6, PRODUTOS.CUSTO_MEDIO_7, PRODUTOS.CUSTO_MEDIO_8, ' +
   'PRODUTOS.CUSTO_MEDIO_9, PRODUTOS.CUSTO_MEDIO_10, PRODUTOS.CUSTO_MEDIO_11, PRODUTOS.CUSTO_MEDIO_12, ' +
   'PRODUTOS.CUSTO_MEDIO_13, PRODUTOS.CUSTO_MEDIO_14, PRODUTOS.CUSTO_MEDIO_15, ' +
   'PRODUTOS.CUSTO_MEDIO_16, PRODUTOS.CUSTO_MEDIO_17, PRODUTOS.CUSTO_MEDIO_18, ' +
   'PRODUTOS.CUSTO_MEDIO_19, PRODUTOS.CUSTO_MEDIO_20, ' +
   'PRODUTOS.CUSTO_MEDIO_21, PRODUTOS.CUSTO_MEDIO_22, PRODUTOS.CUSTO_MEDIO_23, PRODUTOS.CUSTO_MEDIO_24, ' +
   'PRODUTOS.CUSTO_MEDIO_25, PRODUTOS.CUSTO_MEDIO_26, PRODUTOS.CUSTO_MEDIO_27, PRODUTOS.CUSTO_MEDIO_28, ' +
   'PRODUTOS.CUSTO_MEDIO_29, PRODUTOS.CUSTO_MEDIO_30, ' +
   'PRODUTOS.ESTOQUE_0, PRODUTOS.ESTOQUE_1, PRODUTOS.ESTOQUE_2, PRODUTOS.ESTOQUE_3, ' +
   'PRODUTOS.ESTOQUE_4, PRODUTOS.ESTOQUE_5, PRODUTOS.ESTOQUE_6, PRODUTOS.ESTOQUE_7, ' +
   'PRODUTOS.ESTOQUE_8, PRODUTOS.ESTOQUE_9, PRODUTOS.ESTOQUE_10, PRODUTOS.ESTOQUE_11, PRODUTOS.ESTOQUE_12,' +
   'PRODUTOS.ESTOQUE_13, PRODUTOS.ESTOQUE_14, PRODUTOS.ESTOQUE_15,' +
   'PRODUTOS.ESTOQUE_16, PRODUTOS.ESTOQUE_17, PRODUTOS.ESTOQUE_18,' +
   'PRODUTOS.ESTOQUE_19, PRODUTOS.ESTOQUE_20, ' +
   'PRODUTOS.ESTOQUE_21, PRODUTOS.ESTOQUE_22, PRODUTOS.ESTOQUE_23, PRODUTOS.ESTOQUE_24, ' +
   'PRODUTOS.ESTOQUE_25, PRODUTOS.ESTOQUE_26, PRODUTOS.ESTOQUE_27, PRODUTOS.ESTOQUE_28, ' +
   'PRODUTOS.ESTOQUE_29, PRODUTOS.ESTOQUE_30, ' +
   'PRODUTOS.FACE_1, PRODUTOS.FACE_2, PRODUTOS.FACE_3, PRODUTOS.FACE_4, PRODUTOS.FACE_5, PRODUTOS.FACE_6, PRODUTOS.FACE_7, ' +
   'PRODUTOS.FACE_8, PRODUTOS.FACE_9, PRODUTOS.FACE_10, PRODUTOS.FACE_11, PRODUTOS.FACE_12, PRODUTOS.FACE_13, PRODUTOS.FACE_14, PRODUTOS.FACE_15,' +
   'PRODUTOS.FACE_16, PRODUTOS.FACE_17, PRODUTOS.FACE_18, PRODUTOS.FACE_19, PRODUTOS.FACE_20, ' +
   'PRODUTOS.FACE_21, PRODUTOS.FACE_22, PRODUTOS.FACE_23, PRODUTOS.FACE_24, PRODUTOS.FACE_25, PRODUTOS.FACE_26, PRODUTOS.FACE_27, PRODUTOS.FACE_28, ' +
   'PRODUTOS.FACE_29, PRODUTOS.FACE_30, ' +
   'PRODUTOS.ESTOQUE_MINIMO_1, PRODUTOS.ESTOQUE_MINIMO_2, PRODUTOS.ESTOQUE_MINIMO_3, PRODUTOS.ESTOQUE_MINIMO_4, ' +
   'PRODUTOS.ESTOQUE_MINIMO_5, PRODUTOS.ESTOQUE_MINIMO_6, PRODUTOS.ESTOQUE_MINIMO_7, PRODUTOS.ESTOQUE_MINIMO_8, ' +
   'PRODUTOS.ESTOQUE_MINIMO_9, PRODUTOS.ESTOQUE_MINIMO_10, PRODUTOS.ESTOQUE_MINIMO_11, PRODUTOS.ESTOQUE_MINIMO_12, ' +
   'PRODUTOS.ESTOQUE_MINIMO_13, PRODUTOS.ESTOQUE_MINIMO_14, PRODUTOS.ESTOQUE_MINIMO_15, ' +
   'PRODUTOS.ESTOQUE_MINIMO_16, PRODUTOS.ESTOQUE_MINIMO_17, PRODUTOS.ESTOQUE_MINIMO_18, ' +
   'PRODUTOS.ESTOQUE_MINIMO_19, PRODUTOS.ESTOQUE_MINIMO_20,  ' +
   'PRODUTOS.ESTOQUE_MINIMO_21, PRODUTOS.ESTOQUE_MINIMO_22, PRODUTOS.ESTOQUE_MINIMO_23, PRODUTOS.ESTOQUE_MINIMO_24, ' +
   'PRODUTOS.ESTOQUE_MINIMO_25, PRODUTOS.ESTOQUE_MINIMO_26, PRODUTOS.ESTOQUE_MINIMO_27, PRODUTOS.ESTOQUE_MINIMO_28, ' +
   'PRODUTOS.ESTOQUE_MINIMO_29, PRODUTOS.ESTOQUE_MINIMO_30, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_1, PRODUTOS.ESTOQUE_MAXIMO_2, PRODUTOS.ESTOQUE_MAXIMO_3, PRODUTOS.ESTOQUE_MAXIMO_4, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_5, PRODUTOS.ESTOQUE_MAXIMO_6, PRODUTOS.ESTOQUE_MAXIMO_7, PRODUTOS.ESTOQUE_MAXIMO_8, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_9, PRODUTOS.ESTOQUE_MAXIMO_10, PRODUTOS.ESTOQUE_MAXIMO_11, PRODUTOS.ESTOQUE_MAXIMO_12, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_13, PRODUTOS.ESTOQUE_MAXIMO_14, PRODUTOS.ESTOQUE_MAXIMO_15, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_16, PRODUTOS.ESTOQUE_MAXIMO_17, PRODUTOS.ESTOQUE_MAXIMO_18, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_19, PRODUTOS.ESTOQUE_MAXIMO_20, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_21, PRODUTOS.ESTOQUE_MAXIMO_22, PRODUTOS.ESTOQUE_MAXIMO_23, PRODUTOS.ESTOQUE_MAXIMO_24, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_25, PRODUTOS.ESTOQUE_MAXIMO_26, PRODUTOS.ESTOQUE_MAXIMO_27, PRODUTOS.ESTOQUE_MAXIMO_28, ' +
   'PRODUTOS.ESTOQUE_MAXIMO_29, PRODUTOS.ESTOQUE_MAXIMO_30, ' +
   'PRODUTOS.DT_ULT_VENDA_1, PRODUTOS.DT_ULT_VENDA_2, PRODUTOS.DT_ULT_VENDA_3, PRODUTOS.DT_ULT_VENDA_4, ' +
   'PRODUTOS.DT_ULT_VENDA_5, PRODUTOS.DT_ULT_VENDA_6, PRODUTOS.DT_ULT_VENDA_7, PRODUTOS.DT_ULT_VENDA_8, ' +
   'PRODUTOS.DT_ULT_VENDA_9, PRODUTOS.DT_ULT_VENDA_10, PRODUTOS.DT_ULT_VENDA_11, PRODUTOS.DT_ULT_VENDA_12, ' +
   'PRODUTOS.DT_ULT_VENDA_13, PRODUTOS.DT_ULT_VENDA_14, PRODUTOS.DT_ULT_VENDA_15, ' +
   'PRODUTOS.DT_ULT_VENDA_16, PRODUTOS.DT_ULT_VENDA_17, PRODUTOS.DT_ULT_VENDA_18, ' +
   'PRODUTOS.DT_ULT_VENDA_19, PRODUTOS.DT_ULT_VENDA_20, ' +
   'PRODUTOS.DT_ULT_VENDA_21, PRODUTOS.DT_ULT_VENDA_22, PRODUTOS.DT_ULT_VENDA_23, PRODUTOS.DT_ULT_VENDA_24, ' +
   'PRODUTOS.DT_ULT_VENDA_25, PRODUTOS.DT_ULT_VENDA_26, PRODUTOS.DT_ULT_VENDA_27, PRODUTOS.DT_ULT_VENDA_28, ' +
   'PRODUTOS.DT_ULT_VENDA_29, PRODUTOS.DT_ULT_VENDA_30, ' +
   'PRODUTOS.DT_ULT_COMPRA_1, PRODUTOS.DT_ULT_COMPRA_2, PRODUTOS.DT_ULT_COMPRA_3, PRODUTOS.DT_ULT_COMPRA_4, ' +
   'PRODUTOS.DT_ULT_COMPRA_5, PRODUTOS.DT_ULT_COMPRA_6, PRODUTOS.DT_ULT_COMPRA_7, PRODUTOS.DT_ULT_COMPRA_8, ' +
   'PRODUTOS.DT_ULT_COMPRA_9, PRODUTOS.DT_ULT_COMPRA_10, PRODUTOS.DT_ULT_COMPRA_11, PRODUTOS.DT_ULT_COMPRA_12, ' +
   'PRODUTOS.DT_ULT_COMPRA_13, PRODUTOS.DT_ULT_COMPRA_14, PRODUTOS.DT_ULT_COMPRA_15, ' +
   'PRODUTOS.DT_ULT_COMPRA_16, PRODUTOS.DT_ULT_COMPRA_17, PRODUTOS.DT_ULT_COMPRA_18, ' +
   'PRODUTOS.DT_ULT_COMPRA_19, PRODUTOS.DT_ULT_COMPRA_20, ' +
   'PRODUTOS.DT_ULT_COMPRA_21, PRODUTOS.DT_ULT_COMPRA_22, PRODUTOS.DT_ULT_COMPRA_23, PRODUTOS.DT_ULT_COMPRA_24, ' +
   'PRODUTOS.DT_ULT_COMPRA_25, PRODUTOS.DT_ULT_COMPRA_26, PRODUTOS.DT_ULT_COMPRA_27, PRODUTOS.DT_ULT_COMPRA_28, ' +
   'PRODUTOS.DT_ULT_COMPRA_29, PRODUTOS.DT_ULT_COMPRA_30, ' +
   'PRODUTOS.CURVA_UNITARIA_1, PRODUTOS.CURVA_UNITARIA_2, PRODUTOS.CURVA_UNITARIA_3, PRODUTOS.CURVA_UNITARIA_4, ' +
   'PRODUTOS.CURVA_UNITARIA_5, PRODUTOS.CURVA_UNITARIA_6, PRODUTOS.CURVA_UNITARIA_7, PRODUTOS.CURVA_UNITARIA_8, ' +
   'PRODUTOS.CURVA_UNITARIA_9, PRODUTOS.CURVA_UNITARIA_10, PRODUTOS.CURVA_UNITARIA_11, PRODUTOS.CURVA_UNITARIA_12, ' +
   'PRODUTOS.CURVA_UNITARIA_13, PRODUTOS.CURVA_UNITARIA_14, PRODUTOS.CURVA_UNITARIA_15, ' +
   'PRODUTOS.CURVA_UNITARIA_16, PRODUTOS.CURVA_UNITARIA_17, PRODUTOS.CURVA_UNITARIA_18, ' +
   'PRODUTOS.CURVA_UNITARIA_19, PRODUTOS.CURVA_UNITARIA_20, ' +
   'PRODUTOS.CURVA_UNITARIA_21, PRODUTOS.CURVA_UNITARIA_22, PRODUTOS.CURVA_UNITARIA_23, PRODUTOS.CURVA_UNITARIA_24, ' +
   'PRODUTOS.CURVA_UNITARIA_25, PRODUTOS.CURVA_UNITARIA_26, PRODUTOS.CURVA_UNITARIA_27, PRODUTOS.CURVA_UNITARIA_28, ' +
   'PRODUTOS.CURVA_UNITARIA_29, PRODUTOS.CURVA_UNITARIA_30, ' +
   'PRODUTOS.CURVA_FINANCEIRA_1, PRODUTOS.CURVA_FINANCEIRA_2, PRODUTOS.CURVA_FINANCEIRA_3, PRODUTOS.CURVA_FINANCEIRA_4, ' +
   'PRODUTOS.CURVA_FINANCEIRA_5, PRODUTOS.CURVA_FINANCEIRA_6, PRODUTOS.CURVA_FINANCEIRA_7, PRODUTOS.CURVA_FINANCEIRA_8, ' +
   'PRODUTOS.CURVA_FINANCEIRA_9, PRODUTOS.CURVA_FINANCEIRA_10, PRODUTOS.CURVA_FINANCEIRA_11, PRODUTOS.CURVA_FINANCEIRA_12, ' +
   'PRODUTOS.CURVA_FINANCEIRA_13, PRODUTOS.CURVA_FINANCEIRA_14, PRODUTOS.CURVA_FINANCEIRA_15, ' +
   'PRODUTOS.CURVA_FINANCEIRA_16, PRODUTOS.CURVA_FINANCEIRA_17, PRODUTOS.CURVA_FINANCEIRA_18, ' +
   'PRODUTOS.CURVA_FINANCEIRA_19, PRODUTOS.CURVA_FINANCEIRA_20, ' +
   'PRODUTOS.CURVA_FINANCEIRA_21, PRODUTOS.CURVA_FINANCEIRA_22, PRODUTOS.CURVA_FINANCEIRA_23, PRODUTOS.CURVA_FINANCEIRA_24, ' +
   'PRODUTOS.CURVA_FINANCEIRA_25, PRODUTOS.CURVA_FINANCEIRA_26, PRODUTOS.CURVA_FINANCEIRA_27, PRODUTOS.CURVA_FINANCEIRA_28, ' +
   'PRODUTOS.CURVA_FINANCEIRA_29, PRODUTOS.CURVA_FINANCEIRA_30, ' +
   'PRODUTOS.PRECO_VENDA_1, PRODUTOS.PRECO_VENDA_2, PRODUTOS.PRECO_VENDA_3, PRODUTOS.PRECO_VENDA_4, ' +
   'PRODUTOS.PRECO_VENDA_5, PRODUTOS.PRECO_VENDA_6, PRODUTOS.PRECO_VENDA_7, PRODUTOS.PRECO_VENDA_8, ' +
   'PRODUTOS.PRECO_VENDA_9, PRODUTOS.PRECO_VENDA_10, PRODUTOS.PRECO_VENDA_11, PRODUTOS.PRECO_VENDA_12, ' +
   'PRODUTOS.PRECO_VENDA_13, PRODUTOS.PRECO_VENDA_14, PRODUTOS.PRECO_VENDA_15, ' +
   'PRODUTOS.PRECO_VENDA_16, PRODUTOS.PRECO_VENDA_17, PRODUTOS.PRECO_VENDA_18, ' +
   'PRODUTOS.PRECO_VENDA_19, PRODUTOS.PRECO_VENDA_20, ' +
   'PRODUTOS.PRECO_VENDA_21, PRODUTOS.PRECO_VENDA_22, PRODUTOS.PRECO_VENDA_23, PRODUTOS.PRECO_VENDA_24, ' +
   'PRODUTOS.PRECO_VENDA_25, PRODUTOS.PRECO_VENDA_26, PRODUTOS.PRECO_VENDA_27, PRODUTOS.PRECO_VENDA_28, ' +
   'PRODUTOS.PRECO_VENDA_29, PRODUTOS.PRECO_VENDA_30, ' +
   'PRODUTOS.PRECO_PROMOCAO_1, PRODUTOS.PRECO_PROMOCAO_2, PRODUTOS.PRECO_PROMOCAO_3, PRODUTOS.PRECO_PROMOCAO_4, ' +
   'PRODUTOS.PRECO_PROMOCAO_5, PRODUTOS.PRECO_PROMOCAO_6, PRODUTOS.PRECO_PROMOCAO_7, PRODUTOS.PRECO_PROMOCAO_8, ' +
   'PRODUTOS.PRECO_PROMOCAO_9, PRODUTOS.PRECO_PROMOCAO_10, PRODUTOS.PRECO_PROMOCAO_11, PRODUTOS.PRECO_PROMOCAO_12, ' +
   'PRODUTOS.PRECO_PROMOCAO_13, PRODUTOS.PRECO_PROMOCAO_14, PRODUTOS.PRECO_PROMOCAO_15, ' +
   'PRODUTOS.PRECO_PROMOCAO_16, PRODUTOS.PRECO_PROMOCAO_17, PRODUTOS.PRECO_PROMOCAO_18, ' +
   'PRODUTOS.PRECO_PROMOCAO_19, PRODUTOS.PRECO_PROMOCAO_20, ' +
   'PRODUTOS.PRECO_PROMOCAO_21, PRODUTOS.PRECO_PROMOCAO_22, PRODUTOS.PRECO_PROMOCAO_23, PRODUTOS.PRECO_PROMOCAO_24, ' +
   'PRODUTOS.PRECO_PROMOCAO_25, PRODUTOS.PRECO_PROMOCAO_26, PRODUTOS.PRECO_PROMOCAO_27, PRODUTOS.PRECO_PROMOCAO_28, ' +
   'PRODUTOS.PRECO_PROMOCAO_29, PRODUTOS.PRECO_PROMOCAO_30, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_1, PRODUTOS.DT_VENCIMENTO_PROMOCAO_2, PRODUTOS.DT_VENCIMENTO_PROMOCAO_3, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_4, PRODUTOS.DT_VENCIMENTO_PROMOCAO_5, PRODUTOS.DT_VENCIMENTO_PROMOCAO_6, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_7, PRODUTOS.DT_VENCIMENTO_PROMOCAO_8, PRODUTOS.DT_VENCIMENTO_PROMOCAO_9, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_10, PRODUTOS.DT_VENCIMENTO_PROMOCAO_11, PRODUTOS.DT_VENCIMENTO_PROMOCAO_12, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_13, PRODUTOS.DT_VENCIMENTO_PROMOCAO_14, PRODUTOS.DT_VENCIMENTO_PROMOCAO_15, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_16, PRODUTOS.DT_VENCIMENTO_PROMOCAO_17, PRODUTOS.DT_VENCIMENTO_PROMOCAO_18, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_19, PRODUTOS.DT_VENCIMENTO_PROMOCAO_20, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_21, PRODUTOS.DT_VENCIMENTO_PROMOCAO_22, PRODUTOS.DT_VENCIMENTO_PROMOCAO_23, PRODUTOS.DT_VENCIMENTO_PROMOCAO_24, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_25, PRODUTOS.DT_VENCIMENTO_PROMOCAO_26, PRODUTOS.DT_VENCIMENTO_PROMOCAO_27, PRODUTOS.DT_VENCIMENTO_PROMOCAO_28, ' +
   'PRODUTOS.DT_VENCIMENTO_PROMOCAO_29, PRODUTOS.DT_VENCIMENTO_PROMOCAO_30, ' +
   'PRODUTOS.DATA_VENCIMENTO_1, PRODUTOS.DATA_VENCIMENTO_2, ' +
   'PRODUTOS.DT_REAJUSTE_1, PRODUTOS.DT_REAJUSTE_2, PRODUTOS.DT_REAJUSTE_3, PRODUTOS.DT_REAJUSTE_4, PRODUTOS.DT_REAJUSTE_5, ' +
   'PRODUTOS.DT_REAJUSTE_6, PRODUTOS.DT_REAJUSTE_7, PRODUTOS.DT_REAJUSTE_8, PRODUTOS.DT_REAJUSTE_9, PRODUTOS.DT_REAJUSTE_10, ' +
   'PRODUTOS.DT_REAJUSTE_11, PRODUTOS.DT_REAJUSTE_12, PRODUTOS.DT_REAJUSTE_13, PRODUTOS.DT_REAJUSTE_14, ' +
   'PRODUTOS.DT_REAJUSTE_15, PRODUTOS.DT_REAJUSTE_16, PRODUTOS.DT_REAJUSTE_17, PRODUTOS.DT_REAJUSTE_18, ' +
   'PRODUTOS.DT_REAJUSTE_19, PRODUTOS.DT_REAJUSTE_20,' +
   'PRODUTOS.DT_REAJUSTE_21, PRODUTOS.DT_REAJUSTE_22, PRODUTOS.DT_REAJUSTE_23, PRODUTOS.DT_REAJUSTE_24, ' +
   'PRODUTOS.DT_REAJUSTE_25, PRODUTOS.DT_REAJUSTE_26, PRODUTOS.DT_REAJUSTE_27, PRODUTOS.DT_REAJUSTE_28, ' +
   'PRODUTOS.DT_REAJUSTE_29, PRODUTOS.DT_REAJUSTE_30, ' +
   'PRODUTOS.MEDIAF_1, PRODUTOS.MEDIAF_2, PRODUTOS.MEDIAF_3, PRODUTOS.MEDIAF_4, PRODUTOS.MEDIAF_5, ' +
   'PRODUTOS.MEDIAF_6, PRODUTOS.MEDIAF_7, PRODUTOS.MEDIAF_8, PRODUTOS.MEDIAF_9, PRODUTOS.MEDIAF_10, ' +
   'PRODUTOS.MEDIAF_11, PRODUTOS.MEDIAF_12, PRODUTOS.MEDIAF_13, PRODUTOS.MEDIAF_14, PRODUTOS.MEDIAF_15,' +
   'PRODUTOS.MEDIAF_16, PRODUTOS.MEDIAF_17, PRODUTOS.MEDIAF_18, PRODUTOS.MEDIAF_19, PRODUTOS.MEDIAF_20,' +
   'PRODUTOS.MEDIAF_21, PRODUTOS.MEDIAF_22, PRODUTOS.MEDIAF_23, PRODUTOS.MEDIAF_24, PRODUTOS.MEDIAF_25, ' +
   'PRODUTOS.MEDIAF_26, PRODUTOS.MEDIAF_27, PRODUTOS.MEDIAF_28, PRODUTOS.MEDIAF_29, PRODUTOS.MEDIAF_30, ' +
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO IS NOT NULL AND CUSTO_UNITARIO > 0 THEN (((PRODUTOS.PRECO_VENDA / PRODUTOS.CUSTO_UNITARIO) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_1 IS NOT NULL AND CUSTO_UNITARIO_1 > 0 THEN (((PRODUTOS.PRECO_VENDA_1 / PRODUTOS.CUSTO_UNITARIO_1) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_1, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_2 IS NOT NULL AND CUSTO_UNITARIO_2 > 0 THEN (((PRODUTOS.PRECO_VENDA_2 / PRODUTOS.CUSTO_UNITARIO_2) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_2, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_3 IS NOT NULL AND CUSTO_UNITARIO_3 > 0 THEN (((PRODUTOS.PRECO_VENDA_3 / PRODUTOS.CUSTO_UNITARIO_3) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_3, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_4 IS NOT NULL AND CUSTO_UNITARIO_4 > 0 THEN (((PRODUTOS.PRECO_VENDA_4 / PRODUTOS.CUSTO_UNITARIO_4) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_4, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_5 IS NOT NULL AND CUSTO_UNITARIO_5 > 0 THEN (((PRODUTOS.PRECO_VENDA_5 / PRODUTOS.CUSTO_UNITARIO_5) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_5, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_6 IS NOT NULL AND CUSTO_UNITARIO_6 > 0 THEN (((PRODUTOS.PRECO_VENDA_6 / PRODUTOS.CUSTO_UNITARIO_6) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_6, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_7 IS NOT NULL AND CUSTO_UNITARIO_7 > 0 THEN (((PRODUTOS.PRECO_VENDA_7 / PRODUTOS.CUSTO_UNITARIO_7) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_7, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_8 IS NOT NULL AND CUSTO_UNITARIO_8 > 0 THEN (((PRODUTOS.PRECO_VENDA_8 / PRODUTOS.CUSTO_UNITARIO_8) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_8, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_9 IS NOT NULL AND CUSTO_UNITARIO_9 > 0 THEN (((PRODUTOS.PRECO_VENDA_9 / PRODUTOS.CUSTO_UNITARIO_9) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_9, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_10 IS NOT NULL AND CUSTO_UNITARIO_10 > 0 THEN (((PRODUTOS.PRECO_VENDA_10/ PRODUTOS.CUSTO_UNITARIO_10) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_10, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_11 IS NOT NULL AND CUSTO_UNITARIO_11 > 0 THEN (((PRODUTOS.PRECO_VENDA_11/ PRODUTOS.CUSTO_UNITARIO_11) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_11, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_12 IS NOT NULL AND CUSTO_UNITARIO_12 > 0 THEN (((PRODUTOS.PRECO_VENDA_12/ PRODUTOS.CUSTO_UNITARIO_12) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_12, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_13 IS NOT NULL AND CUSTO_UNITARIO_13 > 0 THEN (((PRODUTOS.PRECO_VENDA_13/ PRODUTOS.CUSTO_UNITARIO_13) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_13, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_14 IS NOT NULL AND CUSTO_UNITARIO_14 > 0 THEN (((PRODUTOS.PRECO_VENDA_14/ PRODUTOS.CUSTO_UNITARIO_14) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_14, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_15 IS NOT NULL AND CUSTO_UNITARIO_15 > 0 THEN (((PRODUTOS.PRECO_VENDA_15/ PRODUTOS.CUSTO_UNITARIO_15) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_15, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_16 IS NOT NULL AND CUSTO_UNITARIO_16 > 0 THEN (((PRODUTOS.PRECO_VENDA_16/ PRODUTOS.CUSTO_UNITARIO_16) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_16, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_17 IS NOT NULL AND CUSTO_UNITARIO_17 > 0 THEN (((PRODUTOS.PRECO_VENDA_17/ PRODUTOS.CUSTO_UNITARIO_17) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_17, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_18 IS NOT NULL AND CUSTO_UNITARIO_18 > 0 THEN (((PRODUTOS.PRECO_VENDA_18/ PRODUTOS.CUSTO_UNITARIO_18) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_18, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_19 IS NOT NULL AND CUSTO_UNITARIO_19 > 0 THEN (((PRODUTOS.PRECO_VENDA_19/ PRODUTOS.CUSTO_UNITARIO_19) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_19, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_20 IS NOT NULL AND CUSTO_UNITARIO_20 > 0 THEN (((PRODUTOS.PRECO_VENDA_20/ PRODUTOS.CUSTO_UNITARIO_20) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_20, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_21 IS NOT NULL AND CUSTO_UNITARIO_21 > 0 THEN (((PRODUTOS.PRECO_VENDA_21/ PRODUTOS.CUSTO_UNITARIO_21) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_21, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_22 IS NOT NULL AND CUSTO_UNITARIO_22 > 0 THEN (((PRODUTOS.PRECO_VENDA_22/ PRODUTOS.CUSTO_UNITARIO_22) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_22, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_23 IS NOT NULL AND CUSTO_UNITARIO_23 > 0 THEN (((PRODUTOS.PRECO_VENDA_23/ PRODUTOS.CUSTO_UNITARIO_23) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_23, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_24 IS NOT NULL AND CUSTO_UNITARIO_24 > 0 THEN (((PRODUTOS.PRECO_VENDA_24/ PRODUTOS.CUSTO_UNITARIO_24) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_24, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_25 IS NOT NULL AND CUSTO_UNITARIO_25 > 0 THEN (((PRODUTOS.PRECO_VENDA_25/ PRODUTOS.CUSTO_UNITARIO_25) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_25, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_26 IS NOT NULL AND CUSTO_UNITARIO_26 > 0 THEN (((PRODUTOS.PRECO_VENDA_26/ PRODUTOS.CUSTO_UNITARIO_26) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_26, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_27 IS NOT NULL AND CUSTO_UNITARIO_27 > 0 THEN (((PRODUTOS.PRECO_VENDA_27/ PRODUTOS.CUSTO_UNITARIO_27) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_27, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_28 IS NOT NULL AND CUSTO_UNITARIO_28 > 0 THEN (((PRODUTOS.PRECO_VENDA_28/ PRODUTOS.CUSTO_UNITARIO_28) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_28, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_29 IS NOT NULL AND CUSTO_UNITARIO_29 > 0 THEN (((PRODUTOS.PRECO_VENDA_29/ PRODUTOS.CUSTO_UNITARIO_29) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_29, '+
   'CASE WHEN PRODUTOS.CUSTO_UNITARIO_30 IS NOT NULL AND CUSTO_UNITARIO_30 > 0 THEN (((PRODUTOS.PRECO_VENDA_30/ PRODUTOS.CUSTO_UNITARIO_30) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_30, '+
   'PRODUTOS.STATUS, PRODUTOS.USOCONTINUO, PRODUTOS.REGISTROMS, PRODUTOS.BALANCA, PRODUTOS.MARGEM_PROMOCAO, PRODUTOS.COMPOSTO, PRODUTOS.DT_CADASTRO, ' +
   'PRODUTOS.PIS_COFINS, PRODUTOS.NCM, PRODUTOS.ID_PRODUTO_BASE, PRODUTOS.COMISSAO, PRODUTOS.ICMS, PRODUTOS.CD_CFOP, PRODUTOS.SITUACAOTRIBUTARIA, PRODUTOS.CD_SUBGRUPO FROM PRODUTOS ';


 SqlProdutosResumido =
    'SELECT PRODUTOS.ID_PRODUTO, PRODUTOS.CD_PRODUTO, PRODUTOS.DESCRICAO, PRODUTOS.PRECO_VENDA,'+
    'PRODUTOS.PRECO_VENDA_ANTERIOR, PRODUTOS.CD_GRUPO, PRODUTOS.CD_CLASSE, PRODUTOS.CD_LABORATORIO, PRODUTOS.ID_FAMILIA,'+
    'PRODUTOS.QT_EMBALAGEM, PRODUTOS.PRECO_PROMOCAO, PRODUTOS.MARGEM, PRODUTOS.CODIGO_BARRAS_1, PRODUTOS.CODIGO_BARRAS_2,'+
    'PRODUTOS.DT_REAJUSTE, PRODUTOS.DT_VENCIMENTO_PROMOCAO, PRODUTOS.CD_LISTA, PRODUTOS.BALANCA, PRODUTOS.NCM, PRODUTOS.CD_CFOP, '+
    'PRODUTOS.CUSTO_UNITARIO, PRODUTOS.CUSTO_MEDIO, PRODUTOS.UNIDADE, PRODUTOS.ICMS, PRODUTOS.SITUACAOTRIBUTARIA, '+
    'PRODUTOS.ESTOQUE_1,PRODUTOS.ESTOQUE_2,PRODUTOS.ESTOQUE_3,PRODUTOS.ESTOQUE_4,PRODUTOS.ESTOQUE_5,'+
    'PRODUTOS.ESTOQUE_6,PRODUTOS.ESTOQUE_7,PRODUTOS.ESTOQUE_8,PRODUTOS.ESTOQUE_9,PRODUTOS.ESTOQUE_10, '+
    'PRODUTOS.ESTOQUE_11,PRODUTOS.ESTOQUE_12, PRODUTOS.ESTOQUE_13,PRODUTOS.ESTOQUE_14,PRODUTOS.ESTOQUE_15,'+
    'PRODUTOS.ESTOQUE_16,PRODUTOS.ESTOQUE_17, PRODUTOS.ESTOQUE_18,PRODUTOS.ESTOQUE_19,PRODUTOS.ESTOQUE_20,'+
    'PRODUTOS.ESTOQUE_21, PRODUTOS.ESTOQUE_22, PRODUTOS.ESTOQUE_23, PRODUTOS.ESTOQUE_24, ' +
    'PRODUTOS.ESTOQUE_25, PRODUTOS.ESTOQUE_26, PRODUTOS.ESTOQUE_27, PRODUTOS.ESTOQUE_28, ' +
    'PRODUTOS.ESTOQUE_29, PRODUTOS.ESTOQUE_30, ' +
    'PRODUTOS.PRECO_VENDA_1, PRODUTOS.PRECO_VENDA_2, PRODUTOS.PRECO_VENDA_3, PRODUTOS.PRECO_VENDA_4,'+
    'PRODUTOS.PRECO_VENDA_5, PRODUTOS.PRECO_VENDA_6, PRODUTOS.PRECO_VENDA_7, PRODUTOS.PRECO_VENDA_8,'+
    'PRODUTOS.PRECO_VENDA_9, PRODUTOS.PRECO_VENDA_10, PRODUTOS.PRECO_VENDA_11, PRODUTOS.PRECO_VENDA_12,'+
    'PRODUTOS.PRECO_VENDA_13, PRODUTOS.PRECO_VENDA_14, PRODUTOS.PRECO_VENDA_15,'+
    'PRODUTOS.PRECO_VENDA_16, PRODUTOS.PRECO_VENDA_17, PRODUTOS.PRECO_VENDA_18,'+
    'PRODUTOS.PRECO_VENDA_19, PRODUTOS.PRECO_VENDA_20, '+
    'PRODUTOS.PRECO_VENDA_21, PRODUTOS.PRECO_VENDA_22, PRODUTOS.PRECO_VENDA_23, PRODUTOS.PRECO_VENDA_24, ' +
    'PRODUTOS.PRECO_VENDA_25, PRODUTOS.PRECO_VENDA_26, PRODUTOS.PRECO_VENDA_27, PRODUTOS.PRECO_VENDA_28, ' +
    'PRODUTOS.PRECO_VENDA_29, PRODUTOS.PRECO_VENDA_30, ' +
    'PRODUTOS.CUSTO_UNITARIO_1,PRODUTOS.CUSTO_UNITARIO_2,PRODUTOS.CUSTO_UNITARIO_3,PRODUTOS.CUSTO_UNITARIO_4,'+
    'PRODUTOS.CUSTO_UNITARIO_5,PRODUTOS.CUSTO_UNITARIO_6,PRODUTOS.CUSTO_UNITARIO_7,PRODUTOS.CUSTO_UNITARIO_8,'+
    'PRODUTOS.CUSTO_UNITARIO_9,PRODUTOS.CUSTO_UNITARIO_10, PRODUTOS.CUSTO_UNITARIO_11,PRODUTOS.CUSTO_UNITARIO_12,'+
    'PRODUTOS.CUSTO_UNITARIO_13, PRODUTOS.CUSTO_UNITARIO_14,PRODUTOS.CUSTO_UNITARIO_15,'+
    'PRODUTOS.CUSTO_UNITARIO_16, PRODUTOS.CUSTO_UNITARIO_17,PRODUTOS.CUSTO_UNITARIO_18,'+
    'PRODUTOS.CUSTO_UNITARIO_19, PRODUTOS.CUSTO_UNITARIO_20,'+
    'PRODUTOS.CUSTO_UNITARIO_21, PRODUTOS.CUSTO_UNITARIO_22, PRODUTOS.CUSTO_UNITARIO_23, PRODUTOS.CUSTO_UNITARIO_24, ' +
    'PRODUTOS.CUSTO_UNITARIO_25, PRODUTOS.CUSTO_UNITARIO_26, PRODUTOS.CUSTO_UNITARIO_27, PRODUTOS.CUSTO_UNITARIO_28, ' +
    'PRODUTOS.CUSTO_UNITARIO_29, PRODUTOS.CUSTO_UNITARIO_30, ' +
    'PRODUTOS.PRECO_PROMOCAO_1, PRODUTOS.PRECO_PROMOCAO_2, PRODUTOS.PRECO_PROMOCAO_3, PRODUTOS.PRECO_PROMOCAO_4,'+
    'PRODUTOS.PRECO_PROMOCAO_5, PRODUTOS.PRECO_PROMOCAO_6, PRODUTOS.PRECO_PROMOCAO_7, PRODUTOS.PRECO_PROMOCAO_8,'+
    'PRODUTOS.PRECO_PROMOCAO_9, PRODUTOS.PRECO_PROMOCAO_10, PRODUTOS.PRECO_PROMOCAO_11, PRODUTOS.PRECO_PROMOCAO_12,'+
    'PRODUTOS.PRECO_PROMOCAO_13, PRODUTOS.PRECO_PROMOCAO_14, PRODUTOS.PRECO_PROMOCAO_15,'+
    'PRODUTOS.PRECO_PROMOCAO_16, PRODUTOS.PRECO_PROMOCAO_17, PRODUTOS.PRECO_PROMOCAO_18,'+
    'PRODUTOS.PRECO_PROMOCAO_19, PRODUTOS.PRECO_PROMOCAO_20, '+
    'PRODUTOS.PRECO_PROMOCAO_21, PRODUTOS.PRECO_PROMOCAO_22, PRODUTOS.PRECO_PROMOCAO_23, PRODUTOS.PRECO_PROMOCAO_24, ' +
    'PRODUTOS.PRECO_PROMOCAO_25, PRODUTOS.PRECO_PROMOCAO_26, PRODUTOS.PRECO_PROMOCAO_27, PRODUTOS.PRECO_PROMOCAO_28, ' +
    'PRODUTOS.PRECO_PROMOCAO_29, PRODUTOS.PRECO_PROMOCAO_30, ' +
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_1, PRODUTOS.DT_VENCIMENTO_PROMOCAO_2, PRODUTOS.DT_VENCIMENTO_PROMOCAO_3,'+
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_4, PRODUTOS.DT_VENCIMENTO_PROMOCAO_5, PRODUTOS.DT_VENCIMENTO_PROMOCAO_6,  '+
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_7, PRODUTOS.DT_VENCIMENTO_PROMOCAO_8, PRODUTOS.DT_VENCIMENTO_PROMOCAO_9,'+
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_10, PRODUTOS.DT_VENCIMENTO_PROMOCAO_11, PRODUTOS.DT_VENCIMENTO_PROMOCAO_12, '+
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_13, PRODUTOS.DT_VENCIMENTO_PROMOCAO_14, PRODUTOS.DT_VENCIMENTO_PROMOCAO_15, '+
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_16, PRODUTOS.DT_VENCIMENTO_PROMOCAO_17, PRODUTOS.DT_VENCIMENTO_PROMOCAO_18, '+
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_19, PRODUTOS.DT_VENCIMENTO_PROMOCAO_20, '+
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_21, PRODUTOS.DT_VENCIMENTO_PROMOCAO_22, PRODUTOS.DT_VENCIMENTO_PROMOCAO_23, PRODUTOS.DT_VENCIMENTO_PROMOCAO_24, ' +
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_25, PRODUTOS.DT_VENCIMENTO_PROMOCAO_26, PRODUTOS.DT_VENCIMENTO_PROMOCAO_27, PRODUTOS.DT_VENCIMENTO_PROMOCAO_28, ' +
    'PRODUTOS.DT_VENCIMENTO_PROMOCAO_29, PRODUTOS.DT_VENCIMENTO_PROMOCAO_30, ' +
    'PRODUTOS.MARGEM_PROMOCAO, '+
    'PRODUTOS.DT_REAJUSTE_1, PRODUTOS.DT_REAJUSTE_2, PRODUTOS.DT_REAJUSTE_3, PRODUTOS.DT_REAJUSTE_4, PRODUTOS.DT_REAJUSTE_5, '+
    'PRODUTOS.DT_REAJUSTE_6, PRODUTOS.DT_REAJUSTE_7, PRODUTOS.DT_REAJUSTE_8, PRODUTOS.DT_REAJUSTE_9, PRODUTOS.DT_REAJUSTE_10, '+
    'PRODUTOS.DT_REAJUSTE_11, PRODUTOS.DT_REAJUSTE_12, '+
    'PRODUTOS.DT_REAJUSTE_13, PRODUTOS.DT_REAJUSTE_14, PRODUTOS.DT_REAJUSTE_15, ' +
    'PRODUTOS.DT_REAJUSTE_16, PRODUTOS.DT_REAJUSTE_17, PRODUTOS.DT_REAJUSTE_18, ' +
    'PRODUTOS.DT_REAJUSTE_19, PRODUTOS.DT_REAJUSTE_20, ' +
    'PRODUTOS.DT_REAJUSTE_21, PRODUTOS.DT_REAJUSTE_22, PRODUTOS.DT_REAJUSTE_23, PRODUTOS.DT_REAJUSTE_24, ' +
    'PRODUTOS.DT_REAJUSTE_25, PRODUTOS.DT_REAJUSTE_26, PRODUTOS.DT_REAJUSTE_27, PRODUTOS.DT_REAJUSTE_28, ' +
    'PRODUTOS.DT_REAJUSTE_29, PRODUTOS.DT_REAJUSTE_30, ' +
    'PRODUTOS.COMPOSTO, '+
    'PRODUTOS.CURVA_UNITARIA_1, PRODUTOS.CURVA_UNITARIA_2, PRODUTOS.CURVA_UNITARIA_3, PRODUTOS.CURVA_UNITARIA_4, PRODUTOS.CURVA_UNITARIA_5, '+
    'PRODUTOS.CURVA_UNITARIA_6, PRODUTOS.CURVA_UNITARIA_7, PRODUTOS.CURVA_UNITARIA_8, PRODUTOS.CURVA_UNITARIA_9, PRODUTOS.CURVA_UNITARIA_10, '+
    'PRODUTOS.CURVA_UNITARIA_11, PRODUTOS.CURVA_UNITARIA_12, PRODUTOS.CURVA_UNITARIA_13, PRODUTOS.CURVA_UNITARIA_14, PRODUTOS.CURVA_UNITARIA_15, '+
    'PRODUTOS.CURVA_UNITARIA_16, PRODUTOS.CURVA_UNITARIA_17, PRODUTOS.CURVA_UNITARIA_18, PRODUTOS.CURVA_UNITARIA_19, PRODUTOS.CURVA_UNITARIA_20, '+
    'PRODUTOS.CURVA_UNITARIA_21, PRODUTOS.CURVA_UNITARIA_22, PRODUTOS.CURVA_UNITARIA_23, PRODUTOS.CURVA_UNITARIA_24, ' +
    'PRODUTOS.CURVA_UNITARIA_25, PRODUTOS.CURVA_UNITARIA_26, PRODUTOS.CURVA_UNITARIA_27, PRODUTOS.CURVA_UNITARIA_28, ' +
    'PRODUTOS.CURVA_UNITARIA_29, PRODUTOS.CURVA_UNITARIA_30, ' +
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO IS NOT NULL AND CUSTO_UNITARIO > 0 THEN (((PRODUTOS.PRECO_VENDA / PRODUTOS.CUSTO_UNITARIO) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_1 IS NOT NULL AND CUSTO_UNITARIO_1 > 0 THEN (((PRODUTOS.PRECO_VENDA_1 / PRODUTOS.CUSTO_UNITARIO_1) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_1, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_2 IS NOT NULL AND CUSTO_UNITARIO_2 > 0 THEN (((PRODUTOS.PRECO_VENDA_2 / PRODUTOS.CUSTO_UNITARIO_2) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_2, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_3 IS NOT NULL AND CUSTO_UNITARIO_3 > 0 THEN (((PRODUTOS.PRECO_VENDA_3 / PRODUTOS.CUSTO_UNITARIO_3) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_3, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_4 IS NOT NULL AND CUSTO_UNITARIO_4 > 0 THEN (((PRODUTOS.PRECO_VENDA_4 / PRODUTOS.CUSTO_UNITARIO_4) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_4, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_5 IS NOT NULL AND CUSTO_UNITARIO_5 > 0 THEN (((PRODUTOS.PRECO_VENDA_5 / PRODUTOS.CUSTO_UNITARIO_5) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_5, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_6 IS NOT NULL AND CUSTO_UNITARIO_6 > 0 THEN (((PRODUTOS.PRECO_VENDA_6 / PRODUTOS.CUSTO_UNITARIO_6) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_6, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_7 IS NOT NULL AND CUSTO_UNITARIO_7 > 0 THEN (((PRODUTOS.PRECO_VENDA_7 / PRODUTOS.CUSTO_UNITARIO_7) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_7, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_8 IS NOT NULL AND CUSTO_UNITARIO_8 > 0 THEN (((PRODUTOS.PRECO_VENDA_8 / PRODUTOS.CUSTO_UNITARIO_8) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_8, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_9 IS NOT NULL AND CUSTO_UNITARIO_9 > 0 THEN (((PRODUTOS.PRECO_VENDA_9 / PRODUTOS.CUSTO_UNITARIO_9) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_9, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_10 IS NOT NULL AND CUSTO_UNITARIO_10 > 0 THEN (((PRODUTOS.PRECO_VENDA_10/ PRODUTOS.CUSTO_UNITARIO_10) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_10, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_11 IS NOT NULL AND CUSTO_UNITARIO_11 > 0 THEN (((PRODUTOS.PRECO_VENDA_11/ PRODUTOS.CUSTO_UNITARIO_11) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_11, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_12 IS NOT NULL AND CUSTO_UNITARIO_12 > 0 THEN (((PRODUTOS.PRECO_VENDA_12/ PRODUTOS.CUSTO_UNITARIO_12) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_12, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_13 IS NOT NULL AND CUSTO_UNITARIO_13 > 0 THEN (((PRODUTOS.PRECO_VENDA_13/ PRODUTOS.CUSTO_UNITARIO_13) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_13, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_14 IS NOT NULL AND CUSTO_UNITARIO_14 > 0 THEN (((PRODUTOS.PRECO_VENDA_14/ PRODUTOS.CUSTO_UNITARIO_14) * 100) - 100) ELSE 0  END AS MARGEM_PRATICADA_14, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_15 IS NOT NULL AND CUSTO_UNITARIO_15 > 0 THEN (((PRODUTOS.PRECO_VENDA_15/ PRODUTOS.CUSTO_UNITARIO_15) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_15, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_16 IS NOT NULL AND CUSTO_UNITARIO_16 > 0 THEN (((PRODUTOS.PRECO_VENDA_16/ PRODUTOS.CUSTO_UNITARIO_16) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_16, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_17 IS NOT NULL AND CUSTO_UNITARIO_17 > 0 THEN (((PRODUTOS.PRECO_VENDA_17/ PRODUTOS.CUSTO_UNITARIO_17) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_17, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_18 IS NOT NULL AND CUSTO_UNITARIO_18 > 0 THEN (((PRODUTOS.PRECO_VENDA_18/ PRODUTOS.CUSTO_UNITARIO_18) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_18, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_19 IS NOT NULL AND CUSTO_UNITARIO_19 > 0 THEN (((PRODUTOS.PRECO_VENDA_19/ PRODUTOS.CUSTO_UNITARIO_19) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_19, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_20 IS NOT NULL AND CUSTO_UNITARIO_20 > 0 THEN (((PRODUTOS.PRECO_VENDA_20/ PRODUTOS.CUSTO_UNITARIO_20) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_20, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_21 IS NOT NULL AND CUSTO_UNITARIO_21 > 0 THEN (((PRODUTOS.PRECO_VENDA_21/ PRODUTOS.CUSTO_UNITARIO_21) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_21, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_22 IS NOT NULL AND CUSTO_UNITARIO_22 > 0 THEN (((PRODUTOS.PRECO_VENDA_22/ PRODUTOS.CUSTO_UNITARIO_22) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_22, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_23 IS NOT NULL AND CUSTO_UNITARIO_23 > 0 THEN (((PRODUTOS.PRECO_VENDA_23/ PRODUTOS.CUSTO_UNITARIO_23) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_23, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_24 IS NOT NULL AND CUSTO_UNITARIO_24 > 0 THEN (((PRODUTOS.PRECO_VENDA_24/ PRODUTOS.CUSTO_UNITARIO_24) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_24, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_25 IS NOT NULL AND CUSTO_UNITARIO_25 > 0 THEN (((PRODUTOS.PRECO_VENDA_25/ PRODUTOS.CUSTO_UNITARIO_25) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_25, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_26 IS NOT NULL AND CUSTO_UNITARIO_26 > 0 THEN (((PRODUTOS.PRECO_VENDA_26/ PRODUTOS.CUSTO_UNITARIO_26) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_26, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_27 IS NOT NULL AND CUSTO_UNITARIO_27 > 0 THEN (((PRODUTOS.PRECO_VENDA_27/ PRODUTOS.CUSTO_UNITARIO_27) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_27, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_28 IS NOT NULL AND CUSTO_UNITARIO_28 > 0 THEN (((PRODUTOS.PRECO_VENDA_28/ PRODUTOS.CUSTO_UNITARIO_28) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_28, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_29 IS NOT NULL AND CUSTO_UNITARIO_29 > 0 THEN (((PRODUTOS.PRECO_VENDA_29/ PRODUTOS.CUSTO_UNITARIO_29) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_29, '+
    'CASE WHEN PRODUTOS.CUSTO_UNITARIO_30 IS NOT NULL AND CUSTO_UNITARIO_30 > 0 THEN (((PRODUTOS.PRECO_VENDA_30/ PRODUTOS.CUSTO_UNITARIO_30) * 100) - 100) ELSE 0 END AS MARGEM_PRATICADA_30, '+
    'CASE ' +
    ' WHEN PRECO_VENDA_ANTERIOR > 0 THEN ((PRECO_VENDA / PRECO_VENDA_ANTERIOR) * 100) - 100 ' +
    ' ELSE 0 ' +
    'END AS PERCENTUALREAJUSTE ' +
    'FROM PRODUTOS ';

var FrmMensagemProgresso : TFrmMensagemProgresso;
    SuperPermissao, UltraPermissao : Boolean;
    //* Campos selecionados [FB]
    stlIndCamSelecionado : TStringList;
    //* Se o Shift está pressionado [FB]
    blnKeyShift : Boolean;
    UsuarioPermissao : String;

    TempoRespostaPBM : String;

   // alterar FarmaxProdutos
    Informante : Array[0..50] of Real;
   // alterar FarmaxProdutos


implementation

uses
 DateUtils, UDm;



//Extrair o ícone de um executável (unit Shellapi)
//Image1.Picture.Icon.Handle:= ExtractIcon(Handle,PChar('c:\windows\calc.exe'),0);


//Extrair o tamanho de um arquivo
//edit1.text:= inttostr(TamArquivo('CAMINHO\NOMEDOARQUIVO'));
function TamanhoArquivo(Arquivo: string): Integer;
begin
  with TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
  try
  Result := Size;
  finally
  Free;
  end;
end;

//Alterar o papel de parede do Windows
procedure AlterarPapelParede;
var
Arquivo: String;
begin
  Arquivo:= '';
  SystemParametersInfo(SPI_SetDeskWallPaper, 0, PChar(Arquivo), 0);
end;


function EnviaTecla(key : string): string;
begin
  //trabalhar a funcao ainda...
  Keybd_event(65,0,0,0);
end;

function RetiraAspasSimples(Texto:String):String;
var
  n : Integer;
  NovoTexto : String;
begin
  NovoTexto := '';
  for n := 1 to length(texto) do
  begin
    if copy(texto, n,1) <> Chr(39) then
      NovoTexto := NovoTexto + copy(Texto, n,1)
    else
      NovoTexto := NovoTexto + ' ';
  end;
  Result:=NovoTexto;
end;

procedure ChangeByteOrder( var Data; Size : Integer );
var
  ptr : PChar;
  i : Integer;
  c : Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1)-1 do
  begin
    c := ptr^;
    ptr^ := (ptr+1)^;
    (ptr+1)^ := c;
    Inc(ptr,2);
  end;
end;

Function GetWindowsDir: String;
var
  chBuffer: array[0..MAX_PATH] of Char;
begin
  GetWindowsDirectory(chBuffer, MAX_PATH);
  Result := IncludeTrailingBackslash(StrPas(chBuffer));
end;

Function GetSysDrive: String;
begin
  Result := ExcludeTrailingPathDelimiter(ExtractFileDrive(GetWindowsDir));
end;

function GetIdeDiskSerialNumber : String;
   type
    TSrbIoControl = packed record
      HeaderLength: ULONG;
      Signature: Array[0..7] of Char;
      Timeout: ULONG;
      ControlCode: ULONG;
      ReturnCode: ULONG;
      Length: ULONG;
   end;
   SRB_IO_CONTROL = TSrbIoControl;
   PSrbIoControl = ^TSrbIoControl;

    TIDERegs = packed record
      bFeaturesReg : Byte; // especificar "comandos" SMART
      bSectorCountReg : Byte; // registro de contador de setor
      bSectorNumberReg : Byte; // registro de número de setores
      bCylLowReg : Byte; // valor de cilindro (byte mais baixo)
      bCylHighReg : Byte; // valor de cilindro (byte mais alto)
      bDriveHeadReg : Byte; // registro de drive/cabeça
      bCommandReg : Byte; // comando IDE
      bReserved : Byte; // reservado- tem que ser zero
   end;
    IDEREGS = TIDERegs;
    PIDERegs = ^TIDERegs;

   TSendCmdInParams = packed record
      cBufferSize : DWORD;
      irDriveRegs : TIDERegs;
      bDriveNumber : Byte;
      bReserved : Array[0..2] of Byte;
      dwReserved : Array[0..3] of DWORD;
      bBuffer : Array[0..0] of Byte;
    end;
    SENDCMDINPARAMS = TSendCmdInParams;
    PSendCmdInParams = ^TSendCmdInParams;

    TIdSector = packed record
      wGenConfig : Word;
      wNumCyls : Word;
      wReserved : Word;
      wNumHeads : Word;
      wBytesPerTrack : Word;
      wBytesPerSector : Word;
      wSectorsPerTrack : Word;
      wVendorUnique : Array[0..2] of Word;
      sSerialNumber : Array[0..19] of Char;
      wBufferType : Word;
      wBufferSize : Word;
      wECCSize : Word;
      sFirmwareRev : Array[0..7] of Char;
      sModelNumber : Array[0..39] of Char;
      wMoreVendorUnique : Word;
      wDoubleWordIO : Word;
      wCapabilities : Word;
      wReserved1 : Word;
      wPIOTiming : Word;
      wDMATiming : Word;
      wBS : Word;
      wNumCurrentCyls : Word;
      wNumCurrentHeads : Word;
      wNumCurrentSectorsPerTrack : Word;
      ulCurrentSectorCapacity : ULONG;
      wMultSectorStuff : Word;
      ulTotalAddressableSectors : ULONG;
      wSingleWordDMA : Word;
      wMultiWordDMA : Word;
      bReserved : Array[0..127] of Byte;
    end;
    PIdSector = ^TIdSector;

  const
    IDE_ID_FUNCTION = $EC;
    IDENTIFY_BUFFER_SIZE = 512;
    DFP_RECEIVE_DRIVE_DATA = $0007c088;
    IOCTL_SCSI_MINIPORT = $0004d008;
    IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
    DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
    BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
    W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
  var
    hDevice : THandle;
    cbBytesReturned : DWORD;
    pInData : PSendCmdInParams;
    pOutData : Pointer; // PSendCmdOutParams
    Buffer : Array[0..BufferSize-1] of Byte;
    srbControl : TSrbIoControl absolute Buffer;
begin
    Result := '';
    FillChar(Buffer,BufferSize,#0);

    if Win32Platform=VER_PLATFORM_WIN32_NT then
    // Windows NT, Windows 2000, Windows XP
    begin
      // recuperar handle da porta SCSI
      hDevice := CreateFile(Pchar('\\.\Scsi0:'),
      // Nota: '\\.\C:' precisa de privilégios administrativos
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE,  nil, OPEN_EXISTING, 0, 0);
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
        System.Move('SCSIDISK',srbControl.Signature,8);
        srbControl.Timeout := 2;
        srbControl.Length := DataSize;
        srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
        pInData := PSendCmdInParams(PChar(@Buffer)
        +SizeOf(SRB_IO_CONTROL));
        pOutData := pInData;
       with pInData^ do
       begin
         cBufferSize := IDENTIFY_BUFFER_SIZE;
         bDriveNumber := 0;
         with irDriveRegs do
         begin
           bFeaturesReg := 0;
           bSectorCountReg := 1;
           bSectorNumberReg := 1;
           bCylLowReg := 0;
           bCylHighReg := 0;
           bDriveHeadReg := $A0;
           bCommandReg := IDE_ID_FUNCTION;
         end;
      end;
      if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil ) then Exit;
     finally
       CloseHandle(hDevice);
     end;
   end
   else
   begin
      // Windows 95 OSR2, Windows 98, Windows ME
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        pInData := PSendCmdInParams(@Buffer);
        pOutData := @pInData^.bBuffer;
        with pInData^ do
        begin
           cBufferSize := IDENTIFY_BUFFER_SIZE;
           bDriveNumber := 0;
           with irDriveRegs do
           begin
             bFeaturesReg := 0;
             bSectorCountReg := 1;
             bSectorNumberReg := 1;
             bCylLowReg := 0;
             bCylHighReg := 0;
             bDriveHeadReg := $A0;
             bCommandReg := IDE_ID_FUNCTION;
           end;
         end;
         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams)-1, pOutData, W9xBufferSize, cbBytesReturned, nil ) then Exit;
        finally
          CloseHandle(hDevice);
        end;
     end;
     with PIdSector(PChar(pOutData)+16)^ do
     begin
        ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
        SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
     end;
end;

function GetSataDiskSerialNumber : String;
   type
    TSrbIoControl = packed record
      HeaderLength: ULONG;
      Signature: Array[0..7] of Char;
      Timeout: ULONG;
      ControlCode: ULONG;
      ReturnCode: ULONG;
      Length: ULONG;
   end;
   SRB_IO_CONTROL = TSrbIoControl;
   PSrbIoControl = ^TSrbIoControl;

    TIDERegs = packed record
      bFeaturesReg : Byte; // especificar "comandos" SMART
      bSectorCountReg : Byte; // registro de contador de setor
      bSectorNumberReg : Byte; // registro de número de setores
      bCylLowReg : Byte; // valor de cilindro (byte mais baixo)
      bCylHighReg : Byte; // valor de cilindro (byte mais alto)
      bDriveHeadReg : Byte; // registro de drive/cabeça
      bCommandReg : Byte; // comando IDE
      bReserved : Byte; // reservado- tem que ser zero
   end;
    IDEREGS = TIDERegs;
    PIDERegs = ^TIDERegs;

   TSendCmdInParams = packed record
      cBufferSize : DWORD;
      irDriveRegs : TIDERegs;
      bDriveNumber : Byte;
      bReserved : Array[0..2] of Byte;
      dwReserved : Array[0..3] of DWORD;
      bBuffer : Array[0..0] of Byte;
    end;
    SENDCMDINPARAMS = TSendCmdInParams;
    PSendCmdInParams = ^TSendCmdInParams;

    TIdSector = packed record
      wGenConfig : Word;
      wNumCyls : Word;
      wReserved : Word;
      wNumHeads : Word;
      wBytesPerTrack : Word;
      wBytesPerSector : Word;
      wSectorsPerTrack : Word;
      wVendorUnique : Array[0..2] of Word;
      sSerialNumber : Array[0..19] of Char;
      wBufferType : Word;
      wBufferSize : Word;
      wECCSize : Word;
      sFirmwareRev : Array[0..7] of Char;
      sModelNumber : Array[0..39] of Char;
      wMoreVendorUnique : Word;
      wDoubleWordIO : Word;
      wCapabilities : Word;
      wReserved1 : Word;
      wPIOTiming : Word;
      wDMATiming : Word;
      wBS : Word;
      wNumCurrentCyls : Word;
      wNumCurrentHeads : Word;
      wNumCurrentSectorsPerTrack : Word;
      ulCurrentSectorCapacity : ULONG;
      wMultSectorStuff : Word;
      ulTotalAddressableSectors : ULONG;
      wSingleWordDMA : Word;
      wMultiWordDMA : Word;
      bReserved : Array[0..127] of Byte;
    end;
    PIdSector = ^TIdSector;

  const
    IDE_ID_FUNCTION = $EC;
    IDENTIFY_BUFFER_SIZE = 512;
    DFP_RECEIVE_DRIVE_DATA = $0007c088;
    IOCTL_SCSI_MINIPORT = $0004d008;
    IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
    DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
    BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
    W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
  var
    hDevice : THandle;
    cbBytesReturned : DWORD;
    pInData : PSendCmdInParams;
    pOutData : Pointer; // PSendCmdOutParams
    Buffer : Array[0..BufferSize-1] of Byte;
    srbControl : TSrbIoControl absolute Buffer;
begin
    Result := '';
    FillChar(Buffer,BufferSize,#0);

    if Win32Platform=VER_PLATFORM_WIN32_NT then
    // Windows NT, Windows 2000, Windows XP
    begin
      // recuperar handle da porta SCSI
      hDevice := CreateFile(PChar('\\.\' + GetSysDrive),
      // Nota: '\\.\C:' precisa de privilégios administrativos
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE,  nil, OPEN_EXISTING, 0, 0);
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
        System.Move('SCSIDISK',srbControl.Signature,8);
        srbControl.Timeout := 2;
        srbControl.Length := DataSize;
        srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
        pInData := PSendCmdInParams(PChar(@Buffer)
        +SizeOf(SRB_IO_CONTROL));
        pOutData := pInData;
       with pInData^ do
       begin
         cBufferSize := IDENTIFY_BUFFER_SIZE;
         bDriveNumber := 0;
         with irDriveRegs do
         begin
           bFeaturesReg := 0;
           bSectorCountReg := 1;
           bSectorNumberReg := 1;
           bCylLowReg := 0;
           bCylHighReg := 0;
           bDriveHeadReg := $A0;
           bCommandReg := IDE_ID_FUNCTION;
         end;
      end;
      if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil ) then Exit;
     finally
       CloseHandle(hDevice);
     end;
   end
   else
   begin
      // Windows 95 OSR2, Windows 98, Windows ME
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        pInData := PSendCmdInParams(@Buffer);
        pOutData := @pInData^.bBuffer;
        with pInData^ do
        begin
           cBufferSize := IDENTIFY_BUFFER_SIZE;
           bDriveNumber := 0;
           with irDriveRegs do
           begin
             bFeaturesReg := 0;
             bSectorCountReg := 1;
             bSectorNumberReg := 1;
             bCylLowReg := 0;
             bCylHighReg := 0;
             bDriveHeadReg := $A0;
             bCommandReg := IDE_ID_FUNCTION;
           end;
         end;
         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams)-1, pOutData, W9xBufferSize, cbBytesReturned, nil ) then Exit;
        finally
          CloseHandle(hDevice);
        end;
     end;
     with PIdSector(PChar(pOutData)+16)^ do
     begin
        ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
        SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
     end;
end;

function AnyStrtoIntStr(Texto : String) : String;
var
  Tam, i : Integer;
  Retorno : String;
begin
  Retorno := '';
  Tam := Length(Texto);
  for i := 1 to Tam do
   begin
      if (Texto[i] >= '0') and (Texto[i] <= '9') then
         Retorno := Retorno + Texto[i]
      else
         Retorno := Retorno + InttoStr(ord(Texto[i]));
   end;
  Result := Retorno;
end;


function HexToInt(const HexStr: string): longint;
var 
iNdx: integer; 
cTmp: Char; 
begin 
Result := 0; 
for iNdx := 1 to Length(HexStr) do 
begin 
cTmp := HexStr[iNdx]; 
case cTmp of 
'0'..'9': Result := 16 * Result + (Ord(cTmp) - $30); 
'A'..'F': Result := 16 * Result + (Ord(cTmp) - $37); 
'a'..'f': Result := 16 * Result + (Ord(cTmp) - $57); 
else 
raise EConvertError.Create('Illegal character in hex string'); 
end; 
end;
end;

Function SerialNumHD(FDrive:String) :String;
var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  try
    GetVolumeInformation(PChar(
    FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToHex(Serial,8);
  except
    Result :='';
  end;
end;

// Verifica o numero de Serie do HD
function SerialHD(Drive: String): String;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: Array[0..11] of Char;
begin
  try
    GetVolumeInformation(PChar(Drive + '\'), DLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  except
    Result := '';
  end;
end;


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


{$R-} {$Q-}
function EncryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

function DecryptSTR(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;
{$R+} {$Q+}


// Função para criptografia de valores
function EncryptMsg (Msg1: string; EncryptNo: integer): string;
var
  ResultStr: string;
  Temp: char;
  I, EncryptIndex: integer;
begin
  ResultStr := '';
  Temp := ' ';
  for I := 1 to length(Msg1) do
    begin
      for EncryptIndex := 1 to EncryptNo do
        begin
          Temp := Succ (Msg1[I]);
          Msg1[I] := Temp;
        end;
      ResultStr := ResultStr + Temp;
    end;
  EncryptMsg := ResultStr;
end;

// Função de descripitografia de valores
function DecryptMsg (Msg1: string; DecryptNo: integer): string;
var
  ResultStr: string;
  Temp: char;
  I, DecryptIndex: integer;
begin
  ResultStr := '';
  Temp := ' ';
  for I := 1 to length(Msg1) do
    begin
      for DecryptIndex := 1 to DecryptNo do
        begin
          Temp := Pred (Msg1[I]);
          Msg1[I] := Temp;
        end;
      ResultStr := ResultStr + Temp;
    end;
  DecryptMsg := ResultStr;
end;

// Função que reverte as Strings
function Reverse (S: string): string;
var
  Temp: string;
  I: integer;
begin
  Temp := '';
  for I := Length (S) downto 1 do
    Temp := Temp + S[I];
  Reverse := Temp;
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

function LTrim(Text : string) : string;
begin
 while (Length(Text) > 0) and (Text[1] = ' ') do Delete(Text, 1, 1);
 Result := Text;
end;

function Centrar(Texto: String; TamanhoRet: Integer): String;
var
  TamanhoVar : Integer;
  Espacos    : Integer;
begin
  TamanhoVar:= Length(Texto);
  if TamanhoVar >= 0 then
    begin       //Centraliza o conteudo de uma variavel string
       if TamanhoRet >= TamanhoVar then
          begin
            Espacos := Trunc((TamanhoRet / 2)-(TamanhoVar/2));
            Texto := Space(Espacos) + Texto + Space(TamanhoRet-(Espacos+TamanhoVar));
//            Texto := Space(Espacos) + Texto + Space((TamanhoRet-(Espacos*2))+Espacos);
          end
       else
          begin //trunca a variável
              Texto := copy(Texto,1,TamanhoRet);
          end;
    end;
  Centrar := Texto;
end;


// Função para espaços a direita
function RightSpace(Text: String; TamanhoRet: Integer): String;
var
  TamanhoStr: Integer;
begin
  TamanhoStr := Length(Text);
  if TamanhoStr >= 0 then
    begin     //trunca a variável
      if TamanhoStr >= TamanhoRet then
        Text := Copy(Text,1,TamanhoRet)
      else
        begin //adiciona espaços à direita da variável
          for TamanhoRet := 1 to TamanhoRet - TamanhoStr do
            Text := Text + ' ';
        end;
    end;
  RightSpace := Text;
end;

// Função para adicionar espaços
function Space(Tamanho: Integer): String;
var
   Contador : integer;
   Texto    : string;
begin
   begin
      for Contador := 1 to Tamanho do
         Texto := Texto + ' ';
   end;
   Space := Texto;
end;


// Função para replicar um caracter x vezes
function Replicar(Caracter: Char; TamanhoRepl: Integer): String;
var
   Contador : integer;
   Texto    : string;
begin
   begin
      for Contador := 1 to TamanhoRepl do
         Texto := Texto + Caracter;
   end;
   Replicar := Texto;
end;

// Função para adicionar espaços à esquerda de uma string
function LeftSpace(Texto: String; TamanhoRet: Integer): String;
var
  TamanhoVar: Integer;
begin
  TamanhoVar:= Length(Texto);
  if TamanhoVar >= 0 then
    begin       //adiciona espaços à esquerda da variável
       if TamanhoRet >= TamanhoVar then
          begin
            for TamanhoRet := 1 to TamanhoRet - TamanhoVar do
              Texto := ' ' + Texto;
          end
       else
          begin //trunca a variável
              Texto := copy(Texto,1,TamanhoRet);
          end;
    end;
  LeftSpace := Texto;
end;

// Função para Extrair as baras e Inverter a data e retornar uma String
function ExtInvData(VarData: TDate): String;
var
  Text : String;
begin
  if VarData = StrToDate('30/12/1899') then
    ExtInvData := '          '
  else
    begin
      Text := DateToStr(VarData);
      ExtInvData := Copy(Text, 7, 4) + Copy(Text, 4, 2) + Copy(Text, 1, 2);
    end;
end;

// Função para extrair da data e retornar uma String
function ExtData(VarData: TDate): String;
var
  Text : String;
begin
  Text := DateToStr(VarData);
  ExtData := Copy(Text, 1, 2) + Copy(Text, 4, 2) + Copy(Text, 7, 4);
end;

// Função para extrair o valor em Real e retornar um Inteiro
function ExtValor(Valor: Real): Integer;
var
  Text : String;
  Tamanho : Integer;
begin
  Text := FormatCurr('0.00',Valor);
  Tamanho := Length(Text) - 3;
  ExtValor := StrToInt(Copy(Text, 1, Tamanho) + Copy(Text, Tamanho + 2 , 2));
end;

// Função para imprimir o cabecalho
function Cabecalho(Pagina: Integer; var ArqImp: TextFile; NomeEmp, TitRel, ModoImp: String): Boolean;
const
  vCtrlPrtNormal   = #18;
  vCtrlPrtCondensa = #15;
var
  Tracos  : Integer;
begin
  Result := True;
// fazer mudanças para ajustar ao relatório
  if ModoImp = 'N' then
    begin
      Writeln(ArqImp, vCtrlPrtNormal);
      Tracos := 80;
    end
  else
    begin
      Writeln(ArqImp, vCtrlPrtNormal+vCtrlPrtCondensa);
      Tracos := 132;
    end;
//  Writeln(ArqImp, '');
//  Writeln(ArqImp, '');
  Writeln(ArqImp, Replicar('-', Tracos));
  Writeln(ArqImp, RightSpace(NomeEmp, Tracos - 19) + DateTimeToStr(Now));
  Writeln(ArqImp, RightSpace(TitRel, Tracos - 7) + 'Pag.: ' + IntToStr(Pagina));
  Writeln(ArqImp, Replicar('-', Tracos));
end;

// Função para buscar os dados de uma tabela via SQL
function BuscaRegistro(QryBusca: TFDQuery; Select, Where: String): Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    with QryBusca do
      begin
        Close;
        SQL.Clear;
        {Parte fixa da query}
        SQL.Add(Select);
        {Parte variável da query}
        SQL.Add(Where);
        {Tenta executar a query montada anteriormente}
        try
          Open;
          if RecordCount = 0 then
            begin
              Result := False;
              Exit;
            end
          else
            begin
              Result := True;
            end;
        except
          on E: EDataBaseError do
            begin
              ExibeError(PChar('Ocorreu o seguinte erro durante a consulta ao banco de dados: ' +
                                     CHR(10) + '"' + E.Message + '".'));
              Result := False;
            end;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

// Função para verificar Tabela vazia
function VerificaTabelaVazia(QryBusca: TFDQuery; Select, Where: String): Boolean;
begin
  BuscaRegistro(QryBusca, Select, Where);
  if QryBusca.RecordCount < 1 then
    Result := True
  else
    Result := False;
end;

//
//function ErroSQL(Erro: EDBEngineError; Mensagem: String): Boolean;
//var
//  CodErro  : Longint;
//begin
//   Result := False;
//   CodErro := Erro.Errors[Erro.Errorcount - 1].NativeError;
//   if CodErro = -803  then
//      begin
//        ExibeError(PChar(Mensagem));
//        Result := True;
//      end;
//end;

// Função para Decifrar siglas de Empresa
function DecifraEmp(Texto: String): String;
begin
  Texto := UpperCase(Trim(Texto));
  if Texto = 'FEB' then
    Texto := '     FEB - FIAT FACTORING FOMENTO     '
  else
    if Texto = 'FES' then
      Texto := '     FES - FIAT SERVICOS TECNICOS     '
  else
    if Texto = 'FEP' then
      Texto := '         FEP - BANCO FIAT S/A         '
  else
    if Texto = 'LSG' then
      Texto := '        LSG - FIAT LEASING S/A        '
  else
    if Texto = 'SAC' then
      Texto := ' SAC - FIAT ADMINISTRADORA CONSORCIOS '
  else
    if Texto = 'ROT' then
      Texto := 'ROT - FIAT ROTATIVOS S/A';
  DecifraEmp := Texto;
end;

// Função para Formatar PLACA
function FormataPlaca(Texto: String): String;
begin
  FormataPlaca := RightSpace(Copy(Texto,1,3)+'-'+Copy(Texto,4,4),8)
end;

// Função para Formatar FONE
function FormataFone(Texto: String): String;
begin
  Texto := Trim(Texto);
  while Pos('-', Texto) > 0 do
        Delete(Texto, Pos('-', Texto), 1);
  while Pos('(', Texto) > 0 do
        Delete(Texto, Pos('(', Texto), 1);
  while Pos(')', Texto) > 0 do
        Delete(Texto, Pos(')', Texto), 1);
  if Length(Texto) <= 8 then
     FormataFone := Copy(Texto,1,4) + '-' + Copy(Texto,5,4)
  else
  if Length(Texto) = 9 then
     FormataFone := Copy(Texto,1,5) + '-' + Copy(Texto,6,4)
  else
  if Length(Texto) >= 10 then
     FormataFone := '(' + Copy(Texto,1,2) + ')' + Copy(Texto,3,5) + '-' + Copy(Texto,8,4);
end;

// Função para Formatar CEP
function FormataCEP(Texto: String): String;
var
  TamanhoStr: Integer;
  TamanhoRet: Integer;
begin
  Texto := Trim(Texto);
  TamanhoStr := Length(Texto);
  if TamanhoStr < 8 then
    for TamanhoRet := 1 to 8 - TamanhoStr do
      Texto := '0' + Texto;
  FormataCEP := Copy(Texto,1,5)+'-'+Copy(Texto,6,3);
end;

// Função para Formatar CPF
function FormataCPF(Texto: String): String;
var
  TamanhoStr: Integer;
  TamanhoRet: Integer;
begin
  Texto := Trim(Texto);
  TamanhoStr := Length(Texto);
  if TamanhoStr < 11 then
    for TamanhoRet := 1 to 11 - TamanhoStr do
      Texto := '0' + Texto;
  FormataCPF := Copy(Texto,1,3)+'.'+Copy(Texto,4,3)+'.'+Copy(Texto,7,3)+'-'+Copy(Texto,10,2);
end;


function FormataCPF2(Texto: String): String;
var
  TamanhoStr: Integer;
  TamanhoRet: Integer;
begin
  Texto := Trim(Texto);
  TamanhoStr := Length(Texto);
  if TamanhoStr < 11 then
    for TamanhoRet := 1 to 11 - TamanhoStr do
      Texto := '0' + Texto;
  FormataCPF2 := Copy(Texto,1,3)+'.'+Copy(Texto,4,3)+'.'+Copy(Texto,7,3)+'/'+Copy(Texto,10,2);
end;

// Função para Formatar CGC
function FormataCGC(Texto: String): String;
var
  TamanhoStr: Integer;
  TamanhoRet: Integer;
begin
  Texto := Trim(Texto);
  TamanhoStr := Length(Texto);
  if TamanhoStr < 14 then
    for TamanhoRet := 1 to 14 - TamanhoStr do
      Texto := '0' + Texto;
  FormataCGC := Copy(Texto,1,2)+'.'+Copy(Texto,3,3)+'.'+Copy(Texto,6,3)+'/'+Copy(Texto,9,4)+'-'+Copy(Texto,13,2);
  Texto := Texto;
end;

// Função para adicionar x meses em uma data
function DataFinal(Inicio: TDate; TotalMeses: Integer): String;
var
 Dia, Mes, Ano : Integer;
begin
  Dia := StrToInt(Copy(DateToStr(Inicio),1,2));
  Mes := StrToInt(Copy(DateToStr(Inicio),4,2));
  Ano := StrToInt(Copy(DateToStr(Inicio),7,4));
  while TotalMeses > 0 do
    begin
      if Mes < 12 then
        begin
          Mes := Mes + 1;
          TotalMeses := TotalMeses -1;
        end
      else
        begin
          Mes := 1;
          TotalMeses := TotalMeses -1;
          Ano := Ano + 1;
        end;
    end;
  DataFinal := StrZero(Dia,2,0)+'/'+StrZero(Mes,2,0)+'/'+IntToStr(Ano);
end;


function ExecAndWait(const FileName, Params: string;
  const WindowState: Word; ProcessName: String): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do begin
  cb := SizeOf(SUInfo);
  dwFlags := STARTF_USESHOWWINDOW;
  wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(ProcessName), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(FileName)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then begin
  WaitForSingleObject(ProcInfo.hProcess, INFINITE);
  { Libera os Handles }
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
  end;
end;


// Função para Colocar zeros à esquerda de strings
function Zeros(Texto: String; TamanhoRet: Integer): String;
var
  TamanhoStr: Integer;
begin
  Texto := Trim(Texto);
  TamanhoStr := Length(Texto);
  if TamanhoStr >= 0 then
    begin
      for TamanhoRet := 1 to TamanhoRet - TamanhoStr do
        Texto := '0' + Texto;
    end;
  Zeros := Texto;
end;

function Possibilidades(Texto: String; Caso1: String; Caso2: String; Caso3: String; Caso4: String;
        Caso5: String; Retorno1: String; Retorno2: String; Retorno3: String; Retorno4: String; Retorno5: String): String;
begin
  if (Texto <> Caso1) then
    if (Texto <> Caso2) then
      if (Texto <> Caso3) then
        if (Texto <> Caso4) then
          if (Texto <> Caso5) then
            Texto := 'Erro!'
          else
            Texto := Retorno5
        else
          Texto := Retorno4
      else
        Texto := Retorno3
    else
      Texto := Retorno2
  else
      Texto := Retorno1;
  Possibilidades := Texto;
end;


// Função para converter valores String para Real é testar se e um valor válido
function ConvFloat(Valor: String): Real;
var
  Resultado : Real;
begin
  try
    Resultado := StrToFloat(Valor);
  except
    on EConvertError do
      begin
        ConvFloat := 0.0;
        Exit;
      end;
  end;
  ConvFloat := Resultado;
end;

// Busca Código Máximo da tabela
function BuscaMax(QryMax: TFDQuery; Select, Where: String): Integer;
var
  vMax : Integer;
begin
  vMax := 0;
  try
    Screen.Cursor := crHourGlass;
    with QryMax do
      begin
        Close;
        SQL.Clear;
        {Parte fixa da query}
        SQL.Add(Select);
        {Parte variável da query}
        SQL.Add(Where);
        {Tenta executar a query montada anteriormente}
        try
          begin
            Open;
            vMax := Fields[0].AsInteger;
            BuscaMax := vMax;
          end;
        except
          on E: EDataBaseError do
            begin
              ExibeError(PChar('Ocorreu o seguinte erro durante a consulta ao banco de dados: ' +
                                     CHR(10) + '"' + E.Message + '".'));
              BuscaMax := vMax;
            end;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

// Função para seleciona os registro com parametros
function BuscaSelecao(QrySelecao: TFDQuery; Select, Where, Order: String): Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      with QrySelecao do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Select);
        SQL.Add('Where ' + Where);
        SQL.Add('Order By ' + Order);
        Prepare;
        Result := True;
      end;
    except
      on E: EDataBaseError do
      begin
        ExibeError(PChar('Ocorreu o seguinte erro durante a gravação no banco de dados: ' +
                               CHR(10) + '"' + E.Message + '".'));
        Result := False;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

// Função para somar os campos da tabela
function Soma(QrySoma: TFDQuery; Select, Where: String): Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      with QrySoma do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Select);
        SQL.Add('Where ' + Where);
        Result := True;
      end;
    except
      on E: EDataBaseError do
      begin
        ExibeError(PChar('Ocorreu o seguinte erro durante a gravação no banco de dados: ' +
                               CHR(10) + '"' + E.Message + '".'));
        Result := False;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

{ Esta rotina deverá ser incluída neste ponto
  Obs: o comprimento do campo CPF deverá ser de 14 digitos,
  pois temos que considerar os pontos "   .   .   -  "}

function ValidaCPF(Dado : string) : boolean;
var  D1            : array[1..9] of byte;
     I, DF1, DF2, DF3, DF4, DF5, DF6, Resto1, Resto2,PDigito, SDigito : integer;
begin
     Result := true;
     if Length(Dado) = 11
     then
     begin
          for I := 1 to 9 do
               if Dado[I] in ['0'..'9'] then
                    D1[I] := StrToInt(Dado[I])
               else
                    Result := false;
          if Result
          then
          begin
               DF1 := 10*D1[1] + 9*D1[2] + 8*D1[3] + 7*D1[4] + 6*D1[5] + 5*D1[6] +
                      4*D1[7] + 3*D1[8] + 2*D1[9];
               DF2 := DF1 div 11;
               DF3 := DF2 * 11;
               Resto1 := DF1 - DF3;
               if (Resto1 = 0) or (Resto1 = 1)
               then
                    PDigito := 0
               else
                    PDigito := 11 - Resto1;
               DF4 := 11*D1[1] + 10*D1[2] + 9*D1[3] + 8*D1[4] + 7*D1[5] + 6*D1[6] +
                      5*D1[7] + 4*D1[8] + 3*D1[9] + 2*PDigito;
               DF5 := DF4 div 11;
               DF6 := DF5 * 11;
               Resto2 := DF4 - DF6;
               if (Resto2 = 0) or (Resto2 = 1)
               then
                    SDigito := 0
               else
                    SDigito := 11 - Resto2;
               if (PDigito <> StrToInt(Dado[10])) or  (SDigito <> StrToInt(Dado[11])) then
                    Result := false;
          end;
     end
     else
          if Length(Dado) <> 0 then
               Result := false;
end; {TESTA_CPF}

{ Esta rotina deverá ser incluída dentro da Implementation
  Obs: o comprimento do campo CGC deverá ser de 18 digitos,
  pois temos que considerar os pontos "  .   .   /    -  "}

{Valida dígitos verificadores de CGC}
function ValidaCGC(Dado : string) : boolean;
var  D1            : array[1..12] of byte;
     I, DF1, DF2, DF3, DF4, DF5, DF6, Resto1, Resto2, PDigito, SDigito : integer;
begin
     Result := true;
     if Length(Dado) = 14
     then
     begin
          for I := 1 to 12 do
               if Dado[I] in ['0'..'9'] then
                    D1[I] := StrToInt(Dado[I])
               else
                    Result := false;
               if Result
               then
                   begin
                        DF1 := 5*D1[1] + 4*D1[2] + 3*D1[3] + 2*D1[4] + 9*D1[5] + 8*D1[6] +
                        7*D1[7] + 6*D1[8] + 5*D1[9] + 4*D1[10] + 3*D1[11] + 2*D1[12];
                        DF2 := DF1 div 11;
                        DF3 := DF2 * 11;
                        Resto1 := DF1 - DF3;
                        if (Resto1 = 0) or (Resto1 = 1)
                        then
                            PDigito := 0
                        else
                            PDigito := 11 - Resto1;
                            DF4 := 6*D1[1] + 5*D1[2] + 4*D1[3] + 3*D1[4] + 2*D1[5] + 9*D1[6] +
                            8*D1[7] + 7*D1[8] + 6*D1[9] + 5*D1[10] + 4*D1[11] + 3*D1[12] +
                            2*PDigito;
                            DF5 := DF4 div 11;
                            DF6 := DF5 * 11;
                            Resto2 := DF4 - DF6;
                            if (Resto2 = 0) or (Resto2 = 1)
                            then
                                SDigito := 0
                            else
                                SDigito := 11 - Resto2;
                                if (PDigito <> StrToInt(Dado[13])) or (SDigito <> StrToInt(Dado[14]))
                                then
                                    Result := false;
                   end;
     end
     else
         if Length(Dado) <> 0
         then
             Result := false;
end; {TESTA_CGC}


function MDRegistry(LSvouf : String; NTFDnovapath: String) : String;
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('\Software\Borland\Database Engine\Settings\SYSTEM\INIT', False);
    Reg.WriteString('LOCAL SHARE', LSvouf);
  finally
    Reg.Free;
  end;
{  if ( NTFDnovapath <> '' ) then begin
   Session.NetFileDir := NTFDnovapath;
  end;}
end;

function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  RingIndex := 0;
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
     begin
     Result := @Str[1];
     end
  else
     begin
     Result := StrAlloc(Length(Str)+1);
     RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
     StrPCopy(Result,Str);
     StrDispose(Ring[RingIndex]);
     Ring[RingIndex]:= Result;
     end;
end;

function CopiaTabela(TabFonte, TabDestino:String):Boolean;
//var
//// Tabela : TDatabase;
begin
//  if not FileExists(TabFonte) then
//    raise Exception.Create('Tabela fonte inexistente');
//  DBIInit(nil);
//  Tabela := TDataBase.Create(nil);
//  with Tabela do begin
//   connected := False;
//   Params.Add('path = '+ExtractFilePath(TabFonte));
//   DatabaseName := 'CopyPdxTable';
//   DriverName := 'STANDARD';
//   Connected := True;
//  end;
//   DBICopyTable(Tabela.Handle,True,PChar(TabFonte), nil, PChar(TabDestino));
//   Tabela.Free;
//   DBIExit;
//   Result := True;
end;

function AdicionaAlias(NomeAlias, Caminho, Driver : String):Boolean;
begin
//  Result := True;
//  DBIInit(nil);
// // DBIAddAlias(nil, PChar(NomeAlias), PChar(Driver), PChar('PATH:' + Caminho), True);
//  DBIExit;
end;

function RemoveAlias(NomeAlias : String):Boolean;
begin
//  Result := True;
//  DBIInit(nil);
// // DBIDeleteAlias(nil, PChar(NomeAlias));
//  DBIExit;
end;


function ManipulaForm(nomform : TForm; Tnomform : TFormClass; comando : integer = 1; esquerda : integer = 0; altura : integer = 108; largura : integer = 468; tamanho : integer = 800; capt: string = ''):boolean;
begin
   Result := True;
   if ( comando = 1 ) then begin
     try
        with nomform do begin
            if nomform = nil then begin
               Application.CreateForm(Tnomform, nomform);
               nomform.Left := esquerda;
               nomform.Top := altura;
               nomform.Height := largura;
               nomform.Width := tamanho;
               nomform.Caption := capt;
               Screen.Cursor := crDefault;
               ShowModal;
               Free;
               Result := True;
               Exit;
            end else
               nomform.Left := esquerda;
               nomform.Top := altura;
               nomform.Height := largura;
               nomform.Width := tamanho;
               nomform.Caption := capt;
               Screen.Cursor := crDefault;
               ShowModal;
               Free;
               Result := True;
               Exit;
            end;
     except begin
         ExibeError('Ocorreu um erro ao tentar abrir o formulário.');
         Screen.Cursor := crDefault;
         Result := False;
         Exit;
     end;
   end;
  end;
  if ( comando = 2 ) then begin   // Centraliza na horizontal
   try
     with nomform do begin
            if nomform = nil then begin
               Application.CreateForm(Tnomform, nomform);
               nomform.Top := altura;
               nomform.Height := largura;
               nomform.Width := tamanho;
               nomform.Caption := capt;
               nomform.Left :=  Screen.Width div 2 - Width div 2;;
               Screen.Cursor := crDefault;
               ShowModal;
               Free;
               Result := True;
               Exit;
            end else
               nomform.Top := altura;
               nomform.Height := largura;
               nomform.Width := tamanho;
               nomform.Caption := capt;
               nomform.Left :=  Screen.Width div 2 - Width div 2;;
               Screen.Cursor := crDefault;
               ShowModal;
               Free;
               Result := True;
               Exit;
            end;
     except begin
         ExibeError('Ocorreu um erro ao tentar abrir o formulário.');
         Screen.Cursor := crDefault;
         Result := False;
         Exit;
     end;
   end;
  end;
end;


function ComponenteToString(Component: TComponent): string;
var
  BinStream:TMemoryStream;
  StrStream: TStringStream;
  s: string;
begin
  BinStream := TMemoryStream.Create;
  try
    StrStream := TStringStream.Create(s);
    try
      BinStream.WriteComponent(Component);
      BinStream.Seek(0, soFromBeginning);
      ObjectBinaryToText(BinStream, StrStream);
      StrStream.Seek(0, soFromBeginning);
      Result:= StrStream.DataString;
    finally
      StrStream.Free;
    end;
  finally
    BinStream.Free
  end;
end;

function StringToComponente(Value: string): TComponent;
var
  StrStream:TStringStream;
  BinStream: TMemoryStream;
begin
  StrStream := TStringStream.Create(Value);
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(StrStream, BinStream);
      BinStream.Seek(0, soFromBeginning);
      Result := BinStream.ReadComponent(nil);
    finally
      BinStream.Free;
    end;
  finally
    StrStream.Free;
  end;
end;

function Checalog(user, senha, privl, privlcheck : string):boolean;
begin
  Result := False;
  if ( privlcheck <> '' ) then begin
    if ( StrToInt(privl) <= strToInt(privlcheck) )then begin
      Result := true;
      Exit;
    end
    else if ( StrToInt(privl) > strToInt(privlcheck) )then begin
      ExibeWarning('Usuário sem permissão para executar esta operação.');
      Result := False;
      Exit;
    end;
  end;
end;


function DecodificarData(vencimento: TDateTime): string;
var
 dias, mes, ano: word; //data de vencimento
 diasmes: array[1..31] of string;
 meses: array[1..12] of string;
 anos: array[2001..2015] of string;
begin
 diasmes[1]:='Dia Um';
 diasmes[2]:='Dois Dias';
 diasmes[3]:='Três Dias';
 diasmes[4]:='Quatro Dias';
 diasmes[5]:='Cinco Dias';
 diasmes[6]:='Seis Dias';
 diasmes[7]:='Sete Dias';
 diasmes[8]:='Oito Dias';
 diasmes[9]:='Nove Dias';
 diasmes[10]:='Dez Dias';
 diasmes[11]:='Onze Dias';
 diasmes[12]:='Doze Dias';
 diasmes[13]:='Treze Dias';
 diasmes[14]:='Quatorze Dias';
 diasmes[15]:='Quinze Dias';
 diasmes[16]:='Dezesseis Dias';
 diasmes[17]:='Dezessete Dias';
 diasmes[18]:='Dezoito Dias';
 diasmes[19]:='Dezenove Dias';
 diasmes[20]:='Vinte Dias';
 diasmes[21]:='Vinte e Um Dias';
 diasmes[22]:='Vinte e Dois Dias';
 diasmes[23]:='Vinte e Três Dias';
 diasmes[24]:='Vinte e Quatro Dias';
 diasmes[25]:='Vinte e Cinco Dias';
 diasmes[26]:='Vinte e Seis Dias';
 diasmes[27]:='Vinte e Sete Dias';
 diasmes[28]:='Vinte e Oito Dias';
 diasmes[29]:='Vinte e Nove Dias';
 diasmes[30]:='Trinta Dias';
 diasmes[31]:='Trinta e Um Dias';
 meses[1]:='Janeiro';
 meses[2]:='Fevereiro';
 meses[3]:='Março';
 meses[4]:='Abril';
 meses[5]:='Maio';
 meses[6]:='Junho';
 meses[7]:='Julho';
 meses[8]:='Agosto';
 meses[9]:='Setembro';
 meses[10]:='Outubro';
 meses[11]:='Novembro';
 meses[12]:='Dezembro';
 anos[2001]:='Dois Mil e Um';
 anos[2002]:='Dois Mil e Dois';
 anos[2003]:='Dois Mil e Três';
 anos[2004]:='Dois Mil e Quatro';
 anos[2005]:='Dois Mil e Cinco';
 anos[2006]:='Dois Mil e Seis';
 anos[2007]:='Dois Mil e Sete';
 anos[2008]:='Dois Mil e Oito';
 anos[2009]:='Dois Mil e Nove';
 anos[2010]:='Dois Mil e Dez';
 anos[2011]:='Dois Mil e Onze';
 anos[2012]:='Dois Mil e Doze';
 anos[2013]:='Dois Mil e Treze';
 anos[2014]:='Dois Mil e Quatorze';
 anos[2015]:='Dois Mil e Quinze';
 DecodeDate(vencimento, ano, mes, dias);
 result := Format('Aos %d dias do mês %d do ano de %d ', [dias, mes,ano]);
end;


//funcoes flavio
//Formata Valor Numérico sem a necessidade da passagem de máscara
function FF(Valor: Real): Real;
begin
  Result := StrtoFloat(FormatFloat('#0.00',Valor));
end;

//função para validar o valor do campo  caso o mesmo seja requerido
function ValidaCampoRequerido(Cds: TClientDataSet; Formulario : TForm): Boolean;
var i : integer;
begin
  Result := False;
  for i := 0 to Cds.FieldCount - 1 do
   begin
      if (Cds.Fields[i].Required) then
       begin
         if (Cds.Fields[i].DataType = ftString) and
            ((Cds.Fields[i].Value = '') or (Cds.Fields[i].IsNull)) then
           begin
              ExibeError('O preenchimento do campo "' + Cds.Fields[i].DisplayLabel + '" é obrigatório.');
              SetaFoco(Formulario, Cds.Fields[i].FieldName);
              Result := True;
              Break;
           end
          else
            if (Cds.Fields[i].IsNull) then
             begin
                ExibeError('O preenchimento do campo "' + Cds.Fields[i].DisplayLabel + '" é obrigatório.');
                SetaFoco(Formulario, Cds.Fields[i].FieldName);
                Result := True;
                Break;
             end;
       end;
   end;
end;

//procedure que seta o foco em um objeto através do nome do campo ao qual o mesmo está conectado
//procedure utilizada pela função 'ValidaCampoRequerido' (acima)
procedure SetaFoco(Formulario : TForm; Campo : String);
var i : integer;
begin
      for i := 0 to Formulario.ComponentCount - 1 do
       begin
          if (Formulario.Components[i].ClassType = TDBedit) then
           begin
             if (Formulario.Components[i] as TDBedit).DataField = Campo then
              begin
                (Formulario.Components[i] as TDBedit).SetFocus;
                Exit;
              end;
           end;
       end;
end;


function TestNumero(oNumero:String):Boolean;
var n : LongInt;
begin
   result := true;
   try
      n := StrToInt(oNumero);
   except
      on EConvertError do Result := false;
   end;
end;


function PrimeiraMaiuscula(Texto : String) : String;
var Letra : String;
    i : Integer;
    Min : Boolean;
begin
   Min := True;
   Texto := Trim(UpperCase(Copy(Texto, 1, 1)) + Copy(Texto, 2, Length(Texto)));
   for i := 2 to Length(Texto) do
    begin
       if Copy(Texto, i, 1) = '_' then
         begin
           Delete(Texto, i, 1);
           Insert(' ', Texto, i);
         end;
    end;
   for i := 2 to Length(Texto) do
    begin
       if Copy(Texto, i, 1) = ' ' then
        begin
          Letra := Copy(Texto, i + 1, 1);
          Delete(Texto, i + 1, 1);
          Insert(UpperCase(Letra), Texto, i + 1);
          Min := False;
        end
       else
        begin
           if Min then
            begin
              Letra := Copy(Texto, i, 1);
              Delete(Texto, i, 1);
              Insert(LowerCase(Letra), Texto, i);
            end;
           Min := True;
        end;
    end;
   Result := Texto;
end;

//função que preenche os espaços vazios de uma string com um caracter
function PreencheEspacos(Texto, Caracter : String) : String;
var
 Posicao : Integer;
 Str : String;
begin
  Result := '';
  Str := Trim(Texto);
  repeat
    Posicao := Pos(' ', Str);
    if Posicao <> 0 then
     begin
       Delete(Str, Posicao, 1);
       Insert(Caracter, Str, Posicao);
     end;
  until Pos(' ', Str) = 0;
  repeat
    Posicao := Pos('-', Str);
    if Posicao <> 0 then
     begin
       Delete(Str, Posicao, 1);
       Insert(Caracter, Str, Posicao);
     end;
  until Pos('-', Str) = 0;

  repeat
    Posicao := Pos('.', Str);
    if Posicao <> 0 then
     begin
       Delete(Str, Posicao, 1);
       Insert(Caracter, Str, Posicao);
     end;
  until Pos('.', Str) = 0;

  repeat
    Posicao := Pos(',', Str);
    if Posicao <> 0 then
     begin
       Delete(Str, Posicao, 1);
       Insert(Caracter, Str, Posicao);
     end;
  until Pos(',', Str) = 0;

  Result := Str;
end;



// MODO DE USAR "ATUALIZASALDO" //
{
     'I':  FrmDm.AtualizaSaldo(FrmDm.CdsSaldo,FrmDm.CdsSaldoID_CONTA,FrmDm.CdsSaldoDATA,FrmDm.CdsSaldoSALDO,
           CdsConsultaVALOR.AsFloat,0,CdsConsultaTIPOMOVIMENTO.AsString,
           '',CdsConsultaDATA.AsDateTime,CdsConsultaDATA.AsDateTime,CdsConsultaID_CONTA.AsInteger,0);

     'A':  FrmDm.AtualizaSaldo(FrmDm.CdsSaldo,FrmDm.CdsSaldoID_CONTA,FrmDm.CdsSaldoDATA,FrmDm.CdsSaldoSALDO,
           CdsConsultaVALOR.AsFloat,ValorAnterior,CdsConsultaTIPOMOVIMENTO.AsString,
           TipoAnterior,CdsConsultaDATA.AsDateTime,DataAnterior,CdsConsultaID_CONTA.AsInteger,ContaAnterior);

     'E':  FrmDm.AtualizaSaldo(FrmDm.CdsSaldo,FrmDm.CdsSaldoID_CONTA,FrmDm.CdsSaldoDATA,FrmDm.CdsSaldoSALDO,
           0,CdsConsultaVALOR.AsFloat,'',CdsConsultaTIPOMOVIMENTO.AsString,
           CdsConsultaDATA.AsDateTime,CdsConsultaDATA.AsDateTime,0,CdsConsultaID_CONTA.AsInteger);}

function AtualizaSaldo(Tabela: TClientDataSet; ID: TFloatField; Data: TDateField; Saldo: TFloatField;
                       ValorAtual,ValorAnterior : Extended; TipoAtual,TipoAnterior : String;
                       DataAtual, DataAnterior : TDateTime; ContaAtual,ContaAnterior : Extended):Boolean;

Var Saldoanterior:Real;
    PodeSair,Existeodiaatual : boolean;

Begin

Result := False;

if ValorAnterior <> 0 then
begin
   Tabela.Close;
   Tabela.Params[0].AsFloat := ContaAnterior;
   Tabela.Open;
   Tabela.Last;
   PodeSair := false;
   Repeat
    begin
      If Data.AsDateTime > DataAnterior then
       Tabela.Prior
      else
       PodeSair := true;
    end;
   Until (Tabela.Bof) or (PodeSair);

   Repeat
    begin
      Tabela.Edit;
      if TipoAnterior='C' then
       Saldo.AsFloat := Saldo.AsFloat - ValorAnterior
      else
       Saldo.AsFloat := Saldo.AsFloat + ValorAnterior;
      FazLogErroApply(Tabela, 'AtualizaSaldo');
      Tabela.Next;
      end;
    until Tabela.Eof;
end;

if ValorAtual<>0 then
begin
   If (ContaAtual <> ContaAnterior) then
    begin
       Tabela.Close;
       Tabela.Params[0].AsFloat := ContaAtual;
       Tabela.Open;
    end;
   Tabela.Last;
   SaldoAnterior := 0;
   Existeodiaatual := false;
   PodeSair := false;

   if Tabela.RecordCount <> 0 then
   begin
      Repeat
         If Data.AsDateTime >= DataAtual then
         begin
            if (Data.AsDateTime = DataAtual)  then
               Existeodiaatual := true;

            Tabela.Prior;
            If (Tabela.Bof) and (Data.AsDateTime < DataAtual) then
            begin
               SaldoAnterior := Saldo.AsFloat;
            end;

         end
         else
         begin
            SaldoAnterior := Saldo.AsFloat;
            PodeSair := true;
         end;
      Until Tabela.Bof or PodeSair;
   end;

   if not existeodiaatual then
     begin
      Tabela.Insert;
      Data.AsDateTime    := Dataatual;
      Id.AsFloat := ContaAtual;
      Saldo.AsFloat      := SaldoAnterior;
      FazLogErroApply(Tabela, 'AtualizaSaldo');
     end;

   if Data.AsDateTime >= Dataatual then
   begin
     Tabela.edit;
     if TipoAtual='C' then
        Saldo.AsFloat := Saldo.AsFloat + ValorAtual
     else
        Saldo.AsFloat := Saldo.AsFloat - ValorAtual;

     FazLogErroApply(Tabela, 'AtualizaSaldo');
   end;

   Tabela.Next;

   While not Tabela.Eof do
   begin
     if Data.AsDateTime >= Dataatual then
     begin
       Tabela.edit;
       if TipoAtual='C' then
          Saldo.AsFloat := Saldo.AsFloat + ValorAtual
       else
          Saldo.AsFloat := Saldo.AsFloat - ValorAtual;
     end;
     Tabela.Next;
   end;
   FazLogErroApply(Tabela, 'AtualizaSaldo');
end;
end;


function AtualizaSaldoEstoque(Tabela: TClientDataSet; Cd_Filial: TIntegerField;
                              Cd_Vendedor: TIntegerField; Data: TSqlTimeStampField; Saldo: TFloatField;
                              ValorAtual, ValorAnterior: Extended; TipoAtual, TipoAnterior: String;
                              DataAtual, DataAnterior: TDateTime; FilialAtual, FilialAnterior: Integer;
                              ContaAtual, ContaAnterior: Integer): Boolean;
Var Saldoanterior:Real;
    PodeSair,Existeodiaatual : boolean;
Begin
  Result := False;

  if ValorAnterior <> 0 then
  begin
     Tabela.Close;
     Tabela.Params[0].AsInteger := ContaAnterior;
     Tabela.Params[1].AsInteger := FilialAnterior;
     Tabela.Open;
     Tabela.Last;
     PodeSair := false;
     Repeat
      begin
        If Data.AsDateTime > DataAnterior then
         Tabela.Prior
        else
         PodeSair := true;
      end;
     Until (Tabela.Bof) or (PodeSair);

     Repeat
      begin
        Tabela.Edit;
        if TipoAnterior='C' then
         Saldo.AsFloat := Saldo.AsFloat - ValorAnterior
        else
         Saldo.AsFloat := Saldo.AsFloat + ValorAnterior;
        FazLogErroApply(Tabela, 'AtualizaSaldoEstoque');
        Tabela.Next;
        end;
      until Tabela.Eof;
  end;

  if ValorAtual<>0 then
  begin
     If (ContaAtual <> ContaAnterior) or (FilialAtual <> FilialAnterior) then
      begin
         Tabela.Close;
         Tabela.Params[0].AsInteger := ContaAtual;
         Tabela.Params[1].AsInteger := FilialAtual;
         Tabela.Open;
      end;
     Tabela.Last;
     SaldoAnterior := 0;
     Existeodiaatual := false;
     PodeSair := false;

     if Tabela.RecordCount <> 0 then
     begin
        Repeat
           If Data.AsDateTime >= DataAtual then
           begin
              if (Data.AsDateTime = DataAtual)  then
                 Existeodiaatual := true;

              Tabela.Prior;
              If (Tabela.Bof) and (Data.AsDateTime < DataAtual) then
              begin
                 SaldoAnterior := Saldo.AsFloat;
              end;

           end
           else
           begin
              SaldoAnterior := Saldo.AsFloat;
              PodeSair := true;
           end;
        Until Tabela.Bof or PodeSair;
     end;

     if not existeodiaatual then
       begin
        Tabela.Insert;
        Data.AsDateTime    := Dataatual;
        CD_Vendedor.AsInteger := ContaAtual;
        Saldo.AsFloat      := SaldoAnterior;
        CD_Filial.AsInteger := FilialAtual;
        FazLogErroApply(Tabela, 'AtualizaSaldoEstoque');
       end;

     if Data.AsDateTime >= Dataatual then
     begin
       Tabela.edit;
       if TipoAtual='C' then
          Saldo.AsFloat := Saldo.AsFloat + ValorAtual
       else
          Saldo.AsFloat := Saldo.AsFloat - ValorAtual;

       FazLogErroApply(Tabela, 'AtualizaSaldoEstoque');
     end;

     Tabela.Next;

     While not Tabela.Eof do
     begin
       if Data.AsDateTime >= Dataatual then
       begin
         Tabela.edit;
         if TipoAtual='C' then
            Saldo.AsFloat := Saldo.AsFloat + ValorAtual
         else
            Saldo.AsFloat := Saldo.AsFloat - ValorAtual;

         FazLOgErroApply(Tabela, 'AtualizaSaldoEstoque');
       end;
       Tabela.Next;
     end;
  end;
end;


function AdicionaEspacos(Texto: String; Qtd: Integer): String;
var i : Integer;
begin
  Result := '';
  For i := 1 to Qtd do
    Result := Result + ' ';
  Result := Result + Trim(Texto);
end;


function Extenso(Valor:Extended):String;
var
Centavos,Centena, Milhar, Milhao, Bilhao, Texto :string;
const
Unidades:array[1..9] of string = ('Um', 'Dois', 'Três', 'Quatro','Cinco','Seis', 'Sete', 'Oito', 'Nove');
Dez:array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze','Quinze','Dezesseis', 'Dezessete', 'Dezoito', 'DezeNove');
Dezenas:array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta','Cinquenta','Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas:array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos','Quinhentos','Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
  function ifs (Expressao:Boolean;CasoVerdadeiro,CasoFalso:String):String;
  begin
     if Expressao
        then Result:=Casoverdadeiro
        Else Result:=CasoFalso;
  End;
  function MiniExtenso(Valor:ShortString):string;
  var Unidade, Dezena, Centena:String;
  begin
    if (Valor[2]='1') and (Valor[3] <> '0')
      then
         Begin
            Unidade:=Dez[StrToInt(Valor[3])];
            Dezena:='';
         End
      Else
         Begin
    if Valor[2]<>'0'
       Then Dezena:=Dezenas[StrToInt(Valor[2])];
    if Valor[3]<>'0'
       Then Unidade:=Unidades[StrToInt(Valor[3])];
    End;
    if (Valor[1]='1') and (Unidade='') and (Dezena= '')
      then Centena:='cem'
      else
         if Valor[1] <>'0'
            Then centena:= Centenas[StrToInt(Valor[1])]
            Else Centena:='';
      Result:= Centena+ifs((Centena<>'') and
               ((Dezena<> '') or (Unidade <> '')), ' e ', '' )+Dezena+
               ifs((Dezena<> '')and(Unidade<>''), ' e ', '')+Unidade;
  end;
begin
   if Valor =0
      Then
         Begin
            Result:='';
            Exit;
         End;
   Texto:=FormatFloat('000000000000.00',Valor);
   Centavos:=MiniExtenso('0'+Copy(Texto,14,2));
   Centena:=MiniExtenso(Copy(Texto,10,3));
   Milhar:=MiniExtenso(Copy(Texto,7,3));
   if Milhar <> ''
      Then Milhar:=Milhar+' Mil';
   Milhao:=MiniExtenso(Copy(Texto,4,3));
    if Milhao <> ''
      then Milhao:=Milhao+
                   ifs(Copy(Texto,4,3)='001', ' Milhão', ' Milhões');
   Bilhao:=MiniExtenso(Copy(Texto,1,3));
    if Bilhao<>''
       then Bilhao:=Bilhao+
                   ifs(Copy(Texto,1,3)='001', ' Bilhão', ' Bilhões');
    if (Bilhao<>'') and (Milhao+Milhar+Centena= '')
       Then Result:=Bilhao+ ' de Reais'
       Else
       if (Milhao<>'') and (Milhar+Centena= '')
       then Result:=Milhao+' de Reais'
       else Result:=Bilhao+
       ifs((Bilhao<> '' ) and
       (Milhao+Milhar+Centena<> ''),
       ifs((Pos(' e ', Bilhao)>0)or
       (Pos(' e ',Milhao+Milhar+Centena)>0)
       ,', ', ' e '), '')+Milhao+
       ifs((Milhao<>'')and
       (Milhar+Centena<>''), ifs((Pos(' e ', Milhao) > 0)
       or (Pos( ' e ', Milhar + Centena)>0),
       ', ',' e '),'')+Milhar+ifs((Milhar<>'')and
       (Centena<> ''),
       ifs (Pos(' e ',centena)>0, ', ',' e '), '')+
       Centena+ifs(Int(Valor)=1, ' Real', ' Reais' );
    if Centavos <> ''
       then Result:=Result+' e '+Centavos+
                    ifs(Copy(Texto,14,2)='01', ' Centavo',' Centavos');
end;

function FormataPlanoContas(Texto : String) : String;
var
 c1, c2, c3 : String;
begin
 Texto := AllTrim(Texto);
 c1 := '';
 c2 := '';
 c3 := '';

 c1 := copy(Texto, 1, pos('.', Texto) - 1);
 Delete(Texto, 1, pos('.', Texto));
 if (c1 = '') or (length(c1) > 1) or ((c1 <> '') and (StrtoInt(c1) = 0)) then
  begin
    Result := '';
    Exit;
  end;

 while pos('.', Texto) <> 0 do
  begin
    if c2 = '' then
     begin
       c2 := copy(Texto, 1, pos('.', Texto) - 1);
       if length(c2) > 2 then
        begin
          Result := '';
          Exit;
        end;
       Delete(Texto, 1, pos('.', Texto));
       if c2 = '' then
          Break;
     end
    else
     begin
       if c3 <> '' then
        begin
          c3 := copy(Texto, 1, Length(Texto));
          if Length(c3) > 3 then
           begin
            Result := '';
            Exit;
           end;
          Break;
        end
     else
        Break;
     end;
  end;


 if (c2 <> '') and (StrtoInt(c2) = 0) then
  begin
    Result := '';
    Exit;
  end
 else
  begin
    c2 := '.' + StrZero(StrtoFloat(c2), 2, 0);
  end;

 if (c3 <> '') and (StrtoInt(c3) = 0) then
  begin
    Result := '';
    Exit;
  end
 else
  begin
    c3 := '.' + StrZero(StrtoFloat(c3), 3, 0);
  end;

 Result := c1 + c2 + c3;
end;


function PadR(Texto : String; Tamanho : Integer) : String;
var x: integer;
begin
 x := Tamanho - Length(Texto);
 Result := Copy(StringOfChar(' ', x) + Texto , 1, Tamanho);
end;

function PadL(Texto : String; Tamanho : Integer) : String;
var x: integer;
begin
 x := Tamanho - Length(Texto);
 Result := Copy(Texto + StringOfChar(' ', x) , 1, Tamanho);
end;

function RemovePonto(Texto : String) : String;
begin
  while Pos('.', Texto) <> 0 do
    Delete(Texto, Pos('.', Texto), 1);
  Result := Texto
end;

function DataInicial(Inicio : TDateTime) : TDateTime;
var
 Mes, Ano : Integer;
begin
 Mes  := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy',Inicio),4,2));
 Ano  := StrtoInt(Copy(FormatDateTime('dd/mm/yyyy',Inicio),7,4));
 Result := StrtoDate('01/'+StrZero(Mes, 2, 0)+'/'+StrZero(Ano, 4, 0));
end;

Function ProximoDiaUtil (dData : TDateTime) : TDateTime;
begin
if DayOfWeek(dData) = 7 then
   dData := dData + 2
else
if DayOfWeek(dData) = 1 then
   dData := dData + 1;
ProximoDiaUtil := dData;
end;

Function DiadaSemana(Data : TDateTime) : String;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sábado');
begin
  Result := semana[DayOfWeek(Data)]
end;

Function PrimeiroDiaUtilSemana(Data : TDateTime) : TDateTime;
begin
  Result := Data;
  case DayOfWeek(Data) of
   1 : Result := Data + 1;
   2 : Result := Data;
   3 : Result := Data - 1;
   4 : Result := Data - 2;
   5 : Result := Data - 3;
   6 : Result := Data - 4;
   7 : Result := Data + 2;
  end;
end;

//rotina que vai verificar se o processo de um determinado sistema ainda esta em execucao.
Function VerificaProcesso(Arquivo : string) : Boolean;
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  Looper : Bool;
  Contador : Integer;
begin
  Contador := 0;
  SnapShot:=CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize:=sizeof(TProcessEntry32);
  Looper := Process32First(SnapShot,pe);
  Result := False;
  while Integer(Looper) <> 0 do
   begin
    if Pos(UpperCase(arquivo), UpperCase(ExtractFileName(pe.szExeFile))) > 0 then
     begin
        Inc(Contador);
        if Contador > 1 then
         begin
           Result := True;
           Break;
         end;
     end;
    Looper := Process32Next(SnapShot,pe);
   end;
end;

//rotina que vai verificar se o processo de um determinado sistema ainda esta em execucao.
Function VerificaProcesso2(Arquivo : string) : Boolean;
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  Looper : Bool;
  Contador : Integer;
begin
  Contador := 1;
  SnapShot:=CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize:=sizeof(TProcessEntry32);
  Looper := Process32First(SnapShot,pe);
  Result := False;
  while Integer(Looper) <> 0 do
   begin
    if Pos(UpperCase(arquivo), UpperCase(ExtractFileName(pe.szExeFile))) > 0 then
     begin
        Inc(Contador);
        if Contador > 1 then
         begin
          Result := True;
          Break;
         end;
     end;
    Looper := Process32Next(SnapShot,pe);
   end;
end;

//rotina que vai verificar se o processo de um determinado sistema esta em execucao.
Function Verifica1Processo(Arquivo : string) : Boolean;
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  Looper : Bool;
  Contador : Integer;
begin
  Contador := 1;
  SnapShot:=CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize:=sizeof(TProcessEntry32);
  Looper := Process32First(SnapShot,pe);
  Result := False;
  while Integer(Looper) <> 0 do
   begin
    if Pos(UpperCase(arquivo), UpperCase(ExtractFileName(pe.szExeFile))) > 0 then
     begin
       Result := True;
       Break;
     end;
    Looper := Process32Next(SnapShot,pe);
   end;
end;


//esperar numero de segundos....
procedure Delay(Tempo: Real);
var
x1: Double;
begin
    x1:= now;
    repeat until ((now-x1)*86400) > Tempo;
end;

//Atrasa a execucao em Milisegundos
Procedure TimeDelay(msecs: integer);
Var
  FirstTick: longint;
Begin
  If msecs = 0 Then
    exit;
  FirstTick := GetTickCount;
  Repeat
    Application.ProcessMessages;
  Until GetTickCount - FirstTick >= msecs;
End;


//especifica para tratar de descontos
  // aletrar FarmaxProdutos
function AcessoGerencialVenda(DataSet : TClientDataSet; Modulo : String; Cd_VendaGerencial, Id_produto : Real) : Boolean;
var
  Senha : String;
  SqlInformante : TSqlDataset;
  i : Integer;
begin
//  Result := False;
//  Try
//    Application.CreateForm(TFrmAcessoGerencia, FrmAcessoGerencia);
//    FrmAcessoGerencia.ShowModal;
//  Finally
//    Senha := UpperCase(FrmAcessoGerencia.Edit_acesso.Text);
//    FreeAndNil(FrmAcessoGerencia);
//    Try
//      DataSet.Close;
//      DataSet.Params[0].AsString := Senha;
//      DataSet.Open;
//
//      // alterar em FarmaxProdutos
////      if not (DataSet.FieldByName('CD_FILIAL').IsNull) and (DataSet.FieldByName('CD_FILIAL').AsFloat <> dmGeral.CdsParametrosCD_FILIAL.AsFloat) then
////       begin
////          ExibeError(' Acesso negado. Usuário vinculado a outra filial.');
////          Result := False;
////       end
//      // alterar em FarmaxProdutos
//
//      else
//      if (DataSet.RecordCount = 0) and (Modulo <> '') then
//         ExibeError(' Senha inválida. ')
//      else
//       begin
//         DescontoGerencial := 0;
//         DataSet.Filter := 'NOME='+QuotedStr(Modulo);
//         DataSet.Filtered := True;
//         if (DataSet.FieldByName('PERMITIDO').AsString = 'S') or (Modulo = '') then
//          begin
//            UsuarioPermissao := DataSet.FieldByName('USUARIO').Asstring;
//            if not (DataSet.FieldByName('TX_DESCONTO_MAXIMO').IsNull) then
//              DescontoGerencial := DataSet.FieldByName('TX_DESCONTO_MAXIMO').AsFloat;
//
//            SqlInformante := TSQLDataSet.Create(dmGeral);
//            SqlInformante.SQLConnection := dmGeral.SQLConn;
//            SqlInformante.CommandText := 'INSERT INTO INFORMANTE (ID_INFORMANTE, DATA, HORA, MAQUINA, MODULO, USUARIO, USUARIOPERMISSAO, CD_VENDA, ID_PRODUTO) VALUES (' +
//                                         FloatToStr(RetornaID('INFORMANTE', 'ID_INFORMANTE')) + ', ' +
//                                         QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' +
//                                         QuotedStr(FormatDateTime('hh:mm:ss', Now)) + ', ' +
//                                         QuotedStr(NomePC) + ', ' +
//                                         QuotedStr(Modulo) + ', ' +
//                                         QuotedStr(NomeUsuario) + ', ' +
//                                         QuotedStr(UsuarioPermissao) + ', ' +
//                                         FloatToStr(Cd_VendaGerencial) + ', ' +
//                                         FloatToStr(Id_produto) + ')';
//            SqlInformante.ExecSql(False);
//
//            // alterar FarmaxProdutos
//            dmGeral.Cds1.Close;
//            dmGeral.Sql.CommandText := 'SELECT MAX(ID_INFORMANTE) FROM INFORMANTE';
//            dmGeral.Cds1.Params.Clear;
//            dmGeral.Cds1.Open;
//            for i := 0 to 50 do
//             begin
//               if Informante[i] = 0 then
//                begin
//                  Informante[i] := dmGeral.Cds1.Fields[0].AsFloat;
//                  Break;
//                end;
//             end;
//            // alterar FarmaxProdutos
//
//            Result := True;
//          end
//         else
//          begin
//             ExibeError(' Acesso negado. (Operação "ACESSO" da Permissão "' + DataSet.FieldByName('CD_MODULO').AsString + '") ');
//          end;
//       end;
//    Except
//      Result := False;
//    End;
//  end;
end;
  // alertar FarmaxProdutos


function AcessoGerencial(DataSet : TClientDataSet; Modulo : String) : Boolean;
var
  Senha : String;
  SqlInformante : TSqlDataset;
begin
//  Result := False;
//  Try
//    Application.CreateForm(TFrmAcessoGerencia, FrmAcessoGerencia);
//    FrmAcessoGerencia.ShowModal;
//  Finally
//    Senha := UpperCase(FrmAcessoGerencia.Edit_acesso.Text);
//    FreeAndNil(FrmAcessoGerencia);
//    Try
//      DataSet.Close;
//      DataSet.Params[0].AsString := Senha;
//      DataSet.Open;
//
//      // alterar em FarmaxProdutos
//      if not (DataSet.FieldByName('CD_FILIAL').IsNull) and (DataSet.FieldByName('CD_FILIAL').AsFloat <> dmGeral.CdsParametrosCD_FILIAL.AsFloat) then
//       begin
//          ExibeError(' Acesso negado. Usuário vinculado a outra filial.');
//          Result := False;
//       end
//      // alterar em FarmaxProdutos
//
//      else
//      if (DataSet.RecordCount = 0) and (Modulo <> '') then
//         ExibeError(' Senha inválida. ')
//      else
//       begin
//         DescontoGerencial := 0;
//         DataSet.Filter := 'NOME='+QuotedStr(Modulo);
//         DataSet.Filtered := True;
//         if (DataSet.FieldByName('PERMITIDO').AsString = 'S') or (Modulo = '') then
//          begin
//            UsuarioPermissao := DataSet.FieldByName('USUARIO').Asstring;
//            if not (DataSet.FieldByName('TX_DESCONTO_MAXIMO').IsNull) then
//              DescontoGerencial := DataSet.FieldByName('TX_DESCONTO_MAXIMO').AsFloat;
//
//            SqlInformante := TSQLDataSet.Create(dmGeral);
//            SqlInformante.SQLConnection := dmGeral.SQLConn;
//            SqlInformante.CommandText := 'INSERT INTO INFORMANTE (ID_INFORMANTE, DATA, HORA, MAQUINA, MODULO, USUARIO, USUARIOPERMISSAO) VALUES (' +
//                                         FloatToStr(RetornaID('INFORMANTE', 'ID_INFORMANTE')) + ', ' +
//                                         QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' +
//                                         QuotedStr(FormatDateTime('hh:mm:ss', Now)) + ', ' +
//                                         QuotedStr(NomePC) + ', ' +
//                                         QuotedStr(Modulo) + ', ' +
//                                         QuotedStr(NomeUsuario) + ', ' +
//                                         QuotedStr(UsuarioPermissao) + ')';
//            SqlInformante.ExecSql(False);
//
//            Result := True;
//          end
//         else
//          begin
//             ExibeError(' Acesso negado. (Operação "ACESSO" da Permissão "' + DataSet.FieldByName('CD_MODULO').AsString + '") ');
//          end;
//       end;
//    Except
//      Result := False;
//    End;
//  end;
end;


//para atender VerificaAutorizacao
function AcessoGerencial2(DataSet : TClientDataSet; Modulo : String) : Boolean;
var
  Senha : String;
  SqlInformante : TSqlDataset;
begin
//  Result := False;
//  Try
//    Application.CreateForm(TFrmAcessoGerencia, FrmAcessoGerencia);
//    FrmAcessoGerencia.ShowModal;
//  Finally
//    Senha := UpperCase(FrmAcessoGerencia.Edit_acesso.Text);
//    FreeAndNil(FrmAcessoGerencia);
//    {FrmAcessoGerencia.Destroy;
//    FrmAcessoGerencia := nil;}
//  end;
//  if SuperSenha(Senha) then
//   begin
//     UsuarioPermissao := 'SUPER USUARIO';
//     Result := True;
//     Exit;
//   end;
//  Try
//    DataSet.Close;
//    DataSet.Params[0].AsString := Senha;
//    DataSet.Open;
//    if not (DataSet.FieldByName('CD_FILIAL').IsNull) and (DataSet.FieldByName('CD_FILIAL').AsFloat <> dmGeral.CdsParametrosCD_FILIAL.AsFloat) then
//     begin
//        ExibeError(' Acesso negado. Usuário vinculado a outra filial.');
//        Result := False;
//     end
//    else
//    if (DataSet.RecordCount = 0) and (Modulo <> '') then
//       ExibeError(' Senha inválida. ')
//    else
//     begin
//       DataSet.Filter := 'NOME='+QuotedStr(Modulo);
//       DataSet.Filtered := True;
//       if ((DataSet.FieldByName('PERMITIDO').AsString = 'S') or (Modulo = '')) then
//        begin
//          UsuarioPermissao := DataSet.FieldByName('USUARIO').Asstring;
//          if not (DataSet.FieldByName('TX_DESCONTO_MAXIMO').IsNull) then
//            DescontoGerencial := DataSet.FieldByName('TX_DESCONTO_MAXIMO').AsFloat;
//
//          SqlInformante := TSQLDataSet.Create(dmGeral);
//          SqlInformante.SQLConnection := dmGeral.SQLConn;
//          SqlInformante.CommandText := 'INSERT INTO INFORMANTE (ID_INFORMANTE, DATA, HORA, MAQUINA, MODULO, USUARIO, USUARIOPERMISSAO) VALUES (' +
//                                       FloatToStr(RetornaID('INFORMANTE', 'ID_INFORMANTE')) + ', ' +
//                                       QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' +
//                                       QuotedStr(FormatDateTime('hh:mm:ss', Now)) + ', ' +
//                                       QuotedStr(NomePC) + ', ' +
//                                       QuotedStr(Modulo) + ', ' +
//                                       QuotedStr(NomeUsuario) + ', ' +
//                                       QuotedStr(UsuarioPermissao) + ')';
//          SqlInformante.ExecSql(False);
//
//          Result := True;
//        end
//       else
//        begin
//          ExibeError(' Acesso negado. (Operação "ACESSO" da Permissão "' + DataSet.FieldByName('CD_MODULO').AsString + '") ');
//        end;
//     end;
//   Except
//     Result := False;
//   End;
end;


function AcessoOperacaoGerencial(DataSet : TClientDataSet; Modulo, OperacaoModulo : String) : Boolean;
var
  Senha : String;
  SqlInformante : TSqlDataset;
begin
//  Result := False;
//  Try
//    Application.CreateForm(TFrmAcessoGerencia, FrmAcessoGerencia);
//    FrmAcessoGerencia.ShowModal;
//  Finally
//    Senha := UpperCase(FrmAcessoGerencia.Edit_acesso.Text);
//    FreeAndNil(FrmAcessoGerencia);
//    //FrmAcessoGerencia := nil;
//  end;
//  if SuperSenha(Senha) then
//   begin
//     UsuarioPermissao := 'SUPER USUARIO';
//     Result := True;
//     Exit;
//   end;
//  DataSet.Close;
//  DataSet.Params[0].AsString := Senha;
//  DataSet.Open;
//  if DataSet.RecordCount = 0 then
//     ExibeError(' Senha inválida. ')
//  else
//   begin
//     DataSet.Filter := 'NOME='+QuotedStr(Modulo);
//     DataSet.Filtered := True;
//     if DataSet.FieldByName(OperacaoModulo).AsString = 'S' then
//      begin
//        UsuarioPermissao := DataSet.FieldByName('USUARIO').AsString;
//
//        SqlInformante := TSQLDataSet.Create(dmGeral);
//        SqlInformante.SQLConnection := dmGeral.SQLConn;
//        SqlInformante.CommandText := 'INSERT INTO INFORMANTE (ID_INFORMANTE, DATA, HORA, MAQUINA, MODULO, OPERACAO, USUARIO, USUARIOPERMISSAO) VALUES (' +
//                                     FloatToStr(RetornaID('INFORMANTE', 'ID_INFORMANTE')) + ', ' +
//                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' +
//                                     QuotedStr(FormatDateTime('hh:mm:ss', Now)) + ', ' +
//                                     QuotedStr(NomePC) + ', ' +
//                                     QuotedStr(Modulo) + ', ' +
//                                     QuotedStr(OperacaoModulo) + ', ' +
//                                     QuotedStr(NomeUsuario) + ', ' +
//                                     QuotedStr(UsuarioPermissao) + ')';
//        SqlInformante.ExecSql(False);
//
//        Result := True;
//      end
//     else
//      begin
//        ExibeError(' Permissão negada. (Operação "' + OperacaoModulo + '" da Permissão "' + DataSet.FieldByName('CD_MODULO').AsString + '") ');
//      end;
//   end;
end;

function AcessoManutencao : Boolean;
var Senha : String;
begin
//  Result := False;
//  Try
//    Application.CreateForm(TFrmAcessoGerencia, FrmAcessoGerencia);
//    FrmAcessoGerencia.ShowModal;
//  Finally
//    Senha := UpperCase(FrmAcessoGerencia.Edit_acesso.Text);
//    FreeAndNil(FrmAcessoGerencia);
//    FrmAcessoGerencia.Destroy;
//    FrmAcessoGerencia := nil;
//  end;
//  if Senha = 'GMLMMLFML' then
//     Result := True;
end;

function AcessoSuperSenha : Boolean;
var Senha : String;
begin
//  Result := False;
//  Try
//    Application.CreateForm(TFrmAcessoGerencia, FrmAcessoGerencia);
//    FrmAcessoGerencia.Caption := 'Acesso Suporte';
//    FrmAcessoGerencia.ShowModal;
//  Finally
//    Senha := UpperCase(FrmAcessoGerencia.Edit_acesso.Text);
//    FreeAndNil(FrmAcessoGerencia);
//   // FrmAcessoGerencia.Destroy;
//    FrmAcessoGerencia := nil;
//  end;
//
//  if SuperSenha(Senha) then
//     Result := True;
end;

function AcessoSuperSenhaHora : Boolean;
var Senha : String;
begin
  Result := False;
  Try
    Application.CreateForm(TFrmAcessoGerencia, FrmAcessoGerencia);
    FrmAcessoGerencia.ShowModal;
  Finally
    Senha := UpperCase(FrmAcessoGerencia.Edit_acesso.Text);
    FreeAndNil(FrmAcessoGerencia);
    {FrmAcessoGerencia.Destroy;
    FrmAcessoGerencia := nil;}
  end;
  if SuperSenhaHora(Senha) then
     Result := True;
end;

function SuperUsuario(Usuario : String) : Boolean;
var
 Chave : String;
begin
  Result := True;
  Chave := 'suporte';
  if UpperCase(Usuario) <> UpperCase(Chave) then
   begin
     Result := False;
     Exit;
   end;
end;


function GeraSuperSenha : String;
var
 Chave : String;
 Dias, Semanas : Array of String;
 DiaMes, DiadaSemana : Integer;
 Dia, Mes : String;
begin
  SetLength(Dias, 21);
  SetLength(Semanas, 8);

  Dias[0] := '';
  Dias[1] := ''; Dias[2] := 'ALBERTO'; Dias[3] := 'GILVETE'; Dias[4] := 'GILBERT'; Dias[5] := 'ANGELOS';
  Dias[6] := 'MARCELO'; Dias[7] := 'MATHEUS'; Dias[8] := 'THIAGOS'; Dias[9] := 'JULIANA'; Dias[10] := 'GSOARES';
  Dias[11] := 'GELINAS'; Dias[12] := 'ALBERLE'; Dias[13] := 'ALBERTI'; Dias[14] := 'MACHADO'; Dias[15] := 'FILLIPE';
  Dias[16] := 'LEONARD'; Dias[17] := 'PISTOLA'; Dias[18] := 'XFARMAX'; Dias[19] := 'PREMIUM'; Dias[20] := 'ZFARMAX';

  Semanas[0] := ''; Semanas[1] := 'GILSONS'; Semanas[2] := 'GENNYSD'; Semanas[3] := 'ALVAROS';
  Semanas[4] := 'DIACONO'; Semanas[5] := 'IVANETE'; Semanas[6] := 'IVETTES'; Semanas[7] := 'JOSIANE';

  DiadaSemana := DayOfWeek(Date);
  Dia := FormatDateTime('dd', Date);
  Mes := FormatDateTime('mm', Date);
  DiaMes := StrToInt(Copy(Dia, 1, 1)) + StrToInt(Copy(Dia, 2, 1)) +
            StrToInt(Copy(Mes, 1, 1)) + StrToInt(Copy(Mes, 2, 1));

  Chave :=
     Copy('PREMIUM', DiadaSemana, 1) +
     Copy(Dias[DiaMes],DiadaSemana ,1) +
     InttoStr(StrtoInt(Dia) + StrtoInt(Mes)) +
     Copy(Semanas[DiadaSemana], DiadaSemana, 1) +
     Copy('MUIMERP', DiadaSemana, 1);

  Result := Chave;
end;


{function GeraSuperSenhaHora : String;
var
 Chave : String;
 Dias, Semanas : Array of String;
 DiaMes, DiadaSemana : Integer;
 Dia, Mes, Hora, A : String;
begin
  SetLength(Dias, 21);
  SetLength(Semanas, 8);

  Dias[0] := '';
  Dias[1] := ''; Dias[2] := 'ALBERTO'; Dias[3] := 'GILVETE'; Dias[4] := 'GILBERT'; Dias[5] := 'ANGELOS';
  Dias[6] := 'MARCELO'; Dias[7] := 'MATHEUS'; Dias[8] := 'THIAGOS'; Dias[9] := 'JULIANA'; Dias[10] := 'GSOARES';
  Dias[11] := 'GELINAS'; Dias[12] := 'ALBERLE'; Dias[13] := 'ALBERTI'; Dias[14] := 'MACHADO'; Dias[15] := 'FILLIPE';
  Dias[16] := 'LEONARD'; Dias[17] := 'PISTOLA'; Dias[18] := 'XFARMAX'; Dias[19] := 'PREMIUM'; Dias[20] := 'ZFARMAX';

  Semanas[0] := ''; Semanas[1] := 'GILSONS'; Semanas[2] := 'GENNYSD'; Semanas[3] := 'ALVAROS';
  Semanas[4] := 'DIACONO'; Semanas[5] := 'IVANETE'; Semanas[6] := 'IVETTES'; Semanas[7] := 'JOSIANE';

  DiadaSemana := DayOfWeek(Date);
  Dia := FormatDateTime('dd', Date);
  Mes := FormatDateTime('mm', Date);
  Hora := FormatDateTime('hh', Now);
  DiaMes := StrToInt(Copy(Dia, 1, 1)) + StrToInt(Copy(Dia, 2, 1)) +
            StrToInt(Copy(Mes, 1, 1)) + StrToInt(Copy(Mes, 2, 1));
  A := FormatFloat('#0', (Int((StrtoInt(Dia) + StrtoInt(Mes)) * StrtoInt(Hora))));

  Chave :=
     Copy('PREMIUM', DiadaSemana, 1) +
     Copy(Dias[DiaMes],DiadaSemana ,1) +
     A +
     Copy(Semanas[DiadaSemana], DiadaSemana, 1) +
     Copy('MUIMERP', DiadaSemana, 1);

  Result := Chave;
end;}


function GeraSuperSenhaHora : String;
var
 Chave : String;
 Dias, Semanas : Array of String;
 DiaMes, DiadaSemana : Integer;
 Dia, Mes, Hora, A : String;
begin
  SetLength(Dias, 21);
  SetLength(Semanas, 8);

  Dias[0] := '';
  Dias[1] := ''; Dias[2] := 'ALKGJUT'; Dias[3] := 'LOKJDNS'; Dias[4] := 'OKITDGZ'; Dias[5] := 'ALOKFUD';
  Dias[6] := 'ALOGKJF'; Dias[7] := 'UJNGBSE'; Dias[8] := 'LPHYGZS'; Dias[9] := 'LPOPJXD'; Dias[10] := 'LAQWKUH';
  Dias[11] := 'WSKJGNC'; Dias[12] := 'IJKMDXF'; Dias[13] := 'ALOKGJF'; Dias[14] := 'POAWSCM'; Dias[15] := 'LAZXHFD';
  Dias[16] := 'ADJVMUR'; Dias[17] := 'ALOKGNF'; Dias[18] := 'OLKDHZQ'; Dias[19] := 'PALOSPD'; Dias[20] := 'POLWSWS';

  Semanas[0] := ''; Semanas[1] := 'LKJMJMJ'; Semanas[2] := 'LZSCFGC'; Semanas[3] := 'UJSHDTG';
  Semanas[4] := 'ALKDMFC'; Semanas[5] := 'PLOKDFC'; Semanas[6] := 'ASGBCTR'; Semanas[7] := 'EDLZKMH';

  DiadaSemana := DayOfWeek(Date);
  Dia := FormatDateTime('ddmm', Date);
  Mes := FormatDateTime('mmdd', Date);
  Hora := FormatDateTime('hh', Now);
  DiaMes := StrToInt(Copy(Dia, 1, 1)) + StrToInt(Copy(Dia, 2, 1)) +
            StrToInt(Copy(Mes, 1, 1)) + StrToInt(Copy(Mes, 2, 1));
  A := FormatFloat('#0', (Int((StrtoInt(Dia) + StrtoInt(Mes)) * StrtoInt(Hora))));

  Chave :=
     Copy('PREMIUM', DiadaSemana, 1) +
     Copy(Dias[DiaMes],DiadaSemana ,1) +
     A +
     Copy(Semanas[DiadaSemana], DiadaSemana, 1) +
     Copy('MUIMERP', DiadaSemana, 1);

  Result := Chave;
end;


function SuperSenha(Senha : String) : Boolean;
var
 Chave : String;
 Dias, Semanas : Array of String;
 DiaMes, DiadaSemana : Integer;
 Dia, Mes : String;
begin
  SetLength(Dias, 21);
  SetLength(Semanas, 8);

  Dias[0] := '';
  Dias[1] := ''; Dias[2] := 'ALBERTO'; Dias[3] := 'GILVETE'; Dias[4] := 'GILBERT'; Dias[5] := 'ANGELOS';
  Dias[6] := 'MARCELO'; Dias[7] := 'MATHEUS'; Dias[8] := 'THIAGOS'; Dias[9] := 'JULIANA'; Dias[10] := 'GSOARES';
  Dias[11] := 'GELINAS'; Dias[12] := 'ALBERLE'; Dias[13] := 'ALBERTI'; Dias[14] := 'MACHADO'; Dias[15] := 'FILLIPE';
  Dias[16] := 'LEONARD'; Dias[17] := 'PISTOLA'; Dias[18] := 'XFARMAX'; Dias[19] := 'PREMIUM'; Dias[20] := 'ZFARMAX';

  Semanas[0] := ''; Semanas[1] := 'GILSONS'; Semanas[2] := 'GENNYSD'; Semanas[3] := 'ALVAROS';
  Semanas[4] := 'DIACONO'; Semanas[5] := 'IVANETE'; Semanas[6] := 'IVETTES'; Semanas[7] := 'JOSIANE';

  DiadaSemana := DayOfWeek(Date);
  Dia := FormatDateTime('dd', Date);
  Mes := FormatDateTime('mm', Date);
  DiaMes := StrToInt(Copy(Dia, 1, 1)) + StrToInt(Copy(Dia, 2, 1)) +
            StrToInt(Copy(Mes, 1, 1)) + StrToInt(Copy(Mes, 2, 1));

  Chave :=
     Copy('PREMIUM', DiadaSemana, 1) +
     Copy(Dias[DiaMes],DiadaSemana ,1) +
     InttoStr(StrtoInt(Dia) + StrtoInt(Mes)) +
     Copy(Semanas[DiadaSemana], DiadaSemana, 1) +
     Copy('MUIMERP', DiadaSemana, 1);

  Result := True;
  if UpperCase(Senha) <> UpperCase(Chave) then
   begin
     Result := False;
     Exit;
   end;
end;

{function SuperSenhaHora(Senha : String) : Boolean;
var
 Chave : String;
 Dias, Semanas : Array of String;
 DiaMes, DiadaSemana : Integer;
 Dia, Mes, Hora, A : String;
begin
  SetLength(Dias, 21);
  SetLength(Semanas, 8);

  Dias[0] := '';
  Dias[1] := ''; Dias[2] := 'ALBERTO'; Dias[3] := 'GILVETE'; Dias[4] := 'GILBERT'; Dias[5] := 'ANGELOS';
  Dias[6] := 'MARCELO'; Dias[7] := 'MATHEUS'; Dias[8] := 'THIAGOS'; Dias[9] := 'JULIANA'; Dias[10] := 'GSOARES';
  Dias[11] := 'GELINAS'; Dias[12] := 'ALBERLE'; Dias[13] := 'ALBERTI'; Dias[14] := 'MACHADO'; Dias[15] := 'FILLIPE';
  Dias[16] := 'LEONARD'; Dias[17] := 'PISTOLA'; Dias[18] := 'XFARMAX'; Dias[19] := 'PREMIUM'; Dias[20] := 'ZFARMAX';

  Semanas[0] := ''; Semanas[1] := 'GILSONS'; Semanas[2] := 'GENNYSD'; Semanas[3] := 'ALVAROS';
  Semanas[4] := 'DIACONO'; Semanas[5] := 'IVANETE'; Semanas[6] := 'IVETTES'; Semanas[7] := 'JOSIANE';

  DiadaSemana := DayOfWeek(Date);
  Dia := FormatDateTime('dd', Date);
  Mes := FormatDateTime('mm', Date);
  Hora := FormatDateTime('hh', Now);
  DiaMes := StrToInt(Copy(Dia, 1, 1)) + StrToInt(Copy(Dia, 2, 1)) +
            StrToInt(Copy(Mes, 1, 1)) + StrToInt(Copy(Mes, 2, 1));
  A := FormatFloat('#0', (Int((StrtoInt(Dia) + StrtoInt(Mes)) * StrtoInt(Hora))));

  Chave :=
     Copy('PREMIUM', DiadaSemana, 1) +
     Copy(Dias[DiaMes],DiadaSemana ,1) +
     A +
     Copy(Semanas[DiadaSemana], DiadaSemana, 1) +
     Copy('MUIMERP', DiadaSemana, 1);

  Result := True;
  if (UpperCase(Senha) <> UpperCase(Chave)) then
     Result := False;
end;}

function SuperSenhaHora(Senha : String) : Boolean;
var
 Chave : String;
 Dias, Semanas : Array of String;
 DiaMes, DiadaSemana : Integer;
 Dia, Mes, Hora, A : String;
begin
  SetLength(Dias, 21);
  SetLength(Semanas, 8);

  Dias[0] := '';
  Dias[1] := ''; Dias[2] := 'ALKGJUT'; Dias[3] := 'LOKJDNS'; Dias[4] := 'OKITDGZ'; Dias[5] := 'ALOKFUD';
  Dias[6] := 'ALOGKJF'; Dias[7] := 'UJNGBSE'; Dias[8] := 'LPHYGZS'; Dias[9] := 'LPOPJXD'; Dias[10] := 'LAQWKUH';
  Dias[11] := 'WSKJGNC'; Dias[12] := 'IJKMDXF'; Dias[13] := 'ALOKGJF'; Dias[14] := 'POAWSCM'; Dias[15] := 'LAZXHFD';
  Dias[16] := 'ADJVMUR'; Dias[17] := 'ALOKGNF'; Dias[18] := 'OLKDHZQ'; Dias[19] := 'PALOSPD'; Dias[20] := 'POLWSWS';

  Semanas[0] := ''; Semanas[1] := 'LKJMJMJ'; Semanas[2] := 'LZSCFGC'; Semanas[3] := 'UJSHDTG';
  Semanas[4] := 'ALKDMFC'; Semanas[5] := 'PLOKDFC'; Semanas[6] := 'ASGBCTR'; Semanas[7] := 'EDLZKMH';

  DiadaSemana := DayOfWeek(Date);
  Dia := FormatDateTime('ddmm', Date);
  Mes := FormatDateTime('mmdd', Date);
  Hora := FormatDateTime('hh', Now);
  DiaMes := StrToInt(Copy(Dia, 1, 1)) + StrToInt(Copy(Dia, 2, 1)) +
            StrToInt(Copy(Mes, 1, 1)) + StrToInt(Copy(Mes, 2, 1));
  A := FormatFloat('#0', (Int((StrtoInt(Dia) + StrtoInt(Mes)) * StrtoInt(Hora))));

  Chave :=
     Copy('PREMIUM', DiadaSemana, 1) +
     Copy(Dias[DiaMes],DiadaSemana ,1) +
     A +
     Copy(Semanas[DiadaSemana], DiadaSemana, 1) +
     Copy('MUIMERP', DiadaSemana, 1);

  Result := True;
  if (UpperCase(Senha) <> UpperCase(Chave)) then
     Result := False;
end;

function VerificaAutorizacao(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String) : Boolean;
begin
//  If SuperPermissao or UltraPermissao then
//   begin
//     UsuarioPermissao := 'SUPER USUARIO';
//     Result := True;
//     Exit;
//   end;
//  Result := False;
//  Cds.Close;
//  Cds.Params[0].AsFloat := Permissao;
//  Cds.Open;
//  Cds.Filter := 'NOME='+QuotedStr(Componente);
//  Cds.Filtered := True;
//  if Cds.FieldByName('PERMITIDO').AsString = 'N' then
//   begin
//     if Componente = 'BtDesconto' then
//        Result := False
//     else
//     if Componente = 'AlteraCustoLoja' then
//        Result := False
//     else
//     if AcessoGerencial2(Cds2 , Componente) then
//        Result := True;
//   end
//  else
//   begin
//     if Cds.RecordCount = 0 then
//        begin
//          Result := False;
//          ExibeError('Acesso Negado por falta da permissão "' + Componente + '" no banco de dados.');
//          Try
//            Application.CreateForm(TFrmDownload, FrmDownload);
//            FrmDownload.Edit1.Text := 'http://www.farmax.far.br/download/Scripts/ScriptModulos.sql';
//            FrmDownload.Edit2.Text := 'ScriptModulos.sql';
//            FrmDownload.ShowModal;
//          Finally
//            FrmDownload.Destroy;
//          End;
//          if  FileExists(ExtractFilePath(Application.ExeName) + 'ScriptModulos.sql') then
//           begin
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', True);
//              //DmGeral.ExecutarScript(ExtractFilePath(Application.ExeName) + 'ScriptModulos.sql');
//              DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'ScriptModulos.sql'));
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', False);
//           end;
//        end
//     else
//      begin
//       // UsuarioPermissao := NomeUsuario;   //GML 18.09.2014
//        //UsuarioPermissao := Cds.FieldByName('NOME').Asstring;
//        Result := True;
//      end;
//   end;
//  Cds.Filter := '';
//  Cds.Filtered := False;
end;

// aletrar FarmaxProdutos
function VerificaAutorizacao2(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String) : Boolean;
begin
//  If SuperPermissao or UltraPermissao then
//   begin
//     UsuarioPermissao := 'SUPER USUARIO';
//     Result := True;
//     Exit;
//   end;
//  Result := False;
//  Cds.Close;
//  Cds.Params[0].AsFloat := Permissao;
//  Cds.Open;
//  Cds.Filter := 'NOME='+QuotedStr(Componente);
//  Cds.Filtered := True;
//  if Cds.FieldByName('PERMITIDO').AsString = 'N' then
//     Result := False
//  else
//   begin
//     if Cds.RecordCount = 0 then
//        begin
//          Result := False;
//          ExibeError('Acesso Negado por falta da permissão "' + Componente + '" no banco de dados.');
//          Try
//            Application.CreateForm(TFrmDownload, FrmDownload);
//            FrmDownload.Edit1.Text := 'http://www.farmax.far.br/download/Scripts/ScriptModulos.sql';
//            FrmDownload.Edit2.Text := 'ScriptModulos.sql';
//            FrmDownload.ShowModal;
//          Finally
//            FrmDownload.Destroy;
//          End;
//          if  FileExists('ScriptModulos.sql') then
//           begin
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', True);
//             // DmGeral.ExecutarScript('ScriptModulos.sql');
//              DeleteFile(PChar('ScriptModulos.sql'));
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', False);
//           end;
//        end
//     else
//        Result := True;
//   end;
//  Cds.Filter := '';
//  Cds.Filtered := False;
end;

function VerificaAutorizacaoVenda(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String; Cd_VendaGerencial, Id_Produto : Real) : Boolean;
begin
//  If SuperPermissao or UltraPermissao then
//   begin
//     UsuarioPermissao := 'SUPER USUARIO';
//     Result := True;
//     Exit;
//   end;
//  Result := False;
//  Cds.Close;
//  Cds.Params[0].AsFloat := Permissao;
//  Cds.Open;
//  Cds.Filter := 'NOME='+QuotedStr(Componente);
//  Cds.Filtered := True;
//  if Cds.FieldByName('PERMITIDO').AsString = 'N' then
//   begin
//     if Componente = 'BtDesconto' then
//        Result := False
//     else
//     if AcessoGerencialVenda(Cds2 , Componente, Cd_VendaGerencial, Id_Produto) then
//        Result := True;
//   end
//  else
//   begin
//     if Cds.RecordCount = 0 then
//        begin
//          Result := False;
//          ExibeError('Acesso Negado por falta da permissão "' + Componente + '" no banco de dados.');
//          Try
//            Application.CreateForm(TFrmDownload, FrmDownload);
//            FrmDownload.Edit1.Text := 'http://www.farmax.far.br/download/Scripts/ScriptModulos.sql';
//            FrmDownload.Edit2.Text := 'ScriptModulos.sql';
//            FrmDownload.ShowModal;
//          Finally
//            FrmDownload.Destroy;
//          End;
//          if  FileExists('ScriptModulos.sql') then
//           begin
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', True);
//              //DmGeral.ExecutarScript('ScriptModulos.sql');
//              DeleteFile(PChar('ScriptModulos.sql'));
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', False);
//           end;
//        end
//     else
//        Result := True;
//   end;
//  Cds.Filter := '';
//  Cds.Filtered := False;
end;
  // aletrar FarmaxProdutos


function VerificaAutorizacaoInversa(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente : String) : Boolean;
begin
//  If (SuperPermissao) or (UltraPermissao) then
//   begin
//     UsuarioPermissao := 'SUPER USUARIO';
//     Result := False;
//     Exit;
//   end;
//  Result := True;
//  Cds.Close;
//  Cds.Params[0].AsFloat := Permissao;
//  Cds.Open;
//  Cds.Filter := 'NOME='+QuotedStr(Componente);
//  Cds.Filtered := True;
//  if Cds.FieldByName('PERMITIDO').AsString = 'S' then
//   begin
//     if AcessoGerencial2(Cds2 , Componente) then
//        Result := False;
//   end
//  else
//   begin
//     if Cds.RecordCount = 0 then
//        begin
//          Result := True;
//          ExibeError('Acesso Negado por falta da permissão "' + Componente + '" no banco de dados.');
//          Try
//            Application.CreateForm(TFrmDownload, FrmDownload);
//            FrmDownload.Edit1.Text := 'http://www.farmax.far.br/download/Scripts/ScriptModulos.sql';
//            FrmDownload.Edit2.Text := 'ScriptModulos.sql';
//            FrmDownload.ShowModal;
//          Finally
//            FrmDownload.Destroy;
//          End;
//          if  FileExists('ScriptModulos.sql') then
//           begin
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', True);
//             // DmGeral.ExecutarScript('ScriptModulos.sql');
//              DeleteFile(PChar('ScriptModulos.sql'));
//              ExibeMensagem('Aguarde. Atualizando tabela de Paises ...', False);
//           end;
//        end
//     else
//      begin
//        //UsuarioPermissao := Cds.FieldByName('NOME').Asstring;
//        Result := False;
//      end;
//   end;
//  Cds.Filter := '';
//  Cds.Filtered := False;
end;

function VerificaOperacao(Cds, Cds2 : TClientDataSet; Permissao : Real; Componente, Operacao : String) : Boolean;
begin
  If SuperPermissao or UltraPermissao then
   begin
     UsuarioPermissao := 'SUPER USUARIO';
     Result := True;
     Exit;
   end;
  Result := False;
  Cds.Close;
  Cds.Params[0].AsFloat := Permissao;
  Cds.Open;
  Cds.Filter := 'NOME=' + QuotedStr(Componente);
  Cds.Filtered := True;
  if Cds.FieldByName(Operacao).AsString = 'N' then
   begin
     if AcessoOperacaoGerencial(Cds2 , Componente, Operacao) then
        Result := True;
   end
  else
   begin
     if Cds.RecordCount = 0 then
        Result := False
     else
      begin
        //UsuarioPermissao := NomeUsuario;
        Result := True;
      end;
   end;
  Cds.Filter := '';
  Cds.Filtered := False;
end;


function FormataSemArredondar(Value : Real; Decimais : Integer) : Extended;
var
 Total : Real;
 Mascara : String;
 i : integer;
begin
  if Pos(',', FloattoStr(Value)) <> 0 then
     Total := StrtoFloat(Copy(StrTran(FloattoStr(Value), '.', ''), 1, Pos(',',StrTran(FloattoStr(Value), '.', '')) + Decimais))
  else
     Total := Value;
  Mascara := '#,##0.';
  for i := 1 to Decimais do
      Mascara := Mascara + '0'; 
  Result := StrtoFloat(StrTran(FormatFloat(Mascara, Total), '.', ''));
end;

Function Trunca( valor: currency): currency;
Var vFracao, vInteiro : Currency;
    cFracao : string;
Begin
   vInteiro := Int(valor);
   vFracao := Frac(valor);
   cFracao := FormatFloat('#,##0.00', vFracao);
   if (cFracao = '') or (cFracao = '0') then
      cFracao := '0.00';
   Result :=  vInteiro + StrToCurr(copy(cFracao,3,2 ))/100
End;


function ArredondaPara(valor: Currency; decimais: Integer=2): Currency;
begin
//  decimais := Trunc(Power(10, decimais));
//  Result := (Floor(valor * decimais + 0.5) / decimais);
end;



function LePortasSeriais : TStrings;
var
  Reg : TRegistry;
  Lista : TStrings;
  Retorno : TStrings;
  i : integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('Hardware\DeviceMap\SerialComm', false);
    Lista := TStringList.Create;
    Retorno := TStringList.Create;
    try
      Reg.GetValueNames(Lista);
      for i := 0 to Lista.Count -1 do
        Retorno.Add(Reg.ReadString(Lista[i]));
      Result := Retorno;
    finally
      Lista.Free;
    end;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

function MudaResolucao(Resolucao, Bits : Integer) : Boolean;
var sDispMode: DevMode;
begin
  EnumDisplaySettings(Nil,0,sDispMode);
  if {(NomeComputador = 'GESTOR') or} (Screen.Width > 1024) then //and (Resolucao = 2) then
    begin
      Result := True;
      Exit;
      {Resolucao := 3;
      Bits := 3;}
    end;

  case Resolucao of
    0: begin
         sDispMode.dmPelsWidth  := 640;
         sDispMode.dmPelsHeight := 480;
       end;
    1: begin
         sDispMode.dmPelsWidth  := 800;
         sDispMode.dmPelsHeight := 600;
       end;
    2: begin
         sDispMode.dmPelsWidth  := 1024;
         sDispMode.dmPelsHeight := 768;
       end;
    3: begin
         sDispMode.dmPelsWidth  := 1280;
         sDispMode.dmPelsHeight := 1024;
       end;
    4: begin
         sDispMode.dmPelsWidth  := 1440;
         sDispMode.dmPelsHeight := 900;
       end;
  end;

  case Bits of
    0: sDispMode.dmBitsPerPel := 4; // 16 cores
    1: sDispMode.dmBitsPerPel := 8; // 256 cores
    2: sDispMode.dmBitsPerPel := 16; // 65.536 cores
    3: sDispMode.dmBitsPerPel := 32; // 65.536 cores
  end;

  Result := True;
  if (NomeComputador <> 'GESTOR') or (Resolucao <= 1024) then
    begin
      sDispMode.dmFields := DM_PELSWIDTH+DM_PELSHEIGHT+DM_BITSPERPEL;
      if ChangeDisplaySettings(sDispMode,0) = DISP_CHANGE_SUCCESSFUL	then
         Result := True
      else
         Result := False;
    end;

  Result := True;  //teste de GML em 24.08.2006

end;



procedure TrataErros(Mensagem: String);
begin
  if Pos('duplicate value', Mensagem) <> 0 then
     raise Exception.Create('Código em duplicidade...')
  else
     raise Exception.Create('Ocorreu o seguinte erro...');
end;

Function StrTran( cString, cProcura, cTroca : string ): string;
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


Function VerificaImpressoraInstalada : Boolean;
begin
  Result := True;
  Printer.Refresh;
  if (Printer.Printers.Count = 0) then
     Result := False;
end;


procedure ExibeMensagem(Texto : String; Exibe : Boolean);
begin
  Application.ProcessMessages;
  if Exibe then
   begin
     FrmMensagem.LabelMensagem.Caption := Texto;
     FrmMensagem.Width := FrmMensagem.LabelMensagem.Width + 10;
     FrmMensagem.Left := StrtoInt(FloattoStr(Int((Screen.Width / 2) - (FrmMensagem.Width / 2))));
     Screen.Cursor := crHourGlass;
     FrmMensagem.Show;
   end
  else
   begin
     Screen.Cursor := crDefault;
     FrmMensagem.ModalResult := mrOk;
     FrmMensagem.Close;
   end;
  Application.ProcessMessages;
  SetForegroundWindow(Application.Handle);
end;




Procedure ExibeInformation(Texto : String);
begin
  Application.MessageBox(PChar(Texto), 'Informação', MB_ICONINFORMATION+MB_OK);
end;

Procedure ExibeWarning(Texto : String);
begin
  Application.MessageBox(PChar(Texto), 'Atenção', MB_ICONWARNING+MB_OK);
end;

Procedure ExibeError(Texto : String);
begin
 Application.MessageBox(PChar(Texto), 'Atenção', MB_ICONERROR+MB_OK);
end;

Procedure ExibeMensagemPAF(Texto : String);
begin
  Application.MessageBox(PChar(Texto), 'FarmaxPDV PAF-ECF', MB_ICONWARNING+MB_OK);
end;


Function ExibeYesNo(Texto : String; Default : String) : Boolean;
begin
  Result := False;
  Application.ProcessMessages;
  if UpperCase(default) = 'S' then
    begin
      if Application.MessageBox(PChar(Texto), ' SNGPC ', MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON1) = IDYES then
        Result := True;
    end
  else
  if UpperCase(default) = 'N' then
    begin
      if Application.MessageBox(PChar(Texto), ' SNGPC ', MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2) = IDNO then
        Result :=true;
    end;
end;


Procedure FormPos(Form: TForm; const Horz, Vert, MaisUm: byte);
{ Horz: 1=esquerda, 2=centro, 3=direita Vert: 1=topo, 2=centro, 3=em baixo }
{ MaisUm -> adiciona n unidades do top para baixo }
var
  R: TRect;
begin
  if not SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0) then
    R := Rect(0, 0, Screen.Width, Screen.Height);
  with Form do
    case Horz of
      1: Form.Left := 0;
      2: Form.Left := (R.Right - R.Left - Width) div 2;
      3: Form.Left := R.Right - Width;
    end;
  with Form do
    case Vert of
      1: Form.Top := 0 + MaisUm;
      2: Form.Top := (R.Bottom - R.Top - Height) div 2;
      3: Form.Top := R.Bottom - Height;
    end;
end;


Function FazLogErroApply(Cds : TClientDataSet; Evento : String) : Boolean;
var Log : TextFile;
begin
  Try
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Logs') then
       CreateDir(ExtractFilePath(Application.ExeName) + 'Logs');
    Result := True;
    if Cds.ApplyUpdates(0) <> 0 then
     begin
        if  FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
         begin
           Append(Log);
           Rewrite(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt');

         end
        else
         begin
           AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt');
           Rewrite(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogApply' + FormatDateTime('ddmmyyyy',Date) + '.txt');
         end;
        Writeln(Log, FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Cds.Name + ' - ' + Evento);
        Flush(Log);
        CloseFile(Log);
        Cds.CancelUpdates;
        Result := False;
     end;
   Except
     on E : Exception do
      begin
         GeraLog('FazLogErroApply - ' + Cds.Name + ' - ' + E.Message);
         result := False;
         exit;
      end;
   End;
end;


Procedure FecharDataSet(Cds : TClientDataSet);
begin
  try
    Cds.Close;
    Cds.IndexFieldNames := '';
    Cds.IndexName := '';
    Cds.Filter := '';
    Cds.Filtered := False;
  except
   sleep(1);
  end;
end;


Function Preenche(Texto, Caracter, Posicao : String; Tamanho : Integer) : String;
var
  i : integer;
  Preenchimento : String;
begin
  Preenchimento := '';
  if  Length(Texto) = Tamanho then
   begin
      Result := Texto;
      Exit;
   end
  else
  if Length(Texto) > Tamanho then
   begin
     if (UpperCase(Posicao) = 'E') or (UpperCase(Posicao) = 'A') then
        Result := Copy(Texto, 1, Tamanho)
     else
     if (UpperCase(Posicao) = 'D') then
        Result := Copy(Texto, (Length(Texto) - Tamanho) + 1, Tamanho);
     Exit;
   end
  else
   begin
      for i := 1 to (Tamanho - Length(Texto)) do
          Preenchimento := Preenchimento + Caracter;
      if (UpperCase(Posicao) = 'D') then
         Texto := Texto + Preenchimento
      else
      if (UpperCase(Posicao) = 'E') or (UpperCase(Posicao) = 'A') then
         Texto := Preenchimento + Texto;
      Result := Texto;
   end;   
end;


Function TiraCaracteresInvalidos(Texto : String) : String;
begin
  Delete(Texto, Pos('\', Texto), 1);
  Delete(Texto, Pos(',', Texto), 1);
  Delete(Texto, Pos('''', Texto), 1);
  Delete(Texto, Pos('.', Texto), 1);
  Delete(Texto, Pos('-', Texto), 1);
  Result := Texto;
end;


Function UltimoDiaMes(Mes : Real) : Real;
Const
 Fevereiro = [2];
 Trinta = [4, 6, 9, 11];
 TrintaeUm = [1, 3, 5, 7, 8, 10, 12];
begin
 if StrtoInt(FloattoStr(Mes)) in Fevereiro then
    Result := 28
 else
 if StrtoInt(FloattoStr(Mes)) in Trinta then
    Result := 30
 else
 if StrtoInt(FloattoStr(Mes)) in TrintaeUm then
    Result := 31
 else
 Result := 0;
end;


function NomeMaquina: string;
const
  Max = 15;
var
  Nome: array[0..Max] of char;
  Tam: DWORD;
begin
  Tam := SizeOf(Nome) div SizeOf(Nome[0]);
  if GetComputerName(Nome,Tam) then
    Result := Nome
  else
    Result := '';
end;

function NomeComputador : string;
var
  Computador : String;
  nSize : DWORD;
begin
  nSize := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Computador,nSize);
  if GetComputerName(PChar(Computador), nSize) then begin
    Computador := String(PChar(Computador));
    Result := Computador;
  end;
end;


function DiretorioSistema: String;
var buffer : array[0..144] of char;
begin
  GetSystemDirectory(buffer, 144);
  Result := FormatPath(StrPas(Buffer));
end;

function FormatPath(path : String):string;
var i : integer;
begin
  Path := Trim(Path);
  for i := Length(Path) downto 1 do
   begin
      if Path[i] = '\' then
         Path := Copy(Path, 1, i - 1)
      else
         Break;
   end;
  Result := Path; 
end;


function GetCurrentPrinterHandle: THandle;
var
 Device, Driver, Port: array[0..255] of Char;
 hDeviceMode: THandle;
begin
 Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
 if not OpenPrinter(@Device, Result, nil) then
   //RaiseLastWin32Error;
   RaiseLastOSError;
end;

function VerImpressoraONLINE: Cardinal;
var
  hPrinter  : THandle;
  pInfo:  PPrinterInfo2;
  bytesNeeded: DWORD;
begin
  try
    hprinter := GetCurrentPrinterHandle;
    try
      Winspool.GetPrinter( hPrinter, 2, Nil, 0, @bytesNeeded );
      pInfo := AllocMem( bytesNeeded );
      try
        Winspool.GetPrinter( hPrinter, 2, pInfo, bytesNeeded, @bytesNeeded );
         Result := pInfo^.Status;
      finally
        FreeMem( pInfo );
      end;
    finally
      ClosePrinter( hPrinter );
    end;
  except
    Result := 1;
  end;
end;


function ChkValorVazio(varValor: Variant): Boolean;
  var
    strValor : String;
    dtaValor : TDateTime;
Begin
  Result := True;
  Try
    strValor := VarToStr( varValor );
    Result := ( (Length( Trim( strValor ) ) <= 0) );
  except
    On E: EConvertError Do
    Begin
      If ( VarType( varValor ) = varDate ) Then
      Begin
        dtaValor := VarToDateTime( varValor );
        Result := ( dtaValor = 0 );
      End;
    end;
  end;
End;


//* Retorna uma string contendo os valores de um StringList separado por um separador [FB]
function GetStlLisSeparado( stlSepara : TStringList; strSeparador : String = ';') : String;
  Var
    intIndice : Integer;
    strRetorno : String;
Begin
  strRetorno := '';
  For intIndice := 0 To stlSepara.Count-1 Do
  Begin
    If Not ChkValorVazio( strRetorno ) Then strRetorno := strRetorno + strSeparador;
    //* Não haverá corte [FB]
    strRetorno := strRetorno + stlSepara.Strings[ intIndice ];
  End;
  Result := strRetorno;
End;


procedure SetIndice(ClientDataSet1 : TClientDataSet; stlNomColuna: TStringList; blnAdicionar: Boolean);
Var
    strIndAscendente, strIndDescendente : String;
    stlAdicionar : TStringList;
    intIndice : Integer;

    //* Procedimento encapsulado que cria o índice ascendente [FB]
    procedure SetIndAscendente;
     Begin
      If ( ClientDataset1.IndexDefs.IndexOf( strIndAscendente ) < 0 ) Then
        ClientDataset1.IndexDefs.Add( strIndAscendente, GetStlLisSeparado( stlNomColuna ), [] );
      ClientDataset1.IndexName := strIndAscendente;
     End;

    //* Procedimento encapsulado que cria o índice descendente [FB]
    procedure SetIndDescendente;
     Begin
      If ( ClientDataset1.IndexDefs.IndexOf( strIndDescendente ) < 0 ) Then
        ClientDataset1.IndexDefs.Add( strIndDescendente, GetStlLisSeparado( stlNomColuna ), [ ixDescending ] );
      ClientDataset1.IndexName := strIndDescendente;
     End;
begin
  If blnAdicionar Then
   Begin
      If Not ChkValorVazio( ClientDataset1.IndexName ) Then
       Begin
          Try
            stlAdicionar := TStringList.Create;
            stlAdicionar := GetStrDeStringList( ClientDataset1.IndexDefs.Find( ClientDataset1.IndexName ).Fields );
            For intIndice := 0 To stlAdicionar.Count-1 Do
             Begin
               stlNomColuna.Insert( 0, stlAdicionar.Strings[ intIndice ] );
             End;
          Finally
            FreeAndNil( stlAdicionar );
          End;
       End;
   End;

  If ( stlNomColuna.Count > 0 ) Then
   Begin
      strIndAscendente := 'IA' + GetStlLisSeparado( stlNomColuna, '' );
      strIndDescendente := 'ID' + GetStlLisSeparado( stlNomColuna, '' );
      //* Verificando tamanho do nome do arquivo Gerado[FB]
      If ( Length( strIndAscendente ) > CS_IndMaxName ) Then
       Begin
        ShowMessage( 'Não é possível adicionar mais colunas ao índice.' );
        //* Setando o acumulo de índice como falso [FB]
        blnKeyShift := False;
       End
      Else
       Begin
        //* Verificando se já existe um indice setado [FB]
        If ( ClientDataset1.IndexName = strIndAscendente ) Then
         Begin
          SetIndDescendente;
         End
        Else
         Begin
          SetIndAscendente;
         End;
       End;
   End;
end;


function GetStrDeStringList(strOrigem, strSeparador: String): TStringList;
Var
  stlRetorno : TStringList;
Begin
  stlRetorno := TStringList.Create;
  While Pos( strSeparador, strOrigem ) > 0 Do
   Begin
     stlRetorno.Add( MidStr( strOrigem, 1, Pos( strSeparador, strOrigem )-1 ) );
     strOrigem := MidStr( strOrigem, Pos( strSeparador, strOrigem )+1, Length( strOrigem ) );
   End;
  stlRetorno.Add( strOrigem );
  Result := stlRetorno;
end;


function GetCamIndComposto( ClientDataSet : TClientDataSet ) : TStringList;
Var
  stlIndice : TStringList;
begin
  stlIndice := TStringList.Create;
  Result := stlIndice;
  If Not ChkValorVazio( ClientDataSet.IndexName ) Then
   Begin
     stlIndice := GetStrDeStringList( ClientDataSet.IndexDefs.Find( ClientDataSet.IndexName ).Fields );
     Result := stlIndice;
   End;
end;


procedure GridTitleClick(FieldName : String; ClientDataSet: TClientDataSet);
begin
  // Início da ronita de ordenação

  //* Verificando se o Shift está pressionado [FB]
  If ( Not blnKeyShift ) Then
   Begin
     //* Limpando o objeto de controle dos campos a serem indexados [FB]
     stlIndCamSelecionado.Clear;
   End;
  //* Verificando se o campo a ser adicionado já está na lista daqueles que serão indexados [FB]
  If ( stlIndCamSelecionado.IndexOf( FieldName ) >= 0 ) Then
   Begin
     //* Verificando se o índice já é descendente [FB]
     If ( ixDescending In ClientDataSet.IndexDefs.Find( ClientDataSet.IndexName ).Options ) Then
      Begin
       //* Deletando o índice pois ele já é descendente e deve ser criado novamente como ascendente [FB]
       stlIndCamSelecionado.Delete( stlIndCamSelecionado.IndexOf( FieldName ) );
      end;
   End
  Else
   Begin
     //* Adicionando o campo que deve ser indexado [FB]
     stlIndCamSelecionado.Add( FieldName );
   End;
  //* Aplicando os campos indexados [FB]
  SetIndice(ClientDataSet, stlIndCamSelecionado );
  // Fim da ronita de ordenação
end;

procedure AbrirDocumento(f_name: string);
begin
  ShellExecute(Application.Handle,'Open',PChar(f_name),nil,nil,SW_SHOWNORMAL);
end;


{ retorna a versão do executavel }
function VersaoExe(const Filename: String): String;
   type
     TVersionInfo = packed record
     Dummy: array[0..7] of Byte;
     V2, V1, V4, V3: Word;
   end;
var
 Zero, Size: Cardinal;
 Data: Pointer;
 VersionInfo: ^TVersionInfo;
begin
 Size := GetFileVersionInfoSize
 (Pointer(Filename), Zero);
 if Size = 0 then
    Result := '0'
 else
  begin
   GetMem(Data, Size);
   try
    GetFileVersionInfo(Pointer(Filename), 0, Size, Data);
    VerQueryValue(Data, '\', Pointer(VersionInfo), Size);
    Result := Format('%d.%d.%d.%d', [VersionInfo.V1, VersionInfo.V2, VersionInfo.V3, VersionInfo.V4]);
   finally
    FreeMem(Data);
   end;
  end;
end;


{function VersaoArquivo : string;
const
  InfoStr : array [1..11] of String =
    ('CompanyName', 'FileDescription', 'FileVersion',
     'InternalName', 'LegalCopyright',
     'LegalTradeMarks', 'OriginalFilename',
     'ProductName', 'ProductVersion',
     'Comments','Author');
  LabelStr : array [1..11] of String =
    ('Companhia', 'Descri??o', 'Vers?o arquivo',
     'Nome interno', 'Copyright',
     'Marca registrada', 'Nome original',
     'Nome produto', 'Vers?o produto',
     'Coment?rios', 'Autor');
var
  TamVer : Integer;
  Dummy : DWord;
  Tam : UINT;
  VerInfo : PChar;
  Valor : Pointer;
  Translation : Pointer;
  VerBegin : String;

  Function Tirapontos(s : string):string;
  var I :integer;
      ns:string;
  Begin
     for I:=1 to length(s) do
          if copy(s,I,1)<>'.' then
              ns:=ns+s[I];
    result:=ns;
  end;

begin
TamVer := GetFileVersionInfoSize(PChar(ParamStr(0)),Dummy);
if TamVer > 0 then
   begin
   GetMem(VerInfo,TamVer);

   GetFileVersionInfo(PChar(ParamStr(0)),0,TamVer,VerInfo);
   VerQueryValue(VerInfo,'\\VarFileInfo\\Translation',Translation,Tam);
   VerBegin := '\\StringFileInfo\\'+
               IntToHex(LoWord(LongInt(Translation^)),4)+
               IntToHex(HiWord(LongInt(Translation^)),4)+'\\';
   if VerQueryValue(VerInfo,
      PChar(VerBegin+InfoStr[3]),Valor,Tam) then
       result:='TS'+(Tirapontos(String(PChar(Valor))));

   FreeMem(VerInfo,TamVer);
   end
else
   result:='1.0';
end;  }


// Retorna o número de linhas que um arquivo possui
function NumLinhasArq(Arqtexto : String): integer;
Var
   f: Textfile;
   cont:integer;
Begin
 cont := 0;
 AssignFile(f,Arqtexto);
 Reset(f);
 While not eof(f) Do
  begin
    ReadLn(f);
    Cont := Cont + 1;
  end;
 Closefile(f);
 result := cont;
end;


procedure ControlaBotoes(Formulario : TForm);
var i : integer;
begin
  for i := 0 to Formulario.ComponentCount - 1 do
    if Formulario.Components[i].ClassName = 'TBitBtn' then
       (Formulario.Components[i] as TBitBtn).Enabled := not (Formulario.Components[i] as TBitBtn).Enabled; 
end;


procedure CentralizaTControl(Objeto : TControl);
begin
 Objeto.Left := Trunc( ( (Objeto.Parent as TControl).Width / 2 ) - ( Objeto.Width / 2 ) );
end;


procedure ExportarWwDbGridExcel(Grid : TWwDbGrid; Arquivo : String);
begin
   if Grid.DataSource.DataSet.RecordCount <> 0 then
    begin
       with Grid,Grid.ExportOptions do begin
          ExportType := wwgetSYLK;
          FileName := 'ConsultoriaEstoque.slk';
          Save;
          if not(esoClipboard in Options) then
          ShellExecute(Handle, 'Open', PChar(grid.exportoptions.Filename), nil, nil, sw_shownormal);
       end;
    end;
end;


procedure GeraLog(Mensagem : String);
var Log : TextFile;
begin

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Logs') then
      CreateDir(ExtractFilePath(Application.ExeName)+'Logs');

    AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogErro' + FormatDateTime('ddmmyyyy',Date) + '.txt');
    if FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogErro' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
     begin
       //Rewrite(Log);//, ExtractFilePath(Application.ExeName) + 'Logs\LogErro  ' + FormatDateTime('ddmmyyyy',Date) + '.txt');
        Append(Log);
        Writeln(Log, FormatDateTime('dd/mm/yyyy - hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Mensagem);
      CloseFile(Log);
     end
     else
     begin
      AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogErro' + FormatDateTime('ddmmyyyy',Date) + '.txt');

      Rewrite(Log);
      Append(Log);
      Writeln(Log, FormatDateTime('dd/mm/yyyy - hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Mensagem);
      CloseFile(Log);

     end;


end;

procedure GeraLogNotasFiscais(Mensagem : String);
var Log : TextFile;
begin
  try
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Logs') then
      CreateDir(ExtractFilePath(Application.ExeName)+'Logs');
    AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogNotasFiscais' + FormatDateTime('ddmmyyyy',Date) + '.txt');
    if FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogNotasFiscais' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
     begin
       Append(Log);
     end
    else
     begin
       Rewrite(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogNotasFiscais' + FormatDateTime('ddmmyyyy',Date) + '.txt');
     end;
    if screen.ActiveForm = Nil then
      Writeln(Log, FormatDateTime('dd/mm/yyyy - hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Mensagem)
      else
      Writeln(Log, FormatDateTime('dd/mm/yyyy - hh:mm:ss', Now) + ' - ' + Application.ExeName + ' - ' + Mensagem);
    Flush(Log);
    CloseFile(Log);
//    if Pos('ERRO', UpperCase(Mensagem)) > 0 then
//      GravaLogErroBanco(Mensagem);
  except
  end;
end;

procedure BMPtoJPEG(ABitmap: TBitmap; var AJPEG: TJPEGImage);
begin
  AJPEG.CompressionQuality := 5;
  AJPEG.Grayscale := True;
  AJPEG.Assign(ABitmap);
end;


Procedure GravaLogErroBanco(Mensagem : String);
 var Bmp : TBitmap;
    CanvasAux : TCanvas;
    RectAux : TRect;
    JPEG : TJPEGImage;
    Ids : Real;
begin
  try
//      DmGeral.CDSErrosLog.Close;
//      DmGeral.CDSErrosLog.Params[0].Value := -1;
//      DmGeral.CDSErrosLog.Open;
//      IDS := RetornaID('ERROS_LOG','ID_ERROS');
//      DmGeral.CDSErrosLog.Append;
//      DmGeral.CDSErrosLogID_ERROS.Value       := IDS;
//      DmGeral.CDSErrosLogCD_FILIAL.Value      := dmGeral.CdsParametrosCD_FILIAL.AsFloat;       {Banco Faramx / Tabela Parametros / Campo CD_FILIAL.Value}
//      DmGeral.CDSErrosLogCODIGOUSUARIO.Value  := FloatToStr(CodigoUsuario);     {Banco Farmax / Tabela Parametros / Campo CODIGOUSUARIO.Value}
//      DmGeral.CDSErrosLogNOMEFANTASIA.Value   := NomeComputador + ' - ' + EnderecoIPInterno + ' - ' + Versao;
//      DmGeral.CDSErrosLogUSUARIO.Value        := NomeUsuario;
//      DmGeral.CDSErrosLogDATA.AsDateTime      := Date;
//      DmGeral.CDSErrosLogHORA.AsDateTime      := Now;
//      DmGeral.CDSErrosLogMENSAGEM.Value       := Mensagem;
//      DmGeral.CDSErrosLogSTATUS_VERIFICADO.Value := 'N';
  finally
      Bmp       := TBitmap.Create;
      JPEG      := TJPEGImage.Create;
      CanvasAux := TCanvas.Create;
      try
        CanvasAux.Handle := GetWindowDC(GetDesktopWindow);
        RectAux    := Rect(0, 0, Screen.Width, Screen.Height);
        Bmp.Width  := Screen.Width;
        Bmp.Height := Screen.Height;
        Bmp.Canvas.CopyRect(RectAux, CanvasAux, RectAux);
        BMPtoJPEG(Bmp, JPEG);
       // DmGeral.CDSErrosLogIMAGEM.Assign(JPEG);
      finally
        Bmp.Free;
        JPEG.Free;
        CanvasAux.Free;
      end;
  end;
  Try
//    DmGeral.CDSErrosLog.Post;
//    DmGeral.CDSErrosLog.ApplyUpdates(0);
//    DmGeral.CDSErrosLog.Close;
  Except
    On E:Exception do
     begin
       GeraLog('Erro ao gravar registro na tabela de ErrosLog : ');
       GeraLog(E.Message);
     end;
  End;
end;

function ConectadoInternet: boolean;
begin
  Result := False;
 if InternetCheckConnection('http://www.google.com',1,0) then
  begin
    Result := True;
  end;
end;

function ConectadoServidor(IP : String): boolean;
begin
  Result := False;
  if InternetCheckConnection(PChar(IP),1,0) then
    Result :=True;
end;


//verifica se está conectado a internet usando a API do Windows, é preciso declarar a uses WinInet.
function estaConectado: boolean;
var
 flags : DWORD;
begin
 if not InternetGetConnectedState(@flags, 0) then
    result := false
 else
    result := true;
end;


//verifica se um IP está dentro da faixa de IP's da Rede
function VerificaIPnaRede(IP : string): boolean;
var
 cParte1, cParte2, cParte3 : string;
 cParte4, cParte5, cParte6 : string;
begin
  Result := True;
  cParte1 := Copy(IP, 1, Pos('.', IP) - 1);
  Delete(IP, 1, Pos('.', IP));
  cParte2 := Copy(IP, 1, Pos('.', IP) - 1);
  Delete(IP, 1, Pos('.', IP));
  cParte3 := Copy(IP, 1, Pos('.', IP) - 1);
  Delete(IP, 1, Pos('.', IP));

 // IP := EnderecoIPInterno;
  cParte4 := Copy(IP, 1, Pos('.', IP) - 1);
  Delete(IP, 1, Pos('.', IP));
  cParte5 := Copy(IP, 1, Pos('.', IP) - 1);
  Delete(IP, 1, Pos('.', IP));
  cParte6 := Copy(IP, 1, Pos('.', IP) - 1);
  Delete(IP, 1, Pos('.', IP));

 // if ((cParte1 <> cParte4) or (cParte2 <> cParte5) or (cParte3 <> cParte6)) and (ServidorData <> '127.0.0.1') then
    Result := False;

end;



//seta cor dos objetos de acordo com um arquivo de configuração
procedure ConfiguraCor(Formulario : TForm; Esquema : String);
var
 ArquivoCores : TIniFile;
 i : integer;

 FUNDO, CONTRA_FUNDO, LABEL_FONTE, EDIT_FUNDO, EDIT_FONTE, BOTAO_FUNDO,
 BOTAO_FONTE, GRID_FUNDO, GRID_TITLECOLOR, GRID_FONTE, GRID_ACTIVERECORD,
 GRID_ALTERNATEROW : String;

begin
 if FileExists(ExtractFilePath(Application.ExeName)+'EsquemaCores\Esquema.txt') then
  begin
   ArquivoCores       := TIniFile.Create(ExtractFilePath(Application.ExeName)+'EsquemaCores\Esquema.txt');
   FUNDO              := ArquivoCores.ReadString(Esquema,'FUNDO','');
   CONTRA_FUNDO       := ArquivoCores.ReadString(Esquema,'CONTRA_FUNDO','');
   LABEL_FONTE        := ArquivoCores.ReadString(Esquema,'LABEL_FONTE','');
   EDIT_FUNDO         := ArquivoCores.ReadString(Esquema,'EDIT_FUNDO','');
   EDIT_FONTE         := ArquivoCores.ReadString(Esquema,'EDIT_FONTE','');
   BOTAO_FUNDO        := ArquivoCores.ReadString(Esquema,'BOTAO_FUNDO','');
   BOTAO_FONTE        := ArquivoCores.ReadString(Esquema,'BOTAO_FONTE','');
   GRID_FUNDO         := ArquivoCores.ReadString(Esquema,'GRID_FUNDO','');
   GRID_TITLECOLOR    := ArquivoCores.ReadString(Esquema,'GRID_TITLECOLOR','');
   GRID_FONTE         := ArquivoCores.ReadString(Esquema,'GRID_FONTE','');
   GRID_ACTIVERECORD  := ArquivoCores.ReadString(Esquema,'GRID_ACTIVERECORD','');
   GRID_ALTERNATEROW  := ArquivoCores.ReadString(Esquema,'GRID_ALTERNATEROW','');

   for i := 0 to Formulario.ComponentCount - 1 do
    begin
       // Definindo a cor do formulario
       if FUNDO <> '' then
          Formulario.Color := StringToColor(FUNDO);
       // Definindo a cor do panel principal
       if (Formulario.Components[i].ClassName = 'TPanel') and
          ((Formulario.Components[i] as TPanel).Parent.Name = Formulario.Name) then
        begin
          if FUNDO <> '' then
             (Formulario.Components[i] as TPanel).Color := StringToColor(FUNDO)
        end
       else
       if (Formulario.Components[i].ClassName = 'TPanel') and
          ((Formulario.Components[i] as TPanel).Parent.ClassName = 'TPanel') then
        begin
          if CONTRA_FUNDO <> '' then
          (Formulario.Components[i] as TPanel).Color := StringToColor(CONTRA_FUNDO);
        end
       else
       if (Formulario.Components[i].ClassName = 'TGauge') then
        begin
          if CONTRA_FUNDO <> '' then
           begin
             (Formulario.Components[i] as TGauge).BackColor := StringToColor(FUNDO);
             (Formulario.Components[i] as TGauge).Color := StringToColor(FUNDO);
             (Formulario.Components[i] as TGauge).ForeColor := StringToColor(CONTRA_FUNDO);
           end;
        end
       else
       if (Formulario.Components[i].ClassName = 'TEdit') then
        begin
          if EDIT_FUNDO <> '' then
             (Formulario.Components[i] as TEdit).Color := StringToColor(EDIT_FUNDO);
          if EDIT_FONTE <> '' then
             (Formulario.Components[i] as TEdit).Font.Color := StringToColor(EDIT_FONTE);
        end
       else
       if (Formulario.Components[i].ClassName = 'TDbEdit') then
        begin
          if EDIT_FUNDO <> '' then
             (Formulario.Components[i] as TDbEdit).Color := StringToColor(EDIT_FUNDO);
          if EDIT_FONTE <> '' then
             (Formulario.Components[i] as TDbEdit).Font.Color := StringToColor(EDIT_FONTE);
        end
       else
       if (Formulario.Components[i].ClassName = 'TwwDbGrid') then
        begin
          if GRID_FUNDO <> '' then
             (Formulario.Components[i] as TwwDbGrid).Color := StringToColor(GRID_FUNDO);
          if GRID_FONTE <> '' then
             (Formulario.Components[i] as TwwDbGrid).Font.Color := StringToColor(GRID_FONTE);
          if GRID_TITLECOLOR <> '' then
             (Formulario.Components[i] as TwwDbGrid).TitleColor := StringToColor(GRID_TITLECOLOR);
          if GRID_ACTIVERECORD <> '' then
             (Formulario.Components[i] as TwwDbGrid).PaintOptions.ActiveRecordColor := StringToColor(GRID_ACTIVERECORD);
          if GRID_ALTERNATEROW <> '' then
             (Formulario.Components[i] as TwwDbGrid).PaintOptions.AlternatingRowColor := StringToColor(GRID_ALTERNATEROW);
        end
       else
       if (Formulario.Components[i].ClassName = 'TSpeedButton') then
        begin
          if BOTAO_FUNDO <> '' then
             (Formulario.Components[i] as TSpeedButton).Flat := True;
          if BOTAO_FONTE <> '' then
             (Formulario.Components[i] as TSpeedButton).Font.Color := StringToColor(BOTAO_FONTE);
        end
       else
       if (Formulario.Components[i].ClassName = 'TIAeverButton') then
        begin
          if BOTAO_FUNDO <> '' then
           begin
             //(Formulario.Components[i] as TIAeverButton).ButtonColor := StringToColor(BOTAO_FUNDO);
             //(Formulario.Components[i] as TIAeverButton).ButtonColor1 := StringToColor(BOTAO_FUNDO);
           end;
//          if BOTAO_FONTE <> '' then
//             (Formulario.Components[i] as TIAeverButton).Font.Color := StringToColor(BOTAO_FONTE);
        end;
    end;
  end;
end;


procedure MudaCorForm(Formulario : TForm);
var
  i : integer;
  Arquivo : TextFile;
  Posicao : Integer;
  Linha, NomeEsquema : String;
  ArquivoIni : TIniFile;
  Ativo : String;

  ESQUEMAATUAL, FUNDO1,FUNDO2, TEXTO1, TEXTO2, CAIXA_TEXTO,
  GRID, GRID_TEXTO, GRID_RODAPE, GRID_REGISTROATIVO, GRID_LINHAALTERNADA, SISTEMA : String;

  ListaEsquemas : TStrings;
begin
//  CriaArquivoIni;
//
//  //Carregando os esquemas existentes em um TStrings
//  ListaEsquemas := TStringList.Create;
//  AssignFile(Arquivo, ExtractFilePath(Application.ExeName)+'Cores.ini');
//  Reset(Arquivo);
//  while not Eof(Arquivo) do
//   begin
//     Readln(Arquivo, Linha);
//     Posicao := Pos('[', Linha);
//     if Posicao > 0 then
//      begin
//        Delete(Linha, Posicao, 1);
//        NomeEsquema := Copy(Linha, Posicao, Pos(']', Linha) - 1);
//        ListaEsquemas.Add(NomeEsquema);
//      end;
//   end;
//  CloseFile(Arquivo);
//
//  //Descobrindo o esquema ativo
//  ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Cores.ini');
//  for i := 0 to ListaEsquemas.Count - 1 do
//   begin
//      Ativo := ArquivoIni.ReadString(ListaEsquemas.Strings[i],'ATIVO','N');
//      if Ativo = 'S' then
//       begin
//         ESQUEMAATUAL := ListaEsquemas.Strings[i];
//         Break;
//       end;
//   end;
//
//  //Lendo o esquema atual de cores
//  FUNDO1 := ArquivoIni.ReadString(ESQUEMAATUAL, 'FUNDO1', 'clNone');
//  FUNDO2 := ArquivoIni.ReadString(ESQUEMAATUAL, 'FUNDO2', 'clNone');
//  TEXTO1 := ArquivoIni.ReadString(ESQUEMAATUAL, 'TEXTO1', 'clNone');
//  TEXTO2 := ArquivoIni.ReadString(ESQUEMAATUAL, 'TEXTO2', 'clNone');
//  CAIXA_TEXTO := ArquivoIni.ReadString(ESQUEMAATUAL, 'CAIXA_TEXTO', 'clNone');
//  GRID := ArquivoIni.ReadString(ESQUEMAATUAL, 'GRID', 'clNone');
//  GRID_TEXTO := ArquivoIni.ReadString(ESQUEMAATUAL, 'GRID_TEXTO', 'clNone');
//  GRID_RODAPE := ArquivoIni.ReadString(ESQUEMAATUAL, 'GRID_RODAPE', 'clNone');
//  GRID_REGISTROATIVO := ArquivoIni.ReadString(ESQUEMAATUAL, 'GRID_REGISTROATIVO', 'clNone');
//  GRID_LINHAALTERNADA := ArquivoIni.ReadString(ESQUEMAATUAL, 'GRID_LINHAALTERNADA', 'clNone');
//  SISTEMA := ArquivoIni.ReadString(ESQUEMAATUAL, 'SISTEMA', 'N');
//  ArquivoIni.Free;
//
//  Formulario.Color := StringToColor(FUNDO1);
//  for i := 0 to Formulario.ComponentCount - 1 do
//   begin
//     if (Formulario.Components[i].ClassName = 'TPanel') then
//      begin
//        if (Formulario.Components[i] as TPanel).Parent.ClassName = 'TPanel' then
//           (Formulario.Components[i] as TPanel).Color := StringToColor(FUNDO2)
//        else
//           (Formulario.Components[i] as TPanel).Color := StringToColor(FUNDO1);
//      end
//     else
//     if Formulario.Components[i].ClassName = 'TLabel' then
//      begin
//        if ((Formulario.Components[i] as TLabel).Parent.ClassName = 'TPanel') then
//         begin
//           if ((Formulario.Components[i] as TLabel).Parent as TPanel).Color = StringToColor(FUNDO2) then
//              (Formulario.Components[i] as TLabel).Font.Color := StringToColor(TEXTO2)
//           else
//              (Formulario.Components[i] as TLabel).Font.Color := StringToColor(TEXTO1);
//         end
//        else
//        (Formulario.Components[i] as TLabel).Font.Color := StringToColor(TEXTO1);
//      end
//     else
//     if Formulario.Components[i].ClassName = 'TDBCheckBox' then
//      begin
//        if ((Formulario.Components[i] as TDBCheckBox).Parent.ClassName = 'TPanel') then
//         begin
//           (Formulario.Components[i] as TDBCheckBox).Color := ((Formulario.Components[i] as TDBCheckBox).Parent as TPanel).Color;
//           if ((Formulario.Components[i] as TDBCheckBox).Parent as TPanel).Color = StringToColor(FUNDO2) then
//              (Formulario.Components[i] as TDBCheckBox).Font.Color := StringToColor(TEXTO2)
//           else
//              (Formulario.Components[i] as TDBCheckBox).Font.Color := StringToColor(TEXTO1);
//         end
//        else
//         begin
//           (Formulario.Components[i] as TDBCheckBox).Color := ((Formulario.Components[i] as TDBCheckBox).Parent as TForm).Color;
//           (Formulario.Components[i] as TDBCheckBox).Font.Color := StringToColor(TEXTO1);
//         end;
//      end
//     else
//     if Formulario.Components[i].ClassName = 'TEdit' then
//        (Formulario.Components[i] as TEdit).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TMemo' then
//        (Formulario.Components[i] as TMemo).Color := StringToColor(CAIXA_TEXTO)
//     else
////     if Formulario.Components[i].ClassName = 'TEditValidate' then
////        (Formulario.Components[i] as TEditValidate).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TDbEditValidate' then
//        (Formulario.Components[i] as TDbEditValidate).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TDBEdit' then
//        (Formulario.Components[i] as TDbEdit).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TDBText' then
//        (Formulario.Components[i] as TDBText).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TwwDBLookupComboDlg' then
//        (Formulario.Components[i] as TwwDBLookupComboDlg).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TwwDBComboBox' then
//        (Formulario.Components[i] as TwwDBComboBox).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TwwDBComboDlg' then
//        (Formulario.Components[i] as TwwDBComboDlg).Color := StringToColor(CAIXA_TEXTO)
//     else
//     if Formulario.Components[i].ClassName = 'TAlignEdit' then
//      begin
//        if ((Formulario.Components[i] as TAlignEdit).Parent.ClassName = 'TPanel') then
//         begin
//           if (((Formulario.Components[i] as TAlignEdit).Parent as TPanel).Parent.ClassName = 'TPanel') and
//              (Formulario.Components[i] as TAlignEdit).Ctl3D then
//            begin
//              (Formulario.Components[i] as TAlignEdit).ColorOnFocus := StringToColor(FUNDO1);
//              (Formulario.Components[i] as TAlignEdit).ColorOnNoFocus := StringToColor(FUNDO1);
//            end
//           else
//            begin
//              (Formulario.Components[i] as TAlignEdit).ColorOnFocus := StringToColor(CAIXA_TEXTO);
//              (Formulario.Components[i] as TAlignEdit).ColorOnNoFocus := StringToColor(CAIXA_TEXTO);
//            end;
//         end
//        else
//         begin
//            (Formulario.Components[i] as TAlignEdit).ColorOnFocus := StringToColor(CAIXA_TEXTO);
//            (Formulario.Components[i] as TAlignEdit).ColorOnNoFocus := StringToColor(CAIXA_TEXTO);
//         end;
//      end
//     else
//     if Formulario.Components[i].ClassName = 'TSpeedButton' then
//      begin
//        if ((Formulario.Components[i] as TSpeedButton).Parent.ClassName = 'TPanel') then
//         begin
//           if ((Formulario.Components[i] as TSpeedButton).Parent as TPanel).Color = StringToColor(FUNDO2) then
//              (Formulario.Components[i] as TSpeedButton).Font.Color := StringToColor(TEXTO2)
//           else
//              (Formulario.Components[i] as TSpeedButton).Font.Color := StringToColor(TEXTO1);
//         end
//        else
//        (Formulario.Components[i] as TSpeedButton).Font.Color := StringToColor(TEXTO1);
//      end
//     else
//     if Formulario.Components[i].ClassName = 'TwwDBGrid' then
//      begin
//        (Formulario.Components[i] as TwwDbGrid).Color := StringToColor(GRID);
//        (Formulario.Components[i] as TwwDbGrid).Font.Color := StringToColor(GRID_TEXTO);
//        (Formulario.Components[i] as TwwDbGrid).TitleColor := StringToColor(GRID);
//        (Formulario.Components[i] as TwwDbGrid).TitleFont.Color := StringToColor(GRID_TEXTO);
//        (Formulario.Components[i] as TwwDbGrid).FooterCellColor := StringToColor(GRID_RODAPE);
//        (Formulario.Components[i] as TwwDbGrid).FooterColor := StringToColor(GRID_RODAPE);
//        (Formulario.Components[i] as TwwDbGrid).PaintOptions.ActiveRecordColor := StringToColor(GRID_REGISTROATIVO);
//        (Formulario.Components[i] as TwwDbGrid).PaintOptions.AlternatingRowColor := StringToColor(GRID_LINHAALTERNADA);
//      end;
//   end;
end;


procedure CriaIni(Inifile:String);
var
Ini: TIniFile;
begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
  Ini.WriteString('Section','Path',GetCurrentDir);
  Ini.WriteString('Section','Data',GetCurrentDir +'Data');
  Ini.WriteString('Section','Sounds',GetCurrentDir+'Sons');
  finally
  Ini.Free;
  end;
end;


procedure GravaIni(Inifile:String;Secao:String;Chave:String;valor:String);
var
Ini: TIniFile;
begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
  Ini.WriteString(Secao,chave,valor);
  finally
  Ini.Free;
  end;
end;


Function LeIni(Inifile:String;Secao:String;Chave:String):String;
var
Ini: TIniFile;
Begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
  Result := Ini.ReadString(Secao,chave,'');
  finally
  Ini.Free
  end;
end;



procedure CriaArquivoIni;
var
   Arquivo : TextFile;
begin
  if not FileExists(ExtractFilePath(Application.ExeName)+'Cores.ini') then
   begin
      AssignFile(Arquivo, ExtractFilePath(Application.ExeName)+'Cores.ini');
      Rewrite(Arquivo);
      Writeln(Arquivo, '[CINZA]');
      Writeln(Arquivo, 'FUNDO1=clGray');
      Writeln(Arquivo, 'FUNDO2=$00C9C9C9');
      Writeln(Arquivo, 'TEXTO1=clBlack');
      Writeln(Arquivo, 'TEXTO2=clBlack');
      Writeln(Arquivo, 'CAIXA_TEXTO=$00C9C9C9');
      Writeln(Arquivo, 'GRID=$00C9C9C9');
      Writeln(Arquivo, 'GRID_TEXTO=clBlack');
      Writeln(Arquivo, 'GRID_RODAPE=$00ADADAD');
      Writeln(Arquivo, 'GRID_REGISTROATIVO=clGray');
      Writeln(Arquivo, 'GRID_LINHAALTERNADA=$00ADADAD');
      Writeln(Arquivo, 'SISTEMA=S');
      Writeln(Arquivo, 'ATIVO=S');
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, '[AZUL]');
      Writeln(Arquivo, 'FUNDO1=$00FF870F');
      Writeln(Arquivo, 'FUNDO2=$00FFE1C4');
      Writeln(Arquivo, 'TEXTO1=clBlack');
      Writeln(Arquivo, 'TEXTO2=clBlack');
      Writeln(Arquivo, 'CAIXA_TEXTO=$00FFE1C4');
      Writeln(Arquivo, 'GRID=$00FFE1C4');
      Writeln(Arquivo, 'TEXTO_GRID=clBlack');
      Writeln(Arquivo, 'GRID_TEXTO=clBlack');
      Writeln(Arquivo, 'GRID_RODAPE=$00FFB164');
      Writeln(Arquivo, 'GRID_REGISTROATIVO=$00FF870F');
      Writeln(Arquivo, 'GRID_LINHAALTERNADA=$00FFB164');
      Writeln(Arquivo, 'SISTEMA=S');
      Writeln(Arquivo, 'ATIVO=N');
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, '[MARROM]');
      Writeln(Arquivo, 'FUNDO1=$007BACAA');
      Writeln(Arquivo, 'FUNDO2=$00C7DCDB');
      Writeln(Arquivo, 'TEXTO1=clBlack');
      Writeln(Arquivo, 'TEXTO2=clBlack');
      Writeln(Arquivo, 'CAIXA_TEXTO=$00C7DCDB');
      Writeln(Arquivo, 'GRID=$00C7DCDB');
      Writeln(Arquivo, 'GRID_TEXTO=clBlack');
      Writeln(Arquivo, 'GRID_RODAPE=$00A2C4C1');
      Writeln(Arquivo, 'GRID_REGISTROATIVO=$007BACAA');
      Writeln(Arquivo, 'GRID_LINHAALTERNADA=$00A2C4C1');
      Writeln(Arquivo, 'SISTEMA=S');
      Writeln(Arquivo, 'ATIVO=N');
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, '[VERDE]');
      Writeln(Arquivo, 'FUNDO1=$00A4A400');
      Writeln(Arquivo, 'FUNDO2=$00D7D700');
      Writeln(Arquivo, 'TEXTO1=clBlack');
      Writeln(Arquivo, 'TEXTO2=clBlack');
      Writeln(Arquivo, 'CAIXA_TEXTO=$00D7D700');
      Writeln(Arquivo, 'GRID=$00D7D700');
      Writeln(Arquivo, 'GRID_TEXTO=clBlack');
      Writeln(Arquivo, 'GRID_RODAPE=$00A8A800');
      Writeln(Arquivo, 'GRID_REGISTROATIVO=$00A4A400');
      Writeln(Arquivo, 'GRID_LINHAALTERNADA=$00A8A800');
      Writeln(Arquivo, 'SISTEMA=S');
      Writeln(Arquivo, 'ATIVO=N');
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, '[AQUA]');
      Writeln(Arquivo, 'FUNDO1=clAqua');
      Writeln(Arquivo, 'FUNDO2=$00FFFFA6');
      Writeln(Arquivo, 'TEXTO1=clBlack');
      Writeln(Arquivo, 'TEXTO2=clBlack');
      Writeln(Arquivo, 'CAIXA_TEXTO=$00FFFFA6');
      Writeln(Arquivo, 'GRID=$00FFFFA6');
      Writeln(Arquivo, 'GRID_TEXTO=clBlack');
      Writeln(Arquivo, 'GRID_RODAPE=$00FFFF66');
      Writeln(Arquivo, 'GRID_REGISTROATIVO=clAqua');
      Writeln(Arquivo, 'GRID_LINHAALTERNADA=$00FFFF66');
      Writeln(Arquivo, 'SISTEMA=S');
      Writeln(Arquivo, 'ATIVO=N');
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, '[ROSA]');
      Writeln(Arquivo, 'FUNDO1=clPurple');
      Writeln(Arquivo, 'FUNDO2=$00FF7DFF');
      Writeln(Arquivo, 'TEXTO1=clWhite');
      Writeln(Arquivo, 'TEXTO2=clBlack');
      Writeln(Arquivo, 'CAIXA_TEXTO=$00FF7DFF');
      Writeln(Arquivo, 'GRID=$00FF7DFF');
      Writeln(Arquivo, 'GRID_TEXTO=clBlack');
      Writeln(Arquivo, 'GRID_RODAPE=$00F000F0');
      Writeln(Arquivo, 'GRID_REGISTROATIVO=clPurple');
      Writeln(Arquivo, 'GRID_LINHAALTERNADA=$00F000F0');
      Writeln(Arquivo, 'SISTEMA=S');
      Writeln(Arquivo, 'ATIVO=N');

      CloseFile(Arquivo);
   end;
end;


function RemovePontoCNPJ(CNPJ : String) : String;
begin
  CNPJ := StrTran(CNPJ, '.', '');
  CNPJ := StrTran(CNPJ, '-', '');
  CNPJ := StrTran(CNPJ, '/', '');
  Result := CNPJ;
end;

function RemoveCaracteresInvalidos(Texto : String) : String;
var
 TextoAux : String;
 i, TamanhoTextoAux : integer;
begin
  TextoAux := Texto;
  TamanhoTextoAux := Length(TextoAux);
  i := 1;
  While i <= TamanhoTextoAux do
    if (not (TextoAux[i] in ['0'..'9']) and
        not (TextoAux[i] in ['A'..'Z']) and
        not (TextoAux[i] in ['a'..'z'])) or
       (TextoAux[i] = ' ') then
     begin
       Delete(TextoAux, i, 1);
       TamanhoTextoAux := Length(TextoAux);
     end
    else
      Inc(i);
  Result := TextoAux;
end;



Function Dias_Uteis(DataI,DataF:TDateTime):Integer;
var contador:Integer;
begin
    Contador := 0;
    if DataI > DataF then
      begin
        result := 0;
        exit
      end;
    while (DataI <= DataF) do
    begin
      if ((DayOfWeek(DataI) > 1) and (DayOfWeek(DataI) < 7)) then
      Inc(Contador);
      DataI := DataI + 1
    end;
    result := Contador;
end;

{function UltimoDiadoMes(Mdt: TDateTime) : TDateTime;
var
  ano, mes, dia : word;
  mDtTemp : TDateTime;
begin
  Decodedate(mDt, ano, mes, dia);
  mDtTemp := (mDt - dia) + 33;
  Decodedate(mDtTemp, ano, mes, dia);
  Result := mDtTemp - dia;
end;}

Function PrimeiroDiaDoMes(dData : TdateTime) : TDateTime;
begin
  Result := StartOfTheMonth(dData);
end;

Function UltimoDiaDoMes(dData : TdateTime) : TDateTime;
begin
  Result := EndOfTheMonth(dData);
end;


Function SerialNum(FDrive:String) :String;
Var Serial:DWord;
    DirLen,Flags: DWord;
    DLabel : Array[0..11] of Char;
begin
 Try
  GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
 Except Result :='';
 end;
end;

function PegaSysDir: string;
var
  MeuBuffer: Array [1..128] of Char;
  retorno: Integer;
Begin
//  retorno:=GetSystemDirectory(@MeuBuffer,128);
//  if (retorno>128) OR (retorno=0) then
//     PegaSysDir:=''
//  else
//     PegaSysDir:=StrPas(@MeuBuffer);
End;

Function ExtractSystemDir : String;
Var
  Buffer : Array[0..144] of Char;
Begin
  GetSystemDirectory(Buffer,144);
  Result := FormatPath(StrPas(Buffer));
End;

function FormataValor(var sValor : String; Decimais : Integer) : String;
var nValor : Integer;
begin
  nValor := StrToIntDef(sValor,0);   //gmlsp alterou para strtointdef......
  sValor := InttoStr(nValor);
  Result := sValor;
  if Decimais <> 0 then
     Result := Copy(sValor, 1, Length(sValor) - Decimais) + ',' + Copy(sValor, Length(sValor) - (Decimais - 1), Length(sValor));
end;


//Corrige, bug da função Trunc.
//Deve calcular Trunc somente com variaveis e nunca com Expressoes, caso contrário o resultado pode não ser o esperado.
// Valores de Teste: Trunc(1,602 x 0,98) | 5 * 12,991 | 2,09 * 23,5
function TruncFix( X : Double ) : Real;
begin
 // Result := Trunc( SimpleRoundTo( X, -3) );
end;



//==============================================================================
// Cria um drive mapeado para uma pasta local.
// Exemplo: CreateDrive('Z:','C:\\Delphi');
//==============================================================================
Function CreateDrive(DriveLetter, DrivePath:String):Boolean;
Begin
  DriveLetter := Copy(DriveLetter,1,1)+':';
  Result := DefineDosDevice(DDD_RAW_TARGET_PATH,PChar(DriveLetter),PChar(DrivePath));
  //Sleep(1);
End;


//==============================================================================
// Retira um mapeamento de drive local
// Exemplo: RemoveDrive('Z:');
//==============================================================================
Function RemoveDrive(DriveLetter:String):Boolean;
Begin
  DriveLetter := Copy(DriveLetter,1,1)+':';
  Result := DefineDosDevice(DDD_REMOVE_DEFINITION,PChar(DriveLetter),'');
  //Sleep(1);
End;


//==============================================================================
// Retorna a pasta mapeada para um drive local
// Exemplo: ShowMessage( GetDrivePath('Z:') );
//==============================================================================
Function GetDrivePath(DriveLetter:String):String;
var Buffer: array[0..255] of char;
begin
    DriveLetter := Copy(DriveLetter,1,1)+':';
    FillChar(Buffer,SizeOf(Buffer),#0);
    QueryDosDevice(PChar(DriveLetter),Buffer,SizeOf(Buffer));
    Result := StrPas(Buffer);
End;


Function MapearUnidade(DriveLetter, DrivePath:String):String;
var
  NRW: TNetResource;
begin
  with NRW do
  begin
    dwType := RESOURCETYPE_ANY;
    lpLocalName := Pchar(Copy(DriveLetter,1,1)+':');   // onde H é a letra do drive a ser adicionado.
    lpRemoteName := Pchar(DrivePath);                 // computador é o nome do computador da rede a ser mapeado.
    lpProvider := '';
  end;
  WNetAddConnection2(NRW, 'versao', '123', CONNECT_UPDATE_PROFILE);     // senha e usuario
  //WNetGetConnection Unidade, Caminho, 255)
  //WNetCancelConnection Unidade, True
end;


function CancelaMapeamento(Mapeamento: PChar; CanForce: Boolean): String;
var
  BuffErro, Buffer: array[0..MAX_PATH] of Char;
  CodErro, ErrorBufSize, BufferSize: DWord;
begin
  ErrorBufSize := SizeOf(MAX_PATH);
  BufferSize := SizeOf(MAX_PATH);
  WNetCancelConnection(Mapeamento, CanForce);
  case GetLastError of
    ERROR_BAD_PROFILE : Result := 'O perfil do usuário está num formato incorreto.';
    ERROR_CANNOT_OPEN_PROFILE : Result := 'Não foi possível abrir o perfil de usuário para processar conexões persistentes.';
    ERROR_DEVICE_IN_USE : Result := 'O mapeamento está em uso e não pode ser desconectado.';
    ERROR_EXTENDED_ERROR : begin
    WNetGetLastError(CodErro, BuffErro, ErrorBufSize, Buffer, BufferSize);
    Result := 'Ocorreu o seguinte erro:' + #13+#10+ IntToStr(CodErro) + ': ' + BuffErro;
  end;
  ERROR_NOT_CONNECTED : Result := 'O nome do mapeamento não é válido, ou não está conectado no momento.';
  ERROR_OPEN_FILES : Result := 'Existem arquivos abertos, e a opção de Forçar não está habilitada.';
  else
  Result := 'Mapeamento desconectado com sucesso!';
end;
end;


function MapearRede3(var NetResource: TNetResource; Usuario, Senha: string): string;
var
User, PassWord: array[0..MAX_PATH] of Char;
begin
  StrPCopy(User, Usuario);
  StrPCopy(Password, Senha);
  WNetAddConnection3(INVALID_HANDLE_VALUE, NetResource, Password, User, CONNECT_INTERACTIVE and CONNECT_PROMPT);
  case GetLastError of
    ERROR_ACCESS_DENIED: result := 'Acesso negado.';
    ERROR_ALREADY_ASSIGNED: result := 'A letra do drive especificada já está conectada.';
    ERROR_BAD_DEV_TYPE: result := 'O tipo de dispositivo e o tipo de recurso não são compatíveis.';
    ERROR_BAD_DEVICE: result := 'Letra inválida.';
    ERROR_BAD_NET_NAME: result := 'Nome do servidor não é válido ou não pode ser localizado.';
    ERROR_BAD_PROFILE: result := 'Formato incorreto de parâmetros.';
    ERROR_CANNOT_OPEN_PROFILE: result := 'Conexão permanente não disponível.';
    ERROR_DEVICE_ALREADY_REMEMBERED: result := 'Uma entrada para o dispositivo especificado já está no perfil do usuário.';
    ERROR_EXTENDED_ERROR: result := 'Erro de rede.';
    ERROR_INVALID_PASSWORD: result := 'Senha especificada inválida.';
    ERROR_NO_NET_OR_BAD_PATH: result := 'A operação não foi concluída porque a rede não foi inicializada ou caminho é inválido.';
    ERROR_NO_NETWORK: result := 'A rede não está presente.';
    else
    result := 'A Conexão ' + NetResource.lpRemoteName + ' na unidade ' + NetResource.lpLocalName + ' foi efetuada corretamente!';
  end;
end;

function MapearRede2(var NetResource: TNetResource; Usuario, Senha: string): string;
var
User, PassWord: array[0..MAX_PATH] of Char;
begin
  StrPCopy(User, Usuario);
  StrPCopy(Password, Senha);
  WNetAddConnection2(NetResource, Password, User, CONNECT_UPDATE_PROFILE);
  case GetLastError of
    ERROR_ACCESS_DENIED: result := 'Acesso negado.';
    ERROR_ALREADY_ASSIGNED: result := 'A letra do drive especificada já está conectada.';
    ERROR_BAD_DEV_TYPE: result := 'O tipo de dispositivo e o tipo de recurso não são compatíveis.';
    ERROR_BAD_DEVICE: result := 'Letra inválida.';
    ERROR_BAD_NET_NAME: result := 'Nome do servidor não é válido ou não pode ser localizado.';
    ERROR_BAD_PROFILE: result := 'Formato incorreto de parâmetros.';
    ERROR_CANNOT_OPEN_PROFILE: result := 'Conexão permanente não disponível.';
    ERROR_DEVICE_ALREADY_REMEMBERED: result := 'Uma entrada para o dispositivo especificado já está no perfil do usuário.';
    ERROR_EXTENDED_ERROR: result := 'Erro de rede.';
    ERROR_INVALID_PASSWORD: result := 'Senha especificada inválida.';
    ERROR_NO_NET_OR_BAD_PATH: result := 'A operação não foi concluída porque a rede não foi inicializada ou caminho é inválido.';
    ERROR_NO_NETWORK: result := 'A rede não está presente.';
    else
    result := 'A Conexão ' + NetResource.lpRemoteName + ' na unidade ' + NetResource.lpLocalName + ' foi efetuada corretamente!';
  end;
end;


function SysComputerName: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;


function AssinaturaHash(Arq : String) : String;
var
 Comando : String;
 Chave : String;
 Linha : TStringList;
begin
 // Gerando chave privada
// if FileExists(gsAppPath + 'Farmasoft.pem') then
//    DeleteFile(PChar(gsAppPath + 'Farmasoft.pem'));
// Comando := 'c:\openssl\bin\openssl genrsa -out ' + gsAppPath + 'Farmasoft.pem 1024';
// WinExec(PChar(Comando), SW_HIDE);
//
// Sleep(5000);
//
// //Gerando arquivo com assinatura hash MD5
// if FileExists(gsAppPath + 'ChaveMD5.ead') then
//    DeleteFile(PChar(gsAppPath + 'ChaveMD5.ead'));
// Comando := 'c:\openssl\bin\openssl dgst -md5 -sign ' + gsAppPath + 'Farmasoft.pem -out ' + gsAppPath + 'ChaveMD5.ead -hex ' + Arq;
// WinExec(PChar(Comando), SW_HIDE);
//
// Sleep(5000);
//
// //Extraindo assinatura do arquivo hash MD5
// if FileExists(gsAppPath + 'ChaveMD5.ead') then
//  begin
//    Linha := TStringList.Create;
//    Linha.LoadFromFile(gsAppPath + 'ChaveMD5.ead');
//    Chave := Trim(Linha.Values['MD5(' + Arq + ')']);
//    Linha.Free;
//    Result := Chave;
//  end;
end;

procedure GravaControleINI(Venda, Status, Cd_operador, Id_OperadorCaixa, DataCaixa : String);
var ControleCupom : TIniFile;
begin
   ControleCupom := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Controle.ini');
   if Status = 'N' then
      ControleCupom.WriteString('VENDA', 'CD_VENDA', Venda);
   ControleCupom.WriteString('VENDA', 'CONCLUIDA', Status);
   if Cd_operador <> '' then
      ControleCupom.WriteString('VENDA', 'CD_OPERADOR', Cd_operador);
   if Id_OperadorCaixa <> '' then
      ControleCupom.WriteString('VENDA', 'ID_OPERADORCAIXA', Id_OperadorCaixa);
   if DataCaixa <> '' then
      ControleCupom.WriteString('VENDA', 'DATA_CAIXA', DataCaixa);
   ControleCupom.Free;
end;

procedure FormataForm(Sender:TComponent);
var i : integer;
begin
  for i := 0 to Sender.ComponentCount - 1 do
   begin
     if Sender.Components[i].ClassName = 'TPageControl' then
        (Sender.Components[i] as TPageControl).Style := tsFlatButtons
     else
     if Sender.Components[i].ClassName = 'TwwDBGrid' then
      begin
        (Sender.Components[i] as TwwDBGrid).Ctl3D := False;
        (Sender.Components[i] as TwwDBGrid).Color := clBtnFace;
        (Sender.Components[i] as TwwDBGrid).FooterCellColor := $009E9E9E;
        (Sender.Components[i] as TwwDBGrid).FooterColor := $009E9E9E;
        (Sender.Components[i] as TwwDBGrid).PaintOptions.ActiveRecordColor := clNone;
        (Sender.Components[i] as TwwDBGrid).PaintOptions.AlternatingRowColor := clSilver;
      end
     else
     if Sender.Components[i].ClassName = 'TwwDBLookupComboDlg' then
      begin
        (Sender.Components[i] as TwwDBLookupComboDlg).BorderStyle := bsNone;
        (Sender.Components[i] as TwwDBLookupComboDlg).ButtonEffects.Flat := True;
        (Sender.Components[i] as TwwDBLookupComboDlg).Color := clBtnFace;
        (Sender.Components[i] as TwwDBLookupComboDlg).Frame.NonFocusBorders := [efLeftBorder, efRightBorder, efTopBorder, efBottomBorder];
        (Sender.Components[i] as TwwDBLookupComboDlg).Frame.Enabled := True;
        (Sender.Components[i] as TwwDBLookupComboDlg).Repaint;
      end
     else
     if Sender.Components[i].ClassName = 'TwwDBDateTimePicker' then
      begin
        (Sender.Components[i] as TwwDBDateTimePicker).BorderStyle := bsNone;
        (Sender.Components[i] as TwwDBDateTimePicker).ButtonEffects.Flat := True;
        (Sender.Components[i] as TwwDBDateTimePicker).Color := clBtnFace;
        (Sender.Components[i] as TwwDBDateTimePicker).CalendarAttributes.Colors.TextColor := clBlack;
        (Sender.Components[i] as TwwDBDateTimePicker).CalendarAttributes.Colors.TitleBackColor := clBlack;
        (Sender.Components[i] as TwwDBDateTimePicker).CalendarAttributes.Colors.TrailingTextColor := clBlack;
        (Sender.Components[i] as TwwDBDateTimePicker).CalendarAttributes.Colors.TitleTextColor := clWhite;
        (Sender.Components[i] as TwwDBDateTimePicker).Frame.Enabled := True;
        (Sender.Components[i] as TwwDBDateTimePicker).Frame.NonFocusBorders := [efLeftBorder, efRightBorder, efTopBorder, efBottomBorder];
      end
     else
     if Sender.Components[i].ClassName = 'TwwDBComboBox' then
      begin
        (Sender.Components[i] as TwwDBComboBox).BorderStyle := bsNone;
        (Sender.Components[i] as TwwDbComboBox).ButtonEffects.Flat := True;
        (Sender.Components[i] as TwwDbComboBox).Color := clBtnFace;
        (Sender.Components[i] as TwwDbComboBox).Ctl3D := False;
        (Sender.Components[i] as TwwDbComboBox).Font.Style := [];
        (Sender.Components[i] as TwwDbComboBox).Font.Size := 8;
        (Sender.Components[i] as TwwDbComboBox).Frame.NonFocusBorders := [efLeftBorder, efRightBorder, efTopBorder, efBottomBorder];
        (Sender.Components[i] as TwwDbComboBox).Frame.Enabled := True;
        (Sender.Components[i] as TwwDbComboBox).Repaint;
      end
     else
     if Sender.Components[i].ClassName = 'TSpeedButton' then
      begin
        (Sender.Components[i] as TSpeedButton).Flat := True;
        (Sender.Components[i] as TSpeedButton).Font.Size := 8;
        (Sender.Components[i] as TSpeedButton).Font.Style := [];
        (Sender.Components[i] as TSpeedButton).Font.Name := 'MS Sans Serif';
      end
     else
     if Sender.Components[i].ClassName = 'TwwKeyCombo' then
        (Sender.Components[i] as TwwKeyCombo).Color := clBtnFace
     else
     if Sender.Components[i].ClassName = 'TwwIncrementalSearch' then
        (Sender.Components[i] as TwwIncrementalSearch).Color := clBtnFace
     else
     if Sender.Components[i].ClassName = 'TPanel' then
      begin
        (Sender.Components[i] as TPanel).BevelInner := bvLowered;
        (Sender.Components[i] as TPanel).BevelOuter := bvRaised;
      end
     else
     if Sender.Components[i].ClassName = 'TEdit' then
      begin
        (Sender.Components[i] as TEdit).Color := clBtnFace;
        (Sender.Components[i] as TEdit).Ctl3D := False;
      end
     else
     if Sender.Components[i].ClassName = 'TDBEdit' then
      begin
        (Sender.Components[i] as TDBEdit).Color := clBtnFace;
        (Sender.Components[i] as TDBEdit).Ctl3D := False;
      end;
   end;
end;


function RemoveZeroInicial(Texto : String) : String;
begin
  while Copy(Texto, 1, 1) = '0' do
   Delete(Texto, 1, 1);
  Result := Texto; 
end;


function MesPorExtenso(Mes : Integer) : String;
begin
  Result := '';
  Case Mes of
    1  : Result := 'Janeiro';
    2  : Result := 'Fevereiro';
    3  : Result := 'Março';
    4  : Result := 'Abril';
    5  : Result := 'Maio';
    6  : Result := 'Junho';
    7  : Result := 'Julho';
    8  : Result := 'Agosto';
    9  : Result := 'Setembro';
    10 : Result := 'Outubro';
    11 : Result := 'Novembro';
    12 : Result := 'Dezembro';
  end;
end;


function RemoveCaracteresInvalidos2(Texto: String): String;
const
  CaracteresValidos : Array[0..69] of String =
   ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
    'u', 'v', 'w', 'x', 'y', 'z',
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z',
    '(', ')', '&', ',', '.', ' ', '/', '-');

  CaracteresInvalidos : Array[0..49] of String =
   ('á', 'é', 'í', 'ó', 'ú', 'à', 'è', 'ì', 'ò', 'ù', 'ã', 'õ',
    'â', 'ê', 'î', 'ô', 'û', 'ä', 'ë', 'ï', 'ö', 'ü', 'ç',
    'Á', 'É', 'Í', 'Ó', 'Ú', 'À', 'È', 'Ì', 'Ò', 'Ù', 'Ã', 'Õ',
    'Â', 'Ê', 'Î', 'Ô', 'Û', 'Ä', 'Ë', 'Ï', 'Ö', 'Ü', 'Ç',
    '[', ']', '{', '}');

  CaracteresSubstitutos : Array[0..49] of String =
   ('a', 'e', 'i', 'o', 'u', 'a', 'e', 'i', 'o', 'u', 'a', 'o',
    'a', 'e', 'i', 'o', 'u', 'a', 'e', 'i', 'o', 'u', 'c',
    'A', 'E', 'I', 'O', 'U', 'A', 'E', 'I', 'O', 'U', 'A', 'O',
    'A', 'E', 'I', 'O', 'U', 'A', 'E', 'I', 'O', 'U', 'C',
    '(', ')', '(', ')');

var
 i, x, z : integer;
 Retorno, Caracter : String;
 Valido : Boolean;
begin
  Retorno := '';
  for i := 1 to Length(Texto) do
   begin
     Valido := False;
     for x := 0 to Length(CaracteresValidos) - 1 do
      begin
        if Texto[i] = CaracteresValidos[x] then
         begin
           Caracter := Texto[i];
           Valido := True;
           Break;
         end
      end;   
     if not Valido then
      begin
        Caracter := '';
        for z := 0 to Length(CaracteresInvalidos) - 1 do
         if Texto[i] = CaracteresInvalidos[z] then
          begin
            Caracter := CaracteresSubstitutos[z];
            Break;
          end;
      end;
    Retorno := Retorno + Caracter;
   end;
  Result := Retorno;
end;



function MapearRede(UnidadeRede, Letra, Senha: Pchar): String;
var
  err : DWord;
  PServer, PSenha, PLetra : PChar;
Begin
  PServer := UnidadeRede;
  PLetra := Letra;
  PSenha := Senha;
  ERR := WNetAddConnection ( PServer , PSenha , PLetra );
  case ERR of
    ERROR_ACCESS_DENIED : result    := 'Acesso negado às Atualizações de Sistema.';
    ERROR_ALREADY_ASSIGNED : result := 'OK';  //A letra do drive especificada já está conectada.';
    ERROR_BAD_DEV_TYPE : result     := 'O tipo de dispositivo e o tipo de recurso não são compatíveis.';
    ERROR_BAD_DEVICE : result       := 'Letra de Unidade inválida.';
    ERROR_BAD_NET_NAME : result     := 'Nome do servidor não é válido ou não pode ser localizado.';
    ERROR_BAD_PROFILE : result      := 'Formato incorreto de parâmetros.';
    ERROR_CANNOT_OPEN_PROFILE : result := 'Conexão permanente não disponível.';
    ERROR_DEVICE_ALREADY_REMEMBERED : result := 'OK';  //'Uma entrada para o dispositivo especificado já está no perfil do usuário.';
    ERROR_EXTENDED_ERROR : result   := 'Falha na conexão à unidade de atuliazação!';
    ERROR_INVALID_PASSWORD : result := 'Senha especificada inválida.';
    ERROR_BAD_NETPATH : result      := 'Falha na conexão à unidade de atualiazação!';
    ERROR_REM_NOT_LIST : result     := 'Falha na conexão à unidade de atualiazação!';
    ERROR_DUP_NAME : result         := 'Falha na conexão à unidade de atualiazação!';
    ERROR_NO_NETWORK : result       := 'Falha na conexão à unidade de atualiazação!';
    ERROR_NO_NET_OR_BAD_PATH : result := 'Falha na conexão à unidade de atualiazação!';
    ERROR_HOST_UNREACHABLE : result := 'Falha na conexão à unidade de atualiazação!';
    ERROR_PROTOCOL_UNREACHABLE : result := 'Falha na conexão à unidade de atualiazação!';
    //1231 : result := 'Falha na conexão à unidade de atuliazação!';
    0 : result := 'OK'; //A Conexão '+ UnidadeRede + ' na unidade '+ Letra +' foi efetuada corretamente!';
    else
    //result := 'Falha de conexão com a unidade de atuliazação!'; //A Conexão '+ UnidadeRede + ' na unidade '+ Letra +' foi efetuada corretamente!';
    result := 'OK'; //A Conexão '+ UnidadeRede + ' na unidade '+ Letra +' foi efetuada corretamente!';
  end;
  if (ERR <> 53) and not VerificaPastaVersao then
    result := 'SEM ACESSO';
end;


function VerificaPastaVersao : Boolean;
var
  caminho,Ffile:string;
  F:TextFile;
begin
  Caminho := 'M:\';
  Result := False;
  Ffile:=Caminho+'RWfile' + FormatDateTime('DDMMYYYYhhmmss',Now) +'.$$$';
  try
      AssignFile(F, Ffile);
      Rewrite(F);
      Writeln(F, 'Arquivo para teste de RW.');
      CloseFile(F);
      Result := True;
      Deletefile(pchar(Ffile));
  except
  end;
end;



function EnviaSMS(Telefone, Mensagem : String) : Boolean;
var
 IdHttp1 : TIdHttp;
 sRet: String;
 sHttp: String;
 sParametros: String;
 sUrl: String;
 Retorno : TStringList;
begin
  IdHttp1 := TIdHTTP.Create(nil);
 // IdHTTP1.Host := 'http://mpgateway.com';
 // sHttp := 'http://mpgateway.com/v_2_00/smspush/enviasms.aspx?';
 // IdHTTP1.Port := 80;
  Mensagem := StrTran(Mensagem, ' ', '%20');
  Telefone := Trim(Telefone);
  sParametros := 'Credencial=CCF9DC8A695E58ED8698E24229F3B939303EF380&Principal_User=FARMAX&Aux_User=F1&Mobile=55' + Telefone + '&Send_Project=S&Message=' + Mensagem ;
  sUrl := sHttp + sParametros;

  Retorno := TStringList.Create;
  Retorno.Text := IdHTTP1.Get (sUrl);
  TrataRetornoSMS(Trim(Retorno.Text));
  Retorno.Free;
end;


procedure TrataRetornoSMS(Retorno : String);
var
 iRetorno : Integer;
 Mensagem : String;
begin
  Mensagem := '';
  if (Retorno = 'X01') or (Retorno = 'X02') then
     Mensagem := 'Parâmetros com Erro'
  else
   begin
     iRetorno := StrtoInt(Retorno);
     case iRetorno of
        0  : ExibeInformation('Mensagem enviada com Sucesso.');
        1  : Mensagem := 'Credencial inválida.';
        5  : Mensagem := 'Número de Telefone fora do formato:Formato +999(9999)99999999.';
        7  : Mensagem := '"SEND_PROJECT" tem que ser S ou N.';
        8  : Mensagem := 'Mensagem maior que 142 caracteres.';
        9  : Mensagem := 'Sem crédito para envio de SMS. Favor repor.';
        10 : Mensagem := 'Gateway bloqueado.';
        12 : Mensagem := 'Número de Telefone no formato padrão, mas incorreto.';
        13 : Mensagem := 'Mensagem vazia ou corpo inválido.';
        15 : Mensagem := 'País sem operação.';
        16 : Mensagem := 'Número de Telefone com tamanho do código de área inválido.';
        17 : Mensagem := 'Operadora não autorizada para esta credencial.';
        800..899 : Mensagem := 'Falha no gateway "Mobile Pronto". Contate o suporte "Farmax".';
        900 : Mensagem := 'Erro de autenticação ou limite de segurança excedido.';
        901..999 : Mensagem := 'Erro no acesso as operadoras.';
     end;
   end;
  if Mensagem <> '' then
     ExibeError(Mensagem);
end;


// ==================================================================
// IP Address,Gateway and Subnet Mask
// EnableStatic takes array of string as a parameter
// for the Addresses.
// ==================================================================

function SetIpConfig(AGateWay : string) : integer;
var Retvar : integer;
    oBindObj : IDispatch;
    oNetAdapters,oNetAdapter,oNetAdaptersStatus, oNetAdapterStatus,
    oIpAddress,oGateWay,
    oWMIService,oSubnetMask : OleVariant;
    i,iValue : longword;
    oEnum, oEnumStatus : IEnumvariant;
    oCtx : IBindCtx;
    oMk : IMoniker;
    sFileObj : widestring;
    cNome : String;
    sDNSHostName, sMACAddress, sServiceName, sNetConnectionID : String;
    bDHCPEnabled, bIPEnabled, bNetEnabled : Boolean;

    x : integer;
    EnderecosIP, SubMascara : Array of String;

    AIpAddress, ASubnetMask : string;
begin
  Retvar := 0;
  sFileObj := 'winmgmts:\\.\root\cimv2';

  // Create OLE [IN} Parameters
  oIpAddress := VarArrayCreate([1,1],varOleStr);
  oIpAddress[1] := AIpAddress;
  oGateWay := VarArrayCreate([1,1],varOleStr);
  oGateWay[1] := AGateWay;
  oSubnetMask := VarArrayCreate([1,1],varOleStr);
  if ASubnetMask = '' then
    oSubnetMask[1] := '255.255.255.0'
  else
    oSubnetMask[1] := ASubnetMask;

  // Connect to WMI - Emulate API GetObject()
  OleCheck(CreateBindCtx(0,oCtx));
  OleCheck(MkParseDisplayNameEx(oCtx,PWideChar(sFileObj),i,oMk));
  OleCheck(oMk.BindToObject(oCtx,nil,IUnknown,oBindObj));
  oWMIService := oBindObj;


  // Configuracoes do NIC
  // Verificando todos os NICs
  oNetAdaptersStatus := oWMIService.ExecQuery('Select * from Win32_NetworkAdapter');
  oEnumStatus := IUnknown(oNetAdaptersStatus._NewEnum) as IEnumVariant;
  while oEnumStatus.Next(1,oNetAdapterStatus,iValue) = 0 do
   begin
     Try
       // Se NIC desativado ativa
       if oNetAdapterStatus.NetConnectionStatus = 0 then
          Retvar := oNetAdapterStatus.Enable;
     except
       Retvar := -1;
     end;
     oNetAdapterStatus := Unassigned;
   end;

  // Verificando NICs ativos
  oNetAdaptersStatus := oWMIService.ExecQuery('Select * from Win32_NetworkAdapter where NetEnabled=True');
  oEnumStatus := IUnknown(oNetAdaptersStatus._NewEnum) as IEnumVariant;
  while oEnumStatus.Next(1,oNetAdapterStatus,iValue) = 0 do begin
    try
      // Coletando o ID de conexão do NIC
      sNetConnectionID := oNetAdapterStatus.NetConnectionID;
    except
      Retvar := -1;
    end;
    oNetAdapterStatus := Unassigned;
  end;

  Delay(3);

  oNetAdapter := Unassigned;
  oNetAdapters := Unassigned;
  oNetAdapters := oWMIService.ExecQuery('Select * from Win32_NetworkAdapterConfiguration where IPEnabled=True');
  oEnum := IUnknown(oNetAdapters._NewEnum) as IEnumVariant;
  while oEnum.Next(1,oNetAdapter,iValue) = 0 do
   begin
     try
       EnderecosIP := oNetAdapter.IPAddress;
       AIpAddress := EnderecosIP[0];

       oIpAddress := VarArrayCreate([1,1],varOleStr);
       oIpAddress[1] := AIpAddress;

       SubMascara := oNetAdapter.IPSubnet;
       ASubnetMask := SubMascara[0];
       oSubnetMask := VarArrayCreate([1,1],varOleStr);
       if ASubnetMask = '' then
         oSubnetMask[1] := '255.255.255.0'
       else
         oSubnetMask[1] := ASubNetMask;

       Retvar := oNetAdapter.EnableStatic(oIpAddress,oSubnetMask);
       if (Retvar = 0) and (AGateWay <> '') then
         Retvar := oNetAdapter.SetGateways(oGateway);
     except
       Retvar := -1;
     end;
   end;
  oNetAdapter := Unassigned;

  oNetAdapters := oWMIService.ExecQuery('Select * from Win32_NetworkAdapterConfiguration where IPEnabled=True');
  oEnum := IUnknown(oNetAdapters._NewEnum) as IEnumVariant;
  while oEnum.Next(1,oNetAdapter,iValue) = 0 do begin
    try
      sDNSHostName := oNetAdapter.DNSHostName;
      bDHCPEnabled := oNetAdapter.DHCPEnabled;
      bIPEnabled   := oNetAdapter.IPEnabled;
      sMACAddress  := oNetAdapter.MACAddress;
      sServiceName := oNetAdapter.ServiceName;
    except
      Retvar := -1;
    end;
    oNetAdapter := Unassigned;
  end;


  oGateWay := Unassigned;
  oSubnetMask := Unassigned; 
  oIpAddress := Unassigned;
  oNetAdapters := Unassigned;
  oWMIService := Unassigned; 
  Result := Retvar;
end;


Function ValidaInscricao( Inscricao, Tipo : String ) : Boolean;
Var Contador  : ShortInt;
    Casos     : ShortInt;
    Digitos   : ShortInt;
    Tabela_1  : String;
    Tabela_2  : String;
    Tabela_3  : String;
    Base_1    : String;
    Base_2    : String;
    Base_3    : String;
    Valor_1   : ShortInt;
    Soma_1    : Integer;
    Soma_2    : Integer;
    Erro_1    : ShortInt;
    Erro_2    : ShortInt;
    Erro_3    : ShortInt;
    Posicao_1 : string;
    Posicao_2 : String;
    Tabela    : String;
    Rotina    : String;
    Modulo    : ShortInt;
    Peso      : String;
    Digito    : ShortInt;
    Resultado : String;
    Retorno   : Boolean;
Begin
  Try
    Tabela_1 := ' ';
    Tabela_2 := ' ';
    Tabela_3 := ' ';

    {                                                                               }                                                                                                                 {                                                                                                }
    {         Valores possiveis para os digitos (j)                                 }
    {                                                                               }
    { 0 a 9 = Somente o digito indicado.                                            }
    {     N = Numeros 0 1 2 3 4 5 6 7 8 ou 9                                        }
    {     A = Numeros 1 2 3 4 5 6 7 8 ou 9                                          }
    {     B = Numeros 0 3 5 7 ou 8                                                  }
    {     C = Numeros 4 ou 7                                                        }
    {     D = Numeros 3 ou 4                                                        }
    {     E = Numeros 0 ou 8                                                        }
    {     F = Numeros 0 1 ou 5                                                      }
    {     G = Numeros 1 7 8 ou 9                                                    }
    {     H = Numeros 0 1 2 ou 3                                                    }
    {     I = Numeros 0 1 2 3 ou 4                                                  }
    {     J = Numeros 0 ou 9                                                        }
    {     K = Numeros 1 2 3 ou 9                                                    }
    {                                                                               }
    { -------------------------------------------------------- }
    {                                                                               }
    {         Valores possiveis para as rotinas (d) e (g)                           }
    {                                                                               }
    { A a E = Somente a Letra indicada.                                             }
    {     0 = B e D                                                                 }
    {     1 = C e E                                                                 }
    {     2 = A e E                                                                 }
    {                                                                               }
    { -------------------------------------------------------- }
    {                                                                               }
    {                                  C T  F R M  P  R M  P                        }
    {                                  A A  A O O  E  O O  E                        }
    {                                  S M  T T D  S  T D  S                        }
    {                                                                               }
    {                                  a b  c d e  f  g h  i  jjjjjjjjjjjjjj        }
    {                                  0000000001111111111222222222233333333        }
    {                                  1234567890123456789012345678901234567        }

    IF Tipo = 'AC'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     01NNNNNNX.14.00';
    IF Tipo = 'AC'   Then Tabela_2 := '2.13.0.E.11.02.E.11.01. 01NNNNNNNNNXY.13.14';
    IF Tipo = 'AL'   Then Tabela_1 := '1.09.0.0.11.01. .  .  .     24BNNNNNX.14.00';
    IF Tipo = 'AP'   Then Tabela_1 := '1.09.0.1.11.01. .  .  .     03NNNNNNX.14.00';
    IF Tipo = 'AP'   Then Tabela_2 := '2.09.1.1.11.01. .  .  .     03NNNNNNX.14.00';
    IF Tipo = 'AP'   Then Tabela_3 := '3.09.0.E.11.01. .  .  .     03NNNNNNX.14.00';
    IF Tipo = 'AM'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     0CNNNNNNX.14.00';
    IF Tipo = 'BA'   Then Tabela_1 := '1.08.0.E.10.02.E.10.03.      NNNNNNYX.14.13';
    IF Tipo = 'BA'   Then Tabela_2 := '2.08.0.E.11.02.E.11.03.      NNNNNNYX.14.13';
    IF Tipo = 'CE'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     0NNNNNNNX.14.13';
    IF Tipo = 'DF'   Then Tabela_1 := '1.13.0.E.11.02.E.11.01. 07DNNNNNNNNXY.13.14';
    IF Tipo = 'ES'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     0ENNNNNNX.14.00';
    IF Tipo = 'GO'   Then Tabela_1 := '1.09.1.E.11.01. .  .  .     1FNNNNNNX.14.00';
    IF Tipo = 'GO'   Then Tabela_2 := '2.09.0.E.11.01. .  .  .     1FNNNNNNX.14.00';
    IF Tipo = 'MA'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     12NNNNNNX.14.00';
    IF Tipo = 'MT'   Then Tabela_1 := '1.11.0.E.11.01. .  .  .   NNNNNNNNNNX.14.00';
    IF Tipo = 'MS'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     28NNNNNNX.14.00';
    IF Tipo = 'MG'   Then Tabela_1 := '1.13.0.2.10.10.E.11.11. NNNNNNNNNNNXY.13.14';
    IF Tipo = 'PA'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     15NNNNNNX.14.00';
    IF Tipo = 'PB'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     16NNNNNNX.14.00';
    IF Tipo = 'PR'   Then Tabela_1 := '1.10.0.E.11.09.E.11.08.    NNNNNNNNXY.13.14';
    IF Tipo = 'PE'   Then Tabela_1 := '1.14.1.E.11.07. .  .  .18ANNNNNNNNNNX.14.00';
    IF Tipo = 'PI'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     19NNNNNNX.14.00';
    IF Tipo = 'RJ'   Then Tabela_1 := '1.08.0.E.11.08. .  .  .      GNNNNNNX.14.00';
    IF Tipo = 'RN'   Then Tabela_1 := '1.09.0.0.11.01. .  .  .     20HNNNNNX.14.00';
    IF Tipo = 'RS'   Then Tabela_1 := '1.10.0.E.11.01. .  .  .    INNNNNNNNX.14.00';
    IF Tipo = 'RO'   Then Tabela_1 := '1.09.1.E.11.04. .  .  .     ANNNNNNNX.14.00';
    IF Tipo = 'RO'   Then Tabela_2 := '2.14.0.E.11.01. .  .  .NNNNNNNNNNNNNX.14.00';
    IF Tipo = 'RR'   Then Tabela_1 := '1.09.0.D.09.05. .  .  .     24NNNNNNX.14.00';
    IF Tipo = 'SC'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     NNNNNNNNX.14.00';
    IF Tipo = 'SP'   Then Tabela_1 := '1.12.0.D.11.12.D.11.13.  NNNNNNNNXNNY.11.14';
    IF Tipo = 'SP'   Then Tabela_2 := '2.12.0.D.11.12. .  .  .  NNNNNNNNXNNN.11.00';
    IF Tipo = 'SE'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     NNNNNNNNX.14.00';
    IF Tipo = 'TO'   Then Tabela_1 := '1.11.0.E.11.06. .  .  .   29JKNNNNNNX.14.00';
    IF Tipo = 'CNPJ' Then Tabela_1 := '1.14.0.E.11.21.E.11.22.NNNNNNNNNNNNXY.13.14';
    IF Tipo = 'CPF'  Then Tabela_1 := '1.11.0.E.11.31.E.11.32.   NNNNNNNNNXY.13.14';

    { Deixa somente os numeros }
    Base_1 := '';
    For Contador := 1 TO 30 Do
      IF Pos( Copy( Inscricao, Contador, 1 ), '0123456789' ) <> 0
        Then Base_1 := Base_1 + Copy( Inscricao, Contador, 1 );

    { Repete 3x - 1 para cada caso possivel  }

    Casos  := 0;
    Erro_1 := 0;
    Erro_2 := 0;
    Erro_3 := 0;
    While Casos < 3 Do Begin
      Casos := Casos + 1;
      IF Casos = 1 Then Tabela := Tabela_1;
      IF Casos = 2 Then Erro_1 := Erro_3  ;
      IF Casos = 2 Then Tabela := Tabela_2;
      IF Casos = 3 Then Erro_2 := Erro_3  ;
      IF Casos = 3 Then Tabela := Tabela_3;
      //Erro_3 := 0 ;
      IF Copy( Tabela, 1, 1 ) <> ' ' Then
        Begin
        { Verifica o Tamanho }
        IF Length( Trim( Base_1 ) ) <> ( StrToInt( Copy( Tabela,  3,  2 ) ) ) Then
          Erro_3 := 1;

        IF Erro_3 = 0 Then
          Begin
          { Ajusta o Tamanho }
          Base_2 := Copy( '              ' + Base_1, Length( '              ' + Base_1 ) - 13, 14 );
          { Compara com valores possivel para cada uma da 14 posições }
          Contador := 0 ;
          While ( Contador < 14 ) AND ( Erro_3 = 0 ) Do
            Begin
              Contador := Contador + 1;
              Posicao_1 := Copy( Copy( Tabela, 24, 14 ), Contador, 1 );
              Posicao_2 := Copy( Base_2                , Contador, 1 );
              IF ( Posicao_1  = ' '        ) AND (      Posicao_2                 <> ' ' ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'N'        ) AND ( Pos( Posicao_2, '0123456789' )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'A'        ) AND ( Pos( Posicao_2, '123456789'  )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'B'        ) AND ( Pos( Posicao_2, '03578'      )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'C'        ) AND ( Pos( Posicao_2, '47'         )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'D'        ) AND ( Pos( Posicao_2, '34'         )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'E'        ) AND ( Pos( Posicao_2, '08'         )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'F'        ) AND ( Pos( Posicao_2, '015'        )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'G'        ) AND ( Pos( Posicao_2, '1789'       )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'H'        ) AND ( Pos( Posicao_2, '0123'       )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'I'        ) AND ( Pos( Posicao_2, '01234'      )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'J'        ) AND ( Pos( Posicao_2, '09'         )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1  = 'K'        ) AND ( Pos( Posicao_2, '1239'       )  =   0 ) Then Erro_3 := 1;
              IF ( Posicao_1 <>  Posicao_2 ) AND ( Pos( Posicao_1, '0123456789' )  >   0 ) Then Erro_3 := 1;
            End;

          { Calcula os Digitos }
          Rotina  := ' ';
          Digitos := 000;
          Digito  := 000;
          While ( Digitos < 2 ) AND ( Erro_3 = 0 ) Do Begin
            Digitos := Digitos + 1;
            { Carrega peso }
            Peso := Copy( Tabela, 5 + ( Digitos * 8 ), 2 );
            IF Peso <> '  ' Then Begin
              Rotina :=           Copy( Tabela, 0 + ( Digitos * 8 ), 1 )  ;
              Modulo := StrToInt( Copy( Tabela, 2 + ( Digitos * 8 ), 2 ) );
              IF Peso = '01' Then
                Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00'
              else
              IF Peso = '02' Then
                Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00'
              else
              IF Peso = '03' Then
                Peso := '06.05.04.03.02.09.08.07.06.05.04.03.00.02'
              else
              IF Peso = '04' Then
                Peso := '00.00.00.00.00.00.00.00.06.05.04.03.02.00'
              else
              IF Peso = '05' Then
                Peso := '00.00.00.00.00.01.02.03.04.05.06.07.08.00'
              else
              IF Peso = '06' Then
                Peso := '00.00.00.09.08.00.00.07.06.05.04.03.02.00'
              else
              IF Peso = '07' Then
                Peso := '05.04.03.02.01.09.08.07.06.05.04.03.02.00'
              else
              IF Peso = '08' Then
                Peso := '08.07.06.05.04.03.02.07.06.05.04.03.02.00'
              else
              IF Peso = '09' Then
                Peso := '07.06.05.04.03.02.07.06.05.04.03.02.00.00'
              else
              IF Peso = '10' Then
                Peso := '00.01.02.01.01.02.01.02.01.02.01.02.00.00'
              else
              IF Peso = '11' Then
                Peso := '00.03.02.11.10.09.08.07.06.05.04.03.02.00'
              else
              IF Peso = '12' Then
                Peso := '00.00.01.03.04.05.06.07.08.10.00.00.00.00'
              else
              IF Peso = '13' Then
                Peso := '00.00.03.02.10.09.08.07.06.05.04.03.02.00'
              else
              IF Peso = '21' Then
                Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00'
              else
              IF Peso = '22' Then
                Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00'
              else
              IF Peso = '31' Then
                Peso := '00.00.00.10.09.08.07.06.05.04.03.02.00.00'
              else
              IF Peso = '32'
                Then Peso := '00.00.00.11.10.09.08.07.06.05.04.03.02.00';

              { Multiplica }
              Base_3 := Copy( ( '0000000000000000' + Trim( Base_2 ) ), Length( ( '0000000000000000' + Trim( Base_2 ) ) ) - 13, 14 );
              Soma_1 := 0;
              Soma_2 := 0;
              For Contador := 1 To 14 Do Begin
                Valor_1 := ( StrToInt( Copy( Base_3, Contador, 01 ) ) * StrToInt( Copy( Peso, Contador * 3 - 2, 2 ) ) );
                Soma_1  := Soma_1 + Valor_1;
                IF Valor_1 > 9 Then Valor_1 := Valor_1 - 9;
                Soma_2  := Soma_2 + Valor_1;
              End;

              { Ajusta valor da soma }
              IF Pos( Rotina, 'A2'  ) > 0 Then
                Soma_1 := Soma_2;
              IF Pos( Rotina, 'B0'  ) > 0 Then
                Soma_1 := Soma_1 * 10;
              IF Pos( Rotina, 'C1'  ) > 0 Then
                Soma_1 := Soma_1 + ( 5 + 4 * StrToInt( Copy( Tabela, 6, 1 ) ) );

              { Calcula o Digito }
              IF Pos( Rotina, 'D0'  ) > 0 Then
                Digito := Soma_1 Mod Modulo;
              IF Pos( Rotina, 'E12' ) > 0 Then
                Digito := Modulo - ( Soma_1 Mod Modulo);
              IF Digito < 10 Then
                Resultado := IntToStr( Digito );
              IF Digito = 10 Then
                Resultado := '0';
              IF Digito = 11 Then
                Resultado := Copy( Tabela, 6, 1 );

              { Verifica o Digito }
              IF ( Copy( Base_2, StrToInt( Copy( Tabela, 36 + ( Digitos * 3 ), 2 ) ), 1 ) <> Resultado ) Then
                Erro_3 := 1;
            End;
          End;
        End;
      End;
    End;

    { Retorna o resultado da Verificação }
    Retorno := FALSE;
    IF ( Trim( Tabela_1 ) <> '' ) AND ( ERRO_1 = 0 ) Then
      Retorno := TRUE
    else
    IF ( Trim( Tabela_2 ) <> '' ) AND ( ERRO_2 = 0 ) Then
      Retorno := TRUE
    else
    IF ( Trim( Tabela_3 ) <> '' ) AND ( ERRO_3 = 0 ) Then
      Retorno := TRUE
    else
    IF Trim( Inscricao ) = 'ISENTO' Then
      Retorno := TRUE;
      
    {IF Trim( Inscricao ) = '' Then //dados vazios CPF, CNPJ ou INSCRICAO
      Retorno := TRUE;}

    Result := Retorno;
    Except
    Result := False;
  End;
End;

{ Mascara_Inscricao __________________________________}
Function Mascara_Inscricao( Inscricao, Estado : String ) : String;
Var Mascara     : String;
    Contador_1  : Integer;
    Contador_2  : Integer;
Begin
  IF Estado = 'AC' Then Mascara := '**.***.***/***-**' ;
  IF Estado = 'AL' Then Mascara := '*********'         ;
  IF Estado = 'AP' Then Mascara := '*********'         ;
  IF Estado = 'AM' Then Mascara := '**.***.***-*'      ;
  IF Estado = 'BA' Then Mascara := '******-**'         ;
  IF Estado = 'CE' Then Mascara := '********-*'        ;
  IF Estado = 'DF' Then Mascara := '***********-**'    ;
  IF Estado = 'ES' Then Mascara := '*********'         ;
  IF Estado = 'GO' Then Mascara := '**.***.***-*'      ;
  IF Estado = 'MA' Then Mascara := '*********'         ;
  IF Estado = 'MT' Then Mascara := '**********-*'      ;
  IF Estado = 'MS' Then Mascara := '*********'         ;
  IF Estado = 'MG' Then Mascara := '***.***.***/****'  ;
  IF Estado = 'PA' Then Mascara := '**-******-*'       ;
  IF Estado = 'PB' Then Mascara := '********-*'        ;
  IF Estado = 'PR' Then Mascara := '********-**'       ;
  IF Estado = 'PE' Then Mascara := '**.*.***.*******-*';
  IF Estado = 'PI' Then Mascara := '*********'         ;
  IF Estado = 'RJ' Then Mascara := '**.***.**-*'       ;
  IF Estado = 'RN' Then Mascara := '**.***.***-*'      ;
  IF Estado = 'RS' Then Mascara := '***/*******'       ;
  IF Estado = 'RO' Then Mascara := '***.*****-*'       ;
  IF Estado = 'RR' Then Mascara := '********-*'        ;
  IF Estado = 'SC' Then Mascara := '***.***.***'       ;
  IF Estado = 'SP' Then Mascara := '***.***.***.***'   ;
  IF Estado = 'SE' Then Mascara := '*********-*'       ;
  IF Estado = 'TO' Then Mascara := '***********'       ;

  Contador_2  := 1;
  Result      := '';
  Mascara     := Mascara + '****';
  For Contador_1 := 1 To Length( Mascara ) Do
  Begin
    IF Copy( Mascara, Contador_1, 1 ) =  '*' Then
      Result := Result + Copy( Inscricao, Contador_2, 1 );
    IF Copy( Mascara, Contador_1, 1 ) <> '*' Then
      Result := Result + Copy( Mascara  , Contador_1, 1 );
    IF Copy( Mascara, Contador_1, 1 ) =  '*' Then
      Contador_2 := Contador_2 + 1;
  End;
  Result := Trim( Result );
End;



Function ValidaUF( Estado : String ) : Boolean;
Begin
  Result := False;
  IF Estado = 'AC' Then Result := True else
  IF Estado = 'AL' Then Result := True else
  IF Estado = 'AP' Then Result := True else
  IF Estado = 'AM' Then Result := True else
  IF Estado = 'BA' Then Result := True else
  IF Estado = 'CE' Then Result := True else
  IF Estado = 'DF' Then Result := True else
  IF Estado = 'ES' Then Result := True else
  IF Estado = 'GO' Then Result := True else
  IF Estado = 'MA' Then Result := True else
  IF Estado = 'MT' Then Result := True else
  IF Estado = 'MS' Then Result := True else
  IF Estado = 'MG' Then Result := True else
  IF Estado = 'PA' Then Result := True else
  IF Estado = 'PB' Then Result := True else
  IF Estado = 'PR' Then Result := True else
  IF Estado = 'PE' Then Result := True else
  IF Estado = 'PI' Then Result := True else
  IF Estado = 'RJ' Then Result := True else
  IF Estado = 'RN' Then Result := True else
  IF Estado = 'RS' Then Result := True else
  IF Estado = 'RO' Then Result := True else
  IF Estado = 'RR' Then Result := True else
  IF Estado = 'SC' Then Result := True else
  IF Estado = 'SP' Then Result := True else
  IF Estado = 'SE' Then Result := True else
  IF Estado = 'TO' Then Result := True;
End;


function NomeUsuarioComputador: string;
const
  Max = 254;
var
  Nome: string;
  Tam: DWORD;
begin
  Tam := Max - 1;
  SetLength(Nome,Max);
  GetUserName(PChar(Nome),Tam);
  SetLength(Nome,Tam);
  result := Nome;
end;


function RetornaIPexterno : String;
var
  BuscaIP     : TIdHTTP;
  Temporario  : String;
  Endereco    : String;
  X           : Integer;
begin
 try
    BuscaIP := TIdHTTP.Create(nil);
   // BuscaIP.Host       := 'checkip.dyndns.org';
    Temporario := BuscaIP.Get('checkip.dyndns.org');
    For X := 1 to Length(Temporario) do
        if (Temporario[X] in ['0'..'9']) or (Temporario[X] = '.') then
           Endereco := Endereco + Temporario[X];

    Result := Trim(Endereco);
    BuscaIP.Free;
  except
    BuscaIP.Free;
    Result := 'ERRO';
  end;
end;

function RetornaIPinterno : String;
var
  BuscaIP : TIdIPWatch;
begin
 try
    BuscaIP := TIdIPWatch.Create(nil);
    BuscaIP.HistoryEnabled := FALSE;
    BuscaIP.Active := TRUE;
    if not BuscaIP.ForceCheck then
      ShowMessage('Rede Desconectada! Este Terminal está sem acesso à Rede de Dados.');
    Result := BuscaIP.CurrentIP;
    BuscaIP.Active := False;
    BuscaIP.Free;
  except
    BuscaIP.Free;
    Result := 'ERRO';
  end;
end;


function RetornaDataArquivo(Arquivo: String): TDateTime;
var FHandle: integer;
begin
  try
    FHandle := FileOpen(Arquivo, 0);      // -1
    if FHandle > 0 then
      Result := FileDateToDateTime(FileGetDate(FHandle))
    else
      Result := Date; 
  finally
    FileClose(FHandle);
  end;
end;

function PingaIP(IP : String): Boolean;
var
 IdCMP : TIdIcmpClient;
 Resultado : String;
begin
  Result := False;
  IdCMP := TIdIcmpClient.Create(nil);
  IdCMP.Host := IP;
  IdCMP.Ping();
  if IdCmp.ReplyStatus.BytesReceived > 0 then
     Result := True;
  if Trim(IdCmp.ReplyData) = '' then
     Result := False;
  IdCMP.Free;
end;


procedure MSGAguarde(strTexto: String = ''; boolAguarde: Boolean = true);
var
  formAguarde, formMSG  : TForm;
  bevelAguarde : TBevel;
  lblTexto     : TLabel;
  mmMemo       : TMemo;
begin
  if boolAguarde then begin
    formAguarde := TForm.Create(nil);
    formMSG     := formAguarde;
    with formMSG do begin
      Width       := 220;
      Height      := 50;
      BorderStyle := bsNone;
      Color       := clGradientInactiveCaption;
      Position    := poDesktopCenter;
      bevelAguarde := TBevel.Create(nil);
      with bevelAguarde do begin
        Parent := formAguarde;
        Align  := alClient;
        Shape  := bsFrame;
      end;
      if strTexto = '' then begin
        lblTexto := TLabel.Create(nil);
        with lblTexto do begin
          Caption    := 'Aguarde';
          Font.Size  := 16;
          Top        := 8;
          Left       := 70;
          Font.Style := [fsBold];
          Font.Name  := 'Segoe UI';
          Font.Color := clMaroon;
          Parent     := formAguarde;
        end;
      end else begin
        mmMemo := TMemo.Create(nil);
        with mmMemo do begin
          Text        := strTexto;
          Align       := alClient;
          Alignment   := taCenter;
          BorderStyle := bsNone;
          Color       := clGradientInactiveCaption;
          Font.Size   := 8;
          Font.Name   := 'Verdana';
          Parent      := formAguarde;
        end;
      end;
      Show;
      Repaint;
    end;
  end else begin
    try
      formMSG.Close;
      FreeAndNil(formMSG);
    except
    end;
  end;
end;


procedure MSGAguarde2;
var F:Tform;
MSG: Tlabel;
Borda: TShape;
begin
  F:=  TForm.Create(Application);
  F.BorderStyle:= bsNone;
  F.Position:= poDesktopCenter;
  F.Width:= 100;
  F.Height:= 16; //até aqui criamos o form

  Borda:= TShape.Create(Application);
  Borda.Parent:= F;
  Borda.Align:= alClient; // uma borda envolta do form

  MSG:=  TLabel.Create(Application);
  MSG.Parent:=F;
  MSG.Transparent:= true;
  MSG.AutoSize:= false;
  MSG.Width:= 98;
  Msg.Caption:='Aguarde';
  MSG.Alignment:= taCenter;//label com a mensagem "Aguarde"

  F.Show;
  F.Update;

  //Aqui você coloca os procedimentos desejados

  F.Free; //E finalmente libera a janela
end;

procedure Aguarde(Formulario: TForm; Mensagem: string = '');
  var
  pngAguarde: TPanel;
begin
    FimAguarde(Formulario);
    Mensagem := Mensagem + ' ...';
    Screen.Cursor := crSQLWait;
    pngAguarde := TPanel.Create(Formulario);
    with pngAguarde do
    begin
      Width := Length(Mensagem) * 9;
      Left := (Formulario.Width - Width) div 2;
      Top := (Formulario.Height - Height) div 2;
      Name := 'pngAguarde';
      Parent := formulario;
      Caption := Mensagem;
      Height := 59;
      BorderStyle := bsSingle;
      Color := $00DEDCBE;
      Color := clSkyBlue;
      Font.Charset := DEFAULT_CHARSET;
      Font.Color := clWindowText;
      Font.Height := -11;
      Font.Name := 'Tahoma';
      Font.Size := 10;
      Font.Style := [fsBold];
      ParentFont := False;
      ParentColor := False;
      ParentBackground := False;
      Application.ProcessMessages;
    end;
end;

procedure FimAguarde(Formulario: TForm);
var
  I: Integer;
begin
  if Formulario = nil then
  Exit;
  try
    Application.ProcessMessages;
    for i := 0 to formulario.ComponentCount - 1 do
    if (formulario.Components[i] is TPanel) then
    if (formulario.Components[i] as TPanel).Name = 'pngAguarde' then
      (formulario.Components[i] as TPanel).Free;
  finally
    Screen.Cursor := crDefault;
  end;
end;


function ValidaEAN(Numero:string): Boolean;
var teste, soma2:string;
  digito:INteger;
  soma,s,i,calculo:integer;
begin
result:= false;
// verifica tamanho do numero
while (length(numero) < 13) do
  numero:= '0'+numero;
digito:= StrToInt(copy(numero,length(numero),1));
delete(numero,length(numero),1);
if (numero<>'000000000000') then
begin
  s:=length(numero);
  i:=0;
  calculo := 3;
  soma :=0;
  repeat
    teste := copy(numero,length(numero)-i,1);
	soma:= soma + StrToInt(copy(numero,length(numero)-i,1))* calculo;
	inc(i);
	if calculo =3 then
	  calculo := 1
	else
	  calculo := 3;
	dec(s);
  until s=0;
  numero:=IntToStr(soma);
  soma2:= copy(numero,length(numero),1);
  if soma2 = '0'then
    Result:= (digito=strtoInt(soma2))
  else
    result:= (digito=(10-StrToInt(soma2)));
  end;
end;


procedure ParaFirewall;
begin
   ShellExecute(0, 'open', 'net', 'stop "Firewall do Windows"', nil, SW_SHOWMAXIMIZED);
end;

procedure IniciaFirewall;
begin
   ShellExecute(0, 'open', 'net', 'start "Firewall do Windows"', nil, SW_SHOWMAXIMIZED);
end;

procedure AdicionaPortaFirewall(Nome, Porta:String);
begin
//  WinExec(PChar('netsh advfirewall firewall add rule name="' + Nome + '" protocol=TCP dir=in localport=' + Porta + ' action=allow profile=any'), SW_HIDE);
end;

procedure RemovePortaFirewall(Nome:String);
begin
  //WinExec(PChar('netsh advfirewall firewall delete rule name="' + Nome + '"'), SW_HIDE);
end;

function StatusPortaFirewall(Nome:String) : String;
var
 Arquivo : TextFile;
 Linha : String;
 Fechada : Boolean;
 Desabilitada : Boolean;
begin
//  Fechada := False;
//  Desabilitada := False;
//  WinExec(PChar('cmd.exe /c netsh advfirewall firewall show rule name=' + Nome + ' > c:\netshtemp.txt'), SW_HIDE);
//
//  while not FileExists('C:\netshtemp.txt') do Sleep(1000);
//  AssignFile(Arquivo, 'C:\netshtemp.txt');
//  Reset(Arquivo);
//  while not EOF(Arquivo) do
//   begin
//     ReadLn(Arquivo, Linha);
//     if Pos(UpperCase('Nenhuma'), UpperCase(Linha)) > 0 then
//      begin
//        Fechada := True;
//        Break;
//      end
//     else
//     if Pos(UpperCase('Habilitado'), UpperCase(Linha)) > 0 then
//      begin
//        if Pos(UpperCase('Sim'), UpperCase(Linha)) = 0 then
//         begin
//           Desabilitada := True;
//           Break;
//         end;
//      end;
//   end;
//  if Fechada then
//     Result := 'F'
//  else
//  if Desabilitada then
//     Result := 'D'
//  else
//     Result := 'OK';
//  CloseFile(Arquivo);
//  DeleteFile('C:\netshtemp.txt');
end;

procedure HabilitaPortaFirewall(Nome:String);
begin
  //WinExec(PChar('cmd.exe /c netsh advfirewall firewall set rule ' + Nome + ' new enable=yes'), SW_HIDE);
end;

procedure DesabilitaPortaFirewall(Nome:String);
begin
 // WinExec(PChar('cmd.exe /c netsh advfirewall firewall set rule ' + Nome + ' new enable=no'), SW_HIDE);
end;

function CalculaDigEAN13(Cod:String):String;
  function Par(Cod:Integer):Boolean;
   begin
     Result:= Cod Mod 2 = 0;
   end;
var i,SomaPar,SomaImpar:Integer;
begin
  Try
      SomaPar := 0;
      SomaImpar := 0;
      for i := 1 to 12 do
       begin
         if Par(i) then
            SomaPar := SomaPar + StrToInt(Cod[i])
         else
            SomaImpar := SomaImpar + StrToInt(Cod[i]);
       end;
      SomaPar := SomaPar * 3;
      i := 0;
      while i < (SomaPar + SomaImpar) do Inc(i,10);
      Result := IntToStr(i-(SomaPar + SomaImpar));
  Except
    Result := '';
  End;
end;


function SearchForFile(const ARootPath: string;
                       const AFileName: string;
                       var APathFound: string): Boolean;
var
  Found: array[0..500] of Char;
begin
  //FillChar(Found, SizeOf(Found), #00);
 // Result := (SearchTreeForFile(PChar(ARootPath), PChar(AFileName), Found) = True);
  APathFound := ExtractFilePath(Found);
end;

function VersaoArquivo(const Filename: String): String;
   type
     TVersionInfo = packed record
     Dummy: array[0..7] of Byte;
     V2, V1, V4, V3: Word;
   end;
var
 Zero, Size: Cardinal;
 Data: Pointer;
 VersionInfo: ^TVersionInfo;
begin
 Size := GetFileVersionInfoSize
 (Pointer(Filename), Zero);
 if Size = 0 then
    Result := '0'
 else
  begin
   GetMem(Data, Size);
   try
    GetFileVersionInfo(Pointer(Filename), 0, Size, Data);
    VerQueryValue(Data, '\', Pointer(VersionInfo), Size);
    Result := Format('%d.%d.%d.%d', [VersionInfo.V1, VersionInfo.V2, VersionInfo.V3, VersionInfo.V4]);
   finally
    FreeMem(Data);
   end;
  end;
end;


function FileExistsSomewhere(FileName : String; var Path : String) : Boolean;
var
 SearchRec: TSearchRec;
 I : Integer;
 NextPath : String;
begin
 // assume failure
 Result := False;

 // Acrescente '\' ao final do Path
 Path := Trim(Path);
 if Path[Length(Path)] <> '\' then
     Path := Path + '\';

 // Tente encontrar o arquivo no diretório corrente
 if FindFirst(Path + Filename, faAnyFile, SearchRec) = 0 then
     // Se encontrou, cai fora
     Result := True
 else
    begin
     // Verifique todos subdiretórios
     FindClose(SearchRec);
     I := FindFirst(Path + '*.*', faDirectory, SearchRec);

     // Se Result = True pare, o arquivo foi encontrado.
     // Caso contrário procure pelo arquivo em todos os subdiretórios
     while (I = 0) and (not Result) do
       begin
        // Em cada subdiretório procure pelo arquivo desprezando '.' e '..'
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          begin
            NextPath := Path + SearchRec.Name + '\';
            Result := FileExistsSomewhere(Filename, NextPath);

            // Se encontrou o arquivo atribui à variavel de retorno
            if Result then
              Path := NextPath;
          end;
         I := FindNext(SearchRec);

        // Para processar as mensagens e não blopquear o programa
        Application.ProcessMessages;
     end;
     FindClose(SearchRec);
   end;

 // Se não encontrou o arquivo limpa variável de retorno
 if not Result then 
   Path := '';
end;


function ExibeMensagemTEFNFCe(Msg :String; AType: TMsgDlgType; AButtons : TMsgDlgButtons;
  IndiceHelp : LongInt; DefButton : TModalResult = MrNone) : Word;
Var
  i: Integer;
  Mensagem: TForm;
Begin
  Mensagem := CreateMessageDialog(Msg, AType, Abuttons);
  Mensagem.HelpConText := IndiceHelp;
  With Mensagem Do
   begin

    For i := 0 to ComponentCount -1 do
     begin
      if (Components[i] is TButton) then
        if (TButton(Components[i]).ModalResult = DefButton) then
           ActiveControl := TWincontrol(Components[i]);
     end;

    if Atype = mtConfirmation then
       Caption := 'Confirmação'
    else
    if AType = mtWarning then
       Caption := 'Atenção'
    else
    if AType = mtError then
       Caption := 'Erro'
    else
    if AType = mtInFormation then
       Caption := 'InFormação';

    TButton(Mensagem.FindComponent('YES')).Caption    := '&Sim';
    TButton(Mensagem.FindComponent('NO')).Caption     := '&Não';
    TButton(Mensagem.FindComponent('CANCEL')).Caption := '&Cancelar';
    TButton(Mensagem.FindComponent('ABORT')).Caption  := '&Abortar';
    TButton(Mensagem.FindComponent('RETRY')).Caption  := '&Reimprimir';
    TButton(Mensagem.FindComponent('IGNORE')).Caption := '&Ignorar';
    TButton(Mensagem.FindComponent('ALL')).Caption    := '&Todos';
    TButton(Mensagem.FindComponent('HELP')).Caption   := 'A&juda';
    
  end;
  Result := Mensagem.ShowModal;
  Mensagem.Free;
End;



function ApagaArquivosExtensao(Diretorio, Extensao : String) : Boolean;
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Result := True;
  Ret := FindFirst(Diretorio + '\*' + Extensao, faAnyFile, F);
  Try
    While Ret = 0 do
     begin
        DeleteFile(Diretorio + '\' + F.Name);
        Ret := FindNext(F);
     end;
  finally
    FindClose(F);
  end;
end;


function RetornaId(Campo: String): Double;
begin


  DM.CDSControle.Close;
  DM.CDSControle.ParamByName('CAMPO').Value := Campo;
  DM.CDSControle.Open;

  if DM.CDSControle.Locate('CAMPO', Campo, []) then
  begin
    DM.CDSControle.Close;
    DM.CDSControle.ParamByName('CAMPO').Value := Campo;
    DM.CDSControle.Open;
    DM.CDSControle.Edit;

    DM.CDSControleVALOR.Value := DM.CDSControleVALOR.Value + 1;

    DM.CDSControle.Post;
    DM.CDSControle.ApplyUpdates(0);

   if DM.CDSControle.ApplyUpdates(0) = 0 then
    begin
      Result := DM.CDSControleVALOR.Value ;
    end
    else
    begin
      RetornaId(Campo);
    end;

//    DM.FDConn.Connected := False;
//    DM.FDConn.Connected := True;
  end
  else
  begin
    DM.CDSControle.Close;
    DM.CDSControle.ParamByName('CAMPO').Value := Campo;
    DM.CDSControle.Open;
    DM.CDSControle.Append;

    DM.CDSControleCAMPO.Value := Campo;
    DM.CDSControleVALOR.Value := 0;
    DM.CDSControle.Post;
    DM.CDSControle.ApplyUpdates(0);


//   if DM.CDSControle.ApplyUpdates(0) = 0 then
//      DM.FDAtualizaControle.ExecProc;
  end;
end;


function  AtualizaEstoque (Id_produto: Double):Double;
 begin

   result :=0;

   dm.CDSAtualizaEstoque.Close;
   dm.CDSAtualizaEstoque.ParamByName('ID_PRODUTO').Value:=Id_produto;
   dm.CDSAtualizaEstoque.Open;

   dm.CDSCadProduto.Close;
   dm.CDSCadProduto.ParamByName('ID_PRODUTO').Value:=Id_produto;
   dm.CDSCadProduto.open;
   dm.CDSCadProduto.edit;
   dm.CDSCadProdutoESTOQUE.Value:= dm.CDSAtualizaEstoqueSUM.Value;
   dm.CDSCadProduto.ApplyUpdates(0);
   result := dm.CDSAtualizaEstoqueSUM.Value;


 end;


function  GravarDataInvertidaYYYYMMDD(Data:String):String;
var
 Data2 :String;

begin
 result:='';


 Data2:= Copy(Data,7, 4) +'-'+             //10/11/2021
         Copy(Data,4, 2) +'-'+
         Copy(Data,1, 2);


 result :=Data2;


end ;

function  ExibeDataInvertidaYYYYMMDDparaDDMMYYYY(Data:String):TDate;

var
 Data2 :String;


begin

 Data2:= Copy(Data,9,2) +'/'+           //2021-11-10
         Copy(Data,6,2) +'/'+
         Copy(Data,1,4);


 result :=StrToDate(Data2);


end;


function  TamanhoDeString (Texto :String):Integer;
 var
 tamanho :Integer;
begin

  tamanho:= Length(Texto);

  result:= tamanho;


end;



function  RemovePontoValorString (Valor :String):String;
var
S:String;
 begin
  S := Valor;
  while Pos ('.',S)>0 do
  delete (S,Pos('.',S),1);
  result :=(trim(S));
 end;

function  ExibeDataOrdemBr(Data:string):String;
var
  DataFormatada:String;
begin

 DataFormatada:=copy(Data,9,2)+'/'+copy(Data,6,2)+'/'+copy(Data,1,4);
 result:= DataFormatada;


end;

Function  RemoveTags (HTML :String):String;
var
   TagInicio, TagFim, TagLength: integer;
begin
  TagInicio := Pos( '<', HTML); // posição de busca de primeira <

  while (TagInicio > 0) do begin  // enquanto há uma < em S
    TagFim := Pos('>', HTML);       // encontra a correspondente >
    TagLength := TagFim - TagInicio + 1;
    Delete(HTML, TagInicio, TagLength); // exclui a tag
    TagInicio:= Pos( '<', HTML);       // pesquisa a proxima <
  end;
  Result := HTML; // da o resultado



end;


end.

