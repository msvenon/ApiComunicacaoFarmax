object DmExporterQuick: TDmExporterQuick
  OldCreateOrder = False
  Height = 733
  Width = 1181
  object CdsCeLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeLotes'
    Left = 24
    Top = 138
    object CdsCeLotesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsCeLotesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsCeLotesCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 6
    end
    object CdsCeLotesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsCeLotesCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsCeLotesCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsCeLotesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsCeLotesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsCeLotesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsCeLotesCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object CdsCeLotesCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object CdsCeLotesCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsCeLotesCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsCeLotesCUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotesCUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotesDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CdsCeLotesDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object CdsCeLotesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsCeLotesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 19
      Size = 2
    end
    object CdsCeLotesNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsCeLotesDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotesPROMOCAO: TFMTBCDField
      FieldName = 'PROMOCAO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotesTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object CdsCeLotesTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 1
    end
    object CdsCeLotesENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
      Size = 1
    end
    object CdsCeLotesETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 1
    end
    object CdsCeLotesENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object CdsCeLotesHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object CdsCeLotesESTOQUE_POSVENDA: TFloatField
      FieldName = 'ESTOQUE_POSVENDA'
    end
    object CdsCeLotesTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object CdsCeLotesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCeLotesNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object CdsCeLotesTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object CdsCeLotesUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object CdsCeLotesCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object CdsCeLotesCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotesARREDONDAMENTO: TFMTBCDField
      FieldName = 'ARREDONDAMENTO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsCeLotesID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object CdsCeLotesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object CdsCeLotesTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object CdsCeLotesTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object CdsCeLotesLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object CdsCeLotesAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object CdsCeLotesSUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object CdsCeLotesNOTAMANUAL: TStringField
      FieldName = 'NOTAMANUAL'
      Size = 1
    end
    object CdsCeLotesCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object CdsCeLotesID_PRODUTO_LOTE: TFloatField
      FieldName = 'ID_PRODUTO_LOTE'
    end
    object CdsCeLotesNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object CdsCeLotesCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object CdsCeLotesCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object CdsCeLotesICMS: TStringField
      FieldName = 'ICMS'
      Size = 4
    end
    object CdsCeLotesCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 14
    end
    object CdsCeLotesECF: TStringField
      FieldName = 'ECF'
    end
    object CdsCeLotesCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object CdsCeLotesSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object CdsCeLotesID_CLIENTE_PROPRIEDADE: TFloatField
      FieldName = 'ID_CLIENTE_PROPRIEDADE'
    end
    object CdsCeLotesCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object CdsCeLotesFCP: TFMTBCDField
      FieldName = 'FCP'
      Precision = 18
      Size = 2
    end
    object CdsCeLotesPERCENTUALREDUCAO: TFMTBCDField
      FieldName = 'PERCENTUALREDUCAO'
      Precision = 18
      Size = 2
    end
    object CdsCeLotesCOMPOSTO: TStringField
      FieldName = 'COMPOSTO'
      Size = 1
    end
    object CdsCeLotesID_PRODUTO_PRINCIPAL: TFloatField
      FieldName = 'ID_PRODUTO_PRINCIPAL'
    end
    object CdsCeLotesVENDA_FIDELIDADE: TStringField
      FieldName = 'VENDA_FIDELIDADE'
      Size = 1
    end
    object CdsCeLotesVENDA_QUANTIDADE: TStringField
      FieldName = 'VENDA_QUANTIDADE'
      Size = 1
    end
    object CdsCeLotesIFOOD: TStringField
      FieldName = 'IFOOD'
      Size = 1
    end
    object CdsCeLotesFARMACIASAPP: TStringField
      FieldName = 'FARMACIASAPP'
      Size = 1
    end
  end
  object CdsCeCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeCaixa'
    Left = 88
    Top = 138
    object CdsCeCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
    object CdsCeCaixaCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsCeCaixaCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsCeCaixaCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsCeCaixaCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsCeCaixaCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object CdsCeCaixaCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object CdsCeCaixaCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsCeCaixaCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsCeCaixaCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object CdsCeCaixaCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsCeCaixaTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Size = 1
    end
    object CdsCeCaixaDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsCeCaixaHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsCeCaixaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsCeCaixaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 12
    end
    object CdsCeCaixaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CdsCeCaixaTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object CdsCeCaixaENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object CdsCeCaixaENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object CdsCeCaixaTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object CdsCeCaixaENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCeCaixaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object CdsCeCaixaNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object CdsCeCaixaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object CdsCeCaixaTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object CdsCeCaixaNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object CdsCeCaixaNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object CdsCeCaixaDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object CdsCeCaixaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsCeCaixaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object CdsCeCaixaARREDONDAMENTO: TFloatField
      FieldName = 'ARREDONDAMENTO'
    end
    object CdsCeCaixaID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object CdsCeCaixaTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object CdsCeCaixaTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object CdsCeCaixaTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object CdsCeCaixaTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object CdsCeCaixaTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object CdsCeCaixaTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 100
    end
    object CdsCeCaixaTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object CdsCeCaixaTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object CdsCeCaixaLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object CdsCeCaixaAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object CdsCeCaixaPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object CdsCeCaixaCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object CdsCeCaixaECF: TStringField
      FieldName = 'ECF'
      Size = 40
    end
    object CdsCeCaixaTEFAUTORIZACAO: TStringField
      FieldName = 'TEFAUTORIZACAO'
      Size = 100
    end
  end
  object CdsCeCadfin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeCadfin'
    Left = 152
    Top = 138
    object CdsCeCadfinCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
    object CdsCeCadfinCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsCeCadfinCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsCeCadfinCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsCeCadfinCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsCeCadfinCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsCeCadfinCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsCeCadfinCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsCeCadfinCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object CdsCeCadfinDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object CdsCeCadfinDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsCeCadfinNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsCeCadfinSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Size = 4
    end
    object CdsCeCadfinDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object CdsCeCadfinDT_NOTA_FISCAL: TDateField
      FieldName = 'DT_NOTA_FISCAL'
    end
    object CdsCeCadfinVENCTO: TDateField
      FieldName = 'VENCTO'
    end
    object CdsCeCadfinVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsCeCadfinHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CdsCeCadfinNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object CdsCeCadfinNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object CdsCeCadfinDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object CdsCeCadfinVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object CdsCeCadfinVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object CdsCeCadfinVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object CdsCeCadfinVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object CdsCeCadfinNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Size = 11
    end
    object CdsCeCadfinBANCO: TStringField
      FieldName = 'BANCO'
      Size = 10
    end
    object CdsCeCadfinAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object CdsCeCadfinCONTA: TStringField
      FieldName = 'CONTA'
      Size = 16
    end
    object CdsCeCadfinHISTORICO_BANCO: TStringField
      FieldName = 'HISTORICO_BANCO'
      Size = 60
    end
    object CdsCeCadfinSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsCeCadfinOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object CdsCeCadfinGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object CdsCeCadfinENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCeCadfinCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object CdsCeCadfinCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object CdsCeCadfinCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object CdsCeCadfinBOLETOGERADO: TStringField
      FieldName = 'BOLETOGERADO'
      Size = 1
    end
    object CdsCeCadfinDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsCeCadfinTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object CdsCeCadfinTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object CdsCeCadfinTEFAUTORIZACAO: TStringField
      FieldName = 'TEFAUTORIZACAO'
      Size = 100
    end
    object CdsCeCadfinTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object CdsCeCadfinTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object CdsCeCadfinTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 10
    end
    object CdsCeCadfinTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object CdsCeCadfinTRNTRANSACAO: TStringField
      FieldName = 'TRNTRANSACAO'
      Size = 12
    end
    object CdsCeCadfinTRNLOTE: TStringField
      FieldName = 'TRNLOTE'
      Size = 10
    end
    object CdsCeCadfinTRNAUTORIZACAO: TStringField
      FieldName = 'TRNAUTORIZACAO'
      Size = 100
    end
    object CdsCeCadfinTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object CdsCeCadfinCD_FILIAL_PAGAMENTO: TFloatField
      FieldName = 'CD_FILIAL_PAGAMENTO'
    end
    object CdsCeCadfinPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object CdsCeCadfinCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
    end
    object CdsCeCadfinCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
  end
  object DspCeLotes: TDataSetProvider
    DataSet = TbCeLotes
    Left = 24
    Top = 99
  end
  object DspCeCaixa: TDataSetProvider
    DataSet = TbCeCaixa
    Left = 88
    Top = 99
  end
  object DspCeCadFin: TDataSetProvider
    DataSet = TbCeCadFin
    Left = 152
    Top = 99
  end
  object HTTPRIO1: THTTPRIO
    URL = 'http://localhost/ExporterServer/ExporterServer.exe/soap/IDm'
    HTTPWebNode.URL = 'http://localhost/ExporterServer/ExporterServer.exe/soap/IDm'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 112
    Top = 8
  end
  object DspCeProdutos: TDataSetProvider
    DataSet = TbCeProdutos
    Left = 224
    Top = 99
  end
  object CdsCeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeProdutos'
    Left = 224
    Top = 138
  end
  object TbCeLotes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'   LANCAMENTOS.ID_PRODUTO,'#13#10'   LANCAMENTOS.CD_FILIAL,'#13#10' ' +
      '  LANCAMENTOS.CD_PRODUTO,'#13#10'   LANCAMENTOS.DESCRICAO,'#13#10'   LANCAME' +
      'NTOS.CD_LABORATORIO,'#13#10'   LANCAMENTOS.CD_GRUPO,'#13#10'   LANCAMENTOS.C' +
      'D_CONVENIO,'#13#10'   LANCAMENTOS.CD_CLIENTE,'#13#10'   LANCAMENTOS.CD_VENDE' +
      'DOR,'#13#10'   LANCAMENTOS.CD_OPERADOR,'#13#10'   LANCAMENTOS.CD_USUARIO,'#13#10' ' +
      '  LANCAMENTOS.CD_FORMA_PAGAMENTO,'#13#10'   LANCAMENTOS.CD_VENDA,'#13#10'   ' +
      'CAST(LANCAMENTOS.CUSTO_MEDIO AS NUMERIC(10,2)) AS CUSTO_MEDIO,'#13#10 +
      '   CAST(LANCAMENTOS.CUSTO_UNITARIO AS NUMERIC(10,2)) AS CUSTO_UN' +
      'ITARIO,'#13#10'   LANCAMENTOS.DATA_LANCAMENTO,'#13#10'   LANCAMENTOS.DATA_CA' +
      'IXA,'#13#10'   LANCAMENTOS.QUANTIDADE,'#13#10'   CAST(LANCAMENTOS.VALOR AS N' +
      'UMERIC(10,2)) AS VALOR,'#13#10'   LANCAMENTOS.NOTA_FISCAL,'#13#10'   CAST(LA' +
      'NCAMENTOS.DESCONTO AS NUMERIC(10,2)) AS DESCONTO,'#13#10'   CAST(LANCA' +
      'MENTOS.PROMOCAO AS NUMERIC(10,2)) AS PROMOCAO,'#13#10'   LANCAMENTOS.T' +
      'IPO_VENDA,'#13#10'   LANCAMENTOS.TIPO_PAGAMENTO,'#13#10'   LANCAMENTOS.ENTRA' +
      'DA_SAIDA,'#13#10'   LANCAMENTOS.ETIQUETA,'#13#10'   LANCAMENTOS.ENTREGA,'#13#10'  ' +
      ' LANCAMENTOS.HORA,'#13#10'   LANCAMENTOS.ESTOQUE_POSVENDA,'#13#10'   LANCAME' +
      'NTOS.TROCA,'#13#10'   LANCAMENTOS.ENVIADO,'#13#10'   LANCAMENTOS.NUMERO,'#13#10'  ' +
      ' LANCAMENTOS.TERMINAL,'#13#10'   LANCAMENTOS.USUARIO,'#13#10'   LANCAMENTOS.' +
      'CD_LANCAMENTO,'#13#10'   CAST(LANCAMENTOS.COMISSAO AS NUMERIC(10,2)) A' +
      'S COMISSAO,'#13#10'   CAST(LANCAMENTOS.ARREDONDAMENTO AS NUMERIC(10,2)' +
      ') AS ARREDONDAMENTO,'#13#10'   LANCAMENTOS.CD_CLASSE,'#13#10'   LANCAMENTOS.' +
      'ID_OPERADORCAIXA,'#13#10'   LANCAMENTOS.OBSERVACAO,'#13#10'   LANCAMENTOS.TR' +
      'N,'#13#10'   LANCAMENTOS.TRANSACAOTRN,'#13#10'   LANCAMENTOS.LOTETRN,'#13#10'   LA' +
      'NCAMENTOS.AUTORIZACAOTRN,'#13#10'   LANCAMENTOS.SUBSIDIOTRN,'#13#10'   LANCA' +
      'MENTOS.NOTAMANUAL,'#13#10'   LANCAMENTOS.CD_FILIAL_ORIGEM,'#13#10'   LANCAME' +
      'NTOS.ID_PRODUTO_LOTE,'#13#10'   LANCAMENTOS.NCM,'#13#10'   LANCAMENTOS.CFOP,' +
      #13#10'   LANCAMENTOS.CST,'#13#10'   LANCAMENTOS.ICMS,'#13#10'   LANCAMENTOS.CODI' +
      'GO_BARRAS,'#13#10'   LANCAMENTOS.ECF,'#13#10'   LANCAMENTOS.CD_SUBGRUPO,'#13#10'  ' +
      ' LANCAMENTOS.SERIE_NOTA_FISCAL,'#13#10'   LANCAMENTOS.ID_CLIENTE_PROPR' +
      'IEDADE,'#13#10'   LANCAMENTOS.CEST,'#13#10'   LANCAMENTOS.FCP,'#13#10'   LANCAMENT' +
      'OS.PERCENTUALREDUCAO,'#13#10'   LANCAMENTOS. COMPOSTO,'#13#10'   LANCAMENTOS' +
      '.ID_PRODUTO_PRINCIPAL,'#13#10'   LANCAMENTOS.VENDA_FIDELIDADE,'#13#10'   LAN' +
      'CAMENTOS.VENDA_QUANTIDADE,'#13#10'   LANCAMENTOS.IFOOD,'#13#10'   LANCAMENTO' +
      'S.FARMACIASAPP'#13#10'FROM '#13#10'  LANCAMENTOS,'#13#10'  TEMP_LANCAMENTOS2'#13#10'WHER' +
      'E'#13#10' LANCAMENTOS.CD_LANCAMENTO = TEMP_LANCAMENTOS2.CD_LANCAMENTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 24
    Top = 58
  end
  object TbCeCaixa: TSQLDataSet
    CommandText = 'SELECT '#13#10' *'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 58
  end
  object TbCeCadFin: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONTAS_RECEBER.*'#13#10'FROM '#13#10' CONTAS_RECEBER, '#13#10' TEMP_PRODU' +
      'TOS2'#13#10'WHERE'#13#10' CONTAS_RECEBER.CD_CONTAS_RECEBER = TEMP_PRODUTOS2.' +
      'ID_PRODUTO'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 152
    Top = 58
  end
  object TbCeProdutos: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 224
    Top = 58
  end
  object DspCeTransfer: TDataSetProvider
    DataSet = TbTransfer
    Left = 608
    Top = 99
  end
  object CdsCeTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeTransfer'
    Left = 608
    Top = 138
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
  object TbItensTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_TRANSFER.*'#13#10'FROM'#13#10' TRANSFER, '#13#10' ITENS_TRANSFER'#13#10'W' +
      'HERE'#13#10' TRANSFER.CD_TRANSFER = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' I' +
      'TENS_TRANSFER.STATUS <> '#39'A'#39' AND'#13#10' TRANSFER.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 696
    Top = 58
  end
  object DspCeItensTransfer: TDataSetProvider
    DataSet = TbItensTransfer
    Left = 696
    Top = 99
  end
  object CdsCeItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeItensTransfer'
    Left = 696
    Top = 138
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
  object Sql1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 632
    Top = 8
  end
  object TbCeParame: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_FILIAL,'#13#10' PRECIFICACAO_UNICA,'#13#10' TIPO_LOJA'#13#10'FROM'#13#10' PA' +
      'RAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 304
    Top = 58
  end
  object DspParametros: TDataSetProvider
    DataSet = TbCeParame
    Left = 304
    Top = 99
  end
  object CdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 304
    Top = 138
    object CdsParametrosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsParametrosPRECIFICACAO_UNICA: TStringField
      FieldName = 'PRECIFICACAO_UNICA'
      Size = 1
    end
    object CdsParametrosTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
  end
  object DspOperadores: TDataSetProvider
    DataSet = TbOperadores
    Left = 528
    Top = 99
  end
  object CdsOperadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspOperadores'
    Left = 528
    Top = 138
    object CdsOperadoresCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsOperadoresCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object CdsOperadoresNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object CdsOperadoresSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsOperadoresTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object CdsOperadoresDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object CdsOperadoresHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
    end
    object CdsOperadoresDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
    end
    object CdsOperadoresHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
    end
    object CdsOperadoresDINHEIRO: TFloatField
      FieldName = 'DINHEIRO'
    end
    object CdsOperadoresCHEQUE_PRE: TFloatField
      FieldName = 'CHEQUE_PRE'
    end
    object CdsOperadoresCHEQUE_A_VISTA: TFloatField
      FieldName = 'CHEQUE_A_VISTA'
    end
    object CdsOperadoresCARTAO: TFloatField
      FieldName = 'CARTAO'
    end
    object CdsOperadoresCONVENIO: TFloatField
      FieldName = 'CONVENIO'
    end
    object CdsOperadoresCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
    object CdsOperadoresSAIDAS: TFloatField
      FieldName = 'SAIDAS'
    end
    object CdsOperadoresENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsOperadoresID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object CdsOperadoresCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
  end
  object TbOperadores: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' * '#13#10'FROM '#13#10' OPERADORES'#13#10'WHERE '#13#10' STATUS <> '#39'C'#39' AND (ENV' +
      'IADO <> '#39'2'#39' OR ENVIADO IS NULL)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 528
    Top = 58
  end
  object DspEntregas: TDataSetProvider
    DataSet = TbEntregas
    Left = 376
    Top = 99
  end
  object TbCheques: TSQLDataSet
    CommandText = 'SELECT'#13#10' * '#13#10'FROM'#13#10' CHEQUESRECEBIDOS'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 446
    Top = 58
  end
  object DspCeCheques: TDataSetProvider
    DataSet = TbCheques
    Left = 446
    Top = 99
  end
  object CdsCheques: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeCheques'
    Left = 446
    Top = 138
    object CdsChequesCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object CdsChequesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsChequesCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsChequesCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object CdsChequesNUMERO_BORDERO: TStringField
      FieldName = 'NUMERO_BORDERO'
    end
    object CdsChequesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsChequesEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Size = 100
    end
    object CdsChequesTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Size = 1
    end
    object CdsChequesCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object CdsChequesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsChequesBANCO: TStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object CdsChequesNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 6
    end
    object CdsChequesDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object CdsChequesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsChequesCD_MOTIVO: TFloatField
      FieldName = 'CD_MOTIVO'
    end
    object CdsChequesMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 100
    end
    object CdsChequesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsChequesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsChequesCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
    end
    object CdsChequesID_SPC: TFloatField
      FieldName = 'ID_SPC'
    end
  end
  object SqlCadernoFaltas: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' CADERNO_FALTAS'#13#10'WHERE'#13#10' (STATUS <> '#39'E'#39') OR (S' +
      'TATUS IS NULL)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 792
    Top = 58
  end
  object DspCadernoFaltas: TDataSetProvider
    DataSet = SqlCadernoFaltas
    Left = 792
    Top = 99
  end
  object CdsCadernoFaltas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCadernoFaltas'
    Left = 792
    Top = 138
    object CdsCadernoFaltasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsCadernoFaltasID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsCadernoFaltasCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsCadernoFaltasCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsCadernoFaltasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object CdsCadernoFaltasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsCadernoFaltasCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsCadernoFaltasCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsCadernoFaltasCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsCadernoFaltasCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
    object CdsCadernoFaltasCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsCadernoFaltasDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsCadernoFaltasQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsCadernoFaltasID_MOTIVOFALTA: TFloatField
      FieldName = 'ID_MOTIVOFALTA'
    end
    object CdsCadernoFaltasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object CdsCeDuplic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeDuplic'
    Left = 872
    Top = 138
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
  end
  object DspCeDuplic: TDataSetProvider
    DataSet = TbCeDuplic
    Left = 872
    Top = 99
  end
  object TbCeDuplic: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM '#13#10' CONTAS_PAGAR'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 872
    Top = 58
  end
  object TbCeClientes: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CLIENTES.*'#13#10'FROM '#13#10' CLIENTES,'#13#10' TEMP_PRODUTOS2'#13#10'WHERE ' +
      #13#10' TEMP_PRODUTOS2.PROCESSO = 14 AND'#13#10' CLIENTES.CD_CLIENTE = TEMP' +
      '_PRODUTOS2.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 192
  end
  object DspCeClientes: TDataSetProvider
    DataSet = TbCeClientes
    Left = 32
    Top = 235
  end
  object CdsCeClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeClientes'
    Left = 32
    Top = 266
    object FloatField1: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object FloatField4: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object StringField3: TStringField
      FieldName = 'BAIRRO'
    end
    object StringField4: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object StringField5: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object StringField7: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 5
    end
    object StringField8: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object StringField10: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object StringField11: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object StringField12: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object StringField13: TStringField
      FieldName = 'PRACA'
      Size = 6
    end
    object DateField1: TDateField
      FieldName = 'DATA_FICHA'
    end
    object StringField14: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object StringField15: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object StringField16: TStringField
      FieldName = 'TITULO_ELEITO'
      Size = 12
    end
    object DateField2: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object StringField17: TStringField
      FieldName = 'SEXO'
      Size = 10
    end
    object StringField18: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 10
    end
    object StringField19: TStringField
      FieldName = 'NATURALIDADE'
    end
    object StringField20: TStringField
      FieldName = 'FILIACAO'
      Size = 60
    end
    object FloatField5: TFloatField
      FieldName = 'NUMERO_DEPENDENTES'
    end
    object StringField21: TStringField
      FieldName = 'CONJUGE'
      Size = 40
    end
    object StringField22: TStringField
      FieldName = 'DT_NASC_CONJUGE'
    end
    object StringField23: TStringField
      FieldName = 'ALUGUEL'
      Size = 3
    end
    object FloatField6: TFloatField
      FieldName = 'VL_ALUGUEL'
    end
    object StringField24: TStringField
      FieldName = 'TEMPO_RESIDENCIA'
    end
    object StringField25: TStringField
      FieldName = 'EMPRESA'
      Size = 50
    end
    object StringField26: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 30
    end
    object StringField27: TStringField
      FieldName = 'DT_ADMISSAO'
    end
    object StringField28: TStringField
      FieldName = 'CEP_COMERCIAL'
      Size = 9
    end
    object StringField29: TStringField
      FieldName = 'CIDADE_COMERCIAL'
      Size = 35
    end
    object StringField30: TStringField
      FieldName = 'UF_COMERCIAL'
      Size = 2
    end
    object StringField31: TStringField
      FieldName = 'FUNCAO'
    end
    object StringField32: TStringField
      FieldName = 'EMPRESA_ANTERIOR'
      Size = 40
    end
    object StringField33: TStringField
      FieldName = 'TEMPO_SERVICO'
      Size = 15
    end
    object StringField34: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 50
    end
    object StringField35: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 50
    end
    object StringField36: TStringField
      FieldName = 'CONSULTA_SPC'
    end
    object StringField37: TStringField
      FieldName = 'OBSERVACAO_SPC'
      Size = 40
    end
    object StringField38: TStringField
      FieldName = 'OBSERVACAO_GERAL'
      Size = 254
    end
    object StringField39: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 40
    end
    object StringField40: TStringField
      FieldName = 'BAIRRO_COBRANCA'
    end
    object StringField41: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Size = 35
    end
    object StringField42: TStringField
      FieldName = 'UF_COBRANCA'
      Size = 2
    end
    object StringField43: TStringField
      FieldName = 'CEP_COBRANCA'
      Size = 9
    end
    object StringField44: TStringField
      FieldName = 'ICMS_IPI'
      Size = 1
    end
    object StringField45: TStringField
      FieldName = 'NOME_MAE'
      Size = 60
    end
    object FloatField7: TFloatField
      FieldName = 'MES_NASCIMENTO'
    end
    object FloatField8: TFloatField
      FieldName = 'RENDA'
    end
    object FloatField9: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
    end
    object FloatField10: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object StringField46: TStringField
      FieldName = 'EMAIL'
      Size = 45
    end
    object StringField47: TStringField
      FieldName = 'HOMEPAGE'
      Size = 50
    end
    object BlobField1: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object StringField48: TStringField
      FieldName = 'MATRICULA'
      Size = 10
    end
    object FloatField11: TFloatField
      FieldName = 'SALDO'
    end
    object FloatField12: TFloatField
      FieldName = 'DT_VENCIMENTO'
    end
    object FloatField13: TFloatField
      FieldName = 'DESCONTO'
    end
    object DateField3: TDateField
      FieldName = 'DT_ULTIMA_COMPRA'
    end
    object StringField49: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object StringField50: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object DateField4: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsCeClientesCOMPRAOUTRALOJA: TStringField
      FieldName = 'COMPRAOUTRALOJA'
      Size = 1
    end
    object CdsCeClientesCARTAOFIDELIDADE: TStringField
      FieldName = 'CARTAOFIDELIDADE'
      Size = 100
    end
    object CdsCeClientesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCeClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsCeClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object CdsCeClientesCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 10
    end
    object CdsCeClientesCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object CdsCeClientesID_PERFIL_CLIENTE: TFloatField
      FieldName = 'ID_PERFIL_CLIENTE'
    end
  end
  object SqlControlador: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(ID_PRODUTO) AS N_ITENS,'#13#10' SUM(ESTOQUE_0) AS N_UNI' +
      'DADES,'#13#10' SUM(CUSTO_UNITARIO) AS T_CUSTO,'#13#10' SUM(PRECO_VENDA) AS T' +
      '_VENDA,'#13#10' SUM(PRECO_PROMOCAO) AS T_PROMOCAO,'#13#10' SUM(PRECO_VENDA) ' +
      'AS CLASSES,'#13#10' SUM(PRECO_VENDA) AS GRUPOS,'#13#10' SUM(PRECO_VENDA) AS ' +
      'LABORATORIOS,'#13#10' SUM(PRECO_VENDA) AS DISTRIBUIDORES,'#13#10' SUM(PRECO_' +
      'VENDA) AS FAMILIAS,'#13#10' SUM(PRECO_VENDA) AS GRUPOSBALANCO,'#13#10' SUM(P' +
      'RECO_VENDA) AS GRUPOSCOMPRAS,'#13#10' SUM(PRECO_VENDA) AS CARTOES,'#13#10' S' +
      'UM(PRECO_VENDA) AS LANCAMENTOS,'#13#10' SUM(PRECO_VENDA) AS CAIXAS,'#13#10' ' +
      'SUM(PRECO_VENDA) AS CONTASRECEBER'#13#10'FROM'#13#10' PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 366
    Top = 192
  end
  object DspConstrolador: TDataSetProvider
    DataSet = SqlControlador
    Left = 366
    Top = 235
  end
  object CdsControlador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConstrolador'
    Left = 366
    Top = 266
    object CdsControladorN_ITENS: TIntegerField
      FieldName = 'N_ITENS'
      Required = True
    end
    object CdsControladorN_UNIDADES: TFloatField
      FieldName = 'N_UNIDADES'
    end
    object CdsControladorT_CUSTO: TFloatField
      FieldName = 'T_CUSTO'
    end
    object CdsControladorT_VENDA: TFloatField
      FieldName = 'T_VENDA'
    end
    object CdsControladorCLASSES: TFloatField
      FieldName = 'CLASSES'
    end
    object CdsControladorGRUPOS: TFloatField
      FieldName = 'GRUPOS'
    end
    object CdsControladorLABORATORIOS: TFloatField
      FieldName = 'LABORATORIOS'
    end
    object CdsControladorDISTRIBUIDORES: TFloatField
      FieldName = 'DISTRIBUIDORES'
    end
    object CdsControladorFAMILIAS: TFloatField
      FieldName = 'FAMILIAS'
    end
    object CdsControladorGRUPOSBALANCO: TFloatField
      FieldName = 'GRUPOSBALANCO'
    end
    object CdsControladorGRUPOSCOMPRAS: TFloatField
      FieldName = 'GRUPOSCOMPRAS'
    end
    object CdsControladorCARTOES: TFloatField
      FieldName = 'CARTOES'
    end
    object CdsControladorT_PROMOCAO: TFloatField
      FieldName = 'T_PROMOCAO'
    end
    object CdsControladorLANCAMENTOS: TFloatField
      FieldName = 'LANCAMENTOS'
    end
    object CdsControladorCAIXAS: TFloatField
      FieldName = 'CAIXAS'
    end
    object CdsControladorCONTASRECEBER: TFloatField
      FieldName = 'CONTASRECEBER'
    end
  end
  object SqlNumeroCaixaLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA >= CURRENT_DATE - ' +
      '1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 407
    Top = 320
  end
  object DspNumeroCaixaLoja: TDataSetProvider
    DataSet = SqlNumeroCaixaLoja
    Left = 407
    Top = 360
  end
  object CdsNumeroCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroCaixaLoja'
    Left = 407
    Top = 400
    object CdsNumeroCaixaLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdCaixaLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_CAIXA'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA >= CURRENT_DATE - ' +
      '1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 519
    Top = 320
  end
  object CdsCdCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 543
    Top = 464
    object CdsCdCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object DspCdCaixaLoja: TDataSetProvider
    DataSet = SqlCdCaixaLoja
    Left = 519
    Top = 360
  end
  object CdsCdCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdCaixaLoja'
    Left = 519
    Top = 400
    object CdsCdCaixaLojaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object SqlCRM: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM '#13#10' CRM'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 294
    Top = 192
  end
  object DspCRM: TDataSetProvider
    DataSet = SqlCRM
    Left = 294
    Top = 235
  end
  object CdsCRM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCRM'
    Left = 294
    Top = 266
    object CdsCRMCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsCRMCRM: TStringField
      FieldName = 'CRM'
      Size = 10
    end
    object CdsCRMCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsCRMCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsCRMCODIGO_BARRA: TStringField
      FieldName = 'CODIGO_BARRA'
      Size = 13
    end
    object CdsCRMDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CdsCRMQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsCRMDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsCRMHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsCRMENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCRMID_CRM: TFloatField
      FieldName = 'ID_CRM'
    end
    object CdsCRMUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsCRMMEDICO: TStringField
      FieldName = 'MEDICO'
      Size = 100
    end
    object CdsCRMID_MEDICO: TFloatField
      FieldName = 'ID_MEDICO'
    end
    object CdsCRMID_ENDERECO: TFloatField
      FieldName = 'ID_ENDERECO'
    end
    object CdsCRMID_AREA: TFloatField
      FieldName = 'ID_AREA'
    end
    object CdsCRMTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CdsCRMCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsCRMIMS: TStringField
      FieldName = 'IMS'
      Size = 1
    end
    object CdsCRMID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsCRMCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsCRMFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object CdsCRMTIPO_CRM: TStringField
      FieldName = 'TIPO_CRM'
      Size = 1
    end
    object CdsCRMGEN: TStringField
      FieldName = 'GEN'
      Size = 1
    end
    object CdsCRMCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object SqlFiliais: TSQLDataSet
    CommandText = 'SELECT'#13#10' CD_FILIAL'#13#10'FROM'#13#10' FILIAIS'#13#10'WHERE'#13#10' CD_FILIAL <> :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 320
  end
  object DspFiliais: TDataSetProvider
    DataSet = SqlFiliais
    Left = 32
    Top = 360
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
    Left = 32
    Top = 400
  end
  object CdsEntregas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEntregas'
    Left = 376
    Top = 138
    object CdsEntregasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsEntregasCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsEntregasCD_ENTREGADOR: TFloatField
      FieldName = 'CD_ENTREGADOR'
    end
    object CdsEntregasCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsEntregasDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsEntregasHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
    end
    object CdsEntregasHORA_CHEGADA: TTimeField
      FieldName = 'HORA_CHEGADA'
    end
    object CdsEntregasTROCO: TFloatField
      FieldName = 'TROCO'
    end
    object CdsEntregasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object TbEntregas: TSQLDataSet
    CommandText = 'SELECT'#13#10' * '#13#10'FROM'#13#10' ENTREGAS'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 376
    Top = 58
  end
  object TbTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' STATUS <> '#39'A'#39' AND'#13#10' ENVIADO' +
      ' = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 608
    Top = 58
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 8
  end
  object CdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 8
  end
  object CdsPrecos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 8
  end
  object CdsDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 8
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
  object SqlPrecoVenda: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'  FIRST 2000 '#13#10'  PRODUTOS.ID_PRODUTO,'#13#10'  PRODUTOS.PRECO' +
      '_VENDA_1,'#13#10'  PRODUTOS.PRECO_PROMOCAO_1,'#13#10'  PRODUTOS.DT_VENCIMENT' +
      'O_PROMOCAO_1,'#13#10'  PRODUTOS.DT_REAJUSTE_1'#13#10'FROM '#13#10' PRODUTOS,'#13#10' TEM' +
      'P_PRODUTOS'#13#10'WHERE '#13#10' PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS.ID_PROD' +
      'UTO AND'#13#10' TEMP_PRODUTOS.CD_FILIAL = :FILIAL AND '#13#10' TEMP_PRODUTOS' +
      '.PROCESSO = 125'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 448
    Top = 192
  end
  object DspPrecoVenda: TDataSetProvider
    DataSet = SqlPrecoVenda
    Left = 448
    Top = 235
  end
  object CdsPrecoVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPrecoVenda'
    Left = 448
    Top = 266
  end
  object CdsCePedid1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCePedid1'
    Left = 166
    Top = 266
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
  object CdsCePedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCePedido'
    Left = 230
    Top = 266
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
  object DspCePedid1: TDataSetProvider
    DataSet = TbCePedid1
    Left = 166
    Top = 235
  end
  object DspCePedido: TDataSetProvider
    DataSet = TbCePedido
    Left = 230
    Top = 235
  end
  object TbCePedid1: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' COMPRAS'#13#10'WHERE'#13#10' CD_COMPRAS IN (SELECT CD_COM' +
      'PRAS FROM TEMP_COMPRAS WHERE ENVIADO = '#39'9'#39' AND PROCESSO = '#39'4'#39')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 166
    Top = 192
  end
  object TbCePedido: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_COMPRA.*'#13#10'FROM'#13#10' ITENS_COMPRA, TEMP_COMPRAS'#13#10'WHER' +
      'E'#13#10' ITENS_COMPRA.ID_PRODUTO = TEMP_COMPRAS.ID_PRODUTO AND'#13#10' ITEN' +
      'S_COMPRA.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS AND'#13#10' TEMP_COMPRAS' +
      '.PROCESSO = '#39'5'#39' AND'#13#10' TEMP_COMPRAS.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 230
    Top = 192
  end
  object SqlConexao: TSQLDataSet
    CommandText = 'SELECT'#13#10' CGC'#13#10'FROM'#13#10' PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 952
    Top = 58
  end
  object DspConexao: TDataSetProvider
    DataSet = SqlConexao
    Left = 952
    Top = 99
  end
  object CdsConexao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConexao'
    Left = 952
    Top = 138
    object CdsConexaoCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
  end
  object Dsp1: TDataSetProvider
    DataSet = Sql1
    Left = 680
    Top = 8
  end
  object Cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp1'
    Left = 720
    Top = 8
  end
  object TbCeUsu: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_USUARIO,'#13#10' SENHA'#13#10'FROM'#13#10' USUARIOS'#13#10'WHERE'#13#10' ENVIADO =' +
      ' '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 96
    Top = 192
  end
  object DspCeUsu: TDataSetProvider
    DataSet = TbCeUsu
    Left = 96
    Top = 235
  end
  object CdsCeUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeUsu'
    Left = 96
    Top = 266
    object CdsCeUsuCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object CdsCeUsuSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
  end
  object SqlSintegraNF: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' SINTEGRA_NF_ENTRADA'#13#10'WHERE'#13#10' ENVIADO= '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 528
    Top = 192
  end
  object DspSintegraNF: TDataSetProvider
    DataSet = SqlSintegraNF
    Left = 528
    Top = 235
  end
  object CdsSintegraNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraNF'
    Left = 528
    Top = 266
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
  end
  object SqlSintegraItensNF: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' *'#13#10'FROM'#13#10' SINTEGRA_NF_ENTRADA_ITENS'#13#10'WHERE'#13#10' ENVIADO =' +
      ' '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 616
    Top = 192
  end
  object DspSintegraItensNF: TDataSetProvider
    DataSet = SqlSintegraItensNF
    Left = 616
    Top = 235
  end
  object CdsSintegraItensNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraItensNF'
    Left = 616
    Top = 266
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
  end
  object SqlSintegraPedidos: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' SINTEGRA_PEDIDOS_ITENS'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 808
    Top = 192
  end
  object DspSintegraPedidos: TDataSetProvider
    DataSet = SqlSintegraPedidos
    Left = 808
    Top = 235
  end
  object CdsSintegraPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraPedidos'
    Left = 808
    Top = 266
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
  end
  object SqlSintegraR60I: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' SINTEGRA_R60I'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 712
    Top = 192
  end
  object DspSintegraR60I: TDataSetProvider
    DataSet = SqlSintegraR60I
    Left = 712
    Top = 235
  end
  object CdsSintegraR60I: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraR60I'
    Left = 712
    Top = 266
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
  object SqlSintegraR60: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' SINTEGRA_R60'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 904
    Top = 192
  end
  object DspSintegraR60: TDataSetProvider
    DataSet = SqlSintegraR60
    Left = 904
    Top = 235
  end
  object CdsSintegraR60: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraR60'
    Left = 904
    Top = 266
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
  object SqlTransfer: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' CD_TRANSFER = :CD_TRANSFER'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_TRANSFER'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 96
    Top = 320
    object SqlTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
      Required = True
    end
    object SqlTransferDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferHORA_GERACAO: TTimeField
      FieldName = 'HORA_GERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferDATA_ENVIO: TDateField
      FieldName = 'DATA_ENVIO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferHORA_ENVIO: TTimeField
      FieldName = 'HORA_ENVIO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferCD_USUARIO_ORIGEM: TFloatField
      FieldName = 'CD_USUARIO_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferCD_USUARIO_DESTINO: TFloatField
      FieldName = 'CD_USUARIO_DESTINO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object SqlTransferENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlTransferSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlTransferCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DspTransfer: TDataSetProvider
    DataSet = SqlTransfer
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 360
  end
  object QryTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_TRANSFER'
        ParamType = ptInput
      end>
    ProviderName = 'DspTransfer'
    Left = 96
    Top = 404
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
    Left = 96
    Top = 442
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
  object CdsItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 442
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
  object QryItensTransfer: TClientDataSet
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
    Left = 184
    Top = 405
    object QryItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object QryItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryItensTransferCD_PRODUTO: TFloatField
      FieldName = 'CD_PRODUTO'
    end
    object QryItensTransferCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryItensTransferCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryItensTransferDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryItensTransferQUANTIDADE_SOLICITADA: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
    end
    object QryItensTransferQUANTIDADE_ENVIADA: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
    end
    object QryItensTransferQUANTIDADE_RECEBIDA: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
    end
    object QryItensTransferVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryItensTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object QryItensTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryItensTransferCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
  end
  object DspItensTransfer: TDataSetProvider
    DataSet = SqlItensTransfer
    Left = 184
    Top = 360
  end
  object SqlItensTransfer: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' ITENS_TRANSFER.*'#13#10'FROM'#13#10' ITENS_TRANSFER'#13#10'WHERE'#13#10' ITENS' +
      '_TRANSFER.CD_TRANSFER = :CD_TRANSFER AND'#13#10' ITENS_TRANSFER.ID_PRO' +
      'DUTO = :ID_PRODUTO'
    MaxBlobSize = -1
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
    SQLConnection = SQLConnection1
    Left = 184
    Top = 320
    object SqlItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object SqlItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object SqlItensTransferCD_PRODUTO: TFloatField
      FieldName = 'CD_PRODUTO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object SqlItensTransferQUANTIDADE_SOLICITADA: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferQUANTIDADE_ENVIADA: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferQUANTIDADE_RECEBIDA: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlItensTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object SqlItensTransferSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object SqlContas_Receber: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' CONTAS_RECEBER '#13#10'WHERE'#13#10' CD_CONTAS_RECEBER =' +
      ' :CD_CONTAS_RECEBER'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 286
    Top = 320
  end
  object DspContas_receber: TDataSetProvider
    DataSet = SqlContas_Receber
    Left = 286
    Top = 360
  end
  object QryCOntas_Receber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    ProviderName = 'DspContas_receber'
    Left = 286
    Top = 400
    object QryCOntas_ReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
    object QryCOntas_ReceberCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCOntas_ReceberCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object QryCOntas_ReceberCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryCOntas_ReceberCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryCOntas_ReceberCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCOntas_ReceberCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCOntas_ReceberCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object QryCOntas_ReceberCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object QryCOntas_ReceberCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object QryCOntas_ReceberCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object QryCOntas_ReceberDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object QryCOntas_ReceberDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object QryCOntas_ReceberNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object QryCOntas_ReceberSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Size = 4
    end
    object QryCOntas_ReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object QryCOntas_ReceberDT_NOTA_FISCAL: TDateField
      FieldName = 'DT_NOTA_FISCAL'
    end
    object QryCOntas_ReceberVENCTO: TDateField
      FieldName = 'VENCTO'
    end
    object QryCOntas_ReceberVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryCOntas_ReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object QryCOntas_ReceberCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object QryCOntas_ReceberNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object QryCOntas_ReceberNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object QryCOntas_ReceberDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object QryCOntas_ReceberVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object QryCOntas_ReceberVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object QryCOntas_ReceberVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object QryCOntas_ReceberVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object QryCOntas_ReceberNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Size = 11
    end
    object QryCOntas_ReceberBANCO: TStringField
      FieldName = 'BANCO'
      Size = 10
    end
    object QryCOntas_ReceberAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object QryCOntas_ReceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 16
    end
    object QryCOntas_ReceberHISTORICO_BANCO: TStringField
      FieldName = 'HISTORICO_BANCO'
      Size = 60
    end
    object QryCOntas_ReceberSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCOntas_ReceberOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object QryCOntas_ReceberDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object QryCOntas_ReceberGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object QryCOntas_ReceberENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCOntas_ReceberBOLETOGERADO: TStringField
      FieldName = 'BOLETOGERADO'
      Size = 1
    end
    object QryCOntas_ReceberTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object QryCOntas_ReceberTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object QryCOntas_ReceberTEFAUTORIZACAO: TStringField
      FieldName = 'TEFAUTORIZACAO'
      Size = 100
    end
    object QryCOntas_ReceberTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object QryCOntas_ReceberTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object QryCOntas_ReceberTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 10
    end
    object QryCOntas_ReceberTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object QryCOntas_ReceberTRNTRANSACAO: TStringField
      FieldName = 'TRNTRANSACAO'
      Size = 12
    end
    object QryCOntas_ReceberTRNLOTE: TStringField
      FieldName = 'TRNLOTE'
      Size = 10
    end
    object QryCOntas_ReceberTRNAUTORIZACAO: TStringField
      FieldName = 'TRNAUTORIZACAO'
      Size = 100
    end
    object QryCOntas_ReceberTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object QryCOntas_ReceberCD_FILIAL_PAGAMENTO: TFloatField
      FieldName = 'CD_FILIAL_PAGAMENTO'
    end
    object QryCOntas_ReceberPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object QryCOntas_ReceberCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
    end
  end
  object CdsContas_Receber: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 286
    Top = 440
    object CdsContas_ReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
    object CdsContas_ReceberCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsContas_ReceberCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsContas_ReceberCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsContas_ReceberCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsContas_ReceberCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsContas_ReceberCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsContas_ReceberCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsContas_ReceberCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object CdsContas_ReceberCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object CdsContas_ReceberCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object CdsContas_ReceberDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object CdsContas_ReceberDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsContas_ReceberNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsContas_ReceberSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Size = 4
    end
    object CdsContas_ReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object CdsContas_ReceberDT_NOTA_FISCAL: TDateField
      FieldName = 'DT_NOTA_FISCAL'
    end
    object CdsContas_ReceberVENCTO: TDateField
      FieldName = 'VENCTO'
    end
    object CdsContas_ReceberVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsContas_ReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CdsContas_ReceberCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object CdsContas_ReceberNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object CdsContas_ReceberNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object CdsContas_ReceberDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object CdsContas_ReceberVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object CdsContas_ReceberVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object CdsContas_ReceberVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object CdsContas_ReceberVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object CdsContas_ReceberNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Size = 11
    end
    object CdsContas_ReceberBANCO: TStringField
      FieldName = 'BANCO'
      Size = 10
    end
    object CdsContas_ReceberAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object CdsContas_ReceberCONTA: TStringField
      FieldName = 'CONTA'
      Size = 16
    end
    object CdsContas_ReceberHISTORICO_BANCO: TStringField
      FieldName = 'HISTORICO_BANCO'
      Size = 60
    end
    object CdsContas_ReceberSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsContas_ReceberOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object CdsContas_ReceberDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsContas_ReceberGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object CdsContas_ReceberENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsContas_ReceberBOLETOGERADO: TStringField
      FieldName = 'BOLETOGERADO'
      Size = 1
    end
    object CdsContas_ReceberTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object CdsContas_ReceberTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object CdsContas_ReceberTEFAUTORIZACAO: TStringField
      FieldName = 'TEFAUTORIZACAO'
      Size = 100
    end
    object CdsContas_ReceberTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object CdsContas_ReceberTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object CdsContas_ReceberTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 10
    end
    object CdsContas_ReceberTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object CdsContas_ReceberTRNTRANSACAO: TStringField
      FieldName = 'TRNTRANSACAO'
      Size = 12
    end
    object CdsContas_ReceberTRNLOTE: TStringField
      FieldName = 'TRNLOTE'
      Size = 10
    end
    object CdsContas_ReceberTRNAUTORIZACAO: TStringField
      FieldName = 'TRNAUTORIZACAO'
      Size = 100
    end
    object CdsContas_ReceberTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object CdsContas_ReceberCD_FILIAL_PAGAMENTO: TFloatField
      FieldName = 'CD_FILIAL_PAGAMENTO'
    end
    object CdsContas_ReceberPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object CdsContas_ReceberCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
    end
  end
  object SqlNumeroLancamentosLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAMENTO >' +
      '= CURRENT_DATE - 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 646
    Top = 320
  end
  object DspNumeroLancamentosLoja: TDataSetProvider
    DataSet = SqlNumeroLancamentosLoja
    Left = 646
    Top = 360
  end
  object CdsNumeroLancamentosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroLancamentosLoja'
    Left = 646
    Top = 400
    object CdsNumeroLancamentosLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdLancamentoLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_LANCAMENTO'#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAME' +
      'NTO >= CURRENT_DATE - 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 782
    Top = 320
  end
  object CdsCdLancamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 782
    Top = 464
    object CdsCdLancamentoCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object DspCdLancamentoLoja: TDataSetProvider
    DataSet = SqlCdLancamentoLoja
    Left = 782
    Top = 360
  end
  object CdsCdLancamentoLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdLancamentoLoja'
    Left = 782
    Top = 400
    object CdsCdLancamentoLojaCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object SqlLimiteSaldoClientes: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CLIENTES.CD_CLIENTE,'#13#10' CLIENTES.LIMITE_CREDITO,'#13#10' CLIE' +
      'NTES.LIMITE_PERCENTUAL,'#13#10' CLIENTES.SALDO'#13#10'FROM '#13#10' CLIENTES,'#13#10' TE' +
      'MP_PRODUTOS2'#13#10'WHERE '#13#10' TEMP_PRODUTOS2.PROCESSO = 17 AND'#13#10' CLIENT' +
      'ES.CD_CLIENTE = TEMP_PRODUTOS2.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 152
    Top = 512
  end
  object DspLimiteSaldoClientes: TDataSetProvider
    DataSet = SqlLimiteSaldoClientes
    Left = 152
    Top = 555
  end
  object CdsLimiteSaldoClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLimiteSaldoClientes'
    Left = 152
    Top = 594
    object CdsLimiteSaldoClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object CdsLimiteSaldoClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object CdsLimiteSaldoClientesLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
    end
    object CdsLimiteSaldoClientesSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object CdsIncluiProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
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
  object CdsProdutosLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosLotes'
    Left = 264
    Top = 594
    object CdsProdutosLotesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosLotesCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsProdutosLotesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsProdutosLotesCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object CdsProdutosLotesCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 13
    end
    object CdsProdutosLotesLOTE: TStringField
      FieldName = 'LOTE'
      Required = True
    end
    object CdsProdutosLotesFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object CdsProdutosLotesVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object CdsProdutosLotesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsProdutosLotesQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
    end
    object CdsProdutosLotesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object DspProdutosLotes: TDataSetProvider
    DataSet = SqlProdutosLotes
    Left = 264
    Top = 555
  end
  object SqlProdutosLotes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' PRODUTOS_LOTES'#13#10'WHERE'#13#10' ID_PRODUTO||LOTE IN'#13 +
      #10' (SELECT ID_PRODUTO||LOTE FROM TEMP_PRODUTOS_LOTES2)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 264
    Top = 514
  end
  object CdsCeLotes2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspCeLotes2'
    Left = 360
    Top = 594
    object CdsCeLotes2ID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsCeLotes2CD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsCeLotes2CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 6
    end
    object CdsCeLotes2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsCeLotes2CD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsCeLotes2CD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsCeLotes2CD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsCeLotes2CD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsCeLotes2CD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsCeLotes2CD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object CdsCeLotes2CD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object CdsCeLotes2CD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsCeLotes2CD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsCeLotes2CUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotes2CUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotes2DATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CdsCeLotes2DATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object CdsCeLotes2QUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsCeLotes2VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 19
      Size = 2
    end
    object CdsCeLotes2NOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsCeLotes2DESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotes2PROMOCAO: TFMTBCDField
      FieldName = 'PROMOCAO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotes2TIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object CdsCeLotes2TIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 1
    end
    object CdsCeLotes2ENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
      Size = 1
    end
    object CdsCeLotes2ETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 1
    end
    object CdsCeLotes2ENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object CdsCeLotes2HORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object CdsCeLotes2ESTOQUE_POSVENDA: TFloatField
      FieldName = 'ESTOQUE_POSVENDA'
    end
    object CdsCeLotes2TROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object CdsCeLotes2ENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsCeLotes2NUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object CdsCeLotes2TERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object CdsCeLotes2USUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object CdsCeLotes2CD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object CdsCeLotes2COMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotes2ARREDONDAMENTO: TFMTBCDField
      FieldName = 'ARREDONDAMENTO'
      Precision = 19
      Size = 2
    end
    object CdsCeLotes2CD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsCeLotes2ID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object CdsCeLotes2OBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object CdsCeLotes2TRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object CdsCeLotes2TRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object CdsCeLotes2LOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object CdsCeLotes2AUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object CdsCeLotes2SUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object CdsCeLotes2NOTAMANUAL: TStringField
      FieldName = 'NOTAMANUAL'
      Size = 1
    end
  end
  object DspCeLotes2: TDataSetProvider
    DataSet = TbCeLotes2
    Left = 360
    Top = 555
  end
  object TbCeLotes2: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' LANCAMENTOS_APRAZO.ID_PRODUTO,'#13#10' LANCAMENTOS_APRAZO.CD_' +
      'FILIAL,'#13#10' LANCAMENTOS_APRAZO.CD_PRODUTO,'#13#10' LANCAMENTOS_APRAZO.DE' +
      'SCRICAO,'#13#10' LANCAMENTOS_APRAZO.CD_LABORATORIO,'#13#10' LANCAMENTOS_APRA' +
      'ZO.CD_GRUPO,'#13#10' LANCAMENTOS_APRAZO.CD_CONVENIO,'#13#10' LANCAMENTOS_APR' +
      'AZO.CD_CLIENTE,'#13#10' LANCAMENTOS_APRAZO.CD_VENDEDOR,'#13#10' LANCAMENTOS_' +
      'APRAZO.CD_OPERADOR,'#13#10' LANCAMENTOS_APRAZO.CD_USUARIO,'#13#10' LANCAMENT' +
      'OS_APRAZO.CD_FORMA_PAGAMENTO,'#13#10' LANCAMENTOS_APRAZO.CD_VENDA,'#13#10' C' +
      'AST(LANCAMENTOS_APRAZO.CUSTO_MEDIO AS NUMERIC(10,2)) AS CUSTO_ME' +
      'DIO,'#13#10' CAST(LANCAMENTOS_APRAZO.CUSTO_UNITARIO AS NUMERIC(10,2)) ' +
      'AS CUSTO_UNITARIO,'#13#10' LANCAMENTOS_APRAZO.DATA_LANCAMENTO,'#13#10' LANCA' +
      'MENTOS_APRAZO.DATA_CAIXA,'#13#10' LANCAMENTOS_APRAZO.QUANTIDADE,'#13#10' CAS' +
      'T(LANCAMENTOS_APRAZO.VALOR AS NUMERIC(10,2)) AS VALOR,'#13#10' LANCAME' +
      'NTOS_APRAZO.NOTA_FISCAL,'#13#10' CAST(LANCAMENTOS_APRAZO.DESCONTO AS N' +
      'UMERIC(10,2)) AS DESCONTO,'#13#10' CAST(LANCAMENTOS_APRAZO.PROMOCAO AS' +
      ' NUMERIC(10,2)) AS PROMOCAO,'#13#10' LANCAMENTOS_APRAZO.TIPO_VENDA,'#13#10' ' +
      'LANCAMENTOS_APRAZO.TIPO_PAGAMENTO,'#13#10' LANCAMENTOS_APRAZO.ENTRADA_' +
      'SAIDA,'#13#10' LANCAMENTOS_APRAZO.ETIQUETA,'#13#10' LANCAMENTOS_APRAZO.ENTRE' +
      'GA,'#13#10' LANCAMENTOS_APRAZO.HORA,'#13#10' LANCAMENTOS_APRAZO.ESTOQUE_POSV' +
      'ENDA,'#13#10' LANCAMENTOS_APRAZO.TROCA,'#13#10' LANCAMENTOS_APRAZO.ENVIADO,'#13 +
      #10' LANCAMENTOS_APRAZO.NUMERO,'#13#10' LANCAMENTOS_APRAZO.TERMINAL,'#13#10' LA' +
      'NCAMENTOS_APRAZO.USUARIO,'#13#10' LANCAMENTOS_APRAZO.CD_LANCAMENTO,'#13#10' ' +
      'CAST(LANCAMENTOS_APRAZO.COMISSAO AS NUMERIC(10,2)) AS COMISSAO,'#13 +
      #10' CAST(LANCAMENTOS_APRAZO.ARREDONDAMENTO AS NUMERIC(10,2)) AS AR' +
      'REDONDAMENTO,'#13#10' LANCAMENTOS_APRAZO.CD_CLASSE,'#13#10' LANCAMENTOS_APRA' +
      'ZO.ID_OPERADORCAIXA,'#13#10' LANCAMENTOS_APRAZO.OBSERVACAO,'#13#10' LANCAMEN' +
      'TOS_APRAZO.TRN,'#13#10' LANCAMENTOS_APRAZO.TRANSACAOTRN,'#13#10' LANCAMENTOS' +
      '_APRAZO.LOTETRN,'#13#10' LANCAMENTOS_APRAZO.AUTORIZACAOTRN,'#13#10' LANCAMEN' +
      'TOS_APRAZO.SUBSIDIOTRN,'#13#10' LANCAMENTOS_APRAZO.NOTAMANUAL'#13#10'FROM'#13#10' ' +
      'LANCAMENTOS_APRAZO,'#13#10' TEMP_LANCAMENTOS_APRAZO2'#13#10'WHERE'#13#10' LANCAMEN' +
      'TOS_APRAZO.CD_FILIAL = :CD_FILIAL AND'#13#10' LANCAMENTOS_APRAZO.CD_LA' +
      'NCAMENTO = TEMP_LANCAMENTOS_APRAZO2.CD_LANCAMENTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 360
    Top = 514
  end
  object CdsPosicaoEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPosicaoEstoque'
    Left = 48
    Top = 594
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
  end
  object DspPosicaoEstoque: TDataSetProvider
    DataSet = TbPosicaoEstoque
    Left = 48
    Top = 555
  end
  object TbPosicaoEstoque: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' POSICAOESTOQUEDATA.*'#13#10'FROM '#13#10' POSICAOESTOQUEDATA,'#13#10' TEM' +
      'P_POSICAOESTOQUE2'#13#10'WHERE'#13#10' POSICAOESTOQUEDATA.ID_PRODUTO = TEMP_' +
      'POSICAOESTOQUE2.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 48
    Top = 514
  end
  object SqlAtualizaEstoque: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_ESTOQUE('#13#10'    :CD_FILIAL ,'#13#10'    :I' +
      'D_PRODUTO ,'#13#10'    :ESTOQUE_1 ,'#13#10'    :ESTOQUE_2 ,'#13#10'    :ESTOQUE_3 ' +
      ','#13#10'    :ESTOQUE_4 ,'#13#10'    :ESTOQUE_5 ,'#13#10'    :ESTOQUE_6 ,'#13#10'    :ES' +
      'TOQUE_7 ,'#13#10'    :ESTOQUE_8 ,'#13#10'    :ESTOQUE_9 ,'#13#10'    :ESTOQUE_10 ,' +
      #13#10'    :ESTOQUE_11 ,'#13#10'    :ESTOQUE_12 ,'#13#10'    :ESTOQUE_13 ,'#13#10'    :' +
      'ESTOQUE_14 ,'#13#10'    :ESTOQUE_15 ,'#13#10'    :ESTOQUE_16 ,'#13#10'    :ESTOQUE' +
      '_17 ,'#13#10'    :ESTOQUE_18 ,'#13#10'    :ESTOQUE_19 ,'#13#10'    :ESTOQUE_20 ,'#13#10 +
      '    :DT_ULT_VENDA_1 ,'#13#10'    :DT_ULT_VENDA_2 ,'#13#10'    :DT_ULT_VENDA_' +
      '3 ,'#13#10'    :DT_ULT_VENDA_4 ,'#13#10'    :DT_ULT_VENDA_5 ,'#13#10'    :DT_ULT_V' +
      'ENDA_6 ,'#13#10'    :DT_ULT_VENDA_7 ,'#13#10'    :DT_ULT_VENDA_8 ,'#13#10'    :DT_' +
      'ULT_VENDA_9 ,'#13#10'    :DT_ULT_VENDA_10,'#13#10'    :DT_ULT_VENDA_11,'#13#10'   ' +
      ' :DT_ULT_VENDA_12,'#13#10'    :DT_ULT_VENDA_13,'#13#10'    :DT_ULT_VENDA_14,' +
      #13#10'    :DT_ULT_VENDA_15,'#13#10'    :DT_ULT_VENDA_16,'#13#10'    :DT_ULT_VEND' +
      'A_17,'#13#10'    :DT_ULT_VENDA_18,'#13#10'    :DT_ULT_VENDA_19,'#13#10'    :DT_ULT' +
      '_VENDA_20)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_3'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_4'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_5'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_6'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_7'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_8'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_9'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_10'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_11'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_12'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_13'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_14'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_15'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_16'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_17'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_18'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_19'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_20'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_3'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_5'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_6'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_7'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_8'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_9'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_10'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_11'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_12'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_13'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_14'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_15'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_16'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_17'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_18'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_19'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA_20'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 640
    Top = 512
  end
  object SqlAtualizaProdutosQuantidade: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOS_QUANTIDADE(:ID_PRODUTO, :' +
      'QUANTIDADEINICIAL, :PRECO_VENDA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QUANTIDADEINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PRECO_VENDA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 768
    Top = 512
  end
  object CdsProdutosQuantidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 768
    Top = 560
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
  object CdsProdutosFP: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 880
    Top = 560
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
  object SqlAtualizaProdutosFP: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOS_FP(:ID_PRODUTO, :CD_PRODU' +
      'TO, :CD_LABORATORIO, :DESCRICAO, :PRECO, :USAPRECOLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USAPRECOLOJA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 880
    Top = 512
  end
  object SqlConferenciaNota: TSQLDataSet
    CommandText = 'SELECT * FROM CONFERENCIA_NOTA '#13#10'WHERE ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 472
    Top = 512
  end
  object DspConferenciaNota: TDataSetProvider
    DataSet = SqlConferenciaNota
    Left = 472
    Top = 552
  end
  object CdsConferenciaNota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConferenciaNota'
    Left = 472
    Top = 592
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
  end
  object SqlLotesItensCompra: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' ITENS_COMPRA_LOTE.* '#13#10'FROM '#13#10' ITENS_COMPRA_LOTE,'#13#10'TEMP' +
      '_ITENS_COMPRA_LOTE'#13#10'WHERE '#13#10' ITENS_COMPRA_LOTE.CD_COMPRAS = TEMP' +
      '_ITENS_COMPRA_LOTE.CD_COMPRAS AND'#13#10' ITENS_COMPRA_LOTE.ID_PRODUTO' +
      ' = TEMP_ITENS_COMPRA_LOTE.ID_PRODUTO AND'#13#10' ITENS_COMPRA_LOTE.LOT' +
      'E = TEMP_ITENS_COMPRA_LOTE.LOTE AND'#13#10' TEMP_ITENS_COMPRA_LOTE.ENV' +
      'IADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 904
    Top = 320
  end
  object DspLotesItensCompra: TDataSetProvider
    DataSet = SqlLotesItensCompra
    Left = 904
    Top = 360
  end
  object CdsLotesItensCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLotesItensCompra'
    Left = 904
    Top = 400
    object CdsLotesItensCompraCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object CdsLotesItensCompraCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsLotesItensCompraCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsLotesItensCompraNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsLotesItensCompraID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsLotesItensCompraLOTE: TStringField
      FieldName = 'LOTE'
      Required = True
    end
    object CdsLotesItensCompraQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsLotesItensCompraFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object CdsLotesItensCompraVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
  end
  object CdsProdutosFidelidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 632
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
  object SqlAtualizaProdutosFidelidade: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOS_FIDELIDADE(:ID_PRODUTO, :' +
      'CD_PRODUTO, :CD_LABORATORIO, :DESCRICAO, :PRECO, :CD_GRUPO, :DT_' +
      'ALTERACAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 640
    Top = 584
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver200.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=20.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver200.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=20.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'Database=localhost:d:\farmaxwin\farmax.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 40
    Top = 8
  end
  object CdsProdutosLotesST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosLotesST'
    Left = 976
    Top = 586
    object CdsProdutosLotesSTID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosLotesSTCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsProdutosLotesSTDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object CdsProdutosLotesSTCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsProdutosLotesSTNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Required = True
      Size = 10
    end
    object CdsProdutosLotesSTSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 10
    end
    object CdsProdutosLotesSTLOTE: TStringField
      FieldName = 'LOTE'
      Required = True
      Size = 10
    end
    object CdsProdutosLotesSTQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsProdutosLotesSTQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
    end
    object CdsProdutosLotesSTMODALIDADE_ST: TStringField
      FieldName = 'MODALIDADE_ST'
      Size = 100
    end
    object CdsProdutosLotesSTMVA: TFMTBCDField
      FieldName = 'MVA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosLotesSTPERCENTUALREDUCAO_ST: TFMTBCDField
      FieldName = 'PERCENTUALREDUCAO_ST'
      Precision = 19
      Size = 2
    end
    object CdsProdutosLotesSTBASECALCULO_ST: TFMTBCDField
      FieldName = 'BASECALCULO_ST'
      Precision = 19
      Size = 2
    end
    object CdsProdutosLotesSTALIQUOTA_ST: TFMTBCDField
      FieldName = 'ALIQUOTA_ST'
      Precision = 19
      Size = 2
    end
    object CdsProdutosLotesSTVALOR_ST: TFMTBCDField
      FieldName = 'VALOR_ST'
      Precision = 19
      Size = 2
    end
    object CdsProdutosLotesSTBASECALCULO_FCP_ST: TFMTBCDField
      FieldName = 'BASECALCULO_FCP_ST'
      Precision = 19
      Size = 2
    end
    object CdsProdutosLotesSTALIQUOTA_FCP_ST: TFMTBCDField
      FieldName = 'ALIQUOTA_FCP_ST'
      Precision = 19
      Size = 2
    end
    object CdsProdutosLotesSTVALOR_FCP_ST: TFMTBCDField
      FieldName = 'VALOR_FCP_ST'
      Precision = 19
      Size = 2
    end
  end
  object DspProdutosLotesST: TDataSetProvider
    DataSet = SqlProdutosLotesST
    Left = 976
    Top = 547
  end
  object SqlProdutosLotesST: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' PRODUTOS_LOTES_ST'#13#10'WHERE'#13#10' ID_PRODUTO||CD_FI' +
      'LIAL||DATA||LOTE IN'#13#10' (SELECT ID_PRODUTO||CD_FILIAL||DATA||LOTE ' +
      'FROM TEMP_PRODUTOS_LOTES_ST2)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 976
    Top = 506
  end
  object SqlComprasBoletos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COMPRAS_BOLETOS.*'#13#10'FROM'#13#10' COMPRAS_BOLETOS, TEMP_COMPRAS' +
      #13#10'WHERE'#13#10' COMPRAS_BOLETOS.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS A' +
      'ND'#13#10' COMPRAS_BOLETOS.CD_BOLETO = TEMP_COMPRAS.ID_PRODUTO AND'#13#10' T' +
      'EMP_COMPRAS.PROCESSO = '#39'17'#39' AND'#13#10' TEMP_COMPRAS.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1040
    Top = 54
  end
  object DspComprasBoletos: TDataSetProvider
    DataSet = SqlComprasBoletos
    Left = 1040
    Top = 96
  end
  object CdsComprasBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspComprasBoletos'
    Left = 1040
    Top = 136
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
  object SqlContasPagarCompras: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONTAS_PAGAR_COMPRAS.*'#13#10'FROM'#13#10' CONTAS_PAGAR_COMPRAS, TE' +
      'MP_COMPRAS'#13#10'WHERE'#13#10' CONTAS_PAGAR_COMPRAS.CD_COMPRAS = TEMP_COMPR' +
      'AS.CD_COMPRAS AND'#13#10' CONTAS_PAGAR_COMPRAS.CD_CONTAS_PAGAR = TEMP_' +
      'COMPRAS.ID_PRODUTO AND'#13#10' TEMP_COMPRAS.PROCESSO = '#39'71'#39' AND'#13#10' TEMP' +
      '_COMPRAS.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1040
    Top = 198
  end
  object DspContasPagarCompras: TDataSetProvider
    DataSet = SqlContasPagarCompras
    Left = 1040
    Top = 240
  end
  object CdsContasPagarCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasPagarCompras'
    Left = 1040
    Top = 280
    object CdsContasPagarComprasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsContasPagarComprasCD_CONTAS_PAGAR: TFloatField
      FieldName = 'CD_CONTAS_PAGAR'
    end
    object CdsContasPagarComprasCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object CdsContasPagarComprasDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object CdsContasPagarComprasNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 100
    end
    object CdsContasPagarComprasVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object SqlVendasItensExcluidos: TSQLDataSet
    CommandText = 'SELECT * FROM VENDAS_ITENS_EXCLUIDOS'#13#10'WHERE ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1040
    Top = 336
  end
  object DspVendasItensExcluidos: TDataSetProvider
    DataSet = SqlVendasItensExcluidos
    Left = 1040
    Top = 384
  end
  object CdsVendasItensExcluidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendasItensExcluidos'
    Left = 1040
    Top = 432
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
end
