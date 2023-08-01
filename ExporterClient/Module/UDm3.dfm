object DM3: TDM3
  OldCreateOrder = False
  Height = 736
  Width = 1349
  object FDProdutosTotais: TFDQuery
    Connection = DM.FDConn
    Left = 40
    Top = 8
  end
  object DspProdutosTotais: TDataSetProvider
    DataSet = FDProdutosTotais
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
  object FDUsuarios: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' USUARIOS'
      'WHERE'
      ' CD_USUARIO = :CD_USUARIO')
    Left = 128
    Top = 9
    ParamData = <
      item
        Name = 'CD_USUARIO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspUsuarios: TDataSetProvider
    DataSet = FDUsuarios
    Left = 128
    Top = 57
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
    Left = 128
    Top = 105
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
    Left = 128
    Top = 153
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
  object FDPermissoesModulos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' PERMISSOES_MODULOS'
      'WHERE'
      ' CD_PERMISSAO = :CD_PERMISSAO AND'
      ' CD_MODULO = :CD_MODULO')
    Left = 312
    Top = 8
    ParamData = <
      item
        Name = 'CD_PERMISSAO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_MODULO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspPermissoesModulos: TDataSetProvider
    DataSet = FDPermissoesModulos
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
  object FDPermissoes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' PERMISSOES'
      'WHERE'
      ' CD_PERMISSAO = :CD_PERMISSAO')
    Left = 216
    Top = 8
    ParamData = <
      item
        Name = 'CD_PERMISSAO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspPermissoes: TDataSetProvider
    DataSet = FDPermissoes
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
  object FDEncartes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' ENCARTE'
      'WHERE'
      ' ID_ENCARTE = :ID_ENCARTE')
    Left = 681
    Top = 354
    ParamData = <
      item
        Name = 'ID_ENCARTE'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspEncartes: TDataSetProvider
    DataSet = FDEncartes
    Left = 681
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
    Left = 681
    Top = 442
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
    Left = 681
    Top = 490
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
  object FdItensEncartes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' ENCARTE_ITENS'
      'WHERE'
      ' ID_ENCARTE = :ID_ENCARTE AND'
      ' ID_PRODUTO = :ID_PRODUTO')
    Left = 757
    Top = 354
    ParamData = <
      item
        Name = 'ID_ENCARTE'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspItensEncartes: TDataSetProvider
    DataSet = FdItensEncartes
    Left = 757
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
    Left = 757
    Top = 442
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
    Left = 765
    Top = 482
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
  object FDRedes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' REDES'
      'WHERE'
      ' ID_REDE = :ID_REDE')
    Left = 400
    Top = 8
    ParamData = <
      item
        Name = 'ID_REDE'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspRedes: TDataSetProvider
    DataSet = FDRedes
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
  object FDConcorrentes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' CONCORRENTES'
      'WHERE'
      ' ID_CONCORRENTE = :ID_CONCORRENTE')
    Left = 480
    Top = 8
    ParamData = <
      item
        Name = 'ID_CONCORRENTE'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspConcorrentes: TDataSetProvider
    DataSet = FDConcorrentes
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
  object FDPrecosConcorrentes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' PROD_CONCORRENTES'
      'WHERE'
      ' ID_CONCORRENTE = :ID_CONCORRENTE AND'
      ' ID_PRODUTO = :ID_PRODUTO')
    Left = 584
    Top = 8
    ParamData = <
      item
        Name = 'ID_CONCORRENTE'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspPrecosConcorrentes: TDataSetProvider
    DataSet = FDPrecosConcorrentes
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
    Left = 102
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
  object FDContasPagarDeletadas: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' CAMPO1'
      'FROM'
      ' DELETADOS'
      'WHERE'
      ' TABELA = '#39'CONTAS_PAGAR'#39)
    Left = 863
    Top = 356
  end
  object DspContasPagarDeletadas: TDataSetProvider
    DataSet = FDContasPagarDeletadas
    Left = 863
    Top = 399
  end
  object CdsContasPagarDeletadas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasPagarDeletadas'
    Left = 863
    Top = 438
    object CdsContasPagarDeletadasCAMPO1: TStringField
      FieldName = 'CAMPO1'
    end
  end
  object CdsContasReceberDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 496
    object CdsContasReceberDeletadosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsContasReceberDeletadosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object FDCRDeletados: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' ID_PRODUTO,'
      ' CD_FILIAL'
      'FROM'
      ' TEMP_PRODUTOS2'
      'WHERE'
      ' PROCESSO = 64')
    Left = 696
    Top = 8
  end
  object DspCRDeletados: TDataSetProvider
    DataSet = FDCRDeletados
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
  object FDLimiteSaldoClientes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_CLIENTE,'
      ' LIMITE_CREDITO,'
      ' LIMITE_PERCENTUAL,'
      ' SALDO,'
      ' STATUS'
      'FROM'
      ' CLIENTES'
      'WHERE'
      ' CD_CLIENTE = :CD_CLIENTE')
    Left = 808
    Top = 8
    ParamData = <
      item
        Name = 'CD_CLIENTE'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object FDLimiteSaldoClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDLimiteSaldoClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object FDLimiteSaldoClientesLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
      ProviderFlags = [pfInUpdate]
    end
    object FDLimiteSaldoClientesSALDO: TFloatField
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
    end
    object FDLimiteSaldoClientesSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object DspLimiteSaldoClientes: TDataSetProvider
    DataSet = FDLimiteSaldoClientes
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
  object FDClasses: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_CLASSE FROM CLASSES')
    Left = 35
    Top = 212
  end
  object DspClasses: TDataSetProvider
    DataSet = FDClasses
    Left = 35
    Top = 252
  end
  object CdsClasses: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClasses'
    Left = 35
    Top = 300
    object CdsClassesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      Required = True
    end
  end
  object FDGrupos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_GRUPO FROM GRUPOS')
    Left = 119
    Top = 213
  end
  object DspGrupos: TDataSetProvider
    DataSet = FDGrupos
    Left = 119
    Top = 253
  end
  object CdsGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupos'
    Left = 119
    Top = 301
    object CdsGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
  end
  object FDLaboratorios: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_LABORATORIO FROM LABORATORIOS')
    Left = 216
    Top = 212
  end
  object DspLaboratorios: TDataSetProvider
    DataSet = FDLaboratorios
    Left = 216
    Top = 252
  end
  object CdsLaboratorios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLaboratorios'
    Left = 216
    Top = 300
    object CdsLaboratoriosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
      Required = True
    end
  end
  object FDGruposCompras: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_GRUPOCOMPRA FROM GRUPOSCOMPRAS')
    Left = 416
    Top = 208
  end
  object DspGruposCompras: TDataSetProvider
    DataSet = FDGruposCompras
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
  object FDGruposBalanco: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_GRUPOBALANCO FROM GRUPOSBALANCO')
    Left = 520
    Top = 208
  end
  object DspGruposBalanco: TDataSetProvider
    DataSet = FDGruposBalanco
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
  object FDDistribuidores: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_DISTRIBUIDOR FROM DISTRIBUIDORES')
    Left = 616
    Top = 208
  end
  object DspDistribuidores: TDataSetProvider
    DataSet = FDDistribuidores
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
  object FDFamilias: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM FAMILIAS')
    Left = 314
    Top = 212
  end
  object DspFamilias: TDataSetProvider
    DataSet = FDFamilias
    Left = 314
    Top = 252
  end
  object CdsFamilias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFamilias'
    Left = 314
    Top = 300
    object CdsFamiliasID_FAMILIA: TFloatField
      FieldName = 'ID_FAMILIA'
      Required = True
    end
    object CdsFamiliasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsFamiliasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsFamiliasDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsFamiliasALTERAPRECOFAMILIA: TStringField
      FieldName = 'ALTERAPRECOFAMILIA'
      Size = 1
    end
    object CdsFamiliasENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object FDCartoes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_CARTAO FROM CARTOES')
    Left = 24
    Top = 361
  end
  object DspCartoes: TDataSetProvider
    DataSet = FDCartoes
    Left = 19
    Top = 394
  end
  object CdsCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCartoes'
    Left = 19
    Top = 442
    object CdsCartoesCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
      Required = True
    end
  end
  object FDPlanoContas: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_PLANO_CONTAS FROM PLANO_CONTAS')
    Left = 109
    Top = 354
  end
  object DspPlanoConras: TDataSetProvider
    DataSet = FDPlanoContas
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
  object FdVendedores: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_VENDEDOR FROM VENDEDORES')
    Left = 205
    Top = 354
  end
  object DspVendedores: TDataSetProvider
    DataSet = FdVendedores
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
  object FDConvenios: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_CONVENIO FROM CONVENIOS')
    Left = 293
    Top = 354
  end
  object DspConvenios: TDataSetProvider
    DataSet = FDConvenios
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
  object FdClientes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_CLIENTE FROM CLIENTES'
      'WHERE CD_CLIENTE IN'
      '(SELECT DISTINCT CD_CLIENTE FROM CONTAS_RECEBER WHERE '
      'CD_FORMA_PAGAMENTO > 2 AND STATUS = '#39'A'#39')')
    Left = 389
    Top = 354
  end
  object DspClientes: TDataSetProvider
    DataSet = FdClientes
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
    Left = 392
    Top = 498
    object CdsVirtualClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
  end
  object FDContasReceber: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_CONTAS_RECEBER FROM CONTAS_RECEBER'
      'WHERE CD_CONTAS_RECEBER = :CD_CONTAS_RECEBER')
    Left = 468
    Top = 354
    ParamData = <
      item
        Name = 'CD_CONTAS_RECEBER'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspContasReceber: TDataSetProvider
    DataSet = FDContasReceber
    Left = 468
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
    Left = 468
    Top = 442
    object CdsContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object CdsVirtualContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 498
    object CdsVirtualContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object FDContasReceberTodas: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_CONTAS_RECEBER FROM CONTAS_RECEBER')
    Left = 582
    Top = 354
  end
  object DspContasReceberTodas: TDataSetProvider
    DataSet = FDContasReceberTodas
    Left = 582
    Top = 394
  end
  object CdsContasReceberTodas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContasReceberTodas'
    Left = 582
    Top = 442
    object CdsContasReceberTodasCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object FDCeParame: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_FILIAL,'
      ' PRECIFICACAO_UNICA,'
      ' TIPO_LOJA'
      'FROM'
      ' PARAMETROS')
    Left = 715
    Top = 205
  end
  object DspParametros: TDataSetProvider
    DataSet = FDCeParame
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
  object FdConexao: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CGC '
      'FROM'
      ' PARAMETROS')
    Left = 808
    Top = 205
  end
  object DspConexao: TDataSetProvider
    DataSet = FdConexao
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
  object FDSql: TFDQuery
    Connection = DM.FDConn
    Left = 96
    Top = 552
  end
  object CdsVirtualCD: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 552
    object CdsVirtualCDCD: TFloatField
      FieldName = 'CD'
    end
  end
  object FDSintegraNFEntradaDeletados: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' CAMPO1, CAMPO2'
      'FROM'
      ' DELETADOS'
      'WHERE'
      ' TABELA = '#39'SINTEGRA_FN_ENTRADA'#39)
    Left = 928
    Top = 205
  end
  object DspSintegraNFEntradaDeletados: TDataSetProvider
    DataSet = FDSintegraNFEntradaDeletados
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
  object FDPerfilCliente: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM PERFIL_CLIENTE'
      'WHERE ID_PERFIL_CLIENTE = :ID')
    Left = 928
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspPerfilCliente: TDataSetProvider
    DataSet = FDPerfilCliente
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
  object FDPrincipioAtivo: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM PRINCIPIO_ATIVO'
      'WHERE CD_PRINCIPIO = :ID')
    Left = 1024
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspPrincipioAtivo: TDataSetProvider
    DataSet = FDPrincipioAtivo
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
  object FdUsuariosConsistencia: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT CD_USUARIO FROM USUARIOS')
    Left = 976
    Top = 354
  end
  object DspUsuariosConsistencia: TDataSetProvider
    DataSet = FdUsuariosConsistencia
    Left = 976
    Top = 394
  end
  object CdsUsuariosConsistencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUsuariosConsistencia'
    Left = 976
    Top = 442
    object CdsUsuariosConsistenciaCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
  end
  object FDProdDistr: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM PROD_DISTR'
      'WHERE ID_PRODUTO = :ID_PRODUTO AND'
      'CD_DISTRIBUIDOR = :CD_DISTRIBUIDOR')
    Left = 1071
    Top = 355
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_DISTRIBUIDOR'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspProdDistr: TDataSetProvider
    DataSet = FDProdDistr
    Left = 1071
    Top = 395
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
    Left = 1071
    Top = 443
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
    Left = 1071
    Top = 491
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
  object SqlProdutosFisco: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM PRODUTOS_FISCO'
      'WHERE ID_PRODUTO = :ID_PRODUTO')
    Left = 1151
    Top = 360
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspProdutosFisco: TDataSetProvider
    DataSet = SqlProdutosFisco
    Left = 1151
    Top = 400
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
    Left = 1151
    Top = 448
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
    Left = 1151
    Top = 496
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
  object FDProdutosCompostos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM PRODUTOS_COMPOSTOS'
      'WHERE ID_PRODUTO_PRINCIPAL = :ID_PRODUTO_PRINCIPAL AND'
      'ID_PRODUTO_COMPOSICAO = :ID_PRODUTO_COMPOSICAO')
    Left = 1151
    Top = 168
    ParamData = <
      item
        Name = 'ID_PRODUTO_PRINCIPAL'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'ID_PRODUTO_COMPOSICAO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DspProdutosCompostos: TDataSetProvider
    DataSet = FDProdutosCompostos
    Left = 1151
    Top = 200
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
    Left = 1151
    Top = 248
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
    Left = 1151
    Top = 296
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
  object FDProdutosPrecoQuantidadeConsistencia: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      
        'SELECT ID_PRODUTO, QUANTIDADEINICIAL FROM PRODUTOS_PRECO_QUANTID' +
        'ADE')
    Left = 1151
    Top = 7
  end
  object DspProdutosPrecoQuantidadeConsistencia: TDataSetProvider
    DataSet = FDProdutosPrecoQuantidadeConsistencia
    Left = 1151
    Top = 47
  end
  object CdsProdutosPrecoQuantidadeConsistencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosPrecoQuantidadeConsistencia'
    Left = 1151
    Top = 95
    object CdsProdutosPrecoQuantidadeConsistenciaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosPrecoQuantidadeConsistenciaQUANTIDADEINICIAL: TFloatField
      FieldName = 'QUANTIDADEINICIAL'
      Required = True
    end
  end
  object FDProdutosFidelidadeConsistencia: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT ID_PRODUTO FROM PRODUTOS_FIDELIDADE')
    Left = 1055
    Top = 202
  end
  object DspProdutosFidelidadeConsistencia: TDataSetProvider
    DataSet = FDProdutosFidelidadeConsistencia
    Left = 1055
    Top = 242
  end
  object CdsProdutosFidelidadeConsistencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosFidelidadeConsistencia'
    Left = 1055
    Top = 290
    object CdsProdutosFidelidadeConsistenciaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
  end
  object FDProdutosBarras: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM PRODUTOS_BARRAS'
      'WHERE '
      ' ID_PRODUTO = :ID_PRODUTO AND '
      ' CODIGO_BARRAS = :CODIGO_BARRAS')
    Left = 1151
    Top = 359
    ParamData = <
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CODIGO_BARRAS'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DspProdutosBarras: TDataSetProvider
    DataSet = FDProdutosBarras
    Left = 1151
    Top = 399
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
    Left = 1151
    Top = 444
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
    Left = 1151
    Top = 494
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
