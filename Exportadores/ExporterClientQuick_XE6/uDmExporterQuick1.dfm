object DmExporterQuick: TDmExporterQuick
  OldCreateOrder = False
  Top = 5
  Height = 733
  Width = 1019
  object CdsCeLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeLotes'
    Left = 24
    Top = 10
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
      Size = 40
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
    object CdsCeLotesCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
    end
    object CdsCeLotesCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
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
    object CdsCeLotesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsCeLotesNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 6
    end
    object CdsCeLotesDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CdsCeLotesPROMOCAO: TFloatField
      FieldName = 'PROMOCAO'
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
      Size = 30
    end
    object CdsCeLotesCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object CdsCeLotesCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CdsCeLotesARREDONDAMENTO: TFloatField
      FieldName = 'ARREDONDAMENTO'
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
  end
  object CdsCeCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeCaixa'
    Left = 88
    Top = 10
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
    object CdsCeCaixaTEFAUTORIZACAO: TFloatField
      FieldName = 'TEFAUTORIZACAO'
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
      Size = 10
    end
  end
  object CdsCeCadfin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeCadfin'
    Left = 160
    Top = 10
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
  end
  object DspCeLotes: TDataSetProvider
    DataSet = TbCeLotes
    Left = 24
    Top = 51
  end
  object DspCeCaixa: TDataSetProvider
    DataSet = TbCeCaixa
    Left = 88
    Top = 51
  end
  object DspCeCadFin: TDataSetProvider
    DataSet = TbCeCadFin
    Left = 160
    Top = 51
  end
  object HTTPRIO1: THTTPRIO
    URL = 'http://localhost/ExporterServer/ExporterServer.exe/soap/IDm'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 872
    Top = 224
  end
  object DspCeProdutos: TDataSetProvider
    DataSet = TbCeProdutos
    Left = 224
    Top = 51
  end
  object CdsCeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeProdutos'
    Left = 224
    Top = 10
  end
  object TbCeLotes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' CD_LANCAMENTO IN '#13#10' (SE' +
      'LECT FIRST 2000 CD_LANCAMENTO FROM TEMP_LANCAMENTOS2)'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 24
    Top = 90
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FarmaXpress'
    DriverName = 'InterXpress for Firebird'
    GetDriverFunc = 'getSQLDriverFB'
    LibraryName = 'dbxup_fb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=InterXpress for Firebird'
      'RoleName='
      'Database=localhost:D:\FarmaxWin\farmax.fdb'
      'WaitOnLocks=True'
      'CommitRetain=False'
      'ServerCharSet='
      'SqlDialect=3'
      'Trim Char=False'
      'USER_NAME=sysdba'
      'PASSWORD=masterkey'
      'InterXpress for Firebird TransIsolation=ReadCommited')
    VendorLib = 'fbclient.DLL'
    Left = 872
    Top = 168
  end
  object TbCeCaixa: TSQLDataSet
    CommandText = 'SELECT '#13#10' *'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 90
  end
  object TbCeCadFin: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM '#13#10' CONTAS_RECEBER'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 160
    Top = 90
  end
  object TbCeProdutos: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 224
    Top = 90
  end
  object DspCeTransfer: TDataSetProvider
    DataSet = TbTransfer
    Left = 560
    Top = 48
  end
  object CdsCeTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeTransfer'
    Left = 560
    Top = 12
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
  end
  object TbItensTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_TRANSFER.*'#13#10'FROM'#13#10' TRANSFER, '#13#10' ITENS_TRANSFER'#13#10'W' +
      'HERE'#13#10' TRANSFER.CD_TRANSFER = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' I' +
      'TENS_TRANSFER.STATUS <> '#39'A'#39' AND'#13#10'  (TRANSFER.ENVIADO <> '#39'2'#39' OR T' +
      'RANSFER.ENVIADO IS NULL)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 624
    Top = 88
  end
  object DspCeItensTransfer: TDataSetProvider
    DataSet = TbItensTransfer
    Left = 624
    Top = 48
  end
  object CdsCeItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeItensTransfer'
    Left = 624
    Top = 11
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
  end
  object Sql1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 152
    Top = 152
  end
  object TbCeParame: TSQLDataSet
    CommandText = 'SELECT'#13#10' CD_FILIAL,'#13#10' PRECIFICACAO_UNICA'#13#10'FROM'#13#10' PARAMETROS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 90
  end
  object DspParametros: TDataSetProvider
    DataSet = TbCeParame
    Left = 296
    Top = 51
  end
  object CdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 296
    Top = 10
    object CdsParametrosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsParametrosPRECIFICACAO_UNICA: TStringField
      FieldName = 'PRECIFICACAO_UNICA'
      Size = 1
    end
  end
  object DspOperadores: TDataSetProvider
    DataSet = TbOperadores
    Left = 496
    Top = 51
  end
  object CdsOperadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspOperadores'
    Left = 496
    Top = 10
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
      'SELECT'#13#10' * '#13#10'FROM '#13#10' OPERADORES'#13#10'WHERE '#13#10' STATUS = '#39'F'#39'  AND (ENV' +
      'IADO <> '#39'2'#39' OR ENVIADO IS NULL)'#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 496
    Top = 90
  end
  object DspEntregas: TDataSetProvider
    DataSet = TbEntregas
    Left = 360
    Top = 51
  end
  object TbCheques: TSQLDataSet
    CommandText = 'SELECT'#13#10' * '#13#10'FROM'#13#10' CHEQUESRECEBIDOS'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 430
    Top = 90
  end
  object DspCeCheques: TDataSetProvider
    DataSet = TbCheques
    Left = 430
    Top = 51
  end
  object CdsCheques: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeCheques'
    Left = 430
    Top = 10
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
  end
  object SqlCadernoFaltas: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' CADERNO_FALTAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 704
    Top = 88
  end
  object DspCadernoFaltas: TDataSetProvider
    DataSet = SqlCadernoFaltas
    Left = 704
    Top = 48
  end
  object CdsCadernoFaltas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCadernoFaltas'
    Left = 704
    Top = 8
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
    object CdsCadernoFaltasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsCadernoFaltasCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsCadernoFaltasCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsCadernoFaltasCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsCadernoFaltasQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsCadernoFaltasDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsCadernoFaltasID_MOTIVOFALTA: TFloatField
      FieldName = 'ID_MOTIVOFALTA'
    end
  end
  object CdsIncluiProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 148
    Top = 196
    Data = {
      7A0F00009619E0BD0100000018000000A00000000000030000007A0F0A43445F
      50524F4455544F01004900000001000557494454480200020006000C5449504F
      5F50524F4455544F010049000000010005574944544802000200020009444553
      43524943414F01004900000001000557494454480200020028000F434F444947
      4F5F4241525241535F310100490000000100055749445448020002000D000F43
      4F4449474F5F4241525241535F32010049000000010005574944544802000200
      0D0005435552564101004900000001000557494454480200020001000D494445
      4E544946494341444F5201004900000001000557494454480200020001000C51
      545F454D42414C4147454D08000400000000000D44545F56454E43494D454E54
      4F04000600000000000449434D53010049000000010005574944544802000200
      0200054C49535441010049000000010005574944544802000200010017454E54
      52415F50454449444F5F454C4554524F4E49434F010049000000010005574944
      544802000200010004464F544F04004B00000002000753554254595045020049
      00070042696E617279000557494454480200020001000E435553544F5F554E49
      544152494F08000400000000000B435553544F5F4D4544494F08000400000000
      0014505245434F5F56454E44415F414E544552494F5208000400000000000F4D
      415247454D5F50524F4D4F43414F08000400000000000E505245434F5F50524F
      4D4F43414F0800040000000000064D415247454D08000400000000000B505245
      434F5F56454E4441080004000000000008434F4D495353414F08000400000000
      000B44545F434144415354524F04000600000000000C44545F414C5445524143
      414F04000600000000001044545F554C54494D415F434F4D5052410400060000
      0000000B44545F5245414A555354450400060000000000125155414E54494441
      44455F454E54524144410800040000000000105155414E5449444144455F5341
      4944410800040000000000165155414E5449444144455F5452414E5346455249
      44410800040000000000094553544F5155455F30080004000000000010455354
      4F5155455F4D494E494D4F5F300800040000000000104553544F5155455F4D41
      58494D4F5F3008000400000000000E44545F554C545F56454E44415F30040006
      0000000000094553544F5155455F310800040000000000104553544F5155455F
      4D494E494D4F5F310800040000000000104553544F5155455F4D4158494D4F5F
      3108000400000000000E44545F554C545F56454E44415F310400060000000000
      094553544F5155455F320800040000000000104553544F5155455F4D494E494D
      4F5F320800040000000000104553544F5155455F4D4158494D4F5F3208000400
      000000000E44545F554C545F56454E44415F320400060000000000094553544F
      5155455F330800040000000000104553544F5155455F4D494E494D4F5F330800
      040000000000104553544F5155455F4D4158494D4F5F3308000400000000000E
      44545F554C545F56454E44415F330400060000000000094553544F5155455F34
      0800040000000000104553544F5155455F4D494E494D4F5F3408000400000000
      00104553544F5155455F4D4158494D4F5F3408000400000000000E44545F554C
      545F56454E44415F340400060000000000094553544F5155455F350800040000
      000000104553544F5155455F4D494E494D4F5F35080004000000000010455354
      4F5155455F4D4158494D4F5F3508000400000000000E44545F554C545F56454E
      44415F350400060000000000094553544F5155455F3608000400000000001045
      53544F5155455F4D494E494D4F5F360800040000000000104553544F5155455F
      4D4158494D4F5F3608000400000000000E44545F554C545F56454E44415F3604
      00060000000000094553544F5155455F370800040000000000104553544F5155
      455F4D494E494D4F5F370800040000000000104553544F5155455F4D4158494D
      4F5F3708000400000000000E44545F554C545F56454E44415F37040006000000
      0000094553544F5155455F380800040000000000104553544F5155455F4D494E
      494D4F5F380800040000000000104553544F5155455F4D4158494D4F5F380800
      0400000000000E44545F554C545F56454E44415F380400060000000000094553
      544F5155455F390800040000000000104553544F5155455F4D494E494D4F5F39
      0800040000000000104553544F5155455F4D4158494D4F5F3908000400000000
      000E44545F554C545F56454E44415F3904000600000000000A4553544F515545
      5F31300800040000000000114553544F5155455F4D494E494D4F5F3130080004
      0000000000114553544F5155455F4D4158494D4F5F313008000400000000000F
      44545F554C545F56454E44415F313004000600000000000A49445F50524F4455
      544F08000400040000000E43445F4C41424F5241544F52494F08000400000000
      000843445F475255504F08000400000000000943445F434C4153534508000400
      000000000B54585F444553434F4E544F0800040000000000034A414E08000400
      00000000034645560800040000000000034D4152080004000000000003414252
      0800040000000000034D41490800040000000000034A554E0800040000000000
      034A554C08000400000000000341474F0800040000000000045345545F080004
      0000000000034F55540800040000000000034E4F560800040000000000034445
      5A08000400000000000742414C414E4341010049000000010005574944544802
      000200010007554E494441444501004900000001000557494454480200020002
      001644545F56454E43494D454E544F5F50524F4D4F43414F0400060000000000
      0653544154555301004900000001000557494454480200020001000843445F4C
      4953544108000400000000000C43445F5052494E434950494F08000400000000
      000A434F4D504F534943414F04004B0000000200075355425459504502004900
      0500546578740005574944544802000200010008455449515545544101004900
      000001000557494454480200020032000D44545F494E56454E544152494F0400
      06000000000007454E564941444F010049000000010005574944544802000200
      010010435553544F5F554E49544152494F5F3108000400000000000D43555354
      4F5F4D4544494F5F31080004000000000006464143455F310800040000000000
      0F44545F554C545F434F4D5052415F3104000600000000001043555256415F55
      4E4954415249415F310100490000000100055749445448020002000100124355
      5256415F46494E414E43454952415F3101004900000001000557494454480200
      0200010010435553544F5F554E49544152494F5F3208000400000000000D4355
      53544F5F4D4544494F5F32080004000000000006464143455F32080004000000
      00000F44545F554C545F434F4D5052415F320400060000000000104355525641
      5F554E4954415249415F32010049000000010005574944544802000200010012
      43555256415F46494E414E43454952415F320100490000000100055749445448
      02000200010010435553544F5F554E49544152494F5F3308000400000000000D
      435553544F5F4D4544494F5F33080004000000000006464143455F3308000400
      000000000F44545F554C545F434F4D5052415F33040006000000000010435552
      56415F554E4954415249415F3301004900000001000557494454480200020001
      001243555256415F46494E414E43454952415F33010049000000010005574944
      544802000200010010435553544F5F554E49544152494F5F3408000400000000
      000D435553544F5F4D4544494F5F34080004000000000006464143455F340800
      0400000000000F44545F554C545F434F4D5052415F3404000600000000001043
      555256415F554E4954415249415F340100490000000100055749445448020002
      0001001243555256415F46494E414E43454952415F3401004900000001000557
      4944544802000200010010435553544F5F554E49544152494F5F350800040000
      0000000D435553544F5F4D4544494F5F35080004000000000006464143455F35
      08000400000000000F44545F554C545F434F4D5052415F350400060000000000
      1043555256415F554E4954415249415F35010049000000010005574944544802
      00020001001243555256415F46494E414E43454952415F350100490000000100
      05574944544802000200010010435553544F5F554E49544152494F5F36080004
      00000000000D435553544F5F4D4544494F5F3608000400000000000646414345
      5F3608000400000000000F44545F554C545F434F4D5052415F36040006000000
      00001043555256415F554E4954415249415F3601004900000001000557494454
      480200020001001243555256415F46494E414E43454952415F36010049000000
      010005574944544802000200010010435553544F5F554E49544152494F5F3708
      000400000000000D435553544F5F4D4544494F5F370800040000000000064641
      43455F3708000400000000000F44545F554C545F434F4D5052415F3704000600
      000000001043555256415F554E4954415249415F370100490000000100055749
      4454480200020001001243555256415F46494E414E43454952415F3701004900
      0000010005574944544802000200010010435553544F5F554E49544152494F5F
      3808000400000000000D435553544F5F4D4544494F5F38080004000000000006
      464143455F3808000400000000000F44545F554C545F434F4D5052415F380400
      0600000000001043555256415F554E4954415249415F38010049000000010005
      57494454480200020001001243555256415F46494E414E43454952415F380100
      49000000010005574944544802000200010010435553544F5F554E4954415249
      4F5F3908000400000000000D435553544F5F4D4544494F5F3908000400000000
      0006464143455F3908000400000000000F44545F554C545F434F4D5052415F39
      04000600000000001043555256415F554E4954415249415F3901004900000001
      000557494454480200020001001243555256415F46494E414E43454952415F39
      010049000000010005574944544802000200010011435553544F5F554E495441
      52494F5F313008000400000000000E435553544F5F4D4544494F5F3130080004
      000000000007464143455F313008000400000000001044545F554C545F434F4D
      5052415F313004000600000000001143555256415F554E4954415249415F3130
      01004900000001000557494454480200020001001343555256415F46494E414E
      43454952415F313001004900000001000557494454480200020001000B55534F
      434F4E54494E554F01004900000001000557494454480200020001000000}
    object CdsIncluiProdutosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsIncluiProdutosTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 2
    end
    object CdsIncluiProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsIncluiProdutosCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object CdsIncluiProdutosCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 13
    end
    object CdsIncluiProdutosCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
    object CdsIncluiProdutosIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Size = 1
    end
    object CdsIncluiProdutosQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsIncluiProdutosDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsIncluiProdutosICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsIncluiProdutosLISTA: TStringField
      FieldName = 'LISTA'
      Size = 1
    end
    object CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO: TStringField
      FieldName = 'ENTRA_PEDIDO_ELETRONICO'
      Size = 1
    end
    object CdsIncluiProdutosFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
    object CdsIncluiProdutosCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR'
    end
    object CdsIncluiProdutosMARGEM_PROMOCAO: TFloatField
      FieldName = 'MARGEM_PROMOCAO'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object CdsIncluiProdutosMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object CdsIncluiProdutosPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object CdsIncluiProdutosCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CdsIncluiProdutosDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object CdsIncluiProdutosDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsIncluiProdutosDT_ULTIMA_COMPRA: TDateField
      FieldName = 'DT_ULTIMA_COMPRA'
    end
    object CdsIncluiProdutosDT_REAJUSTE: TDateField
      FieldName = 'DT_REAJUSTE'
    end
    object CdsIncluiProdutosQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
    end
    object CdsIncluiProdutosQUANTIDADE_SAIDA: TFloatField
      FieldName = 'QUANTIDADE_SAIDA'
    end
    object CdsIncluiProdutosQUANTIDADE_TRANSFERIDA: TFloatField
      FieldName = 'QUANTIDADE_TRANSFERIDA'
    end
    object CdsIncluiProdutosESTOQUE_0: TFloatField
      FieldName = 'ESTOQUE_0'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_0: TFloatField
      FieldName = 'ESTOQUE_MINIMO_0'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_0: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_0'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_0: TDateField
      FieldName = 'DT_ULT_VENDA_0'
    end
    object CdsIncluiProdutosESTOQUE_1: TFloatField
      FieldName = 'ESTOQUE_1'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_1: TFloatField
      FieldName = 'ESTOQUE_MINIMO_1'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_1: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_1'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_1: TDateField
      FieldName = 'DT_ULT_VENDA_1'
    end
    object CdsIncluiProdutosESTOQUE_2: TFloatField
      FieldName = 'ESTOQUE_2'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_2: TFloatField
      FieldName = 'ESTOQUE_MINIMO_2'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_2: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_2'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_2: TDateField
      FieldName = 'DT_ULT_VENDA_2'
    end
    object CdsIncluiProdutosESTOQUE_3: TFloatField
      FieldName = 'ESTOQUE_3'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_3: TFloatField
      FieldName = 'ESTOQUE_MINIMO_3'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_3: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_3'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_3: TDateField
      FieldName = 'DT_ULT_VENDA_3'
    end
    object CdsIncluiProdutosESTOQUE_4: TFloatField
      FieldName = 'ESTOQUE_4'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_4: TFloatField
      FieldName = 'ESTOQUE_MINIMO_4'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_4: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_4'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_4: TDateField
      FieldName = 'DT_ULT_VENDA_4'
    end
    object CdsIncluiProdutosESTOQUE_5: TFloatField
      FieldName = 'ESTOQUE_5'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_5: TFloatField
      FieldName = 'ESTOQUE_MINIMO_5'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_5: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_5'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_5: TDateField
      FieldName = 'DT_ULT_VENDA_5'
    end
    object CdsIncluiProdutosESTOQUE_6: TFloatField
      FieldName = 'ESTOQUE_6'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_6: TFloatField
      FieldName = 'ESTOQUE_MINIMO_6'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_6: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_6'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_6: TDateField
      FieldName = 'DT_ULT_VENDA_6'
    end
    object CdsIncluiProdutosESTOQUE_7: TFloatField
      FieldName = 'ESTOQUE_7'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_7: TFloatField
      FieldName = 'ESTOQUE_MINIMO_7'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_7: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_7'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_7: TDateField
      FieldName = 'DT_ULT_VENDA_7'
    end
    object CdsIncluiProdutosESTOQUE_8: TFloatField
      FieldName = 'ESTOQUE_8'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_8: TFloatField
      FieldName = 'ESTOQUE_MINIMO_8'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_8: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_8'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_8: TDateField
      FieldName = 'DT_ULT_VENDA_8'
    end
    object CdsIncluiProdutosESTOQUE_9: TFloatField
      FieldName = 'ESTOQUE_9'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_9: TFloatField
      FieldName = 'ESTOQUE_MINIMO_9'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_9: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_9'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_9: TDateField
      FieldName = 'DT_ULT_VENDA_9'
    end
    object CdsIncluiProdutosESTOQUE_10: TFloatField
      FieldName = 'ESTOQUE_10'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_10: TFloatField
      FieldName = 'ESTOQUE_MINIMO_10'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_10: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_10'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_10: TDateField
      FieldName = 'DT_ULT_VENDA_10'
    end
    object CdsIncluiProdutosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsIncluiProdutosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsIncluiProdutosCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsIncluiProdutosCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsIncluiProdutosTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsIncluiProdutosJAN: TFloatField
      FieldName = 'JAN'
    end
    object CdsIncluiProdutosFEV: TFloatField
      FieldName = 'FEV'
    end
    object CdsIncluiProdutosMAR: TFloatField
      FieldName = 'MAR'
    end
    object CdsIncluiProdutosABR: TFloatField
      FieldName = 'ABR'
    end
    object CdsIncluiProdutosMAI: TFloatField
      FieldName = 'MAI'
    end
    object CdsIncluiProdutosJUN: TFloatField
      FieldName = 'JUN'
    end
    object CdsIncluiProdutosJUL: TFloatField
      FieldName = 'JUL'
    end
    object CdsIncluiProdutosAGO: TFloatField
      FieldName = 'AGO'
    end
    object CdsIncluiProdutosSET_: TFloatField
      FieldName = 'SET_'
    end
    object CdsIncluiProdutosOUT: TFloatField
      FieldName = 'OUT'
    end
    object CdsIncluiProdutosNOV: TFloatField
      FieldName = 'NOV'
    end
    object CdsIncluiProdutosDEZ: TFloatField
      FieldName = 'DEZ'
    end
    object CdsIncluiProdutosBALANCA: TStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object CdsIncluiProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO'
    end
    object CdsIncluiProdutosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsIncluiProdutosCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object CdsIncluiProdutosCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
    end
    object CdsIncluiProdutosCOMPOSICAO: TMemoField
      FieldName = 'COMPOSICAO'
      BlobType = ftMemo
      Size = 1
    end
    object CdsIncluiProdutosETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 50
    end
    object CdsIncluiProdutosDT_INVENTARIO: TDateField
      FieldName = 'DT_INVENTARIO'
    end
    object CdsIncluiProdutosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_1: TFloatField
      FieldName = 'CUSTO_UNITARIO_1'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_1: TFloatField
      FieldName = 'CUSTO_MEDIO_1'
    end
    object CdsIncluiProdutosFACE_1: TFloatField
      FieldName = 'FACE_1'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_1: TDateField
      FieldName = 'DT_ULT_COMPRA_1'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_1: TStringField
      FieldName = 'CURVA_UNITARIA_1'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_1: TStringField
      FieldName = 'CURVA_FINANCEIRA_1'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_2: TFloatField
      FieldName = 'CUSTO_UNITARIO_2'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_2: TFloatField
      FieldName = 'CUSTO_MEDIO_2'
    end
    object CdsIncluiProdutosFACE_2: TFloatField
      FieldName = 'FACE_2'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_2: TDateField
      FieldName = 'DT_ULT_COMPRA_2'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_2: TStringField
      FieldName = 'CURVA_UNITARIA_2'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_2: TStringField
      FieldName = 'CURVA_FINANCEIRA_2'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_3: TFloatField
      FieldName = 'CUSTO_UNITARIO_3'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_3: TFloatField
      FieldName = 'CUSTO_MEDIO_3'
    end
    object CdsIncluiProdutosFACE_3: TFloatField
      FieldName = 'FACE_3'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_3: TDateField
      FieldName = 'DT_ULT_COMPRA_3'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_3: TStringField
      FieldName = 'CURVA_UNITARIA_3'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_3: TStringField
      FieldName = 'CURVA_FINANCEIRA_3'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_4: TFloatField
      FieldName = 'CUSTO_UNITARIO_4'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_4: TFloatField
      FieldName = 'CUSTO_MEDIO_4'
    end
    object CdsIncluiProdutosFACE_4: TFloatField
      FieldName = 'FACE_4'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_4: TDateField
      FieldName = 'DT_ULT_COMPRA_4'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_4: TStringField
      FieldName = 'CURVA_UNITARIA_4'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_4: TStringField
      FieldName = 'CURVA_FINANCEIRA_4'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_5: TFloatField
      FieldName = 'CUSTO_UNITARIO_5'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_5: TFloatField
      FieldName = 'CUSTO_MEDIO_5'
    end
    object CdsIncluiProdutosFACE_5: TFloatField
      FieldName = 'FACE_5'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_5: TDateField
      FieldName = 'DT_ULT_COMPRA_5'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_5: TStringField
      FieldName = 'CURVA_UNITARIA_5'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_5: TStringField
      FieldName = 'CURVA_FINANCEIRA_5'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_6: TFloatField
      FieldName = 'CUSTO_UNITARIO_6'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_6: TFloatField
      FieldName = 'CUSTO_MEDIO_6'
    end
    object CdsIncluiProdutosFACE_6: TFloatField
      FieldName = 'FACE_6'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_6: TDateField
      FieldName = 'DT_ULT_COMPRA_6'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_6: TStringField
      FieldName = 'CURVA_UNITARIA_6'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_6: TStringField
      FieldName = 'CURVA_FINANCEIRA_6'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_7: TFloatField
      FieldName = 'CUSTO_UNITARIO_7'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_7: TFloatField
      FieldName = 'CUSTO_MEDIO_7'
    end
    object CdsIncluiProdutosFACE_7: TFloatField
      FieldName = 'FACE_7'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_7: TDateField
      FieldName = 'DT_ULT_COMPRA_7'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_7: TStringField
      FieldName = 'CURVA_UNITARIA_7'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_7: TStringField
      FieldName = 'CURVA_FINANCEIRA_7'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_8: TFloatField
      FieldName = 'CUSTO_UNITARIO_8'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_8: TFloatField
      FieldName = 'CUSTO_MEDIO_8'
    end
    object CdsIncluiProdutosFACE_8: TFloatField
      FieldName = 'FACE_8'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_8: TDateField
      FieldName = 'DT_ULT_COMPRA_8'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_8: TStringField
      FieldName = 'CURVA_UNITARIA_8'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_8: TStringField
      FieldName = 'CURVA_FINANCEIRA_8'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_9: TFloatField
      FieldName = 'CUSTO_UNITARIO_9'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_9: TFloatField
      FieldName = 'CUSTO_MEDIO_9'
    end
    object CdsIncluiProdutosFACE_9: TFloatField
      FieldName = 'FACE_9'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_9: TDateField
      FieldName = 'DT_ULT_COMPRA_9'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_9: TStringField
      FieldName = 'CURVA_UNITARIA_9'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_9: TStringField
      FieldName = 'CURVA_FINANCEIRA_9'
      Size = 1
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_10: TFloatField
      FieldName = 'CUSTO_UNITARIO_10'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_10: TFloatField
      FieldName = 'CUSTO_MEDIO_10'
    end
    object CdsIncluiProdutosFACE_10: TFloatField
      FieldName = 'FACE_10'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_10: TDateField
      FieldName = 'DT_ULT_COMPRA_10'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_10: TStringField
      FieldName = 'CURVA_UNITARIA_10'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_10: TStringField
      FieldName = 'CURVA_FINANCEIRA_10'
      Size = 1
    end
    object CdsIncluiProdutosUSOCONTINUO: TStringField
      DisplayWidth = 1
      FieldName = 'USOCONTINUO'
      Size = 1
    end
  end
  object CdsCeDuplic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeDuplic'
    Left = 784
    Top = 10
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
      FieldName = 'DOCUMENTO'
      Size = 10
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
      FieldName = 'NOSSO_NUMERO'
      Size = 10
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
  end
  object DspCeDuplic: TDataSetProvider
    DataSet = TbCeDuplic
    Left = 784
    Top = 51
  end
  object TbCeDuplic: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM '#13#10' CONTAS_PAGAR'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 784
    Top = 90
  end
  object SqlClasses: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' CLASSES'#13#10'WHERE'#13#10' CD_CLASSE = :CD_CLASSE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 96
    Top = 151
  end
  object DspClasses: TDataSetProvider
    DataSet = SqlClasses
    Left = 96
    Top = 195
  end
  object QryClasses: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end>
    ProviderName = 'DspClasses'
    Left = 96
    Top = 239
    object QryClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
    object QryClassesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object QryClassesTIPO: TStringField
      FieldName = 'TIPO'
      Size = 2
    end
    object QryClassesVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      Size = 1
    end
  end
  object CdsClasses: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 284
    object CdsClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
    object CdsClassesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object CdsClassesTIPO: TStringField
      FieldName = 'TIPO'
      Size = 2
    end
    object CdsClassesVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      Size = 1
    end
  end
  object TbCeClientes: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' *'#13#10'FROM '#13#10' CLIENTES'#13#10'WHERE '#13#10' CD_CLIENTE IN (SELECT ID' +
      '_PRODUTO FROM TEMP_PRODUTOS WHERE PROCESSO = 14) '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 856
    Top = 88
  end
  object DspCeClientes: TDataSetProvider
    DataSet = TbCeClientes
    Left = 856
    Top = 51
  end
  object CdsCeClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeClientes'
    Left = 856
    Top = 10
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
      Size = 1
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
  end
  object SqlClientes: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' CLIENTES'#13#10'WHERE '#13#10' CD_CLIENTE = :CD_CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 147
  end
  object DspClientes: TDataSetProvider
    DataSet = SqlClientes
    Left = 32
    Top = 191
  end
  object QryClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'DspClientes'
    Left = 32
    Top = 235
    object QryClientesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object QryClientesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryClientesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object QryClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object QryClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object QryClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object QryClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object QryClientesCAIXA_POSTAL: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 5
    end
    object QryClientesFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object QryClientesFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object QryClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object QryClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object QryClientesINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object QryClientesPRACA: TStringField
      FieldName = 'PRACA'
      Size = 6
    end
    object QryClientesDATA_FICHA: TDateField
      FieldName = 'DATA_FICHA'
    end
    object QryClientesRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object QryClientesCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object QryClientesTITULO_ELEITO: TStringField
      FieldName = 'TITULO_ELEITO'
      Size = 12
    end
    object QryClientesDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object QryClientesSEXO: TStringField
      FieldName = 'SEXO'
      Size = 10
    end
    object QryClientesESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 10
    end
    object QryClientesNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
    end
    object QryClientesFILIACAO: TStringField
      FieldName = 'FILIACAO'
      Size = 60
    end
    object QryClientesNUMERO_DEPENDENTES: TFloatField
      FieldName = 'NUMERO_DEPENDENTES'
    end
    object QryClientesCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 40
    end
    object QryClientesDT_NASC_CONJUGE: TStringField
      FieldName = 'DT_NASC_CONJUGE'
    end
    object QryClientesALUGUEL: TStringField
      FieldName = 'ALUGUEL'
      Size = 3
    end
    object QryClientesVL_ALUGUEL: TFloatField
      FieldName = 'VL_ALUGUEL'
    end
    object QryClientesTEMPO_RESIDENCIA: TStringField
      FieldName = 'TEMPO_RESIDENCIA'
    end
    object QryClientesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 50
    end
    object QryClientesFONE_COMERCIAL: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 30
    end
    object QryClientesDT_ADMISSAO: TStringField
      FieldName = 'DT_ADMISSAO'
    end
    object QryClientesCEP_COMERCIAL: TStringField
      FieldName = 'CEP_COMERCIAL'
      Size = 9
    end
    object QryClientesCIDADE_COMERCIAL: TStringField
      FieldName = 'CIDADE_COMERCIAL'
      Size = 35
    end
    object QryClientesUF_COMERCIAL: TStringField
      FieldName = 'UF_COMERCIAL'
      Size = 2
    end
    object QryClientesFUNCAO: TStringField
      FieldName = 'FUNCAO'
    end
    object QryClientesEMPRESA_ANTERIOR: TStringField
      FieldName = 'EMPRESA_ANTERIOR'
      Size = 40
    end
    object QryClientesTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      Size = 15
    end
    object QryClientesREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 50
    end
    object QryClientesREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 50
    end
    object QryClientesCONSULTA_SPC: TStringField
      FieldName = 'CONSULTA_SPC'
    end
    object QryClientesOBSERVACAO_SPC: TStringField
      FieldName = 'OBSERVACAO_SPC'
      Size = 40
    end
    object QryClientesOBSERVACAO_GERAL: TStringField
      FieldName = 'OBSERVACAO_GERAL'
      Size = 254
    end
    object QryClientesENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 40
    end
    object QryClientesBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
    end
    object QryClientesCIDADE_COBRANCA: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Size = 35
    end
    object QryClientesUF_COBRANCA: TStringField
      FieldName = 'UF_COBRANCA'
      Size = 2
    end
    object QryClientesCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      Size = 9
    end
    object QryClientesICMS_IPI: TStringField
      FieldName = 'ICMS_IPI'
      Size = 1
    end
    object QryClientesNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 60
    end
    object QryClientesMES_NASCIMENTO: TFloatField
      FieldName = 'MES_NASCIMENTO'
    end
    object QryClientesRENDA: TFloatField
      FieldName = 'RENDA'
    end
    object QryClientesLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
    end
    object QryClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object QryClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 45
    end
    object QryClientesHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 50
    end
    object QryClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object QryClientesMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 10
    end
    object QryClientesSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object QryClientesDT_VENCIMENTO: TFloatField
      FieldName = 'DT_VENCIMENTO'
    end
    object QryClientesDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object QryClientesDT_ULTIMA_COMPRA: TDateField
      FieldName = 'DT_ULTIMA_COMPRA'
    end
    object QryClientesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryClientesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object QryClientesDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 283
    object CdsClientesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object CdsClientesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsClientesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object CdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object CdsClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object CdsClientesCAIXA_POSTAL: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 5
    end
    object CdsClientesFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object CdsClientesFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object CdsClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object CdsClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsClientesINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object CdsClientesPRACA: TStringField
      FieldName = 'PRACA'
      Size = 6
    end
    object CdsClientesDATA_FICHA: TDateField
      FieldName = 'DATA_FICHA'
    end
    object CdsClientesRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object CdsClientesCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object CdsClientesTITULO_ELEITO: TStringField
      FieldName = 'TITULO_ELEITO'
      Size = 12
    end
    object CdsClientesDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object CdsClientesSEXO: TStringField
      FieldName = 'SEXO'
      Size = 10
    end
    object CdsClientesESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 10
    end
    object CdsClientesNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
    end
    object CdsClientesFILIACAO: TStringField
      FieldName = 'FILIACAO'
      Size = 60
    end
    object CdsClientesNUMERO_DEPENDENTES: TFloatField
      FieldName = 'NUMERO_DEPENDENTES'
    end
    object CdsClientesCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 40
    end
    object CdsClientesDT_NASC_CONJUGE: TStringField
      FieldName = 'DT_NASC_CONJUGE'
    end
    object CdsClientesALUGUEL: TStringField
      FieldName = 'ALUGUEL'
      Size = 3
    end
    object CdsClientesVL_ALUGUEL: TFloatField
      FieldName = 'VL_ALUGUEL'
    end
    object CdsClientesTEMPO_RESIDENCIA: TStringField
      FieldName = 'TEMPO_RESIDENCIA'
    end
    object CdsClientesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 50
    end
    object CdsClientesFONE_COMERCIAL: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 30
    end
    object CdsClientesDT_ADMISSAO: TStringField
      FieldName = 'DT_ADMISSAO'
    end
    object CdsClientesCEP_COMERCIAL: TStringField
      FieldName = 'CEP_COMERCIAL'
      Size = 9
    end
    object CdsClientesCIDADE_COMERCIAL: TStringField
      FieldName = 'CIDADE_COMERCIAL'
      Size = 35
    end
    object CdsClientesUF_COMERCIAL: TStringField
      FieldName = 'UF_COMERCIAL'
      Size = 2
    end
    object CdsClientesFUNCAO: TStringField
      FieldName = 'FUNCAO'
    end
    object CdsClientesEMPRESA_ANTERIOR: TStringField
      FieldName = 'EMPRESA_ANTERIOR'
      Size = 40
    end
    object CdsClientesTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      Size = 15
    end
    object CdsClientesREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 50
    end
    object CdsClientesREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 50
    end
    object CdsClientesCONSULTA_SPC: TStringField
      FieldName = 'CONSULTA_SPC'
    end
    object CdsClientesOBSERVACAO_SPC: TStringField
      FieldName = 'OBSERVACAO_SPC'
      Size = 40
    end
    object CdsClientesOBSERVACAO_GERAL: TStringField
      FieldName = 'OBSERVACAO_GERAL'
      Size = 254
    end
    object CdsClientesENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 40
    end
    object CdsClientesBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
    end
    object CdsClientesCIDADE_COBRANCA: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Size = 35
    end
    object CdsClientesUF_COBRANCA: TStringField
      FieldName = 'UF_COBRANCA'
      Size = 2
    end
    object CdsClientesCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      Size = 9
    end
    object CdsClientesICMS_IPI: TStringField
      FieldName = 'ICMS_IPI'
      Size = 1
    end
    object CdsClientesNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 60
    end
    object CdsClientesMES_NASCIMENTO: TFloatField
      FieldName = 'MES_NASCIMENTO'
    end
    object CdsClientesRENDA: TFloatField
      FieldName = 'RENDA'
    end
    object CdsClientesLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
    end
    object CdsClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object CdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 45
    end
    object CdsClientesHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 50
    end
    object CdsClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object CdsClientesMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 10
    end
    object CdsClientesSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object CdsClientesDT_VENCIMENTO: TFloatField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsClientesDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CdsClientesDT_ULTIMA_COMPRA: TDateField
      FieldName = 'DT_ULTIMA_COMPRA'
    end
    object CdsClientesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsClientesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object CdsClientesDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object SqlContas_Receber: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' CONTAS_RECEBER '#13#10'WHERE'#13#10' CD_CONTAS_RECEBER =' +
      ' :CD_CONTAS_RECEBER'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 302
    Top = 160
  end
  object DspContas_receber: TDataSetProvider
    DataSet = SqlContas_Receber
    Left = 302
    Top = 200
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
    Left = 302
    Top = 240
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
  end
  object CdsContas_Receber: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 302
    Top = 280
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
  end
  object SqlTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' CD_TRANSFER = :CD_TRANSFER'#13 +
      #10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_TRANSFER'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 336
  end
  object DspTransfer: TDataSetProvider
    DataSet = SqlTransfer
    Left = 32
    Top = 384
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
    Left = 32
    Top = 428
    object QryTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object QryTransferDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
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
  end
  object CdsTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 474
    object CdsTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsTransferDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
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
  end
  object CdsItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 474
    object CdsItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsItensTransferCD_PRODUTO: TFloatField
      FieldName = 'CD_PRODUTO'
    end
    object CdsItensTransferCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsItensTransferCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsItensTransferDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 45
    end
    object CdsItensTransferQUANTIDADE_SOLICITADA: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
    end
    object CdsItensTransferQUANTIDADE_ENVIADA: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
    end
    object CdsItensTransferQUANTIDADE_RECEBIDA: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
    end
    object CdsItensTransferVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsItensTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object CdsItensTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
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
    Left = 96
    Top = 429
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
      Size = 45
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
  end
  object DspItensTransfer: TDataSetProvider
    DataSet = SqlItensTransfer
    Left = 96
    Top = 384
  end
  object SqlItensTransfer: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' ITENS_TRANSFER.*'#13#10'FROM'#13#10' ITENS_TRANSFER'#13#10'WHERE'#13#10' ITENS' +
      '_TRANSFER.CD_TRANSFER = :CD_TRANSFER AND'#13#10' ITENS_TRANSFER.ID_PRO' +
      'DUTO = :ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TRANSFER'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 96
    Top = 336
  end
  object SqlControlador: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(ID_PRODUTO) AS N_ITENS,'#13#10' SUM(ESTOQUE_0) AS N_UNI' +
      'DADES,'#13#10' SUM(CUSTO_UNITARIO) AS T_CUSTO,'#13#10' SUM(PRECO_VENDA) AS T' +
      '_VENDA,'#13#10' SUM(PRECO_VENDA) AS CLASSES,'#13#10' SUM(PRECO_VENDA) AS GRU' +
      'POS,'#13#10' SUM(PRECO_VENDA) AS LABORATORIOS,'#13#10' SUM(PRECO_VENDA) AS D' +
      'ISTRIBUIDORES,'#13#10' SUM(PRECO_VENDA) AS FAMILIAS,'#13#10' SUM(PRECO_VENDA' +
      ') AS GRUPOSBALANCO,'#13#10' SUM(PRECO_VENDA) AS GRUPOSCOMPRAS,'#13#10' SUM(P' +
      'RECO_VENDA) AS CARTOES'#13#10'FROM'#13#10' PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 462
    Top = 163
  end
  object DspConstrolador: TDataSetProvider
    DataSet = SqlControlador
    Left = 462
    Top = 200
  end
  object CdsControlador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConstrolador'
    Left = 462
    Top = 240
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
  end
  object SqlNumeroLancamentosLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAMENTO =' +
      ' CURRENT_DATE AND'#13#10' ENVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 422
    Top = 376
  end
  object DspNumeroLancamentosLoja: TDataSetProvider
    DataSet = SqlNumeroLancamentosLoja
    Left = 422
    Top = 416
  end
  object CdsNumeroLancamentosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroLancamentosLoja'
    Left = 422
    Top = 456
    object CdsNumeroLancamentosLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlNumeroCaixaLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA = CURRENT_DATE AND' +
      #13#10' ENVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 455
    Top = 544
  end
  object DspNumeroCaixaLoja: TDataSetProvider
    DataSet = SqlNumeroCaixaLoja
    Left = 455
    Top = 584
  end
  object CdsNumeroCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroCaixaLoja'
    Left = 455
    Top = 624
    object CdsNumeroCaixaLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdLancamentoLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_LANCAMENTO'#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAME' +
      'NTO = CURRENT_DATE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 534
    Top = 376
  end
  object CdsCdLancamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 534
    Top = 336
    object CdsCdLancamentoCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object DspCdLancamentoLoja: TDataSetProvider
    DataSet = SqlCdLancamentoLoja
    Left = 534
    Top = 416
  end
  object CdsCdLancamentoLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdLancamentoLoja'
    Left = 534
    Top = 456
    object CdsCdLancamentoLojaCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object SqlCdCaixaLoja: TSQLDataSet
    CommandText = 'SELECT'#13#10' CD_CAIXA'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA = CURRENT_DATE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 551
    Top = 544
  end
  object CdsCdCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 551
    Top = 504
    object CdsCdCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object DspCdCaixaLoja: TDataSetProvider
    DataSet = SqlCdCaixaLoja
    Left = 551
    Top = 584
  end
  object CdsCdCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdCaixaLoja'
    Left = 551
    Top = 624
    object CdsCdCaixaLojaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object SqlDistribuidores: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' DISTRIBUIDORES'#13#10'WHERE'#13#10' CD_DISTRIBUIDOR = :CD' +
      '_DISTRIBUIDOR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 168
    Top = 339
  end
  object DspDistribuidores: TDataSetProvider
    DataSet = SqlDistribuidores
    Left = 168
    Top = 383
  end
  object QryDistribuidores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end>
    ProviderName = 'DspDistribuidores'
    Left = 168
    Top = 427
    object QryDistribuidoresCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object QryDistribuidoresNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 51
    end
    object QryDistribuidoresAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 10
    end
    object QryDistribuidoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 41
    end
    object QryDistribuidoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 21
    end
    object QryDistribuidoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 36
    end
    object QryDistribuidoresUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object QryDistribuidoresCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object QryDistribuidoresCAIXA_POSTAL: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 6
    end
    object QryDistribuidoresFONE: TStringField
      FieldName = 'FONE'
      Size = 31
    end
    object QryDistribuidoresFAX: TStringField
      FieldName = 'FAX'
      Size = 31
    end
    object QryDistribuidoresCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 31
    end
    object QryDistribuidoresCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object QryDistribuidoresIE: TStringField
      FieldName = 'IE'
      Size = 16
    end
    object QryDistribuidoresPRACA: TStringField
      FieldName = 'PRACA'
      Size = 7
    end
    object QryDistribuidoresDT_FICHA: TDateField
      FieldName = 'DT_FICHA'
    end
    object QryDistribuidoresRG: TStringField
      FieldName = 'RG'
      Size = 11
    end
    object QryDistribuidoresCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object QryDistribuidoresEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 51
    end
    object QryDistribuidoresFONE_COMERCIAL: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 31
    end
    object QryDistribuidoresCEP_COMERCIAL: TStringField
      FieldName = 'CEP_COMERCIAL'
      Size = 10
    end
    object QryDistribuidoresCIDADE_COMERCIAL: TStringField
      FieldName = 'CIDADE_COMERCIAL'
      Size = 36
    end
    object QryDistribuidoresUF_COMERCIAL: TStringField
      FieldName = 'UF_COMERCIAL'
      Size = 3
    end
    object QryDistribuidoresREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 51
    end
    object QryDistribuidoresREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 51
    end
    object QryDistribuidoresDT_CONSULTA_SPC: TDateField
      FieldName = 'DT_CONSULTA_SPC'
    end
    object QryDistribuidoresOBS_SPC: TStringField
      FieldName = 'OBS_SPC'
      Size = 41
    end
    object QryDistribuidoresTIPO_ATIVIDADE: TStringField
      FieldName = 'TIPO_ATIVIDADE'
      Size = 7
    end
    object QryDistribuidoresOBS_GERAL: TMemoField
      FieldName = 'OBS_GERAL'
      BlobType = ftMemo
      Size = 1
    end
    object QryDistribuidoresVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 7
    end
    object QryDistribuidoresENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 41
    end
    object QryDistribuidoresBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 21
    end
    object QryDistribuidoresCIDADE_COBRANCA: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Size = 36
    end
    object QryDistribuidoresUF_COBRANCA: TStringField
      FieldName = 'UF_COBRANCA'
      Size = 3
    end
    object QryDistribuidoresCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      Size = 10
    end
    object QryDistribuidoresICM_IPI: TFloatField
      FieldName = 'ICM_IPI'
    end
    object QryDistribuidoresFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object QryDistribuidoresLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object QryDistribuidoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 46
    end
    object QryDistribuidoresHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 51
    end
    object QryDistribuidoresCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object QryDistribuidoresRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 50
    end
    object QryDistribuidoresDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object CdsDistribuidores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 475
    object CdsDistribuidoresCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsDistribuidoresNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 51
    end
    object CdsDistribuidoresAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 10
    end
    object CdsDistribuidoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 41
    end
    object CdsDistribuidoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 21
    end
    object CdsDistribuidoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 36
    end
    object CdsDistribuidoresUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object CdsDistribuidoresCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsDistribuidoresCAIXA_POSTAL: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 6
    end
    object CdsDistribuidoresFONE: TStringField
      FieldName = 'FONE'
      Size = 31
    end
    object CdsDistribuidoresFAX: TStringField
      FieldName = 'FAX'
      Size = 31
    end
    object CdsDistribuidoresCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 31
    end
    object CdsDistribuidoresCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object CdsDistribuidoresIE: TStringField
      FieldName = 'IE'
      Size = 16
    end
    object CdsDistribuidoresPRACA: TStringField
      FieldName = 'PRACA'
      Size = 7
    end
    object CdsDistribuidoresDT_FICHA: TDateField
      FieldName = 'DT_FICHA'
    end
    object CdsDistribuidoresRG: TStringField
      FieldName = 'RG'
      Size = 11
    end
    object CdsDistribuidoresCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object CdsDistribuidoresEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 51
    end
    object CdsDistribuidoresFONE_COMERCIAL: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 31
    end
    object CdsDistribuidoresCEP_COMERCIAL: TStringField
      FieldName = 'CEP_COMERCIAL'
      Size = 10
    end
    object CdsDistribuidoresCIDADE_COMERCIAL: TStringField
      FieldName = 'CIDADE_COMERCIAL'
      Size = 36
    end
    object CdsDistribuidoresUF_COMERCIAL: TStringField
      FieldName = 'UF_COMERCIAL'
      Size = 3
    end
    object CdsDistribuidoresREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 51
    end
    object CdsDistribuidoresREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 51
    end
    object CdsDistribuidoresDT_CONSULTA_SPC: TDateField
      FieldName = 'DT_CONSULTA_SPC'
    end
    object CdsDistribuidoresOBS_SPC: TStringField
      FieldName = 'OBS_SPC'
      Size = 41
    end
    object CdsDistribuidoresTIPO_ATIVIDADE: TStringField
      FieldName = 'TIPO_ATIVIDADE'
      Size = 7
    end
    object CdsDistribuidoresOBS_GERAL: TMemoField
      FieldName = 'OBS_GERAL'
      BlobType = ftMemo
      Size = 1
    end
    object CdsDistribuidoresVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 7
    end
    object CdsDistribuidoresENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 41
    end
    object CdsDistribuidoresBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 21
    end
    object CdsDistribuidoresCIDADE_COBRANCA: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Size = 36
    end
    object CdsDistribuidoresUF_COBRANCA: TStringField
      FieldName = 'UF_COBRANCA'
      Size = 3
    end
    object CdsDistribuidoresCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      Size = 10
    end
    object CdsDistribuidoresICM_IPI: TFloatField
      FieldName = 'ICM_IPI'
    end
    object CdsDistribuidoresFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object CdsDistribuidoresLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object CdsDistribuidoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 46
    end
    object CdsDistribuidoresHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 51
    end
    object CdsDistribuidoresCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsDistribuidoresRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 50
    end
    object CdsDistribuidoresDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object SqlCRM: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM '#13#10' CRM'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 382
    Top = 160
  end
  object DspCRM: TDataSetProvider
    DataSet = SqlCRM
    Left = 382
    Top = 200
  end
  object CdsCRM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCRM'
    Left = 382
    Top = 240
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
  end
  object SqlNumeroTransferLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' (DATA_GERACAO >= CUR' +
      'RENT_DATE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - 3)  AND'#13#10' E' +
      'NVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 136
    Top = 560
  end
  object DspNumeroTransferLoja: TDataSetProvider
    DataSet = SqlNumeroTransferLoja
    Left = 136
    Top = 600
  end
  object CdsNumeroTransferLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroTransferLoja'
    Left = 136
    Top = 640
    object CdsNumeroTransferLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdTransferLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_TRANSFER'#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' (DATA_GERACAO >= ' +
      'CURRENT_DATE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - 3) '#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 40
    Top = 560
  end
  object CdsCdTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 40
    Top = 520
    object CdsCdTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
  end
  object DspCdTransferLoja: TDataSetProvider
    DataSet = SqlCdTransferLoja
    Left = 40
    Top = 600
  end
  object CdsCdTransferLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdTransferLoja'
    Left = 40
    Top = 640
    object CdsCdTransferLojaCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
      Required = True
    end
  end
  object SqlNumeroItensTransferLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' TRANSFER,'#13#10'  ITENS_TRANSFER'#13#10'WHERE'#13#10' T' +
      'RANSFER.CD_TRANSFER = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' (DATA_GER' +
      'ACAO >= CURRENT_DATE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - ' +
      '3)  AND'#13#10' ENVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 654
    Top = 368
  end
  object DspNumeroItensTransferLoja: TDataSetProvider
    DataSet = SqlNumeroItensTransferLoja
    Left = 654
    Top = 408
  end
  object CdsNumeroItensTransferLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroItensTransferLoja'
    Left = 654
    Top = 448
    object CdsNumeroItensTransferLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdItensTransferLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_TRANSFER.CD_TRANSFER,'#13#10' ITENS_TRANSFER.ID_PRODUTO' +
      #13#10'FROM'#13#10' TRANSFER,'#13#10'  ITENS_TRANSFER'#13#10'WHERE'#13#10' TRANSFER.CD_TRANSF' +
      'ER = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' (DATA_GERACAO >= CURRENT_D' +
      'ATE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - 3)'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 782
    Top = 384
  end
  object CdsCdItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 782
    Top = 344
    object FloatField14: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsCdItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
  end
  object DspCdItensTransferLoja: TDataSetProvider
    DataSet = SqlCdItensTransferLoja
    Left = 782
    Top = 424
  end
  object CdsCdItensTransferLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdItensTransferLoja'
    Left = 782
    Top = 464
    object CdsCdItensTransferLojaCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsCdItensTransferLojaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
  end
  object CdsVendedores_Classes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 475
    object CdsVendedores_ClassesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      Required = True
    end
    object CdsVendedores_ClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
    object CdsVendedores_ClassesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object CdsVendedores_ClassesCOMISSAO: TStringField
      FieldName = 'COMISSAO'
      Size = 1
    end
  end
  object SqlVendedores_Classes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' VENDEDORES_CLASSES'#13#10'WHERE'#13#10' CD_VENDEDOR = :VE' +
      'NDEDOR AND'#13#10' CD_CLASSE = :CLASSE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CLASSE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 256
    Top = 339
  end
  object DspVendedores_Classes: TDataSetProvider
    DataSet = SqlVendedores_Classes
    Left = 256
    Top = 384
  end
  object QryVendedoresClasses: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CLASSE'
        ParamType = ptInput
      end>
    ProviderName = 'DspVendedores_Classes'
    Left = 256
    Top = 428
    object QryVendedoresClassesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      Required = True
    end
    object QryVendedoresClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
    object QryVendedoresClassesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object QryVendedoresClassesCOMISSAO: TStringField
      FieldName = 'COMISSAO'
      Size = 1
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
    Left = 216
    Top = 152
  end
  object DspFiliais: TDataSetProvider
    DataSet = SqlFiliais
    Left = 216
    Top = 200
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
    Left = 216
    Top = 240
  end
  object CdsEntregas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEntregas'
    Left = 360
    Top = 10
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
    CommandText = 'SELECT'#13#10' * '#13#10'FROM'#13#10' ENTREGAS'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 360
    Top = 88
  end
  object TbTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' STATUS <> '#39'A'#39' AND'#13#10' ENVIADO' +
      ' = '#39'9'#39' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 560
    Top = 88
  end
  object SqlNumeroContasReceberLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' CONTAS_RECEBER'#13#10'WHERE'#13#10' DT_LANCAMENTO ' +
      '= CURRENT_DATE AND '#13#10' ENVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 248
    Top = 560
  end
  object DspNumeroContasReceberLoja: TDataSetProvider
    DataSet = SqlNumeroContasReceberLoja
    Left = 248
    Top = 600
  end
  object CdsNumeroContasReceberLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroContasReceberLoja'
    Left = 248
    Top = 640
    object CdsNumeroContasReceberLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdContasReceberLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_CONTAS_RECEBER'#13#10'FROM'#13#10' CONTAS_RECEBER'#13#10'WHERE'#13#10' DT_LA' +
      'NCAMENTO = CURRENT_DATE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 352
    Top = 560
  end
  object CdsCdContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 352
    Top = 520
    object CdsCdContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
    end
  end
  object DspCdContasReceberLoja: TDataSetProvider
    DataSet = SqlCdContasReceberLoja
    Left = 352
    Top = 600
  end
  object CdsCdContasReceberLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdContasReceberLoja'
    Left = 352
    Top = 640
    object CdsCdContasReceberLojaCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object CdsConvenios_Classes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 299
    object CdsConvenios_ClassesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
      Required = True
    end
    object CdsConvenios_ClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
    object CdsConvenios_ClassesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object CdsConvenios_ClassesDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
  end
  object SqlConvenios_Classes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' CONVENIOS_CLASSES'#13#10'WHERE'#13#10' CD_CONVENIO = :CON' +
      'VENIO AND'#13#10' CD_CLASSE = :CLASSE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CLASSE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 632
    Top = 163
  end
  object DspConvenios_Classes: TDataSetProvider
    DataSet = SqlConvenios_Classes
    Left = 632
    Top = 208
  end
  object QryConveniosClasses: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CLASSE'
        ParamType = ptInput
      end>
    ProviderName = 'DspConvenios_Classes'
    Left = 632
    Top = 252
    object QryConveniosClassesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
      Required = True
    end
    object QryConveniosClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
    object QryConveniosClassesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object QryConveniosClassesDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 872
    Top = 272
  end
  object CdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 288
  end
  object CdsPrecos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 248
  end
  object CdsDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 292
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
      '.PROCESSO = 125'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 784
    Top = 520
  end
  object DspPrecoVenda: TDataSetProvider
    DataSet = SqlPrecoVenda
    Left = 784
    Top = 568
  end
  object CdsPrecoVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPrecoVenda'
    Left = 784
    Top = 616
  end
  object CdsCePedid1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCePedid1'
    Left = 726
    Top = 154
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
      Size = 2
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
  end
  object CdsCePedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCePedido'
    Left = 782
    Top = 154
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
  end
  object DspCePedid1: TDataSetProvider
    DataSet = TbCePedid1
    Left = 726
    Top = 203
  end
  object DspCePedido: TDataSetProvider
    DataSet = TbCePedido
    Left = 782
    Top = 203
  end
  object TbCePedid1: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' COMPRAS'#13#10'WHERE'#13#10' CD_COMPRAS IN (SELECT CD_COM' +
      'PRAS FROM TEMP_COMPRAS WHERE ENVIADO = '#39'9'#39' AND PROCESSO = '#39'4'#39')'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 726
    Top = 250
  end
  object TbCePedido: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_COMPRA.*'#13#10'FROM'#13#10' ITENS_COMPRA'#13#10'WHERE'#13#10' ID_PRODUTO' +
      ' IN (SELECT ID_PRODUTO FROM TEMP_COMPRAS WHERE PROCESSO = '#39'5'#39' AN' +
      'D ENVIADO = '#39'9'#39') AND'#13#10' CD_COMPRAS IN (SELECT CD_COMPRAS FROM TEM' +
      'P_COMPRAS WHERE PROCESSO = '#39'5'#39' AND ENVIADO = '#39'9'#39')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 782
    Top = 250
  end
  object SqlCompras: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' COMPRAS'#13#10'WHERE'#13#10' CD_COMPRAS = :CD_COMPRAS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 610
    Top = 515
  end
  object SqlItensCompra: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' ITENS_COMPRA'#13#10'WHERE'#13#10' CD_COMPRAS = :CD_COMPRA' +
      'S AND'#13#10' ID_PRODUTO = :ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 682
    Top = 515
  end
  object DspCompras: TDataSetProvider
    DataSet = SqlCompras
    Left = 610
    Top = 550
  end
  object DspItensCompra: TDataSetProvider
    DataSet = SqlItensCompra
    Left = 682
    Top = 550
  end
  object QryCePedid1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end>
    ProviderName = 'DspCompras'
    Left = 610
    Top = 587
    object QryCePedid1CD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object QryCePedid1CD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryCePedid1CD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object QryCePedid1CD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object QryCePedid1CD_OBSERVACAO: TFloatField
      FieldName = 'CD_OBSERVACAO'
    end
    object QryCePedid1CD_TRANSPORTADORA: TFloatField
      FieldName = 'CD_TRANSPORTADORA'
    end
    object QryCePedid1DT_PEDIDO: TDateField
      FieldName = 'DT_PEDIDO'
    end
    object QryCePedid1NOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 6
    end
    object QryCePedid1SERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object QryCePedid1DT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object QryCePedid1BOLETO: TStringField
      FieldName = 'BOLETO'
      Size = 1
    end
    object QryCePedid1DT_BOLETO: TDateField
      FieldName = 'DT_BOLETO'
    end
    object QryCePedid1CD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object QryCePedid1DT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
    end
    object QryCePedid1VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object QryCePedid1VL_ICM: TFloatField
      FieldName = 'VL_ICM'
    end
    object QryCePedid1TOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
    end
    object QryCePedid1ICM_BASE_CALCULO: TFloatField
      FieldName = 'ICM_BASE_CALCULO'
    end
    object QryCePedid1ICM_ISENTO: TFloatField
      FieldName = 'ICM_ISENTO'
    end
    object QryCePedid1ICM_OUTROS: TFloatField
      FieldName = 'ICM_OUTROS'
    end
    object QryCePedid1ICM_BASESUBST: TFloatField
      FieldName = 'ICM_BASESUBST'
    end
    object QryCePedid1ICM_VALORSUBST: TFloatField
      FieldName = 'ICM_VALORSUBST'
    end
    object QryCePedid1VL_TOTALPRODUTOS: TFloatField
      FieldName = 'VL_TOTALPRODUTOS'
    end
    object QryCePedid1VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object QryCePedid1OUTRAS_DESPESAS: TFloatField
      FieldName = 'OUTRAS_DESPESAS'
    end
    object QryCePedid1VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object QryCePedid1IPI_BASE_CALCULO: TFloatField
      FieldName = 'IPI_BASE_CALCULO'
    end
    object QryCePedid1IPI_ISENTO: TFloatField
      FieldName = 'IPI_ISENTO'
    end
    object QryCePedid1IPI_OUTROS: TFloatField
      FieldName = 'IPI_OUTROS'
    end
    object QryCePedid1D_ICMV: TFloatField
      FieldName = 'D_ICMV'
    end
    object QryCePedid1D_IPIV: TFloatField
      FieldName = 'D_IPIV'
    end
    object QryCePedid1D_TOTNT: TFloatField
      FieldName = 'D_TOTNT'
    end
    object QryCePedid1UNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object QryCePedid1NUMERO_ITENS: TFloatField
      FieldName = 'NUMERO_ITENS'
    end
    object QryCePedid1FATURAMENTO: TStringField
      FieldName = 'FATURAMENTO'
      Size = 2
    end
    object QryCePedid1MOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 1
    end
    object QryCePedid1ENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCePedid1STATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCePedid1VL_DESCONTO_NOTA: TFloatField
      FieldName = 'VL_DESCONTO_NOTA'
    end
    object QryCePedid1CD_USUARIO_CRIACAO: TFloatField
      FieldName = 'CD_USUARIO_CRIACAO'
    end
    object QryCePedid1USUARIO_DIGITACAO: TStringField
      FieldName = 'USUARIO_DIGITACAO'
    end
    object QryCePedid1CD_USUARIO_DIGITACAO: TFloatField
      FieldName = 'CD_USUARIO_DIGITACAO'
    end
    object QryCePedid1USUARIO_CRIACAO: TStringField
      FieldName = 'USUARIO_CRIACAO'
    end
    object QryCePedid1CD_USUARIO_CONCLUSAO: TFloatField
      FieldName = 'CD_USUARIO_CONCLUSAO'
    end
    object QryCePedid1USUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
    end
    object QryCePedid1CD_USUARIO_ENVIO: TFloatField
      FieldName = 'CD_USUARIO_ENVIO'
    end
    object QryCePedid1USUARIO_ENVIO: TStringField
      FieldName = 'USUARIO_ENVIO'
    end
    object QryCePedid1VINCULADO: TStringField
      FieldName = 'VINCULADO'
      Size = 1
    end
    object QryCePedid1CD_COMPRAS_VINCULADO: TFloatField
      FieldName = 'CD_COMPRAS_VINCULADO'
    end
    object QryCePedid1TEMVINCULADO: TStringField
      FieldName = 'TEMVINCULADO'
      Size = 1
    end
  end
  object QryCePedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'DspItensCompra'
    Left = 682
    Top = 587
    object QryCePedidoCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object QryCePedidoID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryCePedidoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 6
    end
    object QryCePedidoCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryCePedidoCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object QryCePedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object QryCePedidoSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object QryCePedidoESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object QryCePedidoESTOQUE_MAXIMO: TFloatField
      FieldName = 'ESTOQUE_MAXIMO'
    end
    object QryCePedidoLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 40
    end
    object QryCePedidoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 40
    end
    object QryCePedidoCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 40
    end
    object QryCePedidoCD_SITUACAO_TRIB: TFloatField
      FieldName = 'CD_SITUACAO_TRIB'
    end
    object QryCePedidoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object QryCePedidoVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object QryCePedidoPERCENTUAL_ICMS: TFloatField
      FieldName = 'PERCENTUAL_ICMS'
    end
    object QryCePedidoREDUCAO_ICMS: TFloatField
      FieldName = 'REDUCAO_ICMS'
    end
    object QryCePedidoVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object QryCePedidoPERCENTUAL_DESCONTO: TFloatField
      FieldName = 'PERCENTUAL_DESCONTO'
    end
    object QryCePedidoVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object QryCePedidoPERCENTUAL_IPI: TFloatField
      FieldName = 'PERCENTUAL_IPI'
    end
    object QryCePedidoVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object QryCePedidoVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object QryCePedidoPERCENTUAL_MARGEM: TFloatField
      FieldName = 'PERCENTUAL_MARGEM'
    end
    object QryCePedidoCD_ATENDIMENTO: TStringField
      FieldName = 'CD_ATENDIMENTO'
      Size = 2
    end
    object QryCePedidoNOVO_PRECO: TFloatField
      FieldName = 'NOVO_PRECO'
    end
    object QryCePedidoNOVO_CUSTO: TFloatField
      FieldName = 'NOVO_CUSTO'
    end
    object QryCePedidoATUALIZAR_PRECO: TStringField
      FieldName = 'ATUALIZAR_PRECO'
      Size = 1
    end
    object QryCePedidoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object QryCePedidoENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCePedidoQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object QryCePedidoCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object QryCePedidoULTIMOCUSTO: TFloatField
      FieldName = 'ULTIMOCUSTO'
    end
    object QryCePedidoPRECO_REAJUSTADO: TStringField
      FieldName = 'PRECO_REAJUSTADO'
      Size = 1
    end
    object QryCePedidoMEDIAF: TFloatField
      FieldName = 'MEDIAF'
    end
    object QryCePedidoCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
  end
  object CdsCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 610
    Top = 626
    object CdsComprasCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object CdsComprasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsComprasCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsComprasCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsComprasCD_OBSERVACAO: TFloatField
      FieldName = 'CD_OBSERVACAO'
    end
    object CdsComprasCD_TRANSPORTADORA: TFloatField
      FieldName = 'CD_TRANSPORTADORA'
    end
    object CdsComprasDT_PEDIDO: TDateField
      FieldName = 'DT_PEDIDO'
    end
    object CdsComprasNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 6
    end
    object CdsComprasSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object CdsComprasDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object CdsComprasBOLETO: TStringField
      FieldName = 'BOLETO'
      Size = 1
    end
    object CdsComprasDT_BOLETO: TDateField
      FieldName = 'DT_BOLETO'
    end
    object CdsComprasCD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object CdsComprasDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
    end
    object CdsComprasVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object CdsComprasVL_ICM: TFloatField
      FieldName = 'VL_ICM'
    end
    object CdsComprasTOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
    end
    object CdsComprasICM_BASE_CALCULO: TFloatField
      FieldName = 'ICM_BASE_CALCULO'
    end
    object CdsComprasICM_ISENTO: TFloatField
      FieldName = 'ICM_ISENTO'
    end
    object CdsComprasICM_OUTROS: TFloatField
      FieldName = 'ICM_OUTROS'
    end
    object CdsComprasICM_BASESUBST: TFloatField
      FieldName = 'ICM_BASESUBST'
    end
    object CdsComprasICM_VALORSUBST: TFloatField
      FieldName = 'ICM_VALORSUBST'
    end
    object CdsComprasVL_TOTALPRODUTOS: TFloatField
      FieldName = 'VL_TOTALPRODUTOS'
    end
    object CdsComprasVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object CdsComprasOUTRAS_DESPESAS: TFloatField
      FieldName = 'OUTRAS_DESPESAS'
    end
    object CdsComprasVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object CdsComprasIPI_BASE_CALCULO: TFloatField
      FieldName = 'IPI_BASE_CALCULO'
    end
    object CdsComprasIPI_ISENTO: TFloatField
      FieldName = 'IPI_ISENTO'
    end
    object CdsComprasIPI_OUTROS: TFloatField
      FieldName = 'IPI_OUTROS'
    end
    object CdsComprasD_ICMV: TFloatField
      FieldName = 'D_ICMV'
    end
    object CdsComprasD_IPIV: TFloatField
      FieldName = 'D_IPIV'
    end
    object CdsComprasD_TOTNT: TFloatField
      FieldName = 'D_TOTNT'
    end
    object CdsComprasUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object CdsComprasNUMERO_ITENS: TFloatField
      FieldName = 'NUMERO_ITENS'
    end
    object CdsComprasFATURAMENTO: TStringField
      FieldName = 'FATURAMENTO'
      Size = 2
    end
    object CdsComprasMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 1
    end
    object CdsComprasENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsComprasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsComprasVL_DESCONTO_NOTA: TFloatField
      FieldName = 'VL_DESCONTO_NOTA'
    end
    object CdsComprasCD_USUARIO_CRIACAO: TFloatField
      FieldName = 'CD_USUARIO_CRIACAO'
    end
    object CdsComprasUSUARIO_DIGITACAO: TStringField
      FieldName = 'USUARIO_DIGITACAO'
    end
    object CdsComprasCD_USUARIO_DIGITACAO: TFloatField
      FieldName = 'CD_USUARIO_DIGITACAO'
    end
    object CdsComprasUSUARIO_CRIACAO: TStringField
      FieldName = 'USUARIO_CRIACAO'
    end
    object CdsComprasCD_USUARIO_CONCLUSAO: TFloatField
      FieldName = 'CD_USUARIO_CONCLUSAO'
    end
    object CdsComprasUSUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
    end
    object CdsComprasCD_USUARIO_ENVIO: TFloatField
      FieldName = 'CD_USUARIO_ENVIO'
    end
    object CdsComprasUSUARIO_ENVIO: TStringField
      FieldName = 'USUARIO_ENVIO'
    end
    object CdsComprasVINCULADO: TStringField
      FieldName = 'VINCULADO'
      Size = 1
    end
    object CdsComprasCD_COMPRAS_VINCULADO: TFloatField
      FieldName = 'CD_COMPRAS_VINCULADO'
    end
    object CdsComprasTEMVINCULADO: TStringField
      FieldName = 'TEMVINCULADO'
      Size = 1
    end
  end
  object CdsItensCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 682
    Top = 626
    object CdsItensCompraCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object CdsItensCompraID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsItensCompraCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 6
    end
    object CdsItensCompraCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsItensCompraCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object CdsItensCompraDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsItensCompraSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object CdsItensCompraESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object CdsItensCompraESTOQUE_MAXIMO: TFloatField
      FieldName = 'ESTOQUE_MAXIMO'
    end
    object CdsItensCompraLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 40
    end
    object CdsItensCompraGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 40
    end
    object CdsItensCompraCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 40
    end
    object CdsItensCompraCD_SITUACAO_TRIB: TFloatField
      FieldName = 'CD_SITUACAO_TRIB'
    end
    object CdsItensCompraQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object CdsItensCompraVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object CdsItensCompraPERCENTUAL_ICMS: TFloatField
      FieldName = 'PERCENTUAL_ICMS'
    end
    object CdsItensCompraREDUCAO_ICMS: TFloatField
      FieldName = 'REDUCAO_ICMS'
    end
    object CdsItensCompraVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object CdsItensCompraPERCENTUAL_DESCONTO: TFloatField
      FieldName = 'PERCENTUAL_DESCONTO'
    end
    object CdsItensCompraVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object CdsItensCompraPERCENTUAL_IPI: TFloatField
      FieldName = 'PERCENTUAL_IPI'
    end
    object CdsItensCompraVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object CdsItensCompraVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object CdsItensCompraPERCENTUAL_MARGEM: TFloatField
      FieldName = 'PERCENTUAL_MARGEM'
    end
    object CdsItensCompraCD_ATENDIMENTO: TStringField
      FieldName = 'CD_ATENDIMENTO'
      Size = 2
    end
    object CdsItensCompraNOVO_PRECO: TFloatField
      FieldName = 'NOVO_PRECO'
    end
    object CdsItensCompraNOVO_CUSTO: TFloatField
      FieldName = 'NOVO_CUSTO'
    end
    object CdsItensCompraATUALIZAR_PRECO: TStringField
      FieldName = 'ATUALIZAR_PRECO'
      Size = 1
    end
    object CdsItensCompraFloatField: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object CdsItensCompraENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsItensCompraQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsItensCompraCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object CdsItensCompraULTIMOCUSTO: TFloatField
      FieldName = 'ULTIMOCUSTO'
    end
    object CdsItensCompraPRECO_REAJUSTADO: TStringField
      FieldName = 'PRECO_REAJUSTADO'
      Size = 1
    end
    object CdsItensCompraMEDIAF: TFloatField
      FieldName = 'MEDIAF'
    end
    object CdsItensCompraCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
  end
  object SqlConexao: TSQLDataSet
    CommandText = 'SELECT'#13#10' CGC'#13#10'FROM'#13#10' PARAMETROS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 872
    Top = 336
  end
  object DspConexao: TDataSetProvider
    DataSet = SqlConexao
    Left = 872
    Top = 376
  end
  object CdsConexao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConexao'
    Left = 872
    Top = 416
    object CdsConexaoCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
  end
  object Dsp1: TDataSetProvider
    DataSet = Sql1
    Left = 904
    Top = 512
  end
  object Cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp1'
    Left = 904
    Top = 560
  end
end
