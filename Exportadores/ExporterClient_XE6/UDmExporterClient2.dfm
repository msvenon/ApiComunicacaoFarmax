object DmExporterClient2: TDmExporterClient2
  OldCreateOrder = False
  Height = 639
  Width = 1410
  object SqlProdutosTotais: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 40
    Top = 8
  end
  object DspProdutosTotais: TDataSetProvider
    DataSet = SqlProdutosTotais
    Left = 40
    Top = 56
  end
  object CdsProdutosTotais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosTotais'
    Left = 40
    Top = 104
  end
  object SqlUsuarios: TSQLDataSet
    CommandText = 'SELECT '#13#10' *'#13#10'FROM'#13#10' USUARIOS'#13#10'WHERE'#13#10' CD_USUARIO = :CD_USUARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 144
    Top = 8
  end
  object DspUsuarios: TDataSetProvider
    DataSet = SqlUsuarios
    Left = 144
    Top = 56
  end
  object QryUsuarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'DspUsuarios'
    Left = 144
    Top = 104
    object QryUsuariosCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object QryUsuariosCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object QryUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object QryUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object QryUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object QryUsuariosPODEVENDER: TStringField
      FieldName = 'PODEVENDER'
      Size = 1
    end
    object QryUsuariosCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 1
    end
    object QryUsuariosTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object QryUsuariosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryUsuariosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object CdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'DspUsuarios'
    Left = 144
    Top = 152
    object CdsUsuariosCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object CdsUsuariosCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object CdsUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object CdsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object CdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object CdsUsuariosPODEVENDER: TStringField
      FieldName = 'PODEVENDER'
      Size = 1
    end
    object CdsUsuariosCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 1
    end
    object CdsUsuariosTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object CdsUsuariosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsUsuariosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object SqlPermissoesModulos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' PERMISSOES_MODULOS'#13#10'WHERE'#13#10' CD_PERMISSAO = :C' +
      'D_PERMISSAO AND'#13#10' CD_MODULO = :CD_MODULO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_PERMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_MODULO'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 312
    Top = 8
  end
  object DspPermissoesModulos: TDataSetProvider
    DataSet = SqlPermissoesModulos
    Left = 312
    Top = 56
  end
  object CdsPermissoesModulos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 152
    object CdsPermissoesModulosCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
    end
    object CdsPermissoesModulosCD_MODULO: TFloatField
      FieldName = 'CD_MODULO'
    end
    object CdsPermissoesModulosPERMITIDO: TStringField
      FieldName = 'PERMITIDO'
      Size = 1
    end
    object CdsPermissoesModulosINCLUSAO: TStringField
      FieldName = 'INCLUSAO'
      Size = 1
    end
    object CdsPermissoesModulosALTERACAO: TStringField
      FieldName = 'ALTERACAO'
      Size = 1
    end
    object CdsPermissoesModulosEXCLUSAO: TStringField
      FieldName = 'EXCLUSAO'
      Size = 1
    end
    object CdsPermissoesModulosIMPRESSAO: TStringField
      FieldName = 'IMPRESSAO'
      Size = 1
    end
    object CdsPermissoesModulosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object QryPermissoesModulos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_PERMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_MODULO'
        ParamType = ptInput
      end>
    ProviderName = 'DspPermissoesModulos'
    Left = 312
    Top = 104
    object QryPermissoesModulosCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
    end
    object QryPermissoesModulosCD_MODULO: TFloatField
      FieldName = 'CD_MODULO'
    end
    object QryPermissoesModulosPERMITIDO: TStringField
      FieldName = 'PERMITIDO'
      Size = 1
    end
    object QryPermissoesModulosINCLUSAO: TStringField
      FieldName = 'INCLUSAO'
      Size = 1
    end
    object QryPermissoesModulosALTERACAO: TStringField
      FieldName = 'ALTERACAO'
      Size = 1
    end
    object QryPermissoesModulosEXCLUSAO: TStringField
      FieldName = 'EXCLUSAO'
      Size = 1
    end
    object QryPermissoesModulosIMPRESSAO: TStringField
      FieldName = 'IMPRESSAO'
      Size = 1
    end
    object QryPermissoesModulosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlPermissoes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' PERMISSOES'#13#10'WHERE'#13#10' CD_PERMISSAO = :CD_PERMIS' +
      'SAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_PERMISSAO'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 216
    Top = 8
  end
  object DspPermissoes: TDataSetProvider
    DataSet = SqlPermissoes
    Left = 216
    Top = 56
  end
  object CdsPermissoes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 152
    object CdsPermissoesCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object CdsPermissoesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object QryPermissoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_PERMISSAO'
        ParamType = ptInput
      end>
    ProviderName = 'DspPermissoes'
    Left = 216
    Top = 104
    object QryPermissoesCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object QryPermissoesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object SqlEncartes: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' ENCARTE'#13#10'WHERE'#13#10' ID_ENCARTE = :ID_ENCARTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_ENCARTE'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 649
    Top = 354
  end
  object DspEncartes: TDataSetProvider
    DataSet = SqlEncartes
    Left = 649
    Top = 394
  end
  object QryEncartes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_ENCARTE'
        ParamType = ptInput
      end>
    ProviderName = 'DspEncartes'
    Left = 649
    Top = 434
    object QryEncartesID_ENCARTE: TFloatField
      FieldName = 'ID_ENCARTE'
      Required = True
    end
    object QryEncartesDATA: TDateField
      FieldName = 'DATA'
    end
    object QryEncartesHORA: TTimeField
      FieldName = 'HORA'
    end
    object QryEncartesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryEncartesDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object QryEncartesDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object QryEncartesDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object QryEncartesUSUARIO_CRIACAO: TStringField
      FieldName = 'USUARIO_CRIACAO'
      Size = 30
    end
    object QryEncartesUSUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
      Size = 30
    end
    object QryEncartesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryEncartesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsEncartes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 649
    Top = 474
    object CdsEncartesID_ENCARTE: TFloatField
      FieldName = 'ID_ENCARTE'
      Required = True
    end
    object CdsEncartesDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsEncartesHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsEncartesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CdsEncartesDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object CdsEncartesDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object CdsEncartesDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object CdsEncartesUSUARIO_CRIACAO: TStringField
      FieldName = 'USUARIO_CRIACAO'
      Size = 30
    end
    object CdsEncartesUSUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
      Size = 30
    end
    object CdsEncartesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsEncartesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlItensEncartes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' ENCARTE_ITENS'#13#10'WHERE'#13#10' ID_ENCARTE = :ID_ENCAR' +
      'TE AND'#13#10' ID_PRODUTO = :ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_ENCARTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 737
    Top = 354
  end
  object DspItensEncartes: TDataSetProvider
    DataSet = SqlItensEncartes
    Left = 737
    Top = 394
  end
  object QryItensEncartes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_ENCARTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'DspItensEncartes'
    Left = 737
    Top = 434
    object QryItensEncartesID_ENCARTE: TFloatField
      FieldName = 'ID_ENCARTE'
      Required = True
    end
    object QryItensEncartesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryItensEncartesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryItensEncartesPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
  end
  object CdsItensEncartes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 474
    object CdsItensEncartesID_ENCARTE: TFloatField
      FieldName = 'ID_ENCARTE'
      Required = True
    end
    object CdsItensEncartesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsItensEncartesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsItensEncartesPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
  end
  object SqlRedes: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' REDES'#13#10'WHERE'#13#10' ID_REDE = :ID_REDE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_REDE'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 400
    Top = 8
  end
  object DspRedes: TDataSetProvider
    DataSet = SqlRedes
    Left = 400
    Top = 56
  end
  object QryRedes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_REDE'
        ParamType = ptInput
      end>
    ProviderName = 'DspRedes'
    Left = 400
    Top = 104
    object QryRedesID_REDE: TFloatField
      FieldName = 'ID_REDE'
      Required = True
    end
    object QryRedesNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryRedesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryRedesOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 1000
    end
    object QryRedesIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 8
    end
    object QryRedesSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 1
    end
    object QryRedesDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object QryRedesDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object QryRedesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsRedes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 152
    object CdsRedesID_REDE: TFloatField
      FieldName = 'ID_REDE'
      Required = True
    end
    object CdsRedesNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CdsRedesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsRedesOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 1000
    end
    object CdsRedesIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 8
    end
    object CdsRedesSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 1
    end
    object CdsRedesDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object CdsRedesDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsRedesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlConcorrentes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' CONCORRENTES'#13#10'WHERE'#13#10' ID_CONCORRENTE = :ID_CO' +
      'NCORRENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_CONCORRENTE'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 480
    Top = 8
  end
  object DspConcorrentes: TDataSetProvider
    DataSet = SqlConcorrentes
    Left = 480
    Top = 56
  end
  object QryConcorrentes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_CONCORRENTE'
        ParamType = ptInput
      end>
    ProviderName = 'DspConcorrentes'
    Left = 480
    Top = 104
    object QryConcorrentesID_CONCORRENTE: TFloatField
      FieldName = 'ID_CONCORRENTE'
      Required = True
    end
    object QryConcorrentesID_REDE: TFloatField
      FieldName = 'ID_REDE'
      Required = True
    end
    object QryConcorrentesID_FILIAL: TFloatField
      FieldName = 'ID_FILIAL'
      Required = True
    end
    object QryConcorrentesNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryConcorrentesDISTANCIA: TFloatField
      FieldName = 'DISTANCIA'
    end
    object QryConcorrentesOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 1000
    end
    object QryConcorrentesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryConcorrentesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsConcorrentes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 152
    object CdsConcorrentesID_CONCORRENTE: TFloatField
      FieldName = 'ID_CONCORRENTE'
      Required = True
    end
    object CdsConcorrentesID_REDE: TFloatField
      FieldName = 'ID_REDE'
      Required = True
    end
    object CdsConcorrentesID_FILIAL: TFloatField
      FieldName = 'ID_FILIAL'
      Required = True
    end
    object CdsConcorrentesNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CdsConcorrentesDISTANCIA: TFloatField
      FieldName = 'DISTANCIA'
    end
    object CdsConcorrentesOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 1000
    end
    object CdsConcorrentesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsConcorrentesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlPrecosConcorrentes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' PROD_CONCORRENTES'#13#10'WHERE'#13#10' ID_CONCORRENTE = :' +
      'ID_CONCORRENTE AND'#13#10' ID_PRODUTO = :ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_CONCORRENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 584
    Top = 8
  end
  object DspPrecosConcorrentes: TDataSetProvider
    DataSet = SqlPrecosConcorrentes
    Left = 584
    Top = 56
  end
  object QryPrecosConcorrentes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_CONCORRENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrecosConcorrentes'
    Left = 584
    Top = 104
    object QryPrecosConcorrentesID_FILIAL: TFloatField
      FieldName = 'ID_FILIAL'
      Required = True
    end
    object QryPrecosConcorrentesID_CONCORRENTE: TFloatField
      FieldName = 'ID_CONCORRENTE'
      Required = True
    end
    object QryPrecosConcorrentesCONCORRENTE: TStringField
      FieldName = 'CONCORRENTE'
      Size = 100
    end
    object QryPrecosConcorrentesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryPrecosConcorrentesPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 100
    end
    object QryPrecosConcorrentesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object QryPrecosConcorrentesCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 100
    end
    object QryPrecosConcorrentesCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryPrecosConcorrentesGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object QryPrecosConcorrentesCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryPrecosConcorrentesLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 100
    end
    object QryPrecosConcorrentesPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 19
      Size = 2
    end
    object QryPrecosConcorrentesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsPrecosConcorrentes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 152
    object CdsPrecosConcorrentesID_FILIAL: TFloatField
      FieldName = 'ID_FILIAL'
      Required = True
    end
    object CdsPrecosConcorrentesID_CONCORRENTE: TFloatField
      FieldName = 'ID_CONCORRENTE'
      Required = True
    end
    object CdsPrecosConcorrentesCONCORRENTE: TStringField
      FieldName = 'CONCORRENTE'
      Size = 100
    end
    object CdsPrecosConcorrentesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsPrecosConcorrentesPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 100
    end
    object CdsPrecosConcorrentesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsPrecosConcorrentesCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 100
    end
    object CdsPrecosConcorrentesCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsPrecosConcorrentesGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object CdsPrecosConcorrentesCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsPrecosConcorrentesLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 100
    end
    object CdsPrecosConcorrentesPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 19
      Size = 2
    end
    object CdsPrecosConcorrentesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsPrecosConcorrentesDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 496
    object CdsPrecosConcorrentesDeletadosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsPrecosConcorrentesDeletadosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsPrecosConcorrentesDeletadosID_CONCORRENTE: TFloatField
      FieldName = 'ID_CONCORRENTE'
    end
    object CdsPrecosConcorrentesDeletadosPROCESSO: TFloatField
      FieldName = 'PROCESSO'
      Required = True
    end
    object CdsPrecosConcorrentesDeletadosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlContasPagarDeletadas: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CAMPO1'#13#10'FROM'#13#10' DELETADOS'#13#10'WHERE'#13#10' TABELA = '#39'CONTAS_PAG' +
      'AR'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 804
    Top = 356
  end
  object DspContasPagarDeletadas: TDataSetProvider
    DataSet = SqlContasPagarDeletadas
    Left = 804
    Top = 399
  end
  object CdsContasPagarDeletadas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasPagarDeletadas'
    Left = 804
    Top = 438
    object CdsContasPagarDeletadasCAMPO1: TStringField
      FieldName = 'CAMPO1'
    end
  end
  object CdsContasReceberDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 496
    object CdsContasReceberDeletadosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsContasReceberDeletadosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object SqlCRDeletados: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ID_PRODUTO,'#13#10' CD_FILIAL'#13#10'FROM'#13#10' TEMP_PRODUTOS2'#13#10'WHERE'#13#10 +
      ' PROCESSO = 64'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 696
    Top = 8
  end
  object DspCRDeletados: TDataSetProvider
    DataSet = SqlCRDeletados
    Left = 696
    Top = 56
  end
  object CdsCRDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCRDeletados'
    Left = 696
    Top = 104
    object CdsCRDeletadosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsCRDeletadosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object CdsLimiteSaldoClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 808
    Top = 136
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
    object CdsLimiteSaldoClientesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object SqlLimiteSaldoClientes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_CLIENTE,'#13#10' LIMITE_CREDITO,'#13#10' LIMITE_PERCENTUAL,'#13#10' SA' +
      'LDO,'#13#10' STATUS'#13#10'FROM'#13#10' CLIENTES'#13#10'WHERE'#13#10' CD_CLIENTE = :CD_CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 808
    Top = 8
    object SqlLimiteSaldoClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlLimiteSaldoClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlLimiteSaldoClientesLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
      ProviderFlags = [pfInUpdate]
    end
    object SqlLimiteSaldoClientesSALDO: TFloatField
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlLimiteSaldoClientesSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object DspLimiteSaldoClientes: TDataSetProvider
    DataSet = SqlLimiteSaldoClientes
    UpdateMode = upWhereKeyOnly
    Left = 808
    Top = 48
  end
  object QryLimiteSaldoClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'DspLimiteSaldoClientes'
    Left = 808
    Top = 88
    object QryLimiteSaldoClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object QryLimiteSaldoClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object QryLimiteSaldoClientesLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
    end
    object QryLimiteSaldoClientesSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object QryLimiteSaldoClientesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object SqlClasses: TSQLDataSet
    CommandText = 'SELECT CD_CLASSE FROM CLASSES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 40
    Top = 208
  end
  object DspClasses: TDataSetProvider
    DataSet = SqlClasses
    Left = 40
    Top = 248
  end
  object CdsClasses: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClasses'
    Left = 40
    Top = 296
    object CdsClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
  end
  object SqlGrupos: TSQLDataSet
    CommandText = 'SELECT CD_GRUPO FROM GRUPOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 136
    Top = 208
  end
  object DspGrupos: TDataSetProvider
    DataSet = SqlGrupos
    Left = 136
    Top = 248
  end
  object CdsGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupos'
    Left = 136
    Top = 296
    object CdsGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
  end
  object SqlLaboratorios: TSQLDataSet
    CommandText = 'SELECT CD_LABORATORIO FROM LABORATORIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 232
    Top = 208
  end
  object DspLaboratorios: TDataSetProvider
    DataSet = SqlLaboratorios
    Left = 232
    Top = 248
  end
  object CdsLaboratorios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLaboratorios'
    Left = 232
    Top = 296
    object CdsLaboratoriosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
      Required = True
    end
  end
  object SqlGruposCompras: TSQLDataSet
    CommandText = 'SELECT CD_GRUPOCOMPRA FROM GRUPOSCOMPRAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 416
    Top = 208
  end
  object DspGruposCompras: TDataSetProvider
    DataSet = SqlGruposCompras
    Left = 416
    Top = 248
  end
  object CdsGruposCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGruposCompras'
    Left = 416
    Top = 296
    object CdsGruposComprasCD_GRUPOCOMPRA: TFloatField
      FieldName = 'CD_GRUPOCOMPRA'
      Required = True
    end
  end
  object SqlGruposBalanco: TSQLDataSet
    CommandText = 'SELECT CD_GRUPOBALANCO FROM GRUPOSBALANCO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 520
    Top = 208
  end
  object DspGruposBalanco: TDataSetProvider
    DataSet = SqlGruposBalanco
    Left = 520
    Top = 248
  end
  object CdsGruposBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGruposBalanco'
    Left = 520
    Top = 296
    object CdsGruposBalancoCD_GRUPOBALANCO: TFloatField
      FieldName = 'CD_GRUPOBALANCO'
      Required = True
    end
  end
  object SqlDistribuidores: TSQLDataSet
    CommandText = 'SELECT CD_DISTRIBUIDOR FROM DISTRIBUIDORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 616
    Top = 208
  end
  object DspDistribuidores: TDataSetProvider
    DataSet = SqlDistribuidores
    Left = 616
    Top = 248
  end
  object CdsDistribuidores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDistribuidores'
    Left = 616
    Top = 296
    object CdsDistribuidoresCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
  end
  object SqlFamilias: TSQLDataSet
    CommandText = 'SELECT ID_FAMILIA FROM FAMILIAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 320
    Top = 208
  end
  object DspFamilias: TDataSetProvider
    DataSet = SqlFamilias
    Left = 320
    Top = 248
  end
  object CdsFamilias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFamilias'
    Left = 320
    Top = 296
    object CdsFamiliasID_FAMILIA: TFloatField
      FieldName = 'ID_FAMILIA'
      Required = True
    end
  end
  object SqlCartoes: TSQLDataSet
    CommandText = 'SELECT CD_CARTAO FROM CARTOES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 13
    Top = 354
  end
  object DspCartoes: TDataSetProvider
    DataSet = SqlCartoes
    Left = 13
    Top = 394
  end
  object CdsCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCartoes'
    Left = 13
    Top = 442
    object CdsCartoesCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
      Required = True
    end
  end
  object SqlPlanoContas: TSQLDataSet
    CommandText = 'SELECT CD_PLANO_CONTAS FROM PLANO_CONTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 109
    Top = 354
  end
  object DspPlanoConras: TDataSetProvider
    DataSet = SqlPlanoContas
    Left = 109
    Top = 394
  end
  object CdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPlanoConras'
    Left = 109
    Top = 442
    object CdsPlanoContasCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
      Required = True
    end
  end
  object SqlVendedores: TSQLDataSet
    CommandText = 'SELECT CD_VENDEDOR FROM VENDEDORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 205
    Top = 354
  end
  object DspVendedores: TDataSetProvider
    DataSet = SqlVendedores
    Left = 205
    Top = 394
  end
  object CdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendedores'
    Left = 205
    Top = 442
    object CdsVendedoresCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      Required = True
    end
  end
  object SqlConvenios: TSQLDataSet
    CommandText = 'SELECT CD_CONVENIO FROM CONVENIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 293
    Top = 354
  end
  object DspConvenios: TDataSetProvider
    DataSet = SqlConvenios
    Left = 293
    Top = 394
  end
  object CdsConvenios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConvenios'
    Left = 293
    Top = 442
    object CdsConveniosCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
      Required = True
    end
  end
  object SqlClientes: TSQLDataSet
    CommandText = 
      'SELECT CD_CLIENTE FROM CLIENTES'#13#10'WHERE CD_CLIENTE IN'#13#10'(SELECT DI' +
      'STINCT CD_CLIENTE FROM CONTAS_RECEBER WHERE '#13#10'CD_FORMA_PAGAMENTO' +
      ' > 2 AND STATUS = '#39'A'#39')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 389
    Top = 354
  end
  object DspClientes: TDataSetProvider
    DataSet = SqlClientes
    Left = 389
    Top = 394
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClientes'
    Left = 389
    Top = 442
    object CdsClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
  end
  object CdsVirtualClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 490
    object CdsVirtualClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
  end
  object SqlContasReceber: TSQLDataSet
    CommandText = 
      'SELECT CD_CONTAS_RECEBER FROM CONTAS_RECEBER'#13#10'WHERE CD_CONTAS_RE' +
      'CEBER = :CD_CONTAS_RECEBER'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 493
    Top = 354
  end
  object DspContasReceber: TDataSetProvider
    DataSet = SqlContasReceber
    Left = 493
    Top = 394
  end
  object CdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    ProviderName = 'DspContasReceber'
    Left = 493
    Top = 442
    object CdsContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object CdsVirtualContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 490
    object CdsVirtualContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object SqlContasReceberTodas: TSQLDataSet
    CommandText = 'SELECT CD_CONTAS_RECEBER FROM CONTAS_RECEBER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 568
    Top = 354
  end
  object DspContasReceberTodas: TDataSetProvider
    DataSet = SqlContasReceberTodas
    Left = 568
    Top = 394
  end
  object CdsContasReceberTodas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasReceberTodas'
    Left = 568
    Top = 442
    object CdsContasReceberTodasCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object TbCeParame: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_FILIAL,'#13#10' PRECIFICACAO_UNICA,'#13#10' TIPO_LOJA'#13#10'FROM'#13#10' PA' +
      'RAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 715
    Top = 205
  end
  object DspParametros: TDataSetProvider
    DataSet = TbCeParame
    Left = 715
    Top = 248
  end
  object CdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 715
    Top = 292
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
  object SqlConexao: TSQLDataSet
    CommandText = 'SELECT'#13#10' CGC '#13#10'FROM'#13#10' PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 808
    Top = 205
  end
  object DspConexao: TDataSetProvider
    DataSet = SqlConexao
    Left = 808
    Top = 248
  end
  object CdsConexao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConexao'
    Left = 808
    Top = 293
    object CdsConexaoCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
  end
  object Sql: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 64
    Top = 552
  end
  object CdsVirtualCD: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 544
    object CdsVirtualCDCD: TFloatField
      FieldName = 'CD'
    end
  end
  object SqlSintegraNFEntradaDeletados: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CAMPO1, CAMPO2'#13#10'FROM'#13#10' DELETADOS'#13#10'WHERE'#13#10' TABELA = '#39'SI' +
      'NTEGRA_FN_ENTRADA'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 928
    Top = 205
  end
  object DspSintegraNFEntradaDeletados: TDataSetProvider
    DataSet = SqlSintegraNFEntradaDeletados
    Left = 928
    Top = 240
  end
  object CdsSintegraNFEntradaDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSintegraNFEntradaDeletados'
    Left = 928
    Top = 287
    object CdsSintegraNFEntradaDeletadosCAMPO1: TStringField
      FieldName = 'CAMPO1'
    end
    object CdsSintegraNFEntradaDeletadosCAMPO2: TStringField
      FieldName = 'CAMPO2'
    end
  end
  object SqlPerfilCliente: TSQLDataSet
    CommandText = 'SELECT * FROM PERFIL_CLIENTE'#13#10'WHERE ID_PERFIL_CLIENTE = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 928
    Top = 8
  end
  object DspPerfilCliente: TDataSetProvider
    DataSet = SqlPerfilCliente
    Left = 928
    Top = 48
  end
  object QryPerfilCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'DspPerfilCliente'
    Left = 928
    Top = 88
    object QryPerfilClienteID_PERFIL_CLIENTE: TFloatField
      FieldName = 'ID_PERFIL_CLIENTE'
      Required = True
    end
    object QryPerfilClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object QryPerfilClienteENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsPerfilCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 928
    Top = 128
    object CdsPerfilClienteID_PERFIL_CLIENTE: TFloatField
      FieldName = 'ID_PERFIL_CLIENTE'
      Required = True
    end
    object CdsPerfilClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsPerfilClienteENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlPrincipioAtivo: TSQLDataSet
    CommandText = 'SELECT * FROM PRINCIPIO_ATIVO'#13#10'WHERE CD_PRINCIPIO = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 1024
    Top = 8
  end
  object DspPrincipioAtivo: TDataSetProvider
    DataSet = SqlPrincipioAtivo
    Left = 1024
    Top = 48
  end
  object QryPrincipioAtivo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrincipioAtivo'
    Left = 1024
    Top = 88
    object QryPrincipioAtivoCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
      Required = True
    end
    object QryPrincipioAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
  end
  object CdsPrincipioAtivo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1024
    Top = 128
    object CdsPrincipioAtivoCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
      Required = True
    end
    object CdsPrincipioAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
  end
  object SqlUsuariosConsistencia: TSQLDataSet
    CommandText = 'SELECT CD_USUARIO FROM USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 893
    Top = 354
  end
  object DspUsuariosConsistencia: TDataSetProvider
    DataSet = SqlUsuariosConsistencia
    Left = 893
    Top = 394
  end
  object CdsUsuariosConsistencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUsuariosConsistencia'
    Left = 893
    Top = 442
    object CdsUsuariosConsistenciaCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
  end
  object SqlProdDistr: TSQLDataSet
    CommandText = 
      'SELECT * FROM PROD_DISTR'#13#10'WHERE ID_PRODUTO = :ID_PRODUTO AND'#13#10'CD' +
      '_DISTRIBUIDOR = :CD_DISTRIBUIDOR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 1016
    Top = 352
  end
  object DspProdDistr: TDataSetProvider
    DataSet = SqlProdDistr
    Left = 1016
    Top = 392
  end
  object QryProdDistr: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdDistr'
    Left = 1016
    Top = 440
    object QryProdDistrID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryProdDistrCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object QryProdDistrCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object QryProdDistrCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object QryProdDistrCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object QryProdDistrQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object QryProdDistrENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsProdDistr: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1016
    Top = 488
    object CdsProdDistrID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdDistrCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsProdDistrCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsProdDistrCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object CdsProdDistrCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object CdsProdDistrQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsProdDistrENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlProdutosFisco: TSQLDataSet
    CommandText = 'SELECT * FROM PRODUTOS_FISCO'#13#10'WHERE ID_PRODUTO = :ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 1112
    Top = 352
  end
  object DspProdutosFisco: TDataSetProvider
    DataSet = SqlProdutosFisco
    Left = 1112
    Top = 392
  end
  object QryProdutosFisco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosFisco'
    Left = 1112
    Top = 440
    object QryProdutosFiscoID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryProdutosFiscoCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Required = True
      Size = 14
    end
    object QryProdutosFiscoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryProdutosFiscoCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object QryProdutosFiscoCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object QryProdutosFiscoCD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object QryProdutosFiscoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object QryProdutosFiscoSITUACAO_TRIBUTARIA: TStringField
      FieldName = 'SITUACAO_TRIBUTARIA'
      Size = 1
    end
    object QryProdutosFiscoCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QryProdutosFiscoCST_PIS_COFINS_ENTRADA: TStringField
      FieldName = 'CST_PIS_COFINS_ENTRADA'
      Size = 3
    end
    object QryProdutosFiscoCST_PIS_COFINS_SAIDA: TStringField
      FieldName = 'CST_PIS_COFINS_SAIDA'
      Size = 3
    end
    object QryProdutosFiscoALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoNATUREZA_RECEITA_PISCOFINS: TStringField
      FieldName = 'NATUREZA_RECEITA_PISCOFINS'
      Size = 3
    end
    object QryProdutosFiscoNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object QryProdutosFiscoCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object QryProdutosFiscoDATA_ATAUALIZACAO: TDateField
      FieldName = 'DATA_ATAUALIZACAO'
    end
    object QryProdutosFiscoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryProdutosFiscoID_SEGMENTO: TFloatField
      FieldName = 'ID_SEGMENTO'
    end
    object QryProdutosFiscoSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      Size = 100
    end
    object QryProdutosFiscoICMSSAIDA: TFMTBCDField
      FieldName = 'ICMSSAIDA'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoICMSLEISAIDA: TStringField
      FieldName = 'ICMSLEISAIDA'
      Size = 1000
    end
    object QryProdutosFiscoICMSLEISAIDALINK: TStringField
      FieldName = 'ICMSLEISAIDALINK'
      Size = 1000
    end
    object QryProdutosFiscoIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoICMSPERCENTUALREDUCAO: TFMTBCDField
      FieldName = 'ICMSPERCENTUALREDUCAO'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoALIQUOTACHEIA: TFMTBCDField
      FieldName = 'ALIQUOTACHEIA'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoSUBITEMST: TFMTBCDField
      FieldName = 'SUBITEMST'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoMVAINTERNO: TFMTBCDField
      FieldName = 'MVAINTERNO'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoMVAEXTERNO: TFMTBCDField
      FieldName = 'MVAEXTERNO'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoMVAIMPORTADO: TFMTBCDField
      FieldName = 'MVAIMPORTADO'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoBASEREDUZIDA: TFMTBCDField
      FieldName = 'BASEREDUZIDA'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoICMSLEIINTERNO: TStringField
      FieldName = 'ICMSLEIINTERNO'
      Size = 1000
    end
    object QryProdutosFiscoICMSLEIINTERNOLINK: TStringField
      FieldName = 'ICMSLEIINTERNOLINK'
      Size = 1000
    end
    object QryProdutosFiscoSITUACAO_TRIBUTARIA_PIS_COFINS: TStringField
      FieldName = 'SITUACAO_TRIBUTARIA_PIS_COFINS'
      Size = 1
    end
    object QryProdutosFiscoPISCOFINSLEI: TStringField
      FieldName = 'PISCOFINSLEI'
      Size = 1000
    end
    object QryProdutosFiscoPISCOFINSLEILINK: TStringField
      FieldName = 'PISCOFINSLEILINK'
      Size = 1000
    end
    object QryProdutosFiscoPISCOFINS_NATUREZA_RECEITA: TStringField
      FieldName = 'PISCOFINS_NATUREZA_RECEITA'
      Size = 3
    end
    object QryProdutosFiscoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object QryProdutosFiscoCADASTROSOLICITADO: TStringField
      FieldName = 'CADASTROSOLICITADO'
      Size = 1
    end
    object QryProdutosFiscoFCP: TFMTBCDField
      FieldName = 'FCP'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoCST_IPI_SAIDA: TStringField
      FieldName = 'CST_IPI_SAIDA'
      Size = 3
    end
    object QryProdutosFiscoALIQ_IPI_SAIDA: TStringField
      FieldName = 'ALIQ_IPI_SAIDA'
      Size = 3
    end
    object QryProdutosFiscoREDUCAO_BASE_SAIDA: TFMTBCDField
      FieldName = 'REDUCAO_BASE_SAIDA'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoDESC_CST_SAIDA: TStringField
      FieldName = 'DESC_CST_SAIDA'
      Size = 1000
    end
    object QryProdutosFiscoREDUCAO_BASE_ENTRADA: TFMTBCDField
      FieldName = 'REDUCAO_BASE_ENTRADA'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoCFOP_ENTRADA: TFloatField
      FieldName = 'CFOP_ENTRADA'
    end
    object QryProdutosFiscoALIQ_ICMS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQ_ICMS_ENTRADA'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoCST_IPI_ENTRADA: TStringField
      FieldName = 'CST_IPI_ENTRADA'
      Size = 3
    end
    object QryProdutosFiscoALIQ_IPI_ENTRADA: TFMTBCDField
      FieldName = 'ALIQ_IPI_ENTRADA'
      Precision = 19
      Size = 2
    end
    object QryProdutosFiscoUF_DESTINO: TStringField
      FieldName = 'UF_DESTINO'
      Size = 2
    end
    object QryProdutosFiscoICMS_ATAC_AC: TStringField
      FieldName = 'ICMS_ATAC_AC'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_AC: TStringField
      FieldName = 'ICMS_INDU_AC'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_AL: TStringField
      FieldName = 'ICMS_ATAC_AL'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_AL: TStringField
      FieldName = 'ICMS_INDU_AL'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_AM: TStringField
      FieldName = 'ICMS_ATAC_AM'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_AM: TStringField
      FieldName = 'ICMS_INDU_AM'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_AP: TStringField
      FieldName = 'ICMS_ATAC_AP'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_AP: TStringField
      FieldName = 'ICMS_INDU_AP'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_BA: TStringField
      FieldName = 'ICMS_ATAC_BA'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_BA: TStringField
      FieldName = 'ICMS_INDU_BA'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_CE: TStringField
      FieldName = 'ICMS_ATAC_CE'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_CE: TStringField
      FieldName = 'ICMS_INDU_CE'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_DF: TStringField
      FieldName = 'ICMS_ATAC_DF'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_DF: TStringField
      FieldName = 'ICMS_INDU_DF'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_ES: TStringField
      FieldName = 'ICMS_ATAC_ES'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_ES: TStringField
      FieldName = 'ICMS_INDU_ES'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_GO: TStringField
      FieldName = 'ICMS_ATAC_GO'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_GO: TStringField
      FieldName = 'ICMS_INDU_GO'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_MA: TStringField
      FieldName = 'ICMS_ATAC_MA'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_MA: TStringField
      FieldName = 'ICMS_INDU_MA'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_MG: TStringField
      FieldName = 'ICMS_ATAC_MG'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_MG: TStringField
      FieldName = 'ICMS_INDU_MG'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_MS: TStringField
      FieldName = 'ICMS_ATAC_MS'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_MS: TStringField
      FieldName = 'ICMS_INDU_MS'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_MT: TStringField
      FieldName = 'ICMS_ATAC_MT'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_MT: TStringField
      FieldName = 'ICMS_INDU_MT'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_PA: TStringField
      FieldName = 'ICMS_ATAC_PA'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_PA: TStringField
      FieldName = 'ICMS_INDU_PA'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_PB: TStringField
      FieldName = 'ICMS_ATAC_PB'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_PB: TStringField
      FieldName = 'ICMS_INDU_PB'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_PE: TStringField
      FieldName = 'ICMS_ATAC_PE'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_PE: TStringField
      FieldName = 'ICMS_INDU_PE'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_PI: TStringField
      FieldName = 'ICMS_ATAC_PI'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_PI: TStringField
      FieldName = 'ICMS_INDU_PI'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_PR: TStringField
      FieldName = 'ICMS_ATAC_PR'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_PR: TStringField
      FieldName = 'ICMS_INDU_PR'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_RJ: TStringField
      FieldName = 'ICMS_ATAC_RJ'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_RJ: TStringField
      FieldName = 'ICMS_INDU_RJ'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_RN: TStringField
      FieldName = 'ICMS_ATAC_RN'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_RN: TStringField
      FieldName = 'ICMS_INDU_RN'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_RO: TStringField
      FieldName = 'ICMS_ATAC_RO'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_RO: TStringField
      FieldName = 'ICMS_INDU_RO'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_RR: TStringField
      FieldName = 'ICMS_ATAC_RR'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_RR: TStringField
      FieldName = 'ICMS_INDU_RR'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_RS: TStringField
      FieldName = 'ICMS_ATAC_RS'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_RS: TStringField
      FieldName = 'ICMS_INDU_RS'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_SC: TStringField
      FieldName = 'ICMS_ATAC_SC'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_SC: TStringField
      FieldName = 'ICMS_INDU_SC'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_SE: TStringField
      FieldName = 'ICMS_ATAC_SE'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_SE: TStringField
      FieldName = 'ICMS_INDU_SE'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_SP: TStringField
      FieldName = 'ICMS_ATAC_SP'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_SP: TStringField
      FieldName = 'ICMS_INDU_SP'
      Size = 3
    end
    object QryProdutosFiscoICMS_ATAC_TO: TStringField
      FieldName = 'ICMS_ATAC_TO'
      Size = 3
    end
    object QryProdutosFiscoICMS_INDU_TO: TStringField
      FieldName = 'ICMS_INDU_TO'
      Size = 3
    end
    object QryProdutosFiscoPIS_SITUACAO: TStringField
      FieldName = 'PIS_SITUACAO'
      Size = 1000
    end
    object QryProdutosFiscoCOFINS_SITUACAO: TStringField
      FieldName = 'COFINS_SITUACAO'
      Size = 1000
    end
    object QryProdutosFiscoDT_ATUALIZACAO_FARMAX: TDateField
      FieldName = 'DT_ATUALIZACAO_FARMAX'
    end
    object QryProdutosFiscoCODIGOANP: TStringField
      FieldName = 'CODIGOANP'
      Size = 10
    end
    object QryProdutosFiscoSUBLIMITEICMS: TFMTBCDField
      FieldName = 'SUBLIMITEICMS'
      Precision = 18
      Size = 2
    end
    object QryProdutosFiscoSUBLIMITEFCP: TFMTBCDField
      FieldName = 'SUBLIMITEFCP'
      Precision = 18
      Size = 2
    end
    object QryProdutosFiscoSUBLIMITECST: TStringField
      FieldName = 'SUBLIMITECST'
      Size = 10
    end
    object QryProdutosFiscoCODBENEFICIO: TStringField
      FieldName = 'CODBENEFICIO'
      Size = 10
    end
    object QryProdutosFiscoDESONERACAOMOTIVO: TStringField
      FieldName = 'DESONERACAOMOTIVO'
      Size = 1000
    end
    object QryProdutosFiscoDESONERACAOICMS: TFMTBCDField
      FieldName = 'DESONERACAOICMS'
      Precision = 18
      Size = 2
    end
    object QryProdutosFiscoDESONERACAOFCP: TFMTBCDField
      FieldName = 'DESONERACAOFCP'
      Precision = 18
      Size = 2
    end
  end
  object CdsProdutosFisco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1112
    Top = 488
    object CdsProdutosFiscoID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosFiscoCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Required = True
      Size = 14
    end
    object CdsProdutosFiscoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsProdutosFiscoCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsProdutosFiscoCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object CdsProdutosFiscoCD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object CdsProdutosFiscoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsProdutosFiscoSITUACAO_TRIBUTARIA: TStringField
      FieldName = 'SITUACAO_TRIBUTARIA'
      Size = 1
    end
    object CdsProdutosFiscoCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object CdsProdutosFiscoCST_PIS_COFINS_ENTRADA: TStringField
      FieldName = 'CST_PIS_COFINS_ENTRADA'
      Size = 3
    end
    object CdsProdutosFiscoCST_PIS_COFINS_SAIDA: TStringField
      FieldName = 'CST_PIS_COFINS_SAIDA'
      Size = 3
    end
    object CdsProdutosFiscoALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoNATUREZA_RECEITA_PISCOFINS: TStringField
      FieldName = 'NATUREZA_RECEITA_PISCOFINS'
      Size = 3
    end
    object CdsProdutosFiscoNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object CdsProdutosFiscoCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object CdsProdutosFiscoDATA_ATAUALIZACAO: TDateField
      FieldName = 'DATA_ATAUALIZACAO'
    end
    object CdsProdutosFiscoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsProdutosFiscoID_SEGMENTO: TFloatField
      FieldName = 'ID_SEGMENTO'
    end
    object CdsProdutosFiscoSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      Size = 100
    end
    object CdsProdutosFiscoICMSSAIDA: TFMTBCDField
      FieldName = 'ICMSSAIDA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoICMSLEISAIDA: TStringField
      FieldName = 'ICMSLEISAIDA'
      Size = 1000
    end
    object CdsProdutosFiscoICMSLEISAIDALINK: TStringField
      FieldName = 'ICMSLEISAIDALINK'
      Size = 1000
    end
    object CdsProdutosFiscoIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoICMSPERCENTUALREDUCAO: TFMTBCDField
      FieldName = 'ICMSPERCENTUALREDUCAO'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoALIQUOTACHEIA: TFMTBCDField
      FieldName = 'ALIQUOTACHEIA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoSUBITEMST: TFMTBCDField
      FieldName = 'SUBITEMST'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoMVAINTERNO: TFMTBCDField
      FieldName = 'MVAINTERNO'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoMVAEXTERNO: TFMTBCDField
      FieldName = 'MVAEXTERNO'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoMVAIMPORTADO: TFMTBCDField
      FieldName = 'MVAIMPORTADO'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoBASEREDUZIDA: TFMTBCDField
      FieldName = 'BASEREDUZIDA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoICMSLEIINTERNO: TStringField
      FieldName = 'ICMSLEIINTERNO'
      Size = 1000
    end
    object CdsProdutosFiscoICMSLEIINTERNOLINK: TStringField
      FieldName = 'ICMSLEIINTERNOLINK'
      Size = 1000
    end
    object CdsProdutosFiscoSITUACAO_TRIBUTARIA_PIS_COFINS: TStringField
      FieldName = 'SITUACAO_TRIBUTARIA_PIS_COFINS'
      Size = 1
    end
    object CdsProdutosFiscoPISCOFINSLEI: TStringField
      FieldName = 'PISCOFINSLEI'
      Size = 1000
    end
    object CdsProdutosFiscoPISCOFINSLEILINK: TStringField
      FieldName = 'PISCOFINSLEILINK'
      Size = 1000
    end
    object CdsProdutosFiscoPISCOFINS_NATUREZA_RECEITA: TStringField
      FieldName = 'PISCOFINS_NATUREZA_RECEITA'
      Size = 3
    end
    object CdsProdutosFiscoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object CdsProdutosFiscoCADASTROSOLICITADO: TStringField
      FieldName = 'CADASTROSOLICITADO'
      Size = 1
    end
    object CdsProdutosFiscoFCP: TFMTBCDField
      FieldName = 'FCP'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoCST_IPI_SAIDA: TStringField
      FieldName = 'CST_IPI_SAIDA'
      Size = 3
    end
    object CdsProdutosFiscoALIQ_IPI_SAIDA: TStringField
      FieldName = 'ALIQ_IPI_SAIDA'
      Size = 3
    end
    object CdsProdutosFiscoREDUCAO_BASE_SAIDA: TFMTBCDField
      FieldName = 'REDUCAO_BASE_SAIDA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoDESC_CST_SAIDA: TStringField
      FieldName = 'DESC_CST_SAIDA'
      Size = 1000
    end
    object CdsProdutosFiscoREDUCAO_BASE_ENTRADA: TFMTBCDField
      FieldName = 'REDUCAO_BASE_ENTRADA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoCFOP_ENTRADA: TFloatField
      FieldName = 'CFOP_ENTRADA'
    end
    object CdsProdutosFiscoALIQ_ICMS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQ_ICMS_ENTRADA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoCST_IPI_ENTRADA: TStringField
      FieldName = 'CST_IPI_ENTRADA'
      Size = 3
    end
    object CdsProdutosFiscoALIQ_IPI_ENTRADA: TFMTBCDField
      FieldName = 'ALIQ_IPI_ENTRADA'
      Precision = 19
      Size = 2
    end
    object CdsProdutosFiscoUF_DESTINO: TStringField
      FieldName = 'UF_DESTINO'
      Size = 2
    end
    object CdsProdutosFiscoICMS_ATAC_AC: TStringField
      FieldName = 'ICMS_ATAC_AC'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_AC: TStringField
      FieldName = 'ICMS_INDU_AC'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_AL: TStringField
      FieldName = 'ICMS_ATAC_AL'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_AL: TStringField
      FieldName = 'ICMS_INDU_AL'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_AM: TStringField
      FieldName = 'ICMS_ATAC_AM'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_AM: TStringField
      FieldName = 'ICMS_INDU_AM'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_AP: TStringField
      FieldName = 'ICMS_ATAC_AP'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_AP: TStringField
      FieldName = 'ICMS_INDU_AP'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_BA: TStringField
      FieldName = 'ICMS_ATAC_BA'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_BA: TStringField
      FieldName = 'ICMS_INDU_BA'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_CE: TStringField
      FieldName = 'ICMS_ATAC_CE'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_CE: TStringField
      FieldName = 'ICMS_INDU_CE'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_DF: TStringField
      FieldName = 'ICMS_ATAC_DF'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_DF: TStringField
      FieldName = 'ICMS_INDU_DF'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_ES: TStringField
      FieldName = 'ICMS_ATAC_ES'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_ES: TStringField
      FieldName = 'ICMS_INDU_ES'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_GO: TStringField
      FieldName = 'ICMS_ATAC_GO'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_GO: TStringField
      FieldName = 'ICMS_INDU_GO'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_MA: TStringField
      FieldName = 'ICMS_ATAC_MA'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_MA: TStringField
      FieldName = 'ICMS_INDU_MA'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_MG: TStringField
      FieldName = 'ICMS_ATAC_MG'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_MG: TStringField
      FieldName = 'ICMS_INDU_MG'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_MS: TStringField
      FieldName = 'ICMS_ATAC_MS'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_MS: TStringField
      FieldName = 'ICMS_INDU_MS'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_MT: TStringField
      FieldName = 'ICMS_ATAC_MT'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_MT: TStringField
      FieldName = 'ICMS_INDU_MT'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_PA: TStringField
      FieldName = 'ICMS_ATAC_PA'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_PA: TStringField
      FieldName = 'ICMS_INDU_PA'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_PB: TStringField
      FieldName = 'ICMS_ATAC_PB'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_PB: TStringField
      FieldName = 'ICMS_INDU_PB'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_PE: TStringField
      FieldName = 'ICMS_ATAC_PE'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_PE: TStringField
      FieldName = 'ICMS_INDU_PE'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_PI: TStringField
      FieldName = 'ICMS_ATAC_PI'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_PI: TStringField
      FieldName = 'ICMS_INDU_PI'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_PR: TStringField
      FieldName = 'ICMS_ATAC_PR'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_PR: TStringField
      FieldName = 'ICMS_INDU_PR'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_RJ: TStringField
      FieldName = 'ICMS_ATAC_RJ'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_RJ: TStringField
      FieldName = 'ICMS_INDU_RJ'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_RN: TStringField
      FieldName = 'ICMS_ATAC_RN'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_RN: TStringField
      FieldName = 'ICMS_INDU_RN'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_RO: TStringField
      FieldName = 'ICMS_ATAC_RO'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_RO: TStringField
      FieldName = 'ICMS_INDU_RO'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_RR: TStringField
      FieldName = 'ICMS_ATAC_RR'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_RR: TStringField
      FieldName = 'ICMS_INDU_RR'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_RS: TStringField
      FieldName = 'ICMS_ATAC_RS'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_RS: TStringField
      FieldName = 'ICMS_INDU_RS'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_SC: TStringField
      FieldName = 'ICMS_ATAC_SC'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_SC: TStringField
      FieldName = 'ICMS_INDU_SC'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_SE: TStringField
      FieldName = 'ICMS_ATAC_SE'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_SE: TStringField
      FieldName = 'ICMS_INDU_SE'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_SP: TStringField
      FieldName = 'ICMS_ATAC_SP'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_SP: TStringField
      FieldName = 'ICMS_INDU_SP'
      Size = 3
    end
    object CdsProdutosFiscoICMS_ATAC_TO: TStringField
      FieldName = 'ICMS_ATAC_TO'
      Size = 3
    end
    object CdsProdutosFiscoICMS_INDU_TO: TStringField
      FieldName = 'ICMS_INDU_TO'
      Size = 3
    end
    object CdsProdutosFiscoPIS_SITUACAO: TStringField
      FieldName = 'PIS_SITUACAO'
      Size = 1000
    end
    object CdsProdutosFiscoCOFINS_SITUACAO: TStringField
      FieldName = 'COFINS_SITUACAO'
      Size = 1000
    end
    object CdsProdutosFiscoDT_ATUALIZACAO_FARMAX: TDateField
      FieldName = 'DT_ATUALIZACAO_FARMAX'
    end
    object CdsProdutosFiscoCODIGOANP: TStringField
      FieldName = 'CODIGOANP'
      Size = 10
    end
    object CdsProdutosFiscoSUBLIMITEICMS: TFMTBCDField
      FieldName = 'SUBLIMITEICMS'
      Precision = 18
      Size = 2
    end
    object CdsProdutosFiscoSUBLIMITEFCP: TFMTBCDField
      FieldName = 'SUBLIMITEFCP'
      Precision = 18
      Size = 2
    end
    object CdsProdutosFiscoSUBLIMITECST: TStringField
      FieldName = 'SUBLIMITECST'
      Size = 10
    end
    object CdsProdutosFiscoCODBENEFICIO: TStringField
      FieldName = 'CODBENEFICIO'
      Size = 10
    end
    object CdsProdutosFiscoDESONERACAOMOTIVO: TStringField
      FieldName = 'DESONERACAOMOTIVO'
      Size = 1000
    end
    object CdsProdutosFiscoDESONERACAOICMS: TFMTBCDField
      FieldName = 'DESONERACAOICMS'
      Precision = 18
      Size = 2
    end
    object CdsProdutosFiscoDESONERACAOFCP: TFMTBCDField
      FieldName = 'DESONERACAOFCP'
      Precision = 18
      Size = 2
    end
  end
  object SqlProdutosCompostos: TSQLDataSet
    CommandText = 
      'SELECT * FROM PRODUTOS_COMPOSTOS'#13#10'WHERE ID_PRODUTO_PRINCIPAL = :' +
      'ID_PRODUTO_PRINCIPAL AND'#13#10'ID_PRODUTO_COMPOSICAO = :ID_PRODUTO_CO' +
      'MPOSICAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO_PRINCIPAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO_COMPOSICAO'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 1112
    Top = 152
  end
  object DspProdutosCompostos: TDataSetProvider
    DataSet = SqlProdutosCompostos
    Left = 1112
    Top = 192
  end
  object QryProdutosCompostos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO_PRINCIPAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO_COMPOSICAO'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosCompostos'
    Left = 1112
    Top = 240
    object QryProdutosCompostosID_PRODUTO_PRINCIPAL: TFloatField
      FieldName = 'ID_PRODUTO_PRINCIPAL'
      Required = True
    end
    object QryProdutosCompostosID_PRODUTO_COMPOSICAO: TFloatField
      FieldName = 'ID_PRODUTO_COMPOSICAO'
      Required = True
    end
    object QryProdutosCompostosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object QryProdutosCompostosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryProdutosCompostosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsProdutosCompostos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1112
    Top = 288
    object CdsProdutosCompostosID_PRODUTO_PRINCIPAL: TFloatField
      FieldName = 'ID_PRODUTO_PRINCIPAL'
      Required = True
    end
    object CdsProdutosCompostosID_PRODUTO_COMPOSICAO: TFloatField
      FieldName = 'ID_PRODUTO_COMPOSICAO'
      Required = True
    end
    object CdsProdutosCompostosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsProdutosCompostosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsProdutosCompostosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlProdutosPrecoQuantidadeConsistencia: TSQLDataSet
    CommandText = 
      'SELECT ID_PRODUTO, QUANTIDADEINICIAL FROM PRODUTOS_PRECO_QUANTID' +
      'ADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 1261
    Top = 26
  end
  object DspProdutosPrecoQuantidadeConsistencia: TDataSetProvider
    DataSet = SqlProdutosPrecoQuantidadeConsistencia
    Left = 1261
    Top = 66
  end
  object CdsProdutosPrecoQuantidadeConsistencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosPrecoQuantidadeConsistencia'
    Left = 1261
    Top = 114
    object CdsProdutosPrecoQuantidadeConsistenciaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosPrecoQuantidadeConsistenciaQUANTIDADEINICIAL: TFloatField
      FieldName = 'QUANTIDADEINICIAL'
      Required = True
    end
  end
  object SqlProdutosFidelidadeConsistencia: TSQLDataSet
    CommandText = 'SELECT ID_PRODUTO FROM PRODUTOS_FIDELIDADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 1261
    Top = 186
  end
  object DspProdutosFidelidadeConsistencia: TDataSetProvider
    DataSet = SqlProdutosFidelidadeConsistencia
    Left = 1261
    Top = 226
  end
  object CdsProdutosFidelidadeConsistencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosFidelidadeConsistencia'
    Left = 1261
    Top = 274
    object CdsProdutosFidelidadeConsistenciaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
  end
  object SqlProdutosBarras: TSQLDataSet
    CommandText = 
      'SELECT * FROM PRODUTOS_BARRAS'#13#10'WHERE '#13#10' ID_PRODUTO = :ID_PRODUTO' +
      ' AND '#13#10' CODIGO_BARRAS = :CODIGO_BARRAS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 1248
    Top = 344
  end
  object DspProdutosBarras: TDataSetProvider
    DataSet = SqlProdutosBarras
    Left = 1248
    Top = 384
  end
  object QryProdutosBarras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosBarras'
    Left = 1248
    Top = 432
    object QryProdutosBarrasID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryProdutosBarrasCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Required = True
      Size = 14
    end
    object QryProdutosBarrasQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
  end
  object CdsProdutosBarras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1248
    Top = 480
    object CdsProdutosBarrasID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosBarrasCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Required = True
      Size = 14
    end
    object CdsProdutosBarrasQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsProdutosBarrasBARRA_ANTIGA: TStringField
      FieldName = 'BARRA_ANTIGA'
      Size = 14
    end
  end
end
