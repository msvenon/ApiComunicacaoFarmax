object FrmExporterClient: TFrmExporterClient
  Left = 1
  Top = 2
  Caption = 'FrmExporterClient'
  ClientHeight = 142
  ClientWidth = 205
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
  object HTTPRIO1: THTTPRIO
    URL = 
      'http://farmax.ddns.com.br/ExporterServer/ExporterServer.exe/soap' +
      '/IDm'
    HTTPWebNode.URL = 
      'http://farmax.ddns.com.br/ExporterServer/ExporterServer.exe/soap' +
      '/IDm'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 64
    Top = 6
  end
  object HTTPRIO2: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 120
    Top = 8
  end
end
