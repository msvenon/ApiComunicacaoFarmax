object FrmDownload: TFrmDownload
  Left = 367
  Top = 224
  BorderStyle = bsDialog
  Caption = ' Download de Arquivos'
  ClientHeight = 208
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  DesignSize = (
    448
    208)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 7
    Top = 157
    Width = 225
    Height = 28
    Shape = bsFrame
  end
  object Label4: TLabel
    Left = 48
    Top = 164
    Width = 122
    Height = 13
    Caption = 'Aguarde a Conclus'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Endere'#231'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 52
    Height = 13
    Caption = 'Arquivo :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 94
    Width = 61
    Height = 13
    Caption = 'Tamanho: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 113
    Width = 68
    Height = 13
    Caption = 'Velocidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 132
    Width = 65
    Height = 13
    Caption = 'Executado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object memo1: TMemo
    Left = 238
    Top = 48
    Width = 208
    Height = 139
    Anchors = [akLeft, akTop, akBottom]
    Color = 14155775
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 191
    Width = 448
    Height = 17
    Align = alBottom
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 438
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = 14155775
    TabOrder = 2
    Text = 'http://www.farmax.far.br/download'
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 8
    Top = 64
    Width = 225
    Height = 21
    Color = 14155775
    TabOrder = 3
    Text = 'FirebirdSQL'
  end
  object Button1: TButton
    Left = 306
    Top = -1
    Width = 115
    Height = 25
    Caption = 'Iniciar &Download'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = Button1Click
  end
  object IED: TIEDownload
    About = ' IEDownload http://bsalsa.com/'
    AdditionalHeader.Strings = (
      'Content-Type: application/x-www-form-urlencoded ')
    DefaultProtocol = 'http://'
    DefaultUrlFileName = 'index.html'
    OnBeforeDownload = IEDBeforeDownload
    OnComplete = IEDComplete
    OnError = IEDError
    OnProgress = IEDProgress
    OnTerminate = IEDTerminate
    TimeOut = 2147483647
    UseSystemDownloadFolder = True
    ValidateUrl = True
    Left = 272
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 232
  end
end
