object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 590
  Width = 1490
  object FDConn: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Protocol=TCPIP'
      'Port=3050'
      'Password=masterkey'
      'Server=localhost'
      'Database=D:\FarmaxMatriz\MATRIZ.FDB'
      'DriverID=FB')
    Connected = True
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
    Left = 29
    Top = 122
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
    Left = 29
    Top = 166
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
  object FDCeCadFin: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' CONTAS_RECEBER.*'
      'FROM '
      ' CONTAS_RECEBER, '
      ' TEMP_PRODUTOS2'
      'WHERE'
      ' CONTAS_RECEBER.CD_CONTAS_RECEBER = TEMP_PRODUTOS2.ID_PRODUTO')
    Left = 192
    Top = 81
  end
  object dspCeCadFin: TDataSetProvider
    DataSet = FDCeCadFin
    Left = 190
    Top = 123
  end
  object cdsCeCadFin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCeCadFin'
    Left = 184
    Top = 169
  end
  object FDCeLotes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '   LANCAMENTOS.ID_PRODUTO,'
      '   LANCAMENTOS.CD_FILIAL,'
      '   LANCAMENTOS.CD_PRODUTO,'
      '   LANCAMENTOS.DESCRICAO,'
      '   LANCAMENTOS.CD_LABORATORIO,'
      '   LANCAMENTOS.CD_GRUPO,'
      '   LANCAMENTOS.CD_CONVENIO,'
      '   LANCAMENTOS.CD_CLIENTE,'
      '   LANCAMENTOS.CD_VENDEDOR,'
      '   LANCAMENTOS.CD_OPERADOR,'
      '   LANCAMENTOS.CD_USUARIO,'
      '   LANCAMENTOS.CD_FORMA_PAGAMENTO,'
      '   LANCAMENTOS.CD_VENDA,'
      
        '   CAST(LANCAMENTOS.CUSTO_MEDIO AS NUMERIC(10,2)) AS CUSTO_MEDIO' +
        ','
      
        '   CAST(LANCAMENTOS.CUSTO_UNITARIO AS NUMERIC(10,2)) AS CUSTO_UN' +
        'ITARIO,'
      '   LANCAMENTOS.DATA_LANCAMENTO,'
      '   LANCAMENTOS.DATA_CAIXA,'
      '   LANCAMENTOS.QUANTIDADE,'
      '   CAST(LANCAMENTOS.VALOR AS NUMERIC(10,2)) AS VALOR,'
      '   LANCAMENTOS.NOTA_FISCAL,'
      '   CAST(LANCAMENTOS.DESCONTO AS NUMERIC(10,2)) AS DESCONTO,'
      '   CAST(LANCAMENTOS.PROMOCAO AS NUMERIC(10,2)) AS PROMOCAO,'
      '   LANCAMENTOS.TIPO_VENDA,'
      '   LANCAMENTOS.TIPO_PAGAMENTO,'
      '   LANCAMENTOS.ENTRADA_SAIDA,'
      '   LANCAMENTOS.ETIQUETA,'
      '   LANCAMENTOS.ENTREGA,'
      '   LANCAMENTOS.HORA,'
      '   LANCAMENTOS.ESTOQUE_POSVENDA,'
      '   LANCAMENTOS.TROCA,'
      '   LANCAMENTOS.ENVIADO,'
      '   LANCAMENTOS.NUMERO,'
      '   LANCAMENTOS.TERMINAL,'
      '   LANCAMENTOS.USUARIO,'
      '   LANCAMENTOS.CD_LANCAMENTO,'
      '   CAST(LANCAMENTOS.COMISSAO AS NUMERIC(10,2)) AS COMISSAO,'
      
        '   CAST(LANCAMENTOS.ARREDONDAMENTO AS NUMERIC(10,2)) AS ARREDOND' +
        'AMENTO,'
      '   LANCAMENTOS.CD_CLASSE,'
      '   LANCAMENTOS.ID_OPERADORCAIXA,'
      '   LANCAMENTOS.OBSERVACAO,'
      '   LANCAMENTOS.TRN,'
      '   LANCAMENTOS.TRANSACAOTRN,'
      '   LANCAMENTOS.LOTETRN,'
      '   LANCAMENTOS.AUTORIZACAOTRN,'
      '   LANCAMENTOS.SUBSIDIOTRN,'
      '   LANCAMENTOS.NOTAMANUAL,'
      '   LANCAMENTOS.CD_FILIAL_ORIGEM,'
      '   LANCAMENTOS.ID_PRODUTO_LOTE,'
      '   LANCAMENTOS.NCM,'
      '   LANCAMENTOS.CFOP,'
      '   LANCAMENTOS.CST,'
      '   LANCAMENTOS.ICMS,'
      '   LANCAMENTOS.CODIGO_BARRAS,'
      '   LANCAMENTOS.ECF,'
      '   LANCAMENTOS.CD_SUBGRUPO,'
      '   LANCAMENTOS.SERIE_NOTA_FISCAL,'
      '   LANCAMENTOS.ID_CLIENTE_PROPRIEDADE,'
      '   LANCAMENTOS.CEST,'
      '   LANCAMENTOS.FCP,'
      '   LANCAMENTOS.PERCENTUALREDUCAO,'
      '   LANCAMENTOS. COMPOSTO,'
      '   LANCAMENTOS.ID_PRODUTO_PRINCIPAL,'
      '   LANCAMENTOS.VENDA_FIDELIDADE,'
      '   LANCAMENTOS.VENDA_QUANTIDADE,'
      '   LANCAMENTOS.IFOOD,'
      '   LANCAMENTOS.FARMACIASAPP'
      'FROM '
      '  LANCAMENTOS,'
      '  TEMP_LANCAMENTOS2'
      'WHERE'
      ' LANCAMENTOS.CD_LANCAMENTO = TEMP_LANCAMENTOS2.CD_LANCAMENTO')
    Left = 272
    Top = 82
  end
  object FdqNumeroLancamentosLoja: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'SELECT  COUNT(*) FROM LANCAMENTOS WHERE DATA_LANCAMENTO >= CURRE' +
        'NT_DATE - 1')
    Left = 371
    Top = 80
  end
  object dspNUmeroLancamentosLoja: TDataSetProvider
    DataSet = FdqNumeroLancamentosLoja
    Left = 372
    Top = 127
  end
  object cdsNumeroLancamentosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNUmeroLancamentosLoja'
    Left = 371
    Top = 169
    object cdsNumeroLancamentosLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
    end
  end
  object cdsCdLancamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 219
  end
  object FdLancamentosLoja: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'SELECT  CD_LANCAMENTO FROM LANCAMENTOS WHERE  DATA_LANCAMENTO >=' +
        ' CURRENT_DATE - 1')
    Left = 494
    Top = 81
  end
  object dspLancamentosLoja: TDataSetProvider
    DataSet = FdLancamentosLoja
    Left = 496
    Top = 126
  end
  object cdsLancamentosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLancamentosLoja'
    Left = 496
    Top = 173
    object cdsLancamentosLojaCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object dspCeLotes: TDataSetProvider
    DataSet = FDCeLotes
    Left = 272
    Top = 124
  end
  object cdsCelotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCeLotes'
    Left = 268
    Top = 168
    object cdsCelotesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsCelotesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object cdsCelotesCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 6
    end
    object cdsCelotesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsCelotesCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object cdsCelotesCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object cdsCelotesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object cdsCelotesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object cdsCelotesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object cdsCelotesCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object cdsCelotesCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object cdsCelotesCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object cdsCelotesCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object cdsCelotesCUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotesCUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotesDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object cdsCelotesDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object cdsCelotesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsCelotesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotesNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object cdsCelotesDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotesPROMOCAO: TFMTBCDField
      FieldName = 'PROMOCAO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotesTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object cdsCelotesTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 1
    end
    object cdsCelotesENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
      Size = 1
    end
    object cdsCelotesETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 1
    end
    object cdsCelotesENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object cdsCelotesHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object cdsCelotesESTOQUE_POSVENDA: TFloatField
      FieldName = 'ESTOQUE_POSVENDA'
    end
    object cdsCelotesTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object cdsCelotesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object cdsCelotesNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object cdsCelotesTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object cdsCelotesUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object cdsCelotesCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object cdsCelotesCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotesARREDONDAMENTO: TFMTBCDField
      FieldName = 'ARREDONDAMENTO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object cdsCelotesID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object cdsCelotesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsCelotesTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object cdsCelotesTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object cdsCelotesLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object cdsCelotesAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object cdsCelotesSUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object cdsCelotesNOTAMANUAL: TStringField
      FieldName = 'NOTAMANUAL'
      Size = 1
    end
    object cdsCelotesCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object cdsCelotesID_PRODUTO_LOTE: TFloatField
      FieldName = 'ID_PRODUTO_LOTE'
    end
    object cdsCelotesNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object cdsCelotesCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cdsCelotesCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object cdsCelotesICMS: TStringField
      FieldName = 'ICMS'
      Size = 4
    end
    object cdsCelotesCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 14
    end
    object cdsCelotesECF: TStringField
      FieldName = 'ECF'
    end
    object cdsCelotesCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object cdsCelotesSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object cdsCelotesID_CLIENTE_PROPRIEDADE: TFloatField
      FieldName = 'ID_CLIENTE_PROPRIEDADE'
    end
    object cdsCelotesCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object cdsCelotesFCP: TFMTBCDField
      FieldName = 'FCP'
      Precision = 18
      Size = 2
    end
    object cdsCelotesPERCENTUALREDUCAO: TFMTBCDField
      FieldName = 'PERCENTUALREDUCAO'
      Precision = 18
      Size = 2
    end
    object cdsCelotesCOMPOSTO: TStringField
      FieldName = 'COMPOSTO'
      Size = 1
    end
    object cdsCelotesID_PRODUTO_PRINCIPAL: TFloatField
      FieldName = 'ID_PRODUTO_PRINCIPAL'
    end
    object cdsCelotesVENDA_FIDELIDADE: TStringField
      FieldName = 'VENDA_FIDELIDADE'
      Size = 1
    end
    object cdsCelotesVENDA_QUANTIDADE: TStringField
      FieldName = 'VENDA_QUANTIDADE'
      Size = 1
    end
    object cdsCelotesIFOOD: TStringField
      FieldName = 'IFOOD'
      Size = 1
    end
    object cdsCelotesFARMACIASAPP: TStringField
      FieldName = 'FARMACIASAPP'
      Size = 1
    end
  end
  object FdParametros: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM PARAMETROS')
    Left = 115
    Top = 86
  end
  object dpParametros: TDataSetProvider
    DataSet = FdParametros
    Left = 114
    Top = 124
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpParametros'
    Left = 109
    Top = 168
    object cdsParametrosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object cdsParametrosTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
    object cdsParametrosCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Size = 4
    end
    object cdsParametrosNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 30
    end
    object cdsParametrosRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 40
    end
    object cdsParametrosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object cdsParametrosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object cdsParametrosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object cdsParametrosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsParametrosCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsParametrosCX_POSTAL: TStringField
      FieldName = 'CX_POSTAL'
      Size = 5
    end
    object cdsParametrosCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object cdsParametrosINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object cdsParametrosFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object cdsParametrosFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object cdsParametrosINSC_MUNIC: TStringField
      FieldName = 'INSC_MUNIC'
      Size = 10
    end
    object cdsParametrosURL1: TStringField
      FieldName = 'URL1'
      Size = 1000
    end
    object cdsParametrosURL2: TStringField
      FieldName = 'URL2'
      Size = 1000
    end
    object cdsParametrosURL3: TStringField
      FieldName = 'URL3'
      Size = 1000
    end
    object cdsParametrosURL4: TStringField
      FieldName = 'URL4'
      Size = 1000
    end
    object cdsParametrosURL5: TStringField
      FieldName = 'URL5'
      Size = 1000
    end
    object cdsParametrosMENS_PROM2: TStringField
      FieldName = 'MENS_PROM2'
      Size = 48
    end
    object cdsParametrosMENS_PROM3: TStringField
      FieldName = 'MENS_PROM3'
      Size = 48
    end
    object cdsParametrosMENS_PROM4: TStringField
      FieldName = 'MENS_PROM4'
      Size = 48
    end
    object cdsParametrosMENS_PROM5: TStringField
      FieldName = 'MENS_PROM5'
      Size = 48
    end
    object cdsParametrosFOTO: TStringField
      FieldName = 'FOTO'
      Size = 1
    end
    object cdsParametrosCAMINHOMATRIZ: TStringField
      FieldName = 'CAMINHOMATRIZ'
      Size = 255
    end
    object cdsParametrosCUSTO_OPERACIONAL: TFloatField
      FieldName = 'CUSTO_OPERACIONAL'
    end
    object cdsParametrosPERCENTUAL_SIMPLES: TFloatField
      FieldName = 'PERCENTUAL_SIMPLES'
    end
    object cdsParametrosCALCULO_CUSTO: TStringField
      FieldName = 'CALCULO_CUSTO'
      Size = 1
    end
    object cdsParametrosCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 50
    end
    object cdsParametrosCONTRA_CHAVE: TStringField
      FieldName = 'CONTRA_CHAVE'
      Size = 50
    end
    object cdsParametrosDT_IMPLANTACAO: TStringField
      FieldName = 'DT_IMPLANTACAO'
      Size = 50
    end
    object cdsParametrosDT_AUTENTICACAO: TStringField
      FieldName = 'DT_AUTENTICACAO'
      Size = 50
    end
    object cdsParametrosCD_IMPRESSORA: TFloatField
      FieldName = 'CD_IMPRESSORA'
    end
    object cdsParametrosETIQUETA_TIPO: TFloatField
      FieldName = 'ETIQUETA_TIPO'
    end
    object cdsParametrosETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 40
    end
    object cdsParametrosDESCONTOMAXIMO: TFloatField
      FieldName = 'DESCONTOMAXIMO'
    end
    object cdsParametrosIMPRIME_PREVENDA: TStringField
      FieldName = 'IMPRIME_PREVENDA'
      Size = 1
    end
    object cdsParametrosPREVENDA: TStringField
      FieldName = 'PREVENDA'
      Size = 1
    end
    object cdsParametrosDESCONTOGERENTE: TFloatField
      FieldName = 'DESCONTOGERENTE'
    end
    object cdsParametrosNVIASCUPOMENTREGA: TFloatField
      FieldName = 'NVIASCUPOMENTREGA'
    end
    object cdsParametrosTEMPODESCANSO: TFloatField
      FieldName = 'TEMPODESCANSO'
    end
    object cdsParametrosCHAVEF10: TStringField
      FieldName = 'CHAVEF10'
      Size = 50
    end
    object cdsParametrosRESUMOCAIXA_ITEM_1: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_1'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_2: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_2'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_3: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_3'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_4: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_4'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_5: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_5'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_6: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_6'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_7: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_7'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_8: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_8'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_9: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_9'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_10: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_10'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_11: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_11'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_12: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_12'
      Size = 1
    end
    object cdsParametrosIMPRIMEORCAMENTO: TStringField
      FieldName = 'IMPRIMEORCAMENTO'
      Size = 1
    end
    object cdsParametrosTIPODESCONTO: TStringField
      FieldName = 'TIPODESCONTO'
      Size = 1
    end
    object cdsParametrosURLCOTACOES: TStringField
      FieldName = 'URLCOTACOES'
      Size = 100
    end
    object cdsParametrosSMTP: TStringField
      FieldName = 'SMTP'
      Size = 100
    end
    object cdsParametrosUSUARIO_SMTP: TStringField
      FieldName = 'USUARIO_SMTP'
      Size = 100
    end
    object cdsParametrosSENHA_SMTP: TStringField
      FieldName = 'SENHA_SMTP'
      Size = 50
    end
    object cdsParametrosNAOFISCAL: TFloatField
      FieldName = 'NAOFISCAL'
    end
    object cdsParametrosETIQUETAS_PRN: TFloatField
      FieldName = 'ETIQUETAS_PRN'
    end
    object cdsParametrosVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      Size = 1
    end
    object cdsParametrosPEDECRMBALCAO: TStringField
      FieldName = 'PEDECRMBALCAO'
      Size = 1
    end
    object cdsParametrosPEDECRMCHECKOUT: TStringField
      FieldName = 'PEDECRMCHECKOUT'
      Size = 1
    end
    object cdsParametrosGERARCR_TRANSFER: TStringField
      FieldName = 'GERARCR_TRANSFER'
      Size = 1
    end
    object cdsParametrosGERARCP_TRANSFER: TStringField
      FieldName = 'GERARCP_TRANSFER'
      Size = 1
    end
    object cdsParametrosLIMITEDECREDITO: TFloatField
      FieldName = 'LIMITEDECREDITO'
    end
    object cdsParametrosSERVIDORMATRIZ: TStringField
      FieldName = 'SERVIDORMATRIZ'
      Size = 100
    end
    object cdsParametrosESTOQUEMINIMO: TStringField
      FieldName = 'ESTOQUEMINIMO'
      Size = 1
    end
    object cdsParametrosNVIASTRANSFERENCIA: TFloatField
      FieldName = 'NVIASTRANSFERENCIA'
    end
    object cdsParametrosUTILIZAPERFUMISTA: TStringField
      FieldName = 'UTILIZAPERFUMISTA'
      Size = 1
    end
    object cdsParametrosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
    end
    object cdsParametrosABREENTREGA: TStringField
      FieldName = 'ABREENTREGA'
      Size = 1
    end
    object cdsParametrosCUPOMDETALHADOPREVENDA: TStringField
      FieldName = 'CUPOMDETALHADOPREVENDA'
      Size = 1
    end
    object cdsParametrosPARCELAVENDAS: TStringField
      FieldName = 'PARCELAVENDAS'
      Size = 1
    end
    object cdsParametrosDESCONTOOPERADORCALLCENTER: TFloatField
      FieldName = 'DESCONTOOPERADORCALLCENTER'
    end
    object cdsParametrosDESCONTOGERENTECALLCENTER: TFloatField
      FieldName = 'DESCONTOGERENTECALLCENTER'
    end
    object cdsParametrosPRECIFICACAO_UNICA: TStringField
      FieldName = 'PRECIFICACAO_UNICA'
      Size = 1
    end
    object cdsParametrosCOLUNASIMPRESSORANAOFISCAL: TFloatField
      FieldName = 'COLUNASIMPRESSORANAOFISCAL'
    end
    object cdsParametrosMANTEMDESCRICAOPRODUTO: TStringField
      FieldName = 'MANTEMDESCRICAOPRODUTO'
      Size = 1
    end
    object cdsParametrosINSTRUCOESBOLETO: TStringField
      FieldName = 'INSTRUCOESBOLETO'
      Size = 1000
    end
    object cdsParametrosUSATEF: TStringField
      FieldName = 'USATEF'
      Size = 1
    end
    object cdsParametrosTEFTEMPOESPERA: TFloatField
      FieldName = 'TEFTEMPOESPERA'
    end
    object cdsParametrosTEFTEMPOMENSAGEM: TFloatField
      FieldName = 'TEFTEMPOMENSAGEM'
    end
    object cdsParametrosCONTROLEMEDICAMENTO: TStringField
      FieldName = 'CONTROLEMEDICAMENTO'
      Size = 1
    end
    object cdsParametrosCONSULTACHEQUE: TStringField
      FieldName = 'CONSULTACHEQUE'
      Size = 10
    end
    object cdsParametrosIDENTIFICARCLIENTE: TStringField
      FieldName = 'IDENTIFICARCLIENTE'
      Size = 1
    end
    object cdsParametrosPERIODO_VENCIMENTO: TFloatField
      FieldName = 'PERIODO_VENCIMENTO'
    end
    object cdsParametrosPERIODO_VENCIMENTO_VENDAS: TFloatField
      FieldName = 'PERIODO_VENCIMENTO_VENDAS'
    end
    object cdsParametrosIDENTIFICAVENDAMANUAL: TStringField
      FieldName = 'IDENTIFICAVENDAMANUAL'
      Size = 1
    end
    object cdsParametrosTRABALHARCAIXADIAANTERIOR: TStringField
      FieldName = 'TRABALHARCAIXADIAANTERIOR'
      Size = 1
    end
    object cdsParametrosUSAPRECOCONCORRENTE: TStringField
      FieldName = 'USAPRECOCONCORRENTE'
      Size = 1
    end
    object cdsParametrosPRECOPROMOCAOAUTOMATICO: TStringField
      FieldName = 'PRECOPROMOCAOAUTOMATICO'
      Size = 1
    end
    object cdsParametrosCOMPROVANTEFIADO: TStringField
      FieldName = 'COMPROVANTEFIADO'
      Size = 1
    end
    object cdsParametrosMANTEMDESCRICAOPRODUTOCOMPRA: TStringField
      FieldName = 'MANTEMDESCRICAOPRODUTOCOMPRA'
      Size = 1
    end
    object cdsParametrosFARMACEUTICONOME: TStringField
      FieldName = 'FARMACEUTICONOME'
      Size = 100
    end
    object cdsParametrosFARMACEUTICOCPF: TStringField
      FieldName = 'FARMACEUTICOCPF'
      Size = 13
    end
    object cdsParametrosFARMACEUTICOCRF: TStringField
      FieldName = 'FARMACEUTICOCRF'
      Size = 10
    end
    object cdsParametrosFARMACEUTICOUF: TFloatField
      FieldName = 'FARMACEUTICOUF'
    end
    object cdsParametrosDATA_ULTIMA_TRANSMISSAO_SNGPC: TDateField
      FieldName = 'DATA_ULTIMA_TRANSMISSAO_SNGPC'
    end
    object cdsParametrosALTERAMARGEMNOTA: TStringField
      FieldName = 'ALTERAMARGEMNOTA'
      Size = 1
    end
    object cdsParametrosSOMAIPI: TStringField
      FieldName = 'SOMAIPI'
      Size = 1
    end
    object cdsParametrosCAMINHOAUTENTICACAO: TStringField
      FieldName = 'CAMINHOAUTENTICACAO'
      Size = 100
    end
    object cdsParametrosPEDIRSENHAVENDEDOR: TStringField
      FieldName = 'PEDIRSENHAVENDEDOR'
      Size = 13
    end
    object cdsParametrosVENDASDINHEIRO: TStringField
      FieldName = 'VENDASDINHEIRO'
      Size = 1
    end
    object cdsParametrosVENDASCARTAO: TStringField
      FieldName = 'VENDASCARTAO'
      Size = 1
    end
    object cdsParametrosVENDASCONVENIO: TStringField
      FieldName = 'VENDASCONVENIO'
      Size = 1
    end
    object cdsParametrosVENDASCHEQUEPRE: TStringField
      FieldName = 'VENDASCHEQUEPRE'
      Size = 1
    end
    object cdsParametrosVENDASCREDITO: TStringField
      FieldName = 'VENDASCREDITO'
      Size = 1
    end
    object cdsParametrosVENDASCHEQUEAVISTA: TStringField
      FieldName = 'VENDASCHEQUEAVISTA'
      Size = 1
    end
    object cdsParametrosOUTROSRECEBIMENTOS: TStringField
      FieldName = 'OUTROSRECEBIMENTOS'
      Size = 1
    end
    object cdsParametrosSAIDAS: TStringField
      FieldName = 'SAIDAS'
      Size = 1
    end
    object cdsParametrosIMAGEM: TBlobField
      FieldName = 'IMAGEM'
    end
    object cdsParametrosBAIXAAUTOMATICACHEQUEPRE: TStringField
      FieldName = 'BAIXAAUTOMATICACHEQUEPRE'
      Size = 1
    end
    object cdsParametrosPERCENTUALPREMIACAO: TFloatField
      FieldName = 'PERCENTUALPREMIACAO'
    end
    object cdsParametrosVALORMINIMOPREMIACAO: TFloatField
      FieldName = 'VALORMINIMOPREMIACAO'
    end
    object cdsParametrosPERCENTUALJUROSCONTASRECEBER: TFloatField
      FieldName = 'PERCENTUALJUROSCONTASRECEBER'
    end
    object cdsParametrosCD_CONTA_BAIXA_CHEQUE: TFloatField
      FieldName = 'CD_CONTA_BAIXA_CHEQUE'
    end
    object cdsParametrosINSTANCIAMULTIPLA: TStringField
      FieldName = 'INSTANCIAMULTIPLA'
      Size = 1
    end
    object cdsParametrosDESCONTOGRUPOSOBRECONVENIO: TStringField
      FieldName = 'DESCONTOGRUPOSOBRECONVENIO'
      Size = 1
    end
    object cdsParametrosRESUMOCAIXA_ITEM_13: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_13'
      Size = 1
    end
    object cdsParametrosRESGATAPREVENDA: TStringField
      FieldName = 'RESGATAPREVENDA'
      Size = 1
    end
    object cdsParametrosVALORALERTASANGRIA: TFloatField
      FieldName = 'VALORALERTASANGRIA'
    end
    object cdsParametrosVENDEDORAUTOMATICO: TFloatField
      FieldName = 'VENDEDORAUTOMATICO'
    end
    object cdsParametrosDISCRIMINARDESCONTOCUPOM: TStringField
      FieldName = 'DISCRIMINARDESCONTOCUPOM'
      Size = 1
    end
    object cdsParametrosPROMOCAODESCONTOCUPOM: TStringField
      FieldName = 'PROMOCAODESCONTOCUPOM'
      Size = 1
    end
    object cdsParametrosUSAGUILHOTINA: TStringField
      FieldName = 'USAGUILHOTINA'
      Size = 1
    end
    object cdsParametrosCONVENIOTRN: TFloatField
      FieldName = 'CONVENIOTRN'
    end
    object cdsParametrosCLIENTETRN: TFloatField
      FieldName = 'CLIENTETRN'
    end
    object cdsParametrosVENCIMENTOTRN: TFloatField
      FieldName = 'VENCIMENTOTRN'
    end
    object cdsParametrosCONVENIOEPHARMA: TFloatField
      FieldName = 'CONVENIOEPHARMA'
    end
    object cdsParametrosCLIENTEEPHARMA: TFloatField
      FieldName = 'CLIENTEEPHARMA'
    end
    object cdsParametrosVENCIMENTOEPHARMA: TFloatField
      FieldName = 'VENCIMENTOEPHARMA'
    end
    object cdsParametrosCONVENIOFUNCIONALCARD: TFloatField
      FieldName = 'CONVENIOFUNCIONALCARD'
    end
    object cdsParametrosCLIENTEFUNCIONALCARD: TFloatField
      FieldName = 'CLIENTEFUNCIONALCARD'
    end
    object cdsParametrosVENCIMENTOFUNCIONALCARD: TFloatField
      FieldName = 'VENCIMENTOFUNCIONALCARD'
    end
    object cdsParametrosCONVENIOVIDALINK: TFloatField
      FieldName = 'CONVENIOVIDALINK'
    end
    object cdsParametrosCLIENTEVIDALINK: TFloatField
      FieldName = 'CLIENTEVIDALINK'
    end
    object cdsParametrosVENCIMENTOVIDALINK: TFloatField
      FieldName = 'VENCIMENTOVIDALINK'
    end
    object cdsParametrosCONVENIOFARMACIAPOPULAR: TFloatField
      FieldName = 'CONVENIOFARMACIAPOPULAR'
    end
    object cdsParametrosCLIENTEFARMACIAPOPULAR: TFloatField
      FieldName = 'CLIENTEFARMACIAPOPULAR'
    end
    object cdsParametrosVENCIMENTOFARMACIAPOPULAR: TFloatField
      FieldName = 'VENCIMENTOFARMACIAPOPULAR'
    end
    object cdsParametrosLOGINFARMACIAPOPULAR: TStringField
      FieldName = 'LOGINFARMACIAPOPULAR'
    end
    object cdsParametrosSENHAFARMACIAPOPULAR: TStringField
      FieldName = 'SENHAFARMACIAPOPULAR'
    end
    object cdsParametrosLOGINFIDELIZE: TStringField
      FieldName = 'LOGINFIDELIZE'
      Size = 100
    end
    object cdsParametrosSENHAFIDELIZE: TStringField
      FieldName = 'SENHAFIDELIZE'
      Size = 100
    end
    object cdsParametrosUSAIMS: TStringField
      FieldName = 'USAIMS'
      Size = 1
    end
    object cdsParametrosCHAVESINTEGRA: TStringField
      FieldName = 'CHAVESINTEGRA'
      Size = 50
    end
    object cdsParametrosIMPRIMIRRESUMOECF: TStringField
      FieldName = 'IMPRIMIRRESUMOECF'
      Size = 1
    end
    object cdsParametrosIMPRIMIRVINCULADOPARAENTREGA: TStringField
      FieldName = 'IMPRIMIRVINCULADOPARAENTREGA'
      Size = 1
    end
    object cdsParametrosCODIGOIMS: TStringField
      FieldName = 'CODIGOIMS'
      Size = 4
    end
    object cdsParametrosVALORPONTUACAO: TFloatField
      FieldName = 'VALORPONTUACAO'
    end
    object cdsParametrosPONTOSRESGATE: TIntegerField
      FieldName = 'PONTOSRESGATE'
    end
    object cdsParametrosVALORRESGATE: TFloatField
      FieldName = 'VALORRESGATE'
    end
    object cdsParametrosSUBSTITUTOTRIBUTARIO: TStringField
      FieldName = 'SUBSTITUTOTRIBUTARIO'
      Size = 1
    end
    object cdsParametrosCONTRIBUINTE_IPI: TStringField
      FieldName = 'CONTRIBUINTE_IPI'
      Size = 1
    end
    object cdsParametrosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsParametrosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsParametrosCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object cdsParametrosPAF_LAUDO: TStringField
      FieldName = 'PAF_LAUDO'
      Size = 100
    end
    object cdsParametrosPAF_CNPJ: TStringField
      FieldName = 'PAF_CNPJ'
      Size = 14
    end
    object cdsParametrosPAF_IE: TStringField
      FieldName = 'PAF_IE'
      Size = 14
    end
    object cdsParametrosPAF_IM: TStringField
      FieldName = 'PAF_IM'
      Size = 14
    end
    object cdsParametrosPAF_RAZAO: TStringField
      FieldName = 'PAF_RAZAO'
      Size = 1000
    end
    object cdsParametrosPAF_ENDERECO: TStringField
      FieldName = 'PAF_ENDERECO'
      Size = 1000
    end
    object cdsParametrosPAF_TELEFONE: TStringField
      FieldName = 'PAF_TELEFONE'
      Size = 10
    end
    object cdsParametrosPAF_CONTATO: TStringField
      FieldName = 'PAF_CONTATO'
      Size = 1000
    end
    object cdsParametrosPAF_NOMECOMERCIAL: TStringField
      FieldName = 'PAF_NOMECOMERCIAL'
      Size = 1000
    end
    object cdsParametrosPAF_VERSAO: TStringField
      FieldName = 'PAF_VERSAO'
      Size = 10
    end
    object cdsParametrosPAF_EXECUTAVEL: TStringField
      FieldName = 'PAF_EXECUTAVEL'
      Size = 1000
    end
    object cdsParametrosPAF_MD5: TStringField
      FieldName = 'PAF_MD5'
      Size = 1024
    end
    object cdsParametrosPAF_ERPAFECF: TStringField
      FieldName = 'PAF_ERPAFECF'
      Size = 4
    end
    object cdsParametrosPAF_CHAVEPUBLICA: TStringField
      FieldName = 'PAF_CHAVEPUBLICA'
      Size = 1000
    end
    object cdsParametrosPAF_CHAVEPRIVADA: TStringField
      FieldName = 'PAF_CHAVEPRIVADA'
      Size = 1000
    end
    object cdsParametrosPAF_DATA: TStringField
      FieldName = 'PAF_DATA'
      Size = 1000
    end
    object cdsParametrosEXIBECOMISSAOVENDA: TStringField
      FieldName = 'EXIBECOMISSAOVENDA'
      Size = 1
    end
    object cdsParametrosCONTROLALOTES: TStringField
      FieldName = 'CONTROLALOTES'
      Size = 1
    end
    object cdsParametrosCONCLUI_TRANSFERENCIAS: TStringField
      FieldName = 'CONCLUI_TRANSFERENCIAS'
      Size = 1
    end
    object cdsParametrosENVIA_TRANSFERENCIAS: TStringField
      FieldName = 'ENVIA_TRANSFERENCIAS'
      Size = 1
    end
    object cdsParametrosCONFERENCIAVENDA: TStringField
      FieldName = 'CONFERENCIAVENDA'
      Size = 1
    end
    object cdsParametrosUSARVENDEDORLOJA: TStringField
      FieldName = 'USARVENDEDORLOJA'
      Size = 1
    end
    object cdsParametrosCD_VENDEDORLOJA: TFloatField
      FieldName = 'CD_VENDEDORLOJA'
    end
    object cdsParametrosPHARMALINKSENHA: TStringField
      FieldName = 'PHARMALINKSENHA'
    end
    object cdsParametrosPHARMALINKURL: TStringField
      FieldName = 'PHARMALINKURL'
      Size = 1000
    end
    object cdsParametrosPHARMALINKIP: TStringField
      FieldName = 'PHARMALINKIP'
      Size = 15
    end
    object cdsParametrosDIASBLOQUEIOCLIENTE: TIntegerField
      FieldName = 'DIASBLOQUEIOCLIENTE'
    end
    object cdsParametrosEXIBIRVALORVENDA: TStringField
      FieldName = 'EXIBIRVALORVENDA'
      Size = 1
    end
    object cdsParametrosLINHASAVANCO: TFloatField
      FieldName = 'LINHASAVANCO'
    end
    object cdsParametrosEXIBIRPRODUTOSRELACIONADOS: TStringField
      FieldName = 'EXIBIRPRODUTOSRELACIONADOS'
      Size = 1
    end
    object cdsParametrosNOMEREDE: TStringField
      FieldName = 'NOMEREDE'
      Size = 100
    end
    object cdsParametrosCODIGOCLOSEUP: TStringField
      FieldName = 'CODIGOCLOSEUP'
      Size = 10
    end
    object cdsParametrosRECEBIMENTOPARCIALCONTA: TStringField
      FieldName = 'RECEBIMENTOPARCIALCONTA'
      Size = 1
    end
    object cdsParametrosSERVIDORLOJA: TStringField
      FieldName = 'SERVIDORLOJA'
      Size = 100
    end
    object cdsParametrosCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 7
    end
    object cdsParametrosPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 1
    end
    object cdsParametrosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsParametrosCONTACUSTOVENDA: TFloatField
      FieldName = 'CONTACUSTOVENDA'
    end
    object cdsParametrosVIASVINCULADOENTRGA: TIntegerField
      FieldName = 'VIASVINCULADOENTRGA'
    end
    object cdsParametrosTEXTOPADRAOGARANTIA: TStringField
      FieldName = 'TEXTOPADRAOGARANTIA'
      Size = 1000
    end
    object cdsParametrosVERSAO_GESTOR: TStringField
      FieldName = 'VERSAO_GESTOR'
    end
    object cdsParametrosVERSAO_LOJA: TStringField
      FieldName = 'VERSAO_LOJA'
    end
    object cdsParametrosDIASSEMVENDER: TIntegerField
      FieldName = 'DIASSEMVENDER'
    end
    object cdsParametrosRESUMOCAIXA_ITEM_14: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_14'
      Size = 1
    end
    object cdsParametrosNUMEROSERIECERTIFICADO: TStringField
      FieldName = 'NUMEROSERIECERTIFICADO'
      Size = 100
    end
    object cdsParametrosNFEAMBIENTE: TStringField
      FieldName = 'NFEAMBIENTE'
      Size = 1
    end
    object cdsParametrosNFECFOP: TFloatField
      FieldName = 'NFECFOP'
    end
    object cdsParametrosNFECFOPTRANSFERENCIAENTRADA: TFloatField
      FieldName = 'NFECFOPTRANSFERENCIAENTRADA'
    end
    object cdsParametrosNFECFOPTRANSFERENCIASAIDA: TFloatField
      FieldName = 'NFECFOPTRANSFERENCIASAIDA'
    end
    object cdsParametrosNFECFOPDEVOLUCAO: TFloatField
      FieldName = 'NFECFOPDEVOLUCAO'
    end
    object cdsParametrosNFECFOPENTRADA: TFloatField
      FieldName = 'NFECFOPENTRADA'
    end
    object cdsParametrosNFEULTIMANOTAEMITIDA: TStringField
      FieldName = 'NFEULTIMANOTAEMITIDA'
      Size = 12
    end
    object cdsParametrosNFEULTIMOLOTEENVIADO: TStringField
      FieldName = 'NFEULTIMOLOTEENVIADO'
      Size = 12
    end
    object cdsParametrosTIPO_TEF: TStringField
      FieldName = 'TIPO_TEF'
      Size = 1
    end
    object cdsParametrosCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object cdsParametrosARMAZENAPOSICAOESTOQUEDATA: TStringField
      FieldName = 'ARMAZENAPOSICAOESTOQUEDATA'
      Size = 1
    end
    object cdsParametrosCONTADORNOME: TStringField
      FieldName = 'CONTADORNOME'
      Size = 100
    end
    object cdsParametrosCONTADORCPF: TStringField
      FieldName = 'CONTADORCPF'
      Size = 11
    end
    object cdsParametrosCONTADORCRC: TStringField
      FieldName = 'CONTADORCRC'
    end
    object cdsParametrosCONTADORCNPJ: TStringField
      FieldName = 'CONTADORCNPJ'
      Size = 14
    end
    object cdsParametrosCONTADORENDERECO: TStringField
      FieldName = 'CONTADORENDERECO'
      Size = 100
    end
    object cdsParametrosCONTADORNUMERO: TStringField
      FieldName = 'CONTADORNUMERO'
      Size = 10
    end
    object cdsParametrosCONTADORCOMPLEMENTO: TStringField
      FieldName = 'CONTADORCOMPLEMENTO'
      Size = 100
    end
    object cdsParametrosCONTADORBAIRRO: TStringField
      FieldName = 'CONTADORBAIRRO'
      Size = 100
    end
    object cdsParametrosCONTADORCEP: TStringField
      FieldName = 'CONTADORCEP'
      Size = 8
    end
    object cdsParametrosCONTADORTELEFONE: TStringField
      FieldName = 'CONTADORTELEFONE'
      Size = 10
    end
    object cdsParametrosCONTADORFAX: TStringField
      FieldName = 'CONTADORFAX'
      Size = 10
    end
    object cdsParametrosCONTADOREMAIL: TStringField
      FieldName = 'CONTADOREMAIL'
      Size = 100
    end
    object cdsParametrosCONTADORCD_MUNICIPIO: TStringField
      FieldName = 'CONTADORCD_MUNICIPIO'
      Size = 10
    end
    object cdsParametrosCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 1000
    end
    object cdsParametrosACODEURL: TStringField
      FieldName = 'ACODEURL'
      Size = 1000
    end
    object cdsParametrosACODEUSUARIO: TStringField
      FieldName = 'ACODEUSUARIO'
      Size = 100
    end
    object cdsParametrosACODESENHA: TStringField
      FieldName = 'ACODESENHA'
      Size = 100
    end
    object cdsParametrosPHARMALINKUSUARIO: TStringField
      FieldName = 'PHARMALINKUSUARIO'
      Size = 100
    end
    object cdsParametrosICMSINTERESTADUALSIMPLES: TFMTBCDField
      FieldName = 'ICMSINTERESTADUALSIMPLES'
      Precision = 18
      Size = 2
    end
    object cdsParametrosICMSINTERESTADUALREDUZIDO: TFMTBCDField
      FieldName = 'ICMSINTERESTADUALREDUZIDO'
      Precision = 18
      Size = 2
    end
    object cdsParametrosSERIENOTANFE: TStringField
      FieldName = 'SERIENOTANFE'
      Size = 10
    end
    object cdsParametrosCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 4
    end
    object cdsParametrosSERVIDORCALLCENTER: TStringField
      FieldName = 'SERVIDORCALLCENTER'
      Size = 1000
    end
    object cdsParametrosPREENCHERRECEITACONTROLADO: TStringField
      FieldName = 'PREENCHERRECEITACONTROLADO'
      Size = 1
    end
    object cdsParametrosSMSTECNICO: TStringField
      FieldName = 'SMSTECNICO'
      Size = 100
    end
    object cdsParametrosSMSGERENCIAL: TStringField
      FieldName = 'SMSGERENCIAL'
      Size = 100
    end
    object cdsParametrosUSATECBAN: TStringField
      FieldName = 'USATECBAN'
      Size = 1
    end
    object cdsParametrosUSAHIPERCARD: TStringField
      FieldName = 'USAHIPERCARD'
      Size = 1
    end
    object cdsParametrosUSAREDECARDAMEXVISA: TStringField
      FieldName = 'USAREDECARDAMEXVISA'
      Size = 1
    end
    object cdsParametrosABREFINALIZACAOBALCAO: TStringField
      FieldName = 'ABREFINALIZACAOBALCAO'
      Size = 1
    end
    object cdsParametrosEXIBECUSTOBALCAO: TStringField
      FieldName = 'EXIBECUSTOBALCAO'
      Size = 1
    end
    object cdsParametrosCRT: TStringField
      FieldName = 'CRT'
      Size = 1
    end
    object cdsParametrosEXPORTANOTASSNGPC: TStringField
      FieldName = 'EXPORTANOTASSNGPC'
      Size = 1
    end
    object cdsParametrosTRATANDOPREVENDASEMABERTOPAF: TStringField
      FieldName = 'TRATANDOPREVENDASEMABERTOPAF'
      Size = 1
    end
    object cdsParametrosFTPENDERECO: TStringField
      FieldName = 'FTPENDERECO'
      Size = 99
    end
    object cdsParametrosFTPUSUARIO: TStringField
      FieldName = 'FTPUSUARIO'
      Size = 99
    end
    object cdsParametrosFTPSENHA: TStringField
      FieldName = 'FTPSENHA'
      Size = 99
    end
    object cdsParametrosCLIENTEORIZON: TFloatField
      FieldName = 'CLIENTEORIZON'
    end
    object cdsParametrosCONVENIOORIZON: TFloatField
      FieldName = 'CONVENIOORIZON'
    end
    object cdsParametrosNFECFOPDEVOLUCAOCOMPRA: TFloatField
      FieldName = 'NFECFOPDEVOLUCAOCOMPRA'
    end
    object cdsParametrosDIAS_CARENCIA_JUROS_CR: TIntegerField
      FieldName = 'DIAS_CARENCIA_JUROS_CR'
    end
    object cdsParametrosENQUADRAMENTOTRIBUTARIO: TStringField
      FieldName = 'ENQUADRAMENTOTRIBUTARIO'
      Size = 1
    end
    object cdsParametrosRECEBECREDITOCONTASRECEBER: TStringField
      FieldName = 'RECEBECREDITOCONTASRECEBER'
      Size = 1
    end
    object cdsParametrosNFEFORNECEDORDEVOLUCAOVENDA: TFloatField
      FieldName = 'NFEFORNECEDORDEVOLUCAOVENDA'
    end
    object cdsParametrosCLIENTEPHARMASYSTEM: TFloatField
      FieldName = 'CLIENTEPHARMASYSTEM'
    end
    object cdsParametrosCONVENIOPHARMASYSTEM: TFloatField
      FieldName = 'CONVENIOPHARMASYSTEM'
    end
    object cdsParametrosSENHAPHARMASYSTEM: TStringField
      FieldName = 'SENHAPHARMASYSTEM'
      Size = 100
    end
    object cdsParametrosCONCESSAOCREDITOS: TStringField
      FieldName = 'CONCESSAOCREDITOS'
      Size = 1
    end
    object cdsParametrosNFETIPOEMISSAO: TStringField
      FieldName = 'NFETIPOEMISSAO'
      Size = 1
    end
    object cdsParametrosSERIENOTANFESCAN: TStringField
      FieldName = 'SERIENOTANFESCAN'
      Size = 10
    end
    object cdsParametrosNFEULTIMANOTAEMITIDASCAN: TStringField
      FieldName = 'NFEULTIMANOTAEMITIDASCAN'
      Size = 12
    end
    object cdsParametrosVERSAONFE: TIntegerField
      FieldName = 'VERSAONFE'
    end
    object cdsParametrosUSACONFERENCIABALCAO: TStringField
      FieldName = 'USACONFERENCIABALCAO'
      Size = 1
    end
    object cdsParametrosNFCEAMBIENTE: TStringField
      FieldName = 'NFCEAMBIENTE'
      Size = 1
    end
    object cdsParametrosNFCENOTA: TStringField
      FieldName = 'NFCENOTA'
      Size = 12
    end
    object cdsParametrosNFCELOTE: TStringField
      FieldName = 'NFCELOTE'
      Size = 12
    end
    object cdsParametrosNFCESERIE: TStringField
      FieldName = 'NFCESERIE'
      Size = 12
    end
    object cdsParametrosNFCECIDTOKEN: TStringField
      FieldName = 'NFCECIDTOKEN'
      Size = 6
    end
    object cdsParametrosNFCETOKEN: TStringField
      FieldName = 'NFCETOKEN'
      Size = 100
    end
    object cdsParametrosNFEPERCENTUALCREDITOSN: TFloatField
      FieldName = 'NFEPERCENTUALCREDITOSN'
    end
    object cdsParametrosPORTA_SMTP: TStringField
      FieldName = 'PORTA_SMTP'
      Size = 10
    end
    object cdsParametrosPHARMALINKDIRETORIOENVIO: TStringField
      FieldName = 'PHARMALINKDIRETORIOENVIO'
      Size = 100
    end
    object cdsParametrosPHARMALINKDIRETORIORETORNO: TStringField
      FieldName = 'PHARMALINKDIRETORIORETORNO'
      Size = 100
    end
    object cdsParametrosPISALIQUOTA: TFMTBCDField
      FieldName = 'PISALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsParametrosCOFINSALIQUOTA: TFMTBCDField
      FieldName = 'COFINSALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsParametrosAVISOPREVENDAABERTA: TStringField
      FieldName = 'AVISOPREVENDAABERTA'
      Size = 1
    end
    object cdsParametrosTEMPOAVISOPREVENDAABERTA: TIntegerField
      FieldName = 'TEMPOAVISOPREVENDAABERTA'
    end
    object cdsParametrosFIDELIZEFTPHOST: TStringField
      FieldName = 'FIDELIZEFTPHOST'
      Size = 1000
    end
    object cdsParametrosFIDELIZEFTPUSUARIO: TStringField
      FieldName = 'FIDELIZEFTPUSUARIO'
      Size = 100
    end
    object cdsParametrosFIDELIZEFTPSENHA: TStringField
      FieldName = 'FIDELIZEFTPSENHA'
      Size = 100
    end
    object cdsParametrosUSACONSULTAPRODUTOSPBM: TStringField
      FieldName = 'USACONSULTAPRODUTOSPBM'
      Size = 1
    end
    object cdsParametrosWSCONVENIOURL: TStringField
      FieldName = 'WSCONVENIOURL'
      Size = 100
    end
    object cdsParametrosWSCONVENIOCODIGOACESSO: TStringField
      FieldName = 'WSCONVENIOCODIGOACESSO'
      Size = 100
    end
    object cdsParametrosWSCONVENIOSENHA: TStringField
      FieldName = 'WSCONVENIOSENHA'
      Size = 100
    end
    object cdsParametrosWSCONVENIOOPERADOR: TStringField
      FieldName = 'WSCONVENIOOPERADOR'
      Size = 100
    end
    object cdsParametrosWSCONVENIOTOKEN: TStringField
      FieldName = 'WSCONVENIOTOKEN'
      Size = 100
    end
    object cdsParametrosEXIBEIMAGEMPRODUTO: TStringField
      FieldName = 'EXIBEIMAGEMPRODUTO'
      Size = 1
    end
    object cdsParametrosCLIENTEWSCONVENIO: TFloatField
      FieldName = 'CLIENTEWSCONVENIO'
    end
    object cdsParametrosCONVENIOWSCONVENIO: TFloatField
      FieldName = 'CONVENIOWSCONVENIO'
    end
    object cdsParametrosTEFCNPJCREDENCIADORA: TStringField
      FieldName = 'TEFCNPJCREDENCIADORA'
      Size = 14
    end
    object cdsParametrosPREVENDASBLOQUEIAVENDEDOR: TIntegerField
      FieldName = 'PREVENDASBLOQUEIAVENDEDOR'
    end
    object cdsParametrosAVANT_IDINTEGRACAO: TStringField
      FieldName = 'AVANT_IDINTEGRACAO'
      Size = 100
    end
    object cdsParametrosAVANT_IDEMPRESA: TStringField
      FieldName = 'AVANT_IDEMPRESA'
      Size = 100
    end
    object cdsParametrosAVANT_TOKEN: TStringField
      FieldName = 'AVANT_TOKEN'
      Size = 100
    end
    object cdsParametrosAVANT_DATAREVISAO: TDateField
      FieldName = 'AVANT_DATAREVISAO'
    end
    object cdsParametrosAVANT_DATAATUALIZACAO: TDateField
      FieldName = 'AVANT_DATAATUALIZACAO'
    end
    object cdsParametrosSANGRIABLOQUEIACHECKOUT: TStringField
      FieldName = 'SANGRIABLOQUEIACHECKOUT'
      Size = 1
    end
    object cdsParametrosWSCONVENIOURLCADASTRO: TStringField
      FieldName = 'WSCONVENIOURLCADASTRO'
      Size = 1000
    end
    object cdsParametrosDESCONTOCONVENIOSOBREFIDELIDADE: TStringField
      FieldName = 'DESCONTOCONVENIOSOBREFIDELIDADE'
      Size = 1
    end
    object cdsParametrosABCFARMA_SENHA: TStringField
      FieldName = 'ABCFARMA_SENHA'
      Size = 100
    end
    object cdsParametrosSMTPSSL: TStringField
      FieldName = 'SMTPSSL'
      Size = 1
    end
    object cdsParametrosSMTPTLS: TStringField
      FieldName = 'SMTPTLS'
      Size = 1
    end
    object cdsParametrosEXPORTAPRODUTOSFISCO: TStringField
      FieldName = 'EXPORTAPRODUTOSFISCO'
      Size = 1
    end
    object cdsParametrosNFCEIDENTIFICARSH: TStringField
      FieldName = 'NFCEIDENTIFICARSH'
      Size = 1
    end
    object cdsParametrosNFCEIDENTIFICARTEF: TStringField
      FieldName = 'NFCEIDENTIFICARTEF'
      Size = 1
    end
    object cdsParametrosNFCEIDENTIFICARST: TStringField
      FieldName = 'NFCEIDENTIFICARST'
      Size = 1
    end
    object cdsParametrosNFCEIDENTIFICACSRT: TStringField
      FieldName = 'NFCEIDENTIFICACSRT'
      Size = 1
    end
    object cdsParametrosNFCEIDCSRT: TIntegerField
      FieldName = 'NFCEIDCSRT'
    end
    object cdsParametrosNFCEHASHCSRT: TStringField
      FieldName = 'NFCEHASHCSRT'
      Size = 100
    end
    object cdsParametrosNFCEIDENTIFICARICMSEFETIVO: TStringField
      FieldName = 'NFCEIDENTIFICARICMSEFETIVO'
      Size = 1
    end
    object cdsParametrosPROGRAMAFISCAL: TIntegerField
      FieldName = 'PROGRAMAFISCAL'
    end
    object cdsParametrosNFCEGERAICMSDESONERACAO: TStringField
      FieldName = 'NFCEGERAICMSDESONERACAO'
      Size = 1
    end
    object cdsParametrosALTERARQUANTIDADERECEBIDA: TStringField
      FieldName = 'ALTERARQUANTIDADERECEBIDA'
      Size = 1
    end
    object cdsParametrosORIZONXAPIKEY: TStringField
      FieldName = 'ORIZONXAPIKEY'
      Size = 100
    end
    object cdsParametrosMENSAGEMSANGRIADINHEIRO: TStringField
      FieldName = 'MENSAGEMSANGRIADINHEIRO'
      Size = 1
    end
    object cdsParametrosSAT_SERIE: TIntegerField
      FieldName = 'SAT_SERIE'
    end
    object cdsParametrosINDICACONVENIOCADASTROVENDA: TStringField
      FieldName = 'INDICACONVENIOCADASTROVENDA'
      Size = 1
    end
    object cdsParametrosDATAHORAEXECUTAVEL: TSQLTimeStampField
      FieldName = 'DATAHORAEXECUTAVEL'
    end
    object cdsParametrosCERTIFICADODIGITAL: TBlobField
      FieldName = 'CERTIFICADODIGITAL'
    end
    object cdsParametrosSENHACERTIFICADODIGITAL: TStringField
      FieldName = 'SENHACERTIFICADODIGITAL'
      Size = 100
    end
    object cdsParametrosID_PRODUTO_SERVICO: TFloatField
      FieldName = 'ID_PRODUTO_SERVICO'
    end
    object cdsParametrosID_PRODUTO_ENTREGA: TFloatField
      FieldName = 'ID_PRODUTO_ENTREGA'
    end
    object cdsParametrosMONITORNFES: TStringField
      FieldName = 'MONITORNFES'
      Size = 1
    end
    object cdsParametrosCONFERENCIAVENDADIRETACHECKOUT: TStringField
      FieldName = 'CONFERENCIAVENDADIRETACHECKOUT'
      Size = 1
    end
    object cdsParametrosORIZON_LOGIN: TStringField
      FieldName = 'ORIZON_LOGIN'
      Size = 100
    end
    object cdsParametrosORIZON_SENHA: TStringField
      FieldName = 'ORIZON_SENHA'
      Size = 100
    end
    object cdsParametrosSOLICITAAUTORIZACAOCARTAO: TStringField
      FieldName = 'SOLICITAAUTORIZACAOCARTAO'
      Size = 1
    end
    object cdsParametrosUSACONSULTAPRODUTOSPBMPDV: TStringField
      FieldName = 'USACONSULTAPRODUTOSPBMPDV'
      Size = 1
    end
    object cdsParametrosUSACONFERENCIATRANSFERENCIA: TStringField
      FieldName = 'USACONFERENCIATRANSFERENCIA'
      Size = 1
    end
    object cdsParametrosIMPRIMECUPOMEXCLUSAOITEM: TStringField
      FieldName = 'IMPRIMECUPOMEXCLUSAOITEM'
      Size = 1
    end
  end
  object FDControlador: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' COUNT(ID_PRODUTO) AS N_ITENS,'
      ' SUM(ESTOQUE_0) AS N_UNIDADES,'
      ' SUM(CUSTO_UNITARIO) AS T_CUSTO,'
      ' SUM(PRECO_VENDA) AS T_VENDA,'
      ' SUM(PRECO_PROMOCAO) AS T_PROMOCAO,'
      ' SUM(PRECO_VENDA) AS CLASSES,'
      ' SUM(PRECO_VENDA) AS GRUPOS,'
      ' SUM(PRECO_VENDA) AS LABORATORIOS,'
      ' SUM(PRECO_VENDA) AS DISTRIBUIDORES,'
      ' SUM(PRECO_VENDA) AS FAMILIAS,'
      ' SUM(PRECO_VENDA) AS GRUPOSBALANCO,'
      ' SUM(PRECO_VENDA) AS GRUPOSCOMPRAS,'
      ' SUM(PRECO_VENDA) AS CARTOES,'
      ' SUM(PRECO_VENDA) AS LANCAMENTOS,'
      ' SUM(PRECO_VENDA) AS CAIXAS,'
      ' SUM(PRECO_VENDA) AS CONTASRECEBER'
      'FROM'
      ' PRODUTOS')
    Left = 593
    Top = 81
  end
  object dspControlador: TDataSetProvider
    DataSet = FDControlador
    Left = 596
    Top = 127
  end
  object cdsControlador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControlador'
    Left = 599
    Top = 172
    object cdsControladorN_ITENS: TIntegerField
      FieldName = 'N_ITENS'
      ReadOnly = True
    end
    object cdsControladorN_UNIDADES: TFloatField
      FieldName = 'N_UNIDADES'
      ReadOnly = True
    end
    object cdsControladorT_CUSTO: TFloatField
      FieldName = 'T_CUSTO'
      ReadOnly = True
    end
    object cdsControladorT_VENDA: TFloatField
      FieldName = 'T_VENDA'
      ReadOnly = True
    end
    object cdsControladorT_PROMOCAO: TFloatField
      FieldName = 'T_PROMOCAO'
      ReadOnly = True
    end
    object cdsControladorCLASSES: TFloatField
      FieldName = 'CLASSES'
      ReadOnly = True
    end
    object cdsControladorGRUPOS: TFloatField
      FieldName = 'GRUPOS'
      ReadOnly = True
    end
    object cdsControladorLABORATORIOS: TFloatField
      FieldName = 'LABORATORIOS'
      ReadOnly = True
    end
    object cdsControladorDISTRIBUIDORES: TFloatField
      FieldName = 'DISTRIBUIDORES'
      ReadOnly = True
    end
    object cdsControladorFAMILIAS: TFloatField
      FieldName = 'FAMILIAS'
      ReadOnly = True
    end
    object cdsControladorGRUPOSBALANCO: TFloatField
      FieldName = 'GRUPOSBALANCO'
      ReadOnly = True
    end
    object cdsControladorGRUPOSCOMPRAS: TFloatField
      FieldName = 'GRUPOSCOMPRAS'
      ReadOnly = True
    end
    object cdsControladorCARTOES: TFloatField
      FieldName = 'CARTOES'
      ReadOnly = True
    end
    object cdsControladorLANCAMENTOS: TFloatField
      FieldName = 'LANCAMENTOS'
      ReadOnly = True
    end
    object cdsControladorCAIXAS: TFloatField
      FieldName = 'CAIXAS'
      ReadOnly = True
    end
    object cdsControladorCONTASRECEBER: TFloatField
      FieldName = 'CONTASRECEBER'
      ReadOnly = True
    end
  end
  object FDSql1: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' COUNT(ID_PRODUTO) AS N_ITENS,'
      ' SUM(ESTOQUE_0) AS N_UNIDADES,'
      ' SUM(CUSTO_UNITARIO) AS T_CUSTO,'
      ' SUM(PRECO_VENDA) AS T_VENDA,'
      ' SUM(PRECO_PROMOCAO) AS T_PROMOCAO,'
      ' SUM(PRECO_VENDA) AS CLASSES,'
      ' SUM(PRECO_VENDA) AS GRUPOS,'
      ' SUM(PRECO_VENDA) AS LABORATORIOS,'
      ' SUM(PRECO_VENDA) AS DISTRIBUIDORES,'
      ' SUM(PRECO_VENDA) AS FAMILIAS,'
      ' SUM(PRECO_VENDA) AS GRUPOSBALANCO,'
      ' SUM(PRECO_VENDA) AS GRUPOSCOMPRAS,'
      ' SUM(PRECO_VENDA) AS CARTOES,'
      ' SUM(PRECO_VENDA) AS LANCAMENTOS,'
      ' SUM(PRECO_VENDA) AS CAIXAS,'
      ' SUM(PRECO_VENDA) AS CONTASRECEBER'
      'FROM'
      ' PRODUTOS')
    Left = 625
    Top = 10
  end
  object dspSql1: TDataSetProvider
    DataSet = FDSql1
    Left = 668
    Top = 12
  end
  object cdsSql1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSql1'
    Left = 731
    Top = 13
    object IntegerField1: TIntegerField
      FieldName = 'N_ITENS'
      ReadOnly = True
    end
    object FloatField1: TFloatField
      FieldName = 'N_UNIDADES'
      ReadOnly = True
    end
    object FloatField2: TFloatField
      FieldName = 'T_CUSTO'
      ReadOnly = True
    end
    object FloatField3: TFloatField
      FieldName = 'T_VENDA'
      ReadOnly = True
    end
    object FloatField4: TFloatField
      FieldName = 'T_PROMOCAO'
      ReadOnly = True
    end
    object FloatField5: TFloatField
      FieldName = 'CLASSES'
      ReadOnly = True
    end
    object FloatField6: TFloatField
      FieldName = 'GRUPOS'
      ReadOnly = True
    end
    object FloatField7: TFloatField
      FieldName = 'LABORATORIOS'
      ReadOnly = True
    end
    object FloatField8: TFloatField
      FieldName = 'DISTRIBUIDORES'
      ReadOnly = True
    end
    object FloatField9: TFloatField
      FieldName = 'FAMILIAS'
      ReadOnly = True
    end
    object FloatField10: TFloatField
      FieldName = 'GRUPOSBALANCO'
      ReadOnly = True
    end
    object FloatField11: TFloatField
      FieldName = 'GRUPOSCOMPRAS'
      ReadOnly = True
    end
    object FloatField12: TFloatField
      FieldName = 'CARTOES'
      ReadOnly = True
    end
    object FloatField13: TFloatField
      FieldName = 'LANCAMENTOS'
      ReadOnly = True
    end
    object FloatField14: TFloatField
      FieldName = 'CAIXAS'
      ReadOnly = True
    end
    object FloatField15: TFloatField
      FieldName = 'CONTASRECEBER'
      ReadOnly = True
    end
  end
  object FDceLotes2: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' LANCAMENTOS_APRAZO.ID_PRODUTO,'
      ' LANCAMENTOS_APRAZO.CD_FILIAL,'
      ' LANCAMENTOS_APRAZO.CD_PRODUTO,'
      ' LANCAMENTOS_APRAZO.DESCRICAO,'
      ' LANCAMENTOS_APRAZO.CD_LABORATORIO,'
      ' LANCAMENTOS_APRAZO.CD_GRUPO,'
      ' LANCAMENTOS_APRAZO.CD_CONVENIO,'
      ' LANCAMENTOS_APRAZO.CD_CLIENTE,'
      ' LANCAMENTOS_APRAZO.CD_VENDEDOR,'
      ' LANCAMENTOS_APRAZO.CD_OPERADOR,'
      ' LANCAMENTOS_APRAZO.CD_USUARIO,'
      ' LANCAMENTOS_APRAZO.CD_FORMA_PAGAMENTO,'
      ' LANCAMENTOS_APRAZO.CD_VENDA,'
      
        ' CAST(LANCAMENTOS_APRAZO.CUSTO_MEDIO AS NUMERIC(10,2)) AS CUSTO_' +
        'MEDIO,'
      
        ' CAST(LANCAMENTOS_APRAZO.CUSTO_UNITARIO AS NUMERIC(10,2)) AS CUS' +
        'TO_UNITARIO,'
      ' LANCAMENTOS_APRAZO.DATA_LANCAMENTO,'
      ' LANCAMENTOS_APRAZO.DATA_CAIXA,'
      ' LANCAMENTOS_APRAZO.QUANTIDADE,'
      ' CAST(LANCAMENTOS_APRAZO.VALOR AS NUMERIC(10,2)) AS VALOR,'
      ' LANCAMENTOS_APRAZO.NOTA_FISCAL,'
      ' CAST(LANCAMENTOS_APRAZO.DESCONTO AS NUMERIC(10,2)) AS DESCONTO,'
      ' CAST(LANCAMENTOS_APRAZO.PROMOCAO AS NUMERIC(10,2)) AS PROMOCAO,'
      ' LANCAMENTOS_APRAZO.TIPO_VENDA,'
      ' LANCAMENTOS_APRAZO.TIPO_PAGAMENTO,'
      ' LANCAMENTOS_APRAZO.ENTRADA_SAIDA,'
      ' LANCAMENTOS_APRAZO.ETIQUETA,'
      ' LANCAMENTOS_APRAZO.ENTREGA,'
      ' LANCAMENTOS_APRAZO.HORA,'
      ' LANCAMENTOS_APRAZO.ESTOQUE_POSVENDA,'
      ' LANCAMENTOS_APRAZO.TROCA,'
      ' LANCAMENTOS_APRAZO.ENVIADO,'
      ' LANCAMENTOS_APRAZO.NUMERO,'
      ' LANCAMENTOS_APRAZO.TERMINAL,'
      ' LANCAMENTOS_APRAZO.USUARIO,'
      ' LANCAMENTOS_APRAZO.CD_LANCAMENTO,'
      ' CAST(LANCAMENTOS_APRAZO.COMISSAO AS NUMERIC(10,2)) AS COMISSAO,'
      
        ' CAST(LANCAMENTOS_APRAZO.ARREDONDAMENTO AS NUMERIC(10,2)) AS ARR' +
        'EDONDAMENTO,'
      ' LANCAMENTOS_APRAZO.CD_CLASSE,'
      ' LANCAMENTOS_APRAZO.ID_OPERADORCAIXA,'
      ' LANCAMENTOS_APRAZO.OBSERVACAO,'
      ' LANCAMENTOS_APRAZO.TRN,'
      ' LANCAMENTOS_APRAZO.TRANSACAOTRN,'
      ' LANCAMENTOS_APRAZO.LOTETRN,'
      ' LANCAMENTOS_APRAZO.AUTORIZACAOTRN,'
      ' LANCAMENTOS_APRAZO.SUBSIDIOTRN,'
      ' LANCAMENTOS_APRAZO.NOTAMANUAL'
      'FROM'
      ' LANCAMENTOS_APRAZO,'
      ' TEMP_LANCAMENTOS_APRAZO2'
      'WHERE'
      ' LANCAMENTOS_APRAZO.CD_FILIAL = :CD_FILIAL AND'
      
        ' LANCAMENTOS_APRAZO.CD_LANCAMENTO = TEMP_LANCAMENTOS_APRAZO2.CD_' +
        'LANCAMENTO')
    Left = 688
    Top = 83
    ParamData = <
      item
        Position = 1
        Name = 'CD_FILIAL'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
      end>
  end
  object dspCelotes2: TDataSetProvider
    DataSet = FDceLotes2
    Left = 688
    Top = 126
  end
  object cdsCelotes2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 16
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspCelotes2'
    Left = 688
    Top = 167
    object cdsCelotes2ID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object cdsCelotes2CD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object cdsCelotes2CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object cdsCelotes2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsCelotes2CD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object cdsCelotes2CD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object cdsCelotes2CD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object cdsCelotes2CD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object cdsCelotes2CD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object cdsCelotes2CD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object cdsCelotes2CD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object cdsCelotes2CD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object cdsCelotes2CD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object cdsCelotes2CUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotes2CUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotes2DATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object cdsCelotes2DATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object cdsCelotes2QUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsCelotes2VALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotes2NOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object cdsCelotes2DESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotes2PROMOCAO: TFMTBCDField
      FieldName = 'PROMOCAO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotes2TIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object cdsCelotes2TIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 1
    end
    object cdsCelotes2ENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object cdsCelotes2ETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 1
    end
    object cdsCelotes2ENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object cdsCelotes2HORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsCelotes2ESTOQUE_POSVENDA: TFloatField
      FieldName = 'ESTOQUE_POSVENDA'
    end
    object cdsCelotes2TROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object cdsCelotes2ENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object cdsCelotes2NUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object cdsCelotes2TERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object cdsCelotes2USUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object cdsCelotes2CD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object cdsCelotes2COMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotes2ARREDONDAMENTO: TFMTBCDField
      FieldName = 'ARREDONDAMENTO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCelotes2CD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object cdsCelotes2ID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object cdsCelotes2OBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsCelotes2TRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object cdsCelotes2TRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object cdsCelotes2LOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object cdsCelotes2AUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object cdsCelotes2SUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object cdsCelotes2NOTAMANUAL: TStringField
      FieldName = 'NOTAMANUAL'
      Size = 1
    end
  end
  object FDNumeroCaixaLoja: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' COUNT(*)'
      'FROM'
      ' CAIXA'
      'WHERE'
      ' DATA >= CURRENT_DATE - 1')
    Left = 768
    Top = 82
  end
  object dspNUmeroCaixaLoja: TDataSetProvider
    DataSet = FDNumeroCaixaLoja
    Left = 771
    Top = 125
  end
  object cdsNumeroCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNUmeroCaixaLoja'
    Left = 771
    Top = 169
    object cdsNumeroCaixaLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
    end
  end
  object FDCaixaLoja: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_CAIXA'
      'FROM'
      ' CAIXA'
      'WHERE'
      ' DATA >= CURRENT_DATE - 1')
    Left = 864
    Top = 82
  end
  object dspCaixaLoja: TDataSetProvider
    DataSet = FDCaixaLoja
    Left = 867
    Top = 125
  end
  object cdsCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixaLoja'
    Left = 867
    Top = 169
    object cdsCaixaLojaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object CdsCdCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 863
    Top = 215
    object CdsCdCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object FDCeCaixa: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' CAIXA'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 936
    Top = 82
  end
  object dspCeCaixa: TDataSetProvider
    DataSet = FDCeCaixa
    Left = 939
    Top = 125
  end
  object cdsCeCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCeCaixa'
    Left = 939
    Top = 169
    object cdsCeCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
    object cdsCeCaixaCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object cdsCeCaixaCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object cdsCeCaixaCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object cdsCeCaixaCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object cdsCeCaixaCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object cdsCeCaixaCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object cdsCeCaixaCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object cdsCeCaixaCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object cdsCeCaixaCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object cdsCeCaixaCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object cdsCeCaixaID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object cdsCeCaixaTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Size = 1
    end
    object cdsCeCaixaDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsCeCaixaHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsCeCaixaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsCeCaixaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 12
    end
    object cdsCeCaixaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object cdsCeCaixaTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object cdsCeCaixaENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object cdsCeCaixaENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object cdsCeCaixaTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object cdsCeCaixaENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object cdsCeCaixaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object cdsCeCaixaNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object cdsCeCaixaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object cdsCeCaixaTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object cdsCeCaixaNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object cdsCeCaixaNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object cdsCeCaixaDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object cdsCeCaixaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsCeCaixaARREDONDAMENTO: TFloatField
      FieldName = 'ARREDONDAMENTO'
    end
    object cdsCeCaixaTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object cdsCeCaixaTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object cdsCeCaixaTEFAUTORIZACAO: TStringField
      FieldName = 'TEFAUTORIZACAO'
      Size = 100
    end
    object cdsCeCaixaTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object cdsCeCaixaTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object cdsCeCaixaTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object cdsCeCaixaTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 100
    end
    object cdsCeCaixaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsCeCaixaTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object cdsCeCaixaTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object cdsCeCaixaLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object cdsCeCaixaAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object cdsCeCaixaPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsCeCaixaCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object cdsCeCaixaECF: TStringField
      FieldName = 'ECF'
      Size = 40
    end
  end
  object CdsIncluiProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 16
    object CdsIncluiProdutosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsIncluiProdutosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsIncluiProdutosCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Required = True
      Size = 14
    end
    object CdsIncluiProdutosCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 14
    end
    object CdsIncluiProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsIncluiProdutosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsIncluiProdutosCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsIncluiProdutosCD_GRUPOBALANCO: TFloatField
      FieldName = 'CD_GRUPOBALANCO'
    end
    object CdsIncluiProdutosCD_GRUPOCOMPRA: TFloatField
      FieldName = 'CD_GRUPOCOMPRA'
    end
    object CdsIncluiProdutosCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsIncluiProdutosID_FAMILIA: TFloatField
      FieldName = 'ID_FAMILIA'
    end
    object CdsIncluiProdutosTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 2
    end
    object CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO: TStringField
      FieldName = 'ENTRA_PEDIDO_ELETRONICO'
      Size = 1
    end
    object CdsIncluiProdutosCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object CdsIncluiProdutosTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsIncluiProdutosIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Size = 1
    end
    object CdsIncluiProdutosBALANCA: TStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object CdsIncluiProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object CdsIncluiProdutosQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsIncluiProdutosCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CdsIncluiProdutosPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      Required = True
    end
    object CdsIncluiProdutosPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object CdsIncluiProdutosICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsIncluiProdutosMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object CdsIncluiProdutosMARGEM_PROMOCAO: TFloatField
      FieldName = 'MARGEM_PROMOCAO'
    end
    object CdsIncluiProdutosDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object CdsIncluiProdutosCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
    object CdsIncluiProdutosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsIncluiProdutosUSOCONTINUO: TStringField
      FieldName = 'USOCONTINUO'
      Size = 1
    end
    object CdsIncluiProdutosPIS_COFINS: TStringField
      FieldName = 'PIS_COFINS'
      Size = 1
    end
    object CdsIncluiProdutosNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object CdsIncluiProdutosCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object CdsIncluiProdutosCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object CdsIncluiProdutosCD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object CdsIncluiProdutosSITUACAOTRIBUTARIA: TStringField
      FieldName = 'SITUACAOTRIBUTARIA'
      Size = 3
    end
    object CdsIncluiProdutosORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsIncluiProdutosCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 3
    end
    object CdsIncluiProdutosIAT: TStringField
      FieldName = 'IAT'
      Size = 1
    end
    object CdsIncluiProdutosIPPT: TStringField
      FieldName = 'IPPT'
      Size = 1
    end
    object CdsIncluiProdutosCOMPRIMIDOSCAIXA: TFloatField
      FieldName = 'COMPRIMIDOSCAIXA'
    end
    object CdsIncluiProdutosCONTROLADO: TStringField
      FieldName = 'CONTROLADO'
      Size = 1
    end
    object CdsIncluiProdutosGENERICO: TStringField
      FieldName = 'GENERICO'
      Size = 1
    end
    object CdsIncluiProdutosCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
    object CdsIncluiProdutosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 1000
    end
  end
  object DspCeProdutos: TDataSetProvider
    DataSet = FDCeProdutos
    Left = 1008
    Top = 130
  end
  object CdsCeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeProdutos'
    Left = 1008
    Top = 169
  end
  object FDCeProdutos: TFDQuery
    Connection = FDConn
    Left = 1005
    Top = 82
  end
  object dspOperadores: TDataSetProvider
    DataSet = FDOperadores
    Left = 1088
    Top = 130
  end
  object cdsOperadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOperadores'
    Left = 1088
    Top = 169
    object cdsOperadoresID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object cdsOperadoresCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object cdsOperadoresCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object cdsOperadoresCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object cdsOperadoresNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsOperadoresTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object cdsOperadoresDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object cdsOperadoresDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
    end
    object cdsOperadoresHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
    end
    object cdsOperadoresHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
    end
    object cdsOperadoresDINHEIRO: TFloatField
      FieldName = 'DINHEIRO'
    end
    object cdsOperadoresCHEQUE_PRE: TFloatField
      FieldName = 'CHEQUE_PRE'
    end
    object cdsOperadoresCHEQUE_A_VISTA: TFloatField
      FieldName = 'CHEQUE_A_VISTA'
    end
    object cdsOperadoresCARTAO: TFloatField
      FieldName = 'CARTAO'
    end
    object cdsOperadoresCONVENIO: TFloatField
      FieldName = 'CONVENIO'
    end
    object cdsOperadoresCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
    object cdsOperadoresSAIDAS: TFloatField
      FieldName = 'SAIDAS'
    end
    object cdsOperadoresENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object cdsOperadoresSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object FDOperadores: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' * '
      'FROM '
      ' OPERADORES'
      'WHERE '
      ' STATUS <> '#39'C'#39' AND (ENVIADO <> '#39'2'#39' OR ENVIADO IS NULL)')
    Left = 1085
    Top = 82
  end
  object dspCrm: TDataSetProvider
    DataSet = FDCrm
    Left = 1147
    Top = 132
  end
  object cdsCRM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCrm'
    Left = 1147
    Top = 171
    object cdsCRMID_CRM: TFloatField
      FieldName = 'ID_CRM'
    end
    object cdsCRMCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object cdsCRMCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsCRMCRM: TStringField
      FieldName = 'CRM'
      Size = 30
    end
    object cdsCRMUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsCRMCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object cdsCRMCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object cdsCRMMEDICO: TStringField
      FieldName = 'MEDICO'
      Size = 100
    end
    object cdsCRMCODIGO_BARRA: TStringField
      FieldName = 'CODIGO_BARRA'
      Size = 13
    end
    object cdsCRMDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsCRMQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsCRMDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsCRMHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsCRMID_MEDICO: TFloatField
      FieldName = 'ID_MEDICO'
    end
    object cdsCRMID_ENDERECO: TFloatField
      FieldName = 'ID_ENDERECO'
    end
    object cdsCRMID_AREA: TFloatField
      FieldName = 'ID_AREA'
    end
    object cdsCRMTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsCRMCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsCRMIMS: TStringField
      FieldName = 'IMS'
      Size = 1
    end
    object cdsCRMID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object cdsCRMCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object cdsCRMFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object cdsCRMTIPO_CRM: TStringField
      FieldName = 'TIPO_CRM'
      Size = 1
    end
    object cdsCRMGEN: TStringField
      FieldName = 'GEN'
      Size = 1
    end
    object cdsCRMENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object FDCrm: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM '
      ' CRM'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 1144
    Top = 84
  end
  object dspEntregas: TDataSetProvider
    DataSet = FdEntregas
    Left = 1203
    Top = 132
  end
  object cdsEntregas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntregas'
    Left = 1203
    Top = 171
    object cdsEntregasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object cdsEntregasCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object cdsEntregasCD_ENTREGADOR: TFloatField
      FieldName = 'CD_ENTREGADOR'
    end
    object cdsEntregasCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object cdsEntregasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsEntregasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsEntregasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsEntregasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 100
    end
    object cdsEntregasDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsEntregasHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
    end
    object cdsEntregasHORA_CHEGADA: TTimeField
      FieldName = 'HORA_CHEGADA'
    end
    object cdsEntregasTROCO: TFloatField
      FieldName = 'TROCO'
    end
    object cdsEntregasVALORRETORNO: TFloatField
      FieldName = 'VALORRETORNO'
    end
    object cdsEntregasENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object cdsEntregasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsEntregasOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsEntregasHORAINICIAL: TTimeField
      FieldName = 'HORAINICIAL'
    end
    object cdsEntregasHORAFINAL: TTimeField
      FieldName = 'HORAFINAL'
    end
  end
  object FdEntregas: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' * '
      'FROM'
      ' ENTREGAS'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 1200
    Top = 83
  end
end
