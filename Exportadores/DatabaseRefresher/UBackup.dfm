object FrmBackup: TFrmBackup
  Left = 569
  Top = 220
  BorderStyle = bsDialog
  Caption = 'Backup de Banco de Dados'
  ClientHeight = 343
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MmLog: TMemo
    Left = 0
    Top = 40
    Width = 345
    Height = 233
    ReadOnly = True
    TabOrder = 0
  end
  object BtBackup: TBitBtn
    Left = 15
    Top = 290
    Width = 106
    Height = 25
    Caption = 'Iniciar Backup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtBackupClick
  end
  object BtSair: TBitBtn
    Left = 217
    Top = 290
    Width = 106
    Height = 25
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtSairClick
  end
  object BtPreparaBanco: TBitBtn
    Left = 8
    Top = 8
    Width = 321
    Height = 25
    Caption = 'Preparar banco para backup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 59
    Top = 140
    Width = 222
    Height = 38
    BevelWidth = 2
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    object Label1: TLabel
      Left = 68
      Top = 8
      Width = 79
      Height = 22
      Caption = 'Aguarde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 324
    Width = 340
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Panels = <
      item
        Width = 300
      end>
    UseSystemFont = False
  end
  object IBBackup: TIBBackupService
    Protocol = TCP
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    TraceFlags = []
    Verbose = True
    BlockingFactor = 0
    Options = []
    Left = 64
    Top = 96
  end
  object IBLog: TIBLogService
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    TraceFlags = []
    Left = 120
    Top = 192
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 200
    Top = 64
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 216
    Top = 208
  end
end
