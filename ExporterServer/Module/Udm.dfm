object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 528
  Width = 881
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
    Left = 24
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
    Left = 624
    Top = 20
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
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 416
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 520
    Top = 16
  end
  object dspControle: TDataSetProvider
    DataSet = FDConstrole
    Left = 24
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
    Left = 16
    Top = 184
    object cdsControleCAMPO: TStringField
      FieldName = 'CAMPO'
      Required = True
      Size = 30
    end
    object cdsControleVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object FDStored: TFDStoredProc
    Connection = FDConn
    Left = 688
    Top = 35
  end
  object SqlAtualizaClientes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_CLIENTES('
      '        :CD_FILIAL,'
      '        :CD_CLIENTE,'
      '        :CD_VENDEDOR,'
      '        :CD_CONVENIO,'
      '        :NOME,'
      '        :ENDERECO,'
      '        :BAIRRO,'
      '        :CIDADE,'
      '        :UF,'
      '        :CEP,'
      '        :CAIXA_POSTAL,'
      '        :FONE,'
      '        :FAX,'
      '        :CONTATO,'
      '        :CNPJ,'
      '        :INSCRICAO,'
      '        :PRACA,'
      '        :DATA_FICHA,'
      '        :RG,'
      '        :CPF,'
      '        :TITULO_ELEITO,'
      '        :DT_NASCIMENTO,'
      '        :SEXO,'
      '        :ESTADO_CIVIL,'
      '        :NATURALIDADE,'
      '        :FILIACAO,'
      '        :NUMERO_DEPENDENTES,'
      '        :CONJUGE,'
      '        :DT_NASC_CONJUGE,'
      '        :ALUGUEL,'
      '        :VL_ALUGUEL,'
      '        :TEMPO_RESIDENCIA,'
      '        :EMPRESA,'
      '        :FONE_COMERCIAL,'
      '        :DT_ADMISSAO,'
      '        :CEP_COMERCIAL,'
      '        :CIDADE_COMERCIAL,'
      '        :UF_COMERCIAL,'
      '        :FUNCAO,'
      '        :EMPRESA_ANTERIOR,'
      '        :TEMPO_SERVICO,'
      '        :REFERENCIA_COMERCIAL,'
      '        :REFERENCIA_BANCARIA,'
      '        :CONSULTA_SPC,'
      '        :OBSERVACAO_SPC,'
      '        :OBSERVACAO_GERAL,'
      '        :ENDERECO_COBRANCA,'
      '        :BAIRRO_COBRANCA,'
      '        :CIDADE_COBRANCA,'
      '        :UF_COBRANCA,'
      '        :CEP_COBRANCA,'
      '        :ICMS_IPI,'
      '        :NOME_MAE,'
      '        :MES_NASCIMENTO,'
      '        :RENDA,'
      '        :LIMITE_PERCENTUAL,'
      '        :LIMITE_CREDITO,'
      '        :EMAIL,'
      '        :HOMEPAGE,'
      '        :MATRICULA,'
      '        :SALDO,'
      '        :DT_VENCIMENTO,'
      '        :DESCONTO,'
      '        :DT_ULTIMA_COMPRA,'
      '        :STATUS,'
      '        :REFERENCIA,'
      '        :DT_ALTERACAO,'
      '        :COMPRAOUTRALOJA,'
      '        :CARTAOFIDELIDADE,'
      '        :ENVIADO,'
      '        :NUMERO,'
      '        :COMPLEMENTO,'
      '        :CD_MUNICIPIO,'
      '        :CD_PAIS,'
      '        :ID_PERFIL_CLIENTE)')
    Left = 120
    Top = 88
    ParamData = <
      item
        Name = 'CD_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_VENDEDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_CONVENIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 35
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Name = 'CAIXA_POSTAL'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end
      item
        Name = 'PRACA'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Name = 'DATA_FICHA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'RG'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Name = 'TITULO_ELEITO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Name = 'DT_NASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'SEXO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'ESTADO_CIVIL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'NATURALIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'FILIACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NUMERO_DEPENDENTES'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CONJUGE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'DT_NASC_CONJUGE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'ALUGUEL'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'VL_ALUGUEL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TEMPO_RESIDENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'FONE_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'DT_ADMISSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CEP_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Name = 'CIDADE_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 35
      end
      item
        Name = 'UF_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'FUNCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'EMPRESA_ANTERIOR'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'TEMPO_SERVICO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'REFERENCIA_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'REFERENCIA_BANCARIA'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'CONSULTA_SPC'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'OBSERVACAO_SPC'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'OBSERVACAO_GERAL'
        DataType = ftString
        ParamType = ptInput
        Size = 254
      end
      item
        Name = 'ENDERECO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'BAIRRO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CIDADE_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 35
      end
      item
        Name = 'UF_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CEP_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Name = 'ICMS_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'NOME_MAE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'MES_NASCIMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'RENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'LIMITE_PERCENTUAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'LIMITE_CREDITO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 45
      end
      item
        Name = 'HOMEPAGE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_ULTIMA_COMPRA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'COMPRAOUTRALOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CARTAOFIDELIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_MUNICIPIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CD_PAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'ID_PERFIL_CLIENTE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object FDMemTableClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 120
    Top = 152
  end
end
