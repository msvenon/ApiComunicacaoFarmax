object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 733
  Width = 1577
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
    Top = 141
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
    Top = 183
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
    Top = 227
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
    Top = 7
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 520
    Top = 7
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
    Top = 142
  end
  object dspCeCadFin: TDataSetProvider
    DataSet = FDCeCadFin
    Left = 190
    Top = 184
  end
  object cdsCeCadFin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCeCadFin'
    Left = 184
    Top = 230
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
    Top = 140
  end
  object FdqNumeroLancamentosLoja: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'SELECT  COUNT(*) FROM LANCAMENTOS WHERE DATA_LANCAMENTO >= CURRE' +
        'NT_DATE - 1')
    Left = 371
    Top = 138
  end
  object dspNUmeroLancamentosLoja: TDataSetProvider
    DataSet = FdqNumeroLancamentosLoja
    Left = 372
    Top = 185
  end
  object cdsNumeroLancamentosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNUmeroLancamentosLoja'
    Left = 371
    Top = 227
    object cdsNumeroLancamentosLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
    end
  end
  object cdsCdLancamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 371
    Top = 253
  end
  object FdLancamentosLoja: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'SELECT  CD_LANCAMENTO FROM LANCAMENTOS WHERE  DATA_LANCAMENTO >=' +
        ' CURRENT_DATE - 1')
    Left = 494
    Top = 139
  end
  object dspLancamentosLoja: TDataSetProvider
    DataSet = FdLancamentosLoja
    Left = 496
    Top = 184
  end
  object cdsLancamentosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLancamentosLoja'
    Left = 496
    Top = 231
    object cdsLancamentosLojaCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object dspCeLotes: TDataSetProvider
    DataSet = FDCeLotes
    Left = 272
    Top = 182
  end
  object cdsCelotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCeLotes'
    Left = 268
    Top = 226
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
    Top = 147
  end
  object dpParametros: TDataSetProvider
    DataSet = FdParametros
    Left = 114
    Top = 185
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpParametros'
    Left = 109
    Top = 229
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
    Top = 139
  end
  object dspControlador: TDataSetProvider
    DataSet = FDControlador
    Left = 596
    Top = 185
  end
  object cdsControlador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControlador'
    Left = 599
    Top = 230
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
  object fdSql1: TFDQuery
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
    Left = 185
    Top = 493
  end
  object dspSql1: TDataSetProvider
    DataSet = fdSql1
    Left = 185
    Top = 534
  end
  object cdsSql1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSql1'
    Left = 187
    Top = 571
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
    Left = 674
    Top = 141
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
    Left = 674
    Top = 186
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
    Left = 674
    Top = 228
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
    Left = 754
    Top = 140
  end
  object dspNUmeroCaixaLoja: TDataSetProvider
    DataSet = FDNumeroCaixaLoja
    Left = 757
    Top = 185
  end
  object cdsNumeroCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNUmeroCaixaLoja'
    Left = 757
    Top = 229
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
    Left = 841
    Top = 140
  end
  object dspCaixaLoja: TDataSetProvider
    DataSet = FDCaixaLoja
    Left = 844
    Top = 185
  end
  object cdsCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixaLoja'
    Left = 844
    Top = 228
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
    Left = 848
    Top = 257
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
    Left = 913
    Top = 140
  end
  object dspCeCaixa: TDataSetProvider
    DataSet = FDCeCaixa
    Left = 916
    Top = 186
  end
  object cdsCeCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCeCaixa'
    Left = 916
    Top = 229
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
    Left = 768
    Top = 8
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
    Left = 985
    Top = 189
  end
  object CdsCeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeProdutos'
    Left = 985
    Top = 230
  end
  object FDCeProdutos: TFDQuery
    Connection = FDConn
    Left = 982
    Top = 140
  end
  object dspOperadores: TDataSetProvider
    DataSet = FDOperadores
    Left = 1065
    Top = 190
  end
  object cdsOperadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOperadores'
    Left = 1065
    Top = 231
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
    Left = 1062
    Top = 140
  end
  object dspCrm: TDataSetProvider
    DataSet = FDCrm
    Left = 1124
    Top = 192
  end
  object cdsCRM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCrm'
    Left = 1124
    Top = 234
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
    Left = 1121
    Top = 143
  end
  object dspEntregas: TDataSetProvider
    DataSet = FdEntregas
    Left = 1180
    Top = 193
  end
  object cdsEntregas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntregas'
    Left = 1180
    Top = 235
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
    Left = 1177
    Top = 142
  end
  object FDItensTransfer: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      ' ITENS_TRANSFER.*'
      'FROM'
      ' ITENS_TRANSFER'
      'WHERE'
      ' ITENS_TRANSFER.CD_TRANSFER = :CD_TRANSFER AND'
      ' ITENS_TRANSFER.ID_PRODUTO = :ID_PRODUTO')
    Left = 28
    Top = 285
    ParamData = <
      item
        Position = 1
        Name = 'CD_TRANSFER'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspItensTransfer: TDataSetProvider
    DataSet = FDItensTransfer
    Left = 28
    Top = 335
  end
  object QryItensTransfer: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_TRANSFER'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'DspItensTransfer'
    Left = 31
    Top = 380
    object QryItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
      Origin = 'CD_TRANSFER'
    end
    object QryItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object QryItensTransferCD_PRODUTO: TFloatField
      FieldName = 'CD_PRODUTO'
      Origin = 'CD_PRODUTO'
    end
    object QryItensTransferCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = 'CD_GRUPO'
    end
    object QryItensTransferCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
      Origin = 'CD_LABORATORIO'
    end
    object QryItensTransferDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object QryItensTransferQUANTIDADE_SOLICITADA: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
      Origin = 'QUANTIDADE_SOLICITADA'
    end
    object QryItensTransferQUANTIDADE_ENVIADA: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
      Origin = 'QUANTIDADE_ENVIADA'
    end
    object QryItensTransferQUANTIDADE_RECEBIDA: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
      Origin = 'QUANTIDADE_RECEBIDA'
    end
    object QryItensTransferVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object QryItensTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 255
    end
    object QryItensTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
    object QryItensTransferCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Origin = 'CD_CLASSE'
    end
  end
  object CdsItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 31
    Top = 426
    object CdsItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CdsItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CdsItensTransferCD_PRODUTO: TFloatField
      FieldName = 'CD_PRODUTO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsItensTransferCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsItensTransferCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsItensTransferDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object CdsItensTransferQUANTIDADE_SOLICITADA: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsItensTransferQUANTIDADE_ENVIADA: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsItensTransferQUANTIDADE_RECEBIDA: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsItensTransferVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
    end
    object CdsItensTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object CdsItensTransferSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsItensTransferCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DspCeItensTransfer: TDataSetProvider
    DataSet = TbItensTransfer
    Left = 112
    Top = 334
  end
  object CdsCeItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeItensTransfer'
    Left = 112
    Top = 380
    object CdsCeItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsCeItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsCeItensTransferCD_PRODUTO: TFloatField
      FieldName = 'CD_PRODUTO'
    end
    object CdsCeItensTransferCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsCeItensTransferCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsCeItensTransferDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 45
    end
    object CdsCeItensTransferQUANTIDADE_SOLICITADA: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
    end
    object CdsCeItensTransferQUANTIDADE_ENVIADA: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
    end
    object CdsCeItensTransferQUANTIDADE_RECEBIDA: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
    end
    object CdsCeItensTransferVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsCeItensTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object CdsCeItensTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsCeItensTransferCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
  end
  object TbItensTransfer: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' ITENS_TRANSFER.*'
      'FROM'
      ' TRANSFER, '
      ' ITENS_TRANSFER'
      'WHERE'
      ' TRANSFER.CD_TRANSFER = ITENS_TRANSFER.CD_TRANSFER AND'
      ' ITENS_TRANSFER.STATUS <> '#39'A'#39' AND'
      ' TRANSFER.ENVIADO = '#39'9'#39)
    Left = 113
    Top = 285
  end
  object CdsCeTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeTransfer'
    Left = 191
    Top = 379
    object CdsCeTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsCeTransferDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
    end
    object CdsCeTransferDATA_ENVIO: TDateField
      FieldName = 'DATA_ENVIO'
    end
    object CdsCeTransferHORA_ENVIO: TTimeField
      FieldName = 'HORA_ENVIO'
    end
    object CdsCeTransferDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object CdsCeTransferHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object CdsCeTransferCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object CdsCeTransferCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object CdsCeTransferCD_USUARIO_ORIGEM: TFloatField
      FieldName = 'CD_USUARIO_ORIGEM'
    end
    object CdsCeTransferCD_USUARIO_DESTINO: TFloatField
      FieldName = 'CD_USUARIO_DESTINO'
    end
    object CdsCeTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object CdsCeTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsCeTransferENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCeTransferHORA_GERACAO: TTimeField
      FieldName = 'HORA_GERACAO'
    end
    object CdsCeTransferCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
  end
  object DspCeTransfer: TDataSetProvider
    DataSet = FDTransfer
    Left = 191
    Top = 335
  end
  object FDTransfer: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' TRANSFER'
      'WHERE'
      ' STATUS <> '#39'A'#39' AND'
      ' ENVIADO = '#39'9'#39)
    Left = 191
    Top = 287
  end
  object DspCadernoFaltas: TDataSetProvider
    DataSet = FDCardenoFaltas
    Left = 276
    Top = 330
  end
  object CdsCadernoFaltas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCadernoFaltas'
    Left = 276
    Top = 375
    object CdsCadernoFaltasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Origin = 'CD_FILIAL'
    end
    object CdsCadernoFaltasID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object CdsCadernoFaltasCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'CD_PRODUTO'
      Size = 6
    end
    object CdsCadernoFaltasCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
    end
    object CdsCadernoFaltasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 100
    end
    object CdsCadernoFaltasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object CdsCadernoFaltasCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = 'CD_GRUPO'
    end
    object CdsCadernoFaltasCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
      Origin = 'CD_LABORATORIO'
    end
    object CdsCadernoFaltasCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Origin = 'CD_CLASSE'
    end
    object CdsCadernoFaltasCURVA: TStringField
      FieldName = 'CURVA'
      Origin = 'CURVA'
      Size = 1
    end
    object CdsCadernoFaltasCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      Origin = 'CD_VENDEDOR'
    end
    object CdsCadernoFaltasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object CdsCadernoFaltasQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object CdsCadernoFaltasID_MOTIVOFALTA: TFloatField
      FieldName = 'ID_MOTIVOFALTA'
      Origin = 'ID_MOTIVOFALTA'
    end
    object CdsCadernoFaltasSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
  end
  object FDCardenoFaltas: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' CADERNO_FALTAS'
      'WHERE'
      ' (STATUS <> '#39'E'#39') OR (STATUS IS NULL)')
    Left = 272
    Top = 285
  end
  object DspPrecoVenda: TDataSetProvider
    DataSet = FDPrecoVenda
    Left = 365
    Top = 331
  end
  object CdsPrecoVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPrecoVenda'
    Left = 365
    Top = 373
  end
  object FDPrecoVenda: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      '  FIRST 2000 '
      '  PRODUTOS.ID_PRODUTO,'
      '  PRODUTOS.PRECO_VENDA_1,'
      '  PRODUTOS.PRECO_PROMOCAO_1,'
      '  PRODUTOS.DT_VENCIMENTO_PROMOCAO_1,'
      '  PRODUTOS.DT_REAJUSTE_1'
      'FROM '
      ' PRODUTOS,'
      ' TEMP_PRODUTOS'
      'WHERE '
      ' PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS.ID_PRODUTO AND'
      ' TEMP_PRODUTOS.CD_FILIAL = :FILIAL AND '
      ' TEMP_PRODUTOS.PROCESSO = 125')
    Left = 365
    Top = 288
    ParamData = <
      item
        Name = 'FILIAL'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end>
  end
  object DspConferenciaNota: TDataSetProvider
    DataSet = FdConferenciaNota
    Left = 458
    Top = 333
  end
  object CdsConferenciaNota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConferenciaNota'
    Left = 458
    Top = 373
    object CdsConferenciaNotaID_CONFERENCIANOTA: TFloatField
      FieldName = 'ID_CONFERENCIANOTA'
      Required = True
    end
    object CdsConferenciaNotaCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object CdsConferenciaNotaCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsConferenciaNotaNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 7
    end
    object CdsConferenciaNotaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsConferenciaNotaCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsConferenciaNotaCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object CdsConferenciaNotaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsConferenciaNotaCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsConferenciaNotaCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsConferenciaNotaCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsConferenciaNotaCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 100
    end
    object CdsConferenciaNotaGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object CdsConferenciaNotaLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 100
    end
    object CdsConferenciaNotaVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object CdsConferenciaNotaVL_UNITARIO_NOTA: TFloatField
      FieldName = 'VL_UNITARIO_NOTA'
    end
    object CdsConferenciaNotaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsConferenciaNotaQUANTIDADE_NOTA: TFloatField
      FieldName = 'QUANTIDADE_NOTA'
    end
    object CdsConferenciaNotaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsConferenciaNotaSTATUSCONFERENCIA: TStringField
      FieldName = 'STATUSCONFERENCIA'
      Size = 1
    end
    object CdsConferenciaNotaCD_USUARIO_CONFERENCIA: TFloatField
      FieldName = 'CD_USUARIO_CONFERENCIA'
    end
    object CdsConferenciaNotaUSUARIO_CONFERENCIA: TStringField
      FieldName = 'USUARIO_CONFERENCIA'
    end
    object CdsConferenciaNotaENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsConferenciaNotaCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object CdsConferenciaNotaQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
  end
  object FdConferenciaNota: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM CONFERENCIA_NOTA '
      'WHERE ENVIADO = '#39'9'#39)
    Left = 456
    Top = 290
  end
  object DspCeUsu: TDataSetProvider
    DataSet = FDUsu
    Left = 538
    Top = 334
  end
  object CdsCeUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeUsu'
    Left = 538
    Top = 373
    object CdsCeUsuCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object CdsCeUsuSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
  end
  object FDUsu: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_USUARIO,'
      ' SENHA'
      'FROM'
      ' USUARIOS'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 536
    Top = 290
  end
  object DspPosicaoEstoque: TDataSetProvider
    DataSet = FDPosicaoEstoque
    Left = 608
    Top = 334
  end
  object CdsPosicaoEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPosicaoEstoque'
    Left = 608
    Top = 374
    object CdsPosicaoEstoqueDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object CdsPosicaoEstoqueCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsPosicaoEstoqueID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsPosicaoEstoqueQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsPosicaoEstoqueCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object CdsPosicaoEstoqueVENDA: TFloatField
      FieldName = 'VENDA'
    end
    object CdsPosicaoEstoqueENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object FDPosicaoEstoque: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' POSICAOESTOQUEDATA.*'
      'FROM '
      ' POSICAOESTOQUEDATA,'
      ' TEMP_POSICAOESTOQUE2'
      'WHERE'
      ' POSICAOESTOQUEDATA.ID_PRODUTO = TEMP_POSICAOESTOQUE2.ID_PRODUTO')
    Left = 608
    Top = 291
  end
  object DspCeDuplic: TDataSetProvider
    DataSet = FDDuplic
    Left = 688
    Top = 336
  end
  object CdsCeDuplic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeDuplic'
    Left = 688
    Top = 374
    object CdsCeDuplicCD_CONTAS_PAGAR: TFloatField
      FieldName = 'CD_CONTAS_PAGAR'
      Required = True
    end
    object CdsCeDuplicCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsCeDuplicCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsCeDuplicCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object CdsCeDuplicCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object CdsCeDuplicCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsCeDuplicCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsCeDuplicNUMERO_NOTA: TStringField
      FieldName = 'NUMERO_NOTA'
      Size = 6
    end
    object CdsCeDuplicSERIAL_NOTA: TStringField
      FieldName = 'SERIAL_NOTA'
      Size = 3
    end
    object CdsCeDuplicDOCUMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'DOCUMENTO'
    end
    object CdsCeDuplicDT_NOTA: TDateField
      FieldName = 'DT_NOTA'
    end
    object CdsCeDuplicDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsCeDuplicVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsCeDuplicOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object CdsCeDuplicDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object CdsCeDuplicDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object CdsCeDuplicDT_BOLETO: TDateField
      FieldName = 'DT_BOLETO'
    end
    object CdsCeDuplicVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object CdsCeDuplicVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object CdsCeDuplicVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object CdsCeDuplicVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object CdsCeDuplicNOSSO_NUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'NOSSO_NUMERO'
    end
    object CdsCeDuplicBANCO: TStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object CdsCeDuplicAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 6
    end
    object CdsCeDuplicCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object CdsCeDuplicHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CdsCeDuplicNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object CdsCeDuplicSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsCeDuplicENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCeDuplicDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
    end
    object CdsCeDuplicDESPESAFINANCEIRA: TFloatField
      FieldName = 'DESPESAFINANCEIRA'
    end
    object CdsCeDuplicTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CdsCeDuplicID_DDA_BOLETOS: TIntegerField
      FieldName = 'ID_DDA_BOLETOS'
    end
  end
  object FDDuplic: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM '
      ' CONTAS_PAGAR'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 688
    Top = 290
  end
  object DspCePedid1: TDataSetProvider
    DataSet = FDPedid1
    Left = 756
    Top = 337
  end
  object CdsCePedid1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCePedid1'
    Left = 757
    Top = 375
    object CdsCePedid1CD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object CdsCePedid1CD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsCePedid1CD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsCePedid1CD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsCePedid1CD_OBSERVACAO: TFloatField
      FieldName = 'CD_OBSERVACAO'
    end
    object CdsCePedid1CD_TRANSPORTADORA: TFloatField
      FieldName = 'CD_TRANSPORTADORA'
    end
    object CdsCePedid1DT_PEDIDO: TDateField
      FieldName = 'DT_PEDIDO'
    end
    object CdsCePedid1NOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 6
    end
    object CdsCePedid1SERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object CdsCePedid1DT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object CdsCePedid1BOLETO: TStringField
      FieldName = 'BOLETO'
      Size = 1
    end
    object CdsCePedid1DT_BOLETO: TDateField
      FieldName = 'DT_BOLETO'
    end
    object CdsCePedid1CD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object CdsCePedid1DT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
    end
    object CdsCePedid1VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object CdsCePedid1VL_ICM: TFloatField
      FieldName = 'VL_ICM'
    end
    object CdsCePedid1TOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
    end
    object CdsCePedid1ICM_BASE_CALCULO: TFloatField
      FieldName = 'ICM_BASE_CALCULO'
    end
    object CdsCePedid1ICM_ISENTO: TFloatField
      FieldName = 'ICM_ISENTO'
    end
    object CdsCePedid1ICM_OUTROS: TFloatField
      FieldName = 'ICM_OUTROS'
    end
    object CdsCePedid1ICM_BASESUBST: TFloatField
      FieldName = 'ICM_BASESUBST'
    end
    object CdsCePedid1ICM_VALORSUBST: TFloatField
      FieldName = 'ICM_VALORSUBST'
    end
    object CdsCePedid1VL_TOTALPRODUTOS: TFloatField
      FieldName = 'VL_TOTALPRODUTOS'
    end
    object CdsCePedid1VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object CdsCePedid1OUTRAS_DESPESAS: TFloatField
      FieldName = 'OUTRAS_DESPESAS'
    end
    object CdsCePedid1VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object CdsCePedid1IPI_BASE_CALCULO: TFloatField
      FieldName = 'IPI_BASE_CALCULO'
    end
    object CdsCePedid1IPI_ISENTO: TFloatField
      FieldName = 'IPI_ISENTO'
    end
    object CdsCePedid1IPI_OUTROS: TFloatField
      FieldName = 'IPI_OUTROS'
    end
    object CdsCePedid1D_ICMV: TFloatField
      FieldName = 'D_ICMV'
    end
    object CdsCePedid1D_IPIV: TFloatField
      FieldName = 'D_IPIV'
    end
    object CdsCePedid1D_TOTNT: TFloatField
      FieldName = 'D_TOTNT'
    end
    object CdsCePedid1UNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object CdsCePedid1NUMERO_ITENS: TFloatField
      FieldName = 'NUMERO_ITENS'
    end
    object CdsCePedid1FATURAMENTO: TStringField
      FieldName = 'FATURAMENTO'
      Size = 10
    end
    object CdsCePedid1MOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 1
    end
    object CdsCePedid1ENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCePedid1STATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsCePedid1VL_DESCONTO_NOTA: TFloatField
      FieldName = 'VL_DESCONTO_NOTA'
    end
    object CdsCePedid1CD_USUARIO_CRIACAO: TFloatField
      FieldName = 'CD_USUARIO_CRIACAO'
    end
    object CdsCePedid1USUARIO_DIGITACAO: TStringField
      FieldName = 'USUARIO_DIGITACAO'
    end
    object CdsCePedid1CD_USUARIO_DIGITACAO: TFloatField
      FieldName = 'CD_USUARIO_DIGITACAO'
    end
    object CdsCePedid1USUARIO_CRIACAO: TStringField
      FieldName = 'USUARIO_CRIACAO'
    end
    object CdsCePedid1CD_USUARIO_CONCLUSAO: TFloatField
      FieldName = 'CD_USUARIO_CONCLUSAO'
    end
    object CdsCePedid1USUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
    end
    object CdsCePedid1CD_USUARIO_ENVIO: TFloatField
      FieldName = 'CD_USUARIO_ENVIO'
    end
    object CdsCePedid1USUARIO_ENVIO: TStringField
      FieldName = 'USUARIO_ENVIO'
    end
    object CdsCePedid1VINCULADO: TStringField
      FieldName = 'VINCULADO'
      Size = 1
    end
    object CdsCePedid1CD_COMPRAS_VINCULADO: TFloatField
      FieldName = 'CD_COMPRAS_VINCULADO'
    end
    object CdsCePedid1TEMVINCULADO: TStringField
      FieldName = 'TEMVINCULADO'
      Size = 1
    end
    object CdsCePedid1STATUSCONFERENCIA: TStringField
      FieldName = 'STATUSCONFERENCIA'
      Size = 1
    end
    object CdsCePedid1CD_USUARIO_CONFERENCIA: TFloatField
      FieldName = 'CD_USUARIO_CONFERENCIA'
    end
    object CdsCePedid1USUARIO_CONFERENCIA: TStringField
      FieldName = 'USUARIO_CONFERENCIA'
    end
    object CdsCePedid1CONFIGGERACAO: TStringField
      FieldName = 'CONFIGGERACAO'
      Size = 1000
    end
    object CdsCePedid1LOCALGERACAO: TStringField
      FieldName = 'LOCALGERACAO'
      Size = 1
    end
    object CdsCePedid1MODELONF: TStringField
      FieldName = 'MODELONF'
      Size = 2
    end
    object CdsCePedid1VL_ISENTOICMS: TFloatField
      FieldName = 'VL_ISENTOICMS'
    end
    object CdsCePedid1ICMS_RETIDO: TFloatField
      FieldName = 'ICMS_RETIDO'
    end
    object CdsCePedid1PHARMALINK: TStringField
      FieldName = 'PHARMALINK'
      Size = 1
    end
    object CdsCePedid1BONIFICACAO: TStringField
      FieldName = 'BONIFICACAO'
      Size = 1
    end
    object CdsCePedid1CHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 100
    end
    object CdsCePedid1VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object CdsCePedid1VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object CdsCePedid1INFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 10000
    end
    object CdsCePedid1TRANSFERENCIA: TStringField
      FieldName = 'TRANSFERENCIA'
      Size = 1
    end
    object CdsCePedid1CONSIGNACAO: TStringField
      FieldName = 'CONSIGNACAO'
      Size = 1
    end
    object CdsCePedid1VL_FCP: TFMTBCDField
      FieldName = 'VL_FCP'
      Precision = 18
      Size = 2
    end
    object CdsCePedid1VL_FCPST: TFMTBCDField
      FieldName = 'VL_FCPST'
      Precision = 18
      Size = 2
    end
    object CdsCePedid1VL_FCPSTRET: TFMTBCDField
      FieldName = 'VL_FCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsCePedid1VL_II: TFMTBCDField
      FieldName = 'VL_II'
      Precision = 18
      Size = 2
    end
    object CdsCePedid1ICM_BASESUBSTRET: TFMTBCDField
      FieldName = 'ICM_BASESUBSTRET'
      Precision = 18
      Size = 2
    end
    object CdsCePedid1ICM_VALORSUBSTRET: TFMTBCDField
      FieldName = 'ICM_VALORSUBSTRET'
      Precision = 18
      Size = 2
    end
    object CdsCePedid1ICMSDESONERACAO: TFMTBCDField
      FieldName = 'ICMSDESONERACAO'
      Precision = 18
      Size = 2
    end
  end
  object FDPedid1: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' COMPRAS'
      'WHERE'
      
        ' CD_COMPRAS IN (SELECT CD_COMPRAS FROM TEMP_COMPRAS WHERE ENVIAD' +
        'O = '#39'9'#39' AND PROCESSO = '#39'4'#39')')
    Left = 758
    Top = 292
  end
  object DspCePedido: TDataSetProvider
    DataSet = FDPedido
    Left = 822
    Top = 338
  end
  object CdsCePedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCePedido'
    Left = 822
    Top = 376
    object CdsCePedidoCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object CdsCePedidoID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsCePedidoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 5
    end
    object CdsCePedidoCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsCePedidoCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object CdsCePedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsCePedidoSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object CdsCePedidoESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object CdsCePedidoESTOQUE_MAXIMO: TFloatField
      FieldName = 'ESTOQUE_MAXIMO'
    end
    object CdsCePedidoLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 40
    end
    object CdsCePedidoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 40
    end
    object CdsCePedidoCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 40
    end
    object CdsCePedidoCD_SITUACAO_TRIB: TFloatField
      FieldName = 'CD_SITUACAO_TRIB'
    end
    object CdsCePedidoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object CdsCePedidoVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object CdsCePedidoPERCENTUAL_ICMS: TFloatField
      FieldName = 'PERCENTUAL_ICMS'
    end
    object CdsCePedidoREDUCAO_ICMS: TFloatField
      FieldName = 'REDUCAO_ICMS'
    end
    object CdsCePedidoVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object CdsCePedidoPERCENTUAL_DESCONTO: TFloatField
      FieldName = 'PERCENTUAL_DESCONTO'
    end
    object CdsCePedidoVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object CdsCePedidoPERCENTUAL_IPI: TFloatField
      FieldName = 'PERCENTUAL_IPI'
    end
    object CdsCePedidoVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object CdsCePedidoVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object CdsCePedidoPERCENTUAL_MARGEM: TFloatField
      FieldName = 'PERCENTUAL_MARGEM'
    end
    object CdsCePedidoCD_ATENDIMENTO: TStringField
      FieldName = 'CD_ATENDIMENTO'
      Size = 2
    end
    object CdsCePedidoNOVO_PRECO: TFloatField
      FieldName = 'NOVO_PRECO'
    end
    object CdsCePedidoNOVO_CUSTO: TFloatField
      FieldName = 'NOVO_CUSTO'
    end
    object CdsCePedidoATUALIZAR_PRECO: TStringField
      FieldName = 'ATUALIZAR_PRECO'
      Size = 1
    end
    object CdsCePedidoENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCePedidoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object CdsCePedidoQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsCePedidoCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object CdsCePedidoULTIMOCUSTO: TFloatField
      FieldName = 'ULTIMOCUSTO'
    end
    object CdsCePedidoPRECO_REAJUSTADO: TStringField
      FieldName = 'PRECO_REAJUSTADO'
      Size = 1
    end
    object CdsCePedidoCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
    object CdsCePedidoMEDIAF: TFloatField
      FieldName = 'MEDIAF'
    end
    object CdsCePedidoCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 13
    end
    object CdsCePedidoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object CdsCePedidoICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsCePedidoBASEICMS: TFloatField
      FieldName = 'BASEICMS'
    end
    object CdsCePedidoBASEICMSSUBSTITUICAO: TFloatField
      FieldName = 'BASEICMSSUBSTITUICAO'
    end
    object CdsCePedidoSITUACAOTRIBITARIA: TStringField
      FieldName = 'SITUACAOTRIBITARIA'
      Size = 3
    end
    object CdsCePedidoLOTE: TStringField
      FieldName = 'LOTE'
    end
    object CdsCePedidoFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object CdsCePedidoVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object CdsCePedidoPRECO_PROMOCAO_ATUAL: TFloatField
      FieldName = 'PRECO_PROMOCAO_ATUAL'
    end
    object CdsCePedidoPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object CdsCePedidoDESCONTO_OUTROS: TFloatField
      FieldName = 'DESCONTO_OUTROS'
    end
    object CdsCePedidoDIASSEMVENDER: TStringField
      FieldName = 'DIASSEMVENDER'
      Size = 1
    end
    object CdsCePedidoCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object CdsCePedidoVALORICMSSUBTITUICAO: TFloatField
      FieldName = 'VALORICMSSUBTITUICAO'
    end
    object CdsCePedidoCUSTO_APLICADO: TFloatField
      FieldName = 'CUSTO_APLICADO'
    end
    object CdsCePedidoMARGEM_VALOR_AGREGADO: TFloatField
      FieldName = 'MARGEM_VALOR_AGREGADO'
    end
    object CdsCePedidoREDUCAO_ICMS_ST: TFloatField
      FieldName = 'REDUCAO_ICMS_ST'
    end
    object CdsCePedidoPERCENTUAL_ICMS_ST: TFloatField
      FieldName = 'PERCENTUAL_ICMS_ST'
    end
    object CdsCePedidoPIS_CST: TStringField
      FieldName = 'PIS_CST'
      Size = 3
    end
    object CdsCePedidoPIS_BASE_CALCULO: TFloatField
      FieldName = 'PIS_BASE_CALCULO'
    end
    object CdsCePedidoPIS_PERCENTUAL: TFloatField
      FieldName = 'PIS_PERCENTUAL'
    end
    object CdsCePedidoPIS_VALOR: TFloatField
      FieldName = 'PIS_VALOR'
    end
    object CdsCePedidoCOFINS_CST: TStringField
      FieldName = 'COFINS_CST'
      Size = 3
    end
    object CdsCePedidoCOFINS_BASE_CALCULO: TFloatField
      FieldName = 'COFINS_BASE_CALCULO'
    end
    object CdsCePedidoCOFINS_PERCENTUAL: TFloatField
      FieldName = 'COFINS_PERCENTUAL'
    end
    object CdsCePedidoCOFINS_VALOR: TFloatField
      FieldName = 'COFINS_VALOR'
    end
    object CdsCePedidoVALOR_OUTRASDESPESAS: TFloatField
      FieldName = 'VALOR_OUTRASDESPESAS'
    end
    object CdsCePedidoVALOR_SEGURO: TFloatField
      FieldName = 'VALOR_SEGURO'
    end
    object CdsCePedidoVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object CdsCePedidoVALOR_ISENTO: TFloatField
      FieldName = 'VALOR_ISENTO'
    end
    object CdsCePedidoVALOR_OUTRAS: TFloatField
      FieldName = 'VALOR_OUTRAS'
    end
    object CdsCePedidoBASECALCULO_IPI: TFloatField
      FieldName = 'BASECALCULO_IPI'
    end
    object CdsCePedidoCST_IPI: TIntegerField
      FieldName = 'CST_IPI'
    end
    object CdsCePedidoNATUREZA_ISENTA_PIS: TStringField
      FieldName = 'NATUREZA_ISENTA_PIS'
      Size = 100
    end
    object CdsCePedidoNATUREZA_ISENTA_COFINS: TStringField
      FieldName = 'NATUREZA_ISENTA_COFINS'
      Size = 100
    end
    object CdsCePedidoCEST: TStringField
      FieldName = 'CEST'
      Size = 100
    end
    object CdsCePedidoBASECALCULOFCP: TFMTBCDField
      FieldName = 'BASECALCULOFCP'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoALIQUOTAFCP: TFMTBCDField
      FieldName = 'ALIQUOTAFCP'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoVALORFCP: TFMTBCDField
      FieldName = 'VALORFCP'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoBASECALCULOFCPST: TFMTBCDField
      FieldName = 'BASECALCULOFCPST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoALIQUOTAFCPST: TFMTBCDField
      FieldName = 'ALIQUOTAFCPST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoVALORFCPST: TFMTBCDField
      FieldName = 'VALORFCPST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoBASECALCULOFCPSTRET: TFMTBCDField
      FieldName = 'BASECALCULOFCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoALIQUOTAFCPSTRET: TFMTBCDField
      FieldName = 'ALIQUOTAFCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoVALORFCPSTRET: TFMTBCDField
      FieldName = 'VALORFCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoBASEICMSSUBSTITUICAORET: TFMTBCDField
      FieldName = 'BASEICMSSUBSTITUICAORET'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoPERCENTUAL_ICMS_ST_RET: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST_RET'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoVALORICMSSUBSTITUICAORET: TFMTBCDField
      FieldName = 'VALORICMSSUBSTITUICAORET'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoNCM: TStringField
      FieldName = 'NCM'
    end
    object CdsCePedidoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsCePedidoINFORMACOESADICIONAIS: TStringField
      FieldName = 'INFORMACOESADICIONAIS'
      Size = 500
    end
    object CdsCePedidoMODALIDADEBC: TIntegerField
      FieldName = 'MODALIDADEBC'
    end
    object CdsCePedidoMODALIDADEBCST: TIntegerField
      FieldName = 'MODALIDADEBCST'
    end
    object CdsCePedidoICMSBCUFDEST: TFMTBCDField
      FieldName = 'ICMSBCUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSBCFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSBCFCPUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSPERCENTUALFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSPERCENTUALFCPUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSVALORFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSVALORFCPUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSPERCENTUALINTER: TFMTBCDField
      FieldName = 'ICMSPERCENTUALINTER'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSPERCENTUALUFDEST: TFMTBCDField
      FieldName = 'ICMSPERCENTUALUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSVALORUFREMET: TFMTBCDField
      FieldName = 'ICMSVALORUFREMET'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSVALORUFDEST: TFMTBCDField
      FieldName = 'ICMSVALORUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoICMSPERCENTUALINTERPART: TFMTBCDField
      FieldName = 'ICMSPERCENTUALINTERPART'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoCODIGOANVISA: TStringField
      FieldName = 'CODIGOANVISA'
      Size = 15
    end
    object CdsCePedidoPMC: TFMTBCDField
      FieldName = 'PMC'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoCODIGOBENEFICIO: TStringField
      FieldName = 'CODIGOBENEFICIO'
      Size = 10
    end
    object CdsCePedidoMOTIVODESONERACAO: TStringField
      FieldName = 'MOTIVODESONERACAO'
      Size = 100
    end
    object CdsCePedidoVALORDESONERACAO: TFMTBCDField
      FieldName = 'VALORDESONERACAO'
      Precision = 18
      Size = 2
    end
    object CdsCePedidoPERCENTUALDESONERACAO: TFMTBCDField
      FieldName = 'PERCENTUALDESONERACAO'
      Precision = 18
      Size = 2
    end
  end
  object FDPedido: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' ITENS_COMPRA.*'
      'FROM'
      ' ITENS_COMPRA, TEMP_COMPRAS'
      'WHERE'
      ' ITENS_COMPRA.ID_PRODUTO = TEMP_COMPRAS.ID_PRODUTO AND'
      ' ITENS_COMPRA.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS AND'
      ' TEMP_COMPRAS.PROCESSO = '#39'5'#39' AND'
      ' TEMP_COMPRAS.ENVIADO = '#39'9'#39)
    Left = 822
    Top = 295
  end
  object DspLotesItensCompra: TDataSetProvider
    DataSet = FDLotesItensCompra
    Left = 899
    Top = 336
  end
  object CdsLotesItensCompra: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLotesItensCompra'
    Left = 899
    Top = 377
    object CdsLotesItensCompraCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Origin = 'CD_COMPRAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsLotesItensCompraCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Origin = 'CD_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsLotesItensCompraCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Origin = 'CD_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsLotesItensCompraNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Origin = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsLotesItensCompraID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsLotesItensCompraLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsLotesItensCompraQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object CdsLotesItensCompraFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
      Origin = 'FABRICACAO'
    end
    object CdsLotesItensCompraVALIDADE: TDateField
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
    end
  end
  object FDLotesItensCompra: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      ' ITENS_COMPRA_LOTE.* '
      'FROM '
      ' ITENS_COMPRA_LOTE,'
      'TEMP_ITENS_COMPRA_LOTE'
      'WHERE '
      
        ' ITENS_COMPRA_LOTE.CD_COMPRAS = TEMP_ITENS_COMPRA_LOTE.CD_COMPRA' +
        'S AND'
      
        ' ITENS_COMPRA_LOTE.ID_PRODUTO = TEMP_ITENS_COMPRA_LOTE.ID_PRODUT' +
        'O AND'
      ' ITENS_COMPRA_LOTE.LOTE = TEMP_ITENS_COMPRA_LOTE.LOTE AND'
      ' TEMP_ITENS_COMPRA_LOTE.ENVIADO = '#39'9'#39)
    Left = 896
    Top = 295
  end
  object CdsContasPagarCompras: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasPagarCompras'
    Left = 1012
    Top = 378
    object CdsContasPagarComprasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Origin = 'CD_FILIAL'
    end
    object CdsContasPagarComprasCD_CONTAS_PAGAR: TFloatField
      FieldName = 'CD_CONTAS_PAGAR'
      Origin = 'CD_CONTAS_PAGAR'
    end
    object CdsContasPagarComprasCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Origin = 'CD_COMPRAS'
    end
    object CdsContasPagarComprasDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
      Origin = 'DT_EMISSAO'
    end
    object CdsContasPagarComprasNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Origin = 'NOTA_FISCAL'
      Size = 100
    end
    object CdsContasPagarComprasVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object DspContasPagarCompras: TDataSetProvider
    DataSet = FDContasPagarCompras
    Left = 1012
    Top = 337
  end
  object FDContasPagarCompras: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' CONTAS_PAGAR_COMPRAS.*'
      'FROM'
      ' CONTAS_PAGAR_COMPRAS, TEMP_COMPRAS'
      'WHERE'
      ' CONTAS_PAGAR_COMPRAS.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS AND'
      
        ' CONTAS_PAGAR_COMPRAS.CD_CONTAS_PAGAR = TEMP_COMPRAS.ID_PRODUTO ' +
        'AND'
      ' TEMP_COMPRAS.PROCESSO = '#39'71'#39' AND'
      ' TEMP_COMPRAS.ENVIADO = '#39'9'#39)
    Left = 1011
    Top = 294
  end
  object DspComprasBoletos: TDataSetProvider
    DataSet = FDComprasBoletos
    Left = 1258
    Top = 195
  end
  object CdsComprasBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspComprasBoletos'
    Left = 1258
    Top = 235
    object CdsComprasBoletosCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object CdsComprasBoletosCD_BOLETO: TFloatField
      FieldName = 'CD_BOLETO'
      Required = True
    end
    object CdsComprasBoletosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 100
    end
    object CdsComprasBoletosVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object CdsComprasBoletosJUROS: TFMTBCDField
      FieldName = 'JUROS'
      Precision = 18
      Size = 2
    end
    object CdsComprasBoletosDEDUCOES: TFMTBCDField
      FieldName = 'DEDUCOES'
      Precision = 18
      Size = 2
    end
    object CdsComprasBoletosDESPESASFINANCEIRAS: TFMTBCDField
      FieldName = 'DESPESASFINANCEIRAS'
      Precision = 18
      Size = 2
    end
    object CdsComprasBoletosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object FDComprasBoletos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' COMPRAS_BOLETOS.*'
      'FROM'
      ' COMPRAS_BOLETOS, TEMP_COMPRAS'
      'WHERE'
      ' COMPRAS_BOLETOS.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS AND'
      ' COMPRAS_BOLETOS.CD_BOLETO = TEMP_COMPRAS.ID_PRODUTO AND'
      ' TEMP_COMPRAS.PROCESSO = '#39'17'#39' AND'
      ' TEMP_COMPRAS.ENVIADO = '#39'9'#39)
    Left = 1257
    Top = 147
  end
  object DspSintegraNF: TDataSetProvider
    DataSet = FDSintegraNF
    Left = 1348
    Top = 197
  end
  object CdsSintegraNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraNF'
    Left = 1351
    Top = 236
    object CdsSintegraNFCOD_NF_ENTRADA: TIntegerField
      FieldName = 'COD_NF_ENTRADA'
      Required = True
    end
    object CdsSintegraNFCD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object CdsSintegraNFNUM_FORM: TStringField
      FieldName = 'NUM_FORM'
      Size = 30
    end
    object CdsSintegraNFSERIE_FORM: TStringField
      FieldName = 'SERIE_FORM'
      Size = 10
    end
    object CdsSintegraNFNUM_VIA: TIntegerField
      FieldName = 'NUM_VIA'
    end
    object CdsSintegraNFNUM_NF: TStringField
      FieldName = 'NUM_NF'
      Size = 30
    end
    object CdsSintegraNFSERIE_NF: TStringField
      FieldName = 'SERIE_NF'
      Size = 10
    end
    object CdsSintegraNFSUBSERIE_NF: TStringField
      FieldName = 'SUBSERIE_NF'
      Size = 10
    end
    object CdsSintegraNFMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      FixedChar = True
      Size = 2
    end
    object CdsSintegraNFSITUACAO_NF: TStringField
      FieldName = 'SITUACAO_NF'
      Size = 2
    end
    object CdsSintegraNFEMITENTE_NF: TStringField
      FieldName = 'EMITENTE_NF'
      Size = 2
    end
    object CdsSintegraNFNUM_ITENS: TIntegerField
      FieldName = 'NUM_ITENS'
    end
    object CdsSintegraNFCOD_CLI_FORNECEDOR: TIntegerField
      FieldName = 'COD_CLI_FORNECEDOR'
    end
    object CdsSintegraNFCOD_CLI_DESTINATARIO: TIntegerField
      FieldName = 'COD_CLI_DESTINATARIO'
    end
    object CdsSintegraNFCOD_CLI_TRANSP: TIntegerField
      FieldName = 'COD_CLI_TRANSP'
    end
    object CdsSintegraNFDATAHORA_EMISSAO: TDateField
      FieldName = 'DATAHORA_EMISSAO'
    end
    object CdsSintegraNFDATAHORA_SAIDAENTRADA: TDateField
      FieldName = 'DATAHORA_SAIDAENTRADA'
    end
    object CdsSintegraNFDATAHORA_SAIDA: TDateField
      FieldName = 'DATAHORA_SAIDA'
    end
    object CdsSintegraNFDATAHORA_RECEBIMENTO: TDateField
      FieldName = 'DATAHORA_RECEBIMENTO'
    end
    object CdsSintegraNFNATUREZA_OP: TStringField
      FieldName = 'NATUREZA_OP'
      Size = 255
    end
    object CdsSintegraNFCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object CdsSintegraNFDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFVALOR_TOTALPRODUTO: TFMTBCDField
      FieldName = 'VALOR_TOTALPRODUTO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFVALOR_TOTALNF: TFMTBCDField
      FieldName = 'VALOR_TOTALNF'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFBASE_ICMS_SUBST: TFMTBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFOUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFVALOR_ICMS_SUBST: TFMTBCDField
      FieldName = 'VALOR_ICMS_SUBST'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 19
      Size = 2
    end
    object CdsSintegraNFVALOR_ISENTO_IPI: TFMTBCDField
      FieldName = 'VALOR_ISENTO_IPI'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFVALOR_ISENTO_ICMS: TFMTBCDField
      FieldName = 'VALOR_ISENTO_ICMS'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFICMS_RETIDO: TFMTBCDField
      FieldName = 'ICMS_RETIDO'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFFAT_01: TStringField
      FieldName = 'FAT_01'
      Size = 30
    end
    object CdsSintegraNFVENCIMENTO_01: TSQLTimeStampField
      FieldName = 'VENCIMENTO_01'
    end
    object CdsSintegraNFVALOR_01: TFMTBCDField
      FieldName = 'VALOR_01'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFFAT_02: TStringField
      FieldName = 'FAT_02'
      Size = 30
    end
    object CdsSintegraNFVENCIMENTO_02: TSQLTimeStampField
      FieldName = 'VENCIMENTO_02'
    end
    object CdsSintegraNFVALOR_02: TFMTBCDField
      FieldName = 'VALOR_02'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFFAT_03: TStringField
      FieldName = 'FAT_03'
      Size = 30
    end
    object CdsSintegraNFVENCIMENTO_03: TSQLTimeStampField
      FieldName = 'VENCIMENTO_03'
    end
    object CdsSintegraNFVALOR_03: TFMTBCDField
      FieldName = 'VALOR_03'
      Precision = 19
      Size = 3
    end
    object CdsSintegraNFTRANSP_NOME: TStringField
      FieldName = 'TRANSP_NOME'
      Size = 60
    end
    object CdsSintegraNFTRANSP_FRETE_CONTA: TStringField
      FieldName = 'TRANSP_FRETE_CONTA'
      Size = 30
    end
    object CdsSintegraNFTRANSP_PLACA_VEICULO: TStringField
      FieldName = 'TRANSP_PLACA_VEICULO'
      Size = 30
    end
    object CdsSintegraNFTRANSP_UF_VEICULO: TStringField
      FieldName = 'TRANSP_UF_VEICULO'
      Size = 2
    end
    object CdsSintegraNFTRANSP_CNPJ_CPF: TStringField
      FieldName = 'TRANSP_CNPJ_CPF'
      Size = 30
    end
    object CdsSintegraNFTRANSP_ENDER: TStringField
      FieldName = 'TRANSP_ENDER'
      Size = 255
    end
    object CdsSintegraNFTRANSP_MUNICIPIO: TStringField
      FieldName = 'TRANSP_MUNICIPIO'
      Size = 30
    end
    object CdsSintegraNFTRANSP_UF: TStringField
      FieldName = 'TRANSP_UF'
      Size = 2
    end
    object CdsSintegraNFTRANSP_IE: TStringField
      FieldName = 'TRANSP_IE'
      Size = 30
    end
    object CdsSintegraNFTRANSP_QNT: TIntegerField
      FieldName = 'TRANSP_QNT'
    end
    object CdsSintegraNFTRANSP_ESPECIE: TStringField
      FieldName = 'TRANSP_ESPECIE'
      Size = 30
    end
    object CdsSintegraNFTRANSP_MARCA: TStringField
      FieldName = 'TRANSP_MARCA'
      Size = 30
    end
    object CdsSintegraNFTRANSP_NRO: TIntegerField
      FieldName = 'TRANSP_NRO'
    end
    object CdsSintegraNFTRANSP_PESO_B: TStringField
      FieldName = 'TRANSP_PESO_B'
      Size = 30
    end
    object CdsSintegraNFTRANSP_PESO_L: TStringField
      FieldName = 'TRANSP_PESO_L'
      Size = 30
    end
    object CdsSintegraNFDADOS_ADICIONAIS: TStringField
      FieldName = 'DADOS_ADICIONAIS'
      Size = 255
    end
    object CdsSintegraNFOBS: TBlobField
      FieldName = 'OBS'
      Size = 8
    end
    object CdsSintegraNFDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object CdsSintegraNFENABLED: TIntegerField
      FieldName = 'ENABLED'
    end
    object CdsSintegraNFULTATUAL: TSQLTimeStampField
      FieldName = 'ULTATUAL'
    end
    object CdsSintegraNFULTATUALCODSETOR: TIntegerField
      FieldName = 'ULTATUALCODSETOR'
    end
    object CdsSintegraNFULTATUALCODSETORUSER: TIntegerField
      FieldName = 'ULTATUALCODSETORUSER'
    end
    object CdsSintegraNFNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 50
    end
    object CdsSintegraNFENDERECO_FORNECEDOR: TStringField
      FieldName = 'ENDERECO_FORNECEDOR'
      Size = 255
    end
    object CdsSintegraNFBAIRRO_FORNECEDOR: TStringField
      FieldName = 'BAIRRO_FORNECEDOR'
      Size = 50
    end
    object CdsSintegraNFCIDADE_FORNECEDOR: TStringField
      FieldName = 'CIDADE_FORNECEDOR'
      Size = 50
    end
    object CdsSintegraNFFONE_FORNECEDOR: TStringField
      FieldName = 'FONE_FORNECEDOR'
      Size = 30
    end
    object CdsSintegraNFCEP_FORNECEDOR: TStringField
      FieldName = 'CEP_FORNECEDOR'
      Size = 30
    end
    object CdsSintegraNFCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      Size = 30
    end
    object CdsSintegraNFIE_FORNECEDOR: TStringField
      FieldName = 'IE_FORNECEDOR'
      Size = 30
    end
    object CdsSintegraNFUF_FORNECEDOR: TStringField
      FieldName = 'UF_FORNECEDOR'
      Size = 3
    end
    object CdsSintegraNFBRANCOS: TStringField
      FieldName = 'BRANCOS'
    end
    object CdsSintegraNFFISCAL: TIntegerField
      FieldName = 'FISCAL'
    end
    object CdsSintegraNFENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsSintegraNFCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 100
    end
    object CdsSintegraNFICMS_BASE_CALCULO_ST_RET: TFMTBCDField
      FieldName = 'ICMS_BASE_CALCULO_ST_RET'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFICMS_FCP: TFMTBCDField
      FieldName = 'ICMS_FCP'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFICMS_FCP_ST: TFMTBCDField
      FieldName = 'ICMS_FCP_ST'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFICMS_FCP_ST_RET: TFMTBCDField
      FieldName = 'ICMS_FCP_ST_RET'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFVALOR_II: TFMTBCDField
      FieldName = 'VALOR_II'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFVALOR_PIS: TFMTBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFVALOR_COFINS: TFMTBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object CdsSintegraNFICMS_VALOR_DESONERACAO: TFMTBCDField
      FieldName = 'ICMS_VALOR_DESONERACAO'
      Precision = 18
      Size = 2
    end
  end
  object FDSintegraNF: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' SINTEGRA_NF_ENTRADA'
      'WHERE'
      ' ENVIADO= '#39'9'#39)
    Left = 1348
    Top = 151
  end
  object DspSintegraItensNF: TDataSetProvider
    DataSet = FDSintegraItensNF
    Left = 1448
    Top = 196
  end
  object CdsSintegraItensNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraItensNF'
    Left = 1450
    Top = 237
    object CdsSintegraItensNFCOD_NF_ENTRADA_ITENS: TIntegerField
      FieldName = 'COD_NF_ENTRADA_ITENS'
      Required = True
    end
    object CdsSintegraItensNFCD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object CdsSintegraItensNFCOD_NF_ENTRADA: TIntegerField
      FieldName = 'COD_NF_ENTRADA'
      Required = True
    end
    object CdsSintegraItensNFCOD_PRODUTOS: TIntegerField
      FieldName = 'COD_PRODUTOS'
    end
    object CdsSintegraItensNFREF_PRODUTOS: TStringField
      FieldName = 'REF_PRODUTOS'
      Size = 30
    end
    object CdsSintegraItensNFNUM_ITEM: TIntegerField
      FieldName = 'NUM_ITEM'
    end
    object CdsSintegraItensNFCL_FIS: TStringField
      FieldName = 'CL_FIS'
      Size = 15
    end
    object CdsSintegraItensNFS_TRIB: TStringField
      FieldName = 'S_TRIB'
      Size = 15
    end
    object CdsSintegraItensNFPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 50
    end
    object CdsSintegraItensNFCOD_GRUPOP: TIntegerField
      FieldName = 'COD_GRUPOP'
    end
    object CdsSintegraItensNFCOD_SUBGRUPOP: TIntegerField
      FieldName = 'COD_SUBGRUPOP'
    end
    object CdsSintegraItensNFDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object CdsSintegraItensNFQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFPRC_CUSTO: TFMTBCDField
      FieldName = 'PRC_CUSTO'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFBASE_ICMS_SUBST: TFMTBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFENABLE_NUMSERIE: TIntegerField
      FieldName = 'ENABLE_NUMSERIE'
    end
    object CdsSintegraItensNFOBS: TStringField
      FieldName = 'OBS'
      Size = 255
    end
    object CdsSintegraItensNFENABLED: TIntegerField
      FieldName = 'ENABLED'
    end
    object CdsSintegraItensNFULTATUAL: TSQLTimeStampField
      FieldName = 'ULTATUAL'
    end
    object CdsSintegraItensNFULTATUALCODSETOR: TIntegerField
      FieldName = 'ULTATUALCODSETOR'
    end
    object CdsSintegraItensNFULTATUALCODSETORUSER: TIntegerField
      FieldName = 'ULTATUALCODSETORUSER'
    end
    object CdsSintegraItensNFAPR_UND: TStringField
      FieldName = 'APR_UND'
      Size = 6
    end
    object CdsSintegraItensNFPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFREDUCAO_BASE_ICMS: TFMTBCDField
      FieldName = 'REDUCAO_BASE_ICMS'
      Precision = 19
      Size = 3
    end
    object CdsSintegraItensNFENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsSintegraItensNFCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object CdsSintegraItensNFVALOR_ICMS_SUBTITUICAO: TFMTBCDField
      FieldName = 'VALOR_ICMS_SUBTITUICAO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFMARGEM_VALOR_AGREGADO: TFMTBCDField
      FieldName = 'MARGEM_VALOR_AGREGADO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFREDUCAO_ICMS_ST: TFMTBCDField
      FieldName = 'REDUCAO_ICMS_ST'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFPERCENTUAL_ICMS_ST: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFPIS_CST: TStringField
      FieldName = 'PIS_CST'
      Size = 3
    end
    object CdsSintegraItensNFPIS_BASE_CALCULO: TFMTBCDField
      FieldName = 'PIS_BASE_CALCULO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFPIS_PERCENTUAL: TFMTBCDField
      FieldName = 'PIS_PERCENTUAL'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFPIS_VALOR: TFMTBCDField
      FieldName = 'PIS_VALOR'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFCOFINS_CST: TStringField
      FieldName = 'COFINS_CST'
      Size = 3
    end
    object CdsSintegraItensNFCOFINS_BASE_CALCULO: TFMTBCDField
      FieldName = 'COFINS_BASE_CALCULO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFCOFINS_PERCENTUAL: TFMTBCDField
      FieldName = 'COFINS_PERCENTUAL'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFCOFINS_VALOR: TFMTBCDField
      FieldName = 'COFINS_VALOR'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFVALOR_OUTRASDESPESAS: TFMTBCDField
      FieldName = 'VALOR_OUTRASDESPESAS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFVALOR_ISENTO: TFMTBCDField
      FieldName = 'VALOR_ISENTO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraItensNFIPI_CST: TStringField
      FieldName = 'IPI_CST'
      Size = 3
    end
    object CdsSintegraItensNFIPI_BASE_CALCULO: TFMTBCDField
      FieldName = 'IPI_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_BASE_CALCULO_ST_RETIDO: TFMTBCDField
      FieldName = 'ICMS_BASE_CALCULO_ST_RETIDO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_PERCENTUAL_ST_RETIDO: TFMTBCDField
      FieldName = 'ICMS_PERCENTUAL_ST_RETIDO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_VALOR_ST_RETIDO: TFMTBCDField
      FieldName = 'ICMS_VALOR_ST_RETIDO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_BASE_CALCULO_FCP: TFMTBCDField
      FieldName = 'ICMS_BASE_CALCULO_FCP'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_PERCENTUAL_FCP: TFMTBCDField
      FieldName = 'ICMS_PERCENTUAL_FCP'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_VALOR_FCP: TFMTBCDField
      FieldName = 'ICMS_VALOR_FCP'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_BASE_CALCULO_FCP_ST: TFMTBCDField
      FieldName = 'ICMS_BASE_CALCULO_FCP_ST'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_PERCENTUAL_FCP_ST: TFMTBCDField
      FieldName = 'ICMS_PERCENTUAL_FCP_ST'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_VALOR_FCP_ST: TFMTBCDField
      FieldName = 'ICMS_VALOR_FCP_ST'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_BASE_CALCULO_FCP_ST_RETIDO: TFMTBCDField
      FieldName = 'ICMS_BASE_CALCULO_FCP_ST_RETIDO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_PERCENTUAL_FCP_ST_RETIDO: TFMTBCDField
      FieldName = 'ICMS_PERCENTUAL_FCP_ST_RETIDO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_VALOR_FCP_ST_RETIDO: TFMTBCDField
      FieldName = 'ICMS_VALOR_FCP_ST_RETIDO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_PERCENTUAL_REDUCAO: TFMTBCDField
      FieldName = 'ICMS_PERCENTUAL_REDUCAO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_CODBENEFICIO: TStringField
      FieldName = 'ICMS_CODBENEFICIO'
      Size = 10
    end
    object CdsSintegraItensNFICMS_MOTIVODESONERACAO: TStringField
      FieldName = 'ICMS_MOTIVODESONERACAO'
      Size = 100
    end
    object CdsSintegraItensNFICMS_VALOR_DESONERACAO: TFMTBCDField
      FieldName = 'ICMS_VALOR_DESONERACAO'
      Precision = 18
      Size = 2
    end
    object CdsSintegraItensNFICMS_PERCENTUAL_DESONERACAO: TFMTBCDField
      FieldName = 'ICMS_PERCENTUAL_DESONERACAO'
      Precision = 18
      Size = 2
    end
  end
  object FDSintegraItensNF: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' SINTEGRA_NF_ENTRADA_ITENS'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 1444
    Top = 146
  end
  object DspSintegraR60: TDataSetProvider
    DataSet = FDSintegraR60
    Left = 1113
    Top = 343
  end
  object CdsSintegraR60: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraR60'
    Left = 1119
    Top = 383
    object CdsSintegraR60COD_SINTEGRA_R60: TIntegerField
      FieldName = 'COD_SINTEGRA_R60'
      Required = True
    end
    object CdsSintegraR60CD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object CdsSintegraR60NRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
    end
    object CdsSintegraR60NRO_ORDEM_EQP: TStringField
      FieldName = 'NRO_ORDEM_EQP'
      Size = 3
    end
    object CdsSintegraR60MODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object CdsSintegraR60BRANCOS_60M: TStringField
      FieldName = 'BRANCOS_60M'
      Size = 37
    end
    object CdsSintegraR60R60M: TStringField
      FieldName = 'R60M'
      Size = 256
    end
    object CdsSintegraR60DATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
    end
    object CdsSintegraR60CANCELAMENTO: TFMTBCDField
      FieldName = 'CANCELAMENTO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60DESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60SUBSTITUICAO_TRIBUTARIA: TFMTBCDField
      FieldName = 'SUBSTITUICAO_TRIBUTARIA'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60ISENTO: TFMTBCDField
      FieldName = 'ISENTO'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60NAO_INCIDENCIA: TFMTBCDField
      FieldName = 'NAO_INCIDENCIA'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60ISSQN: TFMTBCDField
      FieldName = 'ISSQN'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60ALIQUOTA01: TFMTBCDField
      FieldName = 'ALIQUOTA01'
      Precision = 5
      Size = 2
    end
    object CdsSintegraR60VALOR_TPARCIAL01: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL01'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60BRANCOS_60A01: TStringField
      FieldName = 'BRANCOS_60A01'
      Size = 79
    end
    object CdsSintegraR60R60A01: TStringField
      FieldName = 'R60A01'
      Size = 256
    end
    object CdsSintegraR60ALIQUOTA02: TFMTBCDField
      FieldName = 'ALIQUOTA02'
      Precision = 5
      Size = 2
    end
    object CdsSintegraR60VALOR_TPARCIAL02: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL02'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60BRANCOS_60A02: TStringField
      FieldName = 'BRANCOS_60A02'
      Size = 79
    end
    object CdsSintegraR60R60A02: TStringField
      FieldName = 'R60A02'
      Size = 256
    end
    object CdsSintegraR60ALIQUOTA03: TFMTBCDField
      FieldName = 'ALIQUOTA03'
      Precision = 5
      Size = 2
    end
    object CdsSintegraR60VALOR_TPARCIAL03: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL03'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60BRANCOS_60A03: TStringField
      FieldName = 'BRANCOS_60A03'
      Size = 79
    end
    object CdsSintegraR60R60A03: TStringField
      FieldName = 'R60A03'
      Size = 256
    end
    object CdsSintegraR60ALIQUOTA04: TFMTBCDField
      FieldName = 'ALIQUOTA04'
      Precision = 5
      Size = 2
    end
    object CdsSintegraR60VALOR_TPARCIAL04: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL04'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60BRANCOS_60A04: TStringField
      FieldName = 'BRANCOS_60A04'
      Size = 79
    end
    object CdsSintegraR60R60A04: TStringField
      FieldName = 'R60A04'
      Size = 256
    end
    object CdsSintegraR60ALIQUOTA05: TFMTBCDField
      FieldName = 'ALIQUOTA05'
      Precision = 5
      Size = 2
    end
    object CdsSintegraR60VALOR_TPARCIAL05: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL05'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60BRANCOS_60A05: TStringField
      FieldName = 'BRANCOS_60A05'
      Size = 79
    end
    object CdsSintegraR60R60A05: TStringField
      FieldName = 'R60A05'
      Size = 256
    end
    object CdsSintegraR60DATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object CdsSintegraR60ULTATUAL: TSQLTimeStampField
      FieldName = 'ULTATUAL'
    end
    object CdsSintegraR60ULTATUALCODSETORUSER: TIntegerField
      FieldName = 'ULTATUALCODSETORUSER'
    end
    object CdsSintegraR60ULTATUALCODSETOR: TIntegerField
      FieldName = 'ULTATUALCODSETOR'
    end
    object CdsSintegraR60NRO_CONTADOR_INICIO: TIntegerField
      FieldName = 'NRO_CONTADOR_INICIO'
    end
    object CdsSintegraR60NRO_CONTADOR_FIM: TIntegerField
      FieldName = 'NRO_CONTADOR_FIM'
    end
    object CdsSintegraR60NRO_CONTADOR_Z: TIntegerField
      FieldName = 'NRO_CONTADOR_Z'
    end
    object CdsSintegraR60CONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object CdsSintegraR60VALOR_TOTAL_GERAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL_GERAL'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60VALOR_VENDA_BRUTA: TFMTBCDField
      FieldName = 'VALOR_VENDA_BRUTA'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60BRANCOS: TStringField
      FieldName = 'BRANCOS'
    end
    object CdsSintegraR60ENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object FDSintegraR60: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' SINTEGRA_R60'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 1112
    Top = 296
  end
  object DspSintegraPedidos: TDataSetProvider
    DataSet = FDSintegraPedidos
    Left = 1208
    Top = 343
  end
  object CdsSintegraPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraPedidos'
    Left = 1208
    Top = 383
    object CdsSintegraPedidosCOD_PEDIDOS_ITENS: TIntegerField
      FieldName = 'COD_PEDIDOS_ITENS'
    end
    object CdsSintegraPedidosCD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object CdsSintegraPedidosREF_PRODUTOS: TStringField
      FieldName = 'REF_PRODUTOS'
      Size = 30
    end
    object CdsSintegraPedidosCL_FIS: TStringField
      FieldName = 'CL_FIS'
      Size = 15
    end
    object CdsSintegraPedidosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 50
    end
    object CdsSintegraPedidosAPR_UND: TStringField
      FieldName = 'APR_UND'
      Required = True
      Size = 6
    end
    object CdsSintegraPedidosS_TRIB: TStringField
      FieldName = 'S_TRIB'
      Size = 15
    end
    object CdsSintegraPedidosALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Precision = 19
      Size = 2
    end
    object CdsSintegraPedidosALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraPedidosREDUCAO_BASE_ICMS: TFMTBCDField
      FieldName = 'REDUCAO_BASE_ICMS'
      Precision = 19
      Size = 3
    end
    object CdsSintegraPedidosBASE_ICMS_SUBST: TFMTBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 19
      Size = 3
    end
    object CdsSintegraPedidosDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object CdsSintegraPedidosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsSintegraPedidosNRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
    end
  end
  object FDSintegraPedidos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' SINTEGRA_PEDIDOS_ITENS'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 1208
    Top = 296
  end
  object DspSintegraR60I: TDataSetProvider
    DataSet = FDSintegraR60I
    Left = 1291
    Top = 343
  end
  object CdsSintegraR60I: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraR60I'
    Left = 1292
    Top = 385
    object CdsSintegraR60ICOD_SINTEGRA_R60I: TIntegerField
      FieldName = 'COD_SINTEGRA_R60I'
      Required = True
    end
    object CdsSintegraR60ICD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object CdsSintegraR60IDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object CdsSintegraR60INRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
    end
    object CdsSintegraR60IMODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object CdsSintegraR60ICOO: TIntegerField
      FieldName = 'COO'
    end
    object CdsSintegraR60INRO_ORDEM_ITEM: TIntegerField
      FieldName = 'NRO_ORDEM_ITEM'
    end
    object CdsSintegraR60IREF_PRODUTOS: TStringField
      FieldName = 'REF_PRODUTOS'
      Size = 14
    end
    object CdsSintegraR60IQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 19
      Size = 3
    end
    object CdsSintegraR60IVALOR_MERCADORIA: TFMTBCDField
      FieldName = 'VALOR_MERCADORIA'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60IBASECALCULO_ICMS: TFMTBCDField
      FieldName = 'BASECALCULO_ICMS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60IVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 19
      Size = 2
    end
    object CdsSintegraR60IALIQUOTA_ICMS: TStringField
      FieldName = 'ALIQUOTA_ICMS'
      Size = 4
    end
    object CdsSintegraR60IBRANCOS: TStringField
      FieldName = 'BRANCOS'
      Size = 16
    end
    object CdsSintegraR60IENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object FDSintegraR60I: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' SINTEGRA_R60I'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 1290
    Top = 297
  end
  object DspVendasItensExcluidos: TDataSetProvider
    DataSet = FDVendasItensExcluidos
    Left = 1384
    Top = 343
  end
  object CdsVendasItensExcluidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendasItensExcluidos'
    Left = 1384
    Top = 384
    object CdsVendasItensExcluidosID_ITEM_EXCLUIDO: TFloatField
      FieldName = 'ID_ITEM_EXCLUIDO'
      Required = True
    end
    object CdsVendasItensExcluidosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsVendasItensExcluidosDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsVendasItensExcluidosHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsVendasItensExcluidosTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object CdsVendasItensExcluidosCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object CdsVendasItensExcluidosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object CdsVendasItensExcluidosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsVendasItensExcluidosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 100
    end
    object CdsVendasItensExcluidosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsVendasItensExcluidosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object CdsVendasItensExcluidosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsVendasItensExcluidosID_OPERADOR_CAIXA: TFloatField
      FieldName = 'ID_OPERADOR_CAIXA'
    end
  end
  object FDVendasItensExcluidos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM VENDAS_ITENS_EXCLUIDOS'
      'WHERE ENVIADO = '#39'9'#39)
    Left = 1378
    Top = 297
  end
  object DspTransfer: TDataSetProvider
    DataSet = FDConstransfer
    UpdateMode = upWhereKeyOnly
    Left = 32
    Top = 527
  end
  object QryTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 16
        Name = 'CD_TRANSFER'
        ParamType = ptInput
      end>
    ProviderName = 'DspTransfer'
    Left = 32
    Top = 571
    object QryTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object QryTransferDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
    end
    object QryTransferHORA_GERACAO: TTimeField
      FieldName = 'HORA_GERACAO'
    end
    object QryTransferDATA_ENVIO: TDateField
      FieldName = 'DATA_ENVIO'
    end
    object QryTransferHORA_ENVIO: TTimeField
      FieldName = 'HORA_ENVIO'
    end
    object QryTransferDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object QryTransferHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object QryTransferCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object QryTransferCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object QryTransferCD_USUARIO_ORIGEM: TFloatField
      FieldName = 'CD_USUARIO_ORIGEM'
    end
    object QryTransferCD_USUARIO_DESTINO: TFloatField
      FieldName = 'CD_USUARIO_DESTINO'
    end
    object QryTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object QryTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryTransferENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryTransferCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object CdsTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 609
    object CdsTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsTransferDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
    end
    object CdsTransferHORA_GERACAO: TTimeField
      FieldName = 'HORA_GERACAO'
    end
    object CdsTransferDATA_ENVIO: TDateField
      FieldName = 'DATA_ENVIO'
    end
    object CdsTransferHORA_ENVIO: TTimeField
      FieldName = 'HORA_ENVIO'
    end
    object CdsTransferDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object CdsTransferHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object CdsTransferCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object CdsTransferCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object CdsTransferCD_USUARIO_ORIGEM: TFloatField
      FieldName = 'CD_USUARIO_ORIGEM'
    end
    object CdsTransferCD_USUARIO_DESTINO: TFloatField
      FieldName = 'CD_USUARIO_DESTINO'
    end
    object CdsTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object CdsTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsTransferENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsTransferCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
  end
  object FDConstransfer: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' TRANSFER'
      'WHERE'
      ' CD_TRANSFER = :CD_TRANSFER')
    Left = 31
    Top = 489
    ParamData = <
      item
        Position = 1
        Name = 'CD_TRANSFER'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
      end>
  end
  object CdsProdutosQuantidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 971
    Top = 51
    object CdsProdutosQuantidadeID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsProdutosQuantidadeQUANTIDADEINICIAL: TFloatField
      FieldName = 'QUANTIDADEINICIAL'
    end
    object CdsProdutosQuantidadePRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
  end
  object FDAtualizaProdutosQuantidade: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOS_QUANTIDADE(:ID_PRODUTO, :' +
        'QUANTIDADEINICIAL, :PRECO_VENDA)')
    Left = 970
    Top = 3
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QUANTIDADEINICIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PRECO_VENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object CdsProdutosFP: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1092
    Top = 49
    object CdsProdutosFPID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsProdutosFPCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsProdutosFPCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsProdutosFPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsProdutosFPPRECO: TFloatField
      FieldName = 'PRECO'
    end
    object CdsProdutosFPUSAPRECOLOJA: TStringField
      FieldName = 'USAPRECOLOJA'
      Size = 1
    end
  end
  object CdsProdutosFidelidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1200
    Top = 43
    object CdsProdutosFidelidadeID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosFidelidadeCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsProdutosFidelidadeCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsProdutosFidelidadeCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsProdutosFidelidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsProdutosFidelidadePRECO: TFloatField
      FieldName = 'PRECO'
    end
    object CdsProdutosFidelidadeDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object FDAtualizaProdutosFP: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOS_FP(:ID_PRODUTO, :CD_PRODU' +
        'TO, :CD_LABORATORIO, :DESCRICAO, :PRECO, :USAPRECOLOJA)')
    Left = 1090
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_LABORATORIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRECO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USAPRECOLOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaProdutosFidelidade: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOS_FIDELIDADE(:ID_PRODUTO, :' +
        'CD_PRODUTO, :CD_LABORATORIO, :DESCRICAO, :PRECO, :CD_GRUPO, :DT_' +
        'ALTERACAO)')
    Left = 1195
    Top = 65535
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_LABORATORIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRECO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_GRUPO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object CdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 849
    Top = 8
  end
  object DspFiliais: TDataSetProvider
    DataSet = FDFiliais
    Left = 104
    Top = 535
  end
  object CdsFiliais: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspFiliais'
    Left = 104
    Top = 583
    object CdsFiliaisCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
  end
  object FDFiliais: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_FILIAL'
      'FROM'
      ' FILIAIS'
      'WHERE'
      ' CD_FILIAL <> :FILIAL')
    Left = 111
    Top = 489
    ParamData = <
      item
        Position = 1
        Name = 'FILIAL'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object FdAtualizaEstoque: TFDQuery
    Connection = FDConn
    Left = 1336
    Top = 8
  end
  object Dsp1: TDataSetProvider
    Left = 236
    Top = 535
  end
  object Cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp1'
    Left = 232
    Top = 576
  end
  object FDcds1: TFDQuery
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
    Left = 238
    Top = 493
  end
  object CdsPrecos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 64
  end
  object CdsDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 64
    object CdsDeletadosTABELA: TStringField
      FieldName = 'TABELA'
    end
    object CdsDeletadosCAMPO1: TStringField
      FieldName = 'CAMPO1'
    end
    object CdsDeletadosCAMPO2: TStringField
      FieldName = 'CAMPO2'
    end
    object CdsDeletadosDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsDeletadosHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsDeletadosUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
  end
end
