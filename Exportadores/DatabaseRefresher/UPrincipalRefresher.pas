Unit UPrincipalRefresher;

interface

uses
  Windows, SysUtils, Variants, Classes, Forms,DB, DBClient, SqlExpr,
  DBXpress, Provider, FMTBcd, ExtCtrls, Menus, RXShell, RxMenus, Controls,
  StdCtrls, FileCtrl, Dialogs, TLHelp32, InvokeRegistry, Rio,
  SOAPHTTPClient, ComCtrls, ShellCtrls, Messages, Graphics, ImgList, ToolWin,
  Contnrs, ShellApi, Dateutils, AppEvent, Gauges, AppEvnts, IniFiles, Registry,
  ZipForge, MidasLib;

type
  TFrmPrincipalRefresher = class(TForm)
    Timer1: TTimer;
    RxTrayIcon1: TRxTrayIcon;
    RxPopupMenu1: TRxPopupMenu;
    Fechar1: TMenuItem;
    Timer2: TTimer;
    Exibir1: TMenuItem;
    HTTPRIO1: THTTPRIO;
    AbrirLog1: TMenuItem;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    ListView1: TListView;
    Gauge1: TGauge;
    btExecuta: TButton;
    Button2: TButton;
    ZipForge1: TZipForge;
    ListView2: TListView;
    function  RetornaID(Campo: String): Extended;
    procedure ProcessarLancamentos;
    procedure ProcessarLancamentosaPrazo;
    procedure ProcessarCaixa;
    procedure ProcessarCadfin;
    procedure ProcessarPedid1;
    procedure ProcessarPedido;
    procedure ProcessarLotesItensCompra;
    procedure ProcessarComprasBoletos;
    procedure ProcessarContasPagarCompras;    
    procedure ProcessarDuplic;
    procedure ProcessarEstoqueMinimo;
    procedure ProcessarOperadores;
    procedure ProcessarEntregas;
    procedure ProcessarCheques;
    procedure ProcessarTransfer;
    procedure ProcessarCadernoFaltas;
    procedure ProcessarItensTransfer;
    procedure ProcessarClientes;
    procedure ProcessarLimiteSaldoClientes;
    procedure ProcessarUsuarios;
    procedure ProcessarCRM;
    procedure ProcessarControleValores;
    procedure ProcessarCodigoBarras;
    procedure ProcessarBalancos;
    procedure ProcessarPrecoVendaFilial;
    procedure ProcessarComprasDeletadas;
    procedure ProcessarContasPagarDeletadas;
    procedure ProcessarClientesDeletados;
    procedure ProcessarProdutosTotais;
    procedure ProcessarPosicaoEstoque;
    procedure ProcessarConsistenciaCR;
    procedure ProcessarProdutosLotes;
    procedure ProcessarProdutosLotesST;
    procedure ProcessarConferenciaNota;

    { Sintegra }
    procedure ProcessarSintegraNotas;
    procedure ProcessarSintegraNotasItens;
    procedure ProcessarSintegraPedidos;
    procedure ProcessarSintegraR60;
    procedure ProcessarSintegraR60I;
    { Sinterga }

    procedure ProcessarContasReceberDeletados;
    procedure ProcessarSintegraNFEntradaDeletados;
    procedure ProcessarVendasFPCallCenter;
    procedure ProcessarVendasCallCenter;

    procedure ProcessarVendasItensExcluidos;

    procedure Timer1Timer(Sender: TObject);

    procedure GravaLog(cMensagem: string);
    procedure FormCreate(Sender: TObject);

    Function StrTran( cString, cProcura, cTroca : string ): string;
    procedure Timer2Timer(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AbreTransacao;
    procedure ConfirmaTransacao;
    procedure CancelaTransacao;
    procedure Exibir1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure btExecutaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure AppEvents1Minimize(Sender: TObject);
    procedure AbrirLog1Click(Sender: TObject);
    procedure ExibeProgresso(Valor : Integer; Mensagem : String);
    procedure PesquisaDiretorio(Diretorio : String);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);

    function  IniciaDia : Boolean;
    function  IniciaDiaSuporte : Boolean;
    procedure ApagaArquivos;
    procedure ExecutaProcedure(Sql: String; Msg: Boolean);
    procedure FormShow(Sender: TObject);
    procedure GravaTempoOperacao;

    procedure CalculaCurva(Filial : Integer);
    procedure BaixaAutomaticaChequePre;
    procedure FecharTodosDataSets;

    procedure PesquisaDiretorioZIP(Diretorio : String);
    procedure DescompactaZIP(Indice : Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure FecharDataSet(Cds : TClientDataSet);
Function VerificaProcesso(Arquivo : string) : Boolean;
Function VerificaProcesso2(Arquivo : string) : Boolean;
function Crypt(Action, Src: String): String;
Function UltimoDiaMes(Mes : Real) : Real;
function ArredondaPara(valor: Currency; decimais: Integer=2): Currency;
function AtualizaSaldo(Tabela: TClientDataSet; ID: TFloatField; Data: TDateField; Saldo: TFloatField;
                       ValorAtual,ValorAnterior : Extended; TipoAtual,TipoAnterior : String;
                       DataAtual, DataAnterior : TDateTime; ContaAtual,ContaAnterior : Extended):Boolean;


var
  FrmPrincipalRefresher: TFrmPrincipalRefresher;
  Filial : Real;
  Arquivo, Caminho : String;
  Refresher : TextFile;
  RefresherTime : TextFile;
  TD : TTransactionDesc;
  FColumnIndex : Integer;
  InicioDia : Boolean;
  DataHoje : TDateTime;
  ValidaDataHoje : Boolean;
  Entrada : String;
  Terminar : Boolean;
  CaminhoBanco : TIniFile;
  Cd_Evento : Real;

implementation

uses Math, UBackup, ConvUtils, uDmRefresher;

{$R *.dfm}

{ TForm1 }


procedure TFrmPrincipalRefresher.PesquisaDiretorioZIP(Diretorio : String);
var
  SRec : TSearchRec;
  Final, i : Integer;
begin
  i := 0;
  Diretorio := IncludeTrailingPathDelimiter(Diretorio);
  ListView2.Items.Clear;
  Final := FindFirst(Diretorio+'*.zip',faArchive,SRec);
  while Final = 0 do
   begin
    if (SRec.Name <> '.') and (SRec.Name <> '..') then
     begin
        with ListView2.Items.Add do
        begin
          Caption := SRec.Name;
          SubItems.Add(FormatDateTime('dd/mm/yyyy', FileDateToDateTime(SRec.Time)));
          SubItems.Add(FormatDateTime('hh:mm:ss', FileDateToDateTime(SRec.Time)));
          SubItems.Add('   ');
        end;
     end;
    //limita numero de arquivos lidos por cada entrada do refresher
    if i >= 200 then Break;
    Inc(i);
    Final := FindNext(SRec);
   end;
  FindClose(SRec);

  FColumnIndex := 2;
  ListView2.AlphaSort;
  ListView2.Refresh;
  ListView2.Repaint;
end;


procedure TFrmPrincipalRefresher.DescompactaZIP(Indice : Integer);
begin
   ZipForge1.BaseDir := ExtractFilePath(Application.ExeName)+'Importacao';
   ZipForge1.FileName := ExtractFilePath(Application.ExeName)+'Importacao\' + ListView2.Items[Indice].Caption;
   ZipForge1.OpenArchive;
   ZipForge1.ExtractFiles('*.*');
   ZipForge1.CloseArchive;
   ListView2.Items[Indice].SubItems[2] := 'X';
   ListView2.Canvas.Brush.Color := clAqua;
   ListView2.Repaint;
   DeleteFile(ExtractFilePath(Application.ExeName)+'Importacao' + '\' + ListView2.Items[Indice].Caption);
end;


function ArredondaPara(valor: Currency; decimais: Integer=2): Currency;
begin
  decimais := Trunc(Power(10, decimais));
  Result := (Floor(valor * decimais + 0.5) / decimais);
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


//rotina que vai verificar se o processo de um determinado sistema ainda esta em execucao.
Function VerificaProcesso2(Arquivo : string) : Boolean;
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  Looper : Boolean;
  Contador : Integer;
begin
  Contador := 0;
  SnapShot:=CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize:=sizeof(TProcessEntry32);
  Looper := Process32First(SnapShot,pe);
  Result := False;
  while Integer(Looper) <> 0 do
   begin
    //if ExtractFileName(pe.szExeFile) = arquivo then
    if Pos(UpperCase(Arquivo), UpperCase(ExtractFileName(pe.szExeFile))) > 0 then
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


procedure TFrmPrincipalRefresher.FormCreate(Sender: TObject);
var
 Reg : TRegistry;
 Chaves : TStringList;
 i : Integer;
begin
  Try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Control Panel\International', True) ;
    Reg.WriteString('iCountry','55');
    Reg.WriteString('LocaleName','pt-BR');
    Reg.WriteString('sCountry','Brasil');
    Reg.WriteString('sCurrency','R$');
    Reg.WriteString('sLanguage','PTB');
    Reg.WriteString('sShortDate','dd/MM/yyyy');
    Reg.WriteString('sTimeFormat','HH:mm:ss');
    Reg.WriteString('sShortTime','HH:mm');
    Reg.WriteString('sDecimal',',');
    Reg.WriteString('sMonDecimalSep',',');
    Reg.WriteString('sThousand','.');
    Reg.WriteString('sDate','/');
    Reg.WriteString('sTime',':');
    Reg.WriteString('s1159','');
    Reg.WriteString('s2359','');
    Reg.CloseKey;
    Reg.Free;

    Chaves := TStringList.Create;
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_USERS;
    Reg.OpenKey('', False);
    Reg.GetKeyNames(Chaves);
    for i := 0 to Chaves.Count - 1 do
     begin
        Reg.OpenKey(Chaves.Strings[i], True) ;
        if Reg.KeyExists('Control Panel\International') then
         begin
            Reg.OpenKey('Control Panel\International', True) ;
            Reg.WriteString('iCountry','55');
            Reg.WriteString('LocaleName','pt-BR');
            Reg.WriteString('sCountry','Brasil');
            Reg.WriteString('sCurrency','R$');
            Reg.WriteString('sLanguage','PTB');
            Reg.WriteString('sShortDate','dd/MM/yyyy');
            Reg.WriteString('sTimeFormat','HH:mm:ss');
            Reg.WriteString('sShortTime','HH:mm');
            Reg.WriteString('sDecimal',',');
            Reg.WriteString('sMonDecimalSep',',');
            Reg.WriteString('sThousand','.');
            Reg.WriteString('sDate','/');
            Reg.WriteString('sTime',':');
            Reg.WriteString('s1159','');
            Reg.WriteString('s2359','');
            Reg.CloseKey;
         end
        else
            Reg.CloseKey;
     end;
    Reg.Free;
  Except
  End;

  if VerificaProcesso2('FarmaxRefresher.exe') then
     begin
        Application.Terminate;
        Halt;
        Exit;
     end;

  Terminar := False;
  TD.TransactionID := 1;
  TD.IsolationLevel := xilREADCOMMITTED;
  Timer1.Enabled := True;
  Timer3Timer(Sender);
  FrmPrincipalRefresher.Hide;
end;


function TFrmPrincipalRefresher.RetornaID(Campo: String): Extended;
begin
   Try
     Repeat
        DmRefresher.CdsControle.Close;
        DmRefresher.CdsControle.Params[0].AsString := UpperCase(Campo);
        Try
          AbreTransacao;
          DmRefresher.CdsControle.Open;
          ConfirmaTransacao;
        Except
          CancelaTransacao;
        End;
        if DmRefresher.CdsControle.RecordCount = 0 then
         begin
           DmRefresher.CdsControle.Append;
           DmRefresher.CdsControleCAMPO.AsString := UpperCase(Campo);
         end
        else
         begin
           DmRefresher.CdsControle.Edit;
         end;
        DmRefresher.CdsControleVALOR.AsFloat := DmRefresher.CdsControleVALOR.AsFloat + 1;
        DmRefresher.CdsControle.Post;
        AbreTransacao;
     Until DmRefresher.CdsControle.ApplyUpdates(0) = 0;
   Finally
      ConfirmaTransacao;
      Result := DmRefresher.CdsControleVALOR.AsFloat;
      DmRefresher.CdsControle.Close;
   End;
end;

//Ativa a leitura das tabelas em intervalos programados
procedure TFrmPrincipalRefresher.Timer1Timer(Sender: TObject);
var x : Integer;
begin
  Timer1.Enabled := False;

  if not DmRefresher.SQLConnection1.Connected then
     try
        DmRefresher.SQLConnection1.Open;
     except
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro de conexão com o banco de dados.');
        Application.Terminate;
        Halt;
        Exit;
     end;

  //verifica se Refresher está ligado a Suporte.fdb, banco da FarmaSoft e executa outras rotinas
  if pos('suporte.fdb',caminho) > 0 then
    begin
      IniciaDiaSuporte;
      Close;
      Application.Terminate;
      Exit;
    end;

  IniciaDia;

  // Adicionado - Comentado FML - 15.09.2017
  //PesquisaDiretorioZIP(ExtractFilePath(Application.ExeName)+'Importacao');

  // Comentado - Descomentado FML - 15.09.2017
  PesquisaDiretorio(ExtractFilePath(Application.ExeName)+'Importacao');


  // Comentado FML - 15.09.2017
  {if ListView2.Items.Count > 0 then
   begin
      for x := 0 to ListView2.Items.Count - 1 do
       begin
          DescompactaZIP(x);
          PesquisaDiretorio(ExtractFilePath(Application.ExeName)+'Importacao');
          if ListView1.Items.Count > 0 then
           begin
             Gauge1.Visible := True;
             btExecutaClick(Sender);
           end;
       end;
      ListView2.Clear;
      ListView2.Repaint;
   end;}

  // Comentado - Descomentado FML - 15.09.2017
  if ListView1.Items.Count > 0 then
      begin
       Gauge1.Visible := True;
       btExecutaClick(Sender);
      end;

  Gauge1.Visible := False;
  RxTrayIcon1.Animated := False;

  //se o servico FARMAXSERVICE estiver ativo, nao deixa executar o Refresher como aplicacao
//  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Encerrando o processo. ');
  if VerificaProcesso('FarmaxSer') then
    begin
//      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Processo encerrado com Serviço FarmaxService Ativo. ');
      Close;
      Application.Terminate;
      Exit;
    end
  else
    begin
//      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Processo encerrado sem Serviço FarmaxService - Rodando como Aplicacao. ');
      Timer1.Enabled := True;
    end;
end;

procedure TFrmPrincipalRefresher.PesquisaDiretorio(Diretorio : String);
var
  SRec : TSearchRec;
  Final, i : Integer;
begin
  i := 0;
  Diretorio := IncludeTrailingPathDelimiter(Diretorio);
  ListView1.Items.Clear;
  Final := FindFirst(Diretorio+'*.xml',faArchive,SRec);
  while Final = 0 do
   begin
    if (SRec.Name <> '.') and (SRec.Name <> '..') then
     begin
        with ListView1.Items.Add do
        begin
          Caption := SRec.Name;
          SubItems.Add(FormatDateTime('dd/mm/yyyy', FileDateToDateTime(SRec.Time)));
          SubItems.Add(FormatDateTime('hh:mm:ss', FileDateToDateTime(SRec.Time)));
          SubItems.Add('   ');
        end;
     end;
    //limita numero de arquivos lidos por cada entrada do refresher
    if i >= 200 then Break;
    Inc(i);
    Final := FindNext(SRec);
   end;
  FindClose(SRec);

  FColumnIndex := 2;
  ListView1.AlphaSort;
  ListView1.Refresh;
  ListView1.Repaint;
end;


procedure TFrmPrincipalRefresher.ProcessarDuplic;
var
 i : integer;
begin
  Try
    DmRefresher.QryCeDuplic.LoadFromFile(Arquivo);
    DmRefresher.QryCeDuplic.Open; // virtual
    if DmRefresher.QryCeDuplic.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeDuplic.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryCeDuplic.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Contas a Pagar: ' + FloatToStr(DmRefresher.QryCeDuplic.RecordCount));
    While not DmRefresher.QryCeDuplic.Eof do
     begin
        DmRefresher.SqlAtualizaContasPagar.Params[0].AsFloat := DmRefresher.QryCeDuplicCD_CONTAS_PAGAR.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[1].AsFloat := DmRefresher.QryCeDuplicCD_FILIAL.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[2].AsFloat := DmRefresher.QryCeDuplicCD_DISTRIBUIDOR.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[3].AsFloat := DmRefresher.QryCeDuplicCD_COMPRAS.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[4].AsFloat := DmRefresher.QryCeDuplicCD_CONTA.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[5].AsFloat := DmRefresher.QryCeDuplicCD_FORMA_PAGAMENTO.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[6].AsFloat := DmRefresher.QryCeDuplicCD_PLANO_CONTAS.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[7].AsString := DmRefresher.QryCeDuplicNUMERO_NOTA.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[8].AsString := DmRefresher.QryCeDuplicSERIAL_NOTA.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[9].AsString := DmRefresher.QryCeDuplicDOCUMENTO.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[10].AsDateTime := DmRefresher.QryCeDuplicDT_NOTA.AsDateTime;
        DmRefresher.SqlAtualizaContasPagar.Params[11].AsDateTime := DmRefresher.QryCeDuplicDT_VENCIMENTO.AsDateTime;
        DmRefresher.SqlAtualizaContasPagar.Params[12].AsFloat := DmRefresher.QryCeDuplicVALOR.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[13].AsDateTime := DmRefresher.QryCeDuplicDT_LANCAMENTO.AsDateTime;
        DmRefresher.SqlAtualizaContasPagar.Params[14].AsDateTime := DmRefresher.QryCeDuplicDT_PAGAMENTO.AsDateTime;
        DmRefresher.SqlAtualizaContasPagar.Params[15].AsDateTime := DmRefresher.QryCeDuplicDT_BOLETO.AsDateTime;
        DmRefresher.SqlAtualizaContasPagar.Params[16].AsDateTime := DmRefresher.QryCeDuplicDT_ENTRADA.AsDateTime;
        DmRefresher.SqlAtualizaContasPagar.Params[17].AsFloat := DmRefresher.QryCeDuplicVL_PAGAMENTO.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[18].AsFloat := DmRefresher.QryCeDuplicVL_JUROS.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[19].AsFloat := DmRefresher.QryCeDuplicVL_DESCONTO.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[20].AsFloat := DmRefresher.QryCeDuplicVL_SALDO.AsFloat;
        DmRefresher.SqlAtualizaContasPagar.Params[21].AsString := DmRefresher.QryCeDuplicNOSSO_NUMERO.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[22].AsString := DmRefresher.QryCeDuplicBANCO.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[23].AsString := DmRefresher.QryCeDuplicAGENCIA.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[24].AsString := DmRefresher.QryCeDuplicCONTA.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[25].AsString := DmRefresher.QryCeDuplicHISTORICO.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[26].AsString := DmRefresher.QryCeDuplicNR_CHEQUE.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[27].AsString := DmRefresher.QryCeDuplicSTATUS.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[28].AsString := DmRefresher.QryCeDuplicENVIADO.AsString;
        DmRefresher.SqlAtualizaContasPagar.Params[29].AsFloat := DmRefresher.QryCeDuplicDESPESAFINANCEIRA.AsFloat;
        try
          DmRefresher.SqlAtualizaContasPagar.ExecSql(False);
        except
          on E:Exception do
             GravaLog('Erro na atualização de Contas a Pagar - ' + E.Message);
        end;

        Gauge1.Progress := DmRefresher.QryCeDuplic.RecNo;
        DmRefresher.QryCeDuplic.Next;
     end;
    ConfirmaTransacao;
    DmRefresher.QryCeDuplic.Close;
 Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

       DmRefresher.QryCeDuplic.Close;
       CancelaTransacao;
    end;
 End;
end;

procedure TFrmPrincipalRefresher.ProcessarCadfin;
var i : integer;
begin
    Try
      DmRefresher.QryCeCadfin.LoadFromFile(Arquivo);
      DmRefresher.QryCeCadfin.Open; // virtual
      if DmRefresher.QryCeCadfin.RecordCount = 0 then
         Exit;

      Gauge1.Progress := 0;
      ExibeProgresso(DmRefresher.QryCeCadfin.RecordCount, Arquivo);
      AbreTransacao;

      DmRefresher.QryCeCadfin.First;
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Contas a Receber: ' + FloatToStr(DmRefresher.QryCeCadfin.RecordCount));
      While not DmRefresher.QryCeCadfin.Eof do
       begin
          DmRefresher.SqlAtualizaContasReceber.Params[0].asFloat := DmRefresher.QryCeCadfinCD_CONTAS_RECEBER.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[1].asFloat := DmRefresher.QryCeCadfinCD_CLIENTE.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[2].asFloat := DmRefresher.QryCeCadfinCD_PLANO_CONTAS.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[3].asFloat := DmRefresher.QryCeCadfinCD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[4].asFloat := DmRefresher.QryCeCadfinCD_CONVENIO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[5].asFloat := DmRefresher.QryCeCadfinCD_VENDEDOR.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[6].asFloat := DmRefresher.QryCeCadfinCD_VENDA.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[7].asFloat := DmRefresher.QryCeCadfinCD_FORMA_PAGAMENTO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[8].asFloat := DmRefresher.QryCeCadfinCD_CONTA.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[9].asFloat := DmRefresher.QryCeCadfinCD_CARTAO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[10].asFloat := DmRefresher.QryCeCadfinCD_BORDERO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[11].AsDateTime := DmRefresher.QryCeCadfinDT_LANCAMENTO.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[12].AsDateTime := DmRefresher.QryCeCadfinDT_VENCIMENTO.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[13].AsString := DmRefresher.QryCeCadfinNOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[14].AsString := DmRefresher.QryCeCadfinSERIE_NOTA.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[15].AsString := DmRefresher.QryCeCadfinDOCUMENTO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[16].AsDateTime := DmRefresher.QryCeCadfinDT_NOTA_FISCAL.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[17].AsDateTime := DmRefresher.QryCeCadfinVENCTO.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[18].asFloat := DmRefresher.QryCeCadfinVALOR.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[19].AsString := DmRefresher.QryCeCadfinHISTORICO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[20].asFloat := DmRefresher.QryCeCadfinCD_CHEQUE_RECEBIDO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[21].AsString := DmRefresher.QryCeCadfinNR_CHEQUE.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[22].AsString := DmRefresher.QryCeCadfinNR_BANCO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[23].AsDateTime := DmRefresher.QryCeCadfinDT_PAGAMENTO.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[24].asFloat := DmRefresher.QryCeCadfinVL_PAGAMENTO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[25].asFloat := DmRefresher.QryCeCadfinVL_JUROS.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[26].asFloat := DmRefresher.QryCeCadfinVL_DESCONTO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[27].asFloat := DmRefresher.QryCeCadfinVL_SALDO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[28].AsString := DmRefresher.QryCeCadfinNOSSO_NUMERO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[29].AsString := DmRefresher.QryCeCadfinBANCO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[30].AsString := DmRefresher.QryCeCadfinAGENCIA.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[31].AsString := DmRefresher.QryCeCadfinCONTA.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[32].AsString := DmRefresher.QryCeCadfinHISTORICO_BANCO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[33].AsString := DmRefresher.QryCeCadfinSTATUS.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[34].AsString := DmRefresher.QryCeCadfinGERABOLETO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[35].AsString := DmRefresher.QryCeCadfinBOLETOGERADO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[36].AsDateTime := DmRefresher.QryCeCadfinDT_ALTERACAO.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[37].asFloat := DmRefresher.QryCeCadfinTEFTRANSACAO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[38].asFloat := DmRefresher.QryCeCadfinTEFLOTE.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[39].asString := DmRefresher.QryCeCadfinTEFAUTORIZACAO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[40].AsDateTime := DmRefresher.QryCeCadfinTEFDATA.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[41].AsDateTime := DmRefresher.QryCeCadfinTEFHORA.AsDateTime;
          DmRefresher.SqlAtualizaContasReceber.Params[42].AsString := DmRefresher.QryCeCadfinTEFNOMEREDE.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[43].asFloat := DmRefresher.QryCeCadfinTEFVALOR.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[44].AsString := DmRefresher.QryCeCadfinENVIADO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[45].AsString := DmRefresher.QryCeCadfinTRNTRANSACAO.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[46].AsString := DmRefresher.QryCeCadfinTRNLOTE.AsString;;
          DmRefresher.SqlAtualizaContasReceber.Params[47].AsString := DmRefresher.QryCeCadfinTRNAUTORIZACAO.AsString;;
          DmRefresher.SqlAtualizaContasReceber.Params[48].AsString := DmRefresher.QryCeCadfinTRN.AsString;
          DmRefresher.SqlAtualizaContasReceber.Params[49].asFloat := DmRefresher.QryCeCadfinCD_FILIAL_PAGAMENTO.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[50].AsInteger := DmRefresher.QryCeCadfinPARCELA.AsInteger;
          DmRefresher.SqlAtualizaContasReceber.Params[51].asFloat := DmRefresher.QryCeCadfinCD_CAIXA.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[52].asFloat := DmRefresher.QryCeCadfinCD_FILIAL_ORIGEM.AsFloat;
          DmRefresher.SqlAtualizaContasReceber.Params[53].AsString := DmRefresher.QryCeCadfinOBSERVACAO.AsString;
          try
            DmRefresher.SqlAtualizaContasReceber.ExecSql(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Contas a Receber - ' + E.Message);
          end;

         Gauge1.Progress := DmRefresher.QryCeCadfin.RecNo;
         DmRefresher.QryCeCadfin.Next;
       end; // end do While
     ConfirmaTransacao;
     DmRefresher.QryCeCadfin.Close;

    Except
      on E:Exception do
       begin
             GravaLog('Erro na atualização - ' + E.Message);

          if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
             (pos(uppercase('database'), uppercase(e.Message)) > 0) or
             (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
             (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
             (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
           begin
           Terminar := True;
           end;
          DmRefresher.QryCeCadfin.Close;
          CancelaTransacao;
       end;
    End;
end;


procedure TFrmPrincipalRefresher.ProcessarCaixa;
var i : integer;
begin
   Try
     DmRefresher.QryCeCaixa.LoadFromFile(Arquivo);
     DmRefresher.QryCeCaixa.Open; // virtual
     if DmRefresher.QryCeCaixa.RecordCount = 0 then
      begin
        GravaLog('ProcessarCaixa - Não retornou nenhum registro ');
        Exit;
      end;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeCaixa.RecordCount, Arquivo);

     AbreTransacao;
     DmRefresher.QryCeCaixa.First;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Caixa: ' + FloatToStr(DmRefresher.QryCeCaixa.RecordCount));
     While not DmRefresher.QryCeCaixa.Eof do
      begin
          DmRefresher.SqlAtualizaCaixa.Params[0].AsFloat := DmRefresher.QryCeCaixaCD_CAIXA.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[1].AsFloat := DmRefresher.QryCeCaixaCD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[2].AsFloat := DmRefresher.QryCeCaixaCD_CONVENIO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[3].AsFloat := DmRefresher.QryCeCaixaCD_CLIENTE.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[4].AsFloat := DmRefresher.QryCeCaixaCD_VENDEDOR.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[5].AsFloat := DmRefresher.QryCeCaixaCD_OPERADOR.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[6].AsFloat := DmRefresher.QryCeCaixaCD_USUARIO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[7].AsFloat := DmRefresher.QryCeCaixaCD_FORMA_PAGAMENTO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[8].AsFloat := DmRefresher.QryCeCaixaCD_PLANO_CONTAS.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[9].AsFloat := DmRefresher.QryCeCaixaCD_CARTAO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[10].AsFloat := DmRefresher.QryCeCaixaCD_VENDA.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[11].AsFloat := DmRefresher.QryCeCaixaID_OPERADORCAIXA.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[12].AsString := DmRefresher.QryCeCaixaTIPO_CARTAO.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[13].AsDate := DmRefresher.QryCeCaixaDATA.AsDateTime;
          DmRefresher.SqlAtualizaCaixa.Params[14].AsTime := DmRefresher.QryCeCaixaHORA.AsDateTime;
          DmRefresher.SqlAtualizaCaixa.Params[15].AsFloat := DmRefresher.QryCeCaixaVALOR.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[16].AsString := DmRefresher.QryCeCaixaDOCUMENTO.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[17].AsFloat := DmRefresher.QryCeCaixaDESCONTO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[18].AsString := DmRefresher.QryCeCaixaTIPO_VENDA.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[19].AsString := DmRefresher.QryCeCaixaENTRADA_SAIDA.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[20].AsString := DmRefresher.QryCeCaixaENTREGA.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[21].AsString := DmRefresher.QryCeCaixaTROCA.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[22].AsString := DmRefresher.QryCeCaixaENVIADO.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[23].AsString := DmRefresher.QryCeCaixaUSUARIO.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[24].AsFloat := DmRefresher.QryCeCaixaNUMERO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[25].AsDate := DmRefresher.QryCeCaixaDATA_VENCIMENTO.AsDateTime;
          DmRefresher.SqlAtualizaCaixa.Params[26].AsFloat := DmRefresher.QryCeCaixaTERMINAL.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[27].AsString := DmRefresher.QryCeCaixaNR_CHEQUE.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[28].AsString := DmRefresher.QryCeCaixaNR_BANCO.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[29].AsDate := DmRefresher.QryCeCaixaDATA_CAIXA.AsDateTime;
          DmRefresher.SqlAtualizaCaixa.Params[30].AsString := DmRefresher.QryCeCaixaOBSERVACAO.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[31].AsFloat := DmRefresher.QryCeCaixaARREDONDAMENTO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[32].AsFloat := DmRefresher.QryCeCaixaTEFTRANSACAO.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[33].AsFloat := DmRefresher.QryCeCaixaTEFLOTE.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[34].AsString := DmRefresher.QryCeCaixaTEFAUTORIZACAO.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[35].AsDate := DmRefresher.QryCeCaixaTEFDATA.AsDateTime;
          DmRefresher.SqlAtualizaCaixa.Params[36].AsTime := DmRefresher.QryCeCaixaTEFHORA.AsDateTime;
          DmRefresher.SqlAtualizaCaixa.Params[37].AsFloat := DmRefresher.QryCeCaixaTEFVALOR.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[38].AsString := DmRefresher.QryCeCaixaTEFNOMEREDE.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[39].AsString := DmRefresher.QryCeCaixaSTATUS.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[40].AsString := DmRefresher.QryCeCaixaTRN.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[41].AsString := DmRefresher.QryCeCaixaTRANSACAOTRN.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[42].AsString := DmRefresher.QryCeCaixaLOTETRN.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[43].AsString := DmRefresher.QryCeCaixaAUTORIZACAOTRN.AsString;
          DmRefresher.SqlAtualizaCaixa.Params[44].AsFloat := DmRefresher.QryCeCaixaPARCELA.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[45].AsFloat := DmRefresher.QryCeCaixaCD_FILIAL_ORIGEM.AsFloat;
          DmRefresher.SqlAtualizaCaixa.Params[46].AsString := DmRefresher.QryCeCaixaECF.AsString;
          try
            DmRefresher.SqlAtualizaCaixa.ExecSQL(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Caixa - ' + E.Message);

          end;

          Gauge1.Progress := DmRefresher.QryCeCaixa.RecNo;
          DmRefresher.QryCeCaixa.Next;
      end;
     ConfirmaTransacao;
     DmRefresher.QryCeCaixa.Close;
   Except
    on E:Exception do
     begin
        GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

         DmRefresher.QryCeCaixa.Close;
         CancelaTransacao;
     end;
   End;
end;


procedure TFrmPrincipalRefresher.ProcessarVendasCallCenter;
var i : integer;
begin
   Try
     DmRefresher.QryVendasCallCenter.LoadFromFile(Arquivo);
     DmRefresher.QryVendasCallCenter.Open; // virtual
     if DmRefresher.QryVendasCallCenter.RecordCount = 0 then
        Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryVendasCallCenter.RecordCount, Arquivo);

     DmRefresher.QryVendasCallCenter.First;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Vendas CallCenter: ' + FloatToStr(DmRefresher.QryVendasCallCenter.RecordCount));
     While not DmRefresher.QryVendasCallCenter.Eof do
      begin
        AbreTransacao;
        DmRefresher.CdsVendasCallCenter.Close;
        DmRefresher.CdsVendasCallCenter.Params[0].AsFloat := DmRefresher.QryVendasCallCenterCD_VENDA.AsFloat;
        DmRefresher.CdsVendasCallCenter.Params[1].AsFloat := DmRefresher.QryVendasCallCenterCD_FILIAL.AsFloat;
        DmRefresher.CdsVendasCallCenter.Open;
        if DmRefresher.CdsVendasCallCenter.RecordCount = 0 then
         begin
            DmRefresher.CdsVendasCallCenter.Append;
            for i := 0 to DmRefresher.CdsVendasCallCenter.FieldCount - 1 do
                if DmRefresher.QryVendasCallCenter.Fields[i].FieldName <> 'CD_VENDA' then
                   DmRefresher.CdsVendasCallCenter.Fields[i].Value := DmRefresher.QryVendasCallCenter.Fields[i].Value;
            DmRefresher.CdsVendasCallCenterCD_VENDA.AsFloat := RetornaID('CD_VENDA');
            DmRefresher.CdsVendasCallCenter.ApplyUpdates(0);
         end;
        ConfirmaTransacao;

        Gauge1.Progress := DmRefresher.QryVendasCallCenter.RecNo;

        DmRefresher.QryVendasCallCenter.Next;
      end;
     DmRefresher.QryVendasCallCenter.Close;
     DmRefresher.CdsVendasCallCenter.Close;
   Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

     DmRefresher.QryVendasCallCenter.Close;
     DmRefresher.CdsVendasCallCenter.Close;
     CancelaTransacao;
     end;
   End;
end;


procedure TFrmPrincipalRefresher.ProcessarVendasFPCallCenter;
var i : integer;
begin
   Try
     DmRefresher.QryVendasFPCallCenter.LoadFromFile(Arquivo);
     DmRefresher.QryVendasFPCallCenter.Open; // virtual
     if DmRefresher.QryVendasFPCallCenter.RecordCount = 0 then
        Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryVendasFPCallCenter.RecordCount, Arquivo);

     DmRefresher.QryVendasFPCallCenter.First;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - VendasFP CallCenter: ' + FloatToStr(DmRefresher.QryVendasFPCallCenter.RecordCount));
     While not DmRefresher.QryVendasFPCallCenter.Eof do
      begin
        AbreTransacao;
        DmRefresher.CdsVendasFPCallCenter.Close;
        DmRefresher.CdsVendasFPCallCenter.Params[0].AsFloat := DmRefresher.QryVendasFPCallCenterCD_VENDA.AsFloat;
        DmRefresher.CdsVendasFPCallCenter.Params[1].AsFloat := DmRefresher.QryVendasFPCallCenterCD_FILIAL.AsFloat;
        DmRefresher.CdsVendasFPCallCenter.Open;

        DmRefresher.Cds1.Close;
        DmRefresher.Sql.CommandText := 'SELECT CD_VENDA FROM VENDAS WHERE ID_VENDA = ' + DmRefresher.QryVendasFPCallCenterCD_VENDA.AsString;
        DmRefresher.Cds1.Params.Clear;
        DmRefresher.Cds1.Open;

        if DmRefresher.CdsVendasFPCallCenter.RecordCount = 0 then
         begin
            DmRefresher.CdsVendasFPCallCenter.Append;
            for i := 0 to DmRefresher.CdsVendasFPCallCenter.FieldCount - 1 do
              DmRefresher.CdsVendasFPCallCenter.Fields[i].Value := DmRefresher.QryVendasFPCallCenter.Fields[i].Value;
            DmRefresher.CdsVendasFPCallCenterCD_VENDA.AsFloat := DmRefresher.Cds1.Fields[0].AsFloat;
            DmRefresher.CdsVendasFPCallCenter.ApplyUpdates(0);
         end;
        ConfirmaTransacao;

        Gauge1.Progress := DmRefresher.QryVendasFPCallCenter.RecNo;

        DmRefresher.QryVendasFPCallCenter.Next;
      end;
     DmRefresher.QryVendasFPCallCenter.Close;
     DmRefresher.CdsVendasFPCallCenter.Close;
   Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

     DmRefresher.QryVendasFPCallCenter.Close;
     DmRefresher.CdsVendasFPCallCenter.Close;
     CancelaTransacao;
     end;
   End;
end;

procedure TFrmPrincipalRefresher.ProcessarLancamentos;
var i : integer;
begin
    Try
      DmRefresher.QryCeLotes.LoadFromFile(Arquivo);
      DmRefresher.QryCeLotes.Open; // virtual
      if DmRefresher.QryCeLotes.RecordCount = 0 then
         Exit;
      DmRefresher.QryCeLotes.First;
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Lancamentos: ' + FloatToStr(DmRefresher.QryCeLotes.RecordCount));
      Gauge1.Progress := 0;
      ExibeProgresso(DmRefresher.QryCeLotes.RecordCount, Arquivo);
      AbreTransacao;
      While not DmRefresher.QryCeLotes.Eof do
       begin
          DmRefresher.SqlAtualizaLancamentos.Params[0].AsFloat := DmRefresher.QryCeLotesCD_LANCAMENTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[1].AsFloat := DmRefresher.QryCeLotesID_PRODUTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[2].AsFloat := DmRefresher.QryCeLotesID_PRODUTO_LOTE.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[3].AsFloat := DmRefresher.QryCeLotesCD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[4].AsString := DmRefresher.QryCeLotesCD_PRODUTO.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[5].AsString := DmRefresher.QryCeLotesDESCRICAO.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[6].AsFloat := DmRefresher.QryCeLotesCD_LABORATORIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[7].AsFloat := DmRefresher.QryCeLotesCD_GRUPO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[8].AsFloat := DmRefresher.QryCeLotesCD_CLASSE.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[9].AsFloat := DmRefresher.QryCeLotesCD_CONVENIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[10].AsFloat := DmRefresher.QryCeLotesCD_CLIENTE.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[11].AsFloat := DmRefresher.QryCeLotesCD_VENDEDOR.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[12].AsFloat := DmRefresher.QryCeLotesCD_OPERADOR.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[13].AsFloat := DmRefresher.QryCeLotesCD_USUARIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[14].AsFloat := DmRefresher.QryCeLotesCD_FORMA_PAGAMENTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[15].AsFloat := DmRefresher.QryCeLotesCD_VENDA.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[16].AsFloat := DmRefresher.QryCeLotesID_OPERADORCAIXA.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[17].AsFloat := DmRefresher.QryCeLotesCUSTO_MEDIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[18].AsFloat := DmRefresher.QryCeLotesCUSTO_UNITARIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[19].AsDate := DmRefresher.QryCeLotesDATA_LANCAMENTO.AsDateTime;
          DmRefresher.SqlAtualizaLancamentos.Params[20].AsDate := DmRefresher.QryCeLotesDATA_CAIXA.AsDateTime;
          DmRefresher.SqlAtualizaLancamentos.Params[21].AsFloat := DmRefresher.QryCeLotesQUANTIDADE.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[22].AsFloat := DmRefresher.QryCeLotesVALOR.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[23].AsFloat := DmRefresher.QryCeLotesCOMISSAO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[24].AsString := DmRefresher.QryCeLotesNOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[25].AsFloat := DmRefresher.QryCeLotesDESCONTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[26].AsFloat := DmRefresher.QryCeLotesPROMOCAO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[27].AsString := DmRefresher.QryCeLotesTIPO_VENDA.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[28].AsString := DmRefresher.QryCeLotesTIPO_PAGAMENTO.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[29].AsString := DmRefresher.QryCeLotesENTRADA_SAIDA.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[30].AsString := DmRefresher.QryCeLotesETIQUETA.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[31].AsString := DmRefresher.QryCeLotesENTREGA.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[32].AsTime := DmRefresher.QryCeLotesHORA.AsDateTime;
          DmRefresher.SqlAtualizaLancamentos.Params[33].AsFloat := DmRefresher.QryCeLotesESTOQUE_POSVENDA.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[34].AsString := DmRefresher.QryCeLotesTROCA.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[35].AsString := DmRefresher.QryCeLotesENVIADO.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[36].AsFloat := DmRefresher.QryCeLotesNUMERO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[37].AsFloat := DmRefresher.QryCeLotesTERMINAL.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[38].AsString := DmRefresher.QryCeLotesUSUARIO.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[39].AsString := DmRefresher.QryCeLotesOBSERVACAO.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[40].AsFloat := DmRefresher.QryCeLotesARREDONDAMENTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[41].AsString := DmRefresher.QryCeLotesTRN.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[42].AsString := DmRefresher.QryCeLotesTRANSACAOTRN.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[43].AsString := DmRefresher.QryCeLotesLOTETRN.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[44].AsString := DmRefresher.QryCeLotesAUTORIZACAOTRN.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[45].AsFloat := DmRefresher.QryCeLotesSUBSIDIOTRN.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[46].AsString := DmRefresher.QryCeLotesNOTAMANUAL.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[47].AsFloat := DmRefresher.QryCeLotesCD_FILIAL_ORIGEM.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[48].AsString := DmRefresher.QryCeLotesNCM.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[49].AsString := DmRefresher.QryCeLotesCFOP.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[50].AsString := DmRefresher.QryCeLotesCST.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[51].AsString := DmRefresher.QryCeLotesICMS.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[52].AsString := DmRefresher.QryCeLotesCODIGO_BARRAS.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[53].AsString := DmRefresher.QryCeLotesECF.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[54].AsFloat := DmRefresher.QryCeLotesCD_SUBGRUPO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[55].AsString := DmRefresher.QryCeLotesSERIE_NOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[56].AsFloat := DmRefresher.QryCeLotesID_CLIENTE_PROPRIEDADE.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[57].AsString := DmRefresher.QryCeLotesCEST.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[58].AsFloat := DmRefresher.QryCeLotesFCP.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[59].AsFloat := DmRefresher.QryCeLotesPERCENTUALREDUCAO.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[60].AsString := DmRefresher.QryCeLotesCOMPOSTO.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[61].AsFloat := DmRefresher.QryCeLotesID_PRODUTO_PRINCIPAL.AsFloat;
          DmRefresher.SqlAtualizaLancamentos.Params[62].AsString := DmRefresher.QryCeLotesVENDA_FIDELIDADE.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[63].AsString := DmRefresher.QryCeLotesVENDA_QUANTIDADE.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[64].AsString := DmRefresher.QryCeLotesIFOOD.AsString;
          DmRefresher.SqlAtualizaLancamentos.Params[65].AsString := DmRefresher.QryCeLotesFARMACIASAPP.AsString;
          try
            DmRefresher.SqlAtualizaLancamentos.ExecSQL(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Lancamentos - ' + E.Message);

          end;

          Gauge1.Progress := DmRefresher.QryCeLotes.RecNo;
          DmRefresher.QryCeLotes.Next;
       end;
      ConfirmaTransacao;
      DmRefresher.QryCeLotes.Close;
    Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

      DmRefresher.QryCeLotes.Close;
      CancelaTransacao;
     end;
    End;
end;

procedure TFrmPrincipalRefresher.ProcessarLancamentosaPrazo;
var
 i : integer;
 Sql : String;
begin
    Try
      DmRefresher.QryCeLotes2.LoadFromFile(Arquivo);
      DmRefresher.QryCeLotes2.Open; // virtual
      if DmRefresher.QryCeLotes2.RecordCount = 0 then
         Exit;

      Gauge1.Progress := 0;
      ExibeProgresso(DmRefresher.QryCeLotes2.RecordCount, Arquivo);

      AbreTransacao;
      DmRefresher.QryCeLotes2.First;
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Lancamentos a Prazo: ' + FloatToStr(DmRefresher.QryCeLotes2.RecordCount));
      While not DmRefresher.QryCeLotes2.Eof do
       begin
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[0].AsFloat := DmRefresher.QryCeLotes2CD_LANCAMENTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[1].AsFloat := DmRefresher.QryCeLotes2ID_PRODUTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[2].AsFloat := DmRefresher.QryCeLotes2CD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[3].AsString := DmRefresher.QryCeLotes2CD_PRODUTO.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[4].AsString := DmRefresher.QryCeLotes2DESCRICAO.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[5].AsFloat := DmRefresher.QryCeLotes2CD_LABORATORIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[6].AsFloat := DmRefresher.QryCeLotes2CD_GRUPO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[7].AsFloat := DmRefresher.QryCeLotes2CD_CLASSE.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[8].AsFloat := DmRefresher.QryCeLotes2CD_CONVENIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[9].AsFloat := DmRefresher.QryCeLotes2CD_CLIENTE.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[10].AsFloat := DmRefresher.QryCeLotes2CD_VENDEDOR.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[11].AsFloat := DmRefresher.QryCeLotes2CD_OPERADOR.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[12].AsFloat := DmRefresher.QryCeLotes2CD_USUARIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[13].AsFloat := DmRefresher.QryCeLotes2CD_FORMA_PAGAMENTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[14].AsFloat := DmRefresher.QryCeLotes2CD_VENDA.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[15].AsFloat := DmRefresher.QryCeLotes2ID_OPERADORCAIXA.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[16].AsFloat := DmRefresher.QryCeLotes2CUSTO_MEDIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[17].AsFloat := DmRefresher.QryCeLotes2CUSTO_UNITARIO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[18].AsDate := DmRefresher.QryCeLotes2DATA_LANCAMENTO.AsDateTime;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[19].AsDate := DmRefresher.QryCeLotes2DATA_CAIXA.AsDateTime;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[20].AsFloat := DmRefresher.QryCeLotes2QUANTIDADE.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[21].AsFloat := DmRefresher.QryCeLotes2VALOR.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[22].AsFloat := DmRefresher.QryCeLotes2COMISSAO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[23].AsString := DmRefresher.QryCeLotes2NOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[24].AsFloat := DmRefresher.QryCeLotes2DESCONTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[25].AsFloat := DmRefresher.QryCeLotes2PROMOCAO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[26].AsString := DmRefresher.QryCeLotes2TIPO_VENDA.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[27].AsString := DmRefresher.QryCeLotes2TIPO_PAGAMENTO.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[28].AsString := DmRefresher.QryCeLotes2ENTRADA_SAIDA.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[29].AsString := DmRefresher.QryCeLotes2ETIQUETA.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[30].AsString := DmRefresher.QryCeLotes2ENTREGA.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[31].AsTime := DmRefresher.QryCeLotes2HORA.AsDateTime;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[32].AsFloat := DmRefresher.QryCeLotes2ESTOQUE_POSVENDA.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[33].AsString := DmRefresher.QryCeLotes2TROCA.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[34].AsString := DmRefresher.QryCeLotes2ENVIADO.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[35].AsFloat := DmRefresher.QryCeLotes2NUMERO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[36].AsFloat := DmRefresher.QryCeLotes2TERMINAL.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[37].AsString := DmRefresher.QryCeLotes2USUARIO.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[38].AsString := DmRefresher.QryCeLotes2OBSERVACAO.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[39].AsFloat := DmRefresher.QryCeLotes2ARREDONDAMENTO.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[40].AsString := DmRefresher.QryCeLotes2TRN.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[41].AsString := DmRefresher.QryCeLotes2TRANSACAOTRN.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[42].AsString := DmRefresher.QryCeLotes2LOTETRN.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[43].AsString := DmRefresher.QryCeLotes2AUTORIZACAOTRN.AsString;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[44].AsFloat := DmRefresher.QryCeLotes2SUBSIDIOTRN.AsFloat;
          DmRefresher.SqlAtualizaLancamentosAPrazo.Params[45].AsString := DmRefresher.QryCeLotes2NOTAMANUAL.AsString;
          try
            DmRefresher.SqlAtualizaLancamentosAPrazo.ExecSQL(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Lancamentos a Prazo - ' + E.Message);

          end;

          Gauge1.Progress := DmRefresher.QryCeLotes2.RecNo;
          DmRefresher.QryCeLotes2.Next;
       end;
      ConfirmaTransacao;
      DmRefresher.QryCeLotes2.Close;
    Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

      DmRefresher.QryCeLotes2.Close;
      CancelaTransacao;
     end;
    End;
end;


procedure TFrmPrincipalRefresher.ProcessarPedid1;
var i : integer;
begin
   Try
      DmRefresher.QryCePedid1.LoadFromFile(Arquivo);
      DmRefresher.QryCePedid1.Open; // virtual
      if DmRefresher.QryCePedid1.RecordCount = 0 then
         Exit;

      try
        DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_COMPRAS INACTIVE';
        AbreTransacao;
        DmRefresher.SQL1.ExecSQL(True);
        ConfirmaTransacao;
      except
        CancelaTransacao;
      end;

      Gauge1.Progress := 0;
      ExibeProgresso(DmRefresher.QryCePedid1.RecordCount, Arquivo);

      AbreTransacao;
      DmRefresher.QryCePedid1.First;
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Compras: ' + FloatToStr(DmRefresher.QryCePedid1.RecordCount));
      While not DmRefresher.QryCePedid1.Eof do
       begin
          DmRefresher.SqlAtualizaCompras.Params[0].AsFloat := DmRefresher.QryCePedid1CD_COMPRAS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[1].AsFloat := DmRefresher.QryCePedid1CD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[2].AsFloat := DmRefresher.QryCePedid1CD_DISTRIBUIDOR.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[3].AsFloat := DmRefresher.QryCePedid1CD_PLANO_CONTAS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[4].AsFloat := DmRefresher.QryCePedid1CD_OBSERVACAO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[5].AsFloat := DmRefresher.QryCePedid1CD_TRANSPORTADORA.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[6].AsDateTime := DmRefresher.QryCePedid1DT_PEDIDO.AsDateTime;
          DmRefresher.SqlAtualizaCompras.Params[7].AsString := DmRefresher.QryCePedid1NOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaCompras.Params[8].AsString := DmRefresher.QryCePedid1SERIE_NOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaCompras.Params[9].AsDateTime := DmRefresher.QryCePedid1DT_EMISSAO.AsDateTime;
          DmRefresher.SqlAtualizaCompras.Params[10].AsString := DmRefresher.QryCePedid1BOLETO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[11].AsDateTime := DmRefresher.QryCePedid1DT_BOLETO.AsDateTime;
          DmRefresher.SqlAtualizaCompras.Params[12].AsFloat := DmRefresher.QryCePedid1CD_CFOP.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[13].AsDateTime := DmRefresher.QryCePedid1DT_ENTRADA.AsDateTime;
          DmRefresher.SqlAtualizaCompras.Params[14].AsFloat := DmRefresher.QryCePedid1VL_IPI.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[15].AsFloat := DmRefresher.QryCePedid1VL_ICM.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[16].AsFloat := DmRefresher.QryCePedid1TOTAL_NOTA.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[17].AsFloat := DmRefresher.QryCePedid1ICM_BASE_CALCULO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[18].AsFloat := DmRefresher.QryCePedid1ICM_ISENTO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[19].AsFloat := DmRefresher.QryCePedid1ICM_OUTROS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[20].AsFloat := DmRefresher.QryCePedid1ICM_BASESUBST.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[21].AsFloat := DmRefresher.QryCePedid1ICM_VALORSUBST.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[22].AsFloat := DmRefresher.QryCePedid1VL_TOTALPRODUTOS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[23].AsFloat := DmRefresher.QryCePedid1VL_SEGURO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[24].AsFloat := DmRefresher.QryCePedid1OUTRAS_DESPESAS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[25].AsFloat := DmRefresher.QryCePedid1VL_FRETE.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[26].AsFloat := DmRefresher.QryCePedid1IPI_BASE_CALCULO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[27].AsFloat := DmRefresher.QryCePedid1IPI_ISENTO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[28].AsFloat := DmRefresher.QryCePedid1IPI_OUTROS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[29].AsFloat := DmRefresher.QryCePedid1D_ICMV.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[30].AsFloat := DmRefresher.QryCePedid1D_IPIV.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[31].AsFloat := DmRefresher.QryCePedid1D_TOTNT.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[32].AsFloat := DmRefresher.QryCePedid1UNIDADES.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[33].AsFloat := DmRefresher.QryCePedid1NUMERO_ITENS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[34].AsString := DmRefresher.QryCePedid1FATURAMENTO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[35].AsString := DmRefresher.QryCePedid1MOTIVO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[36].AsString := DmRefresher.QryCePedid1ENVIADO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[37].AsString := DmRefresher.QryCePedid1STATUS.AsString;
          DmRefresher.SqlAtualizaCompras.Params[38].AsFloat := DmRefresher.QryCePedid1VL_DESCONTO_NOTA.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[39].AsFloat := DmRefresher.QryCePedid1CD_USUARIO_CRIACAO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[40].AsString := DmRefresher.QryCePedid1USUARIO_DIGITACAO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[41].AsFloat := DmRefresher.QryCePedid1CD_USUARIO_DIGITACAO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[42].AsString := DmRefresher.QryCePedid1USUARIO_CRIACAO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[43].AsFloat := DmRefresher.QryCePedid1CD_USUARIO_CONCLUSAO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[44].AsString := DmRefresher.QryCePedid1USUARIO_CONCLUSAO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[45].AsFloat := DmRefresher.QryCePedid1CD_USUARIO_ENVIO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[46].AsString := DmRefresher.QryCePedid1USUARIO_ENVIO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[47].AsString := DmRefresher.QryCePedid1VINCULADO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[48].AsFloat := DmRefresher.QryCePedid1CD_COMPRAS_VINCULADO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[49].AsString := DmRefresher.QryCePedid1TEMVINCULADO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[50].AsString := DmRefresher.QryCePedid1STATUSCONFERENCIA.AsString;
          DmRefresher.SqlAtualizaCompras.Params[51].AsFloat := DmRefresher.QryCePedid1CD_USUARIO_CONFERENCIA.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[52].AsString := DmRefresher.QryCePedid1USUARIO_CONFERENCIA.AsString;
          DmRefresher.SqlAtualizaCompras.Params[53].AsString := DmRefresher.QryCePedid1CONFIGGERACAO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[54].AsString := DmRefresher.QryCePedid1LOCALGERACAO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[55].AsString := DmRefresher.QryCePedid1MODELONF.AsString;
          DmRefresher.SqlAtualizaCompras.Params[56].AsFloat := DmRefresher.QryCePedid1VL_ISENTOICMS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[57].AsFloat := DmRefresher.QryCePedid1ICMS_RETIDO.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[58].AsString := DmRefresher.QryCePedid1PHARMALINK.AsString;
          DmRefresher.SqlAtualizaCompras.Params[59].AsString := DmRefresher.QryCePedid1BONIFICACAO.AsString;
          DmRefresher.SqlAtualizaCompras.Params[60].AsString := DmRefresher.QryCePedid1CHAVENFE.AsString;
          DmRefresher.SqlAtualizaCompras.Params[61].AsFloat := DmRefresher.QryCePedid1VL_PIS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[62].AsFloat := DmRefresher.QryCePedid1VL_COFINS.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[63].AsString := DmRefresher.QryCePedid1INFCPL.AsString;
          DmRefresher.SqlAtualizaCompras.Params[64].AsString := DmRefresher.QryCePedid1TRANSFERENCIA.AsString;
          DmRefresher.SqlAtualizaCompras.Params[65].AsString := DmRefresher.QryCePedid1CONSIGNACAO.AsString;

          DmRefresher.SqlAtualizaCompras.Params[66].AsFloat := DmRefresher.QryCePedid1VL_FCP.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[67].AsFloat := DmRefresher.QryCePedid1VL_FCPST.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[68].AsFloat := DmRefresher.QryCePedid1VL_FCPSTRET.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[69].AsFloat := DmRefresher.QryCePedid1VL_II.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[70].AsFloat := DmRefresher.QryCePedid1ICM_BASESUBSTRET.AsFloat;
          DmRefresher.SqlAtualizaCompras.Params[71].AsFloat := DmRefresher.QryCePedid1ICM_VALORSUBSTRET.AsFloat;
          
          DmRefresher.SqlAtualizaCompras.Params[72].AsFloat := DmRefresher.QryCePedid1ICMSDESONERACAO.AsFloat;

          try
            DmRefresher.SqlAtualizaCompras.ExecSql(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Compras - ' + E.Message);
          end;

         Gauge1.Progress := DmRefresher.QryCePedid1.RecNo;
         DmRefresher.QryCePedid1.Next;
       end;
     ConfirmaTransacao;
     DmRefresher.QryCePedid1.Close;
   Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

         DmRefresher.QryCePedid1.Close;
         CancelaTransacao;

         try
           DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_COMPRAS ACTIVE';
           AbreTransacao;
           DmRefresher.SQL1.ExecSQL(True);
           ConfirmaTransacao;
         except
           CancelaTransacao;
         end;
     end;
   End;
      try
        DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_COMPRAS ACTIVE';
        AbreTransacao;
        DmRefresher.SQL1.ExecSQL(True);
        ConfirmaTransacao;
      except
        CancelaTransacao;
      end;
end;



procedure TFrmPrincipalRefresher.ProcessarPedido;
var i : Integer;
begin
  Try
     DmRefresher.QryCePedido.LoadFromFile(Arquivo);
     DmRefresher.QryCePedido.Open; // virtual
     if DmRefresher.QryCePedido.RecordCount = 0 then
        Exit;

     try
        DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_ITENS_COMPRAS INACTIVE';
        AbreTransacao;
        DmRefresher.SQL1.ExecSQL(True);
        ConfirmaTransacao;
     except
        CancelaTransacao;
     end;

     Gauge1.Progress := 0;
     ExibeProgresso(DmRefresher.QryCePedido.RecordCount, Arquivo);

     AbreTransacao;
     DmRefresher.QryCePedido.First;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Itens Compras: ' + FloatToStr(DmRefresher.QryCePedido.RecordCount));
     while not DmRefresher.QryCePedido.Eof do
      begin
          DmRefresher.SqlAtualizaItensCompra.Params[0].AsFloat := DmRefresher.QryCePedidoCD_COMPRAS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[1].AsFloat := DmRefresher.QryCePedidoID_PRODUTO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[2].AsFloat := DmRefresher.QryCePedidoCD_PRODUTO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[3].AsFloat := DmRefresher.QryCePedidoCD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[4].AsFloat := DmRefresher.QryCePedidoCD_FILIAL_DESTINO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[5].AsString := DmRefresher.QryCePedidoCODIGO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[6].AsString := DmRefresher.QryCePedidoDESCRICAO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[7].AsFloat := DmRefresher.QryCePedidoSALDO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[8].AsFloat := DmRefresher.QryCePedidoESTOQUE_MINIMO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[9].AsFloat := DmRefresher.QryCePedidoESTOQUE_MAXIMO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[10].AsFloat := DmRefresher.QryCePedidoMEDIAF.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[11].AsString := DmRefresher.QryCePedidoCURVA.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[12].AsString := DmRefresher.QryCePedidoLABORATORIO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[13].AsString := DmRefresher.QryCePedidoGRUPO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[14].AsString := DmRefresher.QryCePedidoCLASSE.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[15].AsFloat := DmRefresher.QryCePedidoCD_SITUACAO_TRIB.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[16].AsFloat := DmRefresher.QryCePedidoQUANTIDADE.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[17].AsFloat := DmRefresher.QryCePedidoVL_UNITARIO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[18].AsFloat := DmRefresher.QryCePedidoPERCENTUAL_ICMS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[19].AsFloat := DmRefresher.QryCePedidoREDUCAO_ICMS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[20].AsFloat := DmRefresher.QryCePedidoVL_ICMS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[21].AsFloat := DmRefresher.QryCePedidoPERCENTUAL_DESCONTO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[22].AsFloat := DmRefresher.QryCePedidoVL_DESCONTO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[23].AsFloat := DmRefresher.QryCePedidoPERCENTUAL_IPI.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[24].AsFloat := DmRefresher.QryCePedidoVL_IPI.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[25].AsFloat := DmRefresher.QryCePedidoVL_TOTAL.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[26].AsFloat := DmRefresher.QryCePedidoPERCENTUAL_MARGEM.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[27].AsString := DmRefresher.QryCePedidoCD_ATENDIMENTO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[28].AsFloat := DmRefresher.QryCePedidoNOVO_PRECO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[29].AsFloat := DmRefresher.QryCePedidoNOVO_CUSTO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[30].AsString := DmRefresher.QryCePedidoATUALIZAR_PRECO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[31].AsFloat := DmRefresher.QryCePedidoPRECO_VENDA.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[32].AsFloat := DmRefresher.QryCePedidoQT_EMBALAGEM.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[33].AsFloat := DmRefresher.QryCePedidoULTIMOCUSTO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[34].AsString := DmRefresher.QryCePedidoPRECO_REAJUSTADO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[35].AsString := DmRefresher.QryCePedidoCODIGO_BARRAS.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[36].AsString := DmRefresher.QryCePedidoUNIDADE.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[37].AsString := DmRefresher.QryCePedidoICMS.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[38].AsFloat := DmRefresher.QryCePedidoBASEICMS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[39].AsFloat := DmRefresher.QryCePedidoBASEICMSSUBSTITUICAO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[40].AsString := DmRefresher.QryCePedidoSITUACAOTRIBITARIA.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[41].AsString := DmRefresher.QryCePedidoLOTE.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[42].AsDateTime := DmRefresher.QryCePedidoFABRICACAO.AsDateTime;
          DmRefresher.SqlAtualizaItensCompra.Params[43].AsDateTime := DmRefresher.QryCePedidoVALIDADE.AsDateTime;
          DmRefresher.SqlAtualizaItensCompra.Params[44].AsFloat := DmRefresher.QryCePedidoPRECO_PROMOCAO_ATUAL.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[45].AsFloat := DmRefresher.QryCePedidoPRECO_PROMOCAO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[46].AsFloat := DmRefresher.QryCePedidoDESCONTO_OUTROS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[47].AsString := DmRefresher.QryCePedidoDIASSEMVENDER.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[48].AsString := DmRefresher.QryCePedidoENVIADO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[49].AsString := DmRefresher.QryCePedidoCFOP.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[50].AsFloat := DmRefresher.QryCePedidoVALORICMSSUBTITUICAO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[51].AsFloat := DmRefresher.QryCePedidoCUSTO_APLICADO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[52].AsFloat := DmRefresher.QryCePedidoMARGEM_VALOR_AGREGADO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[53].AsFloat := DmRefresher.QryCePedidoREDUCAO_ICMS_ST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[54].AsFloat := DmRefresher.QryCePedidoPERCENTUAL_ICMS_ST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[55].AsString := DmRefresher.QryCePedidoPIS_CST.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[56].AsFloat := DmRefresher.QryCePedidoPIS_BASE_CALCULO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[57].AsFloat := DmRefresher.QryCePedidoPIS_PERCENTUAL.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[58].AsFloat := DmRefresher.QryCePedidoPIS_VALOR.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[59].AsString := DmRefresher.QryCePedidoCOFINS_CST.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[60].AsFloat := DmRefresher.QryCePedidoCOFINS_BASE_CALCULO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[61].AsFloat := DmRefresher.QryCePedidoCOFINS_PERCENTUAL.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[62].AsFloat := DmRefresher.QryCePedidoCOFINS_VALOR.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[63].AsFloat := DmRefresher.QryCePedidoVALOR_OUTRASDESPESAS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[64].AsFloat := DmRefresher.QryCePedidoVALOR_SEGURO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[65].AsFloat := DmRefresher.QryCePedidoVALOR_FRETE.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[66].AsFloat := DmRefresher.QryCePedidoVALOR_ISENTO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[67].AsFloat := DmRefresher.QryCePedidoVALOR_OUTRAS.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[68].AsFloat := DmRefresher.QryCePedidoBASECALCULO_IPI.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[69].AsFloat := DmRefresher.QryCePedidoCST_IPI.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[70].AsString := DmRefresher.QryCePedidoNATUREZA_ISENTA_PIS.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[71].AsString := DmRefresher.QryCePedidoNATUREZA_ISENTA_COFINS.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[72].AsString := DmRefresher.QryCePedidoCEST.AsString;

          DmRefresher.SqlAtualizaItensCompra.Params[73].AsFloat := DmRefresher.QryCePedidoBASECALCULOFCP.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[74].AsFloat := DmRefresher.QryCePedidoALIQUOTAFCP.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[75].AsFloat := DmRefresher.QryCePedidoVALORFCP.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[76].AsFloat := DmRefresher.QryCePedidoBASECALCULOFCPST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[77].AsFloat := DmRefresher.QryCePedidoALIQUOTAFCPST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[78].AsFloat := DmRefresher.QryCePedidoVALORFCPST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[79].AsFloat := DmRefresher.QryCePedidoBASECALCULOFCPSTRET.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[80].AsFloat := DmRefresher.QryCePedidoALIQUOTAFCPSTRET.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[81].AsFloat := DmRefresher.QryCePedidoVALORFCPSTRET.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[82].AsFloat := DmRefresher.QryCePedidoBASECALCULOFCPSTRET.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[83].AsFloat := DmRefresher.QryCePedidoPERCENTUAL_ICMS_ST_RET.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[84].AsFloat := DmRefresher.QryCePedidoVALORICMSSUBSTITUICAORET.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[85].AsString := DmRefresher.QryCePedidoNCM.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[86].AsString := DmRefresher.QryCePedidoORIGEM.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[87].AsString := DmRefresher.QryCePedidoINFORMACOESADICIONAIS.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[88].AsInteger := DmRefresher.QryCePedidoMODALIDADEBC.AsInteger;
          DmRefresher.SqlAtualizaItensCompra.Params[89].AsInteger := DmRefresher.QryCePedidoMODALIDADEBCST.AsInteger;
          DmRefresher.SqlAtualizaItensCompra.Params[90].AsFloat := DmRefresher.QryCePedidoICMSBCUFDEST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[91].AsFloat := DmRefresher.QryCePedidoICMSBCFCPUFDEST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[92].AsFloat := DmRefresher.QryCePedidoICMSPERCENTUALFCPUFDEST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[93].AsFloat := DmRefresher.QryCePedidoICMSVALORFCPUFDEST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[94].AsFloat := DmRefresher.QryCePedidoICMSPERCENTUALINTER.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[95].AsFloat := DmRefresher.QryCePedidoICMSPERCENTUALUFDEST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[96].AsFloat := DmRefresher.QryCePedidoICMSVALORUFREMET.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[97].AsFloat := DmRefresher.QryCePedidoICMSVALORUFDEST.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[98].AsFloat := DmRefresher.QryCePedidoICMSPERCENTUALINTERPART.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[99].AsString := DmRefresher.QryCePedidoCODIGOANVISA.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[100].AsFloat := DmRefresher.QryCePedidoPMC.AsFloat;

          DmRefresher.SqlAtualizaItensCompra.Params[101].AsString := DmRefresher.QryCePedidoCODIGOBENEFICIO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[102].AsString := DmRefresher.QryCePedidoMOTIVODESONERACAO.AsString;
          DmRefresher.SqlAtualizaItensCompra.Params[103].AsFloat := DmRefresher.QryCePedidoVALORDESONERACAO.AsFloat;
          DmRefresher.SqlAtualizaItensCompra.Params[104].AsFloat := DmRefresher.QryCePedidoPERCENTUALDESONERACAO.AsFloat;

          try
            DmRefresher.SqlAtualizaItensCompra.ExecSql(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de ItensCompras - ' + E.Message);
          end;

         Gauge1.Progress := DmRefresher.QryCePedido.RecNo;
         DmRefresher.QryCePedido.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryCePedido.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        DmRefresher.QryCePedido.Close;
        CancelaTransacao;
          try
            DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_ITENS_COMPRAS ACTIVE';
            AbreTransacao;
            DmRefresher.SQL1.ExecSQL(True);
            ConfirmaTransacao;
          except
            CancelaTransacao;
          end;
     end;
  End;
  try
    DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_ITENS_COMPRAS ACTIVE';
    AbreTransacao;
    DmRefresher.SQL1.ExecSQL(True);
    ConfirmaTransacao;
  except
    CancelaTransacao;
  end;
end;


procedure TFrmPrincipalRefresher.ProcessarComprasBoletos;
var i : Integer;
begin
  Try
     DmRefresher.CdsComprasBoletos.LoadFromFile(Arquivo);
     DmRefresher.CdsComprasBoletos.Open; // virtual
     if DmRefresher.CdsComprasBoletos.RecordCount = 0 then
        Exit;

     try
        DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_COMPRAS_BOLETOS INACTIVE';
        AbreTransacao;
        DmRefresher.SQL1.ExecSQL(True);
        ConfirmaTransacao;
     except
        CancelaTransacao;
     end;

     Gauge1.Progress := 0;
     ExibeProgresso(DmRefresher.CdsComprasBoletos.RecordCount, Arquivo);

     AbreTransacao;
     DmRefresher.CdsComprasBoletos.First;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Compras Boletos: ' + FloatToStr(DmRefresher.CdsComprasBoletos.RecordCount));
     while not DmRefresher.CdsComprasBoletos.Eof do
      begin
        DmRefresher.SqlAtualizaComprasBoletos.Params[0].AsFloat := DmRefresher.CdsComprasBoletosCD_COMPRAS.AsFloat;
        DmRefresher.SqlAtualizaComprasBoletos.Params[1].AsFloat := DmRefresher.CdsComprasBoletosCD_BOLETO.AsFloat;
        DmRefresher.SqlAtualizaComprasBoletos.Params[2].AsString := DmRefresher.CdsComprasBoletosNUMERO.AsString;
        DmRefresher.SqlAtualizaComprasBoletos.Params[3].AsDate := DmRefresher.CdsComprasBoletosVENCIMENTO.AsDateTime;
        DmRefresher.SqlAtualizaComprasBoletos.Params[4].AsFloat := DmRefresher.CdsComprasBoletosJUROS.AsFloat;
        DmRefresher.SqlAtualizaComprasBoletos.Params[5].AsFloat := DmRefresher.CdsComprasBoletosDEDUCOES.AsFloat;
        DmRefresher.SqlAtualizaComprasBoletos.Params[6].AsFloat := DmRefresher.CdsComprasBoletosDESPESASFINANCEIRAS.AsFloat;
        DmRefresher.SqlAtualizaComprasBoletos.Params[7].AsFloat := DmRefresher.CdsComprasBoletosVALOR.AsFloat;

        Try
          DmRefresher.SqlAtualizaComprasBoletos.ExecSql(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de Compras Boletos - Execução da Procedure');
        End;

        Gauge1.Progress := DmRefresher.CdsComprasBoletos.RecNo;
        DmRefresher.CdsComprasBoletos.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.CdsComprasBoletos.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        DmRefresher.CdsComprasBoletos.Close;
        CancelaTransacao;
          try
            DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_COMPRAS_BOLETOS ACTIVE';
            AbreTransacao;
            DmRefresher.SQL1.ExecSQL(True);
            ConfirmaTransacao;
          except
            CancelaTransacao;
          end;
     end;
  End;
  try
    DmRefresher.SQL1.CommandText := 'ALTER TRIGGER TG_AT_COMPRAS_BOLETOS ACTIVE';
    AbreTransacao;
    DmRefresher.SQL1.ExecSQL(True);
    ConfirmaTransacao;
  except
    CancelaTransacao;
  end;
end;


procedure TFrmPrincipalRefresher.ProcessarContasPagarCompras;
var i : Integer;
begin
  Try
     DmRefresher.CdsContasPagarCompras.LoadFromFile(Arquivo);
     DmRefresher.CdsContasPagarCompras.Open; // virtual
     if DmRefresher.CdsContasPagarCompras.RecordCount = 0 then
        Exit;

     try
        DmRefresher.SQL1.CommandText := 'ALTER TRIGGER CONTAS_PAGAR_COMPRAS_BIU0 INACTIVE';
        AbreTransacao;
        DmRefresher.SQL1.ExecSQL(True);
        ConfirmaTransacao;
     except
        CancelaTransacao;
     end;

     Gauge1.Progress := 0;
     ExibeProgresso(DmRefresher.CdsContasPagarCompras.RecordCount, Arquivo);

     AbreTransacao;
     DmRefresher.CdsContasPagarCompras.First;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Compras Boletos: ' + FloatToStr(DmRefresher.CdsContasPagarCompras.RecordCount));
     while not DmRefresher.CdsContasPagarCompras.Eof do
      begin
        DmRefresher.SqlAtualizaContasPagarCompras.Params[0].AsFloat := DmRefresher.CdsContasPagarComprasCD_FILIAL.AsFloat;
        DmRefresher.SqlAtualizaContasPagarCompras.Params[1].AsFloat := DmRefresher.CdsContasPagarComprasCD_CONTAS_PAGAR.AsFloat;
        DmRefresher.SqlAtualizaContasPagarCompras.Params[2].AsFloat := DmRefresher.CdsContasPagarComprasCD_COMPRAS.AsFloat;
        DmRefresher.SqlAtualizaContasPagarCompras.Params[3].AsDate  := DmRefresher.CdsContasPagarComprasDT_EMISSAO.AsDateTime;
        DmRefresher.SqlAtualizaContasPagarCompras.Params[4].AsString := DmRefresher.CdsContasPagarComprasNOTA_FISCAL.AsString;
        DmRefresher.SqlAtualizaContasPagarCompras.Params[5].AsFloat := DmRefresher.CdsContasPagarComprasVALOR.AsFloat;

        Try
          DmRefresher.SqlAtualizaContasPagarCompras.ExecSql(False);
        Except
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Erro ocorrido no processo de ContasPagarCompras - Execução da Procedure');
        End;

        Gauge1.Progress := DmRefresher.CdsContasPagarCompras.RecNo;
        DmRefresher.CdsContasPagarCompras.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.CdsContasPagarCompras.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        DmRefresher.CdsContasPagarCompras.Close;
        CancelaTransacao;
          try
            DmRefresher.SQL1.CommandText := 'ALTER TRIGGER CONTAS_PAGAR_COMPRAS_BIU0 ACTIVE';
            AbreTransacao;
            DmRefresher.SQL1.ExecSQL(True);
            ConfirmaTransacao;
          except
            CancelaTransacao;
          end;
     end;
  End;
  try
    DmRefresher.SQL1.CommandText := 'ALTER TRIGGER CONTAS_PAGAR_COMPRAS_BIU0 ACTIVE';
    AbreTransacao;
    DmRefresher.SQL1.ExecSQL(True);
    ConfirmaTransacao;
  except
    CancelaTransacao;
  end;
end;


procedure TFrmPrincipalRefresher.ProcessarLotesItensCompra;
var i : Integer;
begin
  Try
     DmRefresher.CdsLotesItensCompra.LoadFromFile(Arquivo);
     DmRefresher.CdsLotesItensCompra.Open; // virtual
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Lotes Itens Compras registros encontrados: ' + IntToStr(DmRefresher.CdsLotesItensCompra.RecordCount));
     if DmRefresher.CdsLotesItensCompra.RecordCount = 0 then
        Exit;

     try
        DmRefresher.SQL1.CommandText := 'ALTER TRIGGER ITENS_COMPRA_LOTE_AIU0 INACTIVE';
        AbreTransacao;
        DmRefresher.SQL1.ExecSQL(True);
        ConfirmaTransacao;
     except
        CancelaTransacao;
     end;

     Gauge1.Progress := 0;
     ExibeProgresso(DmRefresher.CdsLotesItensCompra.RecordCount, Arquivo);

     AbreTransacao;
     DmRefresher.CdsLotesItensCompra.First;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Lotes Itens Compras: ' + FloatToStr(DmRefresher.CdsLotesItensCompra.RecordCount));
     while not DmRefresher.CdsLotesItensCompra.Eof do
      begin
        DmRefresher.SqlAtualizaItensCompraLote.Params[0].AsFloat := DmRefresher.CdsLotesItensCompraCD_COMPRAS.AsFloat;
        DmRefresher.SqlAtualizaItensCompraLote.Params[1].AsFloat := DmRefresher.CdsLotesItensCompraCD_FILIAL.AsFloat;
        DmRefresher.SqlAtualizaItensCompraLote.Params[2].AsFloat := DmRefresher.CdsLotesItensCompraCD_DISTRIBUIDOR.AsFloat;
        DmRefresher.SqlAtualizaItensCompraLote.Params[3].AsString := DmRefresher.CdsLotesItensCompraNOTA_FISCAL.AsString;
        DmRefresher.SqlAtualizaItensCompraLote.Params[4].AsFloat := DmRefresher.CdsLotesItensCompraID_PRODUTO.AsFloat;
        DmRefresher.SqlAtualizaItensCompraLote.Params[5].AsString := DmRefresher.CdsLotesItensCompraLOTE.AsString;
        DmRefresher.SqlAtualizaItensCompraLote.Params[6].AsFloat := DmRefresher.CdsLotesItensCompraQUANTIDADE.AsFloat;
        DmRefresher.SqlAtualizaItensCompraLote.Params[7].AsDate := DmRefresher.CdsLotesItensCompraFABRICACAO.AsDateTime;
        DmRefresher.SqlAtualizaItensCompraLote.Params[8].AsDate := DmRefresher.CdsLotesItensCompraVALIDADE.AsDateTime;
       
        try
          DmRefresher.SqlAtualizaItensCompraLote.ExecSql(False);
        except
          on E:Exception do
             GravaLog('Erro na atualização de Lotes de ItensCompras - ' + E.Message);

        end;

       Gauge1.Progress := DmRefresher.CdsLotesItensCompra.RecNo;
       DmRefresher.CdsLotesItensCompra.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.CdsLotesItensCompra.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro no processo de Lotes Itens Compras : ' + E.Message);

        DmRefresher.CdsLotesItensCompra.Close;
        CancelaTransacao;
          try
            DmRefresher.SQL1.CommandText := 'ALTER TRIGGER ITENS_COMPRA_LOTE_AIU0 ACTIVE';
            AbreTransacao;
            DmRefresher.SQL1.ExecSQL(True);
            ConfirmaTransacao;
          except
            CancelaTransacao;
          end;
     end;
  End;
  try
    DmRefresher.SQL1.CommandText := 'ALTER TRIGGER ITENS_COMPRA_LOTE_AIU0 ACTIVE';
    AbreTransacao;
    DmRefresher.SQL1.ExecSQL(True);
    ConfirmaTransacao;
  except
    CancelaTransacao;
  end;
end;


procedure TFrmPrincipalRefresher.ProcessarEstoqueMinimo;
begin
  Try
      DmRefresher.QryCeProdut.LoadFromFile(Arquivo);
      DmRefresher.QryCeProdut.IndexFieldNames := 'ID_PRODUTO';
      DmRefresher.QryCeProdut.Open; // virtual
      if DmRefresher.QryCeProdut.RecordCount = 0 then
       begin
         CancelaTransacao;
         Exit;
       end;
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Estoques / Custos : ' + FloatToStr(DmRefresher.QryCeProdut.RecordCount) + ' - Sem recalculo do estoque.');
      // FML - 04.07.2023
      //AbreTransacao;
      // FML - 04.07.2023
      DmRefresher.QryCeProdut.First;
      Gauge1.Progress := 0;
      ExibeProgresso(DmRefresher.QryCeProdut.RecordCount, Arquivo);
      While not DmRefresher.QryCeProdut.Eof do
       begin
         If not (DmRefresher.QryCeProdut.FieldByName('ESTOQUE_' + FloatToStr(Filial)).IsNull) and
            not (DmRefresher.QryCeProdut.FieldByName('CUSTO_UNITARIO_'+ FloatToStr(Filial)).IsNull) and
            not (DmRefresher.QryCeProdut.FieldByName('CUSTO_MEDIO_'+ FloatToStr(Filial)).IsNull) and
            not (DmRefresher.QryCeProdut.FieldByName('ID_PRODUTO').IsNull)  then
           begin
              DmRefresher.SqlAtualizaEstoqueMinimo.Params[0].AsFloat  := Filial;
              DmRefresher.SqlAtualizaEstoqueMinimo.Params[1].AsFloat  := DmRefresher.QryCeProdut.FieldByName('ID_PRODUTO').AsFloat;
              DmRefresher.SqlAtualizaEstoqueMinimo.Params[2].AsFloat  := DmRefresher.QryCeProdut.FieldByName('ESTOQUE_' + FloatToStr(Filial)).AsFloat;
              DmRefresher.SqlAtualizaEstoqueMinimo.Params[3].AsFloat  := DmRefresher.QryCeProdut.FieldByName('CUSTO_UNITARIO_' + FloatToStr(Filial)).AsFloat;
              DmRefresher.SqlAtualizaEstoqueMinimo.Params[4].AsFloat  := DmRefresher.QryCeProdut.FieldByName('CUSTO_MEDIO_' + FloatToStr(Filial)).AsFloat;
              DmRefresher.SqlAtualizaEstoqueMinimo.Params[5].AsString := DmRefresher.QryCeProdut.FieldByName('IDENTIFICADOR').AsString;
              DmRefresher.SqlAtualizaEstoqueMinimo.Params[6].AsFloat  := DmRefresher.QryCeProdut.FieldByName('FACE_' + FloatToStr(Filial)).AsFloat;
              if FormatDateTime('mm/dd/yyyy', DmRefresher.QryCeProdut.FieldByName('DT_ULT_VENDA_' + FloatToStr(Filial)).AsDateTime) <> '12/30/1899' then
                 DmRefresher.SqlAtualizaEstoqueMinimo.Params[7].AsString := FormatDateTime('mm/dd/yyyy', DmRefresher.QryCeProdut.FieldByName('DT_ULT_VENDA_' + FloatToStr(Filial)).AsDateTime)
                 else
                 DmRefresher.SqlAtualizaEstoqueMinimo.Params[7].AsString := '';

              if FormatDateTime('mm/dd/yyyy', DmRefresher.QryCeProdut.FieldByName('DT_ULT_COMPRA_' + FloatToStr(Filial)).AsDateTime) <> '12/30/1899' then
                 DmRefresher.SqlAtualizaEstoqueMinimo.Params[8].AsString := FormatDateTime('mm/dd/yyyy', DmRefresher.QryCeProdut.FieldByName('DT_ULT_COMPRA_' + FloatToStr(Filial)).AsDateTime)
              else
                 DmRefresher.SqlAtualizaEstoqueMinimo.Params[8].AsString := '';

              try
                // FML - 04.07.2023
                AbreTransacao;
                // FML - 04.07.2023

                DmRefresher.SqlAtualizaEstoqueMinimo.ExecSQL(False);

                // FML - 04.07.2023
                ConfirmaTransacao;
                // FML - 04.07.2023
              except
                on E:Exception do
                 begin
                   GravaLog('Erro na atualização de Estoque Minimo - ' + E.Message);
                   // FML - 04.07.2023
                   GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Produto : ' + DmRefresher.QryCeProdut.FieldByName('ID_PRODUTO').AsString);
                   CancelaTransacao;
                   // FML - 04.07.2023
                 end;
              end;
           end;
         Gauge1.Progress := DmRefresher.QryCeProdut.RecNo;

         {Try
           DmRefresher.Sql.CommandText := 'EXECUTE PROCEDURE SP_RECALCULA_ESTOQUE_ERRO_PROD(' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date - 7)) + ', ' + InttoStr(DmRefresher.QryCeProdut.FieldByName('ID_PRODUTO').AsInteger)  + ' )';
           DmRefresher.Sql.ExecSQL(True);
         Except
           on E:Exception do
            begin
              GravaLog('Erro em SP_RECALCULA_ESTOQUE_ERRO_PROD - Processo de Estoque Minimo - ' + E.Message);
              GravaLog('SP_RECALCULA_ESTOQUE_ERRO_PROD - Produto : ' + DmRefresher.QryCeProdut.FieldByName('ID_PRODUTO').AsString + ' - Filial : ' + FloattoStr(Filial) + ' - Estoque : ' + DmRefresher.QryCeProdut.FieldByName('ESTOQUE_' + FloatToStr(Filial)).AsString);
            end;
         End;}

         DmRefresher.QryCeProdut.Next;
       end;
      //ConfirmaTransacao;
      DmRefresher.QryCeProdut.Close;
  Except
    on E:Exception do
     begin
        GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + E.Message);
      DmRefresher.QryCeProdut.Close;
      // FML - 04.07.2023
      //CancelaTransacao;
      // FML - 04.07.2023
     end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarOperadores;
var i : integer;
begin
  Try
    DmRefresher.QryCeOpcaix.LoadFromFile(Arquivo);
    DmRefresher.QryCeOpcaix.Open; // virtual
    if DmRefresher.QryCeOpcaix.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeOpcaix.RecordCount, Arquivo);

    DmRefresher.QryCeOpcaix.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Operadores: ' + FloatToStr(DmRefresher.QryCeOpcaix.RecordCount));
    While not DmRefresher.QryCeOpcaix.Eof do
     begin
       AbreTransacao;
       DmRefresher.CdsOperadores.Close;
       DmRefresher.CdsOperadores.Params[0].AsFloat := DmRefresher.QryCeOpcaixCD_FILIAL.AsFloat;
       DmRefresher.CdsOperadores.Params[1].AsFloat := DmRefresher.QryCeOpcaixID_OPERADORCAIXA.AsFloat;
       DmRefresher.CdsOperadores.Open;
       if DmRefresher.CdsOperadores.RecordCount = 0 then
        begin
           if not (DmRefresher.QryCeOpcaixDATA_ABERTURA.IsNull) then
            begin
               DmRefresher.CdsOperadores.Append;
               for i := 0 to DmRefresher.CdsOperadores.FieldCount - 1 do
                   DmRefresher.CdsOperadores.Fields[i].Value := DmRefresher.QryCeOpcaix.Fields[i].Value;
               DmRefresher.CdsOperadores.ApplyUpdates(0);
            end;
        end
       else
        begin
           if DmRefresher.CdsOperadoresSTATUS.AsString <> 'C' then   //evita que operador ja concluido na Gestao seja sobreposto
            begin
               DmRefresher.CdsOperadores.Edit;
               for i := 0 to DmRefresher.CdsOperadores.FieldCount - 1 do
                   DmRefresher.CdsOperadores.Fields[i].Value := DmRefresher.QryCeOpcaix.Fields[i].Value;
               DmRefresher.CdsOperadores.ApplyUpdates(0);
            end;
        end;

       ConfirmaTransacao;

       Gauge1.Progress := DmRefresher.QryCeOpcaix.RecNo;

       DmRefresher.QryCeOpcaix.Next;
     end;
     DmRefresher.QryCeOpcaix.Close;
     DmRefresher.CdsOperadores.Close;
   Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

     DmRefresher.QryCeOpcaix.Close;
     DmRefresher.CdsOperadores.Close;
     CancelaTransacao;
    end;
   End;
end;


procedure TFrmPrincipalRefresher.ProcessarEntregas;
var i : integer;
begin
  Try
    DmRefresher.QryCentregas.LoadFromFile(Arquivo);
    DmRefresher.QryCentregas.Open; // virtual
    if DmRefresher.QryCentregas.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCentregas.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryCentregas.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Entregas: ' + FloatToStr(DmRefresher.QryCentregas.RecordCount));
    While not DmRefresher.QryCentregas.Eof do
      begin
         DmRefresher.SqlAtualizaEntregas.Params[0].AsFloat := DmRefresher.QryCentregasCD_FILIAL.AsFloat;
         DmRefresher.SqlAtualizaEntregas.Params[1].AsFloat := DmRefresher.QryCentregasCD_VENDA.AsFloat;
         DmRefresher.SqlAtualizaEntregas.Params[2].AsFloat := DmRefresher.QryCentregasCD_ENTREGADOR.AsFloat;
         DmRefresher.SqlAtualizaEntregas.Params[3].AsFloat := DmRefresher.QryCentregasCD_CLIENTE.AsFloat;
         DmRefresher.SqlAtualizaEntregas.Params[4].AsString := DmRefresher.QryCentregasNOME.AsString;
         DmRefresher.SqlAtualizaEntregas.Params[5].AsString := DmRefresher.QryCentregasENDERECO.AsString;
         DmRefresher.SqlAtualizaEntregas.Params[6].AsString := DmRefresher.QryCentregasBAIRRO.AsString;
         DmRefresher.SqlAtualizaEntregas.Params[7].AsString := DmRefresher.QryCentregasREFERENCIA.AsString;
         DmRefresher.SqlAtualizaEntregas.Params[8].AsDate := DmRefresher.QryCentregasDATA.AsDateTime;
         DmRefresher.SqlAtualizaEntregas.Params[9].AsTime := DmRefresher.QryCentregasHORA_SAIDA.AsDateTime;
         DmRefresher.SqlAtualizaEntregas.Params[10].AsTime := DmRefresher.QryCentregasHORA_CHEGADA.AsDateTime;
         DmRefresher.SqlAtualizaEntregas.Params[11].AsFloat := DmRefresher.QryCentregasTROCO.AsFloat;
         DmRefresher.SqlAtualizaEntregas.Params[12].AsFloat := DmRefresher.QryCentregasVALORRETORNO.AsFloat;
         DmRefresher.SqlAtualizaEntregas.Params[13].AsString := DmRefresher.QryCentregasENVIADO.AsString;
         DmRefresher.SqlAtualizaEntregas.Params[14].AsString := DmRefresher.QryCentregasSTATUS.AsString;
         try
          DmRefresher.SqlAtualizaEntregas.ExecSQL(False);
         except
                   on E:Exception do
             GravaLog('Erro na atualização de Entregas - ' + E.Message);

         end;

         Gauge1.Progress := DmRefresher.QryCentregas.RecNo;
         DmRefresher.QryCentregas.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryCentregas.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryCentregas.Close;
    CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarVendasItensExcluidos;
var i : integer;
begin
  Try
    DmRefresher.QryVendasItensExcluidos.LoadFromFile(Arquivo);
    DmRefresher.QryVendasItensExcluidos.Open; // virtual
    if DmRefresher.QryVendasItensExcluidos.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryVendasItensExcluidos.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryVendasItensExcluidos.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - VendasItensExcluidos: ' + FloatToStr(DmRefresher.QryVendasItensExcluidos.RecordCount));
    While not DmRefresher.QryVendasItensExcluidos.Eof do
      begin
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[0].AsFloat := DmRefresher.QryVendasItensExcluidosID_ITEM_EXCLUIDO.AsFloat;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[1].AsFloat := DmRefresher.QryVendasItensExcluidosCD_FILIAL.AsFloat;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[2].AsDate := DmRefresher.QryVendasItensExcluidosDATA.AsDateTime;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[3].AsTime := DmRefresher.QryVendasItensExcluidosHORA.AsDateTime;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[4].AsFloat := DmRefresher.QryVendasItensExcluidosTERMINAL.AsFloat;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[5].AsFloat := DmRefresher.QryVendasItensExcluidosCD_USUARIO.AsFloat;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[6].AsString := DmRefresher.QryVendasItensExcluidosUSUARIO.AsString;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[7].AsFloat := DmRefresher.QryVendasItensExcluidosID_PRODUTO.AsFloat;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[8].AsString := DmRefresher.QryVendasItensExcluidosPRODUTO.AsString;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[9].AsFloat := DmRefresher.QryVendasItensExcluidosQUANTIDADE.AsFloat;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[10].AsFloat := DmRefresher.QryVendasItensExcluidosVALOR.AsFloat;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[11].AsString := DmRefresher.QryVendasItensExcluidosENVIADO.AsString;
         DmRefresher.SqlAtualizaVendasItensExcluidos.Params[12].AsFloat := DmRefresher.QryVendasItensExcluidosID_OPERADOR_CAIXA.AsFloat;
         try
          DmRefresher.SqlAtualizaVendasItensExcluidos.ExecSQL(False);
         except
                   on E:Exception do
             GravaLog('Erro na atualização de VendasItensExcluidos - ' + E.Message);

         end;

         Gauge1.Progress := DmRefresher.QryVendasItensExcluidos.RecNo;
         DmRefresher.QryVendasItensExcluidos.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryVendasItensExcluidos.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryVendasItensExcluidos.Close;
    CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarCheques;
var i : integer;
begin
  Try
    Try
      DmRefresher.SQL1.CommandText := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 INACTIVE';
      AbreTransacao;
      DmRefresher.SQL1.ExecSQL(True);
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    End;

    DmRefresher.QryCeCheques.LoadFromFile(Arquivo);
    DmRefresher.QryCeCheques.Open; // virtual
    if DmRefresher.QryCeCheques.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeCheques.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryCeCheques.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Cheques Recebidos: ' + FloatToStr(DmRefresher.QryCeCheques.RecordCount));
    While not DmRefresher.QryCeCheques.Eof do
      begin
           DmRefresher.CdsCheques.Close;
           DmRefresher.CdsCheques.Params[0].AsFloat := DmRefresher.QryCeChequesCD_CHEQUE_RECEBIDO.AsFloat;
           DmRefresher.CdsCheques.Params[1].AsFloat := DmRefresher.QryCeChequesCD_FILIAL.AsFloat;
           DmRefresher.CdsCheques.Open;
           if DmRefresher.CdsCheques.RecordCount = 0 then
            begin
               DmRefresher.CdsCheques.Append;
               for i := 0 to DmRefresher.CdsCheques.FieldCount - 1 do
                  DmRefresher.CdsCheques.Fields[i].Value := DmRefresher.QryCeCheques.Fields[i].Value;
               DmRefresher.CdsCheques.ApplyUpdates(0);
            end;

           Gauge1.Progress := DmRefresher.QryCeCheques.RecNo;

           DmRefresher.QryCeCheques.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryCeCheques.Close;
    DmRefresher.CdsCheques.Close;

    Try
      DmRefresher.SQL1.CommandText := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 ACTIVE';
      AbreTransacao;
      DmRefresher.SQL1.ExecSQL(True);
      ConfirmaTransacao;
    Except
      CancelaTransacao;
    End;

  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        DmRefresher.QryCeCheques.Close;
        DmRefresher.CdsCheques.Close;
        CancelaTransacao;

        Try
          DmRefresher.SQL1.CommandText := 'ALTER TRIGGER CHEQUESRECEBIDOS_BI0 ACTIVE';
          AbreTransacao;
          DmRefresher.SQL1.ExecSQL(True);
          ConfirmaTransacao;
        Except
          CancelaTransacao;
        End;
     end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarTransfer;
var i : integer;
begin
  Try
    DmRefresher.QryCeTransfer.Close;
    DmRefresher.QryCeTransfer.LoadFromFile(Arquivo);
    DmRefresher.QryCeTransfer.Open; // virtual
    if DmRefresher.QryCeTransfer.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeTransfer.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryCeTransfer.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Transferencias: ' + FloatToStr(DmRefresher.QryCeTransfer.RecordCount));
    While not DmRefresher.QryCeTransfer.Eof do
      begin
            DmRefresher.SqlAtualizaTransfer.Params[0].AsFloat := DmRefresher.QryCeTransferCD_TRANSFER.AsFloat;
            
            if not (DmRefresher.QryCeTransferDATA_GERACAO.IsNull) then
               DmRefresher.SqlAtualizaTransfer.Params[1].AsString := FormatDateTime('mm/dd/yyyy', DmRefresher.QryCeTransferDATA_GERACAO.AsDateTime)
            else
               DmRefresher.SqlAtualizaTransfer.Params[1].AsString := '';
            if not (DmRefresher.QryCeTransferHORA_GERACAO.IsNull) then
               DmRefresher.SqlAtualizaTransfer.Params[2].AsString := FormatDateTime('hh:mm:ss', DmRefresher.QryCeTransferHORA_GERACAO.AsDateTime)
            else
               DmRefresher.SqlAtualizaTransfer.Params[2].AsString := '';

            if not (DmRefresher.QryCeTransferDATA_ENVIO.IsNull) then
               DmRefresher.SqlAtualizaTransfer.Params[3].AsString := FormatDateTime('mm/dd/yyyy', DmRefresher.QryCeTransferDATA_ENVIO.AsDateTime)
            else
               DmRefresher.SqlAtualizaTransfer.Params[3].AsString := '';
            if not (DmRefresher.QryCeTransferHORA_ENVIO.IsNull) then
               DmRefresher.SqlAtualizaTransfer.Params[4].AsString := FormatDateTime('hh:mm:ss', DmRefresher.QryCeTransferHORA_ENVIO.AsDateTime)
            else
               DmRefresher.SqlAtualizaTransfer.Params[4].AsString := '';

            if not (DmRefresher.QryCeTransferDATA_CONCLUSAO.IsNull) then
               DmRefresher.SqlAtualizaTransfer.Params[5].AsString := FormatDateTime('mm/dd/yyyy', DmRefresher.QryCeTransferDATA_CONCLUSAO.AsDateTime)
            else
               DmRefresher.SqlAtualizaTransfer.Params[5].AsString := '';
            if not (DmRefresher.QryCeTransferHORA_CONCLUSAO.IsNull) then
               DmRefresher.SqlAtualizaTransfer.Params[6].AsString := FormatDateTime('hh:mm:ss', DmRefresher.QryCeTransferHORA_CONCLUSAO.AsDateTime)
            else
               DmRefresher.SqlAtualizaTransfer.Params[6].AsString := '';

            DmRefresher.SqlAtualizaTransfer.Params[7].AsFloat := DmRefresher.QryCeTransferCD_FILIAL_ORIGEM.AsFloat;
            DmRefresher.SqlAtualizaTransfer.Params[8].AsFloat := DmRefresher.QryCeTransferCD_FILIAL_DESTINO.AsFloat;
            DmRefresher.SqlAtualizaTransfer.Params[9].AsFloat := DmRefresher.QryCeTransferCD_USUARIO_ORIGEM.AsFloat;
            DmRefresher.SqlAtualizaTransfer.Params[10].AsFloat := DmRefresher.QryCeTransferCD_USUARIO_DESTINO.AsFloat;
            DmRefresher.SqlAtualizaTransfer.Params[11].AsString := DmRefresher.QryCeTransferOBSERVACOES.AsString;
            DmRefresher.SqlAtualizaTransfer.Params[12].AsString := DmRefresher.QryCeTransferENVIADO.AsString;
            DmRefresher.SqlAtualizaTransfer.Params[13].AsString := DmRefresher.QryCeTransferSTATUS.AsString;
            DmRefresher.SqlAtualizaTransfer.Params[14].AsFloat := DmRefresher.QryCeTransferCD_VENDEDOR.AsFloat;
            try
              DmRefresher.SqlAtualizaTransfer.ExecSQL(False);
            except
          on E:Exception do
             GravaLog('Erro na atualização de Transferencias - ' + E.Message);

            end;

           Gauge1.Progress := DmRefresher.QryCeTransfer.RecNo;
           DmRefresher.QryCeTransfer.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryCeTransfer.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryCeTransfer.Close;
    CancelaTransacao;
   end;
  End;
end;




procedure TFrmPrincipalRefresher.ProcessarItensTransfer;
var i : integer;
begin
  Try
    DmRefresher.QryCeItensTransfer.LoadFromFile(Arquivo);
    DmRefresher.QryCeItensTransfer.Open; // virtual
    if DmRefresher.QryCeItensTransfer.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeItensTransfer.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryCeItensTransfer.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Itens Transferencias: ' + FloatToStr(DmRefresher.QryCeItensTransfer.RecordCount));
    While not DmRefresher.QryCeItensTransfer.Eof do
      begin
            DmRefresher.SqlAtualizaItensTransfer.Params[0].AsFloat := DmRefresher.QryCeItensTransferCD_TRANSFER.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[1].AsFloat := DmRefresher.QryCeItensTransferID_PRODUTO.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[2].AsString := DmRefresher.QryCeItensTransferCD_PRODUTO.AsString;
            DmRefresher.SqlAtualizaItensTransfer.Params[3].AsFloat := DmRefresher.QryCeItensTransferCD_CLASSE.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[4].AsFloat := DmRefresher.QryCeItensTransferCD_GRUPO.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[5].AsFloat := DmRefresher.QryCeItensTransferCD_LABORATORIO.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[6].AsString := DmRefresher.QryCeItensTransferDESCRICAO.AsString;
            DmRefresher.SqlAtualizaItensTransfer.Params[7].AsFloat := DmRefresher.QryCeItensTransferQUANTIDADE_SOLICITADA.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[8].AsFloat := DmRefresher.QryCeItensTransferQUANTIDADE_ENVIADA.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[9].AsFloat := DmRefresher.QryCeItensTransferQUANTIDADE_RECEBIDA.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[10].AsFloat := DmRefresher.QryCeItensTransferVALOR.AsFloat;
            DmRefresher.SqlAtualizaItensTransfer.Params[11].AsString := DmRefresher.QryCeItensTransferOBSERVACOES.AsString;
            DmRefresher.SqlAtualizaItensTransfer.Params[12].AsString := DmRefresher.QryCeItensTransferSTATUS.AsString;
            try
              DmRefresher.SqlAtualizaItensTransfer.ExecSql(False);
            except
          on E:Exception do
             GravaLog('Erro na atualização de Itens das Transferencias - ' + E.Message);

            end;

           Gauge1.Progress := DmRefresher.QryCeItensTransfer.RecNo;
           DmRefresher.QryCeItensTransfer.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryCeItensTransfer.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

         DmRefresher.QryCeItensTransfer.Close;
         CancelaTransacao;
   end; 
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarCadernoFaltas;
var i : integer;
begin
  Try
    DmRefresher.QryCeCadernoFaltas.Close;
    DmRefresher.QryCeCadernoFaltas.LoadFromFile(Arquivo);
    DmRefresher.QryCeCadernoFaltas.Open; // virtual
    if DmRefresher.QryCeCadernoFaltas.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeCadernoFaltas.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryCeCadernoFaltas.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Caderno de Faltas: ' + FloatToStr(DmRefresher.QryCeCadernoFaltas.RecordCount));
    While not DmRefresher.QryCeCadernoFaltas.Eof do
      begin
            DmRefresher.SqlAtualizaCadernoFaltas.Params[0].AsFloat := DmRefresher.QryCeCadernoFaltasCD_FILIAL.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[1].AsFloat := DmRefresher.QryCeCadernoFaltasID_PRODUTO.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[2].AsString := DmRefresher.QryCeCadernoFaltasCD_PRODUTO.AsString;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[3].AsFloat := DmRefresher.QryCeCadernoFaltasCD_CLIENTE.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[4].AsString := DmRefresher.QryCeCadernoFaltasCLIENTE.AsString;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[5].AsString := DmRefresher.QryCeCadernoFaltasDESCRICAO.AsString;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[6].AsFloat := DmRefresher.QryCeCadernoFaltasCD_GRUPO.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[7].AsFloat := DmRefresher.QryCeCadernoFaltasCD_LABORATORIO.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[8].AsFloat := DmRefresher.QryCeCadernoFaltasCD_CLASSE.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[9].AsString := DmRefresher.QryCeCadernoFaltasCURVA.AsString;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[10].AsFloat := DmRefresher.QryCeCadernoFaltasCD_VENDEDOR.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[11].AsDate := DmRefresher.QryCeCadernoFaltasDATA.AsDateTime;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[12].AsFloat := DmRefresher.QryCeCadernoFaltasQUANTIDADE.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[13].AsFloat := DmRefresher.QryCeCadernoFaltasID_MOTIVOFALTA.AsFloat;
            DmRefresher.SqlAtualizaCadernoFaltas.Params[14].AsString := DmRefresher.QryCeCadernoFaltasSTATUS.AsString;
            try
              DmRefresher.SqlAtualizaCadernoFaltas.ExecSql(False);
            except
          on E:Exception do
             GravaLog('Erro na atualização de Faltas  - ' + E.Message);

            end;

            Gauge1.Progress := DmRefresher.QryCeCadernoFaltas.RecNo;
            DmRefresher.QryCeCadernoFaltas.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryCeCadernoFaltas.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        DmRefresher.QryCeCadernoFaltas.Close;
        CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarClientes;
var i : integer;
begin
  Try
    DmRefresher.QryCeClientes.LoadFromFile(Arquivo);
    DmRefresher.QryCeClientes.Open; // virtual
    if DmRefresher.QryCeClientes.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeClientes.RecordCount, Arquivo);
    AbreTransacao;

    DmRefresher.QryCeClientes.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Clientes: ' + FloatToStr(DmRefresher.QryCeClientes.RecordCount));
    While not DmRefresher.QryCeClientes.Eof do
      begin
            DmRefresher.SqlAtualizaClientes.Params[0].AsFloat := DmRefresher.QryCeClientesCD_FILIAL.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[1].AsFloat := DmRefresher.QryCeClientesCD_CLIENTE.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[2].AsFloat := DmRefresher.QryCeClientesCD_VENDEDOR.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[3].AsFloat := DmRefresher.QryCeClientesCD_CONVENIO.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[4].AsString := DmRefresher.QryCeClientesNOME.AsString;
            DmRefresher.SqlAtualizaClientes.Params[5].AsString := DmRefresher.QryCeClientesENDERECO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[6].AsString := DmRefresher.QryCeClientesBAIRRO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[7].AsString := DmRefresher.QryCeClientesCIDADE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[8].AsString := DmRefresher.QryCeClientesUF.AsString;
            DmRefresher.SqlAtualizaClientes.Params[9].AsString := DmRefresher.QryCeClientesCEP.AsString;
            DmRefresher.SqlAtualizaClientes.Params[10].AsString := DmRefresher.QryCeClientesCAIXA_POSTAL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[11].AsString := DmRefresher.QryCeClientesFONE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[12].AsString := DmRefresher.QryCeClientesFAX.AsString;
            DmRefresher.SqlAtualizaClientes.Params[13].AsString := DmRefresher.QryCeClientesCONTATO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[14].AsString := DmRefresher.QryCeClientesCNPJ.AsString;
            DmRefresher.SqlAtualizaClientes.Params[15].AsString := DmRefresher.QryCeClientesINSCRICAO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[16].AsString := DmRefresher.QryCeClientesPRACA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[17].AsDate := DmRefresher.QryCeClientesDATA_FICHA.AsDateTime;
            DmRefresher.SqlAtualizaClientes.Params[18].AsString := DmRefresher.QryCeClientesRG.AsString;
            DmRefresher.SqlAtualizaClientes.Params[19].AsString := DmRefresher.QryCeClientesCPF.AsString;
            DmRefresher.SqlAtualizaClientes.Params[20].AsString := DmRefresher.QryCeClientesTITULO_ELEITO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[21].AsDate := DmRefresher.QryCeClientesDT_NASCIMENTO.AsDateTime;
            DmRefresher.SqlAtualizaClientes.Params[22].AsString := DmRefresher.QryCeClientesSEXO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[23].AsString := DmRefresher.QryCeClientesESTADO_CIVIL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[24].AsString := DmRefresher.QryCeClientesNATURALIDADE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[25].AsString := DmRefresher.QryCeClientesFILIACAO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[26].AsFloat := DmRefresher.QryCeClientesNUMERO_DEPENDENTES.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[27].AsString := DmRefresher.QryCeClientesCONJUGE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[28].AsString := DmRefresher.QryCeClientesDT_NASC_CONJUGE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[29].AsString := DmRefresher.QryCeClientesALUGUEL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[30].AsFloat := DmRefresher.QryCeClientesVL_ALUGUEL.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[31].AsString := DmRefresher.QryCeClientesTEMPO_RESIDENCIA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[32].AsString := DmRefresher.QryCeClientesEMPRESA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[33].AsString := DmRefresher.QryCeClientesFONE_COMERCIAL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[34].AsString := DmRefresher.QryCeClientesDT_ADMISSAO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[35].AsString := DmRefresher.QryCeClientesCEP_COMERCIAL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[36].AsString := DmRefresher.QryCeClientesCIDADE_COMERCIAL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[37].AsString := DmRefresher.QryCeClientesUF_COMERCIAL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[38].AsString := DmRefresher.QryCeClientesFUNCAO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[39].AsString := DmRefresher.QryCeClientesEMPRESA_ANTERIOR.AsString;
            DmRefresher.SqlAtualizaClientes.Params[40].AsString := DmRefresher.QryCeClientesTEMPO_SERVICO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[41].AsString := DmRefresher.QryCeClientesREFERENCIA_COMERCIAL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[42].AsString := DmRefresher.QryCeClientesREFERENCIA_BANCARIA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[43].AsString := DmRefresher.QryCeClientesCONSULTA_SPC.AsString;
            DmRefresher.SqlAtualizaClientes.Params[44].AsString := DmRefresher.QryCeClientesOBSERVACAO_SPC.AsString;
            DmRefresher.SqlAtualizaClientes.Params[45].AsString := DmRefresher.QryCeClientesOBSERVACAO_GERAL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[46].AsString := DmRefresher.QryCeClientesENDERECO_COBRANCA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[47].AsString := DmRefresher.QryCeClientesBAIRRO_COBRANCA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[48].AsString := DmRefresher.QryCeClientesCIDADE_COBRANCA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[49].AsString := DmRefresher.QryCeClientesUF_COBRANCA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[50].AsString := DmRefresher.QryCeClientesCEP_COBRANCA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[51].AsString := DmRefresher.QryCeClientesICMS_IPI.AsString;
            DmRefresher.SqlAtualizaClientes.Params[52].AsString := DmRefresher.QryCeClientesNOME_MAE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[53].AsFloat := DmRefresher.QryCeClientesMES_NASCIMENTO.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[54].AsFloat := DmRefresher.QryCeClientesRENDA.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[55].AsFloat := DmRefresher.QryCeClientesLIMITE_PERCENTUAL.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[56].AsFloat := DmRefresher.QryCeClientesLIMITE_CREDITO.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[57].AsString := DmRefresher.QryCeClientesEMAIL.AsString;
            DmRefresher.SqlAtualizaClientes.Params[58].AsString := DmRefresher.QryCeClientesHOMEPAGE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[59].AsString := DmRefresher.QryCeClientesMATRICULA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[60].AsFloat := DmRefresher.QryCeClientesSALDO.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[61].AsFloat := DmRefresher.QryCeClientesDT_VENCIMENTO.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[62].AsFloat := DmRefresher.QryCeClientesDESCONTO.AsFloat;
            DmRefresher.SqlAtualizaClientes.Params[63].ASDate := DmRefresher.QryCeClientesDT_ULTIMA_COMPRA.AsDateTime;
            DmRefresher.SqlAtualizaClientes.Params[64].AsString := DmRefresher.QryCeClientesSTATUS.AsString;
            DmRefresher.SqlAtualizaClientes.Params[65].AsString := DmRefresher.QryCeClientesREFERENCIA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[66].AsDate := DmRefresher.QryCeClientesDT_ALTERACAO.AsDateTime;
            DmRefresher.SqlAtualizaClientes.Params[67].AsString := DmRefresher.QryCeClientesCOMPRAOUTRALOJA.AsString;
            DmRefresher.SqlAtualizaClientes.Params[68].AsString := DmRefresher.QryCeClientesCARTAOFIDELIDADE.AsString;
            DmRefresher.SqlAtualizaClientes.Params[69].AsString := DmRefresher.QryCeClientesENVIADO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[70].AsString := DmRefresher.QryCeClientesNUMERO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[71].AsString := DmRefresher.QryCeClientesCOMPLEMENTO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[72].AsString := DmRefresher.QryCeClientesCD_MUNICIPIO.AsString;
            DmRefresher.SqlAtualizaClientes.Params[73].AsString := DmRefresher.QryCeClientesCD_PAIS.AsString;
            DmRefresher.SqlAtualizaClientes.Params[74].AsFloat := DmRefresher.QryCeClientesID_PERFIL_CLIENTE.AsFloat;
            try
              DmRefresher.SqlAtualizaClientes.ExecSQL(False);
            except
          on E:Exception do
             GravaLog('Erro na atualização de Clientes - ' + E.Message);

            end;

           Gauge1.Progress := DmRefresher.QryCeClientes.RecNo;
           DmRefresher.QryCeClientes.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryCeClientes.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryCeClientes.Close;
    CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarLimiteSaldoClientes;
var i : integer;
begin
  Try
    DmRefresher.QryLimiteSaldoClientes.LoadFromFile(Arquivo);
    DmRefresher.QryLimiteSaldoClientes.Open; // virtual
    if DmRefresher.QryLimiteSaldoClientes.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryLimiteSaldoClientes.RecordCount, Arquivo);

    DmRefresher.QryLimiteSaldoClientes.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Limites de Saldo de Clientes: ' + FloatToStr(DmRefresher.QryLimiteSaldoClientes.RecordCount));
    While not DmRefresher.QryLimiteSaldoClientes.Eof do
      begin
           AbreTransacao;
           DmRefresher.CdsLimiteSaldoClientes.Close;
           DmRefresher.CdsLimiteSaldoClientes.Params[0].AsFloat := DmRefresher.QryLimiteSaldoClientesCD_CLIENTE.AsFloat;
           DmRefresher.CdsLimiteSaldoClientes.Open;
           if DmRefresher.CdsLimiteSaldoClientes.RecordCount > 0 then
            begin
              DmRefresher.CdsLimiteSaldoClientes.Edit;
              for i := 0 to DmRefresher.CdsLimiteSaldoClientes.FieldCount - 1 do
                 DmRefresher.CdsLimiteSaldoClientes.Fields[i].Value := DmRefresher.QryLimiteSaldoClientes.Fields[i].Value;
              DmRefresher.CdsLimiteSaldoClientes.ApplyUpdates(0);
              ConfirmaTransacao;
            end;

           Gauge1.Progress := DmRefresher.QryLimiteSaldoClientes.RecNo;

           DmRefresher.QryLimiteSaldoClientes.Next;
      end;
    DmRefresher.QryLimiteSaldoClientes.Close;
    DmRefresher.CdsLimiteSaldoClientes.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryLimiteSaldoClientes.Close;
    DmRefresher.CdsLimiteSaldoClientes.Close;
    CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarUsuarios;
var i : integer;
begin
  try
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 INACTIVE';
    AbreTransacao;
    DmRefresher.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  except
    CancelaTransacao;
  end;

  Try
    DmRefresher.QryUsuarios.LoadFromFile(Arquivo);
    DmRefresher.QryUsuarios.Open; // virtual
    if DmRefresher.QryUsuarios.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryUsuarios.RecordCount, Arquivo);

    DmRefresher.QryUsuarios.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Usuarios: ' + FloatToStr(DmRefresher.QryUsuarios.RecordCount));
    While not DmRefresher.QryUsuarios.Eof do
      begin
           AbreTransacao;
           DmRefresher.CdsUsuarios.Close;
           DmRefresher.CdsUsuarios.Params[0].AsFloat := DmRefresher.QryUsuariosCD_USUARIO.AsFloat;
           DmRefresher.CdsUsuarios.Open;
           if DmRefresher.CdsUsuarios.RecordCount = 0 then
              begin
                Gauge1.Progress := DmRefresher.QryUsuarios.RecNo;
                DmRefresher.QryUsuarios.Next;
                Continue;
              end
           else
              DmRefresher.CdsUsuarios.Edit;
           for i := 0 to DmRefresher.CdsUsuarios.FieldCount - 1 do
               begin
                if (DmRefresher.CdsUsuarios.Fields[i].FieldName = 'SENHA') and (DmRefresher.QryUsuarios.Fields[i].Value = 'FARMASOFT') then
                  Continue
                else
                  DmRefresher.CdsUsuarios.Fields[i].Value := DmRefresher.QryUsuarios.Fields[i].Value;
               end;
           DmRefresher.CdsUsuarios.ApplyUpdates(0);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.QryUsuarios.RecNo;

           DmRefresher.QryUsuarios.Next;
      end;
    DmRefresher.QryUsuarios.Close;
    DmRefresher.CdsUsuarios.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        try
          DmRefresher.Sql1.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
          AbreTransacao;
          DmRefresher.Sql1.ExecSQL(True);
          ConfirmaTransacao;
        except
          CancelaTransacao;
        end;

    DmRefresher.QryUsuarios.Close;
    DmRefresher.CdsUsuarios.Close;
    CancelaTransacao;
   end;
  End;

  try
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER USUARIOS_BIU0 ACTIVE';
    AbreTransacao;
    DmRefresher.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  except
    CancelaTransacao;
  end;

end;

procedure TFrmPrincipalRefresher.ProcessarComprasDeletadas;
begin
  DmRefresher.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_COMPRAS INACTIVE';
  Try
    AbreTransacao;
    DmRefresher.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
  End;

  Try
    DmRefresher.CdsComprasDeletadas.LoadFromFile(Arquivo);

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.CdsComprasDeletadas.RecordCount, Arquivo);

    DmRefresher.CdsComprasDeletadas.Open; // virtual
    if DmRefresher.CdsComprasDeletadas.RecordCount = 0 then
       Exit;
    DmRefresher.CdsComprasDeletadas.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Compras Deletadas: ' + FloatToStr(DmRefresher.CdsComprasDeletadas.RecordCount));
    While not DmRefresher.CdsComprasDeletadas.Eof do
      begin
           AbreTransacao;
           DmRefresher.SqlComprasDeletadas.CommandText := 'DELETE FROM ITENS_COMPRA WHERE CD_COMPRAS = ' + DmRefresher.CdsComprasDeletadas.Fields[0].AsString;
           DmRefresher.SqlComprasDeletadas.ExecSQL(True);
           DmRefresher.SqlComprasDeletadas.CommandText := 'DELETE FROM COMPRAS WHERE CD_COMPRAS = ' + DmRefresher.CdsComprasDeletadas.Fields[0].AsString;
           DmRefresher.SqlComprasDeletadas.ExecSQL(True);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.CdsComprasDeletadas.RecNo;

           DmRefresher.CdsComprasDeletadas.Next;
      end;
    DmRefresher.CdsComprasDeletadas.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.CdsComprasDeletadas.Close;
    CancelaTransacao;
   end;
  End;

  DmRefresher.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';
  Try
    AbreTransacao;
    DmRefresher.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarContasPagarDeletadas;
begin
  DmRefresher.Sql1.CommandText := 'ALTER TRIGGER CONTAS_PAGAR_BD0 INACTIVE';
  Try
    AbreTransacao;
    DmRefresher.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
  End;

  Try
    DmRefresher.CdsComprasDeletadas.LoadFromFile(Arquivo);
    DmRefresher.CdsComprasDeletadas.Open; // virtual
    if DmRefresher.CdsComprasDeletadas.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.CdsComprasDeletadas.RecordCount, Arquivo);

    DmRefresher.CdsComprasDeletadas.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Contas Pagar Deletadas: ' + FloatToStr(DmRefresher.CdsComprasDeletadas.RecordCount));
    While not DmRefresher.CdsComprasDeletadas.Eof do
      begin
           AbreTransacao;
           DmRefresher.SqlComprasDeletadas.CommandText := 'DELETE FROM CONTAS_PAGAR WHERE CD_CONTAS_PAGAR = ' + DmRefresher.CdsComprasDeletadas.Fields[0].AsString;
           DmRefresher.SqlComprasDeletadas.ExecSQL(True);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.CdsComprasDeletadas.RecNo;

           DmRefresher.CdsComprasDeletadas.Next;
      end;
    DmRefresher.CdsComprasDeletadas.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.CdsComprasDeletadas.Close;
    CancelaTransacao;
   end; 
  End;

  DmRefresher.Sql1.CommandText := 'ALTER TRIGGER CONTAS_PAGAR_BD0 ACTIVE';
  Try
    AbreTransacao;
    DmRefresher.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarClientesDeletados;
begin
  Try
    DmRefresher.CdsClientesDeletados.LoadFromFile(Arquivo);
    DmRefresher.CdsClientesDeletados.Open; // virtual
    if DmRefresher.CdsClientesDeletados.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.CdsClientesDeletados.RecordCount, Arquivo);

    DmRefresher.CdsClientesDeletados.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Clientes Deletados: ' + FloatToStr(DmRefresher.CdsClientesDeletados.RecordCount));
    While not DmRefresher.CdsClientesDeletados.Eof do
      begin
           AbreTransacao;
           DmRefresher.SqlClientesDeletados.CommandText := 'DELETE FROM CLIENTES WHERE CD_CLIENTE = ' + DmRefresher.CdsClientesDeletados.Fields[0].AsString;
           DmRefresher.SqlClientesDeletados.ExecSQL(True);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.CdsClientesDeletados.RecNo;

           DmRefresher.CdsClientesDeletados.Next;
      end;
    DmRefresher.CdsClientesDeletados.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.CdsClientesDeletados.Close;
    CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarContasReceberDeletados;
begin
  Try
    DmRefresher.CdsContasReceberDeletados.LoadFromFile(Arquivo);
    DmRefresher.CdsContasReceberDeletados.Open; // virtual
    if DmRefresher.CdsContasReceberDeletados.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.CdsSintegraNFEntradaDeletados.RecordCount, Arquivo);

    DmRefresher.CdsContasReceberDeletados.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Contas Receber Deletadas: ' + FloatToStr(DmRefresher.CdsContasReceberDeletados.RecordCount));
    While not DmRefresher.CdsContasReceberDeletados.Eof do
      begin
           AbreTransacao;
           DmRefresher.SqlContasReceberDeletados.CommandText := 'DELETE FROM CONTAS_RECEBER WHERE CD_CONTAS_RECEBER = ' + DmRefresher.CdsContasReceberDeletados.Fields[0].AsString + ' AND CD_FILIAL = ' + DmRefresher.CdsContasReceberDeletados.Fields[1].AsString;
           DmRefresher.SqlContasReceberDeletados.ExecSQL(True);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.CdsSintegraNFEntradaDeletados.RecNo;

           DmRefresher.CdsContasReceberDeletados.Next;
      end;
    DmRefresher.CdsContasReceberDeletados.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.CdsContasReceberDeletados.Close;
    CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarSintegraNFEntradaDeletados;
begin
  Try
    DmRefresher.CdsSintegraNFEntradaDeletados.LoadFromFile(Arquivo);
    DmRefresher.CdsSintegraNFEntradaDeletados.Open; // virtual
    if DmRefresher.CdsSintegraNFEntradaDeletados.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.CdsSintegraNFEntradaDeletados.RecordCount, Arquivo);

    DmRefresher.CdsSintegraNFEntradaDeletados.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Sintegra_Nf_Entrada Deletados: ' + FloatToStr(DmRefresher.CdsSintegraNFEntradaDeletados.RecordCount));
    While not DmRefresher.CdsSintegraNFEntradaDeletados.Eof do
      begin
           AbreTransacao;
           DmRefresher.SqlSintegraNFEntradaDeletados.CommandText := 'DELETE FROM SINTEGRA_NF_ENTRADA_ITENS WHERE COD_NF_ENTRADA IN ' +
                                                        '(SELECT COD_NF_ENTRADA FROM SINTEGRA_NF_ENTRADA WHERE NUM_NF = ' + QuotedStr(DmRefresher.CdsSintegraNFEntradaDeletados.Fields[0].AsString) +
                                                        ' AND CNPJ_FORNECEDOR = ' + QuotedStr(DmRefresher.CdsSintegraNFEntradaDeletados.Fields[1].AsString) + ')';
           DmRefresher.SqlSintegraNFEntradaDeletados.ExecSQL(True);

           DmRefresher.SqlSintegraNFEntradaDeletados.CommandText := 'DELETE FROM SINTEGRA_NF_ENTRADA WHERE NUM_NF = ' + QuotedStr(DmRefresher.CdsSintegraNFEntradaDeletados.Fields[0].AsString) +
                                                        ' AND CNPJ_FORNECEDOR = ' + QuotedStr(DmRefresher.CdsSintegraNFEntradaDeletados.Fields[1].AsString);
           DmRefresher.SqlSintegraNFEntradaDeletados.ExecSQL(True);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.CdsSintegraNFEntradaDeletados.RecNo;

           DmRefresher.CdsSintegraNFEntradaDeletados.Next;
      end;
    DmRefresher.CdsSintegraNFEntradaDeletados.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.CdsSintegraNFEntradaDeletados.Close;
    CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarCRM;
var i : integer;
begin
  Try
    DmRefresher.QryCeCRM.LoadFromFile(Arquivo);
    DmRefresher.QryCeCRM.Open; // virtual
    if DmRefresher.QryCeCRM.RecordCount = 0 then
       Exit;
    DmRefresher.CdsCRM.Close;
    DmRefresher.CdsCRM.Open;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeCRM.RecordCount, Arquivo);

    DmRefresher.QryCeCRM.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - CRM: ' + FloatToStr(DmRefresher.QryCeCRM.RecordCount));
    While not DmRefresher.QryCeCRM.Eof do
     begin
         AbreTransacao;
         DmRefresher.CdsCRM.Append;
         for i := 0 to DmRefresher.CdsCRM.FieldCount - 1 do
             DmRefresher.CdsCRM.Fields[i].Value := DmRefresher.QryCeCRM.Fields[i].Value;
         DmRefresher.CdsCRM.ApplyUpdates(0);
         ConfirmaTransacao;

         Gauge1.Progress := DmRefresher.QryCeCRM.RecNo;

         DmRefresher.QryCeCRM.Next;
     end;
    DmRefresher.QryCeCRM.Close;
    DmRefresher.CdsCRM.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryCeCRM.Close;
    DmRefresher.CdsCRM.Close;
    CancelaTransacao;
   end;
  end;
end;



procedure TFrmPrincipalRefresher.ProcessarControleValores;
begin
  Try
    DmRefresher.QryCeInterligacao.LoadFromFile(Arquivo);
    DmRefresher.QryCeInterligacao.Open; // virtual
    if DmRefresher.QryCeInterligacao.RecordCount = 0 then
       Exit;
    DmRefresher.CdsInterligacao.Close;
    DmRefresher.CdsInterligacao.Open;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryCeInterligacao.RecordCount, Arquivo);

    DmRefresher.QryCeInterligacao.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Controle de Interligacao: ' + FloatToStr(DmRefresher.QryCeInterligacao.RecordCount));
    While not DmRefresher.QryCeInterligacao.Eof do
     begin
         AbreTransacao;
         DmRefresher.CdsInterligacao.Append;
         DmRefresher.CdsInterligacaoID_LOG.AsFloat := RetornaID('ID_LOG');
         DmRefresher.CdsInterligacaoCD_FILIAL.AsFloat := Filial;
         DmRefresher.CdsInterligacaoDATA.AsDateTime := Date;
         DmRefresher.CdsInterligacaoHORA.AsDateTime := Time;
         DmRefresher.CdsInterligacaoCHAVE_ACESSO.AsString := '';
         DmRefresher.CdsInterligacaoIP.AsString := '';
         DmRefresher.CdsInterligacaoNUMERO_ITENS.AsFloat := DmRefresher.QryCeInterligacao.FieldByName('N_ITENS').AsFloat;
         DmRefresher.CdsInterligacaoNUMERO_UNIDADES.AsFloat := DmRefresher.QryCeInterligacao.FieldByName('N_UNIDADES').AsFloat;
         DmRefresher.CdsInterligacaoTOTAL_CUSTO.AsFloat := DmRefresher.QryCeInterligacao.FieldByName('T_CUSTO').AsFloat;
         DmRefresher.CdsInterligacaoTOTAL_VENDA.AsFloat := DmRefresher.QryCeInterligacao.FieldByName('T_VENDA').AsFloat;
         DmRefresher.CdsInterligacao.ApplyUpdates(0);
         ConfirmaTransacao;

         Gauge1.Progress := DmRefresher.QryCeInterligacao.RecNo;

         DmRefresher.QryCeInterligacao.Next;
     end;
    DmRefresher.QryCeInterligacao.Close;
    DmRefresher.CdsInterligacao.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryCeInterligacao.Close;
    DmRefresher.CdsInterligacao.Close;
    CancelaTransacao;
   end;
  end;
end;




procedure TFrmPrincipalRefresher.ProcessarCodigoBarras;
begin
  Try
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
    AbreTransacao;
    DmRefresher.Sql1.ExecSQL(True);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
  End;

  Try
    DmRefresher.CdsCodigoBarras.LoadFromFile(Arquivo);
    DmRefresher.CdsCodigoBarras.Open; // virtual
    if DmRefresher.CdsCodigoBarras.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.CdsCodigoBarras.RecordCount, Arquivo);

    DmRefresher.CdsCodigoBarras.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Codigos de Barra: ' + FloatToStr(DmRefresher.CdsCodigoBarras.RecordCount));
    AbreTransacao;
    While not DmRefresher.CdsCodigoBarras.Eof do
     begin
       DmRefresher.Sql1.CommandText := 'UPDATE PRODUTOS SET CODIGO_BARRAS_1 = ' + QuotedStr(DmRefresher.CdsCodigoBarras.FieldByName('CODIGO_BARRAS_1').AsString) +
                           ' WHERE ID_PRODUTO = ' + DmRefresher.CdsCodigoBarras.FieldByName('ID_PRODUTO').AsString;
       DmRefresher.Sql1.ExecSQL(True);

       Gauge1.Progress := DmRefresher.CdsCodigoBarras.RecNo;

       DmRefresher.CdsCodigoBarras.Next;
     end;
    DmRefresher.CdsCodigoBarras.Close;
    ConfirmaTransacao;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.CdsCodigoBarras.Close;
    CancelaTransacao;
   end;
  end;
end;




procedure TFrmPrincipalRefresher.ProcessarBalancos;
var
  i : integer;
begin
  Try
    DmRefresher.QryBalancos.LoadFromFile(Arquivo);
    DmRefresher.QryBalancos.Open; // virtual
    if DmRefresher.QryBalancos.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryBalancos.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryBalancos.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Balancos: ' + FloatToStr(DmRefresher.QryBalancos.RecordCount));
    While not DmRefresher.QryBalancos.Eof do
     begin
        DmRefresher.SqlAtualizaBalanco.Params[0].AsFloat := DmRefresher.QryBalancosID_BALANCO.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[1].AsFloat := DmRefresher.QryBalancosID_MOTIVO.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[2].AsDate := DmRefresher.QryBalancosDATA.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[3].AsTime := DmRefresher.QryBalancosHORA.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[4].AsDate := DmRefresher.QryBalancosDATA_ABERTURA.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[5].AsTime := DmRefresher.QryBalancosHORA_ABERTURA.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[6].AsDate := DmRefresher.QryBalancosDATA_CONTAGEM.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[7].AsTime := DmRefresher.QryBalancosHORA_CONTAGEM.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[8].AsDate := DmRefresher.QryBalancosDATA_CONCLUSAO.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[9].AsTime := DmRefresher.QryBalancosHORA_CONCLUSAO.AsDateTime;
        DmRefresher.SqlAtualizaBalanco.Params[10].AsFloat := DmRefresher.QryBalancosCD_FILIAL.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[11].AsFloat := DmRefresher.QryBalancosID_PRODUTO.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[12].AsString := DmRefresher.QryBalancosCD_PRODUTO.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[13].AsString := DmRefresher.QryBalancosCODIGO_BARRAS_1.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[14].AsString := DmRefresher.QryBalancosCODIGO_BARRAS_2.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[15].AsString := DmRefresher.QryBalancosDESCRICAO.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[16].AsFloat := DmRefresher.QryBalancosCD_GRUPO.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[17].AsString := DmRefresher.QryBalancosGRUPO.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[18].AsFloat := DmRefresher.QryBalancosCD_LABORATORIO.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[19].AsString := DmRefresher.QryBalancosLABORATORIO.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[20].AsFloat := DmRefresher.QryBalancosCD_CLASSE.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[21].AsString := DmRefresher.QryBalancosCLASSE.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[22].AsFloat := DmRefresher.QryBalancosCUSTO_UNITARIO.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[23].AsFloat := DmRefresher.QryBalancosPRECO_VENDA.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[24].AsFloat := DmRefresher.QryBalancosPRECO_VENDA_ANTERIOR.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[25].AsFloat := DmRefresher.QryBalancosESTOQUE.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[26].AsFloat := DmRefresher.QryBalancosESTOQUE_ANTERIOR.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[27].AsString := DmRefresher.QryBalancosSUBSTITUIESTOQUE.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[28].AsString := DmRefresher.QryBalancosSTATUS.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[29].AsString := '2'; //DmRefresher.QryBalancosENVIADO.AsString; // FML - 12.05.2016
        DmRefresher.SqlAtualizaBalanco.Params[30].AsFloat := DmRefresher.QryBalancosCD_SUBGRUPO.AsFloat;
        DmRefresher.SqlAtualizaBalanco.Params[31].AsString := DmRefresher.QryBalancosUSUARIO_ABERTURA.AsString;
        DmRefresher.SqlAtualizaBalanco.Params[32].AsString := DmRefresher.QryBalancosUSUARIO_CONCLUSAO.AsString;
        try
          DmRefresher.SqlAtualizaBalanco.ExecSql(False);
        except
          on E:Exception do
             GravaLog('Erro na atualização de Balanco - ' + E.Message);

        end;

        Gauge1.Progress := DmRefresher.QryBalancos.RecNo;
        DmRefresher.QryBalancos.Next;
     end;
    ConfirmaTransacao;
    DmRefresher.QryBalancos.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QryBalancos.Close;
    CancelaTransacao;
   end;
  end;
end;


procedure TFrmPrincipalRefresher.ProcessarPrecoVendaFilial;
var
  strFilial : String;
  GrupoFilial : String;
begin
  Try
    DmRefresher.QryPrecoVendaFilial.LoadFromFile(Arquivo);
    DmRefresher.QryPrecoVendaFilial.Open; // virtual
    if DmRefresher.QryPrecoVendaFilial.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryPrecoVendaFilial.RecordCount, Arquivo);

    DmRefresher.QryPrecoVendaFilial.First;
    strFilial := FloattoStr(Filial);
    GrupoFilial := '';
    DmRefresher.CdsCadFiliais.Open;
    DmRefresher.CdsCadFiliais.FindKey([Filial]);
    if not (DmRefresher.CdsCadFiliaisCD_GRUPO_FILIAL.IsNull) and (DmRefresher.CdsCadFiliaisCD_GRUPO_FILIAL.AsFloat > 0) then
       GrupoFilial := InttoStr(DmRefresher.CdsCadFiliaisCD_GRUPO_FILIAL.AsInteger);

    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Preco Venda Filial: ' + FloatToStr(DmRefresher.QryPrecoVendaFilial.RecordCount));
    While not DmRefresher.QryPrecoVendaFilial.Eof do
     begin
       AbreTransacao;
       DmRefresher.SQL1.CommandText := 'UPDATE PRODUTOS SET ' +
                                  ' PRECO_VENDA_' + strFilial + ' = ' + StrTran(StrTran(DmRefresher.QryPrecoVendaFilial.FieldByName('PRECO_VENDA').AsString, '.', ''), ',', '.') +
                                  ' , PRECO_PROMOCAO_' + strFilial + ' = ' + StrTran(StrTran(DmRefresher.QryPrecoVendaFilial.FieldByName('PRECO_PROMOCAO').AsString, '.', ''), ',', '.');
       if not (DmRefresher.QryPrecoVendaFilial.FieldByName('DT_VENCIMENTO_PROMOCAO').IsNull) then
          DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_VENCIMENTO_PROMOCAO_' + strFilial + ' = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmRefresher.QryPrecoVendaFilial.FieldByName('DT_VENCIMENTO_PROMOCAO').AsDateTime))
       else
          DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_VENCIMENTO_PROMOCAO_' + strFilial + ' =  NULL';
       if not (DmRefresher.QryPrecoVendaFilial.FieldByName('DT_REAJUSTE').IsNull) then
          DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_REAJUSTE_' + strFilial + ' = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmRefresher.QryPrecoVendaFilial.FieldByName('DT_REAJUSTE').AsDateTime))
       else
          DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_REAJUSTE_' + strFilial + ' =  NULL';
       DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText +
                                  ' ,USUARIO = ' + QuotedStr(DmRefresher.QryPrecoVendaFilial.FieldByName('USUARIO').AsString);
       if GrupoFilial <> '' then
        begin
          DmRefresher.CdsCadFiliais.Filter := 'CD_GRUPO_FILIAL = ' + GrupoFilial + ' AND CD_FILIAL <> ' + strFilial;
          DmRefresher.CdsCadFiliais.Filtered := True;
          if DmRefresher.CdsCadFiliais.RecordCount > 0 then
           begin
             DmRefresher.CdsCadFiliais.First;
             while not DmRefresher.CdsCadFiliais.Eof do
              begin
                DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText +
                                ', PRECO_VENDA_' + InttoStr(DmRefresher.CdsCadFiliaisCD_FILIAL.AsInteger) + ' = ' + StrTran(StrTran(DmRefresher.QryPrecoVendaFilial.FieldByName('PRECO_VENDA').AsString, '.', ''), ',', '.') +
                                ' , PRECO_PROMOCAO_' + InttoStr(DmRefresher.CdsCadFiliaisCD_FILIAL.AsInteger) + ' = ' + StrTran(StrTran(DmRefresher.QryPrecoVendaFilial.FieldByName('PRECO_PROMOCAO').AsString, '.', ''), ',', '.');
                if not (DmRefresher.QryPrecoVendaFilial.FieldByName('DT_VENCIMENTO_PROMOCAO').IsNull) then
                   DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_VENCIMENTO_PROMOCAO_' + InttoStr(DmRefresher.CdsCadFiliaisCD_FILIAL.AsInteger) + ' = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmRefresher.QryPrecoVendaFilial.FieldByName('DT_VENCIMENTO_PROMOCAO').AsDateTime))
                else
                   DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_VENCIMENTO_PROMOCAO_' + InttoStr(DmRefresher.CdsCadFiliaisCD_FILIAL.AsInteger) + ' =  NULL';
                if not (DmRefresher.QryPrecoVendaFilial.FieldByName('DT_REAJUSTE').IsNull) then
                   DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_REAJUSTE_' + InttoStr(DmRefresher.CdsCadFiliaisCD_FILIAL.AsInteger) + ' = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DmRefresher.QryPrecoVendaFilial.FieldByName('DT_REAJUSTE').AsDateTime))
                else
                   DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' , DT_REAJUSTE_' + InttoStr(DmRefresher.CdsCadFiliaisCD_FILIAL.AsInteger) + ' =  NULL';
                DmRefresher.CdsCadFiliais.Next;
              end;
           end;
        end;
       DmRefresher.SQL1.CommandText := DmRefresher.SQL1.CommandText + ' WHERE ID_PRODUTO = ' + DmRefresher.QryPrecoVendaFilial.FieldByName('ID_PRODUTO').AsString;

       try
          DmRefresher.SQL1.ExecSQL(True);
       except
                    on E:Exception do
             GravaLog('Erro na atualização de Preco de Venda - ' + E.Message);

       end;

       ConfirmaTransacao;

       Gauge1.Progress := DmRefresher.QryPrecoVendaFilial.RecNo;
       DmRefresher.QryPrecoVendaFilial.Next;
     end;
    DmRefresher.CdsCadFiliais.Filter := '';
    DmRefresher.CdsCadFiliais.Filtered := False;
    DmRefresher.CdsCadFiliais.Close;
    DmRefresher.QryPrecoVendaFilial.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);

        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.CdsCadFiliais.Filter := '';
    DmRefresher.CdsCadFiliais.Filtered := False;
    DmRefresher.CdsCadFiliais.Close;
    DmRefresher.QryPrecoVendaFilial.Close;
    CancelaTransacao;
   end;
  end;
end;

procedure TFrmPrincipalRefresher.ProcessarProdutosTotais;
var
  strFilial : String;
begin
  exit;
  
  Try
    DmRefresher.QryProdutosTotais.LoadFromFile(Arquivo);
    DmRefresher.QryProdutosTotais.Open; // virtual
    if DmRefresher.QryProdutosTotais.RecordCount = 0 then
       Exit;

    DmRefresher.QryProdutosTotais.First;
    strFilial := FloattoStr(Filial);
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Produtos Totais: ' + FloatToStr(DmRefresher.QryProdutosTotais.RecordCount));

    try
      DmRefresher.SQL1.CommandText := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 INACTIVE';
      AbreTransacao;
      DmRefresher.SQL1.ExecSQL(True);
      ConfirmaTransacao;
    except
      CancelaTransacao;
    end;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryProdutosTotais.RecordCount, Arquivo);
    AbreTransacao;
    While not DmRefresher.QryProdutosTotais.Eof do
     begin
       DmRefresher.SqlAtualizaProdutosTotais.Params[0].AsFloat := DmRefresher.QryProdutosTotais.Fields[0].AsFloat;
       DmRefresher.SqlAtualizaProdutosTotais.Params[1].AsFloat := Filial;
       DmRefresher.SqlAtualizaProdutosTotais.Params[2].AsString := DmRefresher.QryProdutosTotais.Fields[1].FieldName;
       DmRefresher.SqlAtualizaProdutosTotais.Params[3].AsString := DmRefresher.QryProdutosTotais.Fields[2].FieldName;
       DmRefresher.SqlAtualizaProdutosTotais.Params[4].AsString := StrTran(StrTran(DmRefresher.QryProdutosTotais.Fields[1].AsString, '.', ''), ',', '.');
       DmRefresher.SqlAtualizaProdutosTotais.Params[5].AsString := StrTran(StrTran(DmRefresher.QryProdutosTotais.Fields[2].AsString, '.', ''), ',', '.');
       try
         DmRefresher.SqlAtualizaProdutosTotais.ExecSQL(False);
       except
          on E:Exception do
             GravaLog('Erro na atualização de Produtos Totais - ' + E.Message);

       end;

       Gauge1.Progress := DmRefresher.QryProdutosTotais.RecNo;
       DmRefresher.QryProdutosTotais.Next;
     end;
    ConfirmaTransacao;
    DmRefresher.QryProdutosTotais.Close;

    Cd_Evento := 0;
    Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Recalculando Produtos Totais (Refresher)', True, False);
    DmRefresher.Sql1.CommandText := 'EXECUTE PROCEDURE SP_RECALCULA_PRODUTOSTOTAIS';
    AbreTransacao;
    try
      DmRefresher.Sql1.ExecSQL(True);
      Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Recalculando Produtos Totais (Refresher)', False, False);
    except
      Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Recalculando Produtos Totais (Refresher)', False, True);
    end;
    ConfirmaTransacao;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Fim de Processo de Produtos Totais ');

  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;

           try
             DmRefresher.SQL1.CommandText := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 ACTIVE';
             AbreTransacao;
             DmRefresher.SQL1.ExecSQL(True);
             ConfirmaTransacao;
           except
             CancelaTransacao;
           end;
         end;
     end;
  end;

  try
    DmRefresher.SQL1.CommandText := 'ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 ACTIVE';
    AbreTransacao;
    DmRefresher.SQL1.ExecSQL(True);
    ConfirmaTransacao;
  except
    CancelaTransacao;
  end;

  DmRefresher.QryProdutosTotais.Close;
  CancelaTransacao;
end;

procedure TFrmPrincipalRefresher.ProcessarConsistenciaCR;
var i : integer;
begin
  Try
    DmRefresher.CdsConsistenciaCR.LoadFromFile(Arquivo);
    DmRefresher.CdsConsistenciaCR.Open; // virtual
    if DmRefresher.CdsConsistenciaCR.RecordCount = 0 then
       Exit;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Contas Receber Consistencia Recebidas Loja -> Matriz: ' + IntToStr(DmRefresher.CdsConsistenciaCR.RecordCount) );

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.CdsConsistenciaCR.RecordCount, Arquivo);

    DmRefresher.CdsConsistenciaCR.First;
    While not DmRefresher.CdsConsistenciaCR.Eof do
      begin
         AbreTransacao;
         DmRefresher.Sql.CommandText := 'UPDATE CONTAS_RECEBER SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CONTAS_RECEBER = ' + DmRefresher.CdsConsistenciaCR.Fields[0].AsString;
         try
            DmRefresher.Sql.ExecSQL(True);
         except
          on E:Exception do
             GravaLog('Erro na atualização de Consistencia Contas a Receber - ' + E.Message);

         end;

         ConfirmaTransacao;

         Gauge1.Progress := DmRefresher.CdsConsistenciaCR.RecNo;

         DmRefresher.CdsConsistenciaCR.Next;
      end;
    DmRefresher.CdsConsistenciaCR.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;
    DmRefresher.CdsConsistenciaCR.Close;
    CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarPosicaoEstoque;
var
  i : integer;
begin
  Try
    DmRefresher.QryPosicaoEstoque.LoadFromFile(Arquivo);
    DmRefresher.QryPosicaoEstoque.Open; // virtual
    if DmRefresher.QryPosicaoEstoque.RecordCount = 0 then
       Exit;

    try
      DmRefresher.Sql1.CommandText := 'ALTER TRIGGER POSICAOESTOQUEDATA_AI0 INACTIVE';
      AbreTransacao;
      DmRefresher.Sql1.ExecSQL(True);
      ConfirmaTransacao;
    except
      CancelaTransacao;
    end;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryPosicaoEstoque.RecordCount, Arquivo);

    DmRefresher.QryPosicaoEstoque.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Posicao Estoque Data: ' + FloatToStr(DmRefresher.QryPosicaoEstoque.RecordCount));
    While not DmRefresher.QryPosicaoEstoque.Eof do
     begin
       AbreTransacao;
       DmRefresher.CdsPosicaoEstoque.Close;
       DmRefresher.CdsPosicaoEstoque.Params[0].AsFloat := DmRefresher.QryPosicaoEstoque.FieldByName('CD_FILIAL').AsFloat;
       DmRefresher.CdsPosicaoEstoque.Params[1].AsFloat := DmRefresher.QryPosicaoEstoque.FieldByName('ID_PRODUTO').AsFloat;
       DmRefresher.CdsPosicaoEstoque.Params[2].AsDate := DmRefresher.QryPosicaoEstoque.FieldByName('DATA').AsDateTime;
       DmRefresher.CdsPosicaoEstoque.Open;
       ConfirmaTransacao;
       if DmRefresher.CdsPosicaoEstoque.RecordCount = 0 then
        begin
          DmRefresher.CdsPosicaoEstoque.Append;
       end
       else
          DmRefresher.CdsPosicaoEstoque.Edit;
       for i := 0 to DmRefresher.QryPosicaoEstoque.Fields.Count - 1 do
           DmRefresher.CdsPosicaoEstoque.Fields[i].Value := DmRefresher.QryPosicaoEstoque.Fields[i].Value;
       AbreTransacao;
       DmRefresher.CdsPosicaoEstoque.ApplyUpdates(0);
       ConfirmaTransacao;

       Gauge1.Progress := DmRefresher.QryPosicaoEstoque.RecNo;

       DmRefresher.QryPosicaoEstoque.Next;
     end;

    try
      DmRefresher.Sql1.CommandText := 'ALTER TRIGGER POSICAOESTOQUEDATA_AI0 ACTIVE';
      AbreTransacao;
      DmRefresher.Sql1.ExecSQL(True);
      ConfirmaTransacao;
    except
      CancelaTransacao;
    end;

    DmRefresher.QryPosicaoEstoque.Close;
    DmRefresher.CdsPosicaoEstoque.Close;
  Except
    try
      DmRefresher.Sql1.CommandText := 'ALTER TRIGGER POSICAOESTOQUEDATA_AI0 ACTIVE';
      AbreTransacao;
      DmRefresher.Sql1.ExecSQL(True);
      ConfirmaTransacao;
    except
      CancelaTransacao;
    end;

    DmRefresher.QryPosicaoEstoque.Close;
    DmRefresher.CdsPosicaoEstoque.Close;
    CancelaTransacao;
  end;
end;



procedure TFrmPrincipalRefresher.GravaLog(cMensagem: string);
var Log : TextFile;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Logs\LogRefresher' + FormatDateTime('ddmmyyyy',Date) + '.txt') then
   begin
     AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogRefresher' + FormatDateTime('ddmmyyyy',Date) + '.txt');
     Append(Log);
   end
  else
    begin
     AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Logs\LogRefresher' + FormatDateTime('ddmmyyyy',Date) + '.txt');
     Rewrite(Log);
     Writeln(Log, '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Iniciando o Dia ' + FormatDateTime('ddmmyyyy',Date) + ' as ' + FormatDateTime('hh:mm:ss',Time) + ' horas');
    end;
  Writeln(Log, cMensagem);
  CloseFile(Log);
end;



Function TFrmPrincipalRefresher.StrTran( cString, cProcura, cTroca : string ): string;
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

procedure TFrmPrincipalRefresher.Timer2Timer(Sender: TObject);
begin
  //Timer2.Enabled := False;
  //FrmPrincipalRefresher.Hide;
  {Timer1Timer(Sender);
  Timer1.Enabled := True;}
end;

procedure TFrmPrincipalRefresher.Fechar1Click(Sender: TObject);
begin
  Close;
  Application.Terminate;
  Exit;
end;

procedure TFrmPrincipalRefresher.FormDestroy(Sender: TObject);
begin
  DmRefresher.SQLConnection1.Close;
end;


procedure TFrmPrincipalRefresher.AbreTransacao;
begin
 if DmRefresher.SQLConnection1.InTransaction then
  begin
    DmRefresher.SQLConnection1.Rollback(TD);
  end;
 DmRefresher.SQLConnection1.StartTransaction(TD);
end;

procedure TFrmPrincipalRefresher.CancelaTransacao;
begin
 if DmRefresher.SQLConnection1.InTransaction then
  begin
    DmRefresher.SQLConnection1.Rollback(TD);
  end;
end;

procedure TFrmPrincipalRefresher.ConfirmaTransacao;
begin
 if DmRefresher.SQLConnection1.InTransaction then
  begin
    DmRefresher.SQLConnection1.Commit(TD);
  end;
end;


//rotina que vai verificar se o processo de um determinado sistema ainda esta em execucao.
Function VerificaProcesso(Arquivo : string) : Boolean;
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  Looper : Boolean;
  Contador : Integer;
begin
  Contador := 0;
  SnapShot:=CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize:=sizeof(TProcessEntry32);
  Looper := Process32First(SnapShot,pe);
  Result := False;
  while Integer(Looper) <> 0 do
   begin
    if Pos(UpperCase(Arquivo), UpperCase(ExtractFileName(pe.szExeFile))) > 0 then
     begin
        Inc(Contador);
        if Contador >= 1 then
         begin
           Result := True;
           Break;
         end;
     end;
    Looper := Process32Next(SnapShot,pe);
   end;
end;


procedure TFrmPrincipalRefresher.Exibir1Click(Sender: TObject);
begin
   Timer2.Enabled := False;
   FrmPrincipalRefresher.Show;
end;

procedure TFrmPrincipalRefresher.Timer3Timer(Sender: TObject);
begin
exit;
{  try
    DmRefresher.CdsParametros.Close;
    DmRefresher.CdsParametros.Open;
    DmRefresher.CdsLogInterligacao.Close;
    DmRefresher.CdsLogInterligacao.Open;
    DmRefresher.CdsLogInterligacao.First;
    while not DmRefresher.CdsLogInterligacao.Eof do
     begin
       DmRefresher.CdsItensLog.Close;
       DmRefresher.CdsItensLog.Params[0].AsFloat := DmRefresher.CdsLogInterligacaoID_LOG.AsFloat;
       DmRefresher.CdsItensLog.Open;

       DmRefresher.CdsControlador.Close;
       SqlControlador.CommandText := 'SELECT COUNT(ID_PRODUTO) AS N_ITENS, ' +
                                     'SUM(ESTOQUE_' + DmRefresher.CdsItensLogCD_FILIAL.AsString + ') AS N_UNIDADES, ' +
                                     'SUM(CUSTO_UNITARIO_' + DmRefresher.CdsItensLogCD_FILIAL.AsString + ') AS T_CUSTO, ' +
                                     'SUM(PRECO_VENDA_' + DmRefresher.CdsItensLogCD_FILIAL.AsString + ') AS T_VENDA ' +
                                     'FROM PRODUTOS';
       DmRefresher.CdsControlador.Open;

       (HTTPRIO1 as IDm).LogInterligacao(DmRefresher.CdsParametrosCODIGOUSUARIO.AsFloat,
                                         DmRefresher.CdsItensLogCD_FILIAL.AsFloat,
                                         DmRefresher.CdsItensLogDATA.AsString,
                                         DmRefresher.CdsItensLogHORA.AsString,
                                         DmRefresher.CdsItensLogNUMERO_ITENS.AsFloat,
                                         DmRefresher.CdsControladorN_ITENS.AsFloat,
                                         DmRefresher.CdsItensLogNUMERO_UNIDADES.AsFloat,
                                         DmRefresher.CdsControladorN_UNIDADES.AsFloat,
                                         DmRefresher.CdsItensLogTOTAL_CUSTO.AsFloat,
                                         DmRefresher.CdsControladorT_CUSTO.AsFloat,
                                         DmRefresher.CdsItensLogTOTAL_VENDA.AsFloat,
                                         DmRefresher.CdsControladorT_VENDA.AsFloat);
//       (HTTPRIO1 as IDm).LogInterligacao('Flavio');
       DmRefresher.CdsLogInterligacao.Next;
     end;
  except
  end;
  DmRefresher.CdsControlador.Close;
  DmRefresher.CdsItensLog.Close;
  DmRefresher.CdsLogInterligacao.Close;
  DmRefresher.CdsParametros.Close;

//  (HTTPRIO1 as IDm).a('Flavio');}
end;


{  Sintegra  }
procedure TFrmPrincipalRefresher.ProcessarSintegraNotas;
var i : integer;
begin
  Try
    DmRefresher.QrySintegraNF.LoadFromFile(Arquivo);
    DmRefresher.QrySintegraNF.Open; // virtual
    if DmRefresher.QrySintegraNF.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QrySintegraNF.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QrySintegraNF.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Sintegra Notas: ' + FloatToStr(DmRefresher.QrySintegraNF.RecordCount));
    While not DmRefresher.QrySintegraNF.Eof do
      begin
         DmRefresher.SqlAtualizaSintegraNF.Params[0].AsInteger := DmRefresher.QrySintegraNFCOD_NF_ENTRADA.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[1].AsInteger := DmRefresher.QrySintegraNFCD_FILIAL.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[2].AsString := DmRefresher.QrySintegraNFNUM_FORM.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[3].AsString := DmRefresher.QrySintegraNFSERIE_FORM.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[4].AsInteger := DmRefresher.QrySintegraNFNUM_VIA.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[5].AsString := DmRefresher.QrySintegraNFNUM_NF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[6].AsString := DmRefresher.QrySintegraNFSERIE_NF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[7].AsString := DmRefresher.QrySintegraNFSUBSERIE_NF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[8].AsString := DmRefresher.QrySintegraNFMODELO_NF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[9].AsString := DmRefresher.QrySintegraNFSITUACAO_NF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[10].AsString := DmRefresher.QrySintegraNFEMITENTE_NF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[11].AsInteger := DmRefresher.QrySintegraNFNUM_ITENS.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[12].AsInteger := DmRefresher.QrySintegraNFCOD_CLI_FORNECEDOR.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[13].AsInteger := DmRefresher.QrySintegraNFCOD_CLI_DESTINATARIO.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[14].AsInteger := DmRefresher.QrySintegraNFCOD_CLI_TRANSP.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[15].AsDateTime := DmRefresher.QrySintegraNFDATAHORA_EMISSAO.AsDateTime;
         DmRefresher.SqlAtualizaSintegraNF.Params[16].AsDateTime := DmRefresher.QrySintegraNFDATAHORA_SAIDAENTRADA.AsDateTime;
         DmRefresher.SqlAtualizaSintegraNF.Params[17].AsDateTime := DmRefresher.QrySintegraNFDATAHORA_SAIDA.AsDateTime;
         DmRefresher.SqlAtualizaSintegraNF.Params[18].AsDateTime := DmRefresher.QrySintegraNFDATAHORA_RECEBIMENTO.AsDateTime;
         DmRefresher.SqlAtualizaSintegraNF.Params[19].AsString := DmRefresher.QrySintegraNFNATUREZA_OP.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[20].AsString := DmRefresher.QrySintegraNFCFOP.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[21].AsFloat := DmRefresher.QrySintegraNFDESCONTO.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[22].AsFloat := DmRefresher.QrySintegraNFVALOR_TOTALPRODUTO.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[23].AsFloat := DmRefresher.QrySintegraNFVALOR_TOTALNF.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[24].AsFloat := DmRefresher.QrySintegraNFALIQUOTA_ICMS.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[25].AsFloat := DmRefresher.QrySintegraNFBASE_ICMS.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[26].AsFloat := DmRefresher.QrySintegraNFVALOR_FRETE.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[27].AsFloat := DmRefresher.QrySintegraNFVALOR_ICMS.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[28].AsFloat := DmRefresher.QrySintegraNFVALOR_SEGURO.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[29].AsFloat := DmRefresher.QrySintegraNFBASE_ICMS_SUBST.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[30].AsFloat := DmRefresher.QrySintegraNFOUTRAS_DESPESAS.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[31].AsFloat := DmRefresher.QrySintegraNFVALOR_ICMS_SUBST.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[32].AsFloat := DmRefresher.QrySintegraNFVALOR_IPI.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[33].AsFloat := DmRefresher.QrySintegraNFVALOR_ISENTO_IPI.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[34].AsFloat := DmRefresher.QrySintegraNFVALOR_ISENTO_ICMS.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[35].AsFloat := DmRefresher.QrySintegraNFICMS_RETIDO.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[36].AsString := DmRefresher.QrySintegraNFFAT_01.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[37].AsSQLTimeStamp := DmRefresher.QrySintegraNFVENCIMENTO_01.AsSQLTimeStamp;
         DmRefresher.SqlAtualizaSintegraNF.Params[38].AsFloat := DmRefresher.QrySintegraNFVALOR_01.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[39].AsString := DmRefresher.QrySintegraNFFAT_02.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[40].AsSQLTimeStamp := DmRefresher.QrySintegraNFVENCIMENTO_02.AsSQLTimeStamp;
         DmRefresher.SqlAtualizaSintegraNF.Params[41].AsFloat := DmRefresher.QrySintegraNFVALOR_02.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[42].AsString := DmRefresher.QrySintegraNFFAT_03.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[43].AsSQLTimeStamp := DmRefresher.QrySintegraNFVENCIMENTO_03.AsSQLTimeStamp;
         DmRefresher.SqlAtualizaSintegraNF.Params[44].AsFloat := DmRefresher.QrySintegraNFVALOR_03.AsFloat;
         DmRefresher.SqlAtualizaSintegraNF.Params[45].AsString := DmRefresher.QrySintegraNFTRANSP_NOME.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[46].AsString := DmRefresher.QrySintegraNFTRANSP_FRETE_CONTA.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[47].AsString := DmRefresher.QrySintegraNFTRANSP_PLACA_VEICULO.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[48].AsString := DmRefresher.QrySintegraNFTRANSP_UF_VEICULO.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[49].AsString := DmRefresher.QrySintegraNFTRANSP_CNPJ_CPF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[50].AsString := DmRefresher.QrySintegraNFTRANSP_ENDER.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[51].AsString := DmRefresher.QrySintegraNFTRANSP_MUNICIPIO.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[52].AsString := DmRefresher.QrySintegraNFTRANSP_UF.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[53].AsString := DmRefresher.QrySintegraNFTRANSP_IE.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[54].AsInteger := DmRefresher.QrySintegraNFTRANSP_QNT.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[55].AsString := DmRefresher.QrySintegraNFTRANSP_ESPECIE.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[56].AsString := DmRefresher.QrySintegraNFTRANSP_MARCA.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[57].AsInteger := DmRefresher.QrySintegraNFTRANSP_NRO.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[58].AsString := DmRefresher.QrySintegraNFTRANSP_PESO_B.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[59].AsString := DmRefresher.QrySintegraNFTRANSP_PESO_L.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[60].AsString := DmRefresher.QrySintegraNFDADOS_ADICIONAIS.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[61].AsSQLTimeStamp := DmRefresher.QrySintegraNFDATAHORA.AsSQLTimeStamp;
         DmRefresher.SqlAtualizaSintegraNF.Params[62].AsInteger := DmRefresher.QrySintegraNFENABLED.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[63].AsSQLTimeStamp := DmRefresher.QrySintegraNFULTATUAL.AsSQLTimeStamp;
         DmRefresher.SqlAtualizaSintegraNF.Params[64].AsInteger := DmRefresher.QrySintegraNFULTATUALCODSETOR.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[65].AsInteger := DmRefresher.QrySintegraNFULTATUALCODSETORUSER.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[66].AsString := DmRefresher.QrySintegraNFNOME_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[67].AsString := DmRefresher.QrySintegraNFENDERECO_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[68].AsString := DmRefresher.QrySintegraNFBAIRRO_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[69].AsString := DmRefresher.QrySintegraNFCIDADE_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[70].AsString := DmRefresher.QrySintegraNFFONE_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[71].AsString := DmRefresher.QrySintegraNFCEP_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[72].AsString := DmRefresher.QrySintegraNFCNPJ_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[73].AsString := DmRefresher.QrySintegraNFIE_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[74].AsString := DmRefresher.QrySintegraNFUF_FORNECEDOR.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[75].AsString := DmRefresher.QrySintegraNFBRANCOS.AsString;
         DmRefresher.SqlAtualizaSintegraNF.Params[76].AsInteger := DmRefresher.QrySintegraNFFISCAL.AsInteger;
         DmRefresher.SqlAtualizaSintegraNF.Params[77].AsString := DmRefresher.QrySintegraNFENVIADO.AsString;
         try
          DmRefresher.SqlAtualizaSintegraNF.ExecSql(False);
         except
          on E:Exception do
             GravaLog('Erro na atualização de Sintegra NF - ' + E.Message);

         end;

         Gauge1.Progress := DmRefresher.QrySintegraNF.RecNo;
         DmRefresher.QrySintegraNF.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QrySintegraNF.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QrySintegraNF.Close;
    CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarSintegraNotasItens;
var i : integer;
begin
  Try
    DmRefresher.QrySintegraItensNF.LoadFromFile(Arquivo);
    DmRefresher.QrySintegraItensNF.Open; // virtual
    if DmRefresher.QrySintegraItensNF.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QrySintegraItensNF.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QrySintegraItensNF.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Sintegra Itens de NF: ' + FloatToStr(DmRefresher.QrySintegraItensNF.RecordCount));
    While not DmRefresher.QrySintegraItensNF.Eof do
      begin
           DmRefresher.SqlAtualizaSintegraNFItens.Params[0].AsInteger := DmRefresher.QrySintegraItensNFCOD_NF_ENTRADA_ITENS.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[1].AsInteger := DmRefresher.QrySintegraItensNFCD_FILIAL.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[2].AsInteger := DmRefresher.QrySintegraItensNFCOD_NF_ENTRADA.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[3].AsInteger := DmRefresher.QrySintegraItensNFCOD_PRODUTOS.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[4].AsString := DmRefresher.QrySintegraItensNFREF_PRODUTOS.AsString;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[5].AsInteger := DmRefresher.QrySintegraItensNFNUM_ITEM.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[6].AsString := DmRefresher.QrySintegraItensNFCL_FIS.AsString;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[7].AsString := DmRefresher.QrySintegraItensNFS_TRIB.AsString;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[8].AsString := DmRefresher.QrySintegraItensNFPRODUTO.AsString;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[9].AsInteger := DmRefresher.QrySintegraItensNFCOD_GRUPOP.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[10].AsInteger := DmRefresher.QrySintegraItensNFCOD_SUBGRUPOP.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[11].AsSQLTimeStamp := DmRefresher.QrySintegraItensNFDATAHORA.AsSQLTimeStamp;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[12].AsFloat := DmRefresher.QrySintegraItensNFQUANTIDADE.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[13].AsFloat := DmRefresher.QrySintegraItensNFPRC_CUSTO.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[14].AsFloat := DmRefresher.QrySintegraItensNFVALOR_DESCONTO.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[15].AsFloat := DmRefresher.QrySintegraItensNFVALOR_IPI.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[16].AsFloat := DmRefresher.QrySintegraItensNFSUBTOTAL.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[17].AsFloat := DmRefresher.QrySintegraItensNFBASE_ICMS.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[18].AsFloat := DmRefresher.QrySintegraItensNFBASE_ICMS_SUBST.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[19].AsFloat := DmRefresher.QrySintegraItensNFVALOR_ICMS.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[20].AsInteger := DmRefresher.QrySintegraItensNFENABLE_NUMSERIE.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[21].AsString := DmRefresher.QrySintegraItensNFOBS.AsString;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[22].AsInteger := DmRefresher.QrySintegraItensNFENABLED.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[23].AsSQLTimeStamp := DmRefresher.QrySintegraItensNFULTATUAL.AsSQLTimeStamp;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[24].AsInteger := DmRefresher.QrySintegraItensNFULTATUALCODSETOR.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[25].AsInteger := DmRefresher.QrySintegraItensNFULTATUALCODSETORUSER.AsInteger;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[26].AsString := DmRefresher.QrySintegraItensNFAPR_UND.AsString;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[27].AsFloat := DmRefresher.QrySintegraItensNFPERC_DESCONTO.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[28].AsFloat := DmRefresher.QrySintegraItensNFALIQUOTA_IPI.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[29].AsFloat := DmRefresher.QrySintegraItensNFALIQUOTA_ICMS.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[30].AsFloat := DmRefresher.QrySintegraItensNFREDUCAO_BASE_ICMS.AsFloat;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[31].AsString := DmRefresher.QrySintegraItensNFENVIADO.AsString;
           DmRefresher.SqlAtualizaSintegraNFItens.Params[32].AsString := DmRefresher.QrySintegraItensNFCFOP.AsString;
           try
             DmRefresher.SqlAtualizaSintegraNFItens.ExecSQL(False);
           except
          on E:Exception do
             GravaLog('Erro na atualização de Sintegra NF Itens - ' + E.Message);

           end;

           Gauge1.Progress := DmRefresher.QrySintegraItensNF.RecNo;
           DmRefresher.QrySintegraItensNF.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QrySintegraItensNF.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QrySintegraItensNF.Close;
    CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarSintegraPedidos;
var i : integer;
begin
  Try
    DmRefresher.QrySintegraPedidos.LoadFromFile(Arquivo);
    DmRefresher.QrySintegraPedidos.Open; // virtual
    if DmRefresher.QrySintegraPedidos.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QrySintegraPedidos.RecordCount, Arquivo);

    DmRefresher.QrySintegraPedidos.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Sintegra Pedidos: ' + FloatToStr(DmRefresher.QrySintegraPedidos.RecordCount));
    While not DmRefresher.QrySintegraPedidos.Eof do
      begin
           AbreTransacao;
           DmRefresher.CdsSintegraPedidos.Close;
           DmRefresher.CdsSintegraPedidos.Params[0].AsInteger := DmRefresher.QrySintegraPedidosCD_FILIAL.AsInteger;
           DmRefresher.CdsSintegraPedidos.Params[1].AsInteger := DmRefresher.QrySintegraPedidosCOD_PEDIDOS_ITENS.AsInteger;
           DmRefresher.CdsSintegraPedidos.Open;
           if DmRefresher.CdsSintegraPedidos.RecordCount = 0 then
              DmRefresher.CdsSintegraPedidos.Append
           else
              DmRefresher.CdsSintegraPedidos.Edit;
           for i := 0 to DmRefresher.CdsSintegraPedidos.FieldCount - 1 do
              DmRefresher.CdsSintegraPedidos.Fields[i].Value := DmRefresher.QrySintegraPedidos.Fields[i].Value;
           DmRefresher.CdsSintegraPedidos.Post;
           DmRefresher.CdsSintegraPedidos.ApplyUpdates(0);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.QrySintegraPedidos.RecNo;

           DmRefresher.QrySintegraPedidos.Next;
      end;
    DmRefresher.QrySintegraPedidos.Close;
    DmRefresher.CdsSintegraPedidos.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QrySintegraPedidos.Close;
    DmRefresher.CdsSintegraPedidos.Close;
    CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarSintegraR60;
var i : integer;
begin
  Try
    DmRefresher.QrySintegraR60.LoadFromFile(Arquivo);
    DmRefresher.QrySintegraR60.Open; // virtual
    if DmRefresher.QrySintegraR60.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QrySintegraR60.RecordCount, Arquivo);

    DmRefresher.QrySintegraR60.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Sintegra R60: ' + FloatToStr(DmRefresher.QrySintegraR60.RecordCount));
    While not DmRefresher.QrySintegraR60.Eof do
      begin
           AbreTransacao;
           DmRefresher.CdsSintegraR60.Close;
           DmRefresher.CdsSintegraR60.Params[0].AsInteger := DmRefresher.QrySintegraR60CD_FILIAL.AsInteger;
           DmRefresher.CdsSintegraR60.Params[1].AsInteger := DmRefresher.QrySintegraR60COD_SINTEGRA_R60.AsInteger;
           DmRefresher.CdsSintegraR60.Open;
           if DmRefresher.CdsSintegraR60.RecordCount = 0 then
              DmRefresher.CdsSintegraR60.Append
           else
              DmRefresher.CdsSintegraR60.Edit;
           for i := 0 to DmRefresher.CdsSintegraR60.FieldCount - 1 do
              DmRefresher.CdsSintegraR60.Fields[i].Value := DmRefresher.QrySintegraR60.Fields[i].Value;
           DmRefresher.CdsSintegraR60.Post;
           DmRefresher.CdsSintegraR60.ApplyUpdates(0);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.QrySintegraR60.RecNo;

           DmRefresher.QrySintegraR60.Next;
      end;
    DmRefresher.QrySintegraR60.Close;
    DmRefresher.CdsSintegraR60.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

    DmRefresher.QrySintegraR60.Close;
    DmRefresher.CdsSintegraR60.Close;
    CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarSintegraR60I;
var i : integer;
begin
  Try
    DmRefresher.QrySintegraR60I.LoadFromFile(Arquivo);
    DmRefresher.QrySintegraR60I.Open; // virtual
    if DmRefresher.QrySintegraR60I.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QrySintegraR60I.RecordCount, Arquivo);

    DmRefresher.QrySintegraR60I.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Sintegra R60I: ' + FloatToStr(DmRefresher.QrySintegraR60I.RecordCount));
    While not DmRefresher.QrySintegraR60I.Eof do
      begin
           AbreTransacao;
           DmRefresher.CdsSintegraR60I.Close;
           DmRefresher.CdsSintegraR60I.Params[0].AsInteger := DmRefresher.QrySintegraR60ICD_FILIAL.AsInteger;
           DmRefresher.CdsSintegraR60I.Params[1].AsInteger := DmRefresher.QrySintegraR60ICOD_SINTEGRA_R60I.AsInteger;
           DmRefresher.CdsSintegraR60I.Open;
           if DmRefresher.CdsSintegraR60I.RecordCount = 0 then
              DmRefresher.CdsSintegraR60I.Append
           else
              DmRefresher.CdsSintegraR60I.Edit;
           for i := 0 to DmRefresher.CdsSintegraR60I.FieldCount - 1 do
              DmRefresher.CdsSintegraR60I.Fields[i].Value := DmRefresher.QrySintegraR60I.Fields[i].Value;
           DmRefresher.CdsSintegraR60I.Post;
           DmRefresher.CdsSintegraR60I.ApplyUpdates(0);
           ConfirmaTransacao;

           Gauge1.Progress := DmRefresher.QrySintegraR60I.RecNo;

           DmRefresher.QrySintegraR60I.Next;
      end;
    DmRefresher.QrySintegraR60I.Close;
    DmRefresher.CdsSintegraR60I.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;

        DmRefresher.QrySintegraR60I.Close;
        DmRefresher.CdsSintegraR60I.Close;
        CancelaTransacao;
     end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarProdutosLotes;
var i : integer;
begin
  Try
    DmRefresher.QryProdutosLotes.LoadFromFile(Arquivo);
    DmRefresher.QryProdutosLotes.Open; // virtual
    if DmRefresher.QryProdutosLotes.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryProdutosLotes.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryProdutosLotes.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Produtos Lotes: ' + FloatToStr(DmRefresher.QryProdutosLotes.RecordCount));
    While not DmRefresher.QryProdutosLotes.Eof do
      begin
          DmRefresher.SqlAtualizaProdutosLotes.Params[0].AsFloat := DmRefresher.QryProdutosLotesID_PRODUTO.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotes.Params[1].AsFloat := DmRefresher.QryProdutosLotesCD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotes.Params[2].AsString := DmRefresher.QryProdutosLotesCD_PRODUTO.AsString;
          DmRefresher.SqlAtualizaProdutosLotes.Params[3].AsString := DmRefresher.QryProdutosLotesDESCRICAO.AsString;
          DmRefresher.SqlAtualizaProdutosLotes.Params[4].AsString := DmRefresher.QryProdutosLotesCODIGO_BARRAS_1.AsString;
          DmRefresher.SqlAtualizaProdutosLotes.Params[5].AsString := DmRefresher.QryProdutosLotesCODIGO_BARRAS_2.AsString;
          DmRefresher.SqlAtualizaProdutosLotes.Params[6].AsString := DmRefresher.QryProdutosLotesLOTE.AsString;
          DmRefresher.SqlAtualizaProdutosLotes.Params[7].AsDate := DmRefresher.QryProdutosLotesFABRICACAO.AsDateTime;
          DmRefresher.SqlAtualizaProdutosLotes.Params[8].AsDate := DmRefresher.QryProdutosLotesVALIDADE.AsDateTime;
          DmRefresher.SqlAtualizaProdutosLotes.Params[9].AsFloat := DmRefresher.QryProdutosLotesQUANTIDADE.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotes.Params[10].AsFloat := DmRefresher.QryProdutosLotesID_PRODUTO_LOTE.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotes.Params[11].AsFloat := DmRefresher.QryProdutosLotesQUANTIDADE_ENTRADA.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotes.Params[12].AsString := DmRefresher.QryProdutosLotesENVIADO.AsString;
          try
            DmRefresher.SqlAtualizaProdutosLotes.ExecSQL(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Produtos Lotes - ' + E.Message);

          end;

         Gauge1.Progress := DmRefresher.QryProdutosLotes.RecNo;
         DmRefresher.QryProdutosLotes.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryProdutosLotes.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;
         DmRefresher.QryProdutosLotes.Close;
         CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.ProcessarProdutosLotesST;
var i : integer;
begin
  Try
    DmRefresher.QryProdutosLotesST.LoadFromFile(Arquivo);
    DmRefresher.QryProdutosLotesST.Open; // virtual
    if DmRefresher.QryProdutosLotesST.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryProdutosLotesST.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryProdutosLotesST.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Produtos Lotes ST: ' + FloatToStr(DmRefresher.QryProdutosLotesST.RecordCount));
    While not DmRefresher.QryProdutosLotesST.Eof do
      begin
          DmRefresher.SqlAtualizaProdutosLotesST.Params[0].AsFloat  := DmRefresher.QryProdutosLotesSTID_PRODUTO.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[1].AsFloat  := DmRefresher.QryProdutosLotesSTCD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[2].AsDate   := DmRefresher.QryProdutosLotesSTDATA.AsDateTime;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[3].AsFloat  := DmRefresher.QryProdutosLotesSTCD_DISTRIBUIDOR.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[4].AsString := DmRefresher.QryProdutosLotesSTNOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[5].AsString := DmRefresher.QryProdutosLotesSTSERIE.AsString;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[6].AsString := DmRefresher.QryProdutosLotesSTLOTE.AsString;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[7].AsFloat  := DmRefresher.QryProdutosLotesSTQUANTIDADE.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[8].AsFloat  := DmRefresher.QryProdutosLotesSTQUANTIDADE_ENTRADA.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[9].AsString := DmRefresher.QryProdutosLotesSTMODALIDADE_ST.AsString;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[10].AsFloat := DmRefresher.QryProdutosLotesSTMVA.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[11].AsFloat := DmRefresher.QryProdutosLotesSTPERCENTUALREDUCAO_ST.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[12].AsFloat := DmRefresher.QryProdutosLotesSTBASECALCULO_ST.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[13].AsFloat := DmRefresher.QryProdutosLotesSTALIQUOTA_ST.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[14].AsFloat := DmRefresher.QryProdutosLotesSTVALOR_ST.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[15].AsFloat := DmRefresher.QryProdutosLotesSTBASECALCULO_FCP_ST.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[16].AsFloat := DmRefresher.QryProdutosLotesSTALIQUOTA_FCP_ST.AsFloat;
          DmRefresher.SqlAtualizaProdutosLotesST.Params[17].AsFloat := DmRefresher.QryProdutosLotesSTVALOR_FCP_ST.AsFloat;
          try
            DmRefresher.SqlAtualizaProdutosLotesST.ExecSQL(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Produtos Lotes ST - ' + E.Message);

          end;

         Gauge1.Progress := DmRefresher.QryProdutosLotesST.RecNo;
         DmRefresher.QryProdutosLotesST.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryProdutosLotesST.Close;
  Except
    on E:Exception do
     begin
             GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;
         DmRefresher.QryProdutosLotesST.Close;
         CancelaTransacao;
   end;
  End;
end;

procedure TFrmPrincipalRefresher.ProcessarConferenciaNota;
var i : integer;
begin
  Try
    DmRefresher.QryConferenciaNota.LoadFromFile(Arquivo);
    DmRefresher.QryConferenciaNota.Open; // virtual
    if DmRefresher.QryConferenciaNota.RecordCount = 0 then
       Exit;

    Gauge1.Progress := 0;
    ExibeProgresso(DmRefresher.QryConferenciaNota.RecordCount, Arquivo);

    AbreTransacao;
    DmRefresher.QryConferenciaNota.First;
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Conferencia Nota: ' + FloatToStr(DmRefresher.QryConferenciaNota.RecordCount));
    While not DmRefresher.QryConferenciaNota.Eof do
      begin
          DmRefresher.SqlAtualizaConferenciaNota.Params[0].AsFloat := DmRefresher.QryConferenciaNotaID_CONFERENCIANOTA.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[1].AsFloat := DmRefresher.QryConferenciaNotaCD_COMPRAS.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[2].AsFloat := DmRefresher.QryConferenciaNotaCD_FILIAL.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[3].AsString := DmRefresher.QryConferenciaNotaNOTA_FISCAL.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[4].AsFloat := DmRefresher.QryConferenciaNotaID_PRODUTO.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[5].AsString := DmRefresher.QryConferenciaNotaCD_PRODUTO.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[6].AsString := DmRefresher.QryConferenciaNotaCODIGO_BARRAS_1.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[7].AsString := DmRefresher.QryConferenciaNotaDESCRICAO.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[8].AsFloat := DmRefresher.QryConferenciaNotaCD_CLASSE.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[9].AsFloat := DmRefresher.QryConferenciaNotaCD_GRUPO.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[10].AsFloat := DmRefresher.QryConferenciaNotaCD_LABORATORIO.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[11].AsString := DmRefresher.QryConferenciaNotaCLASSE.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[12].AsString := DmRefresher.QryConferenciaNotaGRUPO.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[13].AsString := DmRefresher.QryConferenciaNotaLABORATORIO.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[14].AsFloat := DmRefresher.QryConferenciaNotaVL_UNITARIO.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[15].AsFloat := DmRefresher.QryConferenciaNotaVL_UNITARIO_NOTA.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[16].AsFloat := DmRefresher.QryConferenciaNotaQUANTIDADE.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[17].AsFloat := DmRefresher.QryConferenciaNotaQUANTIDADE_NOTA.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[18].AsString := DmRefresher.QryConferenciaNotaSTATUS.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[19].AsString := DmRefresher.QryConferenciaNotaSTATUSCONFERENCIA.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[20].AsFloat := DmRefresher.QryConferenciaNotaCD_USUARIO_CONFERENCIA.AsFloat;
          DmRefresher.SqlAtualizaConferenciaNota.Params[21].AsString := DmRefresher.QryConferenciaNotaUSUARIO_CONFERENCIA.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[22].AsString := DmRefresher.QryConferenciaNotaENVIADO.AsString;
          DmRefresher.SqlAtualizaConferenciaNota.Params[23].AsFloat := DmRefresher.QryConferenciaNotaCD_SUBGRUPO.AsFloat;
          try
            DmRefresher.SqlAtualizaConferenciaNota.ExecSQL(False);
          except
          on E:Exception do
             GravaLog('Erro na atualização de Conferencia de Notas - ' + E.Message);

          end;

         Gauge1.Progress := DmRefresher.QryConferenciaNota.RecNo;
         DmRefresher.QryConferenciaNota.Next;
      end;
    ConfirmaTransacao;
    DmRefresher.QryConferenciaNota.Close;
  Except
    on E:Exception do
     begin
        GravaLog('Erro na atualização - ' + E.Message);
     
        if (pos(uppercase('connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('database'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Failed to establish a connection'), uppercase(e.Message)) > 0) or
           (pos(uppercase('Unable to complete network request'), uppercase(e.Message)) > 0) or
           (pos(uppercase('DBX Error'), uppercase(e.Message)) > 0) then
         begin
           Terminar := True;
         end;
         DmRefresher.QryConferenciaNota.Close;
         CancelaTransacao;
   end;
  End;
end;


procedure TFrmPrincipalRefresher.btExecutaClick(Sender: TObject);
var i : integer;
begin
  RxTrayIcon1.Animated := True;
  Fechar1.Enabled := False;
  Timer1.Enabled := False;

  if not DmRefresher.SQLConnection1.Connected then
     try
        DmRefresher.SQLConnection1.Open;
     except
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro de conexão com o banco de dados.');
        Application.Terminate;
        Halt;
        Exit;
     end;


  Try
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER TG_AT_COMPRAS ACTIVE';
    DmRefresher.Sql1.ExecSQL(True);
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER TG_AT_ITENS_COMPRAS ACTIVE';
    DmRefresher.Sql1.ExecSQL(True);
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER TG_EXC_COMPRAS ACTIVE';
    DmRefresher.Sql1.ExecSQL(True);
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER CONTAS_PAGAR_BD0 ACTIVE';
    DmRefresher.Sql1.ExecSQL(True);
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE';
    DmRefresher.Sql1.ExecSQL(True);
    DmRefresher.Sql1.CommandText := 'ALTER TRIGGER POSICAOESTOQUEDATA_AI0 ACTIVE';
    DmRefresher.Sql1.ExecSQL(True);
  Except
    GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro ao ativar triggers.');
  End;

  for i := 0 to ListView1.Items.Count - 1 do
   begin
      Application.ProcessMessages;

      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) +'===============================================================');

      Try
        Arquivo := ExtractFilePath(Application.ExeName)+'Importacao' + '\' + ListView1.Items[i].Caption;
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + Arquivo);
      Except
      End;

      Try
          if (Pos(UpperCase('lancamentos'), UpperCase(ListView1.Items[i].Caption)) <> 0) and
             (Pos(UpperCase('aprazo'), UpperCase(ListView1.Items[i].Caption)) = 0 )then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarLancamentos;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Lancamentos - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('lancamentosaprazo'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarLancamentosaPrazo;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Lancamentos - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('caixa'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarCaixa;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Caixa - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('operadores'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;;
                ProcessarOperadores;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Operadores - ' + E.Message);
                 end;
              End;
          end
          else
          if Pos(UpperCase('entregas'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarEntregas;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Entregas - ' + E.Message);
                 end;
              End;
          end
          else
          if Pos(UpperCase('contas_receber'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarCadfin;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Contas a Receber - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ComprasDeletadas'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarComprasDeletadas;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Compras Deletadas - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ContasPagarDeletadas'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarContasPagarDeletadas;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Contas a Pagar Deletadas - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ClientesDeletados'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarClientesDeletados;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Clientes Deletados - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('LotesItensCompras'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarLotesItensCompra;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Lotes Itens Compras - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('compras'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarPedid1;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Compras - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('itens_compra'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarPedido;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Itens Compras - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('comprasboletos'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarComprasBoletos;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Compras Boletos - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('contaspagarcompras'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarContasPagarCompras;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em ContasPagarCompras - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('contas_pagar'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarDuplic;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Contas a Pagar - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ProdutosTotais'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Filial := StrtoFloat(Copy(ListView1.Items[i].Caption, Pos('_', ListView1.Items[i].Caption) + 1, 2));
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarProdutosTotais;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Produtos Totais - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ProdutosLotesST'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarProdutosLotesST;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Produtos Lotes - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ProdutosLotes'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarProdutosLotes;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Produtos Lotes - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ConferenciaNota'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarConferenciaNota;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Conferencia Nota - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('produtos'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Filial := StrtoFloat(Copy(ListView1.Items[i].Caption, Pos('_', ListView1.Items[i].Caption) + 1, 2));
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarEstoqueMinimo;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Estoque Minimo - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('cheques'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarCheques;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Cheques - ' + E.Message);
                 end;
              End;
           end
          else
          if (Pos(UpperCase('transfer'), UpperCase(ListView1.Items[i].Caption)) <> 0) and
             (Pos(UpperCase('itens'), UpperCase(ListView1.Items[i].Caption)) = 0) then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarTransfer;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Transfer - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('itenstransfer'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarItensTransfer;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em ItensTransfer - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('caderno'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarCadernoFaltas;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Caderno Faltas - ' + E.Message);
                 end;
              End;
          end
         else
          if (Pos(UpperCase('clientes'), UpperCase(ListView1.Items[i].Caption)) <> 0) and
             (Pos(UpperCase('deletados'), UpperCase(ListView1.Items[i].Caption)) = 0) then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarClientes;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Clientes - ' + E.Message);
                 end;
              End;
           end
          else
          if (Pos(UpperCase('consistenciacr'), UpperCase(ListView1.Items[i].Caption)) <> 0) then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarConsistenciaCR;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Consistencia Contas a Receber - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('usuarios'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarUsuarios;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Usuarios - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('crm'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarCRM;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em CRM - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('Valores'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                Filial := StrtoFloat(Copy(ListView1.Items[i].Caption, Pos('_', ListView1.Items[i].Caption) + 1, 2));
                DmRefresher.SQLConnection1.Open;
                ProcessarControleValores;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Controle de Produtos - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('CodigoBarras'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarCodigoBarras;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Codigo de Barras - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('Balanco'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarBalancos;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Balancos - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('PrecoVendaFilial'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Filial := StrtoFloat(Copy(ListView1.Items[i].Caption, Pos('_', ListView1.Items[i].Caption) + 1, 2));
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarPrecoVendaFilial;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Preços da Filial - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('PosicaoEstoque'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarPosicaoEstoque;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Posicao Estoque - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('sintegranotas'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarSintegraNotas;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Sintegra Notas - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('sintegraitensnotas'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarSintegraNotasItens;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Sintegra Notas Itens - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('sintegrapedidos'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarSintegraPedidos;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Sintegra Pedidos - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('sintegrar60'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarSintegraR60;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Sintegra R60 - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('sintegrair60'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarSintegraR60I;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Sintegra R60I - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('ContasReceberDeletados'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarContasReceberDeletados;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Contas ReceberDeletados - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('SintegraNFEntradaDeletados'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarSintegraNFEntradaDeletados;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em SintegraNFEntrada Deletados - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('VendasItensExcluidos'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarVendasItensExcluidos;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em VendasItensExcluidos - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('VendasCallCenter'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarVendasCallCenter;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em Vendas CallCenter - ' + E.Message);
                 end;
              End;
           end
          else
          if Pos(UpperCase('VendasFPCallCenter'), UpperCase(ListView1.Items[i].Caption)) <> 0 then
           begin
              Try
                DmRefresher.SQLConnection1.Open;
                ProcessarVendasFPCallCenter;
                DmRefresher.SQLConnection1.Close;
                if Terminar then
                 begin
                   Application.Terminate;
                   Exit;
                 end;
                DeleteFile(Arquivo);
              Except
                on E:Exception do
                 begin
                  DmRefresher.SQLConnection1.Close;
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Erro em VendasFP CallCenter - ' + E.Message);
                 end;
              End;
           end;
      except
      end;
      ListView1.Items[i].SubItems[2] := 'X';
      ListView1.Canvas.Brush.Color := clAqua;
      ListView1.Repaint;
      DeleteFile(Arquivo);
   end;

  FecharTodosDataSets;

  Timer1.Enabled := True;
  Fechar1.Enabled := True;
  RxTrayIcon1.Animated := False;
  ListView1.Clear;
  Gauge1.Progress := 0;
  Screen.Cursor := crDefault;

  Gauge1.Visible := False;
  RxTrayIcon1.Animated := False;

  //se o servico FARMAXSERVICE estiver ativo, finaliza o Refresher, caso contrario, mantem ativo
  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Encerrando o processo Normalmente. ');
  if VerificaProcesso('FarmaxSer') then
    begin
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Processo concluido com Serviço FarmaxService Ativo. ');
      Close;
      Application.Terminate;
      Exit;
    end
  else
    begin
      GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Processo concluido Rodando como Aplicacao. ');
      //Timer1.Enabled := True; // Solicitado por GML - 15.02.2017 - Compatibilizar com novos exportadores (Laércio)
      Close;
      Application.Terminate;
      Exit;
    end;
end;

procedure TFrmPrincipalRefresher.Button2Click(Sender: TObject);
begin
   Timer2.Interval := 60000;
   Timer2.Enabled := True;
   FrmPrincipalRefresher.Hide;
end;

procedure TFrmPrincipalRefresher.ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
  case FColumnIndex of
    0 : Compare := AnsiCompareText(Item1.Caption,Item2.Caption);
    1 : Compare := Trunc(StrToDate(Item1.SubItems[0])-StrToDate(Item2.SubItems[0]));
    2 : Compare := Trunc((StrToTime(Item1.SubItems[1])-StrToTime(Item2.SubItems[1])) * 1000000);
  end;
end;

procedure TFrmPrincipalRefresher.AppEvents1Minimize(Sender: TObject);
begin
  FrmPrincipalRefresher.Hide;
end;

procedure TFrmPrincipalRefresher.AbrirLog1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    ShellExecute(Application.Handle, 'open', PChar(OpenDialog1.FileName), nil, nil, SW_SHOWMAXIMIZED);
end;

//mensagem com um gauge exibindo o andamento de um processo
procedure TFrmPrincipalRefresher.ExibeProgresso(Valor : Integer; Mensagem : String);
begin
     Gauge1.MinValue := 0;
     Gauge1.MaxValue := Valor;
     Application.ProcessMessages;
end;

procedure TFrmPrincipalRefresher.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Listview1.items[Item.Index].SubItems[2] = 'X' then
    Listview1.Canvas.Brush.Color := clAqua
  else
    ListView1.Canvas.Brush.Color := clWhite;
end;


function TFrmPrincipalRefresher.IniciaDia : Boolean;
var
 Mes, Ano, MesMeta, AnoMeta : Integer;
 DataImplantacao : TDateTime;
 ArquivoIni : TIniFile;
 MesAnterior, MesAtual : Integer;
 Sair : Boolean;
begin
  Result := True;
  InicioDia := False;
  Sair := False;

  if not DmRefresher.CdsParametros.Active then
    try
      DmRefresher.CdsParametros.Open;
    except
    on E:Exception do
     begin
       GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + E.Message);
     end;
    end;

  if (Crypt('D', Trim(DmRefresher.CdsParametrosCHAVESINTEGRA.AsString)) = '') then
   begin
     DmRefresher.CdsParametros.Edit;
     DmRefresher.CdsParametrosCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date-1));
     DmRefresher.CdsParametrosDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date - 5));
     DmRefresher.CdsParametros.Post;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Atribuição de data inicial : ' + FormatDateTime('dd/mm/yyyy', Date));
     DmRefresher.CdsParametros.ApplyUpdates(0);
   end;

  Try
    DataHoje := StrtoDateDef(Crypt('D', DmRefresher.CdsParametrosCHAVESINTEGRA.AsString), 0);
  Except
    on E:Exception do
     begin
       GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + E.Message);
       Sair := True;
     end;
  End;

  if Sair then
   begin
     Result := True;
     Exit;
   end;

  if DataHoje = 0 then
    begin
      Gravalog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - >>>>>> Data Encontrada no Banco: ' + FormatDateTime('dd/mm/yyyy', DataHoje));
      Exit;
    end;

  Try
    MesAnterior := StrtoInt(FormatDateTime('mm', DataHoje));
  Except
    on E:Exception do
     begin
       GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + E.Message);
       Sair := True;
     end;
  End;

  if Sair then
   begin
     Result := True;
     Exit;
   end;

  //se houve alteracao de data, o sistema vai executar um conjunto de rotinas de fechamento do dia anterior e abertura de novo dia
  if (DataHoje < Date) and (Time > StrtoTime('02:00:00')) then
     begin
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Alteracao de data do Sistema : ' + Crypt('D', DmRefresher.CdsParametrosCHAVESINTEGRA.AsString));
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ApagaArquivos' );
        ApagaArquivos;
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Saiu ApagaArquivos');

        if (Crypt('D', Trim(DmRefresher.CdsParametrosCHAVESINTEGRA.AsString)) = '') then
         begin
           DmRefresher.CdsParametros.Edit;
           DmRefresher.CdsParametrosCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
           DmRefresher.CdsParametrosDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date - 5));
           DmRefresher.CdsParametros.Post;
           GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Atribuicao de data do Dia por estar vazio.' );
           DmRefresher.CdsParametros.ApplyUpdates(0);
         end;

        if not (DmRefresher.CdsParametrosDT_IMPLANTACAO.IsNull) and (DmRefresher.CdsParametrosDT_IMPLANTACAO.AsString <> '') then
          DataImplantacao  := StrToDate(Crypt('D', DmRefresher.CdsParametrosDT_IMPLANTACAO.AsString))
        else
          DataImplantacao := date;

        DmRefresher.CdsParametros.Refresh;
        if StrtoDate(Crypt('D', DmRefresher.CdsParametrosCHAVESINTEGRA.AsString)) >= Date then
         begin
           GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Inicialização do dia já executada por outro terminal.');
           InicioDia := False;
           Exit;
         end;

        //incrementa mais um dia de utilizacao do sistema, visando autenticar dentro de x dias
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' >>>------ Alteracao ------<<< ' +
                 'Data Anterior : ' + Crypt('D', DmRefresher.CdsParametrosCHAVESINTEGRA.AsString) +
                 '  Data Atual : ' + FormatDateTime('dd/mm/yyyy', Date));
        try
          DmRefresher.CdsParametros.Edit;
          DmRefresher.CdsParametrosDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', DataImplantacao + 1));
          DmRefresher.CdsParametrosCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
          DmRefresher.CdsParametrosDATAATUAL.AsDateTime := Date;
          DmRefresher.CdsParametros.ApplyUpdates(0);
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Gravacao da Nova data do dia executada com Sucesso.' + FormatDateTime('dd/mm/yyyy', Date) );
        except
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Gravacao da Nova data do dia NAO FOI executada com Sucesso.' + FormatDateTime('dd/mm/yyyy', Date) );
        end;

        DataHoje := Date;
        MesAtual := StrtoInt(FormatDateTime('mm', Date));


        //if FileExists(ExtractFilePath(Application.ExeName) + 'FarmaxBackup.exe') then
        //   WinExec(Pchar(ExtractFilePath(Application.ExeName)+'FarmaxBackup.exe'), WM_SHOWWINDOW);

        Try
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Iniciando o backup do banco.');
          Application.CreateForm(TFrmBackup, FrmBackup);
          FrmBackup.BtBackupClick(FrmBackup.BtBackup);
         Finally
          FrmBackup.Destroy;
        End;


        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Processos de Calculo de Demandas <<<<<<<<<<<<<<<<<<<<
        // ACUMULANDO TOTAL VENDIDO DO PRODUTO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Executando a Sp Preenche Grupos Curva.');
        ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_GRUPOS_CURVA', False);

        DmRefresher.CdsCadFiliais.Close;
        DmRefresher.CdsCadFiliais.Open;
        DmRefresher.CdsCadFiliais.Filter := 'EXPORTAR = ' + QuotedStr('S');
        DmRefresher.CdsCadFiliais.Filtered := True;
        DmRefresher.CdsCadFiliais.First;
        ExecutaProcedure('ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 INACTIVE', False);
        while not DmRefresher.CdsCadFiliais.Eof do
        begin
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Preenche Venda e Compra de Produtos para a filial ' + DmRefresher.CdsCadFiliaisCD_FILIAL.AsString);
          ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_VENDA_PRODUTO('+ FormatDateTime('yyyy', Date) + ',' +
                              InttoStr(StrtoInt(FormatDatetime('mm', Date))) + ', ' + DmRefresher.CdsCadFiliaisCD_FILIAL.AsString + ')', False);
          DmRefresher.CdsCadFiliais.Next;
        end;
        ExecutaProcedure('ALTER TRIGGER PRODUTOS_TOTAIS_BIU0 ACTIVE', False);
        DmRefresher.CdsCadFiliais.Close;

        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - SP_RECALCULA_PRODUTOSTOTAIS');
        ExecutaProcedure('EXECUTE PROCEDURE SP_RECALCULA_PRODUTOSTOTAIS', False);

        if not (DmRefresher.CdsParametrosDIASBLOQUEIOCLIENTE.IsNull) and (DmRefresher.CdsParametrosDIASBLOQUEIOCLIENTE.AsInteger > 0) then
         begin
            //Bloqueando clientes em atraso...
            Cd_Evento := 0;
            Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Bloqueando Clientes em Atraso (Refresher)', True, False);
            DmRefresher.Sql.CommandText := 'EXECUTE PROCEDURE SP_BLOQUEIACLIENTEATRASO';
            GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' Bloqueio de Clientes em Atraso: ' + FormatDateTime('dd/mm/yyyy', Date));
            if DmRefresher.SQLConnection1.InTransaction then
               DmRefresher.SQLConnection1.Rollback(TD);
            DmRefresher.SQLConnection1.StartTransaction(TD);
            Try
              DmRefresher.Sql.ExecSQL(True);
              DmRefresher.SQLConnection1.Commit(TD);
            Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Bloqueando Clientes em Atraso (Refresher)', False, False);
            Except
              if DmRefresher.SQLConnection1.InTransaction then
                 DmRefresher.SQLConnection1.Rollback(TD);
            Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Bloqueando Clientes em Atraso (Refresher)', False, True);
            End;
         end;

        InicioDia := True;

        Cd_Evento := 0;
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Preparando todos os precos para exportacao...');
        DmRefresher.Sql.CommandText := 'EXECUTE PROCEDURE SP_EXPORTACAO_PRECOS_TODOS';
        if DmRefresher.SQLConnection1.InTransaction then
           DmRefresher.SQLConnection1.Rollback(TD);
        DmRefresher.SQLConnection1.StartTransaction(TD);
        Try
          DmRefresher.Sql.ExecSQL(True);
          DmRefresher.SQLConnection1.Commit(TD);
          Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Preparando todos os precos para exportacao (Refresher)', False, False);
        Except
          if DmRefresher.SQLConnection1.InTransaction then
             DmRefresher.SQLConnection1.Rollback(TD);
          Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Preparando todos os precos para exportacao (Refresher)', False, True);
        End;

        GravaTempoOperacao;

        //criacao de Metas de Vendas em bancos Gestao
        Mes := StrtoInt(FormatDateTime('MM', Date)) - 1;
        Ano := StrtoInt(FormatDateTime('yyyy', Date));
        MesMeta := StrtoInt(FormatDateTime('MM', Date));
        AnoMeta := StrtoInt(FormatDateTime('yyyy', Date));
        if Mes < 1 then
         begin
           Mes := 12;
           Ano := Ano - 1;
         end;

        DmRefresher.CdsCadFiliais.Close;
        DmRefresher.CdsCadFiliais.Open;
        DmRefresher.CdsCadFiliais.Filter := 'STATUS = ' + QuotedStr('A') + ' AND EXPORTAR = ' + QuotedStr('S');
        DmRefresher.CdsCadFiliais.Filtered := True;

        DmRefresher.CdsCadFiliais.First;
        while not DmRefresher.CdsCadFiliais.Eof do
         begin
          DmRefresher.Cds1.Close;
          DmRefresher.Sql.CommandText := 'SELECT COUNT(*) FROM METAS_FILIAIS WHERE CD_FILIAL = ' +  DmRefresher.CdsCadFiliaisCD_FILIAL.AsString + ' AND MESREF = ' + IntToStr(MesMeta) + '  AND ANOREF = ' + IntToStr(AnoMeta);
          DmRefresher.Cds1.Open;
          if DmRefresher.Cds1.Fields[0].AsInteger = 0 then
           begin
              GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Preenchendo nova Meta para filial ' + DmRefresher.CdsCadFiliaisCD_FILIAL.AsString);
              ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_META_NOVA(' +
                                  DmRefresher.CdsCadFiliaisCD_FILIAL.AsString + ', ' +
                                  InttoStr(Mes) + ', ' +
                                  InttoStr(Ano) + ', 30)', False);

              GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Preenchendo nova Meta para vendedores da filial ' + DmRefresher.CdsCadFiliaisCD_FILIAL.AsString);
              ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_META_NOVA_VEND(' +
                                  DmRefresher.CdsCadFiliaisCD_FILIAL.AsString + ', ' +
                                  InttoStr(Mes) + ', ' + InttoStr(Ano) + ')', False);
           end;

          DmRefresher.CdsCadFiliais.Next;
          GravaTempoOperacao;
          if (DmRefresher.CdsCadFiliaisCD_FILIAL.AsFloat > 20) or (DmRefresher.CdsCadFiliais.Eof) then
            break;
         end;
        DmRefresher.CdsCadFiliais.Filter := '';
        DmRefresher.CdsCadFiliais.Filtered := False;

        // calculando curvas
        if (DmRefresher.CdsParametrosTIPO_LOJA.AsString = 'M') and (MesAtual <> MesAnterior) then
           begin
              DmRefresher.CdsCadFiliais.Close;
              DmRefresher.CdsCadFiliais.Open;
              DmRefresher.CdsCadFiliais.Filter := 'EXPORTAR = ' + QuotedStr('S');
              DmRefresher.CdsCadFiliais.Filtered := True;
              DmRefresher.CdsCadFiliais.First;
              while not DmRefresher.CdsCadFiliais.Eof do
              begin
                CalculaCurva(DmRefresher.CdsCadFiliaisCd_Filial.asInteger);
                DmRefresher.CdsCadFiliais.Next;
                Application.ProcessMessages;
              end;
              DmRefresher.CdsCadFiliais.Close;
           end;
        // calculando curvas

        // calculando media_f, eseg e emax
        if (DmRefresher.CdsParametrosTIPO_LOJA.AsString = 'M') and ((MesAtual <> MesAnterior) or (FormatDateTime('dd', DataHoje) = '04')) then
         begin
              DmRefresher.CdsCadFiliais.Close;
              DmRefresher.CdsCadFiliais.Open;
              DmRefresher.CdsCadFiliais.Filter := 'EXPORTAR = ' + QuotedStr('S');
              DmRefresher.CdsCadFiliais.Filtered := True;
              DmRefresher.CdsCadFiliais.First;
              while not DmRefresher.CdsCadFiliais.Eof do
               begin
                  // Calculando Media_F na Virada do Mes para cada Filial na Gestão
                  GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Calculando MediaF eSeg eMax para filial ' + DmRefresher.CdsCadFiliaisCD_FILIAL.AsString);
                  if DmRefresher.CdsParametrosESTOQUEMINIMO.AsString = 'M' then
                     ExecutaProcedure('EXECUTE PROCEDURE SP_CALCULA_MEDIAF(' + DmRefresher.CdsCadFiliaisCD_FILIAL.AsString + ', ' + InttoStr(MesAtual) + ')', False)
                  else
                     ExecutaProcedure('EXECUTE PROCEDURE SP_CALCULA_MEDIAF_ESEG_EMAX(' + DmRefresher.CdsCadFiliaisCD_FILIAL.AsString + ')', False);
                  DmRefresher.CdsCadFiliais.Next;
               end;
              DmRefresher.CdsCadFiliais.Close;
         end;
        // calculando media_f, eseg e emax

        //Verifica saldos de contas de clientes - Em Gestao e Loja Unica
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Executando Acerta saldo de Cliente M ');
        ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES INACTIVE', False);
        ExecutaProcedure('EXECUTE PROCEDURE SP_ACERTA_SALDO_CLIENTE_M', False);
        ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_CLIENTES ACTIVE', False);

        //EFETUANDO PAGAMENTO AUTOMATICO DOS CHEQUES_PRE e Cartoes de Credito
        if (DmRefresher.CdsParametrosBAIXAAUTOMATICACHEQUEPRE.AsString = 'S') then
         begin
            try
              GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Baixa Automatica de ChequePre ');
              BaixaAutomaticaChequePre;
            except
              GravaLog('Ocorreu uma Falha na Baixa Automatica de Contas a Receber....: ' + FormatDateTime('dd/mm/yyyy', Date));
            end;
         end;

        // TRATAMENTO DE ESTOQUE DO PAINELIMS
        if DmRefresher.CdsParametrosUSAIMS.AsString = 'S' then
         begin
            GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Armazenando estoque do PainelIMS ');
            ExecutaProcedure('EXECUTE PROCEDURE SP_APAGA_ESTOQUEIMS', False);
            ExecutaProcedure('EXECUTE PROCEDURE SP_ARMAZENA_ESTOQUEIMS', False);
         end;

        // TRATAMENTO DOS PEDIDOS DE GESTÃO INATIVOS (EXCLUÍDOS PELO CLIENTE)
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Excluindo pedidos de gestão inativos ');
        ExecutaProcedure('EXECUTE PROCEDURE SP_APAGA_PEDIDOGESTAO_INATIVO', False);

        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Finalizando os processos de inicializacao de dia. ');
     end
  else
     begin
       if DataHoje > Date then
        begin
          DmRefresher.CdsParametros.Edit;
          DmRefresher.CdsParametrosCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
          DmRefresher.CdsParametros.Post;
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Atribuição de data inicial através de super senha: "' + FormatDateTime('dd/mm/yyyy', Date) + '"');
          DmRefresher.CdsParametros.ApplyUpdates(0);
        end;
     end;
end;



function TFrmPrincipalRefresher.IniciaDiaSuporte : Boolean;
var
 Mes, Ano, MesMeta, AnoMeta : Integer;
 DataImplantacao : TDateTime;
 ArquivoIni : TIniFile;
 MesAnterior, MesAtual : Integer;
 Sair : Boolean;
begin
  Result := True;
  InicioDia := False;
  Sair := False;

  if not DmRefresher.CdsParametrosFarmax.Active then
    try
      DmRefresher.CdsParametrosFarmax.Open;
    except
    on E:Exception do
     begin
       GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + E.Message);
     end;
    end;

  if (Crypt('D', Trim(DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString)) = '') then
   begin
     DmRefresher.CdsParametrosFarmax.Edit;
     DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date-1));
     DmRefresher.CdsParametrosFarmaxDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date - 5));
     DmRefresher.CdsParametrosFarmax.Post;
     GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Atribuição de data inicial : ' + FormatDateTime('dd/mm/yyyy', Date));
     DmRefresher.CdsParametrosFarmax.ApplyUpdates(0);
   end;

  Try
    DataHoje := StrtoDateDef(Crypt('D', DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString), 0);
  Except
    on E:Exception do
     begin
       GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + E.Message);
       Sair := True;
     end;
  End;

  if Sair then
   begin
     Result := True;
     Exit;
   end;

  if DataHoje = 0 then
    begin
      Gravalog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - >>>>>> Data Encontrada no Banco: ' + FormatDateTime('dd/mm/yyyy', DataHoje));
      Exit;
    end;

  Try
    MesAnterior := StrtoInt(FormatDateTime('mm', DataHoje));
  Except
    on E:Exception do
     begin
       GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + E.Message);
       Sair := True;
     end;
  End;

  if Sair then
   begin
     Result := True;
     Exit;
   end;

  //se houve alteracao de data, o sistema vai executar um conjunto de rotinas de fechamento do dia anterior e abertura de novo dia
  if (DataHoje < Date) and (Time > StrtoTime('01:00:00')) then
     begin
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Alteracao de data do Sistema : ' + Crypt('D', DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString));
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ApagaArquivos' );
        ApagaArquivos;

        if (Crypt('D', Trim(DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString)) = '') then
         begin
           DmRefresher.CdsParametrosFarmax.Edit;
           DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
           DmRefresher.CdsParametrosFarmaxDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date - 5));
           DmRefresher.CdsParametrosFarmax.Post;
           GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Atribuicao de data do Dia por estar vazio.' );
           DmRefresher.CdsParametrosFarmax.ApplyUpdates(0);
         end;

        if not (DmRefresher.CdsParametrosFarmaxDT_IMPLANTACAO.IsNull) and (DmRefresher.CdsParametrosFarmaxDT_IMPLANTACAO.AsString <> '') then
          DataImplantacao  := StrToDate(Crypt('D', DmRefresher.CdsParametrosFarmaxDT_IMPLANTACAO.AsString))
        else
          DataImplantacao := date;

        DmRefresher.CdsParametrosFarmax.Refresh;
        if StrtoDate(Crypt('D', DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString)) >= Date then
         begin
           GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Inicialização do dia já executada por outro terminal.');
           InicioDia := False;
           Exit;
         end;

        //incrementa mais um dia de utilizacao do sistema, visando autenticar dentro de x dias
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' >>>------ Alteracao ------<<< ' +
                 'Data Anterior : ' + Crypt('D', DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString) +
                 '  Data Atual : ' + FormatDateTime('dd/mm/yyyy', Date));
        try
          DmRefresher.CdsParametrosFarmax.Edit;
          DmRefresher.CdsParametrosFarmaxDT_IMPLANTACAO.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', DataImplantacao + 1));
          DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
          DmRefresher.CdsParametrosFarmaxDATAATUAL.AsDateTime := Date;
          DmRefresher.CdsParametrosFarmax.ApplyUpdates(0);
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Gravacao da Nova data do dia executada com Sucesso.' + FormatDateTime('dd/mm/yyyy', Date) );
        except
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Gravacao da Nova data do dia NAO FOI executada com Sucesso.' + FormatDateTime('dd/mm/yyyy', Date) );
        end;

        DataHoje := Date;
        MesAtual := StrtoInt(FormatDateTime('mm', Date));


        //if FileExists(ExtractFilePath(Application.ExeName) + 'FarmaxBackup.exe') then
        //   WinExec(Pchar(ExtractFilePath(Application.ExeName)+'FarmaxBackup.exe'), WM_SHOWWINDOW);

        Try
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Iniciando o backup do banco.');
          Application.CreateForm(TFrmBackup, FrmBackup);
          FrmBackup.BtBackupClick(FrmBackup.BtBackup);
         Finally
          FrmBackup.Destroy;
        End;


        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Processos de Calculo de Demandas <<<<<<<<<<<<<<<<<<<<
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Executando a Sp Atualiza Parcelas.');
        ExecutaProcedure('EXECUTE PROCEDURE SP_ATUALIZA_PARCELAS', False);

        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Executando a Sp Preenche Ultima Autenticacao.');
        ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_ULTIMA_AUTENTICACAO', False);


        GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Executando a Sp Preenche Ultimo Pagamento.');
        ExecutaProcedure('EXECUTE PROCEDURE SP_PREENCHE_ULTIMO_PAGAMENTO', False);

        InicioDia := True;
     end
  else
     begin
       if DataHoje > Date then
        begin
          DmRefresher.CdsParametrosFarmax.Edit;
          DmRefresher.CdsParametrosFarmaxCHAVESINTEGRA.AsString := Crypt('C', FormatDateTime('dd/mm/yyyy', Date));
          DmRefresher.CdsParametrosFarmax.Post;
          GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Atribuição de data inicial através de super senha: "' + FormatDateTime('dd/mm/yyyy', Date) + '"');
          DmRefresher.CdsParametrosFarmax.ApplyUpdates(0);
        end;
     end;
end;



procedure TFrmPrincipalRefresher.ApagaArquivos;
var
  RecLog, RecBackup, RecCaixas : TSearchRec;
  Data : TDateTime;
  ListadeArquivos : TStringList;
  NomeArquivo : String;
begin
  if FindFirst(ExtractFilePath(Application.ExeName)+'Logs\*.*', faAnyFile, RecLog) = 0 then
   begin
    repeat
      Data := StrtoDateDef(FormatDateTime('dd/mm/yyyy', FileDatetoDateTime(RecLog.Time)), 0);
      if Data <= (Date - 30) then
        DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'Logs\' + RecLog.Name));
    until FindNext(RecLog) <> 0;
   end;

  //armazena no HD os 8 ultimos backups
  ListadeArquivos := TStringList.Create;
  if FindFirst(ExtractFilePath(Application.ExeName)+'Backups\*.*', faArchive, RecBackup) = 0 then
   begin
    repeat
      ListadeArquivos.Add('Backup' + Copy(RecBackup.Name, 11, 4) + Copy(RecBackup.Name, 9, 2) + Copy(RecBackup.Name, 7, 2) + Copy(RecBackup.Name, 15, Length(RecBackup.Name)));
    until FindNext(RecBackup) <> 0;
    ListadeArquivos.Sort;
    while ListadeArquivos.Count > 10 do
     begin
       NomeArquivo := 'Backup' + Copy(ListadeArquivos.Strings[0], 13, 2) + Copy(ListadeArquivos.Strings[0], 11, 2) + Copy(ListadeArquivos.Strings[0], 7, 4) + Copy(ListadeArquivos.Strings[0], 15, Length(ListadeArquivos.Strings[0]));
       DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'Backups\' + NomeArquivo));
       ListadeArquivos.Delete(0);
     end;
    ListadeArquivos.Destroy;
   end;

  if FindFirst(ExtractFilePath(Application.ExeName)+'Caixas\*.*', faAnyFile, RecCaixas) = 0 then
   begin
    repeat
      Data := StrtoDateDef(FormatDateTime('dd/mm/yyyy', FileDatetoDateTime(RecCaixas.Time)), 0);
      if Data <= (Date - 5) then
        DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'Caixas\' + RecCaixas.Name));
    until FindNext(RecCaixas) <> 0;
   end;
end;


procedure TFrmPrincipalRefresher.ExecutaProcedure(Sql: String; Msg: Boolean);
begin
  Try
    Cd_Evento := 0;
    Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Executando Procedure - ' + Sql + ' (ExecutaProcedure)', True, False);
    if DmRefresher.SQLConnection1.InTransaction then
       DmRefresher.SQLConnection1.Rollback(TD);

    DmRefresher.Cds1.Close;
    DmRefresher.SQLConnection1.StartTransaction(TD);
    DmRefresher.Sql.CommandText := Sql;
    DmRefresher.Sql.ExecSQL(True);
    DmRefresher.SQLConnection1.Commit(TD);
    Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Executando Procedure - ' + Sql + ' (ExecutaProcedure)', False, False);
   Except
    if DmRefresher.SQLConnection1.InTransaction then
       DmRefresher.SQLConnection1.Rollback(TD);
    Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Executando Procedure - ' + Sql + ' (ExecutaProcedure)', False, True);
   End;
end;

procedure TFrmPrincipalRefresher.FormShow(Sender: TObject);
begin
  GravaTempoOperacao;
end;


procedure TFrmPrincipalRefresher.GravaTempoOperacao;
begin
  ///////////////// tratamento do tempo de atividade do refresher
  try
    if not FileExists(ExtractFilePath(Application.ExeName) + 'RefresherTime.TXT') then
     begin
      AssignFile(RefresherTime, ExtractFilePath(Application.ExeName) + 'RefresherTime.TXT');
      Rewrite(RefresherTime);
      Writeln(RefresherTime, TimetoStr(Time));
      CloseFile(RefresherTime);
     end;

    AssignFile(RefresherTime, ExtractFilePath(Application.ExeName) + 'RefresherTime.TXT');
    ReWrite(RefresherTime);
    Writeln(RefresherTime, TimetoStr(Time));
    CloseFile(RefresherTime);
  except
  end;
end;


procedure TFrmPrincipalRefresher.CalculaCurva(Filial : Integer);
var
 Mes, Ano, UltimoDia : String;
 DataInicial, DataFinal : TDateTime;
begin
  Mes := InttoStr(StrtoInt(FormatDateTime('mm', Date)) - 1);
  Ano := FormatDateTime('yyyy', Date);
  if Mes = '0' then
   begin
     Mes := '12';
     Ano := InttoStr(StrtoInt(Ano) - 1);
   end;
  UltimoDia := FloattoStr(UltimoDiaMes(StrtoFloat(Mes)));
  DataInicial := StrtoDateDef('01/'+Mes+'/'+Ano, 0);
  DataFinal := StrtoDateDef(UltimoDia+'/'+Mes+'/'+Ano, 0);

  Application.ProcessMessages;
  ExecutaProcedure('ALTER TRIGGER TG_AT_CUSTO_PRODUTO INACTIVE', False);
  ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO INACTIVE', False);
  ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 INACTIVE', False);
  ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO INACTIVE', False);

  DmRefresher.CdsCadClasse.Close;
  DmRefresher.CdsCadClasse.Open;
  DmRefresher.CdsCadClasse.First;

  while not DmRefresher.CdsCadClasse.Eof do
   begin
       Try
         GravaLog(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - Preenchendo Curvas de Estoque ABC para filial ' + FloatToStr(Filial));
         ExecutaProcedure('EXECUTE PROCEDURE SP_CALCULA_CURVA('+
                                    FloatToStr(Filial) + ', ' +
                                    DmRefresher.CdsCadClasseCD_CLASSE.AsString+','+
                                    QuotedStr(FormatDateTime('mm/dd/yyyy',DataInicial))+ ','+
                                    QuotedStr(FormatDateTime('mm/dd/yyyy',DataFinal))+')', False);

         DmRefresher.CdsCadClasse.Edit;
         DmRefresher.CdsCadClasseDT_CALCULOCURVA.AsDateTime := Date;
         DmRefresher.CdsCadClasseFREQUENCIA.AsInteger := 30;
         DmRefresher.CdsCadClasse.Post;
       Except
         GravaLog('Operação não executada. Classe ' + DmRefresher.CdsCadClasseDESCRICAO.AsString + '.');
       End;
    DmRefresher.CdsCadClasse.Next;
   end;
  DmRefresher.CdsCadClasse.ApplyUpdates(0);
  DmRefresher.CdsCadClasse.Close;

  ExecutaProcedure('ALTER TRIGGER TG_AT_CUSTO_PRODUTO ACTIVE', False);
  ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO ACTIVE', False);
  ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_PRECO2 ACTIVE', False);
  ExecutaProcedure('ALTER TRIGGER TG_AT_DT_ALTERACAO_PRODUTO ACTIVE', False);
end;


procedure TFrmPrincipalRefresher.BaixaAutomaticaChequePre;
var
 Conta : Real;
 Banco, Agencia, ContaCorrente : String;
begin
  Try
      Cd_Evento := 0;
      Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Baixando automaticamente os cheques-pre (Refresher)', True, False);

      Conta := 0;
      Banco := '';
      Agencia := '';
      ContaCorrente := '';
      if not (DmRefresher.CdsParametrosCD_CONTA_BAIXA_CHEQUE.IsNull) and (DmRefresher.CdsParametrosCD_CONTA_BAIXA_CHEQUE.AsFloat <> 0) then
       begin
         DmRefresher.CdsCadContas.Close;
         DmRefresher.CdsCadContas.Open;
         DmRefresher.CdsCadContas.Filter := 'CD_CONTA = ' + DmRefresher.CdsParametrosCD_CONTA_BAIXA_CHEQUE.AsString;
         DmRefresher.CdsCadContas.Filtered := True;
         if  DmRefresher.CdsCadContas.RecordCount > 0 then
          begin
           Conta := DmRefresher.CdsParametrosCD_CONTA_BAIXA_CHEQUE.AsFloat;
           Banco := DmRefresher.CdsCadContasBANCO.AsString;
           Agencia := DmRefresher.CdsCadContasAGENCIA.AsString;
           ContaCorrente := DmRefresher.CdsCadContasCONTA_CORRENTE.AsString;
           DmRefresher.CdsCadContas.Close;
          end
         else
          begin
            DmRefresher.CdsCadContas.Close;
            DmRefresher.CdsCadContas.Open;
            DmRefresher.CdsCadContas.IndexFieldNames := 'CD_CONTA';
            if DmRefresher.CdsCadContas.RecordCount > 0 then
             begin
               DmRefresher.CdsCadContas.Filter := 'TIPO = ' + QuotedStr('B');
               DmRefresher.CdsCadContas.Filtered := True;
               if DmRefresher.CdsCadContas.RecordCount > 0 then
                begin
                  DmRefresher.CdsCadContas.First;
                  Conta := DmRefresher.CdsCadContasCD_CONTA.AsFloat;
                  Banco := DmRefresher.CdsCadContasBANCO.AsString;
                  Agencia := DmRefresher.CdsCadContasAGENCIA.AsString;
                  ContaCorrente := DmRefresher.CdsCadContasCONTA_CORRENTE.AsString;
                end
               else
                begin
                  DmRefresher.CdsCadContas.Filter := '';
                  DmRefresher.CdsCadContas.Filtered := False;
                  DmRefresher.CdsCadContas.First;
                  Conta := DmRefresher.CdsCadContasCD_CONTA.AsFloat;
                  Banco := DmRefresher.CdsCadContasBANCO.AsString;
                  Agencia := DmRefresher.CdsCadContasAGENCIA.AsString;
                  ContaCorrente := DmRefresher.CdsCadContasCONTA_CORRENTE.AsString;
                end;
             end
            else
             begin
               Exit;
             end;
          end;
       end
      else
       begin
          DmRefresher.CdsCadContas.Close;
          DmRefresher.CdsCadContas.Open;
          DmRefresher.CdsCadContas.IndexFieldNames := 'CD_CONTA';
          if DmRefresher.CdsCadContas.RecordCount > 0 then
           begin
             DmRefresher.CdsCadContas.Filter := 'TIPO = ' + QuotedStr('B');
             DmRefresher.CdsCadContas.Filtered := True;
             if DmRefresher.CdsCadContas.RecordCount > 0 then
              begin
                DmRefresher.CdsCadContas.First;
                Conta := DmRefresher.CdsCadContasCD_CONTA.AsFloat;
                Banco := DmRefresher.CdsCadContasBANCO.AsString;
                Agencia := DmRefresher.CdsCadContasAGENCIA.AsString;
                ContaCorrente := DmRefresher.CdsCadContasCONTA_CORRENTE.AsString;
              end
             else
              begin
                DmRefresher.CdsCadContas.Filter := '';
                DmRefresher.CdsCadContas.Filtered := False;
                DmRefresher.CdsCadContas.First;
                Conta := DmRefresher.CdsCadContasCD_CONTA.AsFloat;
                Banco := DmRefresher.CdsCadContasBANCO.AsString;
                Agencia := DmRefresher.CdsCadContasAGENCIA.AsString;
                ContaCorrente := DmRefresher.CdsCadContasCONTA_CORRENTE.AsString;
              end;
           end
          else
           begin
             Exit;
           end;
       end;

      DmRefresher.CdsBaixaAutomaticaChequePre.Close;
      DmRefresher.CdsBaixaAutomaticaChequePre.Open;
      DmRefresher.CdsBaixaAutomaticaChequePre.First;

      while not DmRefresher.CdsBaixaAutomaticaChequePre.Eof do
       begin
         if not (DmRefresher.CdsBaixaAutomaticaChequePreVL_SALDO.IsNull) and
            (DmRefresher.CdsBaixaAutomaticaChequePreVL_SALDO.AsFloat <> 0) and
            (DmRefresher.CdsBaixaAutomaticaChequePreSTATUS.AsString = 'A') then
          begin
            if not DmRefresher.CdsMovimentoCaixa.Active then
              begin
                DmRefresher.CdsMovimentoCaixa.Close;
                DmRefresher.CdsMovimentoCaixa.Params[0].AsFloat := -1;
                DmRefresher.CdsMovimentoCaixa.Params[1].AsFloat := -1;
                DmRefresher.CdsMovimentoCaixa.Open;
              end;

            DmRefresher.CdsBaixaAutomaticaChequePre.Edit;
            DmRefresher.CdsBaixaAutomaticaChequePreVL_PAGAMENTO.AsFloat := ArredondaPara(DmRefresher.CdsBaixaAutomaticaChequePreVL_PAGAMENTO.AsFloat +
                                                                                         DmRefresher.CdsBaixaAutomaticaChequePreVL_SALDO.AsFloat, 2);
            DmRefresher.CdsBaixaAutomaticaChequePreVL_SALDO.AsFloat := 0;
            DmRefresher.CdsBaixaAutomaticaChequePreDT_PAGAMENTO.AsDateTime := Date;
            DmRefresher.CdsBaixaAutomaticaChequePreSTATUS.AsString := 'P';

            DmRefresher.CdsBaixaAutomaticaChequePreCD_CONTA.AsFloat := Conta;
            DmRefresher.CdsBaixaAutomaticaChequePreBANCO.AsString := Banco;
            DmRefresher.CdsBaixaAutomaticaChequePreAGENCIA.AsString := Agencia;
            DmRefresher.CdsBaixaAutomaticaChequePreCONTA.AsString := ContaCorrente;

            DmRefresher.CdsBaixaAutomaticaChequePreHISTORICO.AsString := DmRefresher.CdsBaixaAutomaticaChequePreHISTORICO.AsString + ' - Baixa Automática';
            DmRefresher.CdsBaixaAutomaticaChequePreOBSERVACAO.AsString := DmRefresher.CdsBaixaAutomaticaChequePreOBSERVACAO.AsString + ' - Baixa Automática';

            if DmRefresher.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.IsNull then
             begin
                Case DmRefresher.CdsBaixaAutomaticaChequePreCD_FORMA_PAGAMENTO.AsInteger of
                  2 : DmRefresher.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 12;
                  3 : DmRefresher.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 13;
                  4 : DmRefresher.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 11;
                  5 : DmRefresher.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 10;
                  6 : DmRefresher.CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS.AsFloat := 14;
                else
                  DmRefresher.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 15;
                end;
             end;
            DmRefresher.CdsBaixaAutomaticaChequePre.ApplyUpdates(0);

            DmRefresher.CdsMovimentoCaixa.Append;
            DmRefresher.CdsMovimentoCaixaANOREFERENCIA.AsString := FormatDateTime('yyyy', Date);
            DmRefresher.CdsMovimentoCaixaCD_CONTA.AsFloat := DmRefresher.CdsBaixaAutomaticaChequePreCD_CONTA.AsFloat;
            DmRefresher.CdsMovimentoCaixaCD_CONTAS_RECEBER.AsFloat := DmRefresher.CdsBaixaAutomaticaChequePreCD_CONTAS_RECEBER.AsFloat;
            DmRefresher.CdsMovimentoCaixaCD_FILIAL.AsFloat := DmRefresher.CdsBaixaAutomaticaChequePreCD_FILIAL.AsFloat;
            DmRefresher.CdsMovimentoCaixaCD_MOVIMENTOCAIXA.AsFloat := RetornaID('CD_MOVIMENTOCAIXA');
            Case DmRefresher.CdsBaixaAutomaticaChequePreCD_FORMA_PAGAMENTO.AsInteger of
              2 : DmRefresher.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 12;
              3 : DmRefresher.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 13;
              4 : DmRefresher.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 11;
              5 : DmRefresher.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 10;
              6 : DmRefresher.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 14;
            else
              DmRefresher.CdsMovimentoCaixaCD_PLANO_CONTAS.AsFloat := 15;
            end;
            DmRefresher.CdsMovimentoCaixaDATA.AsDateTime         := DmRefresher.CdsBaixaAutomaticaChequePreDT_PAGAMENTO.AsDateTime;
            DmRefresher.CdsMovimentoCaixaDOCUMENTO.AsString      := DmRefresher.CdsBaixaAutomaticaChequePreDOCUMENTO.AsString;
            DmRefresher.CdsMovimentoCaixaHISTORICO.AsString      := DmRefresher.CdsBaixaAutomaticaChequePreHISTORICO.AsString;
            DmRefresher.CdsMovimentoCaixaMESREFERENCIA.AsString  := FormatDateTime('mm', Date);
            DmRefresher.CdsMovimentoCaixaTIPO_MOVIMENTO.AsString := 'C';
            DmRefresher.CdsMovimentoCaixaVALOR.AsFloat           := DmRefresher.CdsBaixaAutomaticaChequePreVL_PAGAMENTO.AsFloat;
            DmRefresher.CdsMovimentoCaixa.ApplyUpdates(0);

            AtualizaSaldo(DmRefresher.CdsSaldo,DmRefresher.CdsSaldoCD_CONTA,DmRefresher.CdsSaldoDATA,DmRefresher.CdsSaldoSALDO,
                          DmRefresher.CdsMovimentoCaixaVALOR.AsFloat,0, DmRefresher.CdsMovimentoCaixaTIPO_MOVIMENTO.AsString, '',
                          DmRefresher.CdsMovimentoCaixaDATA.AsDateTime,DmRefresher.CdsMovimentoCaixaDATA.AsDateTime,
                          DmRefresher.CdsMovimentoCaixaCD_CONTA.AsInteger, 0);
          end;
         DmRefresher.CdsBaixaAutomaticaChequePre.Next;
       end;
      Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Baixando automaticamente os cheques-pre (Refresher)', False, False);
  Except
      Cd_Evento := DmRefresher.GravaEventos(Cd_Evento, 'Baixando automaticamente os cheques-pre (Refresher)', False, True);
  End;
end;


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
        Tabela.ApplyUpdates(0);
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
        Tabela.ApplyUpdates(0);
       end;

     if Data.AsDateTime >= Dataatual then
     begin
       Tabela.edit;
       if TipoAtual='C' then
          Saldo.AsFloat := Saldo.AsFloat + ValorAtual
       else
          Saldo.AsFloat := Saldo.AsFloat - ValorAtual;

       Tabela.ApplyUpdates(0);
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
     Tabela.ApplyUpdates(0);
  end;
end;

procedure TFrmPrincipalRefresher.FecharTodosDataSets;
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
   DmRefresher.SQLConnection1.Close;
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



