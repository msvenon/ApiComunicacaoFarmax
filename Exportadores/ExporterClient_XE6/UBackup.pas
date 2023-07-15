unit UBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBServices, IniFiles, TLHelp32, ExtCtrls,
  ComCtrls;

const
  isc_dpb_version1    = 1;
  isc_dpb_user_name   = 28;
  isc_dpb_password    = 29;

  isc_info_end        = 1;
  isc_info_truncated  = 2;
  isc_info_error      = 3;
  isc_info_user_names = 53;

  IBASE_DLL           = 'FBCLIENT.DLL';
  KILOBYTE            = 1024;


type
  ISC_LONG            = Longint;
  ISC_STATUS          = ISC_LONG;
  ISC_STATUS_VECTOR   = array[0..19] of ISC_STATUS;
  PSTATUS_VECTOR      = ^ISC_STATUS_VECTOR;
  PPSTATUS_VECTOR     = ^PSTATUS_VECTOR;

  Tisc_db_handle      = Pointer;
  pisc_db_handle      = ^Tisc_db_handle;

  TParamBlock         = array [0..KILOBYTE-1] of Char;
  TLargePB            = array [0..(4*KILOBYTE)-1] of Char;
  TSmallPB            = array [0..(KILOBYTE div 4)-1] of Char;

  TFrmBackup = class(TForm)
    MmLog: TMemo;
    BtBackup: TBitBtn;
    BtSair: TBitBtn;
    IBBackup: TIBBackupService;
    IBLog: TIBLogService;
    BtPreparaBanco: TBitBtn;
    Panel1: TPanel;
    Timer1: TTimer;
    Label1: TLabel;
    Timer2: TTimer;
    StatusBar1: TStatusBar;
    function ValidaBD : Boolean;
    procedure BtSairClick(Sender: TObject);
    procedure BtBackupClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBackup: TFrmBackup;
  Caminho, NomeServidor, CaminhoBD, Tipo : String;
  Ini : TIniFile;
  PodeSair : Boolean;
  x : integer;

  UserFound: boolean;
  Mode: (mdDBName, mdUserName, mdPassword);
  s, DBName, UserName, Password: string;

  ErrorCode: ISC_STATUS;
  StatusVector: ISC_STATUS_VECTOR;
  DBHandle: Tisc_db_handle;
  DPB: TParamBlock;        //parameter block for database connection
  DPBLen: Integer;         //length of Paramblock
  ItemList:  TSmallPB;
  UserNames: TLargePB;
  UserCount: Integer;

  bSucesso, ArquivoBackup : String;

  Item,           //InfoItem we are testing for
  Posicao,            //marker for position in array
  Len,            //Length of section
  namelength: SmallInt;
  UserStr: array[0..255] of char;

implementation

uses UPrincipal, uDmTrigger;

{$R *.dfm}


function TFrmBackup.ValidaBD;
var
 Data, Hora : String;
 ServerName, DatabaseName : String;
begin
    Result := True;
    Data := FormatDateTime('ddmmyyyy',Date);
    Hora := FormatDateTime('hhmmss',Time);
    Posicao := Pos(':', DM.SQLConn.Params.Values['Database']);
    ServerName := Copy(DM.SQLConn.Params.Values['Database'], 1, Posicao - 1);
    DatabaseName := Copy(DM.SQLConn.Params.Values['Database'], Posicao + 1, Length(DM.SQLConn.Params.Values['Database']));
    IBBackup.ServerName := ServerName;
    IBBackup.DatabaseName := DatabaseName;
    if not DirectoryExists(ExtractFilePath(IBBackup.DatabaseName)+'Backups') then
       CreateDir(ExtractFilePath(IBBackup.DatabaseName)+'Backups');
    ArquivoBackup := ExtractFilePath(IBBackup.DatabaseName)+'Backups\'+'Backup'+Data+Hora+'.fbk';
    IBBackup.BackupFile.Add(ArquivoBackup);
end;


function isc_interprete(buffer: PChar; status_vector_ptr: PPSTATUS_VECTOR): ISC_STATUS;
  stdcall; external IBASE_DLL name 'isc_interprete';

function isc_attach_database(status_vector: PSTATUS_VECTOR; db_name_length: Short;
  db_name: PChar; db_handle: pisc_db_handle; parm_buffer_length: Short;
  parm_buffer: PChar): ISC_STATUS; stdcall; external IBASE_DLL name 'isc_attach_database';

function isc_database_info(status_vector: PSTATUS_VECTOR; db_handle: pisc_db_handle;
  item_list_buffer_length: Smallint; item_list_buffer: Pointer;
  result_buffer_length: Smallint; result_buffer: Pointer): ISC_STATUS;
  stdcall; external IBASE_DLL name 'isc_database_info';

function isc_vax_integer(result_buffer : PChar; result_length : SmallInt): ISC_LONG;
  stdcall; external IBASE_DLL name 'isc_vax_integer';

function isc_detach_database(status_vector: PSTATUS_VECTOR; db_handle:
  pisc_db_handle): ISC_STATUS; stdcall; external IBASE_DLL name 'isc_detach_database';
procedure Error;
  var
    buffer: array[0..511] of char;
    ErrorMessages, lastMsg: string;
    pStatus: PSTATUS_VECTOR;
  begin
    fillchar(buffer,512,#0);
    pStatus:=@StatusVector;
    ErrorMessages:='';
    repeat
      ErrorCode := isc_interprete( @buffer, @pstatus);
      if lastMsg <> strPas( buffer) then
      begin
        lastMsg := strPas( buffer);
        if length(ErrorMessages) <> 0 then ErrorMessages := ErrorMessages+#13#10;
        ErrorMessages := ErrorMessages+lastMsg;
      end;
    until ErrorCode = 0;
    raise Exception.Create(ErrorMessages);
  end;

  procedure BuildPBString( var PB: array of char; var PBLen: Integer; item: byte; contents: string);
  //Add a string value to a parameter block
  var len: Integer;
  begin
    PB[PBLen] := char(item);
    inc(PBLen);
    len:=Length(Contents);
    PB[PBLen] := char(len);
    inc(PBLen);
    StrPCopy(@PB[PBLen],Contents);
    inc(PBLen,len);
  end;


procedure TFrmBackup.Timer1Timer(Sender: TObject);
var i : integer;
begin
  inc(x);
  if x > 8 then
    x := 1;
  Label1.Caption := 'Aguarde';
  for i := 1 to x do
      Label1.Caption := Label1.Caption + '.';
  Application.ProcessMessages;
end;

procedure TFrmBackup.FormShow(Sender: TObject);
begin
  FrmBackup.Paint;
  FrmBackup.Repaint;
  FrmBackup.Refresh;
  Application.ProcessMessages;
  bSucesso := 'N';
  Application.ProcessMessages;
end;

procedure TFrmBackup.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if PodeSair then
    BtBackupClick(Sender);

  BtSairClick(Sender);
end;

procedure TFrmBackup.BtBackupClick(Sender: TObject);
begin
  BtPreparaBanco.Enabled := False;
  BtBackup.Enabled := False;
  BtSair.Enabled := False;
  Application.ProcessMessages;
  Try
    Cd_Evento := 0;
    Cd_Evento := Form1.GravaEventos(Cd_Evento, 'Fazendo bakup no inicio do dia (Trigger) ', True, False);

    IBBackup.Active := True;

    IBBackup.ServiceStart;
    Application.ProcessMessages;
    while not IBBackup.Eof do
     begin
        Application.ProcessMessages;
        MmLog.Lines.Add(IBBackup.GetNextLine);
     end;

    bSucesso := 'S';
    IBBackup.Active := False;
    Cd_Evento := Form1.GravaEventos(Cd_Evento, 'Fazendo bakup no inicio do dia (Trigger) ', False, False);
  Except
      IBBackup.Active := False;
      Application.ProcessMessages;
      bSucesso := 'N';
      Cd_Evento := Form1.GravaEventos(Cd_Evento, 'Fazendo bakup no inicio do dia (Trigger) ', False, True);
  End;
end;



procedure TFrmBackup.BtSairClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  Close;
end;


procedure TFrmBackup.FormCreate(Sender: TObject);
begin
  PodeSair := ValidaBD;
end;

procedure TFrmBackup.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE : if BtSair.Enabled then Close;
  end;
end;


end.
