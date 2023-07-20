object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'ExporterClientPrincipal'
  ClientHeight = 181
  ClientWidth = 486
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 32
    Width = 129
    Height = 49
    Caption = 'Teste Envio'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 320
    Top = 104
    Width = 129
    Height = 57
    TabOrder = 1
  end
end
