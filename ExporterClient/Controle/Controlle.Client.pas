unit Controlle.Client;

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

    Procedure RegistraHoraInicio;
    procedure Delay(Tempo: Word);
    procedure GravaLog(cMensagem: string);
    Function  StrTran( cString, cProcura, cTroca : string ): string;
    procedure Processar;

    procedure ProcessarConsistencia;
    procedure EnviandoCaixasDeletados;
    procedure EnviandoComprasDeletadas;
    procedure EnviandoContasPagarDeletadas;
    procedure EnviandoClientesDeletados;
    procedure EnviandoSintegraNFEntrada;
    procedure EnviandoProdutosTotais;

    function  EnviandoContasReceberDeletados : Boolean;
    function  EnviandoBalancosFilial : Boolean;

    //===== processo de recebimento =====//

    procedure RecebendoCompras;
    procedure RecebendoItensCompras;
    procedure RecebendoLotesItensCompras;
    procedure RecebendoComprasBoletos;
    procedure RecebendoGrupos;
    procedure RecebendoSubGrupos;
    procedure RecebendoLaboratorios;
    procedure RecebendoVendedores;
    procedure RecebendoVendedoresClasses;
    procedure RecebendoConveniosClasses;
    procedure RecebendoConveniosGrupos;
    procedure RecebendoContasPagarCompras;
    procedure RecebendoContasPagarComprasDeletadas;
    procedure RecebendoMetasFiliais;
    procedure RecebendoMetasVendedores;
    procedure RecebendoClasses;
    procedure RecebendoClassesDeletadas;
    procedure RecebendoContasPagarDeletadas;
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
    procedure RecebendoConveniosPBMDeletados;
    procedure RecebendoProdutosConvenioPBMDeletados;
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
    procedure RecebendoLancamentosaPrazo;
    procedure RecebendoEncartesDeletados;
    procedure RecebendoItensEncartesDeletados;
    procedure RecebendoEncartes;
    procedure RecebendoItensEncartes;
    procedure RecebendoRedes;
    procedure RecebendoConcorrentes;
    procedure RecebendoPrecosConcorrentes;
    procedure RecebendoPrecosConcorrentesDeletados;
    procedure RecebendoProjetosPharmalink;
    procedure RecebendoPerfilCliente;
    procedure RecebendoProdutosFPDeletados;
    procedure RecebendoPrincipioAtivo;
    procedure RecebendoReexportacao;
    procedure RecebendoFiliaisGrupos;
    procedure RecebendoFiliaisGruposDeletados;
    procedure RecebendoConveniosPBM;
    procedure RecebendoProdutosConvenioPBM;
    procedure RecebendoUsuariosGrupos;
    procedure RecebendoProdutosBarrasDeletados;
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
    procedure ConsistenciaUsuarios;
    procedure ConsistenciaProdutosPrecoQuantidade;
    procedure ConsistenciaProdutosFidelidade;
    procedure ConsistenciaConvenios;
    procedure ConsistenciaClientes;
    procedure ConsistenciaContasReceber;
    procedure ConsistenciaEstoque;

    function  RecebendoContasReceber : Boolean;
    function  RecebendoContasPagar : Boolean;
    function  RecebendoClientes : Boolean;
    function  RecebendoLimiteSaldoClientes : Boolean;
    function  RecebendoProdDistr : Boolean;
    function  RecebendoProdutosFisco : Boolean;
    function  RecebendoProdutosCompostos : Boolean;
    function  RecebendoContasReceberDeletados : Boolean;
    function  RecebendoProdutosBarras : Boolean;


    procedure FecharTodosDataSets;
    procedure VerificaConexao(TipoConexao : String);
    procedure Controlador;

    procedure Testando;
    Procedure FecharDataSet(Cds : TClientDataSet);
    function StrZero(Num : Real ; Zeros,Deci: integer): string;
    function Alltrim(Text : string) : string;
    function Crypt(Action, Src: String): String;

 var
  Caminho, Servidor, Intervalo, Intervalo2, AtualizaPrecoVenda: String;
  Importer : TextFile;
  Log : TextFile;
  Filial : Integer;
  FD : String;
  Id_Produto, Cd_Produto, CodigoBarras, Descricao, Cd_Laboratorio,
  Cd_Grupo, TipoProduto, Identificador, Qt_Embalagem, Comissao,
  CustoUnitario, Preco_Venda, Preco_Promocao, Icms, Margem, Margem_Promocao,
  CodigoBarras2, Cd_Classe, EntraPE, TxDesconto, Unidade, Balanca,
  Cd_Principio, Cd_Lista, UsoContinuo, Dt_Cadastro, Curva , Status, PisCofins, NCM, Cd_SubGrupo: String;
  NLancamentos, NContasReceber, NCaixa : Integer;
  NLancamentosLoja, NContasReceberLoja, NCaixaLoja : Integer;
  Senha ,Consistencia: String;


implementation

uses Funcoes, Udm, UExporterClient, UDm3, UDm2, Controlle.Filial;

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
procedure Delay(Tempo: Word);
var
x1: Double;
begin
    x1:= now;
    repeat until ((now-x1)*86400) > Tempo;
end;

procedure GravaLog(cMensagem: string);
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

procedure FormCreate(Sender: TObject);
begin

  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Logs') then
     CreateDir(ExtractFilePath(Application.ExeName)+'Logs');


  Consistencia := '';

  if (Consistencia = '') or ((Consistencia <> 'S') and (Consistencia <> 'N')) then
   begin
     Consistencia := 'S';
     ReWrite(Importer);
     Writeln(Importer, Caminho);
     Writeln(Importer, Servidor);
     Writeln(Importer, Intervalo);
     Writeln(Importer, Intervalo2);
     Writeln(Importer, AtualizaPrecoVenda);
     Writeln(Importer, Consistencia);
   end;

end;

         //acionar o processo de envio dos dados

procedure Timer2Timer(Sender: TObject);
begin

  //Timer2.Enabled := False;
  if ParamStr(1) = 'Consistencia' then
     ProcessarConsistencia
  else
     Processar;

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



        //========= inicio do 1º processamento ==============//

procedure Processar;
var i : integer;
 Dados : Variant;
begin


  /// colocar aqui teste de conexao com o banco de dados


 if  Controlle.Filial.ValidaConexao then
  begin
   GravaLog(' ');
   GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ======== Iniciando novo processo de exportacao do Client ========');
  end
  else
  begin
    GravaLog(' ');
   GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ======== Falha na conexao com a Matriz ========');
    exit;
  end;



  Filial := 0;
  for i := 1 to 10 do
    begin
      try

        dm3.CdsParametros.Open;

        if dm3.CdsParametrosTIPO_LOJA.AsString = 'U' then
         begin
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja cadastrada como loja única.');
           Exit;
         end;
        Filial := dm3.CdsParametros.Fields[0].AsInteger;
      except
        on E:Exception do
         begin
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

          Delay(5);
         end;
      end;
      if Filial <> 0 then
        break;
    end;


    VerificaConexao('Inicial');

    dm.FDConn.Open;
    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de Reexportacao... ');
    RecebendoReexportacao; //
    dm.FDConn.Open;
    RegistraHoraInicio;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ContasPagar... ');
    RegistraHoraInicio;
    dm.fdconn.Open;
    while RecebendoContasPagar do Sleep(1);   //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Lancamentos a Prazo... ');
    dm.fdconn.Open;
    RecebendoLancamentosaPrazo;  //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de Compras... ');
    dm.fdconn.Open;
    RecebendoCompras; //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ItensCompras... ');
    dm.fdconn.Open;
    RecebendoItensCompras; //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de LotesItensCompras... ');
    dm.fdconn.Open;
    RecebendoLotesItensCompras; //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ComprasBoletos... ');
    dm.fdconn.Open;
    RecebendoComprasBoletos;//
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ContasReceber... ');
    RegistraHoraInicio;
    dm.fdconn.Open;
    while RecebendoContasReceber do Sleep(1);  //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimneto de ContasReceber Deletadas... ');
    dm.fdconn.Open;
    while RecebendoContasReceberDeletados do Sleep(1); //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de Clientes... ');
    RegistraHoraInicio;
    dm.fdconn.Open;
    while RecebendoClientes do Sleep(1); //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Limite de Clientes... ');
    dm.fdconn.Open;
    while RecebendoLimiteSaldoClientes do Sleep(1); //
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Classes... ');
    dm.fdconn.Open;
    RecebendoClasses;
    dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Familias... ');
   dm.fdconn.Open;
    RecebendoFamilias;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Ditribuidores... ');
   dm.fdconn.Open;
    RecebendoDistribuidores;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Grupos de Balanco... ');
   dm.fdconn.Open;
    RecebendoGruposBalanco; // fazer
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Grupos de Compra... ');
   dm.fdconn.Open;
    RecebendoGruposCompra; // fazer
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposCurvas... ');
   dm.fdconn.Open;
    RecebendoGruposCurvas; // fazer
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Grupos... ');
   dm.fdconn.Open;
    RecebendoGrupos;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo SubGrupos... ');
   dm.fdconn.Open;
    RecebendoSubGrupos;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Laboratorios... ');
    RegistraHoraInicio;
   dm.fdconn.Open;
    RecebendoLaboratorios;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Vendedores... ');
   dm.fdconn.Open;
    RecebendoVendedores;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo VendedoresClasses... ');
   dm.fdconn.Open;
    RecebendoVendedoresClasses;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ConveniosClasses... ');
   dm.fdconn.Open;
    RecebendoConveniosClasses;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ConveniosGrupos... ');
   dm.fdconn.Open;
    RecebendoConveniosGrupos;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ContasPagarCompras... ');
   dm.fdconn.Open;
    RecebendoContasPagarCompras;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PlanoContas... ');
   dm.fdconn.Open;
    RecebendoPlanosContas;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Convenios... ');
   dm.fdconn.Open;
    RecebendoConvenios;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Transportadores... ');
    RegistraHoraInicio;
   dm.fdconn.Open;
    RecebendoTransportadoras;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Cartoes... ');
   dm.fdconn.Open;
    RecebendoCartoes;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Filiais... ');
   dm.fdconn.Open;
    RecebendoFiliais;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Balancos... ');
   dm.fdconn.Open;
    RecebendoBalancos;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasFiliais... ');
   dm.fdconn.Open;
    RecebendoMetasFiliais; // fazer
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasVendedores... ');
   dm.fdconn.Open;
    RecebendoMetasVendedores; // fazer
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ProdutosDeletados... ');
   dm.fdconn.Open;
    RecebendoProdutosDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ClassesDeletadas... ');
   dm.fdconn.Open;
    RecebendoClassesDeletadas;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ContasPagarDeletadas... ');
   dm.fdconn.Open;
    RecebendoContasPagarDeletadas;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ContasPagarComprasDeletadas... ');
   dm.fdconn.Open;
    RecebendoContasPagarComprasDeletadas;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FamiliasDeletadas... ');
   dm.fdconn.Open;
    RecebendoFamiliasDeletadas;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposBalancoDeletados... ');
    RegistraHoraInicio;
   dm.fdconn.Open;
    RecebendoGruposBalancoDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposCompraDeletados... ');
   dm.fdconn.Open;
    RecebendoGruposCompraDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposDeletados... ');
   dm.fdconn.Open;
    RecebendoGruposDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ConveniosPBMDeletados... ');
   dm.fdconn.Open;
    RecebendoConveniosPBMDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ConveniosPBMDeletados... ');
   dm.fdconn.Open;
    RecebendoProdutosConvenioPBMDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo GruposCurvasDeletadas... ');
   dm.fdconn.Open;
    RecebendoGruposCurvasDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo LaboratoriosDeletados... ');
   dm.fdconn.Open;
    RecebendoLaboratoriosDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo VendedoresDeletados... ');
   dm.fdconn.Open;
    RecebendoVendedoresDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PlanoContasDeletados... ');
   dm.fdconn.Open;
    RecebendoPlanosContasDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ClientesDeletados... ');
   dm.fdconn.Open;
    RecebendoClientesDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ConveniosDeletados... ');
   dm.fdconn.Open;
    RecebendoConveniosDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo TransportadoresDeletados... ');
   dm.fdconn.Open;
    RecebendoTransportadorasDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo CartoesDeletados... ');
   dm.fdconn.Open;
    RecebendoCartoesDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo DistribuidoresDeletados... ');
   dm.fdconn.Open;
    RecebendoDistribuidoresDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FiliaisDeletadas... ');
   dm.fdconn.Open;
    RecebendoFiliaisDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FormasPagamentoDeletadas... ');
   dm.fdconn.Open;
    RecebendoFormasPagamentoDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo BalancosDeletados... ');
   dm.fdconn.Open;
    RecebendoBalancosDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ComprasDeletadas... ');
   dm.fdconn.Open;
    RecebendoComprasDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ItesnCompraDeletados... ');
   dm.fdconn.Open;
    RecebendoItensComprasDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasFiliaisDeletadas... ');
   dm.fdconn.Open;
    RecebendoMetasFiliaisDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo MetasVendedoresDeletadas... ');
   dm.fdconn.Open;
    RecebendoMetasVendedoresDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Usuarios.. ');
    RegistraHoraInicio;
   dm.fdconn.Open;
    RecebendoUsuarios;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo UsuariosDeletados... ');
   dm.fdconn.Open;
    RecebendoUsuariosDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Permissoes... ');
   dm.fdconn.Open;
    RecebendoPermissoes;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PermissoesModulos... ');
   dm.fdconn.Open;
    RecebendoPermissoesModulos;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo EncartesDeletadas... ');
   dm.fdconn.Open;
    RecebendoEncartesDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo EncarteItensDeletados... ');
   dm.fdconn.Open;
    RecebendoItensEncartesDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Encartes... ');
   dm.fdconn.Open;
    RecebendoEncartes;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ItensEncartes... ');
   dm.fdconn.Open;
    RecebendoItensEncartes;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Redes... ');
   dm.fdconn.Open;
    RecebendoRedes;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Concorrentes... ');
   dm.fdconn.Open;
    RecebendoConcorrentes;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ProjetosPharmalink... ');
   dm.fdconn.Open;
    RecebendoProjetosPharmalink;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PerfilClientes... ');
   dm.fdconn.Open;
    RecebendoPerfilCliente;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PrecosConcorrentesDeletados... ');
   dm.fdconn.Open;
    RecebendoPrecosConcorrentesDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ProdutosFarmaciaPopularDeletados... ');
   dm.fdconn.Open;
    RecebendoProdutosFPDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PrincipioAtivo... ');
   dm.fdconn.Open;
    RecebendoPrincipioAtivo;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo ProdDistr... ');
   dm.fdconn.Open;
    while RecebendoProdDistr do Sleep(1);
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Produtos Fisco... ');
   dm.fdconn.Open;
    while RecebendoProdutosFisco do Sleep(1);
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Produtos Barras Deletados... ');
    RecebendoProdutosBarrasDeletados;
   dm.fdconn.Open;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Produtos Barras... ');
   dm.fdconn.Open;
    while RecebendoProdutosBarras do Sleep(1);
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo Produtos Compostos... ');
   dm.fdconn.Open;
    while RecebendoProdutosCompostos do Sleep(1);
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo PrecosConcorrentes... ');
   dm.fdconn.Open;
    RecebendoPrecosConcorrentes;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ConveniosPBM... ');
   dm.fdconn.Open;
    RecebendoConveniosPBM;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ProdutosConveniosPBM... ');
   dm.fdconn.Open;
    RecebendoProdutosConvenioPBM;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Envio de Caixas Deletados ... ');
   dm.fdconn.Open;
    EnviandoCaixasDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Envio de Compras Deletadas ... ');
   dm.fdconn.Open;
    EnviandoComprasDeletadas;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Envio de Contas a Pagar Deletadas ... ');
   dm.fdconn.Open;
    EnviandoContasPagarDeletadas;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Envio de Clientes Deletados ... ');
   dm.fdconn.Open;
    EnviandoClientesDeletados;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Envio de Contas a Receber Deletadas... ');
   dm.fdconn.Open;
    while EnviandoContasReceberDeletados do Sleep(1);
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FiliaisGrupos... ');
   dm.fdconn.Open;
    RecebendoFiliaisGrupos;
   dm.fdconn.Close;

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebimento de ItensCompras... ');
   dm.fdconn.Open;
    RecebendoUsuariosGrupos;
   dm.fdconn.Close;


    {GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Recebendo FiliaisGruposDeletados... ');
   dm.fdconn.Open;
    RecebendoFiliaisGruposDeletados;
   dm.fdconn.Close;}


    // FML - 14.07.2015
    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Iniciando Enviando Balancos Concluídos... ');
   dm.fdconn.Open;
    while EnviandoBalancosFilial do Sleep(1);
   dm.fdconn.Close;


    if ((FormatDateTime('hh:mm:ss', Time) >= '10:00:00') and (FormatDateTime('hh:mm:ss', Time) <= '11:30:00')) or
       ((FormatDateTime('hh:mm:ss', Time) >= '15:00:00') and (FormatDateTime('hh:mm:ss', Time) <= '16:30:00')) or
       ((FormatDateTime('hh:mm:ss', Time) >= '19:00:00') and (FormatDateTime('hh:mm:ss', Time) <= '20:30:00')) then
     begin
       dm.fdconn.Open;
        ConfereProdutos;
       dm.fdconn.Close;
     end;

    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - =======================================================');
    FecharTodosDataSets;
end;


Procedure RegistraHoraInicio;
Var Txt : TextFile;
begin
 GeraLog(FormatDateTime('hh:mm:ss',Time)+'=============');
end;



//==============================   recebendo os dados da Matriz   ============================//


procedure RecebendoCompras;
var
 i : integer;
 LResponse: IResponse;
 TJsonCompras :TJSONObject;
 filial:string;
begin
   Try
     dm2.CdsCompras.Close;
     dm2.CdsCompras.CreateDataSet;
     // Processa(105, Filial, 'A');
    TJsonCompras:=TJSONObject.Create;
    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('compras/'+filial)
    .Accept('application/json')
    .Get;

     if LResponse.StatusCode<> 200 then
     begin
        exit;
     end
     else
     begin

        try
          dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_COMPRAS INACTIVE';
          dm3.FDSql.Execsql(True);
        except
           dm3.FDSql.SQL.Clear;
        end;


       dm2.CdsCompras.LoadFromJSON(LResponse.Content);
       dm2.CdsCompras.Open; // virtual
       dm2.CdsCompras.First;
       GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Compras: '+ FloatToStr(dm2.CdsCompras.RecordCount));
       while not dm2.CdsCompras.Eof do
        begin
          dm2.FDAtualizaCompras.Params[0].AsFloat := dm2.CdsComprasCD_COMPRAS.AsFloat;
          dm2.FDAtualizaCompras.Params[1].AsFloat := dm2.CdsComprasCD_FILIAL.AsFloat;
          dm2.FDAtualizaCompras.Params[2].AsFloat := dm2.CdsComprasCD_DISTRIBUIDOR.AsFloat;
          dm2.FDAtualizaCompras.Params[3].AsFloat := dm2.CdsComprasCD_PLANO_CONTAS.AsFloat;
          dm2.FDAtualizaCompras.Params[4].AsFloat := dm2.CdsComprasCD_OBSERVACAO.AsFloat;
          dm2.FDAtualizaCompras.Params[5].AsFloat := dm2.CdsComprasCD_TRANSPORTADORA.AsFloat;
          dm2.FDAtualizaCompras.Params[6].AsDateTime := dm2.CdsComprasDT_PEDIDO.AsDateTime;
          dm2.FDAtualizaCompras.Params[7].AsString := dm2.CdsComprasNOTA_FISCAL.AsString;
          dm2.FDAtualizaCompras.Params[8].AsString := dm2.CdsComprasSERIE_NOTA_FISCAL.AsString;
          dm2.FDAtualizaCompras.Params[9].AsDateTime := dm2.CdsComprasDT_EMISSAO.AsDateTime;
          dm2.FDAtualizaCompras.Params[10].AsString := dm2.CdsComprasBOLETO.AsString;
          dm2.FDAtualizaCompras.Params[11].AsDateTime := dm2.CdsComprasDT_BOLETO.AsDateTime;
          dm2.FDAtualizaCompras.Params[12].AsFloat := dm2.CdsComprasCD_CFOP.AsFloat;
          dm2.FDAtualizaCompras.Params[13].AsDateTime := dm2.CdsComprasDT_ENTRADA.AsDateTime;
          dm2.FDAtualizaCompras.Params[14].AsFloat := dm2.CdsComprasVL_IPI.AsFloat;
          dm2.FDAtualizaCompras.Params[15].AsFloat := dm2.CdsComprasVL_ICM.AsFloat;
          dm2.FDAtualizaCompras.Params[16].AsFloat := dm2.CdsComprasTOTAL_NOTA.AsFloat;
          dm2.FDAtualizaCompras.Params[17].AsFloat := dm2.CdsComprasICM_BASE_CALCULO.AsFloat;
          dm2.FDAtualizaCompras.Params[18].AsFloat := dm2.CdsComprasICM_ISENTO.AsFloat;
          dm2.FDAtualizaCompras.Params[19].AsFloat := dm2.CdsComprasICM_OUTROS.AsFloat;
          dm2.FDAtualizaCompras.Params[20].AsFloat := dm2.CdsComprasICM_BASESUBST.AsFloat;
          dm2.FDAtualizaCompras.Params[21].AsFloat := dm2.CdsComprasICM_VALORSUBST.AsFloat;
          dm2.FDAtualizaCompras.Params[22].AsFloat := dm2.CdsComprasVL_TOTALPRODUTOS.AsFloat;
          dm2.FDAtualizaCompras.Params[23].AsFloat := dm2.CdsComprasVL_SEGURO.AsFloat;
          dm2.FDAtualizaCompras.Params[24].AsFloat := dm2.CdsComprasOUTRAS_DESPESAS.AsFloat;
          dm2.FDAtualizaCompras.Params[25].AsFloat := dm2.CdsComprasVL_FRETE.AsFloat;
          dm2.FDAtualizaCompras.Params[26].AsFloat := dm2.CdsComprasIPI_BASE_CALCULO.AsFloat;
          dm2.FDAtualizaCompras.Params[27].AsFloat := dm2.CdsComprasIPI_ISENTO.AsFloat;
          dm2.FDAtualizaCompras.Params[28].AsFloat := dm2.CdsComprasIPI_OUTROS.AsFloat;
          dm2.FDAtualizaCompras.Params[29].AsFloat := dm2.CdsComprasD_ICMV.AsFloat;
          dm2.FDAtualizaCompras.Params[30].AsFloat := dm2.CdsComprasD_IPIV.AsFloat;
          dm2.FDAtualizaCompras.Params[31].AsFloat := dm2.CdsComprasD_TOTNT.AsFloat;
          dm2.FDAtualizaCompras.Params[32].AsFloat := dm2.CdsComprasUNIDADES.AsFloat;
          dm2.FDAtualizaCompras.Params[33].AsFloat := dm2.CdsComprasNUMERO_ITENS.AsFloat;
          dm2.FDAtualizaCompras.Params[34].AsString := dm2.CdsComprasFATURAMENTO.AsString;
          dm2.FDAtualizaCompras.Params[35].AsString := dm2.CdsComprasMOTIVO.AsString;
          dm2.FDAtualizaCompras.Params[36].AsString := dm2.CdsComprasENVIADO.AsString;
          dm2.FDAtualizaCompras.Params[37].AsString := dm2.CdsComprasSTATUS.AsString;
          dm2.FDAtualizaCompras.Params[38].AsFloat := dm2.CdsComprasVL_DESCONTO_NOTA.AsFloat;
          dm2.FDAtualizaCompras.Params[39].AsFloat := dm2.CdsComprasCD_USUARIO_CRIACAO.AsFloat;
          dm2.FDAtualizaCompras.Params[40].AsString := dm2.CdsComprasUSUARIO_DIGITACAO.AsString;
          dm2.FDAtualizaCompras.Params[41].AsFloat := dm2.CdsComprasCD_USUARIO_DIGITACAO.AsFloat;
          dm2.FDAtualizaCompras.Params[42].AsString := dm2.CdsComprasUSUARIO_CRIACAO.AsString;
          dm2.FDAtualizaCompras.Params[43].AsFloat := dm2.CdsComprasCD_USUARIO_CONCLUSAO.AsFloat;
          dm2.FDAtualizaCompras.Params[44].AsString := dm2.CdsComprasUSUARIO_CONCLUSAO.AsString;
          dm2.FDAtualizaCompras.Params[45].AsFloat := dm2.CdsComprasCD_USUARIO_ENVIO.AsFloat;
          dm2.FDAtualizaCompras.Params[46].AsString := dm2.CdsComprasUSUARIO_ENVIO.AsString;
          dm2.FDAtualizaCompras.Params[47].AsString := dm2.CdsComprasVINCULADO.AsString;
          dm2.FDAtualizaCompras.Params[48].AsFloat := dm2.CdsComprasCD_COMPRAS_VINCULADO.AsFloat;
          dm2.FDAtualizaCompras.Params[49].AsString := dm2.CdsComprasTEMVINCULADO.AsString;
          dm2.FDAtualizaCompras.Params[50].AsString := dm2.CdsComprasSTATUSCONFERENCIA.AsString;
          dm2.FDAtualizaCompras.Params[51].AsFloat := dm2.CdsComprasCD_USUARIO_CONFERENCIA.AsFloat;
          dm2.FDAtualizaCompras.Params[52].AsString := dm2.CdsComprasUSUARIO_CONFERENCIA.AsString;
          dm2.FDAtualizaCompras.Params[53].AsString := dm2.CdsComprasCONFIGGERACAO.AsString;
          dm2.FDAtualizaCompras.Params[54].AsString := dm2.CdsComprasLOCALGERACAO.AsString;
          dm2.FDAtualizaCompras.Params[55].AsString := dm2.CdsComprasMODELONF.AsString;
          dm2.FDAtualizaCompras.Params[56].AsFloat := dm2.CdsComprasVL_ISENTOICMS.AsFloat;
          dm2.FDAtualizaCompras.Params[57].AsFloat := dm2.CdsComprasICMS_RETIDO.AsFloat;
          dm2.FDAtualizaCompras.Params[58].AsString := dm2.CdsComprasPHARMALINK.AsString;
          dm2.FDAtualizaCompras.Params[59].AsString := dm2.CdsComprasBONIFICACAO.AsString;
          dm2.FDAtualizaCompras.Params[60].AsString := dm2.CdsComprasCHAVENFE.AsString;
          dm2.FDAtualizaCompras.Params[61].AsFloat := dm2.CdsComprasVL_PIS.AsFloat;
          dm2.FDAtualizaCompras.Params[62].AsFloat := dm2.CdsComprasVL_COFINS.AsFloat;
          dm2.FDAtualizaCompras.Params[63].AsString := dm2.CdsComprasINFCPL.AsString;
          dm2.FDAtualizaCompras.Params[64].AsString := dm2.CdsComprasTRANSFERENCIA.AsString;
          dm2.FDAtualizaCompras.Params[65].AsString := dm2.CdsComprasCONSIGNACAO.AsString;

          dm2.FDAtualizaCompras.Params[66].AsFloat := dm2.CdsComprasVL_FCP.AsFloat;
          dm2.FDAtualizaCompras.Params[67].AsFloat := dm2.CdsComprasVL_FCPST.AsFloat;
          dm2.FDAtualizaCompras.Params[68].AsFloat := dm2.CdsComprasVL_FCPSTRET.AsFloat;
          dm2.FDAtualizaCompras.Params[69].AsFloat := dm2.CdsComprasVL_II.AsFloat;
          dm2.FDAtualizaCompras.Params[70].AsFloat := dm2.CdsComprasICM_BASESUBSTRET.AsFloat;
          dm2.FDAtualizaCompras.Params[71].AsFloat := dm2.CdsComprasICM_VALORSUBSTRET.AsFloat;

          dm2.FDAtualizaCompras.Params[72].AsFloat := dm2.CdsComprasICMSDESONERACAO.AsFloat;

          Try
            dm2.FDAtualizaCompras.Execsql(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Compras - Execução da Procedure');
          End;

          dm2.CdsCompras.Next;
        end;

       dm2.CdsCompras.Close;

       try
         dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_COMPRAS ACTIVE';
         dm3.FDSql.Execsql(True);
       except

       end;

     end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Compras');
         dm2.CdsCompras.Close;

         try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_COMPRAS ACTIVE';
           dm3.FDSql.Execsql(True);

         except
           dm3.FDSql.SQL.Clear;
         end;

         Exit;
       end;
   end;
end;


procedure RecebendoItensCompras;
var i : integer;
  LResponse: IResponse;
  TJsonItensCompras :TJSONObject;

begin
   Try
     dm2.CdsItensCompra.Close;
     dm2.CdsItensCompra.CreateDataSet;

     //Processa(106, Filial, 'A');

     if LResponse.StatusCode <> 200 then
     begin
      exit
     end
     else
     begin

       try
         dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_ITENS_COMPRAS INACTIVE';
         dm3.FDSql.Execsql(True);
       except
        GeraLog('Erro ao inativar TRIGGER TG_AT_ITENS_COMPRAS INACTIVE ');
       end;

       dm2.CdsItensCompra.LoadFromJSON(LResponse.Content);
       dm2.CdsItensCompra.Open; // virtual
       dm2.CdsItensCompra.First;
       GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ItensCompras: '+ FloatToStr(dm2.CdsItensCompra.RecordCount));
       while not dm2.CdsItensCompra.Eof do
        begin
          dm2.FDAtualizaItensCompra.Params[0].AsFloat := dm2.CdsItensCompraCD_COMPRAS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[1].AsFloat := dm2.CdsItensCompraID_PRODUTO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[2].AsString := dm2.CdsItensCompraCD_PRODUTO.AsString;
          dm2.FDAtualizaItensCompra.Params[3].AsFloat := dm2.CdsItensCompraCD_FILIAL.AsFloat;
          dm2.FDAtualizaItensCompra.Params[4].AsFloat := dm2.CdsItensCompraCD_FILIAL_DESTINO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[5].AsFloat := dm2.CdsItensCompraCODIGO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[6].AsString := dm2.CdsItensCompraDESCRICAO.AsString;
          dm2.FDAtualizaItensCompra.Params[7].AsFloat := dm2.CdsItensCompraSALDO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[8].AsFloat := dm2.CdsItensCompraESTOQUE_MINIMO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[9].AsFloat := dm2.CdsItensCompraESTOQUE_MAXIMO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[10].AsFloat := dm2.CdsItensCompraMEDIAF.AsFloat;
          dm2.FDAtualizaItensCompra.Params[11].AsString := dm2.CdsItensCompraCURVA.AsString;
          dm2.FDAtualizaItensCompra.Params[12].AsString := dm2.CdsItensCompraLABORATORIO.AsString;
          dm2.FDAtualizaItensCompra.Params[13].AsString := dm2.CdsItensCompraGRUPO.AsString;
          dm2.FDAtualizaItensCompra.Params[14].AsString := dm2.CdsItensCompraCLASSE.AsString;
          dm2.FDAtualizaItensCompra.Params[15].AsFloat := dm2.CdsItensCompraCD_SITUACAO_TRIB.AsFloat;
          dm2.FDAtualizaItensCompra.Params[16].AsFloat := dm2.CdsItensCompraQUANTIDADE.AsFloat;
          dm2.FDAtualizaItensCompra.Params[17].AsFloat := dm2.CdsItensCompraVL_UNITARIO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[18].AsFloat := dm2.CdsItensCompraPERCENTUAL_ICMS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[19].AsFloat := dm2.CdsItensCompraREDUCAO_ICMS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[20].AsFloat := dm2.CdsItensCompraVL_ICMS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[21].AsFloat := dm2.CdsItensCompraPERCENTUAL_DESCONTO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[22].AsFloat := dm2.CdsItensCompraVL_DESCONTO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[23].AsFloat := dm2.CdsItensCompraPERCENTUAL_IPI.AsFloat;
          dm2.FDAtualizaItensCompra.Params[24].AsFloat := dm2.CdsItensCompraVL_IPI.AsFloat;
          dm2.FDAtualizaItensCompra.Params[25].AsFloat := dm2.CdsItensCompraVL_TOTAL.AsFloat;
          dm2.FDAtualizaItensCompra.Params[26].AsFloat := dm2.CdsItensCompraPERCENTUAL_MARGEM.AsFloat;
          dm2.FDAtualizaItensCompra.Params[27].AsString := dm2.CdsItensCompraCD_ATENDIMENTO.AsString;
          dm2.FDAtualizaItensCompra.Params[28].AsFloat := dm2.CdsItensCompraNOVO_PRECO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[29].AsFloat := dm2.CdsItensCompraNOVO_CUSTO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[30].AsString := dm2.CdsItensCompraATUALIZAR_PRECO.AsString;
          dm2.FDAtualizaItensCompra.Params[31].AsFloat := dm2.CdsItensCompraPRECO_VENDA.AsFloat;
          dm2.FDAtualizaItensCompra.Params[32].AsFloat := dm2.CdsItensCompraQT_EMBALAGEM.AsFloat;
          dm2.FDAtualizaItensCompra.Params[33].AsFloat := dm2.CdsItensCompraULTIMOCUSTO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[34].AsString := dm2.CdsItensCompraPRECO_REAJUSTADO.AsString;
          dm2.FDAtualizaItensCompra.Params[35].AsString := dm2.CdsItensCompraCODIGO_BARRAS.AsString;
          dm2.FDAtualizaItensCompra.Params[36].AsString := dm2.CdsItensCompraUNIDADE.AsString;
          dm2.FDAtualizaItensCompra.Params[37].AsString := dm2.CdsItensCompraICMS.AsString;
          dm2.FDAtualizaItensCompra.Params[38].AsFloat := dm2.CdsItensCompraBASEICMS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[39].AsFloat := dm2.CdsItensCompraBASEICMSSUBSTITUICAO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[40].AsString := dm2.CdsItensCompraSITUACAOTRIBITARIA.AsString;
          dm2.FDAtualizaItensCompra.Params[41].AsString := dm2.CdsItensCompraLOTE.AsString;
          dm2.FDAtualizaItensCompra.Params[42].AsDateTime := dm2.CdsItensCompraFABRICACAO.AsDateTime;
          dm2.FDAtualizaItensCompra.Params[43].AsDateTime := dm2.CdsItensCompraVALIDADE.AsDateTime;
          dm2.FDAtualizaItensCompra.Params[44].AsFloat := dm2.CdsItensCompraPRECO_PROMOCAO_ATUAL.AsFloat;
          dm2.FDAtualizaItensCompra.Params[45].AsFloat := dm2.CdsItensCompraPRECO_PROMOCAO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[46].AsFloat := dm2.CdsItensCompraDESCONTO_OUTROS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[47].AsString := dm2.CdsItensCompraDIASSEMVENDER.AsString;
          dm2.FDAtualizaItensCompra.Params[48].AsString := dm2.CdsItensCompraENVIADO.AsString;
          dm2.FDAtualizaItensCompra.Params[49].AsString := dm2.CdsItensCompraCFOP.AsString;
          dm2.FDAtualizaItensCompra.Params[50].AsFloat := dm2.CdsItensCompraVALORICMSSUBTITUICAO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[51].AsFloat := dm2.CdsItensCompraCUSTO_APLICADO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[52].AsFloat := dm2.CdsItensCompraMARGEM_VALOR_AGREGADO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[53].AsFloat := dm2.CdsItensCompraREDUCAO_ICMS_ST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[54].AsFloat := dm2.CdsItensCompraPERCENTUAL_ICMS_ST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[55].AsString := dm2.CdsItensCompraPIS_CST.AsString;
          dm2.FDAtualizaItensCompra.Params[56].AsFloat := dm2.CdsItensCompraPIS_BASE_CALCULO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[57].AsFloat := dm2.CdsItensCompraPIS_PERCENTUAL.AsFloat;
          dm2.FDAtualizaItensCompra.Params[58].AsFloat := dm2.CdsItensCompraPIS_VALOR.AsFloat;
          dm2.FDAtualizaItensCompra.Params[59].AsString := dm2.CdsItensCompraCOFINS_CST.AsString;
          dm2.FDAtualizaItensCompra.Params[60].AsFloat := dm2.CdsItensCompraCOFINS_BASE_CALCULO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[61].AsFloat := dm2.CdsItensCompraCOFINS_PERCENTUAL.AsFloat;
          dm2.FDAtualizaItensCompra.Params[62].AsFloat := dm2.CdsItensCompraCOFINS_VALOR.AsFloat;
          dm2.FDAtualizaItensCompra.Params[63].AsFloat := dm2.CdsItensCompraVALOR_OUTRASDESPESAS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[64].AsFloat := dm2.CdsItensCompraVALOR_SEGURO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[65].AsFloat := dm2.CdsItensCompraVALOR_FRETE.AsFloat;
          dm2.FDAtualizaItensCompra.Params[66].AsFloat := dm2.CdsItensCompraVALOR_ISENTO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[67].AsFloat := dm2.CdsItensCompraVALOR_OUTRAS.AsFloat;
          dm2.FDAtualizaItensCompra.Params[68].AsFloat := dm2.CdsItensCompraBASECALCULO_IPI.AsFloat;
          dm2.FDAtualizaItensCompra.Params[69].AsInteger := dm2.CdsItensCompraCST_IPI.AsInteger;
          dm2.FDAtualizaItensCompra.Params[70].AsString := dm2.CdsItensCompraNATUREZA_ISENTA_PIS.AsString;
          dm2.FDAtualizaItensCompra.Params[71].AsString := dm2.CdsItensCompraNATUREZA_ISENTA_COFINS.AsString;
          dm2.FDAtualizaItensCompra.Params[72].AsString := dm2.CdsItensCompraCEST.AsString;

          dm2.FDAtualizaItensCompra.Params[73].AsFloat := dm2.CdsItensCompraBASECALCULOFCP.AsFloat;
          dm2.FDAtualizaItensCompra.Params[74].AsFloat := dm2.CdsItensCompraALIQUOTAFCP.AsFloat;
          dm2.FDAtualizaItensCompra.Params[75].AsFloat := dm2.CdsItensCompraVALORFCP.AsFloat;
          dm2.FDAtualizaItensCompra.Params[76].AsFloat := dm2.CdsItensCompraBASECALCULOFCPST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[77].AsFloat := dm2.CdsItensCompraALIQUOTAFCPST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[78].AsFloat := dm2.CdsItensCompraVALORFCPST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[79].AsFloat := dm2.CdsItensCompraBASECALCULOFCPSTRET.AsFloat;
          dm2.FDAtualizaItensCompra.Params[80].AsFloat := dm2.CdsItensCompraALIQUOTAFCPSTRET.AsFloat;
          dm2.FDAtualizaItensCompra.Params[81].AsFloat := dm2.CdsItensCompraVALORFCPSTRET.AsFloat;
          dm2.FDAtualizaItensCompra.Params[82].AsFloat := dm2.CdsItensCompraBASECALCULOFCPSTRET.AsFloat;
          dm2.FDAtualizaItensCompra.Params[83].AsFloat := dm2.CdsItensCompraPERCENTUAL_ICMS_ST_RET.AsFloat;
          dm2.FDAtualizaItensCompra.Params[84].AsFloat := dm2.CdsItensCompraVALORICMSSUBSTITUICAORET.AsFloat;
          dm2.FDAtualizaItensCompra.Params[85].AsString := dm2.CdsItensCompraNCM.AsString;
          dm2.FDAtualizaItensCompra.Params[86].AsString := dm2.CdsItensCompraORIGEM.AsString;
          dm2.FDAtualizaItensCompra.Params[87].AsString := dm2.CdsItensCompraINFORMACOESADICIONAIS.AsString;
          dm2.FDAtualizaItensCompra.Params[88].AsInteger := dm2.CdsItensCompraMODALIDADEBC.AsInteger;
          dm2.FDAtualizaItensCompra.Params[89].AsInteger := dm2.CdsItensCompraMODALIDADEBCST.AsInteger;
          dm2.FDAtualizaItensCompra.Params[90].AsFloat := dm2.CdsItensCompraICMSBCUFDEST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[91].AsFloat := dm2.CdsItensCompraICMSBCFCPUFDEST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[92].AsFloat := dm2.CdsItensCompraICMSPERCENTUALFCPUFDEST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[93].AsFloat := dm2.CdsItensCompraICMSVALORFCPUFDEST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[94].AsFloat := dm2.CdsItensCompraICMSPERCENTUALINTER.AsFloat;
          dm2.FDAtualizaItensCompra.Params[95].AsFloat := dm2.CdsItensCompraICMSPERCENTUALUFDEST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[96].AsFloat := dm2.CdsItensCompraICMSVALORUFREMET.AsFloat;
          dm2.FDAtualizaItensCompra.Params[97].AsFloat := dm2.CdsItensCompraICMSVALORUFDEST.AsFloat;
          dm2.FDAtualizaItensCompra.Params[98].AsFloat := dm2.CdsItensCompraICMSPERCENTUALINTERPART.AsFloat;
          dm2.FDAtualizaItensCompra.Params[99].AsString := dm2.CdsItensCompraCODIGOANVISA.AsString;
          dm2.FDAtualizaItensCompra.Params[100].AsFloat := dm2.CdsItensCompraPMC.AsFloat;
          dm2.FDAtualizaItensCompra.Params[101].AsString := dm2.CdsItensCompraCODIGOBENEFICIO.AsString;
          dm2.FDAtualizaItensCompra.Params[102].AsString := dm2.CdsItensCompraMOTIVODESONERACAO.AsString;
          dm2.FDAtualizaItensCompra.Params[103].AsFloat := dm2.CdsItensCompraVALORDESONERACAO.AsFloat;
          dm2.FDAtualizaItensCompra.Params[104].AsFloat := dm2.CdsItensCompraPERCENTUALDESONERACAO.AsFloat;

          Try
            dm2.FDAtualizaItensCompra.ExecSql(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Itens Compra - Execução da Procedure');
          End;

          dm2.CdsItensCompra.Next;
        end;

       dm2.CdsItensCompra.Close;
     end;

     try
       dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_ITENS_COMPRAS ACTIVE';
       dm3.FDSql.Execsql(True);

     except
      GeraLog('Erro ao Ativar TRIGGER TG_AT_ITENS_COMPRAS ');
     end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Itens Compra');
         dm2.CdsItensCompra.Close;

         try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_ITENS_COMPRAS ACTIVE';
           dm3.FDSql.Execsql(True);
         except
           GeraLog('Erro ao Ativar TRIGGER TG_AT_ITENS_COMPRAS ');
         end;

         Exit;
       end;
   end;
end;


procedure RecebendoLotesItensCompras;
var i : integer;
  LResponse: IResponse;
  TJsonLotesItensCompra :TJSONObject;


begin

   Try
     dm2.CdsLotesItensCompra.Close;
     dm2.CdsLotesItensCompra.CreateDataSet;

    //Processa(156, Filial, 'A');

    TJsonLotesItensCompra:=TJSONObject.Create;
    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('compras/'+FloatToStr(dm.cdfilialparametro))
    .Accept('application/json')
    .Get;

    if LResponse.StatusCode<>200 then
     begin
       exit
     end
     else
     begin


       try
         dm3.FDSql.sql.text := 'ALTER TRIGGER ITENS_COMPRA_LOTE_AIU0 INACTIVE';
         dm3.FDSql.Execsql(True);
       except
         GravaLog('Erro ao destivar a trigger ITENS_COMPRA_LOTE_AIU0');
       end;

       dm2.CdsLotesItensCompra.LoadFromJSON(LResponse.Content);
       dm2.CdsLotesItensCompra.Open; // virtual
       dm2.CdsLotesItensCompra.First;
       GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo LotesItensCompras: '+ FloatToStr(dm2.CdsLotesItensCompra.RecordCount));
       while not dm2.CdsLotesItensCompra.Eof do
        begin
          dm2.FDAtualizaItensCompraLote.Params[0].AsFloat := dm2.CdsLotesItensCompraCD_COMPRAS.AsFloat;
          dm2.FDAtualizaItensCompraLote.Params[1].AsFloat := dm2.CdsLotesItensCompraCD_FILIAL.AsFloat;
          dm2.FDAtualizaItensCompraLote.Params[2].AsFloat := dm2.CdsLotesItensCompraCD_DISTRIBUIDOR.AsFloat;
          dm2.FDAtualizaItensCompraLote.Params[3].AsString := dm2.CdsLotesItensCompraNOTA_FISCAL.AsString;
          dm2.FDAtualizaItensCompraLote.Params[4].AsFloat := dm2.CdsLotesItensCompraID_PRODUTO.AsFloat;
          dm2.FDAtualizaItensCompraLote.Params[5].AsString := dm2.CdsLotesItensCompraLOTE.AsString;
          dm2.FDAtualizaItensCompraLote.Params[6].AsFloat := dm2.CdsLotesItensCompraQUANTIDADE.AsFloat;
          dm2.FDAtualizaItensCompraLote.Params[7].AsDate := dm2.CdsLotesItensCompraFABRICACAO.AsDateTime;
          dm2.FDAtualizaItensCompraLote.Params[8].AsDate := dm2.CdsLotesItensCompraVALIDADE.AsDateTime;
          Try
            dm2.FDAtualizaItensCompraLote.Execsql(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Lotes Itens Compra - Execução da Procedure');
          End;
          dm2.CdsLotesItensCompra.Next;
        end;

       dm2.CdsLotesItensCompra.Close;
     end;

     try
       dm3.FDSql.sql.text := 'ALTER TRIGGER ITENS_COMPRA_LOTE_AIU0 ACTIVE';
       dm3.FDSql.Execsql(True);
     except
       GeraLog('Erro ao ativar trigger ITENS_COMPRA_LOTE_AIU0 ');
     end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Lotes Itens Compra');
         dm2.CdsLotesItensCompra.Close;

         try
           dm3.FDSql.sql.text := 'ALTER TRIGGER ITENS_COMPRA_LOTE_AIU0 ACTIVE';
           dm3.FDSql.Execsql(True);
         except
           GeraLog('Erro ao ativar trigger ITENS_COMPRA_LOTE_AIU0 ');
         end;

         Exit;
       end;
   end;
end;


procedure RecebendoConveniosPBM;
var i : integer;
Dados : Variant;
begin
   Try
     dm3.CdsConveniosPBM.Close;
     dm3.CdsConveniosPBM.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(107, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsConveniosPBM.Data := Dados;
     dm3.CdsConveniosPBM.Open; // virtual

     dm3.CdsConveniosPBM.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ConveniosPBM: '+ FloatToStr(dm3.CdsConveniosPBM.RecordCount));
     while not dm3.CdsConveniosPBM.Eof do
      begin
        dm3.FDAtualizaConveniosPBM.Params[0].AsFloat := dm3.CdsConveniosPBMID_CONVENIOPBM.AsFloat;
        dm3.FDAtualizaConveniosPBM.Params[1].AsString := dm3.CdsConveniosPBMNOME.AsString;
        dm3.FDAtualizaConveniosPBM.Params[2].AsString := dm3.CdsConveniosPBMURL.AsString;
        dm3.FDAtualizaConveniosPBM.Params[3].AsString := dm3.CdsConveniosPBMENVIADO.AsString;
        Try
          dm3.FDAtualizaConveniosPBM.ExecFD(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ConveniosPBM - Execução da Procedure');
        End;

        dm3.CdsConveniosPBM.Next;
      end;

     dm3.CdsConveniosPBM.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ConveniosPBM');
         dm3.CdsConveniosPBM.Close;
         Exit;
       end;
   end;
end;



procedure RecebendoComprasBoletos;
var i : integer;
LResponse: IResponse;
TJsonComprasBoletos :TJSONObject;

begin
   Try
     dm2.CdsComprasBoletos.Close;
     dm2.CdsComprasBoletos.CreateDataSet;

     //Processa(163, Filial, 'A');

     TJsonComprasBoletos:=TJSONObject.Create;
     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
     .Resource('compras/'+FloatToStr(dm.cdfilialparametro)
     .Accept('application/json')
     .Get;

     if LResponse.StatusCode<>200 then
      begin

          try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_COMPRAS_BOLETOS INACTIVE';
           dm3.FDSql.Execsql(True);
          except
          GeraLog('Erro ao Inativar TRIGGER TG_AT_COMPRAS_BOLETOS');
          end;

         dm2.CdsComprasBoletos.LoadFromJSON(LResponse.Content);
         dm2.CdsComprasBoletos.Open; // virtual
         dm2.CdsComprasBoletos.First;
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Compras Boletos: '+ FloatToStr(dm2.CdsComprasBoletos.RecordCount));
         while not dm2.CdsComprasBoletos.Eof do
          begin
            dm2.FDAtualizaComprasBoletos.Params[0].AsFloat := dm2.CdsComprasBoletosCD_COMPRAS.AsFloat;
            dm2.FDAtualizaComprasBoletos.Params[1].AsFloat := dm2.CdsComprasBoletosCD_BOLETO.AsFloat;
            dm2.FDAtualizaComprasBoletos.Params[2].AsString := dm2.CdsComprasBoletosNUMERO.AsString;
            dm2.FDAtualizaComprasBoletos.Params[3].AsDate := dm2.CdsComprasBoletosVENCIMENTO.AsDateTime;
            dm2.FDAtualizaComprasBoletos.Params[4].AsFloat := dm2.CdsComprasBoletosJUROS.AsFloat;
            dm2.FDAtualizaComprasBoletos.Params[5].AsFloat := dm2.CdsComprasBoletosDEDUCOES.AsFloat;
            dm2.FDAtualizaComprasBoletos.Params[6].AsFloat := dm2.CdsComprasBoletosDESPESASFINANCEIRAS.AsFloat;
            dm2.FDAtualizaComprasBoletos.Params[7].AsFloat := dm2.CdsComprasBoletosVALOR.AsFloat;

            Try
              dm2.FDAtualizaComprasBoletos.Execsql(False);
            Except
              GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Compras Boletos - Execução da Procedure');
            End;

            dm2.CdsComprasBoletos.Next;
          end;

         dm2.CdsComprasBoletos.Close;

         try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_COMPRAS_BOLETOS ACTIVE';
           dm3.FDSql.Execsql(True);

         except
            GeraLog('Erro ao ativar TRIGGER TG_AT_COMPRAS_BOLETOS');
         end;

      end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Compras Boletos');
         dm2.CdsComprasBoletos.Close;

         try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_COMPRAS_BOLETOS ACTIVE';
           dm3.FDSql.Execsql(True);
         except
           GeraLog('Erro ao ativar TRIGGER TG_AT_COMPRAS_BOLETOS');
         end;

         Exit;
       end;
   end;
end;


function RecebendoProdutosBarras : Boolean;
var i : integer;
Dados : Variant;
begin
   Result := True;
   Try
     dm32.CdsProdutosBarras.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(164, Filial, 'A');
     if (Dados = null) then
      begin
        Result := False;
        Exit;
      end;
     dm32.CdsProdutosBarras.Data := Dados;
     dm32.CdsProdutosBarras.Open; // virtual
     dm32.CdsProdutosBarras.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Barras: '+ FloatToStr(dm32.CdsProdutosBarras.RecordCount));
     while not dm32.CdsProdutosBarras.Eof do
      begin
        dm32.QryProdutosBarras.Close;
        dm32.QryProdutosBarras.Params[0].AsFloat := dm32.CdsProdutosBarrasID_PRODUTO.AsFloat;
        if not (dm32.CdsProdutosBarrasBARRA_ANTIGA.IsNull) and (dm32.CdsProdutosBarrasBARRA_ANTIGA.AsString <> '') then
           dm32.QryProdutosBarras.Params[1].AsString := dm32.CdsProdutosBarrasBARRA_ANTIGA.AsString
        else
           dm32.QryProdutosBarras.Params[1].AsString := '';
        dm32.QryProdutosBarras.Open;
        if dm32.QryProdutosBarras.RecordCount = 0 then
           dm32.QryProdutosBarras.Append
        else
           dm32.QryProdutosBarras.Edit;

        dm32.QryProdutosBarras.FieldByName('ID_PRODUTO').Value := dm32.CdsProdutosBarras.FieldByName('ID_PRODUTO').Value;
        dm32.QryProdutosBarras.FieldByName('CODIGO_BARRAS').Value := dm32.CdsProdutosBarras.FieldByName('CODIGO_BARRAS').Value;
        dm32.QryProdutosBarras.FieldByName('QT_EMBALAGEM').Value := dm32.CdsProdutosBarras.FieldByName('QT_EMBALAGEM').Value;

        dm32.QryProdutosBarras.Post;

        dm32.QryProdutosBarras.ApplyUpdates(0);

        dm32.CdsProdutosBarras.Next;
      end;
     dm32.CdsProdutosBarras.Close;
     dm32.QryProdutosBarras.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Barras');

         dm32.QryProdutosBarras.Close;
         dm32.CdsProdutosBarras.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoProdutosBarrasDeletados;
var Dados : Variant;
begin
  //busca na matriz as classes deletadas
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS_BARRAS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos_Barras Deletadas - ' + FloattoStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.Cds1.Close;
            dm3.FDSql.sql.text := 'DELETE FROM PRODUTOS_BARRAS WHERE ID_PRODUTO = ' + dm3.CdsDeletadosCAMPO1.AsString + ' AND CODIGO_BARRAS = ' + QuotedStr(dm3.CdsDeletadosCAMPO2.AsString);

            Try
              dm3.FDSql.ExecFD(True);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Classes Deletadas');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoReexportacao;
var i : integer;
LResponse: IResponse;
TJsonReexportacao :TJSONObject;

begin

   Try
     dm2.CdsReexportacao.Close;
     dm2.CdsReexportacao.CreateDataSet;

      TJsonReexportacao:=TJSONObject.Create;
      LResponse := TRequest.New.BaseURL(dm.BaseUrl )
      .Resource('filial/reexportacao/'+FloatToStr(dm.cdfilialparametro))
      .Accept('application/json')
      .Get;

      if LResponse.StatusCode<>200 then
       begin
        exit;
       end
       else
       begin
         dm2.CdsReexportacao.LoadFromJSON(LResponse.Content);
         dm2.CdsReexportacao.Open;
         dm2.CdsReexportacao.First;
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Reexportacao: '+ FloatToStr(dm2.CdsReexportacao.RecordCount));
         while not dm2.CdsReexportacao.Eof do
          begin
            try
              dm3.FDSql.sql.text := 'EXECUTE PROCEDURE SP_PREPARA_DADOS_EXPORTACAO(' + QuotedStr(FormatDateTime('mm/dd/yyyy', dm2.CdsReexportacaoDATA.AsDateTime)) + ', ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ')';

              Try
                dm3.FDSql.Execsql(True);
              Except
               dm3.FDSql.SQL.Clear;
              End;

            except on E:Exception do

              GeraLog('Erro ao executar SP_PREPARA_DADOS_EXPORTACAO :'+E.Message );
            end;

            dm2.CdsReexportacao.Next;
          end;

         dm2.CdsReexportacao.Close;
      end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Reexportacao'+ LResponse.Content);
         dm2.CdsReexportacao.Close;

         Exit;
       end;
   end;
end;



function RecebendoContasReceber : Boolean;
var
 i : integer;
 LResponse: IResponse;
 TJsonContasReceber :TJSONObject;

begin
   Result := True;
   Try
     dm2.CdsContas_Receber.Close;
     dm2.CdsContas_Receber.CreateDataSet;
    //Processa(121, Filial, 'A');

    TJsonContasReceber:=TJSONObject.Create;
    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('compras/'+FloatToStr(dm.cdfilialparametro))
    .Accept('application/json')
    .Get;

     if LResponse.StatusCode<>200 then
      begin
       Result := False;
        exit
      end
      else
      begin

         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR INACTIVE';
           dm3.FDSql.Execsql(True);
         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            end;
         End;

         dm2.CdsContas_Receber.LoadFromJSON(LResponse.Content);
         dm2.CdsContas_Receber.Open;
         if dm2.CdsContas_Receber.RecordCount > 0 then
            begin
               GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Contas a Receber: '+ FloatToStr(dm2.CdsCOntas_Receber.RecordCount));

               dm2.CdsContas_Receber.First;
               while not dm2.CdsContas_Receber.Eof do
                begin
                  dm2.FDAtualizaContasReceber.Params[0].asFloat := dm2.CdsContas_ReceberCD_CONTAS_RECEBER.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[1].asFloat := dm2.CdsContas_ReceberCD_CLIENTE.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[2].asFloat := dm2.CdsContas_ReceberCD_PLANO_CONTAS.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[3].asFloat := dm2.CdsContas_ReceberCD_FILIAL.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[4].asFloat := dm2.CdsContas_ReceberCD_CONVENIO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[5].asFloat := dm2.CdsContas_ReceberCD_VENDEDOR.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[6].asFloat := dm2.CdsContas_ReceberCD_VENDA.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[7].asFloat := dm2.CdsContas_ReceberCD_FORMA_PAGAMENTO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[8].asFloat := dm2.CdsContas_ReceberCD_CONTA.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[9].asFloat := dm2.CdsContas_ReceberCD_CARTAO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[10].asFloat := dm2.CdsContas_ReceberCD_BORDERO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[11].AsDateTime := dm2.CdsContas_ReceberDT_LANCAMENTO.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[12].AsDateTime := dm2.CdsContas_ReceberDT_VENCIMENTO.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[13].AsString := dm2.CdsContas_ReceberNOTA_FISCAL.AsString;
                  dm2.FDAtualizaContasReceber.Params[14].AsString := dm2.CdsContas_ReceberSERIE_NOTA.AsString;
                  dm2.FDAtualizaContasReceber.Params[15].AsString := dm2.CdsContas_ReceberDOCUMENTO.AsString;
                  dm2.FDAtualizaContasReceber.Params[16].AsDateTime := dm2.CdsContas_ReceberDT_NOTA_FISCAL.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[17].AsDateTime := dm2.CdsContas_ReceberVENCTO.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[18].asFloat := dm2.CdsContas_ReceberVALOR.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[19].AsString := dm2.CdsContas_ReceberHISTORICO.AsString;
                  dm2.FDAtualizaContasReceber.Params[20].asFloat := dm2.CdsContas_ReceberCD_CHEQUE_RECEBIDO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[21].AsString := dm2.CdsContas_ReceberNR_CHEQUE.AsString;
                  dm2.FDAtualizaContasReceber.Params[22].AsString := dm2.CdsContas_ReceberNR_BANCO.AsString;
                  dm2.FDAtualizaContasReceber.Params[23].AsDateTime := dm2.CdsContas_ReceberDT_PAGAMENTO.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[24].asFloat := dm2.CdsContas_ReceberVL_PAGAMENTO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[25].asFloat := dm2.CdsContas_ReceberVL_JUROS.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[26].asFloat := dm2.CdsContas_ReceberVL_DESCONTO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[27].asFloat := dm2.CdsContas_ReceberVL_SALDO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[28].AsString := dm2.CdsContas_ReceberNOSSO_NUMERO.AsString;
                  dm2.FDAtualizaContasReceber.Params[29].AsString := dm2.CdsContas_ReceberBANCO.AsString;
                  dm2.FDAtualizaContasReceber.Params[30].AsString := dm2.CdsContas_ReceberAGENCIA.AsString;
                  dm2.FDAtualizaContasReceber.Params[31].AsString := dm2.CdsContas_ReceberCONTA.AsString;
                  dm2.FDAtualizaContasReceber.Params[32].AsString := dm2.CdsContas_ReceberHISTORICO_BANCO.AsString;
                  dm2.FDAtualizaContasReceber.Params[33].AsString := dm2.CdsContas_ReceberSTATUS.AsString;
                  dm2.FDAtualizaContasReceber.Params[34].AsString := dm2.CdsContas_ReceberGERABOLETO.AsString;
                  dm2.FDAtualizaContasReceber.Params[35].AsString := dm2.CdsContas_ReceberBOLETOGERADO.AsString;
                  dm2.FDAtualizaContasReceber.Params[36].AsDateTime := dm2.CdsContas_ReceberDT_ALTERACAO.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[37].asFloat := dm2.CdsContas_ReceberTEFTRANSACAO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[38].asFloat := dm2.CdsContas_ReceberTEFLOTE.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[39].asString := dm2.CdsContas_ReceberTEFAUTORIZACAO.AsString;
                  dm2.FDAtualizaContasReceber.Params[40].AsDateTime := dm2.CdsContas_ReceberTEFDATA.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[41].AsDateTime := dm2.CdsContas_ReceberTEFHORA.AsDateTime;
                  dm2.FDAtualizaContasReceber.Params[42].AsString := dm2.CdsContas_ReceberTEFNOMEREDE.AsString;
                  dm2.FDAtualizaContasReceber.Params[43].asFloat := dm2.CdsContas_ReceberTEFVALOR.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[44].AsString := dm2.CdsContas_ReceberENVIADO.AsString;
                  dm2.FDAtualizaContasReceber.Params[45].AsString := dm2.CdsContas_ReceberTRNTRANSACAO.AsString;
                  dm2.FDAtualizaContasReceber.Params[46].AsString := dm2.CdsContas_ReceberTRNLOTE.AsString;;
                  dm2.FDAtualizaContasReceber.Params[47].AsString := dm2.CdsContas_ReceberTRNAUTORIZACAO.AsString;;
                  dm2.FDAtualizaContasReceber.Params[48].AsString := dm2.CdsContas_ReceberTRN.AsString;
                  dm2.FDAtualizaContasReceber.Params[49].asFloat := dm2.CdsContas_ReceberCD_FILIAL_PAGAMENTO.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[50].AsInteger := dm2.CdsContas_ReceberPARCELA.AsInteger;
                  dm2.FDAtualizaContasReceber.Params[51].asFloat := dm2.CdsContas_ReceberCD_CAIXA.AsFloat;
                  dm2.FDAtualizaContasReceber.Params[52].asFloat := dm2.CdsContas_ReceberCD_FILIAL_ORIGEM.AsFloat;
                  Try
                    dm2.FDAtualizaContasReceber.Execsql(False);
                  Except
                    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Contas Receber - Execução da Procedure');
                  End;

                  dm2.CdsContas_Receber.Next;
                end;

            end;
      end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Contas Receber');
         dm2.CdsContas_Receber.Close;
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
           dm3.FDSql.Execsql(True);
         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;
         Exit;
       end;
   end;
   dm2.CdsContas_Receber.Close;
   Try
     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
     dm3.FDSql.Execsql(True);

   Except
     on E:Exception do
      begin
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

      end;
   End;
end;


function RecebendoContasPagar : Boolean;
var
 i : integer;
 LResponse: IResponse;
 TJsonConsPagar :TJSONObject;
begin
   Result := True;
   Try
     dm2.CdsContas_Pagar.Close;
     dm2.CdsContas_Pagar.CreateDataSet;

    TJsonConsPagar:=TJSONObject.Create;
    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('contaspagar/'+FloatToStr(dm.cdfilialparametro))
    .Accept('application/json')
    .Get;

      //Processa(122, Filial, 'A');

     if LResponse.StatusCode <> 200 then
      begin
        exit
      end
      else
      begin


         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CP INACTIVE';
           dm3.FDSql.Execsql(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;

         dm2.CdsContas_Pagar.LoadFromJSON(LResponse.Content);
         dm2.CdsContas_Pagar.Open;
       if dm2.CdsContas_Pagar.RecordCount > 0 then
          begin
             GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Contas a Pagar: '+ FloatToStr(dm2.CdsContas_Pagar.RecordCount));

             dm2.CdsContas_Pagar.First;
             while not dm2.CdsContas_Pagar.Eof do
              begin
                dm2.FDAtualizaContasPagar.Params[0].asFloat := dm2.CdsContas_PagarCD_CONTAS_PAGAR.AsFloat;
                dm2.FDAtualizaContasPagar.Params[1].asFloat := dm2.CdsContas_PagarCD_FILIAL.AsFloat;
                dm2.FDAtualizaContasPagar.Params[2].asFloat := dm2.CdsContas_PagarCD_DISTRIBUIDOR.AsFloat;
                dm2.FDAtualizaContasPagar.Params[3].asFloat := dm2.CdsContas_PagarCD_COMPRAS.AsFloat;
                dm2.FDAtualizaContasPagar.Params[4].asFloat := dm2.CdsContas_PagarCD_CONTA.AsFloat;
                dm2.FDAtualizaContasPagar.Params[5].asFloat := dm2.CdsContas_PagarCD_FORMA_PAGAMENTO.AsFloat;
                dm2.FDAtualizaContasPagar.Params[6].asFloat := dm2.CdsContas_PagarCD_PLANO_CONTAS.AsFloat;
                dm2.FDAtualizaContasPagar.Params[7].asString := dm2.CdsContas_PagarNUMERO_NOTA.asString;
                dm2.FDAtualizaContasPagar.Params[8].asString := dm2.CdsContas_PagarSERIAL_NOTA.asString;
                dm2.FDAtualizaContasPagar.Params[9].asString := dm2.CdsContas_PagarDOCUMENTO.asString;
                dm2.FDAtualizaContasPagar.Params[10].asDateTime := dm2.CdsContas_PagarDT_NOTA.asDateTime;
                dm2.FDAtualizaContasPagar.Params[11].asDateTime := dm2.CdsContas_PagarDT_VENCIMENTO.asDateTime;
                dm2.FDAtualizaContasPagar.Params[12].asFloat := dm2.CdsContas_PagarVALOR.AsFloat;
                dm2.FDAtualizaContasPagar.Params[13].asDateTime := dm2.CdsContas_PagarDT_LANCAMENTO.asDateTime;
                dm2.FDAtualizaContasPagar.Params[14].asDateTime := dm2.CdsContas_PagarDT_PAGAMENTO.asDateTime;
                dm2.FDAtualizaContasPagar.Params[15].asDateTime := dm2.CdsContas_PagarDT_BOLETO.asDateTime;
                dm2.FDAtualizaContasPagar.Params[16].asDateTime := dm2.CdsContas_PagarDT_ENTRADA.asDateTime;
                dm2.FDAtualizaContasPagar.Params[17].asFloat := dm2.CdsContas_PagarVL_PAGAMENTO.AsFloat;
                dm2.FDAtualizaContasPagar.Params[18].asFloat := dm2.CdsContas_PagarVL_JUROS.AsFloat;
                dm2.FDAtualizaContasPagar.Params[19].asFloat := dm2.CdsContas_PagarVL_DESCONTO.AsFloat;
                dm2.FDAtualizaContasPagar.Params[20].asFloat := dm2.CdsContas_PagarVL_SALDO.AsFloat;
                dm2.FDAtualizaContasPagar.Params[21].asString := dm2.CdsContas_PagarNOSSO_NUMERO.asString;
                dm2.FDAtualizaContasPagar.Params[22].asString := dm2.CdsContas_PagarBANCO.asString;
                dm2.FDAtualizaContasPagar.Params[23].asString := dm2.CdsContas_PagarAGENCIA.asString;
                dm2.FDAtualizaContasPagar.Params[24].asString := dm2.CdsContas_PagarCONTA.asString;
                dm2.FDAtualizaContasPagar.Params[25].asString := dm2.CdsContas_PagarHISTORICO.asString;
                dm2.FDAtualizaContasPagar.Params[26].asString := dm2.CdsContas_PagarNR_CHEQUE.asString;
                dm2.FDAtualizaContasPagar.Params[27].asString := dm2.CdsContas_PagarSTATUS.asString;
                dm2.FDAtualizaContasPagar.Params[28].asString := '2';
                dm2.FDAtualizaContasPagar.Params[29].asFloat := dm2.CdsContas_PagarDESPESAFINANCEIRA.asFloat;
                Try
                  dm2.FDAtualizaContasPagar.Execsql(False);
                Except
                  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Contas Pagar - Execução da Procedure');
                End;

                dm2.CdsContas_Pagar.Next;
              end;

          end;
      end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Contas Pagar');
         dm2.CdsContas_Pagar.Close;
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CP ACTIVE';
           dm3.FDSql.Execsql(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;
         Exit;
       end;
   end;
   dm2.CdsContas_Pagar.Close;
   Try
     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CP ACTIVE';
     dm3.FDSql.Execsql(True);

   Except
     on E:Exception do
      begin
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

      end;
   End;
end;


function RecebendoClientes : Boolean;
var i : integer;
LResponse: IResponse;
TJsonClientes :TJSONObject;

begin
   Result := True;
   Try
     dm3.CdsClientes.Close;
     dm3.CdsClientes.CreateDataSet;

      //Processa(110, Filial, 'A');

    TJsonClientes:=TJSONObject.Create;
    LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('clientes/'+FloatToStr(dm.cdfilialparametro))
    .Accept('application/json')
    .Get;


     if LResponse.StatusCode<>200 then
      begin
        Result := False;
        Exit;
      end
      else
      begin

         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES INACTIVE';
           dm3.FDSql.Execsql(True);
         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;

         dm2.CdsClientes.LoadFromJSON(LResponse.Content);
         dm2.CdsClientes.Open;
         if dm2.CdsClientes.RecordCount > 0 then
            begin
               GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Clientes: '+ FloatToStr(dm2.CdsClientes.RecordCount));

               dm2.CdsClientes.First;
               while not dm2.CdsClientes.Eof do
                begin
                  dm2.FDAtualizaClientes.Params[0].AsFloat := dm2.CdsClientesCD_FILIAL.AsFloat;
                  dm2.FDAtualizaClientes.Params[1].AsFloat := dm2.CdsClientesCD_CLIENTE.AsFloat;
                  dm2.FDAtualizaClientes.Params[2].AsFloat := dm2.CdsClientesCD_VENDEDOR.AsFloat;
                  dm2.FDAtualizaClientes.Params[3].AsFloat := dm2.CdsClientesCD_CONVENIO.AsFloat;
                  dm2.FDAtualizaClientes.Params[4].AsString := dm2.CdsClientesNOME.AsString;
                  dm2.FDAtualizaClientes.Params[5].AsString := dm2.CdsClientesENDERECO.AsString;
                  dm2.FDAtualizaClientes.Params[6].AsString := dm2.CdsClientesBAIRRO.AsString;
                  dm2.FDAtualizaClientes.Params[7].AsString := dm2.CdsClientesCIDADE.AsString;
                  dm2.FDAtualizaClientes.Params[8].AsString := dm2.CdsClientesUF.AsString;
                  dm2.FDAtualizaClientes.Params[9].AsString := dm2.CdsClientesCEP.AsString;
                  dm2.FDAtualizaClientes.Params[10].AsString := dm2.CdsClientesCAIXA_POSTAL.AsString;
                  dm2.FDAtualizaClientes.Params[11].AsString := dm2.CdsClientesFONE.AsString;
                  dm2.FDAtualizaClientes.Params[12].AsString := dm2.CdsClientesFAX.AsString;
                  dm2.FDAtualizaClientes.Params[13].AsString := dm2.CdsClientesCONTATO.AsString;
                  dm2.FDAtualizaClientes.Params[14].AsString := dm2.CdsClientesCNPJ.AsString;
                  dm2.FDAtualizaClientes.Params[15].AsString := dm2.CdsClientesINSCRICAO.AsString;
                  dm2.FDAtualizaClientes.Params[16].AsString := dm2.CdsClientesPRACA.AsString;
                  dm2.FDAtualizaClientes.Params[17].AsDate := dm2.CdsClientesDATA_FICHA.AsDateTime;
                  dm2.FDAtualizaClientes.Params[18].AsString := dm2.CdsClientesRG.AsString;
                  dm2.FDAtualizaClientes.Params[19].AsString := dm2.CdsClientesCPF.AsString;
                  dm2.FDAtualizaClientes.Params[20].AsString := dm2.CdsClientesTITULO_ELEITO.AsString;
                  dm2.FDAtualizaClientes.Params[21].AsDate := dm2.CdsClientesDT_NASCIMENTO.AsDateTime;
                  dm2.FDAtualizaClientes.Params[22].AsString := dm2.CdsClientesSEXO.AsString;
                  dm2.FDAtualizaClientes.Params[23].AsString := dm2.CdsClientesESTADO_CIVIL.AsString;
                  dm2.FDAtualizaClientes.Params[24].AsString := dm2.CdsClientesNATURALIDADE.AsString;
                  dm2.FDAtualizaClientes.Params[25].AsString := dm2.CdsClientesFILIACAO.AsString;
                  dm2.FDAtualizaClientes.Params[26].AsFloat := dm2.CdsClientesNUMERO_DEPENDENTES.AsFloat;
                  dm2.FDAtualizaClientes.Params[27].AsString := dm2.CdsClientesCONJUGE.AsString;
                  dm2.FDAtualizaClientes.Params[28].AsString := dm2.CdsClientesDT_NASC_CONJUGE.AsString;
                  dm2.FDAtualizaClientes.Params[29].AsString := dm2.CdsClientesALUGUEL.AsString;
                  dm2.FDAtualizaClientes.Params[30].AsFloat := dm2.CdsClientesVL_ALUGUEL.AsFloat;
                  dm2.FDAtualizaClientes.Params[31].AsString := dm2.CdsClientesTEMPO_RESIDENCIA.AsString;
                  dm2.FDAtualizaClientes.Params[32].AsString := dm2.CdsClientesEMPRESA.AsString;
                  dm2.FDAtualizaClientes.Params[33].AsString := dm2.CdsClientesFONE_COMERCIAL.AsString;
                  dm2.FDAtualizaClientes.Params[34].AsString := dm2.CdsClientesDT_ADMISSAO.AsString;
                  dm2.FDAtualizaClientes.Params[35].AsString := dm2.CdsClientesCEP_COMERCIAL.AsString;
                  dm2.FDAtualizaClientes.Params[36].AsString := dm2.CdsClientesCIDADE_COMERCIAL.AsString;
                  dm2.FDAtualizaClientes.Params[37].AsString := dm2.CdsClientesUF_COMERCIAL.AsString;
                  dm2.FDAtualizaClientes.Params[38].AsString := dm2.CdsClientesFUNCAO.AsString;
                  dm2.FDAtualizaClientes.Params[39].AsString := dm2.CdsClientesEMPRESA_ANTERIOR.AsString;
                  dm2.FDAtualizaClientes.Params[40].AsString := dm2.CdsClientesTEMPO_SERVICO.AsString;
                  dm2.FDAtualizaClientes.Params[41].AsString := dm2.CdsClientesREFERENCIA_COMERCIAL.AsString;
                  dm2.FDAtualizaClientes.Params[42].AsString := dm2.CdsClientesREFERENCIA_BANCARIA.AsString;
                  dm2.FDAtualizaClientes.Params[43].AsString := dm2.CdsClientesCONSULTA_SPC.AsString;
                  dm2.FDAtualizaClientes.Params[44].AsString := dm2.CdsClientesOBSERVACAO_SPC.AsString;
                  dm2.FDAtualizaClientes.Params[45].AsString := dm2.CdsClientesOBSERVACAO_GERAL.AsString;
                  dm2.FDAtualizaClientes.Params[46].AsString := dm2.CdsClientesENDERECO_COBRANCA.AsString;
                  dm2.FDAtualizaClientes.Params[47].AsString := dm2.CdsClientesBAIRRO_COBRANCA.AsString;
                  dm2.FDAtualizaClientes.Params[48].AsString := dm2.CdsClientesCIDADE_COBRANCA.AsString;
                  dm2.FDAtualizaClientes.Params[49].AsString := dm2.CdsClientesUF_COBRANCA.AsString;
                  dm2.FDAtualizaClientes.Params[50].AsString := dm2.CdsClientesCEP_COBRANCA.AsString;
                  dm2.FDAtualizaClientes.Params[51].AsString := dm2.CdsClientesICMS_IPI.AsString;
                  dm2.FDAtualizaClientes.Params[52].AsString := dm2.CdsClientesNOME_MAE.AsString;
                  dm2.FDAtualizaClientes.Params[53].AsFloat := dm2.CdsClientesMES_NASCIMENTO.AsFloat;
                  dm2.FDAtualizaClientes.Params[54].AsFloat := dm2.CdsClientesRENDA.AsFloat;
                  dm2.FDAtualizaClientes.Params[55].AsFloat := dm2.CdsClientesLIMITE_PERCENTUAL.AsFloat;
                  dm2.FDAtualizaClientes.Params[56].AsFloat := dm2.CdsClientesLIMITE_CREDITO.AsFloat;
                  dm2.FDAtualizaClientes.Params[57].AsString := dm2.CdsClientesEMAIL.AsString;
                  dm2.FDAtualizaClientes.Params[58].AsString := dm2.CdsClientesHOMEPAGE.AsString;
                  dm2.FDAtualizaClientes.Params[59].AsString := dm2.CdsClientesMATRICULA.AsString;
                  dm2.FDAtualizaClientes.Params[60].AsFloat := dm2.CdsClientesSALDO.AsFloat;
                  dm2.FDAtualizaClientes.Params[61].AsFloat := dm2.CdsClientesDT_VENCIMENTO.AsFloat;
                  dm2.FDAtualizaClientes.Params[62].AsFloat := dm2.CdsClientesDESCONTO.AsFloat;
                  dm2.FDAtualizaClientes.Params[63].ASDate := dm2.CdsClientesDT_ULTIMA_COMPRA.AsDateTime;
                  dm2.FDAtualizaClientes.Params[64].AsString := dm2.CdsClientesSTATUS.AsString;
                  dm2.FDAtualizaClientes.Params[65].AsString := dm2.CdsClientesREFERENCIA.AsString;
                  dm2.FDAtualizaClientes.Params[66].AsDate := dm2.CdsClientesDT_ALTERACAO.AsDateTime;
                  dm2.FDAtualizaClientes.Params[67].AsString := dm2.CdsClientesCOMPRAOUTRALOJA.AsString;
                  dm2.FDAtualizaClientes.Params[68].AsString := dm2.CdsClientesCARTAOFIDELIDADE.AsString;
                  dm2.FDAtualizaClientes.Params[69].AsString := dm2.CdsClientesENVIADO.AsString;
                  dm2.FDAtualizaClientes.Params[70].AsString := dm2.CdsClientesNUMERO.AsString;
                  dm2.FDAtualizaClientes.Params[71].AsString := dm2.CdsClientesCOMPLEMENTO.AsString;
                  dm2.FDAtualizaClientes.Params[72].AsString := dm2.CdsClientesCD_MUNICIPIO.AsString;
                  dm2.FDAtualizaClientes.Params[73].AsString := dm2.CdsClientesCD_PAIS.AsString;
                  dm2.FDAtualizaClientes.Params[74].AsFloat := dm2.CdsClientesID_PERFIL_CLIENTE.AsFloat;
                  Try
                    dm2.FDAtualizaClientes.Execsql(False);
                  Except
                    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Clientes - Execução da Procedure');
                  End;

                  dm2.CdsClientes.Next;
                end;
            end;

           dm2.CdsClientes.Close;
           Try
             dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
             dm3.FDSql.Execsql(True);
           Except
             on E:Exception do
              begin
               GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
              end;
           End;
      end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Clientes');
         dm3.CdsClientes.Close;

         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
           dm3.FDSql.Execsql(True);
         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            end;
         End;
         Exit;
       end;
   end;
end;


function RecebendoLimiteSaldoClientes : Boolean;
var i : integer;
     LResponse: IResponse;
  TJsonSaldoClientes :TJSONObject;
begin
  Result := True;

   Try
     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES INACTIVE';
     dm3.FDSql.Execsql(True);
   Except
     on E:Exception do
      begin
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
      end;
   End;

   Try
     dm3.CdsLimiteSaldoClientes.Close;
     dm3.CdsLimiteSaldoClientes.CreateDataSet;

      //Processa(151, Filial, 'A');

     TJsonSaldoClientes:=TJSONObject.Create;
     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
    .Resource('compras/'+filial)
    .Accept('application/json')
    .Get;

     if LResponse.StatusCode <> 200 then
      begin
        Result := False;
        Try
          dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
          dm3.FDSql.Execsql(True);
        Except
          on E:Exception do
           begin
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
           end;
        End;
        Exit;
      end
      else
      begin
         dm3.CdsLimiteSaldoClientes.LoadFromJSON(LResponse.Content);
         dm3.CdsLimiteSaldoClientes.Open;
         if dm3.CdsLimiteSaldoClientes.RecordCount > 0 then
            begin
               GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Limite e Saldo dos Clientes: '+ FloatToStr(dm3.CdsLimiteSaldoClientes.RecordCount));
               dm3.CdsLimiteSaldoClientes.First;
               while not dm3.CdsLimiteSaldoClientes.Eof do
                begin
                  dm3.QryLimiteSaldoClientes.Close;
                  dm3.QryLimiteSaldoClientes.Params[0].AsFloat := dm3.CdsLimiteSaldoClientesCD_CLIENTE.AsFloat;
                  dm3.QryLimiteSaldoClientes.Open;

                  if dm3.QryLimiteSaldoClientes.RecordCount > 0 then
                   begin
                     dm3.QryLimiteSaldoClientes.Edit;
                     for i := 0 to dm3.QryLimiteSaldoClientes.FieldCount - 1 do
                        if dm3.QryLimiteSaldoClientes.Fields[i].FieldName <> 'CD_CLIENTE' then
                           dm3.QryLimiteSaldoClientes.Fields[i].Value := dm3.CdsLimiteSaldoClientes.Fields[i].Value;
                     dm3.QryLimiteSaldoClientes.Post;

                     dm3.QryLimiteSaldoClientes.ApplyUpdates(0);

                   end;
                  dm3.CdsLimiteSaldoClientes.Next;
                end;
            end;

        dm3.CdsLimiteSaldoClientes.Close;
        dm3.QryLimiteSaldoClientes.Close;
      end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Clientes');
         dm3.CdsLimiteSaldoClientes.Close;
         dm3.QryLimiteSaldoClientes.Close;
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
           dm3.FDSql.Execsql(True);
         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            end;
         End;
         Exit;
       end;
   end;
   Try
     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE';
     dm3.FDSql.Execsql(True);
   Except
     on E:Exception do
      begin
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
      end;
   End;
end;


procedure RecebendoGrupos;
var
  i : integer;
  Dados : Variant;
begin
   Try
     // Atualização dos grupos na filial
     Try
       dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_GRUPOS INACTIVE';

       dm3.FDSql.ExecFD(True);

     Except
       on E:Exception do
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

        end;
     End;

     dm3.CdsGrupos.Close;
     dm3.CdsGrupos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(100, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsGrupos.Data := Dados;
     dm3.CdsGrupos.Open; // virtual

     dm3.CdsGrupos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos: '+ FloatToStr(dm3.CdsGrupos.RecordCount));
     while not dm3.CdsGrupos.Eof do
      begin
          dm3.FDAtualizaGrupos.Params[0].AsFloat := dm3.CdsGruposCD_GRUPO.AsFloat;
          dm3.FDAtualizaGrupos.Params[1].AsString := dm3.CdsGruposDESCRICAO.AsString;
          dm3.FDAtualizaGrupos.Params[2].AsFloat := dm3.CdsGruposTX_MARCACAO.AsFloat;
          dm3.FDAtualizaGrupos.Params[3].AsString := dm3.CdsGruposDESCONTO.AsString;
          dm3.FDAtualizaGrupos.Params[4].AsFloat := dm3.CdsGruposTX_DESCONTO.AsFloat;
          dm3.FDAtualizaGrupos.Params[5].AsFloat := dm3.CdsGruposTX_DESCONTO_MAXIMO.AsFloat;
          dm3.FDAtualizaGrupos.Params[6].AsFloat := dm3.CdsGruposTX_COMISSAO.AsFloat;
          dm3.FDAtualizaGrupos.Params[7].AsFloat := dm3.CdsGruposDIAS_EST_MIN.AsFloat;
          dm3.FDAtualizaGrupos.Params[8].AsString := dm3.CdsGruposTIPO.AsString;
          dm3.FDAtualizaGrupos.Params[9].AsDateTime := dm3.CdsGruposDT_ALTERACAO.AsDateTime;
          dm3.FDAtualizaGrupos.Params[10].AsFloat := dm3.CdsGruposNPRODUTOS.AsFloat;
          dm3.FDAtualizaGrupos.Params[11].AsFloat := dm3.CdsGruposNITENS.AsFloat;
          dm3.FDAtualizaGrupos.Params[12].AsFloat := dm3.CdsGruposVPRODUTOS.AsFloat;
          dm3.FDAtualizaGrupos.Params[13].AsFloat := dm3.CdsGruposCPRODUTOS.AsFloat;
          dm3.FDAtualizaGrupos.Params[14].AsString := dm3.CdsGruposEXIGERECEITA.AsString;
          dm3.FDAtualizaGrupos.Params[15].AsString := dm3.CdsGruposVENDEESTOQUENEGATIVO.AsString;
          dm3.FDAtualizaGrupos.Params[16].AsString := dm3.CdsGruposPEDECRM.AsString;
          dm3.FDAtualizaGrupos.Params[17].AsFloat := dm3.CdsGruposMETA.AsFloat;
          dm3.FDAtualizaGrupos.Params[18].AsString := dm3.CdsGruposENVIADO.AsString;
          Try
            dm3.FDAtualizaGrupos.ExecFD(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos - Execução da Procedure');
          End;

          dm3.CdsGrupos.Next;
      end;

     dm3.CdsGrupos.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos');
         dm3.CdsGrupos.Close;

         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_GRUPOS ACTIVE';

           dm3.FDSql.ExecFD(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;

         Exit;
       end;
   end;
  Try
    dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_GRUPOS ACTIVE';

    dm3.FDSql.ExecFD(True);

  Except
    on E:Exception do
     begin
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

     end;
  End;
end;


procedure RecebendoSubGrupos;
var
  i : integer;
  Dados : Variant;
begin
   Try
     // Atualização dos subgrupos na filial
     Try
       dm3.FDSql.sql.text := 'ALTER TRIGGER SUBGRUPOS_BI0 INACTIVE';

       dm3.FDSql.ExecFD(True);

     Except
       on E:Exception do
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

        end;
     End;

     dm3.CdsSubGrupos.Close;
     dm3.CdsSubGrupos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(135, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsSubGrupos.Data := Dados;
     dm3.CdsSubGrupos.Open; // virtual

     dm3.CdsSubGrupos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo SubGrupos: '+ FloatToStr(dm3.CdsSubGrupos.RecordCount));
     while not dm3.CdsSubGrupos.Eof do
      begin
          dm3.FDAtualizaSubGrupos.Params[0].AsFloat := dm3.CdsSubGruposCD_SUBGRUPO.AsFloat;
          dm3.FDAtualizaSubGrupos.Params[1].AsFloat := dm3.CdsSubGruposCD_GRUPO.AsFloat;
          dm3.FDAtualizaSubGrupos.Params[2].AsString := dm3.CdsSubGruposDESCRICAO.AsString;
          dm3.FDAtualizaSubGrupos.Params[3].AsDateTime := dm3.CdsSubGruposDT_ALTERACAO.AsDateTime;
          dm3.FDAtualizaSubGrupos.Params[4].AsString := dm3.CdsSubGruposENVIADO.AsString;
          Try
            dm3.FDAtualizaSubGrupos.ExecFD(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de SubGrupos - Execução da Procedure');
          End;

          dm3.CdsSubGrupos.Next;
      end;

     dm3.CdsSubGrupos.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de SubGrupos');
         dm3.CdsSubGrupos.Close;

         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER SUBGRUPOS_BI0 ACTIVE';

           dm3.FDSql.ExecFD(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;

         Exit;
       end;
   end;
  Try
    dm3.FDSql.sql.text := 'ALTER TRIGGER SUBGRUPOS_BI0 ACTIVE';

    dm3.FDSql.ExecFD(True);

  Except
    on E:Exception do
     begin
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

     end;
  End;
end;

procedure RecebendoLaboratorios;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualização dos laboratorios na filial
     dm3.CdsLaboratorios.Close;
     dm3.CdsLaboratorios.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(101, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsLaboratorios.Data := Dados;
     dm3.CdsLaboratorios.Open; // virtual

     dm3.CdsLaboratorios.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Laboratorios: '+ FloatToStr(dm3.CdsLaboratorios.RecordCount));
     while not dm3.CdsLaboratorios.Eof do
      begin
        dm3.FDAtualizaLaboratorios.Params[0].AsFloat := dm3.CdsLaboratoriosCD_LABORATORIO.AsFloat;
        dm3.FDAtualizaLaboratorios.Params[1].AsFloat := dm3.CdsLaboratoriosID_AREA.AsFloat;
        dm3.FDAtualizaLaboratorios.Params[2].AsString := dm3.CdsLaboratoriosNOME.AsString;
        dm3.FDAtualizaLaboratorios.Params[3].AsString := dm3.CdsLaboratoriosRAZAO.AsString;
        dm3.FDAtualizaLaboratorios.Params[4].AsString := dm3.CdsLaboratoriosCNPJ.AsString;
        dm3.FDAtualizaLaboratorios.Params[5].AsString := dm3.CdsLaboratoriosENDERECO.AsString;
        dm3.FDAtualizaLaboratorios.Params[6].AsString := dm3.CdsLaboratoriosCIDADE.AsString;
        dm3.FDAtualizaLaboratorios.Params[7].AsString := dm3.CdsLaboratoriosFONE.AsString;
        dm3.FDAtualizaLaboratorios.Params[8].AsString := dm3.CdsLaboratoriosCONTATO.AsString;
        dm3.FDAtualizaLaboratorios.Params[9].AsFloat := dm3.CdsLaboratoriosTX_DESCONTO.AsFloat;
        dm3.FDAtualizaLaboratorios.Params[10].AsString := dm3.CdsLaboratoriosCONTROLE.AsString;
        dm3.FDAtualizaLaboratorios.Params[11].AsDate := dm3.CdsLaboratoriosDT_ALTERACAO.AsDateTime;
        dm3.FDAtualizaLaboratorios.Params[12].AsFloat := dm3.CdsLaboratoriosNPRODUTOS.AsFloat;
        dm3.FDAtualizaLaboratorios.Params[13].AsFloat := dm3.CdsLaboratoriosNITENS.AsFloat;
        dm3.FDAtualizaLaboratorios.Params[14].AsFloat := dm3.CdsLaboratoriosVPRODUTOS.AsFloat;
        dm3.FDAtualizaLaboratorios.Params[15].AsFloat := dm3.CdsLaboratoriosCPRODUTOS.AsFloat;
        dm3.FDAtualizaLaboratorios.Params[16].AsString := dm3.CdsLaboratoriosENVIADO.AsString;
        Try
          dm3.FDAtualizaLaboratorios.ExecFD(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Laboratorios - Execução da Procedure');
        End;

        dm3.CdsLaboratorios.Next;
      end;

     dm3.CdsLaboratorios.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Laboratorios');
         dm3.CdsLaboratorios.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoVendedores;
var i : integer;
Dados : Variant;
begin
   dm3.CdsVendedores.Close;
   dm3.CdsVendedores.CreateDataSet;
   Try
     // Atualiza vendedores
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(104, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsVendedores.Data := Dados;
     dm3.CdsVendedores.Open; // virtual

     dm3.CdsVendedores.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Vendedores: '+ FloatToStr(dm3.CdsVendedores.RecordCount));
     while not dm3.CdsVendedores.Eof do
      begin
        dm3.FDAtualizaVendedores.Params[0].AsFloat   := dm3.CdsVendedoresCD_VENDEDOR.AsFloat;
        dm3.FDAtualizaVendedores.Params[1].AsFloat   := dm3.CdsVendedoresCD_FILIAL.AsFloat;
        dm3.FDAtualizaVendedores.Params[2].AsDate    := dm3.CdsVendedoresDT_ADMISSAO.AsDateTime;
        dm3.FDAtualizaVendedores.Params[3].AsDate    := dm3.CdsVendedoresDT_NASCIMENTO.AsDateTime;
        dm3.FDAtualizaVendedores.Params[4].AsString  := dm3.CdsVendedoresTIPO_FUNCIONARIO.AsString;
        dm3.FDAtualizaVendedores.Params[5].AsString  := dm3.CdsVendedoresCODIGO_BARRAS.AsString;
        dm3.FDAtualizaVendedores.Params[6].AsString  := dm3.CdsVendedoresNOME.AsString;
        dm3.FDAtualizaVendedores.Params[7].AsString  := dm3.CdsVendedoresRUA.AsString;
        dm3.FDAtualizaVendedores.Params[8].AsString  := dm3.CdsVendedoresBAIRRO.AsString;
        dm3.FDAtualizaVendedores.Params[9].AsString  := dm3.CdsVendedoresCIDADE.AsString;
        dm3.FDAtualizaVendedores.Params[10].AsString := dm3.CdsVendedoresUF.AsString;
        dm3.FDAtualizaVendedores.Params[11].AsString := dm3.CdsVendedoresCEP.AsString;
        dm3.FDAtualizaVendedores.Params[12].AsString := dm3.CdsVendedoresFONE.AsString;
        dm3.FDAtualizaVendedores.Params[13].AsString := dm3.CdsVendedoresREFERENCIA.AsString;
        dm3.FDAtualizaVendedores.Params[14].AsString := dm3.CdsVendedoresRG.AsString;
        dm3.FDAtualizaVendedores.Params[15].AsString := dm3.CdsVendedoresCPF.AsString;
        dm3.FDAtualizaVendedores.Params[16].AsString := dm3.CdsVendedoresJORNADA.AsString;
        dm3.FDAtualizaVendedores.Params[17].AsString := dm3.CdsVendedoresINTERVALO.AsString;
        dm3.FDAtualizaVendedores.Params[18].AsString := dm3.CdsVendedoresREPOUSO.AsString;
        dm3.FDAtualizaVendedores.Params[19].AsString := dm3.CdsVendedoresNR_REGISTRO.AsString;
        dm3.FDAtualizaVendedores.Params[20].AsString := dm3.CdsVendedoresCTPS.AsString;
        dm3.FDAtualizaVendedores.Params[21].AsString := dm3.CdsVendedoresFUNCAO.AsString;
        dm3.FDAtualizaVendedores.Params[22].AsFloat  := dm3.CdsVendedoresSALARIO.AsFloat;
        dm3.FDAtualizaVendedores.Params[23].AsFloat  := dm3.CdsVendedoresTX_COMISSAO.AsFloat;
        dm3.FDAtualizaVendedores.Params[24].AsFloat  := dm3.CdsVendedoresCOMISSAO.AsFloat;
        dm3.FDAtualizaVendedores.Params[25].AsFloat  := dm3.CdsVendedoresVENDA.AsFloat;
        dm3.FDAtualizaVendedores.Params[26].AsString := dm3.CdsVendedoresENVIADO.AsString;
        dm3.FDAtualizaVendedores.Params[27].AsString := dm3.CdsVendedoresSEXO.AsString;
        dm3.FDAtualizaVendedores.Params[28].AsString := dm3.CdsVendedoresESTADO_CIVIL.AsString;
        dm3.FDAtualizaVendedores.Params[29].AsString := dm3.CdsVendedoresNATURALIDADE.AsString;
        dm3.FDAtualizaVendedores.Params[30].AsString := dm3.CdsVendedoresCONJUGE.AsString;
        dm3.FDAtualizaVendedores.Params[31].AsDate   := dm3.CdsVendedoresDT_NASC_CONJUGE.AsDateTime;
        dm3.FDAtualizaVendedores.Params[32].AsFloat  := dm3.CdsVendedoresNUM_DEPEND.AsFloat;
        dm3.FDAtualizaVendedores.Params[33].AsString := dm3.CdsVendedoresNOMEMAE.AsString;
        dm3.FDAtualizaVendedores.Params[34].AsString := dm3.CdsVendedoresNOMEPAI.AsString;
        dm3.FDAtualizaVendedores.Params[35].AsString := dm3.CdsVendedoresEMPRESA_ANTERIOR.AsString;
        dm3.FDAtualizaVendedores.Params[36].AsString := dm3.CdsVendedoresTEMPO_SERVICO.AsString;
        dm3.FDAtualizaVendedores.Params[37].AsString := dm3.CdsVendedoresREFERENCIA_COMERCIAL.AsString;
        dm3.FDAtualizaVendedores.Params[38].AsString := dm3.CdsVendedoresREFERENCIA_BANCARIA.AsString;
        dm3.FDAtualizaVendedores.Params[39].AsString := dm3.CdsVendedoresDESCONTO.AsString;
        dm3.FDAtualizaVendedores.Params[40].AsString := dm3.CdsVendedoresCOMISSAO_MEDICAMENTOS.AsString;
        dm3.FDAtualizaVendedores.Params[41].AsString := dm3.CdsVendedoresCOMISSAO_BONIFICADOS.AsString;
        dm3.FDAtualizaVendedores.Params[42].AsString := dm3.CdsVendedoresCOMISSAO_PERFUMARIA.AsString;
        dm3.FDAtualizaVendedores.Params[43].AsString := dm3.CdsVendedoresCOMISSAO_OUTROS.AsString;
        dm3.FDAtualizaVendedores.Params[44].AsFloat  := dm3.CdsVendedoresCOTA.AsFloat;
        dm3.FDAtualizaVendedores.Params[45].AsString := dm3.CdsVendedoresSENHA.AsString;
        dm3.FDAtualizaVendedores.Params[46].AsDate   := dm3.CdsVendedoresDT_ALTERACAO.AsDateTime;
        dm3.FDAtualizaVendedores.Params[47].AsString := dm3.CdsVendedoresSTATUS.AsString;
        dm3.FDAtualizaVendedores.Params[48].AsString := dm3.CdsVendedoresVENDEOUTRALOJA.AsString;
        dm3.FDAtualizaVendedores.Params[49].AsString := dm3.CdsVendedoresUSUARIOFARMACIAPOPULAR.AsString;
        dm3.FDAtualizaVendedores.Params[50].AsString := dm3.CdsVendedoresSENHAFARMACIAPOPULAR.AsString;
        Try
          dm3.FDAtualizaVendedores.ExecFD(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Vendedores - Execução da Procedure');
        End;

        dm3.CdsVendedores.Next;
      end;

     dm3.CdsVendedores.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Vendedores');
         dm3.CdsVendedores.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoVendedoresClasses;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza  Vendedores_Classes
     dm3.CdsVendedores_Classes.Close;
     dm3.CdsVendedores_Classes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(123, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsVendedores_Classes.Data := Dados;
     dm3.CdsVendedores_Classes.Open; // virtual

     dm3.CdsVendedores_Classes.First;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Recebendo Vendedores_Classes: '+ FloatToStr(dm3.CdsVendedores_Classes.RecordCount));
     while not dm3.CdsVendedores_Classes.Eof do
      begin
        dm3.QryVendedoresClasses.Close;
        dm3.QryVendedoresClasses.Params[0].AsFloat := dm3.CdsVendedores_ClassesCD_VENDEDOR.AsFloat;
        dm3.QryVendedoresClasses.Params[1].AsFloat := dm3.CdsVendedores_ClassesCD_CLASSE.AsFloat;
        dm3.QryVendedoresClasses.Open;
        if dm3.QryVendedoresClasses.RecordCount = 0 then
           dm3.QryVendedoresClasses.Append
        else
           dm3.QryVendedoresClasses.Edit;
        for i := 0 to dm3.QryVendedoresClasses.FieldCount - 1 do
           dm3.QryVendedoresClasses.Fields[i].Value := dm3.CdsVendedores_Classes.Fields[i].Value;
        dm3.QryVendedoresClasses.Post;

        dm3.QryVendedoresClasses.ApplyUpdates(0);

        dm3.CdsVendedores_Classes.Next;
      end;
     dm3.CdsVendedores_Classes.Close;
     dm3.QryVendedoresClasses.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Vendedores Classes');
         dm3.CdsVendedores_Classes.Close;
         dm3.QryVendedoresClasses.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoConveniosClasses;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza  Convenios_Classes
     dm3.CdsConvenios_Classes.Close;
     dm3.CdsConvenios_Classes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(124, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsConvenios_Classes.Data := Dados;
     dm3.CdsConvenios_Classes.Open; // virtual


     dm3.QryConveniosClasses.Open;


     dm3.CdsConvenios_Classes.First;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Recebendo Convenios_Classes: '+ FloatToStr(dm3.CdsConvenios_Classes.RecordCount));
     while not dm3.CdsConvenios_Classes.Eof do
      begin
        dm3.QryConveniosClasses.Close;
        dm3.QryConveniosClasses.Params[0].AsFloat := dm3.CdsConvenios_ClassesCD_CONVENIO.AsFloat;
        dm3.QryConveniosClasses.Params[1].AsFloat := dm3.CdsConvenios_ClassesCD_CLASSE.AsFloat;
        dm3.QryConveniosClasses.Open;
        if dm3.QryConveniosClasses.RecordCount = 0 then
           dm3.QryConveniosClasses.Append
        else
           dm3.QryConveniosClasses.Edit;
         for i := 0 to dm3.QryConveniosClasses.FieldCount - 1 do
            dm3.QryConveniosClasses.Fields[i].Value := dm3.CdsConvenios_Classes.Fields[i].Value;

         dm3.QryConveniosClasses.ApplyUpdates(0);

         dm3.CdsConvenios_Classes.Next;
      end;
     dm3.CdsConvenios_Classes.Close;
     dm3.QryConveniosClasses.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Convenios Classes');
         dm3.CdsConvenios_Classes.Close;
         dm3.QryConveniosClasses.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoConveniosGrupos;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza  Convenios_Grupos
     dm3.CdsConvenios_Grupos.Close;
     dm3.CdsConvenios_Grupos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(136, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsConvenios_Grupos.Data := Dados;
     dm3.CdsConvenios_Grupos.Open; // virtual


     dm3.QryConveniosGrupos.Open;


     dm3.CdsConvenios_Grupos.First;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Recebendo Convenios_Grupos: '+ FloatToStr(dm3.CdsConvenios_Grupos.RecordCount));
     while not dm3.CdsConvenios_Grupos.Eof do
      begin
        dm3.QryConveniosGrupos.Close;
        dm3.QryConveniosGrupos.Params[0].AsFloat := dm3.CdsConvenios_GruposCD_CONVENIO.AsFloat;
        dm3.QryConveniosGrupos.Params[1].AsFloat := dm3.CdsConvenios_GruposCD_GRUPO.AsFloat;
        dm3.QryConveniosGrupos.Open;
        if dm3.QryConveniosGrupos.RecordCount = 0 then
           dm3.QryConveniosGrupos.Append
        else
           dm3.QryConveniosGrupos.Edit;
         for i := 0 to dm3.QryConveniosGrupos.FieldCount - 1 do
            dm3.QryConveniosGrupos.Fields[i].Value := dm3.CdsConvenios_Grupos.Fields[i].Value;

         dm3.QryConveniosGrupos.ApplyUpdates(0);

         dm3.CdsConvenios_Grupos.Next;
      end;
     dm3.CdsConvenios_Grupos.Close;
     dm3.QryConveniosGrupos.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Convenios Grupos');
         dm3.CdsConvenios_Grupos.Close;
         dm3.QryConveniosGrupos.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoContasPagarCompras;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza  Convenios_Grupos
     dm3.CdsContasPagarCompras.Close;
     dm3.CdsContasPagarCompras.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(137, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsContasPagarCompras.Data := Dados;
     dm3.CdsContasPagarCompras.Open; // virtual


     dm3.QryContasPagarCompras.Open;


     dm3.CdsContasPagarCompras.First;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Recebendo ContasPagarCompras: '+ FloatToStr(dm3.CdsContasPagarCompras.RecordCount));
     while not dm3.CdsContasPagarCompras.Eof do
      begin
        dm3.QryContasPagarCompras.Close;
        dm3.QryContasPagarCompras.Params[0].AsFloat := dm3.CdsContasPagarComprasCD_CONTAS_PAGAR.AsFloat;
        dm3.QryContasPagarCompras.Params[1].AsFloat := dm3.CdsContasPagarComprasCD_COMPRAS.AsFloat;
        dm3.QryContasPagarCompras.Open;
        if dm3.QryContasPagarCompras.RecordCount = 0 then
           dm3.QryContasPagarCompras.Append
        else
           dm3.QryContasPagarCompras.Edit;
         for i := 0 to dm3.QryContasPagarCompras.FieldCount - 1 do
            dm3.QryContasPagarCompras.Fields[i].Value := dm3.CdsContasPagarCompras.Fields[i].Value;

         dm3.QryContasPagarCompras.ApplyUpdates(0);

         dm3.CdsContasPagarCompras.Next;
      end;
     dm3.CdsContasPagarCompras.Close;
     dm3.QryContasPagarCompras.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ContasPagarCompras');
         dm3.CdsContasPagarCompras.Close;
         dm3.QryContasPagarCompras.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoProdutosConvenioPBM;
var i : integer;
Dados : Variant;
begin
   Try
     dm3.CdsProdutosConvenioPBM.Close;
     dm3.CdsProdutosConvenioPBM.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(138, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsProdutosConvenioPBM.Data := Dados;
     dm3.CdsProdutosConvenioPBM.Open; // virtual

     dm3.CdsProdutosConvenioPBM.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ProdutosConvenioPBM: '+ FloatToStr(dm3.CdsProdutosConvenioPBM.RecordCount));
     while not dm3.CdsProdutosConvenioPBM.Eof do
      begin
        dm3.FDAtualizaProdutosConvenioPBM.Params[0].AsFloat := dm3.CdsProdutosConvenioPBMID_PRODUTOSCONVENIOPBM.AsFloat;
        dm3.FDAtualizaProdutosConvenioPBM.Params[1].AsFloat := dm3.CdsProdutosConvenioPBMID_CONVENIOPBM.AsFloat;
        dm3.FDAtualizaProdutosConvenioPBM.Params[2].AsFloat := dm3.CdsProdutosConvenioPBMID_PRODUTO.AsFloat;
        dm3.FDAtualizaProdutosConvenioPBM.Params[3].AsString := dm3.CdsProdutosConvenioPBMENVIADO.AsString;
        Try
          dm3.FDAtualizaProdutosConvenioPBM.ExecFD(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ProdutosConvenioPBM - Execução da Procedure');
        End;

        dm3.CdsProdutosConvenioPBM.Next;
      end;

     dm3.CdsProdutosConvenioPBM.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ProdutosConvenioPBM');
         dm3.CdsProdutosConvenioPBM.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoMetasFiliais;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Cepedid1.dat
     dm3.CdsMetasFiliais.Close;
     dm3.CdsMetasFiliais.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(127, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsMetasFiliais.Data := Dados;
     dm3.CdsMetasFiliais.Open; // virtual
     dm3.CdsMetasFiliais.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasFiliais: '+ FloatToStr(dm3.CdsMetasFiliais.RecordCount));
     while not dm3.CdsMetasFiliais.Eof do
      begin
        dm3.QryMetasFiliais.Close;
        dm3.QryMetasFiliais.Params[0].AsFloat := dm3.CdsMetasFiliaisID_META.AsFloat;
        dm3.QryMetasFiliais.Open;
        if dm3.QryMetasFiliais.RecordCount = 0 then
           dm3.QryMetasFiliais.Append
        else
           dm3.QryMetasFiliais.Edit;
        if dm3.QryMetasFiliais.State in [dsInsert, dsedit] then
          begin
           for i := 0 to dm3.QryMetasFiliais.FieldCount - 1 do
               dm3.QryMetasFiliais.Fields[i].Value := dm3.CdsMetasFiliais.Fields[i].Value;

           dm3.QryMetasFiliais.Post;

           dm3.QryMetasFiliais.ApplyUpdates(0);

         end;
        dm3.CdsMetasFiliais.Next;
      end;
     dm3.CdsMetasFiliais.Close;
     dm3.QryMetasFiliais.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Metas Filiais');
         dm3.CdsMetasFiliais.Close;
         dm3.QryMetasFiliais.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoMetasVendedores;
var i : integer;
Dados : Variant;
begin
   Try
     dm3.CdsMetasVendedores.Close;
     dm3.CdsMetasVendedores.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(128, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsMetasVendedores.Data := Dados;
     dm3.CdsMetasVendedores.Open; // virtual
     dm3.CdsMetasVendedores.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasVendedores: ' + FloatToStr(dm3.CdsMetasVendedores.RecordCount));
     while not dm3.CdsMetasVendedores.Eof do
      begin
        dm3.QryMetasVendedores.Close;
        dm3.QryMetasVendedores.Params[0].AsFloat := dm3.CdsMetasVendedoresID_META.AsFloat;
        dm3.QryMetasVendedores.Params[1].AsFloat := dm3.CdsMetasVendedoresCD_VENDEDOR.AsFloat;
        dm3.QryMetasVendedores.Open;
        if dm3.QryMetasVendedores.RecordCount = 0 then
           dm3.QryMetasVendedores.Append
        else
           dm3.QryMetasVendedores.Edit;
        if dm3.QryMetasVendedores.State in [dsInsert, dsedit] then
          begin
           for i := 0 to dm3.QryMetasVendedores.FieldCount - 1 do
               dm3.QryMetasVendedores.Fields[i].Value := dm3.CdsMetasVendedores.Fields[i].Value;

           dm3.QryMetasVendedores.Post;

           dm3.QryMetasVendedores.ApplyUpdates(0);

         end;
        dm3.CdsMetasVendedores.Next;
      end;
     dm3.CdsMetasVendedores.Close;
     dm3.QryMetasVendedores.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Metas Vendedores');
         dm3.CdsMetasVendedores.Close;
         dm3.QryMetasVendedores.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoClasses;
var i : integer;
Dados : Variant;
begin
   Try
     dm3.CdsClasses.Close;
     dm3.CdsClasses.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(120, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsClasses.Data := Dados;
     dm3.CdsClasses.Open; // virtual

     dm3.CdsClasses.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Classes: '+ FloatToStr(dm3.CdsClasses.RecordCount));
     while not dm3.CdsClasses.Eof do
      begin
        dm3.FDAtualizaClasses.Params[0].AsFloat := dm3.CdsClassesCD_CLASSE.AsFloat;
        dm3.FDAtualizaClasses.Params[1].AsString := dm3.CdsClassesDESCRICAO.AsString;
        dm3.FDAtualizaClasses.Params[2].AsString := dm3.CdsClassesTIPO.AsString;
        dm3.FDAtualizaClasses.Params[3].AsString := dm3.CdsClassesVENDEESTOQUENEGATIVO.AsString;
        dm3.FDAtualizaClasses.Params[4].AsDate := dm3.CdsClassesDT_CALCULOCURVA.AsDateTime;
        dm3.FDAtualizaClasses.Params[5].AsInteger := dm3.CdsClassesFREQUENCIA.AsInteger;
        dm3.FDAtualizaClasses.Params[6].AsFloat := dm3.CdsClassesNPRODUTOS.AsFloat;
        dm3.FDAtualizaClasses.Params[7].AsFloat := dm3.CdsClassesNITENS.AsFloat;
        dm3.FDAtualizaClasses.Params[8].AsFloat := dm3.CdsClassesVPRODUTOS.AsFloat;
        dm3.FDAtualizaClasses.Params[9].AsFloat := dm3.CdsClassesCPRODUTOS.AsFloat;
        dm3.FDAtualizaClasses.Params[10].AsString := dm3.CdsClassesCONTROLALOTES.AsString;
        dm3.FDAtualizaClasses.Params[11].AsString := dm3.CdsClassesENVIADO.AsString;
        Try
          dm3.FDAtualizaClasses.ExecFD(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Classes - Execução da Procedure');
        End;

        dm3.CdsClasses.Next;
      end;

     dm3.CdsClasses.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Classes');
         dm3.CdsClasses.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoClassesDeletadas;
var Dados : Variant;
begin
  //busca na matriz as classes deletadas
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CLASSES');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Classes Deletadas - ' + FloattoStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'CLASSES';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_CLASSE';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Classes Deletadas');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoContasPagarComprasDeletadas;
var Dados : Variant;
begin
  //busca na matriz as ContasPagarCompras deletadas
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CONTAS_PAGAR_COMPRAS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ContasPagarCompras Deletadas - ' + FloattoStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDSql.sql.text := 'DELETE FROM COMTAS_PAGAR_COMPRAS WHERE CD_CONTAS_PAGAR = ' + dm3.CdsDeletadosCAMPO1.AsString +
                                                 ' AND CD_COMPRAS = ' + dm3.CdsDeletadosCAMPO2.AsString;
            dm3.FDSql.ExecFD(True);

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ContasPagarCompras Deletadas');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoContasPagarDeletadas;
var Dados : Variant;
begin
  //busca na matriz as Contas a Pagar deletadas
   Try
     // Atualiza Contas a Pagar Deletadas
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CONTAS_PAGAR');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Contas a Pagar Deletadas - ' + FloattoStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'CONTAS_PAGAR';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_CONTAS_PAGAR';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Contas a Pagar Deletadas');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoUsuariosDeletados;
var Dados : Variant;
begin
  //busca na matriz as usuarios deletados
   Try
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'USUARIOS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Usuarios Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin


            dm3.FDAtualizaDeletados.Params[0].AsString := 'USUARIOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_USUARIO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.FDAtualizaDeletados.Params[0].AsString := 'USUARIOS_GRUPOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_USUARIO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;


            dm3.CdsDeletados.Next;
          end;
      end;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Usuarios Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoFamilias;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Classes
     dm3.CdsFamilias.Close;
     dm3.CdsFamilias.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(129, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsFamilias.Data := Dados;
     dm3.CdsFamilias.Open; // virtual

     dm3.CdsFamilias.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Familias - ' + FloattoStr(dm3.CdsFamilias.RecordCount));
     while not dm3.CdsFamilias.Eof do
      begin
         dm3.FDAtualizaFamilias.Params[0].AsFloat := dm3.CdsFamiliasID_FAMILIA.AsFloat;
         dm3.FDAtualizaFamilias.Params[1].AsString := dm3.CdsFamiliasDESCRICAO.AsString;
         dm3.FDAtualizaFamilias.Params[2].AsString := dm3.CdsFamiliasSTATUS.AsString;
         dm3.FDAtualizaFamilias.Params[3].AsDate := dm3.CdsFamiliasDT_ALTERACAO.AsDateTime;
         dm3.FDAtualizaFamilias.Params[4].AsString := dm3.CdsFamiliasALTERAPRECOFAMILIA.AsString;
         dm3.FDAtualizaFamilias.Params[5].AsString := dm3.CdsFamiliasENVIADO.AsString;
         Try
           dm3.FDAtualizaFamilias.ExecFD(False);
         Except
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Familias - Execução da Procedure');
         End;

         dm3.CdsFamilias.Next;
      end;

     dm3.CdsFamilias.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Familias');
         dm3.CdsFamilias.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoFamiliasDeletadas;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FAMILIAS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Familias Deletadas - ' + FloatToStr( dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'FAMILIAS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'ID_FAMILIA';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Familias Deletadas');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoGruposBalanco;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Grupos
     dm3.CdsGruposBalanco.Close;
     dm3.CdsGruposBalanco.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(130, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsGruposBalanco.Data := Dados;
     dm3.CdsGruposBalanco.Open; // virtual

     dm3.CdsGruposBalanco.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Balanco - ' + FloattoStr(dm3.CdsGruposBalanco.RecordCount));
     while not dm3.CdsGruposBalanco.Eof do
      begin
         dm3.FDAtualizaGruposBalanco.Params[0].AsFloat := dm3.CdsGruposBalancoCD_GRUPOBALANCO.AsFloat;
         dm3.FDAtualizaGruposBalanco.Params[1].AsString := dm3.CdsGruposBalancoDESCRICAO.AsString;
         dm3.FDAtualizaGruposBalanco.Params[2].AsString := dm3.CdsGruposBalancoSTATUS.AsString;
         dm3.FDAtualizaGruposBalanco.Params[3].AsDate := dm3.CdsGruposBalancoDT_ALTERACAO.AsDateTime;
         dm3.FDAtualizaGruposBalanco.Params[4].AsString := dm3.CdsGruposBalancoENVIADO.AsString;
         Try
           dm3.FDAtualizaGruposBalanco.ExecFD(False);
         Except
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos Balanco - Execução da Procedure');
         End;

         dm3.CdsGruposBalanco.Next;
      end;

     dm3.CdsGruposBalanco.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos de Balanco');
         dm3.CdsGruposBalanco.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoGruposBalancoDeletados;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOSBALANCO');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Balancos Deletados: '+ FloatToStr(dm3.CdsDeletados.RecordCount));

     if dm3.CdsDeletados.RecordCount > 0 then
      begin

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'GRUPOSBALANCO';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPOBALANCO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos de Balanco Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoGruposCurvasDeletados;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOSCURVAS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos Curvas Deletados: '+ FloatToStr(dm3.CdsDeletados.RecordCount));

     if dm3.CdsDeletados.RecordCount > 0 then
      begin

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'GRUPOS_CURVAS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos Curvas Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoGruposCompra;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Grupos
     dm3.CdsGruposCompra.Close;
     dm3.CdsGruposCompra.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(131, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsGruposCompra.Data := Dados;
     dm3.CdsGruposCompra.Open; // virtual
     dm3.CdsGruposCompra.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Compra: ' + FloatToStr(dm3.CdsGruposCompra.RecordCount));
     while not dm3.CdsGruposCompra.Eof do
      begin
          dm3.FDAtualizaGruposCompras.Params[0].AsFloat := dm3.CdsGruposCompraCD_GRUPOCOMPRA.AsFloat;
          dm3.FDAtualizaGruposCompras.Params[1].AsString := dm3.CdsGruposCompraDESCRICAO.AsString;
          dm3.FDAtualizaGruposCompras.Params[2].AsString := dm3.CdsGruposCompraSTATUS.AsString;
          dm3.FDAtualizaGruposCompras.Params[3].AsDate := dm3.CdsGruposCompraDT_ALTERACAO.AsDateTime;
          dm3.FDAtualizaGruposCompras.Params[4].AsString := dm3.CdsGruposCompraENVIADO.AsString;
          Try
            dm3.FDAtualizaGruposCompras.ExecFD(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos Compras - Execução da Procedure');
          End;

          dm3.CdsGruposCompra.Next;
      end;
     dm3.CdsGruposCompra.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos de Compra');
         dm3.CdsGruposCompra.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoGruposCompraDeletados;
var Dados : Variant;
begin
  //busca na matriz as famílias deletadas
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOSCOMPRAS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos de Compras Deletados: ' + FloatToStr(dm3.CdsDeletados.RecordCount));

     if dm3.CdsDeletados.RecordCount > 0 then
      begin

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'GRUPOSCOMPRAS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPOCOMPRA';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos de Compra Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoGruposCurvas;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Grupos
     dm3.CdsGruposCurvas.Close;
     dm3.CdsGruposCurvas.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(132, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsGruposCurvas.Data := Dados;
     dm3.CdsGruposCurvas.Open; // virtual

     dm3.CdsGruposCurvas.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos Curvas: ' + FloatToStr(dm3.CdsGruposCurvas.RecordCount));
     while not dm3.CdsGruposCurvas.Eof do
      begin
           dm3.FDAtualizaGruposCurva.Params[0].AsFloat := dm3.CdsGruposCurvasCD_FILIAL.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[1].AsFloat := dm3.CdsGruposCurvasCD_GRUPO.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[2].AsString := dm3.CdsGruposCurvasGRUPO.AsString;
          dm3.FDAtualizaGruposCurva.Params[3].AsFloat := dm3.CdsGruposCurvasCD_CURVA.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[4].AsString := dm3.CdsGruposCurvasCURVA.AsString;
          dm3.FDAtualizaGruposCurva.Params[5].AsString := dm3.CdsGruposCurvasSIGLA.AsString;
          dm3.FDAtualizaGruposCurva.Params[6].AsFloat := dm3.CdsGruposCurvasDIASESTOQUE.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[7].AsFloat := dm3.CdsGruposCurvasESEG.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[8].AsFloat := dm3.CdsGruposCurvasP1.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[9].AsFloat := dm3.CdsGruposCurvasP2.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[10].AsFloat := dm3.CdsGruposCurvasP1SAZ.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[11].AsFloat := dm3.CdsGruposCurvasP2SAZ.AsFloat;
          dm3.FDAtualizaGruposCurva.Params[12].AsDate := dm3.CdsGruposCurvasDT_ALTERACAO.AsDateTime;
          Try
            dm3.FDAtualizaGruposCurva.ExecFD(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos Curva - Execução da Procedure');
          End;

          dm3.CdsGruposCurvas.Next;
      end;

     dm3.CdsGruposCurvas.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos Curvas');
         dm3.CdsGruposCurvas.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoDistribuidores;
var i : integer;
Dados : Variant;
begin
   Try
     // Atualiza Distribuidores
     dm3.CdsDistribuidores.Close;
     dm3.CdsDistribuidores.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(114, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsDistribuidores.Data := Dados;
     dm3.CdsDistribuidores.Open; // virtual

     dm3.CdsDistribuidores.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Distribuidores: ' + FloatToStr(dm3.CdsDistribuidores.RecordCount));
     while not dm3.CdsDistribuidores.Eof do
      begin
          dm3.FDAtualizaDistribuidores.Params[0].AsFloat := dm3.CdsDistribuidoresCD_DISTRIBUIDOR.AsFloat;
          dm3.FDAtualizaDistribuidores.Params[1].AsString := dm3.CdsDistribuidoresNOME.AsString;
          dm3.FDAtualizaDistribuidores.Params[2].AsString := dm3.CdsDistribuidoresAPELIDO.AsString;
          dm3.FDAtualizaDistribuidores.Params[3].AsString := dm3.CdsDistribuidoresENDERECO.AsString;
          dm3.FDAtualizaDistribuidores.Params[4].AsString := dm3.CdsDistribuidoresBAIRRO.AsString;
          dm3.FDAtualizaDistribuidores.Params[5].AsString := dm3.CdsDistribuidoresCIDADE.AsString;
          dm3.FDAtualizaDistribuidores.Params[6].AsString := dm3.CdsDistribuidoresUF.AsString;
          dm3.FDAtualizaDistribuidores.Params[7].AsString := dm3.CdsDistribuidoresCEP.AsString;
          dm3.FDAtualizaDistribuidores.Params[8].AsString := dm3.CdsDistribuidoresCAIXA_POSTAL.AsString;
          dm3.FDAtualizaDistribuidores.Params[9].AsString := dm3.CdsDistribuidoresFONE.AsString;
          dm3.FDAtualizaDistribuidores.Params[10].AsString := dm3.CdsDistribuidoresFAX.AsString;
          dm3.FDAtualizaDistribuidores.Params[11].AsString := dm3.CdsDistribuidoresCONTATO.AsString;
          dm3.FDAtualizaDistribuidores.Params[12].AsString := dm3.CdsDistribuidoresCNPJ.AsString;
          dm3.FDAtualizaDistribuidores.Params[13].AsString := dm3.CdsDistribuidoresIE.AsString;
          dm3.FDAtualizaDistribuidores.Params[14].AsString := dm3.CdsDistribuidoresPRACA.AsString;
          dm3.FDAtualizaDistribuidores.Params[15].AsDateTime := dm3.CdsDistribuidoresDT_FICHA.AsDateTime;
          dm3.FDAtualizaDistribuidores.Params[16].AsString := dm3.CdsDistribuidoresRG.AsString;
          dm3.FDAtualizaDistribuidores.Params[17].AsString := dm3.CdsDistribuidoresCPF.AsString;
          dm3.FDAtualizaDistribuidores.Params[18].AsString := dm3.CdsDistribuidoresEMPRESA.AsString;
          dm3.FDAtualizaDistribuidores.Params[19].AsString := dm3.CdsDistribuidoresFONE_COMERCIAL.AsString;
          dm3.FDAtualizaDistribuidores.Params[20].AsString := dm3.CdsDistribuidoresCEP_COMERCIAL.AsString;
          dm3.FDAtualizaDistribuidores.Params[21].AsString := dm3.CdsDistribuidoresCIDADE_COMERCIAL.AsString;
          dm3.FDAtualizaDistribuidores.Params[22].AsString := dm3.CdsDistribuidoresUF_COMERCIAL.AsString;
          dm3.FDAtualizaDistribuidores.Params[23].AsString := dm3.CdsDistribuidoresREFERENCIA_COMERCIAL.AsString;
          dm3.FDAtualizaDistribuidores.Params[24].AsString := dm3.CdsDistribuidoresREFERENCIA_BANCARIA.AsString;
          dm3.FDAtualizaDistribuidores.Params[25].AsDateTime := dm3.CdsDistribuidoresDT_CONSULTA_SPC.AsDateTime;
          dm3.FDAtualizaDistribuidores.Params[26].AsString := dm3.CdsDistribuidoresOBS_SPC.AsString;
          dm3.FDAtualizaDistribuidores.Params[27].AsString := dm3.CdsDistribuidoresTIPO_ATIVIDADE.AsString;
          dm3.FDAtualizaDistribuidores.Params[28].AsString := dm3.CdsDistribuidoresVENDEDOR.AsString;
          dm3.FDAtualizaDistribuidores.Params[29].AsString := dm3.CdsDistribuidoresENDERECO_COBRANCA.AsString;
          dm3.FDAtualizaDistribuidores.Params[30].AsString := dm3.CdsDistribuidoresBAIRRO_COBRANCA.AsString;
          dm3.FDAtualizaDistribuidores.Params[31].AsString := dm3.CdsDistribuidoresCIDADE_COBRANCA.AsString;
          dm3.FDAtualizaDistribuidores.Params[32].AsString := dm3.CdsDistribuidoresUF_COBRANCA.AsString;
          dm3.FDAtualizaDistribuidores.Params[33].AsString := dm3.CdsDistribuidoresCEP_COBRANCA.AsString;
          dm3.FDAtualizaDistribuidores.Params[34].AsFloat := dm3.CdsDistribuidoresICM_IPI.AsFloat;
          dm3.FDAtualizaDistribuidores.Params[35].AsFloat := dm3.CdsDistribuidoresLIMITE_CREDITO.AsFloat;
          dm3.FDAtualizaDistribuidores.Params[36].AsString := dm3.CdsDistribuidoresEMAIL.AsString;
          dm3.FDAtualizaDistribuidores.Params[37].AsString := dm3.CdsDistribuidoresHOMEPAGE.AsString;
          dm3.FDAtualizaDistribuidores.Params[38].AsFloat := dm3.CdsDistribuidoresCD_PLANO_CONTAS.AsFloat;
          dm3.FDAtualizaDistribuidores.Params[39].AsString := dm3.CdsDistribuidoresRAZAO.AsString;
          dm3.FDAtualizaDistribuidores.Params[40].AsDateTime := dm3.CdsDistribuidoresDT_ALTERACAO.AsDateTime;
          dm3.FDAtualizaDistribuidores.Params[41].AsString := dm3.CdsDistribuidoresARQUIVO_ENVIO.AsString;
          dm3.FDAtualizaDistribuidores.Params[42].AsString := dm3.CdsDistribuidoresARQUIVO_RETORNO.AsString;
          dm3.FDAtualizaDistribuidores.Params[43].AsString := dm3.CdsDistribuidoresPROGRAMAENVIO.AsString;
          dm3.FDAtualizaDistribuidores.Params[44].AsFloat := dm3.CdsDistribuidoresCODIGODICIONARIO.AsFloat;
          dm3.FDAtualizaDistribuidores.Params[45].AsString := dm3.CdsDistribuidoresCODIGOFATURAMENTO.AsString;
          dm3.FDAtualizaDistribuidores.Params[46].AsFloat := dm3.CdsDistribuidoresCFOP.AsFloat;

          dm3.FDAtualizaDistribuidores.Params[47].AsFloat := dm3.CdsDistribuidoresCD_MUNICIPIO.AsFloat;
          dm3.FDAtualizaDistribuidores.Params[48].AsFloat := dm3.CdsDistribuidoresCD_PAIS.AsFloat;
          dm3.FDAtualizaDistribuidores.Params[49].AsString := dm3.CdsDistribuidoresCOMPLEMENTO.AsString;
          dm3.FDAtualizaDistribuidores.Params[50].AsString := dm3.CdsDistribuidoresNUMERO.AsString;
          dm3.FDAtualizaDistribuidores.Params[51].AsString := dm3.CdsDistribuidoresSOMAICMSSUBSTITUICAO.AsString;
          dm3.FDAtualizaDistribuidores.Params[52].AsString := dm3.CdsDistribuidoresSOMAIPI.AsString;
          dm3.FDAtualizaDistribuidores.Params[53].AsString := dm3.CdsDistribuidoresSOMAFRETE.AsString;
          dm3.FDAtualizaDistribuidores.Params[54].AsString := dm3.CdsDistribuidoresSOMASEGURO.AsString;
          dm3.FDAtualizaDistribuidores.Params[55].AsString := dm3.CdsDistribuidoresSOMAOUTRASDESPESAS.AsString;

          dm3.FDAtualizaDistribuidores.Params[56].AsString := dm3.CdsDistribuidoresUSAFTP.AsString;
          dm3.FDAtualizaDistribuidores.Params[57].AsString := dm3.CdsDistribuidoresFTPHOST.AsString;
          dm3.FDAtualizaDistribuidores.Params[58].AsString := dm3.CdsDistribuidoresFTPUSUARIO.AsString;
          dm3.FDAtualizaDistribuidores.Params[59].AsString := dm3.CdsDistribuidoresFTPSENHA.AsString;
          dm3.FDAtualizaDistribuidores.Params[60].AsString := dm3.CdsDistribuidoresFTPDIRETORIOENVIO.AsString;
          dm3.FDAtualizaDistribuidores.Params[61].AsString := dm3.CdsDistribuidoresFTPDIRETORIORETORNO.AsString;

          dm3.FDAtualizaDistribuidores.Params[62].AsString := dm3.CdsDistribuidoresCONCLUSAONFSEMBOLETO.AsString;
          dm3.FDAtualizaDistribuidores.Params[63].AsFloat := dm3.CdsDistribuidoresTAXABOLETO.AsFloat;
          Try
            dm3.FDAtualizaDistribuidores.ExecFD(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Distribuidores - Execução da Procedure');
          End;

          dm3.CdsDistribuidores.Next;
      end;

     dm3.CdsDistribuidores.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Distribuidores');
         dm3.CdsDistribuidores.Close;
         Exit;
       end;
   end;
end;



procedure RecebendoProdutosDeletados;
var Dados : Variant;
begin
  //busca na matriz os produtos deletados
   Try
     // Atualiza produtos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO2';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
             dm3.FDSql.sql.text := 'DELETE FROM PRODUTOS WHERE ID_PRODUTO = ' + dm3.CdsDeletadosCAMPO2.AsString;

             dm3.FDSql.ExecFD(True);

             dm3.CdsDeletados.Next;
          end;
      end;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoGruposDeletados;
var Dados : Variant;
begin
  //busca na matriz os grupos deletados
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'GRUPOS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Grupos Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'GRUPOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.FDAtualizaDeletados.Params[0].AsString := 'USUARIOS_GRUPOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.FDAtualizaDeletados.Params[0].AsString := 'FILIAIS_GRUPOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.FDAtualizaDeletados.Params[0].AsString := 'CONVENIOS_GRUPOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Grupos Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoConveniosPBMDeletados;
var Dados : Variant;
begin
  //busca na matriz os grupos deletados
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CONVENIOS_PBM');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ConveniosPBM Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'CONVENIOS_PBM';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'ID_CONVENIOPBM';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ConveniosPBM Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoProdutosConvenioPBMDeletados;
var Dados : Variant;
begin
  //busca na matriz os grupos deletados
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS_CONVENIOS_PBM');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ProdutosConveniosPBM Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'PRODUTOS_CONVENIOS_PBM';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'ID_PRODUTOSCONVENIOPBM';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ProdutosConveniosPBM Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoLaboratoriosDeletados;
var Dados : Variant;
begin
  //busca na matriz os laboratorios deletados
   Try
     // Atualiza laboratorios
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'LABORATORIOS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Laboratorios Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'LABORATORIOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_LABORATORIO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Laboratorios');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoVendedoresDeletados;
var Dados : Variant;
begin
  //busca na matriz os Vendedores deletados
   Try
     // Atualiza vendedores
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'VENDEDORES');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Vendedores Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'VENDEDORES';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_VENDEDOR';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Vendedores');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoPlanosContasDeletados;
var Dados : Variant;
begin
  //busca na matriz os Plano de Contas deletados
   Try
     // Atualiza Plano de Contas
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PLANO_CONTAS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Planos de Contas Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'PLANO_CONTAS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_PLANO_CONTAS';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
             dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Plano de Contas Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoClientesDeletados;
var Dados : Variant;
begin
  //busca na matriz os Clientes deletados
  Try
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CLIENTES');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Clientes Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'CLIENTES';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_CLIENTE';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
             dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Clientes Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;

{   Try
     // Atualiza Clientes
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CLIENTES');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Clientes Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.QryClientes.Close;
            dm3.QryClientes.Params[0].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            dm3.QryClientes.Open;
            if dm3.QryClientes.RecordCount <> 0 then
             begin
               dm3.QryClientes.Delete;

               dm3.QryClientes.ApplyUpdates(0);

             end;
            dm3.CdsDeletados.Next;
          end;
      end;
     dm3.QryClientes.Close;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Clientes Deletados');
         dm3.QryClientes.Close;
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;}
end;



procedure RecebendoConveniosDeletados;
var Dados : Variant;
begin
  //busca na matriz os Convênios deletados
   Try
     // Atualiza Convenios
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CONVENIOS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Convenios Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'CONVENIOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_CONVENIO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
             dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.FDAtualizaDeletados.Params[0].AsString := 'CONVENIOS_GRUPOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_CONVENIO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
             dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Convenios Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoTransportadorasDeletados;
var Dados : Variant;
begin
  //busca na matriz os Transportadoras deletados
   Try
     // Atualiza Transportadoras
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'TRANSPORTADORAS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Transportadoras Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'TRANSPORTADORAS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_TRANSPORTADORA';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Transportadoras Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoCartoesDeletados;
var Dados : Variant;
begin
  //busca na matriz os Cartões deletados
   Try
     // Atualiza Cartões
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'CARTOES');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Cartoes Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'CARTOES';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_CARTAO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;

            Try
             dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Cartoes Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoDistribuidoresDeletados;
var Dados : Variant;
begin
  //busca na matriz os Distribuidores deletados
   Try
     // Atualiza Distribuidores
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados :=(dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'DISTRIBUIDORES');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Distribuidores Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'DISTRIBUIDORES';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_DISTRIBUIDOR';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Distribuidores Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoFiliaisDeletados;
var Dados : Variant;
begin
  //busca na matriz os Filiais deletados
   Try
     // Atualiza Filiais
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FILIAIS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Filiais Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'FILIAIS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_FILIAL';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Filiais Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoFormasPagamentoDeletados;
var Dados : Variant;
begin
  //busca na matriz os Formas de Pagamento deletados
   Try
     // Atualiza Formas de Pagamento
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FORMAS_PAGAMENTO');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Formas de Pagamento Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'FORMAS_PAGAMENTO';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_FORMA_PAGAMENTO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Formas Pagamento Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoBalancosDeletados;
var Dados : Variant;
begin
  //busca na matriz os Balancox deletados
   Try
     // Atualiza Balanços
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'BALANCO');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Balanços Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.QryBalancos.Close;
            dm3.QryBalancos.Params[0].AsFloat := dm3.CdsDeletadosCAMPO1.AsFloat;
            dm3.QryBalancos.Open;
            if dm3.QryBalancos.RecordCount <> 0 then
             begin
               if dm3.QryBalancosSTATUS.AsString = 'G' then
                begin
                  while not dm3.QryBalancos.Eof do
                     dm3.QryBalancos.Delete;

                  dm3.QryBalancos.ApplyUpdates(0);

                end;
             end;
            dm3.CdsDeletados.Next;
          end;
      end;
     dm3.QryBalancos.Close;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Balancos Deletados');
         dm3.QryBalancos.Close;
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoComprasDeletados;
var Dados : Variant;
begin
  //busca na matriz as Compras deletados
   Try
     // Atualiza Compras
     Try
       dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_COMPRAS INACTIVE';

       dm3.FDSql.ExecFD(True);

     Except
       on E:Exception do
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

        end;
     End;

     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'COMPRAS');
     if (Dados = null) then
      begin
        Try
          dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';

          dm3.FDSql.ExecFD(True);

        Except
          on E:Exception do
           begin
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

           end;
        End;
        Exit;
      end;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Compras Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.Cds1.Close;
            dm3.FDSql.sql.text := 'SELECT STATUS FROM COMPRAS WHERE CD_COMPRAS = ' + dm3.CdsDeletadosCAMPO1.AsString;
            dm3.Cds1.Params.Clear;
            dm3.Cds1.Open;
            if (dm3.Cds1.Fields[0].AsString = 'M') or (dm3.Cds1.Fields[0].AsString = 'G') or (dm3.Cds1.Fields[0].AsString = 'E') then
             begin
                dm3.Cds1.Close;
                dm3.FDSql.sql.text := 'DELETE FROM COMPRAS WHERE CD_COMPRAS = ' + dm3.CdsDeletadosCAMPO1.AsString;

                dm3.FDSql.ExecFD(True);

                dm3.FDSql.sql.text := 'DELETE FROM ITENS_COMPRA WHERE CD_COMPRAS = ' + dm3.CdsDeletadosCAMPO1.AsString;

                dm3.FDSql.ExecFD(True);

             end;
            dm3.Cds1.Close;
            dm3.CdsDeletados.Next;
          end;
      end;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Compras Deletados');
         dm3.CdsDeletados.Close;
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';

           dm3.FDSql.ExecFD(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;
         Exit;
       end;
   end;
  Try
    dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';

    dm3.FDSql.ExecFD(True);

  Except
    on E:Exception do
     begin
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

     end;
  End;
end;

procedure RecebendoItensComprasDeletados;
var Dados : Variant;
begin
  //busca na matriz as Itens Compra deletados
   Try
    Try
      dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA INACTIVE';

      dm3.FDSql.ExecFD(True);

    Except
      on E:Exception do
       begin
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

       end;
    End;
     // Atualiza Compras
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'ITENS_COMPRA');
     if (Dados = null) then
      begin
        Try
          dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA ACTIVE';

          dm3.FDSql.ExecFD(True);

        Except
          on E:Exception do
           begin
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

           end;
        End;
        Exit;
      end;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ItensCompras Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;

         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDSql.sql.text := 'DELETE FROM ITENS_COMPRA WHERE CD_COMPRAS = ' + dm3.CdsDeletadosCAMPO1.AsString +
                                ' AND ID_PRODUTO = ' + dm3.CdsDeletadosCAMPO2.AsString;
            Try
              dm3.FDSql.ExecFD(True);
            Except
            End;
            dm3.CdsDeletados.Next;
          end;

      end;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Itens Compra Deletados');
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA ACTIVE';

           dm3.FDSql.ExecFD(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
  Try
    dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ITENS_COMPRA ACTIVE';

    dm3.FDSql.ExecFD(True);

  Except
    on E:Exception do
     begin
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

     end;
  End;
end;


procedure RecebendoMetasFiliaisDeletados;
var Dados : Variant;
begin
  //busca na matriz as Compras deletados
   Try
     // Atualiza Compras
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'METAS_FILIAIS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasFiliais Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDSql.sql.text := 'DELETE FROM METAS_FILIAIS WHERE ID_META = ' + dm3.CdsDeletadosCAMPO1.AsString;

            Try
              dm3.FDSql.ExecFD(True);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Metas Filiais Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoMetasVendedoresDeletados;
var Dados : Variant;
begin
  //busca na matriz as Compras deletados
   Try
     // Atualiza Compras
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'METAS_VENDEDORES');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo MetasVendedores Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDSql.sql.text := 'DELETE FROM METAS_VENDEDORES WHERE ID_META = ' + dm3.CdsDeletadosCAMPO1.AsString  +
            ' AND CD_VENDEDOR = ' + dm3.CdsDeletadosCAMPO2.AsString;

            Try
              dm3.FDSql.ExecFD(True);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Metas Vendedores Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoPlanosContas;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Planos de Contas incluidos
   Try
     dm3.CdsPlanoContas.Close;
     dm3.CdsPlanoContas.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(109, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsPlanoContas.Data := Dados;
     dm3.CdsPlanoContas.Open; // virtual
     if dm3.CdsPlanoContas.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Planos de Contas - ' + FloattoStr(dm3.CdsPlanoContas.RecordCount));

           dm3.CdsPlanoContas.First;
           while not dm3.CdsPlanoContas.Eof do
            begin
              dm3.FDAtualizaPlanoContas.Params[0].AsFloat := dm3.CdsPlanoContasCD_PLANO_CONTAS.AsFloat;
              dm3.FDAtualizaPlanoContas.Params[1].AsString := dm3.CdsPlanoContasCD_HISTORICO.AsString;
              dm3.FDAtualizaPlanoContas.Params[2].AsString := dm3.CdsPlanoContasHISTORICO.AsString;
              dm3.FDAtualizaPlanoContas.Params[3].AsString := dm3.CdsPlanoContasGRAU.AsString;
              dm3.FDAtualizaPlanoContas.Params[4].AsString := dm3.CdsPlanoContasSISTEMA.AsString;
              dm3.FDAtualizaPlanoContas.Params[5].AsString := dm3.CdsPlanoContasTIPO_CONTA.AsString;
              dm3.FDAtualizaPlanoContas.Params[6].AsInteger := dm3.CdsPlanoContasAPURACAO.AsInteger;
              dm3.FDAtualizaPlanoContas.Params[7].AsString := dm3.CdsPlanoContasENVIADO.AsString;
              Try
                dm3.FDAtualizaPlanoContas.ExecFD(False);
              Except
                GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Plano Contas - Execução da Procedure');
              End;

              dm3.CdsPlanoContas.Next;
            end;

           dm3.CdsPlanoContas.Close;
        end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Plano de Contas');
         dm3.CdsPlanoContas.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoConvenios;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Convenios
   Try
     dm3.CdsConvenios.Close;
     dm3.CdsConvenios.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(111, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsConvenios.Data := Dados;
     dm3.CdsConvenios.Open; // virtual
     if dm3.CdsConvenios.RecordCount > 0 then
       begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Convenios - ' + FloatToStr(dm3.CdsConvenios.RecordCount));

         dm3.CdsConvenios.First;
         while not dm3.CdsConvenios.Eof do
          begin
            dm3.FDAtualizaConvenios.Params[0].AsFloat := dm3.CdsConveniosCD_CONVENIO.AsFloat;
            dm3.FDAtualizaConvenios.Params[1].AsString := dm3.CdsConveniosNOME.AsString;
            dm3.FDAtualizaConvenios.Params[2].AsString := dm3.CdsConveniosRAZAO.AsString;
            dm3.FDAtualizaConvenios.Params[3].AsString := dm3.CdsConveniosENDERECO.AsString;
            dm3.FDAtualizaConvenios.Params[4].AsString := dm3.CdsConveniosBAIRRO.AsString;
            dm3.FDAtualizaConvenios.Params[5].AsString := dm3.CdsConveniosCIDADE.AsString;
            dm3.FDAtualizaConvenios.Params[6].AsString := dm3.CdsConveniosUF.AsString;
            dm3.FDAtualizaConvenios.Params[7].AsString := dm3.CdsConveniosCEP.AsString;
            dm3.FDAtualizaConvenios.Params[8].AsString := dm3.CdsConveniosCAIXA_POSTAL.AsString;
            dm3.FDAtualizaConvenios.Params[9].AsString := dm3.CdsConveniosFONE.AsString;
            dm3.FDAtualizaConvenios.Params[10].AsString := dm3.CdsConveniosFAX.AsString;
            dm3.FDAtualizaConvenios.Params[11].AsString := dm3.CdsConveniosCONTATO.AsString;
            dm3.FDAtualizaConvenios.Params[12].AsString := dm3.CdsConveniosCNPJ.AsString;
            dm3.FDAtualizaConvenios.Params[13].AsString := dm3.CdsConveniosIE.AsString;
            dm3.FDAtualizaConvenios.Params[14].AsString := dm3.CdsConveniosPRACA.AsString;
            dm3.FDAtualizaConvenios.Params[15].AsDate := dm3.CdsConveniosDT_FICHA.AsDateTime;
            dm3.FDAtualizaConvenios.Params[16].AsString := dm3.CdsConveniosRG.AsString;
            dm3.FDAtualizaConvenios.Params[17].AsString := dm3.CdsConveniosCPF.AsString;
            dm3.FDAtualizaConvenios.Params[18].AsString := dm3.CdsConveniosEMPRESA.AsString;
            dm3.FDAtualizaConvenios.Params[19].AsString := dm3.CdsConveniosFONE_COMERCIAL.AsString;
            dm3.FDAtualizaConvenios.Params[20].AsString := dm3.CdsConveniosCEP_COMERCIAL.AsString;
            dm3.FDAtualizaConvenios.Params[21].AsString := dm3.CdsConveniosCIDADE_COMERCIAL.AsString;
            dm3.FDAtualizaConvenios.Params[22].AsString := dm3.CdsConveniosUF_COMERCIAL.AsString;
            dm3.FDAtualizaConvenios.Params[23].AsString := dm3.CdsConveniosREFERENCIA_COMERCIAL.AsString;
            dm3.FDAtualizaConvenios.Params[24].AsString := dm3.CdsConveniosREFERENCIA_BANCARIA.AsString;
            dm3.FDAtualizaConvenios.Params[25].AsDate := dm3.CdsConveniosDT_CONSULTA_SPC.AsDateTime;
            dm3.FDAtualizaConvenios.Params[26].AsString := dm3.CdsConveniosOBS_SPC.AsString;
            dm3.FDAtualizaConvenios.Params[27].AsString := dm3.CdsConveniosTIPO_ATIVIDADE.AsString;
            dm3.FDAtualizaConvenios.Params[28].AsFloat := dm3.CdsConveniosCD_VENDEDOR.AsFloat;
            dm3.FDAtualizaConvenios.Params[29].AsString := dm3.CdsConveniosENDERECO_COBRANCA.AsString;
            dm3.FDAtualizaConvenios.Params[30].AsString := dm3.CdsConveniosBAIRRO_COBRANCA.AsString;
            dm3.FDAtualizaConvenios.Params[31].AsString := dm3.CdsConveniosCIDADE_COBRANCA.AsString;
            dm3.FDAtualizaConvenios.Params[32].AsString := dm3.CdsConveniosUF_COBRANCA.AsString;
            dm3.FDAtualizaConvenios.Params[33].AsString := dm3.CdsConveniosCEP_COBRANCA.AsString;
            dm3.FDAtualizaConvenios.Params[34].AsFloat := dm3.CdsConveniosICM_IPI.AsFloat;
            dm3.FDAtualizaConvenios.Params[35].AsFloat := dm3.CdsConveniosLIMITE_CREDITO.AsFloat;
            dm3.FDAtualizaConvenios.Params[36].AsString := dm3.CdsConveniosEMAIL.AsString;
            dm3.FDAtualizaConvenios.Params[37].AsString := dm3.CdsConveniosHOMEPAGE.AsString;
            dm3.FDAtualizaConvenios.Params[38].AsString := dm3.CdsConveniosMULTI.AsString;
            dm3.FDAtualizaConvenios.Params[39].AsFloat := dm3.CdsConveniosTX_DESCONTO.AsFloat;
            dm3.FDAtualizaConvenios.Params[40].AsFloat := dm3.CdsConveniosDT_VENCIMENTO.AsFloat;
            dm3.FDAtualizaConvenios.Params[41].AsFloat := dm3.CdsConveniosDT_FECHAMENTO.AsFloat;
            dm3.FDAtualizaConvenios.Params[42].AsFloat := dm3.CdsConveniosSALDO.AsFloat;
            dm3.FDAtualizaConvenios.Params[43].AsFloat := dm3.CdsConveniosJAN.AsFloat;
            dm3.FDAtualizaConvenios.Params[44].AsFloat := dm3.CdsConveniosFEV.AsFloat;
            dm3.FDAtualizaConvenios.Params[45].AsFloat := dm3.CdsConveniosMAR.AsFloat;
            dm3.FDAtualizaConvenios.Params[46].AsFloat := dm3.CdsConveniosABR.AsFloat;
            dm3.FDAtualizaConvenios.Params[47].AsFloat := dm3.CdsConveniosMAI.AsFloat;
            dm3.FDAtualizaConvenios.Params[48].AsFloat := dm3.CdsConveniosJUN.AsFloat;
            dm3.FDAtualizaConvenios.Params[49].AsFloat := dm3.CdsConveniosJUL.AsFloat;
            dm3.FDAtualizaConvenios.Params[50].AsFloat := dm3.CdsConveniosAGO.AsFloat;
            dm3.FDAtualizaConvenios.Params[51].AsFloat := dm3.CdsConveniosSET_.AsFloat;
            dm3.FDAtualizaConvenios.Params[52].AsFloat := dm3.CdsConveniosOUT.AsFloat;
            dm3.FDAtualizaConvenios.Params[53].AsFloat := dm3.CdsConveniosNOV.AsFloat;
            dm3.FDAtualizaConvenios.Params[54].AsFloat := dm3.CdsConveniosDEZ.AsFloat;
            dm3.FDAtualizaConvenios.Params[55].AsDate := dm3.CdsConveniosDT_ALTERACAO.AsDateTime;
            dm3.FDAtualizaConvenios.Params[56].AsString := dm3.CdsConveniosUSUARIOSITE.AsString;
            dm3.FDAtualizaConvenios.Params[57].AsString := dm3.CdsConveniosSENHASITE.AsString;
            dm3.FDAtualizaConvenios.Params[58].AsString := dm3.CdsConveniosPERMITEPARCELAMENTO.AsString;
            dm3.FDAtualizaConvenios.Params[59].AsString := dm3.CdsConveniosPAGACOMISSAO.AsString;
            dm3.FDAtualizaConvenios.Params[60].AsString := dm3.CdsConveniosPAGAAVISTA.AsString;
            dm3.FDAtualizaConvenios.Params[61].AsString := dm3.CdsConveniosSTATUS.AsString;
            dm3.FDAtualizaConvenios.Params[62].AsString := dm3.CdsConveniosCD_MUNICIPIO.AsString;
            dm3.FDAtualizaConvenios.Params[63].AsString := dm3.CdsConveniosCD_PAIS.AsString;
            dm3.FDAtualizaConvenios.Params[64].AsString := dm3.CdsConveniosCOMPLEMENTO.AsString;
            dm3.FDAtualizaConvenios.Params[65].AsString := dm3.CdsConveniosNUMERO.AsString;
            dm3.FDAtualizaConvenios.Params[66].AsString := dm3.CdsConveniosFATURAFECHADA.AsString;
            dm3.FDAtualizaConvenios.Params[67].AsString := dm3.CdsConveniosEXIBIRDADOSCLIENTECOMPROVANTE.AsString;
            Try
              dm3.FDAtualizaConvenios.ExecFD(False);
            Except
              GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Convenios - Execução da Procedure');
            End;

            dm3.CdsConvenios.Next;
          end;
       end;

     dm3.CdsConvenios.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Convenios');
         dm3.CdsConvenios.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoTransportadoras;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Transportadoras
   Try
     dm3.CdsTransportadoras.Close;
     dm3.CdsTransportadoras.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(112, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsTransportadoras.Data := Dados;
     dm3.CdsTransportadoras.Open; // virtual
     if dm3.CdsTransportadoras.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Transportadoras - ' + FloattoStr(dm3.CdsTransportadoras.RecordCount));

           dm3.CdsTransportadoras.First;
           while not dm3.CdsTransportadoras.Eof do
            begin
              dm3.FDAtualizaTransportadoras.Params[0].AsFloat := dm3.CdsTransportadorasCD_TRANSPORTADORA.AsFloat;
              dm3.FDAtualizaTransportadoras.Params[1].AsString := dm3.CdsTransportadorasNOME.AsString;
              dm3.FDAtualizaTransportadoras.Params[2].AsString := dm3.CdsTransportadorasRAZAO.AsString;
              dm3.FDAtualizaTransportadoras.Params[3].AsString := dm3.CdsTransportadorasCNPJ.AsString;
              dm3.FDAtualizaTransportadoras.Params[4].AsString := dm3.CdsTransportadorasINSCRICAO.AsString;
              dm3.FDAtualizaTransportadoras.Params[5].AsString := dm3.CdsTransportadorasENDERECO.AsString;
              dm3.FDAtualizaTransportadoras.Params[6].AsString := dm3.CdsTransportadorasNUMERO.AsString;
              dm3.FDAtualizaTransportadoras.Params[7].AsString := dm3.CdsTransportadorasCOMPLEMENTO.AsString;
              dm3.FDAtualizaTransportadoras.Params[8].AsString := dm3.CdsTransportadorasBAIRRO.AsString;
              dm3.FDAtualizaTransportadoras.Params[9].AsString := dm3.CdsTransportadorasCIDADE.AsString;
              dm3.FDAtualizaTransportadoras.Params[10].AsString := dm3.CdsTransportadorasUF.AsString;
              dm3.FDAtualizaTransportadoras.Params[11].AsString := dm3.CdsTransportadorasCEP.AsString;
              dm3.FDAtualizaTransportadoras.Params[12].AsString := dm3.CdsTransportadorasCD_MUNICIPIO.AsString;
              dm3.FDAtualizaTransportadoras.Params[13].AsString := dm3.CdsTransportadorasFONE.AsString;
              dm3.FDAtualizaTransportadoras.Params[14].AsString := dm3.CdsTransportadorasFAX.AsString;
              dm3.FDAtualizaTransportadoras.Params[15].AsString := dm3.CdsTransportadorasCAIXA_POSTAL.AsString;
              dm3.FDAtualizaTransportadoras.Params[16].AsString := dm3.CdsTransportadorasCONTATO.AsString;
              dm3.FDAtualizaTransportadoras.Params[17].AsString := dm3.CdsTransportadorasEMAIL.AsString;
              dm3.FDAtualizaTransportadoras.Params[18].AsString := dm3.CdsTransportadorasURL.AsString;
              dm3.FDAtualizaTransportadoras.Params[19].AsString := dm3.CdsTransportadorasCD_PAIS.AsString;
              dm3.FDAtualizaTransportadoras.Params[20].AsString := dm3.CdsTransportadorasPAIS.AsString;
              dm3.FDAtualizaTransportadoras.Params[21].AsDateTime := dm3.CdsTransportadorasDT_ALTERACAO.AsDateTime;
              dm3.FDAtualizaTransportadoras.Params[22].AsString := dm3.CdsTransportadorasENVIADO.AsString;
              Try
                dm3.FDAtualizaTransportadoras.ExecFD(False);
              Except
                GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Transportadoras - Execução da Procedure');
              End;

              dm3.CdsTransportadoras.Next;
            end;

           dm3.CdsTransportadoras.Close;
        end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Transportadoras');
         dm3.CdsTransportadoras.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoCartoes;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz os Cartoes
   Try
     dm3.CdsCartoes.Close;
     dm3.CdsCartoes.CreateDataSet;
     DAdos := (dm3.HTTPRIO1 AS IDmProcessa).Processa(113, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsCartoes.Data := Dados;
     dm3.CdsCartoes.Open; // virtual
     if dm3.CdsCartoes.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Cartoes - ' + FloattoStr(dm3.CdsCartoes.RecordCount));

           dm3.CdsCartoes.First;
           while not dm3.CdsCartoes.Eof do
            begin
              dm3.FDAtualizaCartoes.Params[0].AsFloat := dm3.CdsCartoesCD_CARTAO.AsFloat;
              dm3.FDAtualizaCartoes.Params[1].AsFloat := dm3.CdsCartoesCD_CONTA.AsFloat;
              dm3.FDAtualizaCartoes.Params[2].AsString := dm3.CdsCartoesDESCRICAO.AsString;
              dm3.FDAtualizaCartoes.Params[3].AsString := dm3.CdsCartoesTIPO_CARTAO.AsString;
              dm3.FDAtualizaCartoes.Params[4].AsFloat := dm3.CdsCartoesTX_ADM.AsFloat;
              dm3.FDAtualizaCartoes.Params[5].AsFloat := dm3.CdsCartoesTX_ADM_PARC.AsFloat;
              dm3.FDAtualizaCartoes.Params[6].AsFloat := dm3.CdsCartoesPRAZO_PG.AsFloat;
              dm3.FDAtualizaCartoes.Params[7].AsFloat := dm3.CdsCartoesIMAGEM.AsFloat;
              dm3.FDAtualizaCartoes.Params[8].AsString := dm3.CdsCartoesUSATEF.AsString;
              dm3.FDAtualizaCartoes.Params[9].AsString := dm3.CdsCartoesTRNCENTRE.AsString;
              dm3.FDAtualizaCartoes.Params[10].AsString := dm3.CdsCartoesFIDELIZE.AsString;
              dm3.FDAtualizaCartoes.Params[11].AsString := dm3.CdsCartoesHIPERCARD.AsString;
              dm3.FDAtualizaCartoes.Params[12].AsString := dm3.CdsCartoesREDEVESPAGUE.AsString;
              dm3.FDAtualizaCartoes.Params[13].AsString := dm3.CdsCartoesENVIADO.AsString;
              Try
                dm3.FDAtualizaCartoes.ExecFD(False);
              Except
                GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Cartoes - Execução da Procedure');
              End;

              dm3.CdsCartoes.Next;
            end;

           dm3.CdsCartoes.Close;
        end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Cartoes');
         dm3.CdsCartoes.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoFiliais;
var i : integer;
Dados : Variant;
begin
  //Busca na matriz as Filiais
   Try
     dm3.CdsFiliais.Close;
     dm3.CdsFiliais.CreateDataSet;
     DAdos := (dm3.HTTPRIO1 AS IDmProcessa).Processa(115, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsFiliais.Data := Dados;
     dm3.CdsFiliais.Open; // virtual
     if dm3.CdsFiliais.RecordCount > 0 then
        begin
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Filiais - ' + FloattoStr(dm3.CdsFiliais.RecordCount));

           dm3.CdsFiliais.First;
           while not dm3.CdsFiliais.Eof do
            begin
              dm3.FDAtualizaFiliais.Params[0].AsFloat := dm3.CdsFiliaisCD_FILIAL.AsFloat;
              dm3.FDAtualizaFiliais.Params[1].AsString := dm3.CdsFiliaisNOME.AsString;
              dm3.FDAtualizaFiliais.Params[2].AsString := dm3.CdsFiliaisRAZAO.AsString;
              dm3.FDAtualizaFiliais.Params[3].AsString := dm3.CdsFiliaisCNPJ.AsString;
              dm3.FDAtualizaFiliais.Params[4].AsString := dm3.CdsFiliaisINSCRICAO.AsString;
              dm3.FDAtualizaFiliais.Params[5].AsString := dm3.CdsFiliaisRUA.AsString;
              dm3.FDAtualizaFiliais.Params[6].AsString := dm3.CdsFiliaisNUMERO.AsString;
              dm3.FDAtualizaFiliais.Params[7].AsString := dm3.CdsFiliaisCOMPLEMENTO.AsString;
              dm3.FDAtualizaFiliais.Params[8].AsString := dm3.CdsFiliaisBAIRRO.AsString;
              dm3.FDAtualizaFiliais.Params[9].AsString := dm3.CdsFiliaisCIDADE.AsString;
              dm3.FDAtualizaFiliais.Params[10].AsString := dm3.CdsFiliaisUF.AsString;
              dm3.FDAtualizaFiliais.Params[11].AsString := dm3.CdsFiliaisCEP.AsString;
              dm3.FDAtualizaFiliais.Params[12].AsString := dm3.CdsFiliaisFONE.AsString;
              dm3.FDAtualizaFiliais.Params[13].AsString := dm3.CdsFiliaisFONE_1.AsString;
              dm3.FDAtualizaFiliais.Params[14].AsString := dm3.CdsFiliaisFAX.AsString;
              dm3.FDAtualizaFiliais.Params[15].AsString := dm3.CdsFiliaisCONTATO.AsString;
              dm3.FDAtualizaFiliais.Params[16].AsFloat := dm3.CdsFiliaisCD_DISTRIBUIDOR.AsFloat;
              dm3.FDAtualizaFiliais.Params[17].AsFloat := dm3.CdsFiliaisCD_CLIENTE.AsFloat;
              dm3.FDAtualizaFiliais.Params[18].AsString := dm3.CdsFiliaisENDERECOWEB.AsString;
              dm3.FDAtualizaFiliais.Params[19].AsString := dm3.CdsFiliaisEXPORTAR.AsString;
              dm3.FDAtualizaFiliais.Params[20].AsFloat := dm3.CdsFiliaisMETROSQUADRADOS.AsFloat;
              dm3.FDAtualizaFiliais.Params[21].AsFloat := dm3.CdsFiliaisNUMEROFUNCIONARIOS.AsFloat;
              dm3.FDAtualizaFiliais.Params[22].AsFloat := dm3.CdsFiliaisNUMEROPDVS.AsFloat;
              dm3.FDAtualizaFiliais.Params[23].AsString := dm3.CdsFiliaisSTATUS.AsString;
              dm3.FDAtualizaFiliais.Params[24].AsString := dm3.CdsFiliaisCD_MUNICIPIO.AsString;
              dm3.FDAtualizaFiliais.Params[25].AsString := dm3.CdsFiliaisIFOOD_CLIENT_ID.AsString;
              dm3.FDAtualizaFiliais.Params[26].AsString := dm3.CdsFiliaisIFOOD_CLIENT_SECRET.AsString;
              dm3.FDAtualizaFiliais.Params[27].AsString := dm3.CdsFiliaisIFOOD_ID_LOJA.AsString;
              dm3.FDAtualizaFiliais.Params[28].AsString := dm3.CdsFiliaisIFOOD_PRECO_PRATICADO.AsString;
              dm3.FDAtualizaFiliais.Params[29].AsInteger := dm3.CdsFiliaisIFOOD_QNTD_ENVIO.AsInteger;
              dm3.FDAtualizaFiliais.Params[30].AsInteger := dm3.CdsFiliaisIFOOD_VENDEDOR.AsInteger;
              dm3.FDAtualizaFiliais.Params[31].AsString := dm3.CdsFiliaisFARMACIASAPP_CLIENT_ID.AsString;
              dm3.FDAtualizaFiliais.Params[32].AsString := dm3.CdsFiliaisFARMACIASAPP_CLIENT_SECRET.AsString;
              dm3.FDAtualizaFiliais.Params[33].AsString := dm3.CdsFiliaisFARMACIASAPP_ID_LOJA.AsString;
              dm3.FDAtualizaFiliais.Params[34].AsString := dm3.CdsFiliaisFARMACIASAPP_PRECO_PRATICADO.AsString;
              dm3.FDAtualizaFiliais.Params[35].AsInteger := dm3.CdsFiliaisFARMACIASAPP_QNTD_ENVIO.AsInteger;
              dm3.FDAtualizaFiliais.Params[36].AsInteger := dm3.CdsFiliaisFARMACIASAPP_VENDEDOR.AsInteger;
              Try
                dm3.FDAtualizaFiliais.ExecFD(False);
              Except
                GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Filiais - Execução da Procedure');
              End;

              dm3.CdsFiliais.Next;
            end;

           dm3.CdsFiliais.Close;
        end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Filiais');
         dm3.CdsFiliais.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoBalancos;
var i : integer;
    Dados : Variant;
begin
  //Busca na matriz os Balancos
   Try
     dm3.CdsBalancos.Close;
     dm3.CdsBalancos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(126, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsBalancos.Data := Dados;
     dm3.CdsBalancos.Open; // virtual
     if dm3.CdsBalancos.RecordCount > 0 then
        begin

           dm3.CdsBalancos.First;
           while not dm3.CdsBalancos.Eof do
            begin
              dm3.FDAtualizaBalancoLoja.Params[0].AsFloat := dm3.CdsBalancosID_BALANCO.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[1].AsFloat := dm3.CdsBalancosID_MOTIVO.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[2].AsDate := dm3.CdsBalancosDATA.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[3].AsTime := dm3.CdsBalancosHORA.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[4].AsDate := dm3.CdsBalancosDATA_ABERTURA.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[5].AsTime := dm3.CdsBalancosHORA_ABERTURA.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[6].AsDate := dm3.CdsBalancosDATA_CONTAGEM.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[7].AsTime := dm3.CdsBalancosHORA_CONTAGEM.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[8].AsDate := dm3.CdsBalancosDATA_CONCLUSAO.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[9].AsTime := dm3.CdsBalancosHORA_CONCLUSAO.AsDateTime;
              dm3.FDAtualizaBalancoLoja.Params[10].AsFloat := dm3.CdsBalancosCD_FILIAL.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[11].AsFloat := dm3.CdsBalancosID_PRODUTO.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[12].AsString := dm3.CdsBalancosCD_PRODUTO.AsString;
              dm3.FDAtualizaBalancoLoja.Params[13].AsString := dm3.CdsBalancosCODIGO_BARRAS_1.AsString;
              dm3.FDAtualizaBalancoLoja.Params[14].AsString := dm3.CdsBalancosCODIGO_BARRAS_2.AsString;
              dm3.FDAtualizaBalancoLoja.Params[15].AsString := dm3.CdsBalancosDESCRICAO.AsString;
              dm3.FDAtualizaBalancoLoja.Params[16].AsFloat := dm3.CdsBalancosCD_GRUPO.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[17].AsString := dm3.CdsBalancosGRUPO.AsString;
              dm3.FDAtualizaBalancoLoja.Params[18].AsFloat := dm3.CdsBalancosCD_LABORATORIO.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[19].AsString := dm3.CdsBalancosLABORATORIO.AsString;
              dm3.FDAtualizaBalancoLoja.Params[20].AsFloat := dm3.CdsBalancosCD_CLASSE.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[21].AsString := dm3.CdsBalancosCLASSE.AsString;
              dm3.FDAtualizaBalancoLoja.Params[22].AsFloat := dm3.CdsBalancosCUSTO_UNITARIO.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[23].AsFloat := dm3.CdsBalancosPRECO_VENDA.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[24].AsFloat := dm3.CdsBalancosPRECO_VENDA_ANTERIOR.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[25].AsFloat := dm3.CdsBalancosESTOQUE.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[26].AsFloat := dm3.CdsBalancosESTOQUE_ANTERIOR.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[27].AsString := dm3.CdsBalancosSUBSTITUIESTOQUE.AsString;
              dm3.FDAtualizaBalancoLoja.Params[28].AsString := dm3.CdsBalancosSTATUS.AsString;
              dm3.FDAtualizaBalancoLoja.Params[29].AsString := dm3.CdsBalancosENVIADO.AsString;
              dm3.FDAtualizaBalancoLoja.Params[30].AsFloat := dm3.CdsBalancosCD_SUBGRUPO.AsFloat;
              dm3.FDAtualizaBalancoLoja.Params[31].AsString := dm3.CdsBalancosUSUARIO_ABERTURA.AsString;
              dm3.FDAtualizaBalancoLoja.Params[32].AsString := dm3.CdsBalancosUSUARIO_CONCLUSAO.AsString;
              Try
                dm3.FDAtualizaBalancoLoja.ExecFD(False);
              Except
                GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Balanco Loja - Execução da Procedure');
              End;

              dm3.CdsBalancos.Next;
            end;

           dm3.CdsBalancos.Close;
        end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Balancos');
         dm3.CdsBalancos.Close;
         Exit;
       end;
   end;
end;



procedure RecebendoUsuarios;
var i : integer;
Dados : Variant;
begin
   Try
     Try
       dm3.FDSql.sql.text := 'ALTER TRIGGER USUARIOS_BIU0 INACTIVE';

       dm3.FDSql.ExecFD(True);

     Except
       on E:Exception do
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

        end;
     End;

     dm32.CdsUsuarios.Close;
     dm32.CdsUsuarios.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(142, Filial, 'A');
     if (Dados = null) then
      begin
        Try
          dm3.FDSql.sql.text := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';

          dm3.FDSql.ExecFD(True);

        Except
          on E:Exception do
           begin
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

           end;
        End;
        Exit;
      end;
     dm32.CdsUsuarios.Data := Dados;
     dm32.CdsUsuarios.Open; // virtual
     dm32.CdsUsuarios.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Usuarios: '+ FloatToStr(dm32.CdsUsuarios.RecordCount));
     while not dm32.CdsUsuarios.Eof do
      begin
        dm32.QryUsuarios.Close;
        dm32.QryUsuarios.Params[0].AsFloat := dm32.CdsUsuariosCD_USUARIO.AsFloat;
        dm32.QryUsuarios.Open;
        if dm32.QryUsuarios.RecordCount = 0 then
           dm32.QryUsuarios.Append
        else
           dm32.QryUsuarios.Edit;
         for i := 0 to dm32.QryUsuarios.FieldCount - 1 do
            dm32.QryUsuarios.Fields[i].Value := dm32.CdsUsuarios.Fields[i].Value;
         dm32.QryUsuarios.Post;

         dm32.QryUsuarios.ApplyUpdates(0);

         dm32.CdsUsuarios.Next;
      end;
     dm32.CdsUsuarios.Close;
     dm32.QryUsuarios.Close;

     Try
       dm3.FDSql.sql.text := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';

       dm3.FDSql.ExecFD(True);

     Except
       on E:Exception do
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

        end;
     End;

   Except
      on E:Exception do
       begin


         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';

           dm3.FDSql.ExecFD(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Usuarios');
         dm32.CdsUsuarios.Close;
         dm32.QryUsuarios.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoPermissoes;
var i : integer;
Dados : Variant;
begin
   Try
     dm32.CdsPermissoes.Close;
     dm32.CdsPermissoes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(143, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm32.CdsPermissoes.Data := Dados;
     dm32.CdsPermissoes.Open; // virtual
     dm32.CdsPermissoes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Permissoes: '+ FloatToStr(dm32.CdsPermissoes.RecordCount));
     while not dm32.CdsPermissoes.Eof do
      begin
        dm32.QryPermissoes.Close;
        dm32.QryPermissoes.Params[0].AsFloat := dm32.CdsPermissoesCD_PERMISSAO.AsFloat;
        dm32.QryPermissoes.Open;
        if dm32.QryPermissoes.RecordCount = 0 then
           dm32.QryPermissoes.Append
        else
           dm32.QryPermissoes.Edit;
         for i := 0 to dm32.QryPermissoes.FieldCount - 1 do
            dm32.QryPermissoes.Fields[i].Value := dm32.CdsPermissoes.Fields[i].Value;
         dm32.QryPermissoes.Post;

         dm32.QryPermissoes.ApplyUpdates(0);

         dm32.CdsPermissoes.Next;
      end;
     dm32.CdsPermissoes.Close;
     dm32.QryPermissoes.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Permissoes');
         dm32.CdsPermissoes.Close;
         dm32.QryPermissoes.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoPermissoesModulos;
var i : integer;
Dados : Variant;
begin
   Try
     dm32.CdsPermissoesModulos.Close;
     dm32.CdsPermissoesModulos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(144, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm32.CdsPermissoesModulos.Data := Dados;
     dm32.CdsPermissoesModulos.Open; // virtual
     dm32.CdsPermissoesModulos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Permissoes Modulos: '+ FloatToStr(dm32.CdsPermissoesModulos.RecordCount));
     while not dm32.CdsPermissoesModulos.Eof do
      begin
        dm32.QryPermissoesModulos.Close;
        dm32.QryPermissoesModulos.Params[0].AsFloat := dm32.CdsPermissoesModulosCD_PERMISSAO.AsFloat;
        dm32.QryPermissoesModulos.Params[1].AsFloat := dm32.CdsPermissoesModulosCD_MODULO.AsFloat;
        dm32.QryPermissoesModulos.Open;
        if dm32.QryPermissoesModulos.RecordCount = 0 then
           dm32.QryPermissoesModulos.Append
        else
           dm32.QryPermissoesModulos.Edit;
         for i := 0 to dm32.QryPermissoesModulos.FieldCount - 1 do
            dm32.QryPermissoesModulos.Fields[i].Value := dm32.CdsPermissoesModulos.Fields[i].Value;
         dm32.QryPermissoesModulos.Post;

         dm32.QryPermissoesModulos.ApplyUpdates(0);

         dm32.CdsPermissoesModulos.Next;
      end;
     dm32.CdsPermissoesModulos.Close;
     dm32.QryPermissoesModulos.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Permissoes Modulos');
         dm32.CdsPermissoesModulos.Close;
         dm32.QryPermissoesModulos.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoLancamentosaPrazo;
var i : integer;
 LResponse: IResponse;
 TJsonLancaAprazo :TJSONObject;
 filial:string;

begin
   Try
     dm2.CdsLancamentosaPrazo.Close;
     dm2.CdsLancamentosaPrazo.CreateDataSet;

     TJsonLancaAprazo:=TJSONObject.Create;
     LResponse := TRequest.New.BaseURL(dm.BaseUrl )
     .Resource('lancamentosaprazo/'+filial)
     .Accept('application/json')
     .Get;


    //Processa(145, Filial, 'A');

     if LResponse.StatusCode<>200 then
     begin
       exit
     end
     else
     begin

         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER LANCAMENTOS_APRAZO_AI0 INACTIVE';
           dm3.FDSql.Execsql(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
             end;
         End;

         dm2.CdsLancamentosaPrazo.loadfromjson(LResponse.Content);
         dm2.CdsLancamentosaPrazo.Open; // virtual
         dm2.CdsLancamentosaPrazo.First;
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Lancamentos a Prazo: '+ FloatToStr(dm2.CdsLancamentosaPrazo.RecordCount));
         while not dm2.CdsLancamentosaPrazo.Eof do
          begin
              dm2.FDAtualizaLancamentosAPrazo.Params[0].AsFloat := dm2.CdsLancamentosaPrazoCD_LANCAMENTO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[1].AsFloat := dm2.CdsLancamentosaPrazoID_PRODUTO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[2].AsFloat := dm2.CdsLancamentosaPrazoCD_FILIAL.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[3].AsString := dm2.CdsLancamentosaPrazoCD_PRODUTO.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[4].AsString := dm2.CdsLancamentosaPrazoDESCRICAO.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[5].AsFloat := dm2.CdsLancamentosaPrazoCD_LABORATORIO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[6].AsFloat := dm2.CdsLancamentosaPrazoCD_GRUPO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[7].AsFloat := dm2.CdsLancamentosaPrazoCD_CLASSE.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[8].AsFloat := dm2.CdsLancamentosaPrazoCD_CONVENIO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[9].AsFloat := dm2.CdsLancamentosaPrazoCD_CLIENTE.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[10].AsFloat := dm2.CdsLancamentosaPrazoCD_VENDEDOR.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[11].AsFloat := dm2.CdsLancamentosaPrazoCD_OPERADOR.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[12].AsFloat := dm2.CdsLancamentosaPrazoCD_USUARIO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[13].AsFloat := dm2.CdsLancamentosaPrazoCD_FORMA_PAGAMENTO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[14].AsFloat := dm2.CdsLancamentosaPrazoCD_VENDA.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[15].AsFloat := dm2.CdsLancamentosaPrazoID_OPERADORCAIXA.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[16].AsFloat := dm2.CdsLancamentosaPrazoCUSTO_MEDIO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[17].AsFloat := dm2.CdsLancamentosaPrazoCUSTO_UNITARIO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[18].AsDate := dm2.CdsLancamentosaPrazoDATA_LANCAMENTO.AsDateTime;
              dm2.FDAtualizaLancamentosAPrazo.Params[19].AsDate := dm2.CdsLancamentosaPrazoDATA_CAIXA.AsDateTime;
              dm2.FDAtualizaLancamentosAPrazo.Params[20].AsFloat := dm2.CdsLancamentosaPrazoQUANTIDADE.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[21].AsFloat := dm2.CdsLancamentosaPrazoVALOR.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[22].AsFloat := dm2.CdsLancamentosaPrazoCOMISSAO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[23].AsString := dm2.CdsLancamentosaPrazoNOTA_FISCAL.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[24].AsFloat := dm2.CdsLancamentosaPrazoDESCONTO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[25].AsFloat := dm2.CdsLancamentosaPrazoPROMOCAO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[26].AsString := dm2.CdsLancamentosaPrazoTIPO_VENDA.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[27].AsString := dm2.CdsLancamentosaPrazoTIPO_PAGAMENTO.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[28].AsString := dm2.CdsLancamentosaPrazoENTRADA_SAIDA.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[29].AsString := dm2.CdsLancamentosaPrazoETIQUETA.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[30].AsString := dm2.CdsLancamentosaPrazoENTREGA.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[31].AsTime := dm2.CdsLancamentosaPrazoHORA.AsDateTime;
              dm2.FDAtualizaLancamentosAPrazo.Params[32].AsFloat := dm2.CdsLancamentosaPrazoESTOQUE_POSVENDA.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[33].AsString := dm2.CdsLancamentosaPrazoTROCA.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[34].AsString := dm2.CdsLancamentosaPrazoENVIADO.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[35].AsFloat := dm2.CdsLancamentosaPrazoNUMERO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[36].AsFloat := dm2.CdsLancamentosaPrazoTERMINAL.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[37].AsString := dm2.CdsLancamentosaPrazoUSUARIO.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[38].AsString := dm2.CdsLancamentosaPrazoOBSERVACAO.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[39].AsFloat := dm2.CdsLancamentosaPrazoARREDONDAMENTO.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[40].AsString := dm2.CdsLancamentosaPrazoTRN.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[41].AsString := dm2.CdsLancamentosaPrazoTRANSACAOTRN.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[42].AsString := dm2.CdsLancamentosaPrazoLOTETRN.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[43].AsString := dm2.CdsLancamentosaPrazoAUTORIZACAOTRN.AsString;
              dm2.FDAtualizaLancamentosAPrazo.Params[44].AsFloat := dm2.CdsLancamentosaPrazoSUBSIDIOTRN.AsFloat;
              dm2.FDAtualizaLancamentosAPrazo.Params[45].AsString := dm2.CdsLancamentosaPrazoNOTAMANUAL.AsString;
              Try
                dm2.FDAtualizaLancamentosAPrazo.Execsql(False);
              Except
                GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Lancamentos Prazo - Execução da Procedure');
              End;

              dm2.CdsLancamentosaPrazo.Next;
          end;


         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER LANCAMENTOS_APRAZO_AI0 ACTIVE';
           dm3.FDSql.Execsql(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;

       dm2.CdsLancamentosaPrazo.Close;
     end;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Lancamentos a Prazo');
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER LANCAMENTOS_APRAZO_AI0 ACTIVE';
           dm3.FDSql.Execsql(True);
         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            end;
         End;
         dm2.CdsLancamentosaPrazo.Close;
         Exit;
       end;
   end;
end;

procedure Controlador;
begin
  GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Controlador...');
  try
    dm3.CdsControlador.Close;
    dm3.FDControlador.sql.text := 'SELECT COUNT(ID_PRODUTO) AS N_ITENS, ' +
                                  'SUM(ESTOQUE_' + InttoStr(Filial) + ') AS N_UNIDADES, ' +
                                  'SUM(CUSTO_UNITARIO_' + InttoStr(Filial) + ') AS T_CUSTO, ' +
                                  'SUM(PRECO_VENDA) AS T_VENDA ' +
                                  'FROM PRODUTOS';

    dm3.CdsControlador.Open;

    (dm3.HTTPRIO1 as IDmProcessa).Processa(0, Filial, dm3.CdsControlador.Data);
  except
    on E:Exception do
     begin
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

      dm3.CdsControlador.Close;
      Exit;
    end;
  end;
end;

procedure Testando;
begin
  InputBox('Client', 'Client', 'Client');
end;

procedure VerificaConexao;

begin

  if  validafilial then
   begin
    GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - CNPJ da Filial foi validado com sucesso.');
   end
   else
   begin
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Filial (CNPJ) não encontrada na gestão..');
    Close;
    Application.Terminate;
    Exit;
   end;

end;



procedure ConfereProdutos;
var
    nDeletados : Integer;
begin
  Try
    nDeletados := 0;
    dm2.CdsIdProduto.Close;
    dm2.CdsIdProduto.CreateDataSet;
    Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(1010, Filial, 'A');



    if Dados <> null then
     begin
       dm2.CdsIdProduto.Data := Dados;
       dm2.CdsIdProduto.Open;
       if dm2.CdsIdProduto.RecordCount > 0 then
        begin

              dm3.CdsIdProdutosLoja.Open;
              dm3.CdsIdProduto.IndexFieldNames := 'ID_PRODUTO';
              dm3.CdsIdProdutosLoja.IndexFieldNames := 'ID_PRODUTO';
              dm3.CdsIdProdutosLoja.Open;
              dm3.CdsIdProdutosLoja.First;
              while not dm3.CdsIdProdutosLoja.Eof do
               begin
                 if not dm3.CdsIdProduto.FindKey([dm3.CdsIdProdutosLojaID_PRODUTO.AsFloat]) then
                   begin
                    dm3.CdsIdProdutosLoja.Delete;
                    Inc(nDeletados);
                   end
                 else
                    dm3.CdsIdProdutosLoja.Next;
               end;
              dm3.CdsIdProdutosLoja.ApplyUpdates(0);

              GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Na consistencia de Produtos foram deletados: ' + FloatToStr(nDeletados));
        end;

       nDeletados := 0;
       if dm3.CdsIdProdutosLoja.RecordCount > 0 then
        begin

              dm3.CdsIdProduto.First;
              while not dm3.CdsIdProduto.Eof do
               begin
                 if dm3.CdsIdProdutosLoja.FindKey([dm3.CdsIdProdutoID_PRODUTO.AsFloat]) then
                   begin
                    dm3.CdsIdProduto.Delete;
                    Inc(nDeletados);
                   end
                 else
                    dm3.CdsIdProduto.Next;
               end;


              Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(1011, Filial, dm3.CdsIdProduto.Data);

              if Dados <> null then
               begin

                 dm3.CdsIncluiProdutos.Data := Dados;
                 dm3.CdsIncluiProdutos.Open; // virtual
                 if dm3.CdsIncluiProdutos.RecordCount > 0 then
                    begin
                       dm3.CdsIncluiProdutos.First;
                       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Novos Produtos Recebidos: ' + FloatToStr(dm3.CdsIncluiProdutos.RecordCount));
                       while not dm3.CdsIncluiProdutos.Eof do
                        begin
                          dm3.CdsCeProdutos.Close;
                          dm3.TbCeProdutos.sql.text := 'SELECT ID_PRODUTO FROM PRODUTOS WHERE ID_PRODUTO = ' + dm3.CdsIncluiProdutosID_PRODUTO.AsString;
                          dm3.CdsCeProdutos.FetchParams;
                          dm3.CdsCeProdutos.Open;
                          if dm3.CdsCeProdutos.RecordCount = 0 then
                           begin
                             Id_Produto       := dm3.CdsIncluiProdutosID_PRODUTO.AsString;
                             Cd_Produto       := QuotedStr(dm3.CdsIncluiProdutosCD_PRODUTO.AsString);
                             CodigoBarras     := QuotedStr(dm3.CdsIncluiProdutosCODIGO_BARRAS_1.AsString);
                             if dm3.CdsIncluiProdutosCODIGO_BARRAS_2.IsNull then
                                 CodigoBarras2     := QuotedStr('')
                             else
                                 CodigoBarras2     := QuotedStr(dm3.CdsIncluiProdutosCODIGO_BARRAS_2.AsString);
                             Descricao        := QuotedStr(dm3.CdsIncluiProdutosDESCRICAO.AsString);
                             Cd_Laboratorio   := dm3.CdsIncluiProdutosCD_LABORATORIO.AsString;
                             Cd_Grupo         := dm3.CdsIncluiProdutosCD_GRUPO.AsString;
                             Cd_Classe        := dm3.CdsIncluiProdutosCD_CLASSE.AsString;
                             TipoProduto      := QuotedStr(dm3.CdsIncluiProdutosTIPO_PRODUTO.AsString);
                             EntraPE          := QuotedStr(dm3.CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO.AsString);

                             if not (dm3.CdsIncluiProdutosCD_SUBGRUPO.IsNull) then
                                Cd_SubGrupo      := StrTran(StrTran(dm3.CdsIncluiProdutosCD_SUBGRUPO.AsString, '.', ''), ',', '.')
                             else
                                Cd_SubGrupo      := 'NULL';
                             if not (dm3.CdsIncluiProdutosCD_LISTA.IsNull) then
                                Cd_Lista         := StrTran(StrTran(dm3.CdsIncluiProdutosCD_LISTA.AsString, '.', ''), ',', '.')
                             else
                                Cd_Lista         := 'NULL';
                             if not (dm3.CdsIncluiProdutosCD_PRINCIPIO.IsNull) then
                                Cd_Principio     := StrTran(StrTran(dm3.CdsIncluiProdutosCD_PRINCIPIO.AsString, '.', ''), ',', '.')
                             else
                                Cd_Principio     := 'NULL';
                             if not (dm3.CdsIncluiProdutosTX_DESCONTO.IsNull) then
                                TxDesconto       := StrTran(StrTran(dm3.CdsIncluiProdutosTX_DESCONTO.AsString, '.', ''), ',', '.')
                             else
                                TxDesconto       := QuotedStr('0');
                             if not (dm3.CdsIncluiProdutosIDENTIFICADOR.IsNull) and (dm3.CdsIncluiProdutosIDENTIFICADOR.AsString <> '')  then
                                Identificador    := QuotedStr(dm3.CdsIncluiProdutosIDENTIFICADOR.AsString)
                             else
                                Identificador    := QuotedStr('M');
                             if not (dm3.CdsIncluiProdutosBALANCA.IsNull) and (dm3.CdsIncluiProdutosBALANCA.AsString <> '')  then
                                Balanca          := QuotedStr(dm3.CdsIncluiProdutosBALANCA.AsString)
                             else
                                Balanca          := QuotedStr('N');
                             if not (dm3.CdsIncluiProdutosUNIDADE.IsNull) and (dm3.CdsIncluiProdutosUNIDADE.AsString <> '')  then
                                Unidade          := QuotedStr(dm3.CdsIncluiProdutosUNIDADE.AsString)
                             else
                                Unidade          := QuotedStr('UN');
                             if not dm3.CdsIncluiProdutosQT_EMBALAGEM.IsNull then
                                Qt_Embalagem     := StrTran(StrTran(dm3.CdsIncluiProdutosQT_EMBALAGEM.AsString, '.', ''), ',', '.')
                             else
                                Qt_Embalagem     := QuotedStr('0');
                             if not dm3.CdsIncluiProdutosCOMISSAO.IsNull then
                                Comissao         := StrTran(StrTran(dm3.CdsIncluiProdutosCOMISSAO.AsString, '.', ''), ',', '.')
                             else
                                Comissao         := QuotedStr('0');
                             if not dm3.CdsIncluiProdutosCUSTO_UNITARIO.IsNull then
                                CustoUnitario    := StrTran(StrTran(dm3.CdsIncluiProdutosCUSTO_UNITARIO.AsString, '.', ''), ',', '.')
                             else
                                CustoUnitario    := QuotedStr('0');
                             if not dm3.CdsIncluiProdutosPRECO_VENDA.IsNull then
                                Preco_Venda      := StrTran(StrTran(dm3.CdsIncluiProdutosPRECO_VENDA.AsString, '.', ''), ',', '.')
                             else
                                Preco_Venda      := QuotedStr('0');
                             if not dm3.CdsIncluiProdutosPRECO_PROMOCAO.IsNull then
                                Preco_Promocao   := StrTran(StrTran(dm3.CdsIncluiProdutosPRECO_PROMOCAO.AsString, '.', ''), ',', '.')
                             else
                                Preco_Promocao   := QuotedStr('0');
                             if not dm3.CdsIncluiProdutosICMS.IsNull then
                                Icms             := QuotedStr(dm3.CdsIncluiProdutosICMS.AsString)
                             else
                                Icms             := QuotedStr('FF');
                             if not dm3.CdsIncluiProdutosMARGEM.IsNull then
                                Margem           := StrTran(StrTran(dm3.CdsIncluiProdutosMARGEM.AsString, '.', ''), ',', '.')
                             else
                                Margem           := QuotedStr('0');
                             if not dm3.CdsIncluiProdutosMARGEM_PROMOCAO.IsNull then
                                Margem_Promocao  := StrTran(StrTran(dm3.CdsIncluiProdutosMARGEM_PROMOCAO.AsString, '.', ''), ',', '.')
                             else
                                Margem_Promocao  := QuotedStr('0');
                             if not dm3.CdsIncluiProdutosDT_CADASTRO.IsNull then
                                Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', dm3.CdsIncluiProdutosDT_CADASTRO.AsDateTime))
                             else
                                Dt_Cadastro      := QuotedStr(FormatDateTime('mm/dd/yyyy', Date));
                             if not dm3.CdsIncluiProdutosCURVA.IsNull then
                                Curva            := QuotedStr(dm3.CdsIncluiProdutosCURVA.AsString)
                             else
                                Curva            := QuotedStr('C');
                             if not dm3.CdsIncluiProdutosSTATUS.IsNull then
                                Status           := QuotedStr(dm3.CdsIncluiProdutosSTATUS.AsString)
                             else
                                Status           := QuotedStr('A');
                             if not dm3.CdsIncluiProdutosUSOCONTINUO.IsNull then
                                UsoContinuo      := QuotedStr(dm3.CdsIncluiProdutosUSOCONTINUO.AsString)
                             else
                                UsoContinuo      := QuotedStr('N');
                             if not dm3.CdsIncluiProdutosPIS_COFINS.IsNull then
                                PisCofins      := QuotedStr(dm3.CdsIncluiProdutosPIS_COFINS.AsString)
                             else
                                PisCofins      := QuotedStr('N');
                             if not dm3.CdsIncluiProdutosNCM.IsNull then
                                NCM      := QuotedStr(dm3.CdsIncluiProdutosNCM.AsString)
                             else
                                NCM      := QuotedStr('');

                             dm3.FDSql.sql.text := 'INSERT INTO PRODUTOS (ID_PRODUTO, CD_PRODUTO, CODIGO_BARRAS_1, CODIGO_BARRAS_2, DESCRICAO, ' +
                                                 ' CD_LABORATORIO, CD_GRUPO, CD_CLASSE, TIPO_PRODUTO, IDENTIFICADOR, QT_EMBALAGEM, ' +
                                                 ' COMISSAO, CUSTO_UNITARIO, CUSTO_UNITARIO_' + IntToStr(Filial) + ', CUSTO_MEDIO, CUSTO_MEDIO_' + IntToStr(Filial) +
                                                 ', PRECO_VENDA, PRECO_PROMOCAO, ICMS, ' +
                                                 ' MARGEM, MARGEM_PROMOCAO, DT_CADASTRO, CURVA, ENTRA_PEDIDO_ELETRONICO, STATUS, ' +
                                                 ' CD_LISTA, CD_PRINCIPIO, USOCONTINUO, PIS_COFINS, NCM, CD_SUBGRUPO ) VALUES (' +
                                                 Id_Produto + ',' + Cd_Produto + ',' + CodigoBarras + ',' + CodigoBarras2 + ',' + Descricao + ',' +
                                                 Cd_Laboratorio + ',' + Cd_Grupo + ',' + Cd_Classe + ',' + TipoProduto + ',' +
                                                 Identificador + ',' + Qt_Embalagem + ',' + Comissao + ',' +
                                                 CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' + CustoUnitario + ',' +
                                                 Preco_Venda + ',' + Preco_Promocao + ',' + Icms + ',' + Margem + ',' +
                                                 Margem_Promocao + ',' + Dt_Cadastro + ',' + Curva + ',' + EntraPE + ',' + Status + ',' +
                                                 Cd_Lista + ',' + Cd_Principio + ',' + UsoContinuo + ',' + PisCofins + ',' + NCM + ', ' + Cd_SubGrupo + ')';

                             Try
                               dm3.FDSql.ExecFD(True);
                             Except
                             End;

                           end;
                          dm3.CdsIncluiProdutos.Next;
                        end;
                       dm3.CdsIncluiProdutos.Close;
                       dm3.CdsCeProdutos.Close;
                    end;

                  //GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Na consistencia de Produtos foram incluidos: ' + FloatToStr(nDeletados));
               end;
        end;
     end;
  except
    on E:Exception do
     begin

       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro conferindo produtos - '+ E.Message + ' --- ' + dm3.FDSql.sql.text);
       dm3.CdsIdProdutosLoja.Close;
       dm3.CdsIdProduto.Close;
       Exit;
     end;
  End;

end;


procedure RecebendoEncartes;
var i : integer;
Dados : Variant;
begin
   Try
     dm32.CdsEncartes.Close;
     dm32.CdsEncartes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(146, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm32.CdsEncartes.Data := Dados;
     dm32.CdsEncartes.Open; // virtual
     dm32.CdsEncartes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Encartes: '+ FloatToStr(dm32.CdsEncartes.RecordCount));
     while not dm32.CdsEncartes.Eof do
      begin
        dm32.QryEncartes.Close;
        dm32.QryEncartes.Params[0].AsFloat := dm32.CdsEncartesID_ENCARTE.AsFloat;
        dm32.QryEncartes.Open;
        if dm32.QryEncartes.RecordCount = 0 then
           dm32.QryEncartes.Append
        else
           dm32.QryEncartes.Edit;
         for i := 0 to dm32.QryEncartes.FieldCount - 1 do
            dm32.QryEncartes.Fields[i].Value := dm32.CdsEncartes.Fields[i].Value;
         dm32.QryEncartes.Post;

         dm32.QryEncartes.ApplyUpdates(0);

         dm32.CdsEncartes.Next;
      end;
     dm32.CdsEncartes.Close;
     dm32.QryEncartes.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Encartes');
         dm32.CdsEncartes.Close;
         dm32.QryEncartes.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoItensEncartes;
var i : integer;
Dados : Variant;
begin
   Try
     dm32.CdsItensEncartes.Close;
     dm32.CdsItensEncartes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(147, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm32.CdsItensEncartes.Data := Dados;
     dm32.CdsItensEncartes.Open; // virtual
     dm32.CdsItensEncartes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Itens Encartes: '+ FloatToStr(dm32.CdsItensEncartes.RecordCount));
     while not dm32.CdsItensEncartes.Eof do
      begin
        dm32.QryItensEncartes.Close;
        dm32.QryItensEncartes.Params[0].AsFloat := dm32.CdsItensEncartesID_ENCARTE.AsFloat;
        dm32.QryItensEncartes.Params[1].AsFloat := dm32.CdsItensEncartesID_PRODUTO.AsFloat;
        dm32.QryItensEncartes.Open;
        if dm32.QryItensEncartes.RecordCount = 0 then
           dm32.QryItensEncartes.Append
        else
           dm32.QryItensEncartes.Edit;
         for i := 0 to dm32.QryItensEncartes.FieldCount - 1 do
            dm32.QryItensEncartes.Fields[i].Value := dm32.CdsItensEncartes.Fields[i].Value;
         dm32.QryItensEncartes.Post;

         dm32.QryItensEncartes.ApplyUpdates(0);

         dm32.CdsItensEncartes.Next;
      end;
     dm32.CdsItensEncartes.Close;
     dm32.QryItensEncartes.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Itens Encartes');
         dm32.CdsItensEncartes.Close;
         dm32.QryItensEncartes.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoRedes;
var i : integer;
Dados : Variant;
begin
   Try

     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_CADASTRO_REDES INACTIVE';
     dm3.FDSql.ExecFD(True);



     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_INC_REDES INACTIVE';
     dm3.FDSql.ExecFD(True);


     dm32.CdsRedes.Close;
     dm32.CdsRedes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(133, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm32.CdsRedes.Data := Dados;
     dm32.CdsRedes.Open; // virtual
     dm32.CdsRedes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Redes: '+ FloatToStr(dm32.CdsRedes.RecordCount));
     while not dm32.CdsRedes.Eof do
      begin
        dm32.QryRedes.Close;
        dm32.QryRedes.Params[0].AsFloat := dm32.CdsRedesID_REDE.AsFloat;
        dm32.QryRedes.Open;
        if dm32.QryRedes.RecordCount = 0 then
           dm32.QryRedes.Append
        else
           dm32.QryRedes.Edit;
         for i := 0 to dm32.QryRedes.FieldCount - 1 do
            dm32.QryRedes.Fields[i].Value := dm32.CdsRedes.Fields[i].Value;
         dm32.QryRedes.Post;

         dm32.QryRedes.ApplyUpdates(0);

         dm32.CdsRedes.Next;
      end;
     dm32.CdsRedes.Close;
     dm32.QryRedes.Close;


     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_CADASTRO_REDES ACTIVE';
     dm3.FDSql.ExecFD(True);



     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_INC_REDES ACTIVE';
     dm3.FDSql.ExecFD(True);

   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Redes');


         dm3.FDSql.sql.text := 'ALTER TRIGGER TG_AT_DT_CADASTRO_REDES ACTIVE';
         dm3.FDSql.ExecFD(True);



         dm3.FDSql.sql.text := 'ALTER TRIGGER TG_INC_REDES ACTIVE';
         dm3.FDSql.ExecFD(True);


         dm32.CdsRedes.Close;
         dm32.QryRedes.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoConcorrentes;
var i : integer;
Dados : Variant;
begin
   Try

     dm3.FDSql.sql.text := 'ALTER TRIGGER CONCORRENTES_BIU0 INACTIVE';
     dm3.FDSql.ExecFD(True);


     dm32.CdsConcorrentes.Close;
     dm32.CdsConcorrentes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(134, Filial, 'A');
     if (Dados = null) then
      begin

        dm3.FDSql.sql.text := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
        dm3.FDSql.ExecFD(True);

        Exit;
      end;
     dm32.CdsConcorrentes.Data := Dados;
     dm32.CdsConcorrentes.Open; // virtual
     dm32.CdsConcorrentes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Concorrentes: '+ FloatToStr(dm32.CdsConcorrentes.RecordCount));
     while not dm32.CdsConcorrentes.Eof do
      begin
        dm32.QryConcorrentes.Close;
        dm32.QryConcorrentes.Params[0].AsFloat := dm32.CdsConcorrentesID_CONCORRENTE.AsFloat;
        dm32.QryConcorrentes.Open;
        if dm32.QryConcorrentes.RecordCount = 0 then
           dm32.QryConcorrentes.Append
        else
           dm32.QryConcorrentes.Edit;
         for i := 0 to dm32.QryConcorrentes.FieldCount - 1 do
            dm32.QryConcorrentes.Fields[i].Value := dm32.CdsConcorrentes.Fields[i].Value;
         dm32.QryConcorrentes.Post;

         dm32.QryConcorrentes.ApplyUpdates(0);

         dm32.CdsConcorrentes.Next;
      end;
     dm32.CdsConcorrentes.Close;
     dm32.QryConcorrentes.Close;


     dm3.FDSql.sql.text := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
     dm3.FDSql.ExecFD(True);

   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Concorrentes');


         dm3.FDSql.sql.text := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
         dm3.FDSql.ExecFD(True);


         dm32.CdsConcorrentes.Close;
         dm32.QryConcorrentes.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoProjetosPharmalink;
var i : integer;
Dados : Variant;
begin
   Try
     //dm3.CdsProjetosPharmalink.Close;
     dm3.CdsProjetosPharmalink.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(152, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsProjetosPharmalink.Data := Dados;
     dm3.CdsProjetosPharmalink.Open; // virtual
     dm3.CdsProjetosPharmalink.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Projetos Pharmalink: '+ FloatToStr(dm3.CdsProjetosPharmalink.RecordCount));
     while not dm3.CdsProjetosPharmalink.Eof do
      begin
        dm3.QryProjetosPharmalink.Close;
        dm3.QryProjetosPharmalink.Params[0].AsFloat := dm3.CdsProjetosPharmalinkID_PROJETO.AsFloat;
        dm3.QryProjetosPharmalink.Open;
        if dm3.QryProjetosPharmalink.RecordCount = 0 then
           dm3.QryProjetosPharmalink.Append
        else
           dm3.QryProjetosPharmalink.Edit;
         for i := 0 to dm3.QryProjetosPharmalink.FieldCount - 1 do
            dm3.QryProjetosPharmalink.Fields[i].Value := dm3.CdsProjetosPharmalink.Fields[i].Value;
         dm3.QryProjetosPharmalink.Post;

         dm3.QryProjetosPharmalink.ApplyUpdates(0);

         dm3.CdsProjetosPharmalink.Next;
      end;
     dm3.CdsProjetosPharmalink.Close;
     dm3.QryProjetosPharmalink.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Concorrentes');


         dm3.FDSql.sql.text := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
         dm3.FDSql.ExecFD(True);


         dm3.QryProjetosPharmalink.Close;
         dm3.CdsProjetosPharmalink.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoPerfilCliente;
var i : integer;
Dados : Variant;
begin
   Try
     dm32.CdsPerfilCliente.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(153, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm32.CdsPerfilCliente.Data := Dados;
     dm32.CdsPerfilCliente.Open; // virtual
     dm32.CdsPerfilCliente.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Perfis de Cliente: '+ FloatToStr(dm32.CdsPerfilCliente.RecordCount));
     while not dm32.CdsPerfilCliente.Eof do
      begin
        dm32.QryPerfilCliente.Close;
        dm32.QryPerfilCliente.Params[0].AsFloat := dm32.CdsPerfilClienteID_PERFIL_CLIENTE.AsFloat;
        dm32.QryPerfilCliente.Open;
        if dm32.QryPerfilCliente.RecordCount = 0 then
           dm32.QryPerfilCliente.Append
        else
           dm32.QryPerfilCliente.Edit;
        for i := 0 to dm32.QryPerfilCliente.FieldCount - 1 do
           dm32.QryPerfilCliente.Fields[i].Value := dm32.CdsPerfilCliente.Fields[i].Value;
        dm32.QryPerfilCliente.Post;

        dm32.QryPerfilCliente.ApplyUpdates(0);

        dm32.CdsPerfilCliente.Next;
      end;
     dm32.CdsPerfilCliente.Close;
     dm32.QryPerfilCliente.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Perfis de Cliente');

         dm32.QryPerfilCliente.Close;
         dm32.CdsPerfilCliente.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoPrecosConcorrentes;
var i : integer;
Dados : Variant;
begin
   Try

     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES INACTIVE';
     dm3.FDSql.ExecFD(True);


     dm32.CdsPrecosConcorrentes.Close;
     dm32.CdsPrecosConcorrentes.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(148, Filial, 'A');
     if (Dados = null) then
      begin

        dm3.FDSql.sql.text := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES ACTIVE';
        dm3.FDSql.ExecFD(True);

        Exit;
      end;
     dm32.CdsPrecosConcorrentes.Data := Dados;
     dm32.CdsPrecosConcorrentes.Open; // virtual
     dm32.CdsPrecosConcorrentes.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Precos Concorrentes: '+ FloatToStr(dm32.CdsPrecosConcorrentes.RecordCount));
     while not dm32.CdsPrecosConcorrentes.Eof do
      begin
        dm32.QryPrecosConcorrentes.Close;
        dm32.QryPrecosConcorrentes.Params[0].AsFloat := dm32.CdsPrecosConcorrentesID_CONCORRENTE.AsFloat;
        dm32.QryPrecosConcorrentes.Params[1].AsFloat := dm32.CdsPrecosConcorrentesID_PRODUTO.AsFloat;
        dm32.QryPrecosConcorrentes.Open;
        if dm32.QryPrecosConcorrentes.RecordCount = 0 then
           dm32.QryPrecosConcorrentes.Append
        else
           dm32.QryPrecosConcorrentes.Edit;
         for i := 0 to dm32.QryPrecosConcorrentes.FieldCount - 1 do
            dm32.QryPrecosConcorrentes.Fields[i].Value := dm32.CdsPrecosConcorrentes.Fields[i].Value;
         dm32.QryPrecosConcorrentes.Post;

         dm32.QryPrecosConcorrentes.ApplyUpdates(0);

         dm32.CdsPrecosConcorrentes.Next;
      end;
     dm32.CdsPrecosConcorrentes.Close;
     dm32.QryPrecosConcorrentes.Close;


     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES ACTIVE';
     dm3.FDSql.ExecFD(True);

   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Precos Concorrentes');


         dm3.FDSql.sql.text := 'ALTER TRIGGER TG_INC_PROD_CONCORRENTES ACTIVE';
         dm3.FDSql.ExecFD(True);


         dm32.CdsPrecosConcorrentes.Close;
         dm32.QryPrecosConcorrentes.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoPrecosConcorrentesDeletados;
var
  Dados : Variant;
begin
   Try

     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES INACTIVE';
     dm3.FDSql.ExecFD(True);


     dm32.CdsPrecosConcorrentesDeletados.Close;
     dm32.CdsPrecosConcorrentesDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(149, Filial, 'A');
     if (Dados = null) then
      begin

        dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES ACTIVE';
        dm3.FDSql.ExecFD(True);

        Exit;
      end;
     dm32.CdsPrecosConcorrentesDeletados.Data := Dados;
     dm32.CdsPrecosConcorrentesDeletados.Open; // virtual
     dm32.CdsPrecosConcorrentesDeletados.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Precos Concorrentes Deletados: '+ FloatToStr(dm32.CdsPrecosConcorrentesDeletados.RecordCount));
     while not dm32.CdsPrecosConcorrentesDeletados.Eof do
      begin

        dm3.FDSql.sql.text := 'DELETE FROM PROD_CONCORRENTES WHERE ID_CONCORRENTE = ' + dm32.CdsPrecosConcorrentesDeletados.FieldByName('ID_CONCORRENTE').AsString +
                                             ' AND ID_PRODUTO = ' + dm32.CdsPrecosConcorrentesDeletados.FieldByName('ID_PRODUTO').AsString;
        Try
          dm3.FDSql.ExecFD(True);
        Except
        End;

        dm32.CdsPrecosConcorrentesDeletados.Next;
      end;
     dm32.CdsPrecosConcorrentesDeletados.Close;


     dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES ACTIVE';
     dm3.FDSql.ExecFD(True);

   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Precos Concorrentes Deletados');


         dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_PROD_CONCORRENTES ACTIVE';
         dm3.FDSql.ExecFD(True);


         dm32.CdsPrecosConcorrentesDeletados.Close;
         Exit;
       end;
   end;
end;

function RecebendoContasReceberDeletados : Boolean;
var
 LResponse: IResponse;
  TJsonContasRecebDeletados :TJSONObject;

begin
   Try
     Result := True;

     dm3.CdsContasReceberDeletados.Close;
     dm3.CdsContasReceberDeletados.CreateDataSet;
        //Processa(150, Filial, 'A');

     TJsonContasRecebDeletados:=TJSONObject.Create;
      LResponse := TRequest.New.BaseURL(dm.BaseUrl )
      .Resource('compras/'+filial)
      .Accept('application/json')
      .Get;

     if LResponse.StatusCode <>200 then
      begin
        Result := False;
        Exit;
      end
      else
      begin
         dm3.CdsContasReceberDeletados.LoadFromJSON(LResponse.Content);
         dm3.CdsContasReceberDeletados.Open; // virtual

         if dm3.CdsContasReceberDeletados.RecordCount > 0 then
            begin
               dm3.CdsContasReceberDeletados.First;

               GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Contas Receber Deletadas: '+ FloatToStr(dm3.CdsContasReceberDeletados.RecordCount));
               while not dm3.CdsContasReceberDeletados.Eof do
                begin
                  dm2.FDAtualizaDeletados.Params[0].AsString := 'CONTAS_RECEBER';
                  dm2.FDAtualizaDeletados.Params[1].AsString := 'CD_CONTAS_RECEBER';
                  dm2.FDAtualizaDeletados.Params[2].AsString := dm3.CdsContasReceberDeletadosID_PRODUTO.AsString;
                  Try
                    dm2.FDAtualizaDeletados.Execsql(False);
                  Except
                  End;

                  dm3.CdsContasReceberDeletados.Next;
                end;
            end;

         dm3.CdsContasReceberDeletados.Close;
      end;
   Except
      on E:Exception do
       begin
         Result := False;
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Deletar Contas Receber');
         dm3.CdsContasReceberDeletados.Close;
         Exit;
       end;
   end;
end;

procedure ProcessarConsistencia;
var i : integer;
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
     dm.fdconn.Close;
     dm.fdconn.Params.Values['Database'] := Caminho + '\Farmax.fdb';
      if Senha <> '' then
        dm.fdconn.Params.Values['Password'] := Senha
      else
        dm.fdconn.Params.Values['Password'] := 'masterkey';
     dm.fdconn.Open;
  Except
      GravaLog('Sem conexão com o banco no caminho: ' + Caminho + '\Farmax.fdb');
      //TrayIcon1.Animate := False;
      Close;
      Application.Terminate;
      Halt;
      Exit;
  End;

  dm3.HTTPRIO1.URL := 'http://' + Servidor + '/ExporterServer/ExporterServer.exe/soap/IDm';

  //TrayIcon1.Animate := True;

  //tenta disparar o servidor de aplicacao na matriz....caso nao consiga, grava no log e sai.
  Filial := 0;
  for i := 1 to 10 do
    begin
      try

        dm3.CdsParametros.Open;

        if dm3.CdsParametrosTIPO_LOJA.AsString = 'U' then
         begin
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja cadastrada como loja única.');
           Exit;
         end;
        Filial := dm3.CdsParametros.Fields[0].AsInteger;
      except
        on E:Exception do
         begin
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

          Delay(5);
         end;
      end;
      if Filial <> 0 then
        break;
    end;

    if Filial = 0 then
      begin
        GravaLog('O Servidor Matriz não foi localizado... - '+ FormatDateTime('hh:mm:ss',Time));
        //TrayIcon1.Animate := False;
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
  ConsistenciaUsuarios;
  ConsistenciaConvenios;
  //ConsistenciaClientes;
  ConsistenciaContasReceber;

  ConsistenciaEstoque;

  ConsistenciaProdutosPrecoQuantidade;
  ConsistenciaProdutosFidelidade;

  Consistencia := 'N';
  AssignFile(Importer, ExtractFilePath(Application.ExeName)+'ExporterClient.TXT');
  ReWrite(Importer);
  Writeln(Importer, Caminho);
  Writeln(Importer, Servidor);
  Writeln(Importer, Intervalo);
  Writeln(Importer, Intervalo2);
  Writeln(Importer, AtualizaPrecoVenda);
  Writeln(Importer, Consistencia);
  CloseFile(Importer);

  //TrayIcon1.Animate := False;
  GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - =======================================================');

end;

procedure ConsistenciaClasses;
var Dados : Variant;
begin
  // Consistencia de Classes
  Try

    dm32.CdsClasses.Close;
    dm32.CdsClasses.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Classes - ' + FloattoStr(dm32.CdsClasses.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2001, Filial, dm32.CdsClasses.Data);

    dm32.CdsClasses.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Classes');
        dm32.CdsClasses.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaGrupos;
var Dados : Variant;
begin
  // Consistencia de Grupos
  Try

    dm32.CdsGrupos.Close;
    dm32.CdsGrupos.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Grupos - ' + FloattoStr(dm32.CdsGrupos.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2002, Filial, dm32.CdsGrupos.Data);

    dm32.CdsGrupos.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Grupos');
        dm32.CdsGrupos.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaLaboratorios;
var Dados : Variant;
begin
  // Consistencia de Laboratorios
  Try

    dm32.CdsLaboratorios.Close;
    dm32.CdsLaboratorios.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Laboratorios - ' + FloattoStr(dm32.CdsLaboratorios.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2003, Filial, dm32.CdsLaboratorios.Data);

    dm32.CdsLaboratorios.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Laboratorios');
        dm32.CdsLaboratorios.Close;
        Exit;
      end;
  End;
end;


procedure ConsistenciaFamilias;
var Dados : Variant;
begin
  // Consistencia de Familias
  Try

    dm32.CdsFamilias.Close;
    dm32.CdsFamilias.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Familias - ' + FloattoStr(dm32.CdsFamilias.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2004, Filial, dm32.CdsFamilias.Data);

    dm32.CdsFamilias.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Familias');
        dm32.CdsFamilias.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaGruposCompras;
var Dados : Variant;
begin
  // Consistencia de Grupos de Compras
  Try

    dm32.CdsGruposCompras.Close;
    dm32.CdsGruposCompras.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Grupos de Compras - ' + FloattoStr(dm32.CdsGruposCompras.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2005, Filial, dm32.CdsGruposCompras.Data);

    dm32.CdsGruposCompras.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Grupos de Compras');
        dm32.CdsGruposCompras.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaGruposBalanco;
var Dados : Variant;
begin
  // Consistencia de Grupos de Balanco
  Try

    dm32.CdsGruposBalanco.Close;
    dm32.CdsGruposBalanco.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Grupos de Balanco - ' + FloattoStr(dm32.CdsGruposBalanco.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2006, Filial, dm32.CdsGruposBalanco.Data);

    dm32.CdsGruposBalanco.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Grupos de Balanco');
        dm32.CdsGruposBalanco.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaDistribuidores;
var Dados : Variant;
begin
  // Consistencia de Grupos de Distribuidores
  Try

    dm32.CdsDistribuidores.Close;
    dm32.CdsDistribuidores.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Distribuidores - ' + FloattoStr(dm32.CdsDistribuidores.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2007, Filial, dm32.CdsDistribuidores.Data);

    dm32.CdsDistribuidores.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Distribuidores');
        dm32.CdsDistribuidores.Close;
        Exit;
      end;
  End;
end;


procedure ConsistenciaCartoes;
var Dados : Variant;
begin
  // Consistencia de Cartoes
  Try

    dm32.CdsCartoes.Close;
    dm32.CdsCartoes.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Cartoes - ' + FloattoStr(dm32.CdsCartoes.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2008, Filial, dm32.CdsCartoes.Data);

    dm32.CdsCartoes.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Cartoes');
        dm32.CdsCartoes.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaPlanoContas;
var Dados : Variant;
begin
  // Consistencia de Plano de Contas
  Try

    dm32.CdsPlanoContas.Close;
    dm32.CdsPlanoContas.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Plano de Contas - ' + FloattoStr(dm32.CdsPlanoContas.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2009, Filial, dm32.CdsPlanoContas.Data);

    dm32.CdsPlanoContas.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Plano de Contas');
        dm32.CdsPlanoContas.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaVendedores;
var Dados : Variant;
begin
  // Consistencia de Vendedores
  Try

    dm32.CdsVendedores.Close;
    dm32.CdsVendedores.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Vendedores - ' + FloattoStr(dm32.CdsVendedores.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2010, Filial, dm32.CdsVendedores.Data);

    dm32.CdsVendedores.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Vendedores');
        dm32.CdsVendedores.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaUsuarios;
var Dados : Variant;
begin
  // Consistencia de Usuarios
  Try

    dm32.CdsUsuariosConsistencia.Close;
    dm32.CdsUsuariosConsistencia.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Usuarios - ' + FloattoStr(dm32.CdsUsuariosConsistencia.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2015, Filial, dm32.CdsUsuariosConsistencia.Data);

    dm32.CdsUsuariosConsistencia.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Usuarios');
        dm32.CdsUsuariosConsistencia.Close;
        Exit;
      end;
  End;
end;


procedure ConsistenciaProdutosPrecoQuantidade;
var Dados : Variant;
begin
  // Consistencia de Produtos Preço Quantidade
  Try

    dm32.CdsProdutosPrecoQuantidadeConsistencia.Close;
    dm32.CdsProdutosPrecoQuantidadeConsistencia.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Produtos Preço Quantidade - ' + FloattoStr(dm32.CdsProdutosPrecoQuantidadeConsistencia.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2016, Filial, dm32.CdsProdutosPrecoQuantidadeConsistencia.Data);

    dm32.CdsProdutosPrecoQuantidadeConsistencia.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Produtos Preço Quantidade');
        dm32.CdsProdutosPrecoQuantidadeConsistencia.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaProdutosFidelidade;
var Dados : Variant;
begin
  // Consistencia de Produtos Fidelidade
  Try

    dm32.CdsProdutosFidelidadeConsistencia.Close;
    dm32.CdsProdutosFidelidadeConsistencia.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Produtos Fidelidade - ' + FloattoStr(dm32.CdsProdutosFidelidadeConsistencia.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2017, Filial, dm32.CdsProdutosFidelidadeConsistencia.Data);

    dm32.CdsProdutosFidelidadeConsistencia.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Produtos Fidelidade');
        dm32.CdsProdutosFidelidadeConsistencia.Close;
        Exit;
      end;
  End;
end;


procedure ConsistenciaConvenios;
var Dados : Variant;
begin
  // Consistencia de Convenios
  Try

    dm32.CdsConvenios.Close;
    dm32.CdsConvenios.Open;


    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Consistencia de Convenios - ' + FloattoStr(dm32.CdsConvenios.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2011, Filial, dm32.CdsConvenios.Data);

    dm32.CdsConvenios.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Convenios');
        dm32.CdsConvenios.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaClientes;
var Dados : Variant;
begin
  // Consistencia de Clientes
  Try

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Consistencia de Clientes - ' + FloattoStr(dm32.CdsClientes.RecordCount));
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2012, Filial, '');
    if Dados <> null then
     begin
        dm32.CdsVirtualClientes.CreateDataSet;
        dm32.CdsVirtualClientes.Data := Dados;
        dm32.CdsVirtualClientes.Open;
        if dm32.CdsVirtualClientes.RecordCount > 0 then
         begin
            dm32.CdsVirtualClientes.First;
            dm32.CdsVirtualClientes.Filtered := True;
            dm32.CdsClientes.Close;
            dm32.CdsClientes.Open;
            dm32.CdsClientes.First;
            while not dm32.CdsClientes.Eof do
             begin
               dm32.CdsVirtualClientes.Filter := 'CD_CLIENTE = ' + dm32.CdsClientesCD_CLIENTE.AsString;
               if dm32.CdsVirtualClientes.RecordCount = 0 then
                  dm3.FDSql.sql.text := 'INSERT INTO TEMP_PRODUTOS VALUES (' +  dm32.CdsClientesCD_CLIENTE.AsString + ', ' + dm32.CdsParametrosCD_FILIAL.AsString + ', 14, ' + QuotedStr('') + ')';
               dm32.CdsClientes.Next;
             end;
         end;
     end;



    dm32.CdsVirtualClientes.Close;
    dm32.CdsVirtualClientes.Filter := '';
    dm32.CdsVirtualClientes.Filtered := False;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Clientes');
        dm32.CdsClientes.Close;
        Exit;
      end;
  End;
end;

procedure ConsistenciaContasReceber;
var
 Dados : Variant;
 GeraTemp : Boolean;
 Dias : String;
 Alterados : Integer;
begin
  //Consistencia de Contas a Receber Loja Matriz
  Try

    GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Consistencia de Contas a Receber Loja Matriz');
    Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2013, Filial, '');
    if (Dados <> null) then
     begin
        dm32.CdsVirtualContasReceber.CreateDataSet;
        dm32.CdsVirtualContasReceber.Data := Dados;
        dm32.CdsVirtualContasReceber.Open;

        dm32.CdsVirtualCD.CreateDataSet;
        dm32.CdsVirtualCD.Open;
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - ' + InttoStr(dm32.CdsVirtualContasReceber.RecordCount) + ' - registros recebidos');
        if dm32.CdsVirtualContasReceber.RecordCount > 0 then
         begin
            dm32.CdsVirtualContasReceber.Last;
            Dias := dm32.CdsVirtualContasReceberCD_CONTAS_RECEBER.AsString;
            dm32.CdsVirtualContasReceber.Delete;
            dm32.CdsVirtualContasReceber.First;
            while not dm32.CdsVirtualContasReceber.Eof do
             begin
               dm32.CdsContasReceber.Close;
               dm32.CdsContasReceber.Params[0].AsFloat := dm32.CdsVirtualContasReceber.Fields[0].AsFloat;
               dm32.CdsContasReceber.Open;
               if dm32.CdsContasReceber.RecordCount = 0 then
                begin
                  dm32.CdsVirtualCD.Append;
                  dm32.CdsVirtualCDCD.AsFloat := dm32.CdsVirtualContasReceberCD_CONTAS_RECEBER.AsFloat;
                  dm32.CdsVirtualCD.Post;
                end;
               dm32.CdsVirtualContasReceber.Next;
             end;
           GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Codigos CR para Gestao Loja -> Matriz: ' + IntToSTr(dm32.CdsVirtualCD.RecordCount));
            if dm32.CdsVirtualCD.RecordCount > 0 then
               Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(2014, Filial, dm32.CdsVirtualCD.Data);
         end;
        dm32.CdsVirtualCD.Close;

        GeraTemp := True;
        dm32.CdsVirtualContasReceber.IndexFieldNames := 'CD_CONTAS_RECEBER';
        dm32.CdsVirtualContasReceber.Filtered := True;
        dm32.CdsVirtualContasReceber.First;

        if StrtoFloatDef(Dias, 0) = 0 then
           Dias := '30';

        Alterados := 0;
        dm32.CdsContasReceberTodas.Close;
        dm32.FDContasReceberTodas.sql.text := dm32.FDContasReceberTodas.sql.text + ' WHERE DT_LANCAMENTO >= CURRENT_DATE - ' + Dias;
        dm32.CdsContasReceberTodas.Open;
        dm32.CdsContasReceberTodas.IndexFieldNames := 'CD_CONTAS_RECEBER';
        dm32.CdsContasReceberTodas.First;
        GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Processando no banco local Contas Receber Matriz -> Loja: ' + IntToSTr(dm32.CdsContasReceberTodas.RecordCount));
        while not dm32.CdsContasReceberTodas.Eof do
         begin
           if not dm32.CdsVirtualContasReceber.FindKey([dm32.CdsContasReceberTodasCD_CONTAS_RECEBER.AsFloat]) then
            begin
              try
                dm3.FDSql.sql.text := 'UPDATE CONTAS_RECEBER SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CONTAS_RECEBER = ' + dm32.CdsContasReceberTodasCD_CONTAS_RECEBER.AsString;
                Try
                  dm3.FDSql.ExecFD(True);
                Except
                End;
                Inc(Alterados);
              except
              end;
            end;
           dm32.CdsContasReceberTodas.Next;
         end;
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Contas Receber Reenviados para a Gestao: ' + IntToSTr(Alterados));
     end;

    dm32.CdsVirtualContasReceber.Close;
    dm32.CdsContasReceber.Close;
    dm32.CdsContasReceberTodas.Close;
  Except
    on E:Exception do
      begin

        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Consistencia de Contas a Receber');
        dm32.CdsVirtualContasReceber.Close;
        dm32.CdsContasReceber.Close;
        dm32.CdsContasReceberTodas.Close;
        Exit;
      end;
  End;
end;


procedure RecebendoProdutosFPDeletados;
var Dados : Variant;
begin
  //busca na matriz os Produtos Farmacia Popular Deletados
   Try
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'PRODUTOS_FARMACIA_POPULAR');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Farmacia Popular Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDSql.sql.text := 'DELETE FROM PRODUTOS_FARMACIA_POPULAR WHERE ID_PRODUTO = ' + dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDSql.ExecFD(True);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Farmacia Popular Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoPrincipioAtivo;
var
Dados : Variant;
begin
   Try
     dm32.CdsPrincipioAtivo.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(159, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm32.CdsPrincipioAtivo.Data := Dados;
     dm32.CdsPrincipioAtivo.Open; // virtual
     dm32.CdsPrincipioAtivo.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Principio Ativo: '+ FloatToStr(dm32.CdsPrincipioAtivo.RecordCount));
     while not dm32.CdsPrincipioAtivo.Eof do
      begin
        dm32.QryPrincipioAtivo.Close;
        dm32.QryPrincipioAtivo.Params[0].AsFloat := dm32.CdsPrincipioAtivoCD_PRINCIPIO.AsFloat;
        dm32.QryPrincipioAtivo.Open;
        if dm32.QryPrincipioAtivo.RecordCount = 0 then
           dm32.QryPrincipioAtivo.Append
        else
           dm32.QryPrincipioAtivo.Edit;
        dm32.QryPrincipioAtivoCD_PRINCIPIO.AsFloat := dm32.CdsPrincipioAtivoCD_PRINCIPIO.AsFloat;
        dm32.QryPrincipioAtivoDESCRICAO.AsString := dm32.CdsPrincipioAtivoDESCRICAO.AsString;
        dm32.QryPrincipioAtivo.Post;

        dm32.QryPrincipioAtivo.ApplyUpdates(0);

        dm32.CdsPrincipioAtivo.Next;
      end;
     dm32.CdsPrincipioAtivo.Close;
     dm32.QryPrincipioAtivo.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Principio Ativo');

         dm32.QryPrincipioAtivo.Close;
         dm32.CdsPrincipioAtivo.Close;
         Exit;
       end;
   end;
end;


function RecebendoProdDistr : Boolean;
var
Dados : Variant;
begin
   Result := True;
   Try
     dm32.CdsProdDistr.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(160, Filial, 'A');
     if (Dados = null) then
      begin
        Result := False;
        Exit;
      end;
     dm32.CdsProdDistr.Data := Dados;
     dm32.CdsProdDistr.Open; // virtual
     dm32.CdsProdDistr.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo ProdDistr: '+ FloatToStr(dm32.CdsProdDistr.RecordCount));
     while not dm32.CdsProdDistr.Eof do
      begin
        dm32.QryProdDistr.Close;
        dm32.QryProdDistr.Params[0].AsFloat := dm32.CdsProdDistrID_PRODUTO.AsFloat;
        dm32.QryProdDistr.Params[1].AsFloat := dm32.CdsProdDistrCD_DISTRIBUIDOR.AsFloat;
        dm32.QryProdDistr.Open;
        if dm32.QryProdDistr.RecordCount = 0 then
         begin
           dm32.QryProdDistr.Append;
           dm32.QryProdDistrID_PRODUTO.AsFloat := dm32.CdsProdDistrID_PRODUTO.AsFloat;
           dm32.QryProdDistrCD_DISTRIBUIDOR.AsFloat := dm32.CdsProdDistrCD_DISTRIBUIDOR.AsFloat;
           dm32.QryProdDistrCD_PRODUTO.AsString := dm32.CdsProdDistrCD_PRODUTO.AsString;
         end
        else
           dm32.QryProdDistr.Edit;

        dm32.QryProdDistrCODIGO.AsFloat := dm32.CdsProdDistrCODIGO.AsFloat;
        dm32.QryProdDistrCODIGO_BARRAS_1.AsString := dm32.CdsProdDistrCODIGO_BARRAS_1.AsString;
        dm32.QryProdDistrQT_EMBALAGEM.AsFloat := dm32.CdsProdDistrQT_EMBALAGEM.AsFloat;

        dm32.QryProdDistr.Post;

        dm32.QryProdDistr.ApplyUpdates(0);

        dm32.CdsProdDistr.Next;
      end;
     dm32.CdsProdDistr.Close;
     dm32.QryProdDistr.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ProdDistr');

         dm32.QryProdDistr.Close;
         dm32.CdsProdDistr.Close;
         Exit;
       end;
   end;
end;


function RecebendoProdutosFisco : Boolean;
var i : integer;
Dados : Variant;
begin
   Result := True;
   Try
     dm32.CdsProdutosFisco.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(161, Filial, 'A');
     if (Dados = null) then
      begin
        Result := False;
        Exit;
      end;
     dm32.CdsProdutosFisco.Data := Dados;
     dm32.CdsProdutosFisco.Open; // virtual
     dm32.CdsProdutosFisco.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Fisco: '+ FloatToStr(dm32.CdsProdutosFisco.RecordCount));
     while not dm32.CdsProdutosFisco.Eof do
      begin
        dm32.QryProdutosFisco.Close;
        dm32.QryProdutosFisco.Params[0].AsFloat := dm32.CdsProdutosFiscoID_PRODUTO.AsFloat;
        dm32.QryProdutosFisco.Open;
        if dm32.QryProdutosFisco.RecordCount = 0 then
           dm32.QryProdutosFisco.Append
        else
           dm32.QryProdutosFisco.Edit;

        for i := 0 to dm32.CdsProdutosFisco.FieldCount - 1 do
            dm32.QryProdutosFisco.Fields[i].Value := dm32.CdsProdutosFisco.Fields[i].Value;

        dm32.QryProdutosFisco.Post;

        dm32.QryProdutosFisco.ApplyUpdates(0);

        dm32.CdsProdutosFisco.Next;
      end;
     dm32.CdsProdutosFisco.Close;
     dm32.QryProdutosFisco.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Fisco');

         dm32.QryProdutosFisco.Close;
         dm32.CdsProdutosFisco.Close;
         Exit;
       end;
   end;
end;

function RecebendoProdutosCompostos : Boolean;
var i : integer;
Dados : Variant;
begin
   Result := True;
   Try
     dm32.CdsProdutosCompostos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(162, Filial, 'A');
     if (Dados = null) then
      begin
        Result := False;
        Exit;
      end;
     dm32.CdsProdutosCompostos.Data := Dados;
     dm32.CdsProdutosCompostos.Open; // virtual
     dm32.CdsProdutosCompostos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Produtos Compostos: '+ FloatToStr(dm32.CdsProdutosCompostos.RecordCount));
     while not dm32.CdsProdutosCompostos.Eof do
      begin
        dm32.QryProdutosCompostos.Close;
        dm32.QryProdutosCompostos.Params[0].AsFloat := dm32.CdsProdutosCompostosID_PRODUTO_PRINCIPAL.AsFloat;
        dm32.QryProdutosCompostos.Params[1].AsFloat := dm32.CdsProdutosCompostosID_PRODUTO_COMPOSICAO.AsFloat;
        dm32.QryProdutosCompostos.Open;
        if dm32.QryProdutosCompostos.RecordCount = 0 then
           dm32.QryProdutosCompostos.Append
        else
           dm32.QryProdutosCompostos.Edit;

        for i := 0 to dm32.CdsProdutosCompostos.FieldCount - 1 do
            dm32.QryProdutosCompostos.Fields[i].Value := dm32.CdsProdutosCompostos.Fields[i].Value;

        dm32.QryProdutosCompostos.Post;

        dm32.QryProdutosCompostos.ApplyUpdates(0);

        dm32.CdsProdutosCompostos.Next;
      end;
     dm32.CdsProdutosCompostos.Close;
     dm32.QryProdutosCompostos.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Compostos');

         dm32.QryProdutosCompostos.Close;
         dm32.CdsProdutosCompostos.Close;
         Exit;
       end;
   end;
end;


procedure FecharTodosDataSets;
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
  dm.fdconn.Close;
end;

Procedure FecharDataSet(Cds : TClientDataSet);
begin
  Cds.Close;
  Cds.IndexFieldNames := '';
  Cds.IndexName := '';
  Cds.Filter := '';
  Cds.Filtered := False;
end;



function EnviandoBalancosFilial : Boolean;
var
 Dados : Variant;
 FD : String;
begin
  //processamento e envio de Balancos Concluidos
  Try
      Result := True;
      Try
          dm3.CdsBalancosFilial.Close;
          FD := dm3.FDBalancosFilial.sql.text;

          dm3.FDBalancosFilial.sql.text := 'INSERT INTO TEMP_BALANCO SELECT FIRST 1 DISTINCT ID_BALANCO FROM BALANCO WHERE (ENVIADO = ' + QuotedStr('C') + ') OR (ENVIADO = ' + QuotedStr('A') + ')';

          dm3.FDBalancosFilial.ExecFD;


          dm3.FDBalancosFilial.sql.text := 'UPDATE BALANCO SET ENVIADO = ' + QuotedStr('9') + ' WHERE ' +
                                                            ' ID_BALANCO IN (SELECT ID_BALANCO FROM TEMP_BALANCO)';

          dm3.FDBalancosFilial.ExecFD;


          dm3.FDBalancosFilial.sql.text := FD;

          dm3.CdsBalancosFilial.Open;


          if dm3.CdsBalancosFilial.RecordCount > 0 then
           begin
             GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Balancos Filial - ' + FloattoStr(dm3.CdsBalancosFilial.RecordCount));
             Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(51, Filial, dm3.CdsBalancosFilial.Data);
             dm3.CdsBalancosFilial.Close;

             dm3.FDSql.sql.text := 'UPDATE BALANCO SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9');

             dm3.FDSql.ExecFD;


             dm3.FDSql.sql.text := 'DELETE FROM TEMP_BALANCO' ;

             dm3.FDSql.ExecFD;

             Result := True;
           end
          else
           begin
             Result := False;
           end;
          dm3.CdsBalancosFilial.Close;
      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Balancos Filial ');
            dm3.CdsBalancosFilial.Close;
            Result := False;
            Exit;
          end;
      End;
  Finally
  End;
end;


function EnviandoContasReceberDeletados : Boolean;
var
 Dados : Variant;
 FD : String;
begin
  //processamento e envio de Contas a Receber Deletados
  Try
      Result := True;
      Try
          dm32.CdsCRDeletados.Close;
          FD := dm32.FDCRDeletados.sql.text;

          dm32.FDCRDeletados.sql.text := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 64' ;

          dm32.FDCRDeletados.ExecFD;


          dm32.FDCRDeletados.sql.text := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE PROCESSO = 64';

          dm32.FDCRDeletados.ExecFD;


          dm32.FDCRDeletados.sql.text := FD;

          dm32.CdsCRDeletados.Open;


          if dm32.CdsCRDeletados.RecordCount > 0 then
           begin
             GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Contas Receber Deletados - ' + FloattoStr(dm32.CdsCRDeletados.RecordCount));
             Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(64, Filial, dm32.CdsCRDeletados.Data);
             dm32.CdsCRDeletados.Close;
             dm32.FDCRDeletados.sql.text := 'DELETE FROM TEMP_PRODUTOS WHERE PROCESSO = 64 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE PROCESSO = 64)';

             dm32.FDCRDeletados.ExecFD;


             dm32.FDCRDeletados.sql.text := 'DELETE FROM TEMP_PRODUTOS2 WHERE PROCESSO = 64' ;

             dm32.FDCRDeletados.ExecFD;

           end
          else
           begin
             Result := False;
           end;
          dm32.CdsCRDeletados.Close;
      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Contas Receber Deletados ');
            dm32.CdsCRDeletados.Close;
            Result := False;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure EnviandoCaixasDeletados;
var Dados : Variant;
begin
  //processamento e envio de Caixas Deletados
  Try
      Try

        dm3.FDSql.sql.text := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('CAIXA');
        dm3.FDSql.ExecFD(True);



        dm3.CdsCaixasDeletados.Open;

        if dm3.CdsCaixasDeletados.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Caixas Deletados - ' + FloattoStr(dm3.CdsCaixasDeletados.RecordCount));
            Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(69, Filial, dm3.CdsCaixasDeletados.Data);
         end;


        dm3.FDSql.sql.text := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('CAIXA');
        dm3.FDSql.ExecFD(True);

      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Caixas Deletados ');
            dm3.CdsCaixasDeletados.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure EnviandoComprasDeletadas;
var Dados : Variant;
begin
  //processamento e envio de Balancos Concluidos
  Try
      Try

        dm3.FDSql.sql.text := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('COMPRAS');
        dm3.FDSql.ExecFD(True);



        dm3.CdsComprasDeletadas.Open;

        if dm3.CdsComprasDeletadas.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Compras Deletadas - ' + FloattoStr(dm3.CdsComprasDeletadas.RecordCount));
            Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(53, Filial, dm3.CdsComprasDeletadas.Data);
         end;


        dm3.FDSql.sql.text := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('COMPRAS');
        dm3.FDSql.ExecFD(True);

      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Compras Deletadas ');
            dm3.CdsComprasDeletadas.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure EnviandoContasPagarDeletadas;
var Dados : Variant;
begin
  //processamento e envio de Balancos Concluidos
  Try
      Try

        dm3.FDSql.sql.text := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('CONTAS_PAGAR');
        dm3.FDSql.ExecFD(True);



        dm32.CdsContasPagarDeletadas.Open;

        if dm32.CdsContasPagarDeletadas.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Contas a Pagar Deletadas - ' + FloattoStr(dm32.CdsContasPagarDeletadas.RecordCount));
            Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(61, Filial, dm32.CdsContasPagarDeletadas.Data);
         end;


        dm3.FDSql.sql.text := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('CONTAS_PAGAR');
        dm3.FDSql.ExecFD(True);

      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Contas a Pagar Deletadas ');
            dm32.CdsContasPagarDeletadas.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure EnviandoClientesDeletados;
var Dados : Variant;
begin
  //processamento e envio de Clientes Deletados
  Try
      Try

        dm3.FDSql.sql.text := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('CLIENTES');
        dm3.FDSql.ExecFD(True);



        dm3.CdsClientesDeletados.Open;

        if dm3.CdsClientesDeletados.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Clientes Deletados - ' + FloattoStr(dm3.CdsClientesDeletados.RecordCount));
            Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(62, Filial, dm3.CdsClientesDeletados.Data);
         end;


        dm3.FDSql.sql.text := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('CLIENTES');
        dm3.FDSql.ExecFD(True);

      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Clientes Deletados ');
            dm3.CdsClientesDeletados.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;

procedure EnviandoSintegraNFEntrada;
var Dados : Variant;
begin
  //processamento e envio de Sintegra_NF_Entrada Deletados
  Try
      Try

        dm3.FDSql.sql.text := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr('SINTEGRA_NF_ENTRADA');
        dm3.FDSql.ExecFD(True);



        dm32.CdsSintegraNFEntradaDeletados.Open;

        if dm32.CdsSintegraNFEntradaDeletados.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Clientes Deletados - ' + FloattoStr(dm32.CdsSintegraNFEntradaDeletados.RecordCount));
            Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(65, Filial, dm32.CdsSintegraNFEntradaDeletados.Data);
         end;


        dm3.FDSql.sql.text := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr('SINTEGRA_NF_ENTRADA');
        dm3.FDSql.ExecFD(True);

      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Clientes Deletados ');
            dm32.CdsSintegraNFEntradaDeletados.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;


procedure EnviandoProdutosTotais;
var
 Dados : Variant;
 Mes : Integer;
begin
  Try
      Try
        dm32.CdsProdutosTotais.Close;
        Mes := StrtoInt(FormatDateTime('mm', Date));
        case Mes of
          1  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.JANVENDA, PRODUTOS_TOTAIS.JANCOMPRA';
          2  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.FEVVENDA, PRODUTOS_TOTAIS.FEVCOMPRA';
          3  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.MARVENDA, PRODUTOS_TOTAIS.MARCOMPRA';
          4  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.ABRVENDA, PRODUTOS_TOTAIS.ABRCOMPRA';
          5  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.MAIVENDA, PRODUTOS_TOTAIS.MAICOMPRA';
          6  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.JUNVENDA, PRODUTOS_TOTAIS.JUNCOMPRA';
          7  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.JULVENDA, PRODUTOS_TOTAIS.JULCOMPRA';
          8  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.AGOVENDA, PRODUTOS_TOTAIS.AGOCOMPRA';
          9  : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.SETVENDA, PRODUTOS_TOTAIS.SETCOMPRA';
          10 : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.OUTVENDA, PRODUTOS_TOTAIS.OUTCOMPRA';
          11 : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.NOVVENDA, PRODUTOS_TOTAIS.NOVCOMPRA';
          12 : dm32.FDProdutosTotais.sql.text := 'SELECT PRODUTOS_TOTAIS.ID_PRODUTO, PRODUTOS_TOTAIS.DEZVENDA, PRODUTOS_TOTAIS.DEZCOMPRA';
        end;

        dm32.FDProdutosTotais.sql.text := dm32.FDProdutosTotais.sql.text +
        ' FROM PRODUTOS_TOTAIS WHERE PRODUTOS_TOTAIS.CD_FILIAL = ' + InttoStr(Filial) + ' AND (PRODUTOS_TOTAIS.ENVIADO IS NULL OR PRODUTOS_TOTAIS.ENVIADO <> ' + QuotedStr('2') + ')';


        dm32.CdsProdutosTotais.Open;

        if dm32.CdsProdutosTotais.RecordCount > 0 then
         begin
            GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Enviando Produtos Totais - ' + FloattoStr(dm32.CdsProdutosTotais.RecordCount));
            Dados := (dm3.HTTPRIO1 as IDmProcessa).Processa(54, Filial, dm32.CdsProdutosTotais.Data);
            dm3.FDSql.sql.text := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 INACTIVE';
            dm3.FDSql.ExecFD(True);
            dm3.FDSql.sql.text := 'UPDATE PRODUTOS_TOTAIS SET ENVIADO = ' + QuotedStr('2') + ' WHERE CD_FILIAL = ' + InttoStr(Filial);
            dm3.FDSql.ExecFD(True);
            dm3.FDSql.sql.text := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 ACTIVE';
            dm3.FDSql.ExecFD(True);
         end;
      Except
        on E:Exception do
          begin

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Produtos Totais ');
            dm3.FDSql.sql.text := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 ACTIVE';
            dm3.FDSql.ExecFD(True);
            dm32.CdsProdutosTotais.Close;
            Exit;
          end;
      End;
  Finally
  End;
end;

procedure RecebendoFiliaisGrupos;
var
Dados : Variant;
begin
   Try
     // Atualiza Filiais Grupos
     dm3.CdsFiliaisGrupos.Close;
     dm3.CdsFiliaisGrupos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(102, Filial, 'A');
     if (Dados = null) then
        Exit;
     dm3.CdsFiliaisGrupos.Data := Dados;
     dm3.CdsFiliaisGrupos.Open; // virtual

     dm3.CdsFiliaisGrupos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Filiais Grupos : ' + FloatToStr(dm3.CdsFiliaisGrupos.RecordCount));
     while not dm3.CdsFiliaisGrupos.Eof do
      begin
          dm3.FDAtualizaFiliaisGrupos.Params[0].AsFloat  := dm3.CdsFiliaisGruposCD_GRUPO.AsFloat;
          dm3.FDAtualizaFiliaisGrupos.Params[1].AsFloat  := dm3.CdsFiliaisGruposTX_COMISSAO.AsFloat;
          dm3.FDAtualizaFiliaisGrupos.Params[2].AsString := dm3.CdsFiliaisGruposDESCONTO.AsString;
          dm3.FDAtualizaFiliaisGrupos.Params[3].AsFloat  := dm3.CdsFiliaisGruposTX_DESCONTO.AsFloat;
          dm3.FDAtualizaFiliaisGrupos.Params[4].AsFloat  := dm3.CdsFiliaisGruposTX_DESCONTO_MAXIMO.AsFloat;
          Try
            dm3.FDAtualizaFiliaisGrupos.ExecFD(False);
          Except
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Filiais Grupos - Execução da Procedure');
          End;

          dm3.CdsFiliaisGrupos.Next;
      end;

     dm3.CdsFiliaisGrupos.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Filiais Grupos');
         dm3.CdsFiliaisGrupos.Close;
         Exit;
       end;
   end;
end;

procedure RecebendoFiliaisGruposDeletados;
var Dados : Variant;
begin
  //busca na matriz os grupos deletados
   Try
     // Atualiza grupos
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'FILIAIS_GRUPOS');
     if (Dados = null) then
        Exit;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     dm3.CdsDeletados.IndexFieldNames := 'CAMPO1';

     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Filiais Grupos Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));

         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDAtualizaDeletados.Params[0].AsString := 'FILIAIS_GRUPOS';
            dm3.FDAtualizaDeletados.Params[1].AsString := 'CD_GRUPO';
            dm3.FDAtualizaDeletados.Params[2].AsString := dm3.CdsDeletadosCAMPO1.AsString;
            Try
              dm3.FDAtualizaDeletados.ExecFD(False);
            Except
            End;

            dm3.CdsDeletados.Next;
          end;
      end;

     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Filiais Grupos Deletados');
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
end;


procedure RecebendoEncartesDeletados;
var Dados : Variant;
begin
  //busca na matriz as EnCartes deletados
   Try
     // Atualiza Encartes
     Try
       dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE INACTIVE';

       dm3.FDSql.ExecFD(True);

     Except
       on E:Exception do
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

        end;
     End;

     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'ENCARTE');
     if (Dados = null) then
      begin
        Try
          dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE ACTIVE';

          dm3.FDSql.ExecFD(True);

        Except
          on E:Exception do
           begin
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

           end;
        End;
        Exit;
      end;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Encartes Deletados - ' + FloattoStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;
         while not dm3.CdsDeletados.Eof do
          begin
            dm3.Cds1.Close;
            dm3.FDSql.sql.text := 'DELETE FROM ENCARTE WHERE ID_ENCARTE = ' + dm3.CdsDeletadosCAMPO1.AsString;

            dm3.FDSql.ExecFD(True);


            dm3.Cds1.Close;
            dm3.CdsDeletados.Next;
          end;
      end;
     dm3.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Encartes Deletados');
         dm3.CdsDeletados.Close;
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE ACTIVE';

           dm3.FDSql.ExecFD(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;
         Exit;
       end;
   end;
  Try
    dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE ACTIVE';

    dm3.FDSql.ExecFD(True);

  Except
    on E:Exception do
     begin
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

     end;
  End;
end;


procedure RecebendoItensEncartesDeletados;
var Dados : Variant;
begin
  //busca na matriz as Encarte Itens deletados
   Try
    Try
      dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE_ITENS INACTIVE';

      dm3.FDSql.ExecFD(True);

    Except
      on E:Exception do
       begin
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

       end;
    End;
     // Atualiza Encarte Itens
     dm3.CdsDeletados.Close;
     dm3.CdsDeletados.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(108, Filial, 'ENCARTE_ITENS');
     if (Dados = null) then
      begin
        Try
          dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE_ITENS ACTIVE';

          dm3.FDSql.ExecFD(True);

        Except
          on E:Exception do
           begin
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

           end;
        End;
        Exit;
      end;
     dm3.CdsDeletados.Data := Dados;
     dm3.CdsDeletados.Open; // virtual
     if dm3.CdsDeletados.RecordCount > 0 then
      begin
         GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Encarte Itens Deletados - ' + FloatToStr(dm3.CdsDeletados.RecordCount));
         dm3.CdsDeletados.First;

         while not dm3.CdsDeletados.Eof do
          begin
            dm3.FDSql.sql.text := 'DELETE FROM ENCARTE_ITENS WHERE ID_ENCARTE = ' + dm3.CdsDeletadosCAMPO1.AsString +
                                ' AND ID_PRODUTO = ' + dm3.CdsDeletadosCAMPO2.AsString;
            Try
              dm3.FDSql.ExecFD(True);
            Except
            End;
            dm3.CdsDeletados.Next;
          end;

      end;
     dm2.CdsDeletados.Close;
   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Encarte Itens Deletados');
         Try
           dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE_ITENS ACTIVE';

           dm3.FDSql.ExecSql(True);

         Except
           on E:Exception do
            begin
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

            end;
         End;
         dm3.CdsDeletados.Close;
         Exit;
       end;
   end;
  Try
    dm3.FDSql.sql.text := 'ALTER TRIGGER TG_EXC_ENCARTE_ITENS ACTIVE';

    dm3.FDSql.ExecFD(True);

  Except
    on E:Exception do
     begin
      GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);

     end;
  End;
end;


procedure RecebendoUsuariosGrupos;
var i : integer;
Dados : Variant;
begin
   Try
     dm3.CdsUsuariosGrupos.Close;
     dm3.CdsUsuariosGrupos.CreateDataSet;
     Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(139, Filial, 'A');
     if (Dados = null) then
        Exit;

     dm3.CdsUsuariosGrupos.Data := Dados;
     dm3.CdsUsuariosGrupos.Open; // virtual

     dm3.CdsUsuariosGrupos.First;
     GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Recebendo Usuarios Grupos: '+ FloatToStr(dm3.CdsUsuariosGrupos.RecordCount));
     while not dm3.CdsUsuariosGrupos.Eof do
      begin
        dm3.FDAtualizaUsuariosGrupos.Params[0].AsFloat := dm3.CdsUsuariosGruposCD_USUARIO.AsFloat;
        dm3.FDAtualizaUsuariosGrupos.Params[1].AsFloat := dm3.CdsUsuariosGruposCD_FILIAL.AsFloat;
        dm3.FDAtualizaUsuariosGrupos.Params[2].AsFloat := dm3.CdsUsuariosGruposCD_GRUPO.AsFloat;
        dm3.FDAtualizaUsuariosGrupos.Params[3].AsFloat := dm3.CdsUsuariosGruposTX_DESCONTO_MAXIMO.AsFloat;
        dm3.FDAtualizaUsuariosGrupos.Params[4].AsString := dm3.CdsUsuariosGruposENVIADO.AsString;

        Try
          dm3.FDAtualizaUsuariosGrupos.ExecFD(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Usuarios Grupos - Execução da Procedure');
        End;

        dm3.CdsUsuariosGrupos.Next;
      end;

     dm3.CdsUsuariosGrupos.Close;

   Except
      on E:Exception do
       begin

         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + E.Message);
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Usuarios Grupos');
         dm3.CdsUsuariosGrupos.Close;

         Exit;
       end;
   end;
end;


procedure ConsistenciaEstoque;
var Dados : Variant;
begin
 Try
   // Atualiza produtos
   GravaLog(FormatDateTime('hh:mm:ss',Time) + ' - Executando Consistencia Estoque.');
   Dados := (dm3.HTTPRIO1 AS IDmProcessa).Processa(1192, Filial, 'A');
   if Dados = null then
      Exit;
 Except
     on E:Exception do
     begin
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Falha de conexao no processo da Consistencia Estoque - '+ E.Message);
     end;
 end;

end;

end.

