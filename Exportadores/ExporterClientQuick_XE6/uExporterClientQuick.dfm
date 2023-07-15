object FrmExporterClientQuick: TFrmExporterClientQuick
  Left = 0
  Top = 1
  Caption = 'Exportacao da Loja Para Matriz'
  ClientHeight = 1
  ClientWidth = 120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Timer2: TTimer
    Enabled = False
    Interval = 15
    OnTimer = Timer2Timer
    Left = 72
    Top = 24
  end
end
