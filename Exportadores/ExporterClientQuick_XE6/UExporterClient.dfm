object FrmExporterClient: TFrmExporterClient
  Left = 1
  Top = 2
  Width = 113
  Height = 28
  Caption = 'FrmExporterClient'
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
    Interval = 1
    OnTimer = Timer2Timer
    Left = 8
  end
  object RxTrayIcon1: TRxTrayIcon
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000070707070000000000000000000000007070707070000000000000000
      0000007070222270700000000000000000000007022222270700000000000000
      0000007022222222700000000000000000000007222222220700000000000000
      0000007022222222700000000000000000000007222222220700000000000000
      0707007072222220700070700000000000000007072222070700000000000000
      0000007070707070700000000000000000000007073333070700000000000000
      0000007073333330700000000000000000000007333333330700000000000000
      0000007033333333700000000000000000000007333333330700000000000000
      0000007033333333700000000000000007070007033333370700707000000000
      0000007070333370700000000000000000000007078888070700000000000000
      0000007078999980700000000000000000000007899999980700000000000000
      0000007899999999800000000000000000000008999999998700000000000000
      0000007899999999800000000000000000000008999999998700000000000000
      0707007089999998700070700000000000000007089999870700000000000000
      000000007088887070000000000000000000000000000000000000000000FFF8
      1FFFFFF00FFFFFE007FFFFC003FFFF0000FFFC00003FF800001FF000000FF000
      000FE0000007E0000007F000000FFF8001FFFF0000FFFC00003FF800001FF000
      000FF000000FE0000007E0000007F000000FFF8001FFFF0000FFFC00003FF800
      001FF000000FF000000FE0000007E0000007F000000FFFC003FFFFE007FF}
    Icons.Icons = {
      03000000FE0200000000010001002020100000000000E8020000160000002800
      0000200000004000000001000400000000008002000000000000000000000000
      0000000000000000000000008000008000000080800080000000800080008080
      000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000007070707000000000000000000000000707070707
      0000000000000000000000707022227070000000000000000000000702222227
      0700000000000000000000702222222270000000000000000000000722222222
      0700000000000000000000702222222270000000000000000000000722222222
      0700000000000000070700707222222070007070000000000000000707222207
      0700000000000000000000707070707070000000000000000000000707333307
      0700000000000000000000707333333070000000000000000000000733333333
      0700000000000000000000703333333370000000000000000000000733333333
      0700000000000000000000703333333370000000000000000707000703333337
      0700707000000000000000707033337070000000000000000000000707888807
      0700000000000000000000707899998070000000000000000000000789999998
      0700000000000000000000789999999980000000000000000000000899999999
      8700000000000000000000789999999980000000000000000000000899999999
      8700000000000000070700708999999870007070000000000000000708999987
      0700000000000000000000007088887070000000000000000000000000000000
      000000000000FFF81FFFFFF00FFFFFE007FFFFC003FFFF0000FFFC00003FF800
      001FF000000FF000000FE0000007E0000007F000000FFF8001FFFF0000FFFC00
      003FF800001FF000000FF000000FE0000007E0000007F000000FFF8001FFFF00
      00FFFC00003FF800001FF000000FF000000FE0000007E0000007F000000FFFC0
      03FFFFE007FFFE0200000000010001002020100000000000E802000016000000
      2800000020000000400000000100040000000000800200000000000000000000
      0000000000000000000000000000800000800000008080008000000080008000
      8080000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00
      FFFF0000FFFFFF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000707070700000000000000000000000070707
      0707000000000000000000000070702222707000000000000000000000070222
      2227070000000000000000000070222222227000000000000000000000072222
      2222070000000000000000000070222222227000000000000000000000072222
      2222070000000000000007070070722222207000707000000000000000070722
      22070700000000000000000000707088887070000000000000000000000708BB
      BB870700000000000000000000708BBBBBB8700000000000000000000008BBBB
      BBBB870000000000000000000078BBBBBBBB800000000000000000000008BBBB
      BBBB870000000000000000000078BBBBBBBB8000000000000000070700078BBB
      BBB807007070000000000000007078BBBB807000000000000000000000070788
      8807070000000000000000000070701111707000000000000000000000070111
      1117070000000000000000000070111111117000000000000000000000071111
      1111070000000000000000000070111111117000000000000000000000071111
      1111070000000000000007070070711111107000707000000000000000070711
      1107070000000000000000000000707070707000000000000000000000000000
      0000000000000000FFF81FFFFFF00FFFFFE007FFFFC003FFFF0000FFFC00003F
      F800001FF000000FF000000FE0000007E0000007F000000FFF8001FFFF0000FF
      FC00003FF800001FF000000FF000000FE0000007E0000007F000000FFF8001FF
      FF0000FFFC00003FF800001FF000000FF000000FE0000007E0000007F000000F
      FFC003FFFFE007FFFE0200000000010001002020100000000000E80200001600
      0000280000002000000040000000010004000000000080020000000000000000
      0000000000000000000000000000000080000080000000808000800000008000
      80008080000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000070707070000000000000000000000007
      0788880700000000000000000000007078AABA80700000000000000000000007
      8ABAAAB8070000000000000000000078BAAABAAA800000000000000000000008
      AABAAABA870000000000000000000078BAAABAAA800000000000000000000008
      AABAAABA8700000000000000070700708AAABAA8700070700000000000000007
      08BAAA8707000000000000000000007070888870700000000000000000000007
      0733330707000000000000000000007073333330700000000000000000000007
      3333333307000000000000000000007033333333700000000000000000000007
      3333333307000000000000000000007033333333700000000000000007070007
      0333333707007070000000000000007070333370700000000000000000000007
      0707070707000000000000000000007070111170700000000000000000000007
      0111111707000000000000000000007011111111700000000000000000000007
      1111111107000000000000000000007011111111700000000000000000000007
      1111111107000000000000000707007071111110700070700000000000000007
      0711110707000000000000000000000070707070700000000000000000000000
      00000000000000000000FFF81FFFFFF00FFFFFE007FFFFC003FFFF0000FFFC00
      003FF800001FF000000FF000000FE0000007E0000007F000000FFF8001FFFF00
      00FFFC00003FF800001FF000000FF000000FE0000007E0000007F000000FFF80
      01FFFF0000FFFC00003FF800001FF000000FF000000FE0000007E0000007F000
      000FFFC003FFFFE007FF}
    Left = 48
  end
  object HTTPRIO1: THTTPRIO
    URL = 
      'http://farmax.ddns.com.br/ExporterServer/ExporterServer.exe/soap' +
      '/IDm'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 120
    Top = 6
  end
  object HTTPRIO2: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 216
    Top = 8
  end
end