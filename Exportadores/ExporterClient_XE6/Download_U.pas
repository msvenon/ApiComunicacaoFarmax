{ Projeto de exemplo em Delphi para controle de Download
  Caso o download seja parado ou o projeto seja fechado o
  download se re-iniciará de onde parou.  Ramos da Informática }
unit Download_U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, IEDownload, Gauges, ComCtrls;

type
  TFrmDownload = class(TForm)
    memo1: TMemo;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    IED: TIEDownload;
    Timer1: TTimer;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IEDProgress(Sender: TBSCB; ulProgress, ulProgressMax,
      ulStatusCode, FileSize: Cardinal; szStatusText: PWideChar;
      Downloaded, ElapsedTime, Speed, RemainingTime, Status,
      Percent: String);
    procedure IEDError(const ErrorCode: Integer; const stError: String);
    procedure Timer1Timer(Sender: TObject);
    procedure IEDTerminate(const Sender: TBSCB; const ThreadId: Integer;
      const aFileName: WideString; var bCancel: Boolean);
    procedure IEDComplete(Sender: TCustomIEDownload; aFileNameAndPath,
      aFileName, aFolderName, aExtension: WideString;
      const ActiveConnections: Integer);
    procedure IEDBeforeDownload(Sender: TInfoData; const Url, FileName,
      FileExtension, Host, DownloadFolder: String; const FileSize: Integer;
      var Cancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDownload: TFrmDownload;

implementation


{$R *.DFM}

function Retorna_Nome_Arq(Url: string): String;
begin
  Result := StrRScan(PChar(Url), '/');
  Result := Copy(Result, 2, length(Result));
end;

procedure TFrmDownload.Edit1Exit(Sender: TObject);
begin
  Edit2.Text := IED.FileName; // Retorna_Nome_Arq(Edit1.Text);
end;

procedure TFrmDownload.Button1Click(Sender: TObject);
begin
  try
    Timer1.Enabled := False;
    Application.ProcessMessages;
    IED.OpenDownloadFolder := False;
    IED.DownloadFolder := ExtractFilePath(Edit2.Text);
    memo1.Lines.Clear;
    memo1.Lines.Add('Iniciando o Download....');
    if Trim(Edit2.Text) <> '' then
       IED.Go(Edit1.Text, Edit2.Text)
    else
       IED.Go(ExtractFilePath(Edit1.Text));
    Application.ProcessMessages;
  finally
    IED.Free;
    Close;
  end;
end;

procedure TFrmDownload.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Application.ProcessMessages;
end;

procedure TFrmDownload.IEDProgress(Sender: TBSCB; ulProgress,
  ulProgressMax, ulStatusCode, FileSize: Cardinal; szStatusText: PWideChar;
  Downloaded, ElapsedTime, Speed, RemainingTime, Status, Percent: String);
begin
  ProgressBar1.Max := ulProgressMax;
  ProgressBar1.Position := ulProgress;
  Label3.Caption := 'Tamanho: ' + FloatToStr(FileSize/1000) + ' Kb';
  Label5.Caption := 'Velocidade: ' + Speed;
  Label6.Caption := 'Executado: ' + Downloaded;
end;

procedure TFrmDownload.IEDError(const ErrorCode: Integer; const stError: String);
begin
  memo1.Lines.Add('Falha de Comunicação com o site www.farmax.far.br...');
end;

procedure TFrmDownload.Timer1Timer(Sender: TObject);
begin
  Button1Click(Sender);
end;

procedure TFrmDownload.IEDTerminate(const Sender: TBSCB;
  const ThreadId: Integer; const aFileName: WideString;
  var bCancel: Boolean);
begin
  memo1.Lines.Add('Pasta: ' + IED.DownloadFolder);
  memo1.Lines.Add('Nome Arquivo: ' + IED.FileName);
  memo1.Lines.Add('IP: ' + IED.ServerIP);
  memo1.Lines.Add('');
  memo1.Lines.Add('Concluído com Sucesso!');
  Sleep(2000);
end;

procedure TFrmDownload.IEDComplete(Sender: TCustomIEDownload;
  aFileNameAndPath, aFileName, aFolderName, aExtension: WideString;
  const ActiveConnections: Integer);
begin
  if IED.ServerIP = '' then
    memo1.Lines.Add('Falha de Comunicação com o site www.farmax.far.br...');
  Sleep(2000);
end;

procedure TFrmDownload.IEDBeforeDownload(Sender: TInfoData; const Url,
  FileName, FileExtension, Host, DownloadFolder: String;
  const FileSize: Integer; var Cancel: Boolean);
begin
  Application.ProcessMessages;
end;

end.

