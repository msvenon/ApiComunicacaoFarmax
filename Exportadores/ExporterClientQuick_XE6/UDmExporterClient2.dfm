object DmExporterClient2: TDmExporterClient2
  OldCreateOrder = False
  Left = 158
  Top = 81
  Height = 639
  Width = 1053
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
    Left = 744
    Top = 344
  end
  object DspEncartes: TDataSetProvider
    DataSet = SqlEncartes
    Left = 744
    Top = 384
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
    Left = 744
    Top = 424
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
    Left = 744
    Top = 464
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
    Left = 832
    Top = 344
  end
  object DspItensEncartes: TDataSetProvider
    DataSet = SqlItensEncartes
    Left = 832
    Top = 384
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
    Left = 832
    Top = 424
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
    Left = 832
    Top = 464
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
      'ID_CONCORRENTE AND'#13#10' ID_PRODUTO = :ID_PRODUTO'#13#10' '
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
    Left = 944
    Top = 341
  end
  object DspContasPagarDeletadas: TDataSetProvider
    DataSet = SqlContasPagarDeletadas
    Left = 944
    Top = 384
  end
  object CdsContasPagarDeletadas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasPagarDeletadas'
    Left = 944
    Top = 423
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
    Left = 40
    Top = 344
  end
  object DspCartoes: TDataSetProvider
    DataSet = SqlCartoes
    Left = 40
    Top = 384
  end
  object CdsCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCartoes'
    Left = 40
    Top = 432
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
    Left = 136
    Top = 344
  end
  object DspPlanoConras: TDataSetProvider
    DataSet = SqlPlanoContas
    Left = 136
    Top = 384
  end
  object CdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPlanoConras'
    Left = 136
    Top = 432
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
    Left = 232
    Top = 344
  end
  object DspVendedores: TDataSetProvider
    DataSet = SqlVendedores
    Left = 232
    Top = 384
  end
  object CdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendedores'
    Left = 232
    Top = 432
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
    Left = 320
    Top = 344
  end
  object DspConvenios: TDataSetProvider
    DataSet = SqlConvenios
    Left = 320
    Top = 384
  end
  object CdsConvenios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConvenios'
    Left = 320
    Top = 432
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
    Left = 416
    Top = 344
  end
  object DspClientes: TDataSetProvider
    DataSet = SqlClientes
    Left = 416
    Top = 384
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClientes'
    Left = 416
    Top = 432
    object CdsClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
  end
  object CdsVirtualClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 480
    object CdsVirtualClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
  end
  object SqlContasReceber: TSQLDataSet
    CommandText = 
      'SELECT CD_CONTAS_RECEBER FROM CONTAS_RECEBER'#13#10'WHERE CD_CONTAS_RE' +
      'CEBER = :CD_CONTAS_RECEBER'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    SQLConnection = DmExporterClient.SQLConnection1
    Left = 520
    Top = 344
  end
  object DspContasReceber: TDataSetProvider
    DataSet = SqlContasReceber
    Left = 520
    Top = 384
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
    Left = 520
    Top = 432
    object CdsContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object CdsVirtualContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 480
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
    Left = 640
    Top = 344
  end
  object DspContasReceberTodas: TDataSetProvider
    DataSet = SqlContasReceberTodas
    Left = 640
    Top = 384
  end
  object CdsContasReceberTodas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasReceberTodas'
    Left = 640
    Top = 432
    object CdsContasReceberTodasCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object TbCeParame: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_FILIAL,'#13#10' PRECIFICACAO_UNICA,'#13#10' TIPO_LOJA'#13#10'FROM'#13#10' PA' +
      'RAMETROS'#13#10
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
    CommandText = 'SELECT'#13#10' CGC '#13#10'FROM'#13#10' PARAMETROS'#13#10
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
    CommandText = 'SELECT * FROM PERFIL_CLIENTE'#13#10'WHERE ID_PERFIL_CLIENTE = :ID'#13#10
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
end
