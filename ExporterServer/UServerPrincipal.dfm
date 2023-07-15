object ServerPrincipal: TServerPrincipal
  Left = 0
  Top = 0
  Caption = 'ServerMonitoramento'
  ClientHeight = 166
  ClientWidth = 391
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpbStart: TSpeedButton
    Left = 49
    Top = 52
    Width = 89
    Height = 34
    Caption = 'start'
    OnClick = SpbStartClick
  end
  object SpbStop: TSpeedButton
    Left = 145
    Top = 52
    Width = 89
    Height = 34
    Caption = 'stop'
    OnClick = SpbStopClick
  end
  object Label1: TLabel
    Left = 50
    Top = 24
    Width = 28
    Height = 16
    Caption = 'Port:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditPort: TEdit
    Left = 85
    Top = 22
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '9000'
  end
  object Memo1: TMemo
    Left = 304
    Top = 109
    Width = 49
    Height = 49
    TabOrder = 1
  end
end
