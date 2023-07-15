object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 358
  Width = 679
  object FDConn: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Protocol=TCPIP'
      'Port=3050'
      'Password=masterkey'
      'Server=localhost'
      'Database=D:\FarmaxMatriz\MATRIZ.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object SqlProdutos: TFDQuery
    Connection = FDConn
    Left = 120
    Top = 8
  end
  object SqlFiliais: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select cd_filial,data,hora,cnpj from sp_interligacao')
    Left = 192
    Top = 8
  end
  object sqlClientes: TFDQuery
    Connection = FDConn
    Left = 264
    Top = 8
  end
  object Query: TFDQuery
    Connection = FDConn
    Left = 328
    Top = 12
  end
  object FDConstrole: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      ' SELECT * FROM CONTROLE  WHERE CAMPO=:CAMPO')
    Left = 32
    Top = 80
    ParamData = <
      item
        Position = 1
        Name = 'CAMPO'
        DataType = ftString
        ParamType = ptInput
        Value = 'CD_VENDA'
      end>
  end
  object dspControle: TDataSetProvider
    DataSet = FDConstrole
    Left = 32
    Top = 136
  end
  object cdsControle: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CAMPO'
        ParamType = ptInput
        Value = 'CD_VENDA'
      end>
    ProviderName = 'dspControle'
    Left = 32
    Top = 208
    object cdsControleCAMPO: TStringField
      FieldName = 'CAMPO'
      Required = True
      Size = 30
    end
    object cdsControleVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 416
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 520
    Top = 16
  end
end
