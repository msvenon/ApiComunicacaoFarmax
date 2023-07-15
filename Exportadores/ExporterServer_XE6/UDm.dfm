object Dm: TDm
  OldCreateOrder = False
  OnCreate = SoapDataModuleCreate
  OnDestroy = SoapDataModuleDestroy
  Height = 742
  Width = 1393
  object CdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 8
  end
  object CdsPedid1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 235
    Top = 9
  end
  object CdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 298
    Top = 9
  end
  object CdsDuplic: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 363
    Top = 8
  end
  object SqlGrupos: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' GRUPOS.*'#13#10'FROM'#13#10' GRUPOS,'#13#10' TEMP_PRODUTOS'#13#10'WHERE'#13#10' TEMP' +
      '_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS.PROCESSO = ' +
      '100 AND'#13#10' GRUPOS.CD_GRUPO = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 42
    Top = 101
  end
  object DspGrupos: TDataSetProvider
    DataSet = SqlGrupos
    Left = 42
    Top = 136
  end
  object SqlLaboratorios: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' LABORATORIOS.*'#13#10'FROM'#13#10' LABORATORIOS,'#13#10' TEMP_PRODUTOS'#13#10 +
      'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS' +
      '.PROCESSO = 101 AND'#13#10' LABORATORIOS.CD_LABORATORIO = TEMP_PRODUTO' +
      'S.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 90
    Top = 101
  end
  object DspLaboratorios: TDataSetProvider
    DataSet = SqlLaboratorios
    Left = 90
    Top = 136
  end
  object SqlIncluiProdutos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' PRODUTOS.ID_PRODUTO,'#13#10' PRODUTOS.CD_PRODUTO,'#13#10' PRODUTOS.' +
      'CODIGO_BARRAS_1,'#13#10' PRODUTOS.CODIGO_BARRAS_2,'#13#10' PRODUTOS.DESCRICA' +
      'O,'#13#10' PRODUTOS.CD_LABORATORIO,'#13#10' PRODUTOS.CD_GRUPO,'#13#10' PRODUTOS.CD' +
      '_GRUPOBALANCO,'#13#10' PRODUTOS.CD_GRUPOCOMPRA,'#13#10' PRODUTOS.CD_CLASSE,'#13 +
      #10' PRODUTOS.ID_FAMILIA,'#13#10' PRODUTOS.TIPO_PRODUTO,'#13#10' PRODUTOS.ENTRA' +
      '_PEDIDO_ELETRONICO,'#13#10' PRODUTOS.CD_LISTA,'#13#10' PRODUTOS.TX_DESCONTO,' +
      #13#10' PRODUTOS.IDENTIFICADOR,'#13#10' PRODUTOS.BALANCA,'#13#10' PRODUTOS.UNIDAD' +
      'E,'#13#10' PRODUTOS.QT_EMBALAGEM,'#13#10' PRODUTOS.COMISSAO,'#13#10' PRODUTOS.PREC' +
      'O_VENDA,'#13#10' PRODUTOS.PRECO_PROMOCAO,'#13#10' PRODUTOS.ICMS,'#13#10' PRODUTOS.' +
      'MARGEM,'#13#10' PRODUTOS.MARGEM_PROMOCAO,'#13#10' PRODUTOS.DT_CADASTRO,'#13#10' PR' +
      'ODUTOS.CURVA,'#13#10' PRODUTOS.STATUS,'#13#10' PRODUTOS.USOCONTINUO,'#13#10' PRODU' +
      'TOS.PIS_COFINS,'#13#10' PRODUTOS.NCM,'#13#10' PRODUTOS.CD_SUBGRUPO,'#13#10' PRODUT' +
      'OS.CEST,'#13#10' PRODUTOS.CD_CFOP,'#13#10' PRODUTOS.SITUACAOTRIBUTARIA,'#13#10' PR' +
      'ODUTOS.ORIGEM,'#13#10' PRODUTOS.CSOSN,'#13#10' PRODUTOS.IAT,'#13#10' PRODUTOS.IPPT' +
      ','#13#10' PRODUTOS.COMPRIMIDOSCAIXA,'#13#10' PRODUTOS.CONTROLADO,'#13#10' PRODUTOS' +
      '.GENERICO,'#13#10' PRODUTOS.CD_PRINCIPIO,'#13#10' PRODUTOS.DT_VENCIMENTO_PRO' +
      'MOCAO,'#13#10' PRODUTOS.CUSTO_UNITARIO,'#13#10' PRODUTOS.OBSERVACAO'#13#10'FROM '#13#10 +
      ' PRODUTOS,'#13#10' TEMP_PRODUTOS2'#13#10'WHERE'#13#10' TEMP_PRODUTOS2.CD_FILIAL = ' +
      ':CD_FILIAL AND'#13#10' TEMP_PRODUTOS2.PROCESSO = 103 AND'#13#10' PRODUTOS.ID' +
      '_PRODUTO = TEMP_PRODUTOS2.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 249
    Top = 101
  end
  object DspIncluiProdutos: TDataSetProvider
    DataSet = SqlIncluiProdutos
    Left = 249
    Top = 136
  end
  object SqlVendedores: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' VENDEDORES'#13#10'WHERE'#13#10' (DT_ADMISSAO >= CURRENT_D' +
      'ATE - 1) OR'#13#10' (DT_ALTERACAO >= CURRENT_DATE - 1)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 317
    Top = 101
  end
  object DspVendedores: TDataSetProvider
    DataSet = SqlVendedores
    Left = 317
    Top = 136
  end
  object SqlCompras: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COMPRAS.*'#13#10'FROM'#13#10' COMPRAS, TEMP_COMPRAS'#13#10'WHERE'#13#10' COMPRA' +
      'S.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS AND'#13#10' TEMP_COMPRAS.CD_FIL' +
      'IAL = :FILIAL AND'#13#10' TEMP_COMPRAS.PROCESSO = '#39'4'#39' AND'#13#10' TEMP_COMPR' +
      'AS.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 371
    Top = 101
  end
  object DspCompras: TDataSetProvider
    DataSet = SqlCompras
    Left = 371
    Top = 136
  end
  object SqlItensCompra: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_COMPRA.*'#13#10'FROM'#13#10' ITENS_COMPRA,'#13#10' TEMP_COMPRAS'#13#10'WH' +
      'ERE'#13#10' ITENS_COMPRA.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS AND'#13#10' IT' +
      'ENS_COMPRA.ID_PRODUTO = TEMP_COMPRAS.ID_PRODUTO AND'#13#10' TEMP_COMPR' +
      'AS.PROCESSO = '#39'5'#39' AND'#13#10' TEMP_COMPRAS.ENVIADO = '#39'9'#39' AND'#13#10' TEMP_CO' +
      'MPRAS.CD_FILIAL = :CD_FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 431
    Top = 101
  end
  object DspItensCompra: TDataSetProvider
    DataSet = SqlItensCompra
    Left = 431
    Top = 136
  end
  object CdsGrupos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspGrupos'
    Left = 42
    Top = 171
    object CdsGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object CdsGruposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object CdsGruposTX_MARCACAO: TFloatField
      FieldName = 'TX_MARCACAO'
    end
    object CdsGruposDESCONTO: TStringField
      FieldName = 'DESCONTO'
      Size = 1
    end
    object CdsGruposTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsGruposTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object CdsGruposTX_COMISSAO: TFloatField
      FieldName = 'TX_COMISSAO'
    end
    object CdsGruposDIAS_EST_MIN: TFloatField
      FieldName = 'DIAS_EST_MIN'
    end
    object CdsGruposTIPO: TStringField
      FieldName = 'TIPO'
      Size = 2
    end
    object CdsGruposDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsGruposNPRODUTOS: TFloatField
      FieldName = 'NPRODUTOS'
    end
    object CdsGruposVPRODUTOS: TFloatField
      FieldName = 'VPRODUTOS'
    end
    object CdsGruposCPRODUTOS: TFloatField
      FieldName = 'CPRODUTOS'
    end
    object CdsGruposEXIGERECEITA: TStringField
      FieldName = 'EXIGERECEITA'
      Size = 1
    end
    object CdsGruposVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      Size = 1
    end
    object CdsGruposPEDECRM: TStringField
      FieldName = 'PEDECRM'
      Size = 1
    end
    object CdsGruposENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsGruposIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 8
    end
    object CdsGruposNITENS: TFloatField
      FieldName = 'NITENS'
    end
    object CdsGruposMETA: TFloatField
      FieldName = 'META'
    end
  end
  object CdsLaboratorios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspLaboratorios'
    Left = 90
    Top = 171
    object CdsLaboratoriosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
      Required = True
    end
    object CdsLaboratoriosNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object CdsLaboratoriosRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 40
    end
    object CdsLaboratoriosCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsLaboratoriosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsLaboratoriosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsLaboratoriosFONE: TStringField
      FieldName = 'FONE'
      Size = 40
    end
    object CdsLaboratoriosCONTATO: TStringField
      FieldName = 'CONTATO'
    end
    object CdsLaboratoriosTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsLaboratoriosCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Size = 1
    end
    object CdsLaboratoriosDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsLaboratoriosNPRODUTOS: TFloatField
      FieldName = 'NPRODUTOS'
    end
    object CdsLaboratoriosVPRODUTOS: TFloatField
      FieldName = 'VPRODUTOS'
    end
    object CdsLaboratoriosCPRODUTOS: TFloatField
      FieldName = 'CPRODUTOS'
    end
    object CdsLaboratoriosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsLaboratoriosID_AREA: TFloatField
      FieldName = 'ID_AREA'
    end
    object CdsLaboratoriosNITENS: TFloatField
      FieldName = 'NITENS'
    end
  end
  object CdsIncluiProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspIncluiProdutos'
    Left = 249
    Top = 171
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
  object CdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspVendedores'
    Left = 317
    Top = 171
    object CdsVendedoresCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      Required = True
    end
    object CdsVendedoresCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsVendedoresDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
    end
    object CdsVendedoresDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object CdsVendedoresTIPO_FUNCIONARIO: TStringField
      FieldName = 'TIPO_FUNCIONARIO'
      Size = 1
    end
    object CdsVendedoresCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 13
    end
    object CdsVendedoresNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object CdsVendedoresRUA: TStringField
      FieldName = 'RUA'
      Size = 35
    end
    object CdsVendedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsVendedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 23
    end
    object CdsVendedoresUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsVendedoresCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsVendedoresFONE: TStringField
      FieldName = 'FONE'
      Size = 40
    end
    object CdsVendedoresREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object CdsVendedoresRG: TStringField
      FieldName = 'RG'
      Size = 16
    end
    object CdsVendedoresCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object CdsVendedoresJORNADA: TStringField
      FieldName = 'JORNADA'
      Size = 11
    end
    object CdsVendedoresINTERVALO: TStringField
      FieldName = 'INTERVALO'
      Size = 11
    end
    object CdsVendedoresREPOUSO: TStringField
      FieldName = 'REPOUSO'
      Size = 13
    end
    object CdsVendedoresNR_REGISTRO: TStringField
      FieldName = 'NR_REGISTRO'
      Size = 10
    end
    object CdsVendedoresCTPS: TStringField
      FieldName = 'CTPS'
      Size = 13
    end
    object CdsVendedoresFUNCAO: TStringField
      FieldName = 'FUNCAO'
    end
    object CdsVendedoresSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object CdsVendedoresTX_COMISSAO: TFloatField
      FieldName = 'TX_COMISSAO'
    end
    object CdsVendedoresCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CdsVendedoresVENDA: TFloatField
      FieldName = 'VENDA'
    end
    object CdsVendedoresOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsVendedoresENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsVendedoresSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object CdsVendedoresESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 1
    end
    object CdsVendedoresNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
    end
    object CdsVendedoresCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 40
    end
    object CdsVendedoresDT_NASC_CONJUGE: TDateField
      FieldName = 'DT_NASC_CONJUGE'
    end
    object CdsVendedoresNUM_DEPEND: TFloatField
      FieldName = 'NUM_DEPEND'
    end
    object CdsVendedoresNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 40
    end
    object CdsVendedoresNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 40
    end
    object CdsVendedoresEMPRESA_ANTERIOR: TStringField
      FieldName = 'EMPRESA_ANTERIOR'
      Size = 40
    end
    object CdsVendedoresTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      Size = 10
    end
    object CdsVendedoresREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 51
    end
    object CdsVendedoresREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 51
    end
    object CdsVendedoresDESCONTO: TStringField
      FieldName = 'DESCONTO'
      Size = 1
    end
    object CdsVendedoresCOMISSAO_MEDICAMENTOS: TStringField
      FieldName = 'COMISSAO_MEDICAMENTOS'
      Size = 1
    end
    object CdsVendedoresCOMISSAO_BONIFICADOS: TStringField
      FieldName = 'COMISSAO_BONIFICADOS'
      Size = 1
    end
    object CdsVendedoresCOMISSAO_PERFUMARIA: TStringField
      FieldName = 'COMISSAO_PERFUMARIA'
      Size = 1
    end
    object CdsVendedoresCOMISSAO_OUTROS: TStringField
      FieldName = 'COMISSAO_OUTROS'
      Size = 1
    end
    object CdsVendedoresCOTA: TFloatField
      FieldName = 'COTA'
    end
    object CdsVendedoresSENHA: TStringField
      FieldName = 'SENHA'
      Size = 13
    end
    object CdsVendedoresDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsVendedoresSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsVendedoresFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object CdsVendedoresVENDEOUTRALOJA: TStringField
      FieldName = 'VENDEOUTRALOJA'
      Size = 1
    end
    object CdsVendedoresUSUARIOFARMACIAPOPULAR: TStringField
      FieldName = 'USUARIOFARMACIAPOPULAR'
      Size = 8
    end
    object CdsVendedoresSENHAFARMACIAPOPULAR: TStringField
      FieldName = 'SENHAFARMACIAPOPULAR'
      Size = 8
    end
  end
  object CdsCompras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspCompras'
    Left = 371
    Top = 171
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
      Size = 10
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
    object CdsComprasSTATUSCONFERENCIA: TStringField
      FieldName = 'STATUSCONFERENCIA'
      Size = 1
    end
    object CdsComprasCD_USUARIO_CONFERENCIA: TFloatField
      FieldName = 'CD_USUARIO_CONFERENCIA'
    end
    object CdsComprasUSUARIO_CONFERENCIA: TStringField
      FieldName = 'USUARIO_CONFERENCIA'
    end
    object CdsComprasCONFIGGERACAO: TStringField
      FieldName = 'CONFIGGERACAO'
      Size = 1000
    end
    object CdsComprasLOCALGERACAO: TStringField
      FieldName = 'LOCALGERACAO'
      Size = 1
    end
    object CdsComprasMODELONF: TStringField
      FieldName = 'MODELONF'
      Size = 2
    end
    object CdsComprasVL_ISENTOICMS: TFloatField
      FieldName = 'VL_ISENTOICMS'
    end
    object CdsComprasICMS_RETIDO: TFloatField
      FieldName = 'ICMS_RETIDO'
    end
    object CdsComprasPHARMALINK: TStringField
      FieldName = 'PHARMALINK'
      Size = 1
    end
    object CdsComprasBONIFICACAO: TStringField
      FieldName = 'BONIFICACAO'
      Size = 1
    end
    object CdsComprasCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 100
    end
    object CdsComprasVL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object CdsComprasVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object CdsComprasINFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 10000
    end
    object CdsComprasTRANSFERENCIA: TStringField
      FieldName = 'TRANSFERENCIA'
      Size = 1
    end
    object CdsComprasCONSIGNACAO: TStringField
      FieldName = 'CONSIGNACAO'
      Size = 1
    end
    object CdsComprasVL_FCP: TFMTBCDField
      FieldName = 'VL_FCP'
      Precision = 18
      Size = 2
    end
    object CdsComprasVL_FCPST: TFMTBCDField
      FieldName = 'VL_FCPST'
      Precision = 18
      Size = 2
    end
    object CdsComprasVL_FCPSTRET: TFMTBCDField
      FieldName = 'VL_FCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsComprasVL_II: TFMTBCDField
      FieldName = 'VL_II'
      Precision = 18
      Size = 2
    end
    object CdsComprasICM_BASESUBSTRET: TFMTBCDField
      FieldName = 'ICM_BASESUBSTRET'
      Precision = 18
      Size = 2
    end
    object CdsComprasICM_VALORSUBSTRET: TFMTBCDField
      FieldName = 'ICM_VALORSUBSTRET'
      Precision = 18
      Size = 2
    end
  end
  object CdsItensCompra: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspItensCompra'
    Left = 431
    Top = 168
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
      Size = 1
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
    object CdsItensCompraPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object CdsItensCompraQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsItensCompraENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
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
    object CdsItensCompraCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 13
    end
    object CdsItensCompraUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object CdsItensCompraICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsItensCompraBASEICMS: TFloatField
      FieldName = 'BASEICMS'
    end
    object CdsItensCompraBASEICMSSUBSTITUICAO: TFloatField
      FieldName = 'BASEICMSSUBSTITUICAO'
    end
    object CdsItensCompraSITUACAOTRIBITARIA: TStringField
      FieldName = 'SITUACAOTRIBITARIA'
      Size = 3
    end
    object CdsItensCompraLOTE: TStringField
      FieldName = 'LOTE'
    end
    object CdsItensCompraFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object CdsItensCompraVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object CdsItensCompraPRECO_PROMOCAO_ATUAL: TFloatField
      FieldName = 'PRECO_PROMOCAO_ATUAL'
    end
    object CdsItensCompraPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object CdsItensCompraDESCONTO_OUTROS: TFloatField
      FieldName = 'DESCONTO_OUTROS'
    end
    object CdsItensCompraDIASSEMVENDER: TStringField
      FieldName = 'DIASSEMVENDER'
      Size = 1
    end
    object CdsItensCompraCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object CdsItensCompraVALORICMSSUBTITUICAO: TFloatField
      FieldName = 'VALORICMSSUBTITUICAO'
    end
    object CdsItensCompraCUSTO_APLICADO: TFloatField
      FieldName = 'CUSTO_APLICADO'
    end
    object CdsItensCompraMARGEM_VALOR_AGREGADO: TFloatField
      FieldName = 'MARGEM_VALOR_AGREGADO'
    end
    object CdsItensCompraREDUCAO_ICMS_ST: TFloatField
      FieldName = 'REDUCAO_ICMS_ST'
    end
    object CdsItensCompraPERCENTUAL_ICMS_ST: TFloatField
      FieldName = 'PERCENTUAL_ICMS_ST'
    end
    object CdsItensCompraPIS_CST: TStringField
      FieldName = 'PIS_CST'
      Size = 3
    end
    object CdsItensCompraPIS_BASE_CALCULO: TFloatField
      FieldName = 'PIS_BASE_CALCULO'
    end
    object CdsItensCompraPIS_PERCENTUAL: TFloatField
      FieldName = 'PIS_PERCENTUAL'
    end
    object CdsItensCompraPIS_VALOR: TFloatField
      FieldName = 'PIS_VALOR'
    end
    object CdsItensCompraCOFINS_CST: TStringField
      FieldName = 'COFINS_CST'
      Size = 3
    end
    object CdsItensCompraCOFINS_BASE_CALCULO: TFloatField
      FieldName = 'COFINS_BASE_CALCULO'
    end
    object CdsItensCompraCOFINS_PERCENTUAL: TFloatField
      FieldName = 'COFINS_PERCENTUAL'
    end
    object CdsItensCompraCOFINS_VALOR: TFloatField
      FieldName = 'COFINS_VALOR'
    end
    object CdsItensCompraVALOR_OUTRASDESPESAS: TFloatField
      FieldName = 'VALOR_OUTRASDESPESAS'
    end
    object CdsItensCompraVALOR_SEGURO: TFloatField
      FieldName = 'VALOR_SEGURO'
    end
    object CdsItensCompraVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object CdsItensCompraVALOR_ISENTO: TFloatField
      FieldName = 'VALOR_ISENTO'
    end
    object CdsItensCompraVALOR_OUTRAS: TFloatField
      FieldName = 'VALOR_OUTRAS'
    end
    object CdsItensCompraBASECALCULO_IPI: TFloatField
      FieldName = 'BASECALCULO_IPI'
    end
    object CdsItensCompraCST_IPI: TIntegerField
      FieldName = 'CST_IPI'
    end
    object CdsItensCompraNATUREZA_ISENTA_PIS: TStringField
      FieldName = 'NATUREZA_ISENTA_PIS'
      Size = 100
    end
    object CdsItensCompraNATUREZA_ISENTA_COFINS: TStringField
      FieldName = 'NATUREZA_ISENTA_COFINS'
      Size = 100
    end
    object CdsItensCompraCEST: TStringField
      FieldName = 'CEST'
      Size = 100
    end
    object CdsItensCompraBASECALCULOFCP: TFMTBCDField
      FieldName = 'BASECALCULOFCP'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraALIQUOTAFCP: TFMTBCDField
      FieldName = 'ALIQUOTAFCP'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraVALORFCP: TFMTBCDField
      FieldName = 'VALORFCP'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraBASECALCULOFCPST: TFMTBCDField
      FieldName = 'BASECALCULOFCPST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraALIQUOTAFCPST: TFMTBCDField
      FieldName = 'ALIQUOTAFCPST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraVALORFCPST: TFMTBCDField
      FieldName = 'VALORFCPST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraBASECALCULOFCPSTRET: TFMTBCDField
      FieldName = 'BASECALCULOFCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraALIQUOTAFCPSTRET: TFMTBCDField
      FieldName = 'ALIQUOTAFCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraVALORFCPSTRET: TFMTBCDField
      FieldName = 'VALORFCPSTRET'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraBASEICMSSUBSTITUICAORET: TFMTBCDField
      FieldName = 'BASEICMSSUBSTITUICAORET'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraPERCENTUAL_ICMS_ST_RET: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST_RET'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraVALORICMSSUBSTITUICAORET: TFMTBCDField
      FieldName = 'VALORICMSSUBSTITUICAORET'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraNCM: TStringField
      FieldName = 'NCM'
    end
    object CdsItensCompraORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsItensCompraINFORMACOESADICIONAIS: TStringField
      FieldName = 'INFORMACOESADICIONAIS'
      Size = 500
    end
    object CdsItensCompraMODALIDADEBC: TIntegerField
      FieldName = 'MODALIDADEBC'
    end
    object CdsItensCompraMODALIDADEBCST: TIntegerField
      FieldName = 'MODALIDADEBCST'
    end
    object CdsItensCompraICMSBCUFDEST: TFMTBCDField
      FieldName = 'ICMSBCUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSBCFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSBCFCPUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSPERCENTUALFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSPERCENTUALFCPUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSVALORFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSVALORFCPUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSPERCENTUALINTER: TFMTBCDField
      FieldName = 'ICMSPERCENTUALINTER'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSPERCENTUALUFDEST: TFMTBCDField
      FieldName = 'ICMSPERCENTUALUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSVALORUFREMET: TFMTBCDField
      FieldName = 'ICMSVALORUFREMET'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSVALORUFDEST: TFMTBCDField
      FieldName = 'ICMSVALORUFDEST'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraICMSPERCENTUALINTERPART: TFMTBCDField
      FieldName = 'ICMSPERCENTUALINTERPART'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraCODIGOANVISA: TStringField
      FieldName = 'CODIGOANVISA'
      Size = 15
    end
    object CdsItensCompraPMC: TFMTBCDField
      FieldName = 'PMC'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraCODIGOBENEFICIO: TStringField
      FieldName = 'CODIGOBENEFICIO'
      Size = 10
    end
    object CdsItensCompraMOTIVODESONERACAO: TStringField
      FieldName = 'MOTIVODESONERACAO'
      Size = 100
    end
    object CdsItensCompraVALORDESONERACAO: TFMTBCDField
      FieldName = 'VALORDESONERACAO'
      Precision = 18
      Size = 2
    end
    object CdsItensCompraPERCENTUALDESONERACAO: TFMTBCDField
      FieldName = 'PERCENTUALDESONERACAO'
      Precision = 18
      Size = 2
    end
  end
  object SqlPrecosEspeciais: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' PRECOS_ESPECIAIS'#13#10'WHERE'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 493
    Top = 101
  end
  object DspPrecosEspeciais: TDataSetProvider
    DataSet = SqlPrecosEspeciais
    Left = 493
    Top = 136
  end
  object CdsPrecosEspeciais: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrecosEspeciais'
    Left = 493
    Top = 171
    object CdsPrecosEspeciaisCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsPrecosEspeciaisID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsPrecosEspeciaisCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsPrecosEspeciaisPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object CdsPrecosEspeciaisPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
  end
  object CdsProdut: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 426
    Top = 9
  end
  object SqlDeletados: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' DELETADOS'#13#10'WHERE'#13#10' CD_FILIAL  = :CD_FILIAL A' +
      'ND'#13#10' TABELA LIKE :TABELA AND'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 551
    Top = 101
  end
  object DspDeletados: TDataSetProvider
    DataSet = SqlDeletados
    Left = 551
    Top = 136
  end
  object CdsDeletados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end>
    ProviderName = 'DspDeletados'
    Left = 551
    Top = 171
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
  object CdsOperadores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 498
    Top = 8
  end
  object SqlPlanoContas: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' PLANO_CONTAS.*'#13#10'FROM '#13#10' PLANO_CONTAS,'#13#10' TEMP_PRODUTOS'#13#10 +
      'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS' +
      '.PROCESSO = 109 AND'#13#10' PLANO_CONTAS.CD_PLANO_CONTAS = TEMP_PRODUT' +
      'OS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 42
    Top = 224
  end
  object SqlConvenios: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' * '#13#10'FROM'#13#10' CONVENIOS'#13#10'WHERE'#13#10' DT_FICHA >= CURRENT_DATE ' +
      '- 3 OR'#13#10' DT_ALTERACAO >= CURRENT_DATE - 5'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 180
    Top = 224
  end
  object SqlTransportadoras: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' TRANSPORTADORAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 249
    Top = 224
  end
  object SqlCartoes: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' CARTOES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 316
    Top = 224
  end
  object SqlDistribuidores: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' DISTINCT DISTRIBUIDORES.*'#13#10'FROM'#13#10' DISTRIBUIDORES,'#13#10' TEM' +
      'P_PRODUTOS'#13#10'WHERE'#13#10'  TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' ' +
      ' TEMP_PRODUTOS.PROCESSO = 114 AND'#13#10'  DISTRIBUIDORES.CD_DISTRIBUI' +
      'DOR = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 393
    Top = 224
  end
  object SqlFiliais: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'CD_FILIAL,'#13#10'NOME,'#13#10'RAZAO,'#13#10'CNPJ,'#13#10'INSCRICAO,'#13#10'RUA,'#13#10'NUME' +
      'RO,'#13#10'COMPLEMENTO,'#13#10'BAIRRO,'#13#10'CIDADE,'#13#10'UF,'#13#10'CEP,'#13#10'FONE,'#13#10'FONE_1,'#13#10 +
      'FAX,'#13#10'CONTATO,'#13#10'CD_DISTRIBUIDOR,'#13#10'CD_CLIENTE,'#13#10'ENDERECOWEB,'#13#10'EXP' +
      'ORTAR,'#13#10'METROSQUADRADOS,'#13#10'NUMEROFUNCIONARIOS,'#13#10'NUMEROPDVS,'#13#10'STAT' +
      'US,'#13#10'CD_MUNICIPIO,'#13#10'IFOOD_CLIENT_ID,'#13#10'IFOOD_CLIENT_SECRET,'#13#10'IFOO' +
      'D_ID_LOJA,'#13#10'IFOOD_PRECO_PRATICADO,'#13#10'IFOOD_QNTD_ENVIO,'#13#10'IFOOD_VEN' +
      'DEDOR,'#13#10'FARMACIASAPP_CLIENT_ID,'#13#10'FARMACIASAPP_CLIENT_SECRET,'#13#10'FA' +
      'RMACIASAPP_ID_LOJA,'#13#10'FARMACIASAPP_PRECO_PRATICADO,'#13#10'FARMACIASAPP' +
      '_QNTD_ENVIO,'#13#10'FARMACIASAPP_VENDEDOR'#13#10'FROM'#13#10' FILIAIS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 453
    Top = 224
  end
  object SqlFormasPagamento: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' FORMAS_PAGAMENTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 520
    Top = 224
  end
  object DspPlanoContas: TDataSetProvider
    DataSet = SqlPlanoContas
    Left = 42
    Top = 258
  end
  object DspConvenios: TDataSetProvider
    DataSet = SqlConvenios
    Left = 180
    Top = 258
  end
  object DspTransportadoras: TDataSetProvider
    DataSet = SqlTransportadoras
    Left = 249
    Top = 258
  end
  object DspCartoes: TDataSetProvider
    DataSet = SqlCartoes
    Left = 316
    Top = 258
  end
  object DspDistribuidores: TDataSetProvider
    DataSet = SqlDistribuidores
    Left = 393
    Top = 258
  end
  object DspFiliais: TDataSetProvider
    DataSet = SqlFiliais
    Left = 453
    Top = 258
  end
  object DspFormasPagamento: TDataSetProvider
    DataSet = SqlFormasPagamento
    Left = 520
    Top = 258
  end
  object CdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPlanoContas'
    Left = 42
    Top = 293
    object CdsPlanoContasCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
      Required = True
    end
    object CdsPlanoContasCD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Required = True
      Size = 10
    end
    object CdsPlanoContasHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 30
    end
    object CdsPlanoContasGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object CdsPlanoContasSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 1
    end
    object CdsPlanoContasTIPO_CONTA: TStringField
      FieldName = 'TIPO_CONTA'
      Size = 1
    end
    object CdsPlanoContasENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsConvenios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConvenios'
    Left = 180
    Top = 293
    object CdsConveniosCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
      Required = True
    end
    object CdsConveniosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 51
    end
    object CdsConveniosRAZAO: TStringField
      FieldName = 'RAZAO'
    end
    object CdsConveniosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 41
    end
    object CdsConveniosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 21
    end
    object CdsConveniosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 36
    end
    object CdsConveniosUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object CdsConveniosCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsConveniosCAIXA_POSTAL: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 6
    end
    object CdsConveniosFONE: TStringField
      FieldName = 'FONE'
      Size = 31
    end
    object CdsConveniosFAX: TStringField
      FieldName = 'FAX'
      Size = 31
    end
    object CdsConveniosCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 31
    end
    object CdsConveniosCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object CdsConveniosIE: TStringField
      FieldName = 'IE'
      Size = 16
    end
    object CdsConveniosPRACA: TStringField
      FieldName = 'PRACA'
      Size = 7
    end
    object CdsConveniosDT_FICHA: TDateField
      FieldName = 'DT_FICHA'
    end
    object CdsConveniosRG: TStringField
      FieldName = 'RG'
      Size = 11
    end
    object CdsConveniosCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object CdsConveniosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 51
    end
    object CdsConveniosFONE_COMERCIAL: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 31
    end
    object CdsConveniosCEP_COMERCIAL: TStringField
      FieldName = 'CEP_COMERCIAL'
      Size = 10
    end
    object CdsConveniosCIDADE_COMERCIAL: TStringField
      FieldName = 'CIDADE_COMERCIAL'
      Size = 36
    end
    object CdsConveniosUF_COMERCIAL: TStringField
      FieldName = 'UF_COMERCIAL'
      Size = 3
    end
    object CdsConveniosREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 51
    end
    object CdsConveniosREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 51
    end
    object CdsConveniosDT_CONSULTA_SPC: TDateField
      FieldName = 'DT_CONSULTA_SPC'
    end
    object CdsConveniosOBS_SPC: TStringField
      FieldName = 'OBS_SPC'
      Size = 41
    end
    object CdsConveniosTIPO_ATIVIDADE: TStringField
      FieldName = 'TIPO_ATIVIDADE'
      Size = 7
    end
    object CdsConveniosOBS_GERAL: TMemoField
      FieldName = 'OBS_GERAL'
      BlobType = ftMemo
      Size = 8
    end
    object CdsConveniosCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsConveniosENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 41
    end
    object CdsConveniosBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 21
    end
    object CdsConveniosCIDADE_COBRANCA: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Size = 36
    end
    object CdsConveniosUF_COBRANCA: TStringField
      FieldName = 'UF_COBRANCA'
      Size = 3
    end
    object CdsConveniosCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      Size = 10
    end
    object CdsConveniosICM_IPI: TFloatField
      FieldName = 'ICM_IPI'
    end
    object CdsConveniosFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object CdsConveniosLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object CdsConveniosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 46
    end
    object CdsConveniosHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 51
    end
    object CdsConveniosMULTI: TStringField
      FieldName = 'MULTI'
      Size = 1
    end
    object CdsConveniosTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsConveniosDT_VENCIMENTO: TFloatField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsConveniosSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object CdsConveniosJAN: TFloatField
      FieldName = 'JAN'
    end
    object CdsConveniosFEV: TFloatField
      FieldName = 'FEV'
    end
    object CdsConveniosMAR: TFloatField
      FieldName = 'MAR'
    end
    object CdsConveniosABR: TFloatField
      FieldName = 'ABR'
    end
    object CdsConveniosMAI: TFloatField
      FieldName = 'MAI'
    end
    object CdsConveniosJUN: TFloatField
      FieldName = 'JUN'
    end
    object CdsConveniosJUL: TFloatField
      FieldName = 'JUL'
    end
    object CdsConveniosAGO: TFloatField
      FieldName = 'AGO'
    end
    object CdsConveniosSET_: TFloatField
      FieldName = 'SET_'
    end
    object CdsConveniosOUT: TFloatField
      FieldName = 'OUT'
    end
    object CdsConveniosNOV: TFloatField
      FieldName = 'NOV'
    end
    object CdsConveniosDEZ: TFloatField
      FieldName = 'DEZ'
    end
    object CdsConveniosDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsConveniosUSUARIOSITE: TStringField
      FieldName = 'USUARIOSITE'
      Size = 16
    end
    object CdsConveniosSENHASITE: TStringField
      FieldName = 'SENHASITE'
      Size = 16
    end
    object CdsConveniosPERMITEPARCELAMENTO: TStringField
      FieldName = 'PERMITEPARCELAMENTO'
      Size = 1
    end
    object CdsConveniosPAGACOMISSAO: TStringField
      FieldName = 'PAGACOMISSAO'
      Size = 1
    end
    object CdsConveniosDT_FECHAMENTO: TFloatField
      FieldName = 'DT_FECHAMENTO'
    end
    object CdsConveniosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsConveniosPAGAAVISTA: TStringField
      FieldName = 'PAGAAVISTA'
      Size = 1
    end
    object CdsConveniosCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 10
    end
    object CdsConveniosCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object CdsConveniosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object CdsConveniosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsConveniosFATURAFECHADA: TStringField
      FieldName = 'FATURAFECHADA'
      Size = 1
    end
    object CdsConveniosEXIBIRDADOSCLIENTECOMPROVANTE: TStringField
      FieldName = 'EXIBIRDADOSCLIENTECOMPROVANTE'
      Size = 1
    end
  end
  object CdsTransportadoras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspTransportadoras'
    Left = 249
    Top = 293
    object CdsTransportadorasCD_TRANSPORTADORA: TFloatField
      FieldName = 'CD_TRANSPORTADORA'
      Required = True
    end
    object CdsTransportadorasNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object CdsTransportadorasRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 40
    end
    object CdsTransportadorasCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsTransportadorasINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 10
    end
    object CdsTransportadorasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CdsTransportadorasCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsTransportadorasFONE: TStringField
      FieldName = 'FONE'
      Size = 40
    end
    object CdsTransportadorasCONTATO: TStringField
      FieldName = 'CONTATO'
    end
    object CdsTransportadorasDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsTransportadorasENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCartoes'
    Left = 316
    Top = 293
    object CdsCartoesCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object CdsCartoesCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object CdsCartoesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsCartoesTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Size = 1
    end
    object CdsCartoesTX_ADM: TFloatField
      FieldName = 'TX_ADM'
    end
    object CdsCartoesTX_ADM_PARC: TFloatField
      FieldName = 'TX_ADM_PARC'
    end
    object CdsCartoesPRAZO_PG: TFloatField
      FieldName = 'PRAZO_PG'
    end
    object CdsCartoesIMAGEM: TFloatField
      FieldName = 'IMAGEM'
    end
    object CdsCartoesUSATEF: TStringField
      FieldName = 'USATEF'
      Size = 1
    end
    object CdsCartoesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsDistribuidores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspDistribuidores'
    Left = 393
    Top = 293
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
      Size = 45
    end
    object CdsDistribuidoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
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
      Size = 8
    end
    object CdsDistribuidoresVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 60
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
      Size = 8
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
    object CdsDistribuidoresCODIGODICIONARIO: TFloatField
      FieldName = 'CODIGODICIONARIO'
    end
    object CdsDistribuidoresCODIGOFATURAMENTO: TStringField
      FieldName = 'CODIGOFATURAMENTO'
      Size = 10
    end
    object CdsDistribuidoresARQUIVO_ENVIO: TStringField
      FieldName = 'ARQUIVO_ENVIO'
      Size = 12
    end
    object CdsDistribuidoresARQUIVO_RETORNO: TStringField
      FieldName = 'ARQUIVO_RETORNO'
      Size = 12
    end
    object CdsDistribuidoresPROGRAMAENVIO: TStringField
      FieldName = 'PROGRAMAENVIO'
      Size = 255
    end
    object CdsDistribuidoresCFOP: TFloatField
      FieldName = 'CFOP'
    end
    object CdsDistribuidoresCD_MUNICIPIO: TFloatField
      FieldName = 'CD_MUNICIPIO'
    end
    object CdsDistribuidoresCD_PAIS: TFloatField
      FieldName = 'CD_PAIS'
    end
    object CdsDistribuidoresCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object CdsDistribuidoresNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsDistribuidoresSOMAICMSSUBSTITUICAO: TStringField
      FieldName = 'SOMAICMSSUBSTITUICAO'
      Size = 1
    end
    object CdsDistribuidoresSOMAIPI: TStringField
      FieldName = 'SOMAIPI'
      Size = 1
    end
    object CdsDistribuidoresSOMAFRETE: TStringField
      FieldName = 'SOMAFRETE'
      Size = 1
    end
    object CdsDistribuidoresSOMASEGURO: TStringField
      FieldName = 'SOMASEGURO'
      Size = 1
    end
    object CdsDistribuidoresSOMAOUTRASDESPESAS: TStringField
      FieldName = 'SOMAOUTRASDESPESAS'
      Size = 1
    end
    object CdsDistribuidoresUSAFTP: TStringField
      FieldName = 'USAFTP'
      Size = 1
    end
    object CdsDistribuidoresFTPHOST: TStringField
      FieldName = 'FTPHOST'
      Size = 1000
    end
    object CdsDistribuidoresFTPUSUARIO: TStringField
      FieldName = 'FTPUSUARIO'
      Size = 100
    end
    object CdsDistribuidoresFTPSENHA: TStringField
      FieldName = 'FTPSENHA'
      Size = 100
    end
    object CdsDistribuidoresFTPDIRETORIOENVIO: TStringField
      FieldName = 'FTPDIRETORIOENVIO'
      Size = 100
    end
    object CdsDistribuidoresFTPDIRETORIORETORNO: TStringField
      FieldName = 'FTPDIRETORIORETORNO'
      Size = 100
    end
    object CdsDistribuidoresCONCLUSAONFSEMBOLETO: TStringField
      FieldName = 'CONCLUSAONFSEMBOLETO'
      Size = 1
    end
    object CdsDistribuidoresTAXABOLETO: TFMTBCDField
      FieldName = 'TAXABOLETO'
      Precision = 18
      Size = 2
    end
  end
  object CdsFiliais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFiliais'
    Left = 453
    Top = 293
    object CdsFiliaisCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsFiliaisNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object CdsFiliaisRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 40
    end
    object CdsFiliaisCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsFiliaisINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 13
    end
    object CdsFiliaisRUA: TStringField
      FieldName = 'RUA'
      Size = 100
    end
    object CdsFiliaisNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsFiliaisCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 255
    end
    object CdsFiliaisBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsFiliaisCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object CdsFiliaisUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsFiliaisCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsFiliaisFONE: TStringField
      FieldName = 'FONE'
      Size = 10
    end
    object CdsFiliaisFONE_1: TStringField
      FieldName = 'FONE_1'
      Size = 10
    end
    object CdsFiliaisFAX: TStringField
      FieldName = 'FAX'
      Size = 8
    end
    object CdsFiliaisCONTATO: TStringField
      FieldName = 'CONTATO'
    end
    object CdsFiliaisCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
    end
    object CdsFiliaisCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsFiliaisENDERECOWEB: TStringField
      FieldName = 'ENDERECOWEB'
      Size = 100
    end
    object CdsFiliaisEXPORTAR: TStringField
      FieldName = 'EXPORTAR'
      Size = 1
    end
    object CdsFiliaisMETROSQUADRADOS: TFloatField
      FieldName = 'METROSQUADRADOS'
    end
    object CdsFiliaisNUMEROFUNCIONARIOS: TFloatField
      FieldName = 'NUMEROFUNCIONARIOS'
    end
    object CdsFiliaisNUMEROPDVS: TFloatField
      FieldName = 'NUMEROPDVS'
    end
    object CdsFiliaisSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsFiliaisCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 10
    end
    object CdsFiliaisIFOOD_CLIENT_ID: TStringField
      FieldName = 'IFOOD_CLIENT_ID'
      Size = 250
    end
    object CdsFiliaisIFOOD_CLIENT_SECRET: TStringField
      FieldName = 'IFOOD_CLIENT_SECRET'
      Size = 250
    end
    object CdsFiliaisIFOOD_ID_LOJA: TStringField
      FieldName = 'IFOOD_ID_LOJA'
      Size = 25
    end
    object CdsFiliaisIFOOD_PRECO_PRATICADO: TStringField
      FieldName = 'IFOOD_PRECO_PRATICADO'
      Size = 3
    end
    object CdsFiliaisIFOOD_QNTD_ENVIO: TIntegerField
      FieldName = 'IFOOD_QNTD_ENVIO'
    end
    object CdsFiliaisIFOOD_VENDEDOR: TIntegerField
      FieldName = 'IFOOD_VENDEDOR'
    end
    object CdsFiliaisFARMACIASAPP_CLIENT_ID: TStringField
      FieldName = 'FARMACIASAPP_CLIENT_ID'
      Size = 250
    end
    object CdsFiliaisFARMACIASAPP_CLIENT_SECRET: TStringField
      FieldName = 'FARMACIASAPP_CLIENT_SECRET'
      Size = 250
    end
    object CdsFiliaisFARMACIASAPP_ID_LOJA: TStringField
      FieldName = 'FARMACIASAPP_ID_LOJA'
      Size = 25
    end
    object CdsFiliaisFARMACIASAPP_PRECO_PRATICADO: TStringField
      FieldName = 'FARMACIASAPP_PRECO_PRATICADO'
      Size = 3
    end
    object CdsFiliaisFARMACIASAPP_QNTD_ENVIO: TIntegerField
      FieldName = 'FARMACIASAPP_QNTD_ENVIO'
    end
    object CdsFiliaisFARMACIASAPP_VENDEDOR: TIntegerField
      FieldName = 'FARMACIASAPP_VENDEDOR'
    end
  end
  object CdsFormasPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFormasPagamento'
    Left = 520
    Top = 293
    object CdsFormasPagamentoCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Required = True
    end
    object CdsFormasPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object CdsFormasPagamentoARREDONDAMENTO: TStringField
      FieldName = 'ARREDONDAMENTO'
      Size = 16
    end
    object CdsFormasPagamentoARREDONDA: TStringField
      FieldName = 'ARREDONDA'
      Size = 1
    end
    object CdsFormasPagamentoINDICE_R: TFloatField
      FieldName = 'INDICE_R'
    end
    object CdsFormasPagamentoINDICE_M: TFloatField
      FieldName = 'INDICE_M'
    end
    object CdsFormasPagamentoLOCALECF: TStringField
      FieldName = 'LOCALECF'
      Size = 2
    end
    object CdsFormasPagamentoAVISTA: TStringField
      FieldName = 'AVISTA'
      Size = 1
    end
    object CdsFormasPagamentoPERMITE_DESCONTO: TStringField
      FieldName = 'PERMITE_DESCONTO'
      Size = 1
    end
    object CdsFormasPagamentoJUROSPARCELAMENTO: TStringField
      FieldName = 'JUROSPARCELAMENTO'
      Size = 1
    end
    object CdsFormasPagamentoPARCELAINICIAL: TFloatField
      FieldName = 'PARCELAINICIAL'
    end
    object CdsFormasPagamentoJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object CdsFormasPagamentoNUMEROVIAS: TFloatField
      FieldName = 'NUMEROVIAS'
    end
    object CdsFormasPagamentoPAGAMENTOCOMISSAOAVISTA: TStringField
      FieldName = 'PAGAMENTOCOMISSAOAVISTA'
      Size = 1
    end
  end
  object CdsEntregas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 577
    Top = 8
  end
  object CdsCeTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 706
    Top = 8
  end
  object CdsCeItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 770
    Top = 8
  end
  object SqlTransfer: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' * '#13#10'FROM '#13#10' TRANSFER '#13#10'WHERE '#13#10' STATUS <> '#39'A'#39' AND '#13#10' (' +
      'CD_FILIAL_DESTINO = :CD_FILIAL OR CD_FILIAL_ORIGEM = :CD_FILIAL)' +
      ' AND'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 586
    Top = 224
  end
  object DspTransfer: TDataSetProvider
    DataSet = SqlTransfer
    Left = 586
    Top = 256
  end
  object CdsTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspTransfer'
    Left = 586
    Top = 292
    object FloatField1: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object DateField1: TDateField
      FieldName = 'DATA_GERACAO'
    end
    object CdsTransferHORA_GERACAO: TTimeField
      FieldName = 'HORA_GERACAO'
    end
    object DateField2: TDateField
      FieldName = 'DATA_ENVIO'
    end
    object TimeField1: TTimeField
      FieldName = 'HORA_ENVIO'
    end
    object DateField3: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object TimeField2: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object FloatField2: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object FloatField3: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object FloatField4: TFloatField
      FieldName = 'CD_USUARIO_ORIGEM'
    end
    object FloatField5: TFloatField
      FieldName = 'CD_USUARIO_DESTINO'
    end
    object StringField1: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object StringField2: TStringField
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
  object SqlItensTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_TRANSFER.*'#13#10'FROM'#13#10' TRANSFER, '#13#10' ITENS_TRANSFER'#13#10'W' +
      'HERE'#13#10' TRANSFER.CD_TRANSFER = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' T' +
      'RANSFER.STATUS <> '#39'A'#39' AND '#13#10' (TRANSFER.CD_FILIAL_DESTINO = :CD_F' +
      'ILIAL OR TRANSFER.CD_FILIAL_ORIGEM = :CD_FILIAL) AND'#13#10' TRANSFER.' +
      'ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 650
    Top = 224
  end
  object DspItensTransfer: TDataSetProvider
    DataSet = SqlItensTransfer
    Left = 650
    Top = 256
  end
  object CdsItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspItensTransfer'
    Left = 650
    Top = 292
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
    object CdsItensTransferCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
  end
  object CdsCadernoFaltas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 850
    Top = 8
  end
  object SqlPrecos: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'  FIRST 2000'#13#10'  PRODUTOS.ID_PRODUTO, '#13#10'  PRODUTOS.CD_PR' +
      'ODUTO, '#13#10'  PRODUTOS.CD_GRUPO, '#13#10'  PRODUTOS.CD_LABORATORIO, '#13#10'  P' +
      'RODUTOS.CD_CLASSE, '#13#10'  PRODUTOS.CD_LISTA, '#13#10'  PRODUTOS.PRINCIPIO' +
      'ATIVO, '#13#10'  PRODUTOS.CODIGO_BARRAS_1, '#13#10'  PRODUTOS.CODIGO_BARRAS_' +
      '2, '#13#10'  PRODUTOS.DESCRICAO, '#13#10'  PRODUTOS.TIPO_PRODUTO, '#13#10'  PRODUT' +
      'OS.UNIDADE, '#13#10'  PRODUTOS.STATUS, '#13#10'  PRODUTOS.QT_EMBALAGEM, '#13#10'  ' +
      'PRODUTOS.ESTOQUE_1, '#13#10'  PRODUTOS.ESTOQUE_2, '#13#10'  PRODUTOS.ESTOQUE' +
      '_3, '#13#10'  PRODUTOS.ESTOQUE_4, '#13#10'  PRODUTOS.ESTOQUE_5, '#13#10'  PRODUTOS' +
      '.ESTOQUE_6, '#13#10'  PRODUTOS.ESTOQUE_7, '#13#10'  PRODUTOS.ESTOQUE_8, '#13#10'  ' +
      'PRODUTOS.ESTOQUE_9, '#13#10'  PRODUTOS.ESTOQUE_10,'#13#10'  PRODUTOS.ESTOQUE' +
      '_11,'#13#10'  PRODUTOS.ESTOQUE_12,'#13#10'  PRODUTOS.ESTOQUE_13,'#13#10'  PRODUTOS' +
      '.ESTOQUE_14,'#13#10'  PRODUTOS.ESTOQUE_15,'#13#10'  PRODUTOS.ESTOQUE_16,'#13#10'  ' +
      'PRODUTOS.ESTOQUE_17,'#13#10'  PRODUTOS.ESTOQUE_18,'#13#10'  PRODUTOS.ESTOQUE' +
      '_19,'#13#10'  PRODUTOS.ESTOQUE_20,'#13#10'  PRODUTOS.ESTOQUE_21,'#13#10'  PRODUTOS' +
      '.ESTOQUE_22,'#13#10'  PRODUTOS.ESTOQUE_23,'#13#10'  PRODUTOS.ESTOQUE_24,'#13#10'  ' +
      'PRODUTOS.ESTOQUE_25,'#13#10'  PRODUTOS.ESTOQUE_26,'#13#10'  PRODUTOS.ESTOQUE' +
      '_27,'#13#10'  PRODUTOS.ESTOQUE_28,'#13#10'  PRODUTOS.ESTOQUE_29,'#13#10'  PRODUTOS' +
      '.ESTOQUE_30,'#13#10'  PRODUTOS.ID_FAMILIA,'#13#10'  PRODUTOS.MARGEM_PROMOCAO' +
      ','#13#10'  PRODUTOS.USOCONTINUO,'#13#10'  PRODUTOS.COMISSAO,'#13#10'  PRODUTOS.TX_' +
      'DESCONTO,'#13#10'  PRODUTOS.COMPRIMIDOSCAIXA,'#13#10'  PRODUTOS.CD_GRUPOBALA' +
      'NCO,'#13#10'  PRODUTOS.CD_GRUPOCOMPRA,'#13#10'  PRODUTOS.CONTROLADO,'#13#10'  PROD' +
      'UTOS.PIS_COFINS,'#13#10'  PRODUTOS.NCM,'#13#10'  PRODUTOS.ICMS,'#13#10'  PRODUTOS.' +
      'GENERICO,'#13#10'  PRODUTOS.ESTOQUE_MINIMO_1 AS ESTOQUE_MINIMO,'#13#10'  PRO' +
      'DUTOS.ESTOQUE_MAXIMO_1 AS ESTOQUE_MAXIMO,'#13#10'  PRODUTOS.MEDIAF_1 A' +
      'S MEDIAF,'#13#10'  PRODUTOS.CURVA_UNITARIA_1 AS CURVA_UNITARIA,'#13#10'  PRO' +
      'DUTOS.CURVA_FINANCEIRA_1 AS CURVA_FINANCEIRA,'#13#10'  PRODUTOS.ORIGEM' +
      ','#13#10'  PRODUTOS.CSOSN,'#13#10'  PRODUTOS.SITUACAOTRIBUTARIA,'#13#10'  PRODUTOS' +
      '.IDENTIFICADOR,'#13#10'  PRODUTOS.MARGEM, '#13#10'  PRODUTOS.CEST,'#13#10'  PRODUT' +
      'OS.CD_PRINCIPIO,'#13#10'  PRODUTOS.COMPOSTO,'#13#10'  PRODUTOS.OBSERVACAO'#13#10'F' +
      'ROM '#13#10' PRODUTOS,'#13#10' TEMP_PRODUTOS'#13#10'WHERE '#13#10' TEMP_PRODUTOS.CD_FILI' +
      'AL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS.PROCESSO = 119 AND'#13#10' PRODUTO' +
      'S.ID_PRODUTO = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 610
    Top = 104
  end
  object DspPrecos: TDataSetProvider
    DataSet = SqlPrecos
    Left = 610
    Top = 136
  end
  object CdsPrecos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrecos'
    Left = 610
    Top = 168
    object CdsPrecosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsPrecosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsPrecosCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsPrecosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsPrecosCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsPrecosCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object CdsPrecosCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object CdsPrecosCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 13
    end
    object CdsPrecosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsPrecosTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 2
    end
    object CdsPrecosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object CdsPrecosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsPrecosQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsPrecosESTOQUE_1: TFloatField
      FieldName = 'ESTOQUE_1'
    end
    object CdsPrecosESTOQUE_2: TFloatField
      FieldName = 'ESTOQUE_2'
    end
    object CdsPrecosESTOQUE_3: TFloatField
      FieldName = 'ESTOQUE_3'
    end
    object CdsPrecosESTOQUE_4: TFloatField
      FieldName = 'ESTOQUE_4'
    end
    object CdsPrecosESTOQUE_5: TFloatField
      FieldName = 'ESTOQUE_5'
    end
    object CdsPrecosESTOQUE_6: TFloatField
      FieldName = 'ESTOQUE_6'
    end
    object CdsPrecosESTOQUE_7: TFloatField
      FieldName = 'ESTOQUE_7'
    end
    object CdsPrecosESTOQUE_8: TFloatField
      FieldName = 'ESTOQUE_8'
    end
    object CdsPrecosESTOQUE_9: TFloatField
      FieldName = 'ESTOQUE_9'
    end
    object CdsPrecosESTOQUE_10: TFloatField
      FieldName = 'ESTOQUE_10'
    end
    object CdsPrecosESTOQUE_11: TFloatField
      FieldName = 'ESTOQUE_11'
    end
    object CdsPrecosESTOQUE_12: TFloatField
      FieldName = 'ESTOQUE_12'
    end
    object CdsPrecosESTOQUE_13: TFloatField
      FieldName = 'ESTOQUE_13'
    end
    object CdsPrecosESTOQUE_14: TFloatField
      FieldName = 'ESTOQUE_14'
    end
    object CdsPrecosESTOQUE_15: TFloatField
      FieldName = 'ESTOQUE_15'
    end
    object CdsPrecosESTOQUE_16: TFloatField
      FieldName = 'ESTOQUE_16'
    end
    object CdsPrecosESTOQUE_17: TFloatField
      FieldName = 'ESTOQUE_17'
    end
    object CdsPrecosESTOQUE_18: TFloatField
      FieldName = 'ESTOQUE_18'
    end
    object CdsPrecosESTOQUE_19: TFloatField
      FieldName = 'ESTOQUE_19'
    end
    object CdsPrecosESTOQUE_20: TFloatField
      FieldName = 'ESTOQUE_20'
    end
    object CdsPrecosID_FAMILIA: TFloatField
      FieldName = 'ID_FAMILIA'
    end
    object CdsPrecosMARGEM_PROMOCAO: TFloatField
      FieldName = 'MARGEM_PROMOCAO'
    end
    object CdsPrecosUSOCONTINUO: TStringField
      FieldName = 'USOCONTINUO'
      Size = 1
    end
    object CdsPrecosCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CdsPrecosTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsPrecosCOMPRIMIDOSCAIXA: TFloatField
      FieldName = 'COMPRIMIDOSCAIXA'
    end
    object CdsPrecosPRINCIPIOATIVO: TStringField
      FieldName = 'PRINCIPIOATIVO'
      Size = 1000
    end
    object CdsPrecosCD_GRUPOBALANCO: TFloatField
      FieldName = 'CD_GRUPOBALANCO'
    end
    object CdsPrecosCD_GRUPOCOMPRA: TFloatField
      FieldName = 'CD_GRUPOCOMPRA'
    end
    object CdsPrecosCONTROLADO: TStringField
      FieldName = 'CONTROLADO'
      Size = 1
    end
    object CdsPrecosPIS_COFINS: TStringField
      FieldName = 'PIS_COFINS'
      Size = 1
    end
    object CdsPrecosNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object CdsPrecosICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsPrecosGENERICO: TStringField
      FieldName = 'GENERICO'
      Size = 1
    end
    object CdsPrecosESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object CdsPrecosESTOQUE_MAXIMO: TFloatField
      FieldName = 'ESTOQUE_MAXIMO'
    end
    object CdsPrecosMEDIAF: TFloatField
      FieldName = 'MEDIAF'
    end
    object CdsPrecosCURVA_UNITARIA: TStringField
      FieldName = 'CURVA_UNITARIA'
      Size = 1
    end
    object CdsPrecosCURVA_FINANCEIRA: TStringField
      FieldName = 'CURVA_FINANCEIRA'
      Size = 1
    end
    object CdsPrecosORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsPrecosCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 3
    end
    object CdsPrecosSITUACAOTRIBUTARIA: TStringField
      FieldName = 'SITUACAOTRIBUTARIA'
      Size = 3
    end
    object CdsPrecosIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Size = 1
    end
    object CdsPrecosMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object CdsPrecosESTOQUE_21: TFloatField
      FieldName = 'ESTOQUE_21'
    end
    object CdsPrecosESTOQUE_22: TFloatField
      FieldName = 'ESTOQUE_22'
    end
    object CdsPrecosESTOQUE_23: TFloatField
      FieldName = 'ESTOQUE_23'
    end
    object CdsPrecosESTOQUE_24: TFloatField
      FieldName = 'ESTOQUE_24'
    end
    object CdsPrecosESTOQUE_25: TFloatField
      FieldName = 'ESTOQUE_25'
    end
    object CdsPrecosESTOQUE_26: TFloatField
      FieldName = 'ESTOQUE_26'
    end
    object CdsPrecosESTOQUE_27: TFloatField
      FieldName = 'ESTOQUE_27'
    end
    object CdsPrecosESTOQUE_28: TFloatField
      FieldName = 'ESTOQUE_28'
    end
    object CdsPrecosESTOQUE_29: TFloatField
      FieldName = 'ESTOQUE_29'
    end
    object CdsPrecosESTOQUE_30: TFloatField
      FieldName = 'ESTOQUE_30'
    end
    object CdsPrecosCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object CdsPrecosCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
    end
    object CdsPrecosCOMPOSTO: TStringField
      FieldName = 'COMPOSTO'
      Size = 1
    end
    object CdsPrecosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 1000
    end
  end
  object SqlClasses: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' CLASSES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 666
    Top = 104
  end
  object DspClasses: TDataSetProvider
    DataSet = SqlClasses
    Left = 666
    Top = 132
  end
  object CdsClasses: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClasses'
    Left = 666
    Top = 168
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
    object CdsClassesDT_CALCULOCURVA: TDateField
      FieldName = 'DT_CALCULOCURVA'
    end
    object CdsClassesFREQUENCIA: TIntegerField
      FieldName = 'FREQUENCIA'
    end
    object CdsClassesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsClassesNPRODUTOS: TFloatField
      FieldName = 'NPRODUTOS'
    end
    object CdsClassesNITENS: TFloatField
      FieldName = 'NITENS'
    end
    object CdsClassesVPRODUTOS: TFloatField
      FieldName = 'VPRODUTOS'
    end
    object CdsClassesCPRODUTOS: TFloatField
      FieldName = 'CPRODUTOS'
    end
    object CdsClassesCONTROLALOTES: TStringField
      FieldName = 'CONTROLALOTES'
      Size = 1
    end
  end
  object SqlLog: TSQLDataSet
    CommandText = 'SELECT '#13#10' *'#13#10'FROM'#13#10' LOGINTERLIGACAO'#13#10'WHERE '#13#10' ID_LOG IS NULL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 714
    Top = 224
  end
  object DspLog: TDataSetProvider
    DataSet = SqlLog
    Left = 714
    Top = 256
  end
  object CdsLog: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLog'
    Left = 714
    Top = 288
    object CdsLogID_LOG: TFloatField
      FieldName = 'ID_LOG'
    end
    object CdsLogCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsLogIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object CdsLogDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsLogHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsLogCHAVE_ACESSO: TStringField
      FieldName = 'CHAVE_ACESSO'
      Size = 50
    end
    object CdsLogNUMERO_ITENS: TFloatField
      FieldName = 'NUMERO_ITENS'
    end
    object CdsLogNUMERO_UNIDADES: TFloatField
      FieldName = 'NUMERO_UNIDADES'
    end
    object CdsLogTOTAL_CUSTO: TFloatField
      FieldName = 'TOTAL_CUSTO'
    end
    object CdsLogTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
    end
    object CdsLogCLASSES: TFloatField
      FieldName = 'CLASSES'
    end
    object CdsLogGRUPOS: TFloatField
      FieldName = 'GRUPOS'
    end
    object CdsLogLABORATORIOS: TFloatField
      FieldName = 'LABORATORIOS'
    end
    object CdsLogDISTRIBUIDORES: TFloatField
      FieldName = 'DISTRIBUIDORES'
    end
    object CdsLogFAMILIAS: TFloatField
      FieldName = 'FAMILIAS'
    end
    object CdsLogGRUPOSBALANCO: TFloatField
      FieldName = 'GRUPOSBALANCO'
    end
    object CdsLogGRUPOSCOMPRAS: TFloatField
      FieldName = 'GRUPOSCOMPRAS'
    end
    object CdsLogCARTOES: TFloatField
      FieldName = 'CARTOES'
    end
    object CdsLogTOTAL_PROMOCAO: TFloatField
      FieldName = 'TOTAL_PROMOCAO'
    end
    object CdsLogLANCAMENTOS: TFloatField
      FieldName = 'LANCAMENTOS'
    end
    object CdsLogCAIXAS: TFloatField
      FieldName = 'CAIXAS'
    end
    object CdsLogCONTASRECEBER: TFloatField
      FieldName = 'CONTASRECEBER'
    end
  end
  object SqlControle: TSQLDataSet
    CommandText = 'SELECT'#13#10'  *'#13#10'FROM'#13#10'  CONTROLE'#13#10'WHERE'#13#10'  CAMPO LIKE :CAMPO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CAMPO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 290
    Top = 584
  end
  object DspControle: TDataSetProvider
    DataSet = SqlControle
    Left = 290
    Top = 616
  end
  object CdsControle: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CAMPO'
        ParamType = ptInput
      end>
    ProviderName = 'DspControle'
    Left = 290
    Top = 648
    object CdsControleCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 30
    end
    object CdsControleVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object SqlContas_Receber: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONTAS_RECEBER.*'#13#10'FROM'#13#10' CONTAS_RECEBER, TEMP_PRODUTOS2' +
      #13#10'WHERE'#13#10' TEMP_PRODUTOS2.PROCESSO = 121 AND'#13#10' TEMP_PRODUTOS2.CD_' +
      'FILIAL = :CD_FILIAL AND'#13#10' CONTAS_RECEBER.CD_CONTAS_RECEBER = TEM' +
      'P_PRODUTOS2.ID_PRODUTO'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 786
    Top = 224
  end
  object DspContas_Receber: TDataSetProvider
    DataSet = SqlContas_Receber
    Left = 786
    Top = 256
  end
  object CdsContas_Receber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspContas_Receber'
    Left = 786
    Top = 288
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
      Size = 100
    end
    object CdsContas_ReceberTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object CdsContas_ReceberTRNTRANSACAO: TStringField
      FieldName = 'TRNTRANSACAO'
      Size = 12
    end
    object CdsContas_ReceberTRNAUTORIZACAO: TStringField
      FieldName = 'TRNAUTORIZACAO'
      Size = 100
    end
    object CdsContas_ReceberTRNLOTE: TStringField
      FieldName = 'TRNLOTE'
      Size = 10
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
    object CdsContas_ReceberCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
  end
  object SqlClientes: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CLIENTES.*'#13#10'FROM '#13#10' CLIENTES ,'#13#10' TEMP_PRODUTOS2'#13#10'WHERE' +
      ' '#13#10' TEMP_PRODUTOS2.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS2.P' +
      'ROCESSO = 110 AND'#13#10' CLIENTES.CD_CLIENTE = TEMP_PRODUTOS2.ID_PROD' +
      'UTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 114
    Top = 224
  end
  object DspClientes: TDataSetProvider
    DataSet = SqlClientes
    Left = 114
    Top = 256
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspClientes'
    Left = 114
    Top = 288
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
    object CdsClientesCOMPRAOUTRALOJA: TStringField
      FieldName = 'COMPRAOUTRALOJA'
      Size = 1
    end
    object CdsClientesCARTAOFIDELIDADE: TStringField
      FieldName = 'CARTAOFIDELIDADE'
      Size = 100
    end
    object CdsClientesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object CdsClientesCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 10
    end
    object CdsClientesCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object CdsClientesID_PERFIL_CLIENTE: TFloatField
      FieldName = 'ID_PERFIL_CLIENTE'
    end
  end
  object SqlNumeroLancamentos: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(*) '#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAMENTO' +
      ' >= CURRENT_DATE - 1 AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 58
    Top = 344
  end
  object DspNumeroLancamentos: TDataSetProvider
    DataSet = SqlNumeroLancamentos
    Left = 58
    Top = 376
  end
  object SqlNumeroCaixa: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(*) '#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA >= CURRENT_DATE ' +
      '- 1 AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 266
    Top = 344
  end
  object DspNumeroCaixa: TDataSetProvider
    DataSet = SqlNumeroCaixa
    Left = 266
    Top = 376
  end
  object SqlCdLancamento: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CD_LANCAMENTO'#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAM' +
      'ENTO >= CURRENT_DATE - 1 AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 194
    Top = 344
  end
  object DspCd_Lancamento: TDataSetProvider
    DataSet = SqlCdLancamento
    Left = 194
    Top = 376
  end
  object SqlCdCaixa: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CD_CAIXA'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA >= CURRENT_DATE -' +
      ' 1 AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 370
    Top = 344
  end
  object DspCdCaixa: TDataSetProvider
    DataSet = SqlCdCaixa
    Left = 370
    Top = 376
  end
  object CdsNumeroLancamentos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroLancamentos'
    Left = 58
    Top = 408
    object CdsNumeroLancamentosCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object CdsCdLancamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspCd_Lancamento'
    Left = 194
    Top = 408
    object CdsCdLancamentoCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object CdsNumeroCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroCaixa'
    Left = 266
    Top = 408
    object CdsNumeroCaixaCOUNT: TIntegerField
      FieldName = 'COUNT'
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
    ProviderName = 'DspCdCaixa'
    Left = 370
    Top = 408
    object CdsCdCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object CdsCRM: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 106
    Top = 48
  end
  object SqlNumeroTransfer: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(*) '#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' (DATA_GERACAO >= C' +
      'URRENT_DATE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - 3)  AND'#13#10 +
      ' (CD_FILIAL_DESTINO = :CD_FILIAL OR CD_FILIAL_ORIGEM = :CD_FILIA' +
      'L)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 434
    Top = 344
  end
  object DspNumeroTransfer: TDataSetProvider
    DataSet = SqlNumeroTransfer
    Left = 434
    Top = 376
  end
  object CdsNumeroTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroTransfer'
    Left = 434
    Top = 408
    object CdsNumeroTransferCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdTransfer: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CD_TRANSFER'#13#10'FROM'#13#10' TRANSFER'#13#10'WHERE'#13#10' (DATA_GERACAO >=' +
      ' CURRENT_DATE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - 3)  AND' +
      #13#10' (CD_FILIAL_DESTINO = :CD_FILIAL OR CD_FILIAL_ORIGEM = :CD_FIL' +
      'IAL)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 498
    Top = 344
  end
  object DspCdTransfer: TDataSetProvider
    DataSet = SqlCdTransfer
    Left = 498
    Top = 376
  end
  object CdsCdTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspCdTransfer'
    Left = 498
    Top = 408
    object CdsCdTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
      Required = True
    end
  end
  object SqlNumeroItensTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' TRANSFER, '#13#10' ITENS_TRANSFER'#13#10'WHERE'#13#10' T' +
      'RANSFER.CD_TRANSFER = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' (DATA_GER' +
      'ACAO >= CURRENT_DATE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - ' +
      '3)  AND'#13#10' (TRANSFER.CD_FILIAL_DESTINO = :CD_FILIAL OR'#13#10'  TRANSFE' +
      'R.CD_FILIAL_ORIGEM = :CD_FILIAL)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 570
    Top = 344
  end
  object DspNumeroItensTransfer: TDataSetProvider
    DataSet = SqlNumeroItensTransfer
    Left = 570
    Top = 376
  end
  object CdsNumeroItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroItensTransfer'
    Left = 570
    Top = 408
    object CdsNumeroItensTransferCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdItensTransfer: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_TRANSFER.CD_TRANSFER,'#13#10' ITENS_TRANSFER.ID_PRODUTO' +
      #13#10'FROM'#13#10' ITENS_TRANSFER,'#13#10' TRANSFER'#13#10'WHERE'#13#10' TRANSFER.CD_TRANSFE' +
      'R = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' (DATA_GERACAO >= CURRENT_DA' +
      'TE - 3 OR'#13#10'  DATA_CONCLUSAO >= CURRENT_DATE - 3)  AND'#13#10' (TRANSFE' +
      'R.CD_FILIAL_DESTINO = :CD_FILIAL OR'#13#10'  TRANSFER.CD_FILIAL_ORIGEM' +
      ' = :CD_FILIAL)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 642
    Top = 344
  end
  object DspCdItensTransfer: TDataSetProvider
    DataSet = SqlCdItensTransfer
    Left = 642
    Top = 376
  end
  object CdsCdItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspCdItensTransfer'
    Left = 642
    Top = 408
    object CdsCdItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object CdsCdItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
  end
  object SqlVendedores_Classes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' VENDEDORES_CLASSES.*'#13#10'FROM'#13#10' VENDEDORES_CLASSES,'#13#10' TEMP' +
      '_PRODUTOS'#13#10'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TE' +
      'MP_PRODUTOS.PROCESSO = 123 AND'#13#10' TEMP_PRODUTOS.ENVIADO = '#39'9'#39' AND' +
      #13#10' VENDEDORES_CLASSES.CD_VENDEDOR = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 714
    Top = 344
  end
  object DspVendedores_Classes: TDataSetProvider
    DataSet = SqlVendedores_Classes
    Left = 714
    Top = 376
  end
  object CdsVendedores_Classes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspVendedores_Classes'
    Left = 714
    Top = 408
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
  object CdsCheques: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 642
    Top = 8
  end
  object SqlNumeroContasReceber: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(*) '#13#10'FROM'#13#10' CONTAS_RECEBER'#13#10'WHERE'#13#10' DT_LANCAMENT' +
      'O = CURRENT_DATE AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 50
    Top = 464
  end
  object DspNumeroContasReceber: TDataSetProvider
    DataSet = SqlNumeroContasReceber
    Left = 50
    Top = 504
  end
  object SqlCdContasReceber: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CD_CONTAS_RECEBER'#13#10'FROM'#13#10' CONTAS_RECEBER'#13#10'WHERE'#13#10' DT_L' +
      'ANCAMENTO = CURRENT_DATE AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 122
    Top = 464
  end
  object DspCdContasReceber: TDataSetProvider
    DataSet = SqlCdContasReceber
    Left = 122
    Top = 504
  end
  object CdsNumeroContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroContasReceber'
    Left = 50
    Top = 536
    object CdsNumeroContasReceberCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object CdsCdContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspCdContasReceber'
    Left = 122
    Top = 536
    object CdsCdContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object SqlConvenios_Classes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONVENIOS_CLASSES.*'#13#10'FROM'#13#10' CONVENIOS_CLASSES,'#13#10' TEMP_P' +
      'RODUTOS'#13#10'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP' +
      '_PRODUTOS.PROCESSO = 124 AND'#13#10' CONVENIOS_CLASSES.CD_CONVENIO = T' +
      'EMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 370
    Top = 464
  end
  object DspConvenios_Classes: TDataSetProvider
    DataSet = SqlConvenios_Classes
    Left = 370
    Top = 504
  end
  object CdsConvenios_Classes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspConvenios_Classes'
    Left = 370
    Top = 536
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
  object SqlPrecoVenda: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 194
    Top = 464
  end
  object DspPrecoVenda: TDataSetProvider
    DataSet = SqlPrecoVenda
    Left = 194
    Top = 504
  end
  object CdsPrecoVenda1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrecoVenda'
    Left = 498
    Top = 49
    object CdsPrecoVenda1ID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsPrecoVenda1PRECO_VENDA_1: TFloatField
      FieldName = 'PRECO_VENDA_1'
    end
    object CdsPrecoVenda1PRECO_VENDA_2: TFloatField
      FieldName = 'PRECO_VENDA_2'
    end
    object CdsPrecoVenda1PRECO_VENDA_3: TFloatField
      FieldName = 'PRECO_VENDA_3'
    end
    object CdsPrecoVenda1PRECO_VENDA_4: TFloatField
      FieldName = 'PRECO_VENDA_4'
    end
    object CdsPrecoVenda1PRECO_VENDA_5: TFloatField
      FieldName = 'PRECO_VENDA_5'
    end
    object CdsPrecoVenda1PRECO_VENDA_6: TFloatField
      FieldName = 'PRECO_VENDA_6'
    end
    object CdsPrecoVenda1PRECO_VENDA_7: TFloatField
      FieldName = 'PRECO_VENDA_7'
    end
    object CdsPrecoVenda1PRECO_VENDA_8: TFloatField
      FieldName = 'PRECO_VENDA_8'
    end
    object CdsPrecoVenda1PRECO_VENDA_9: TFloatField
      FieldName = 'PRECO_VENDA_9'
    end
    object CdsPrecoVenda1PRECO_VENDA_10: TFloatField
      FieldName = 'PRECO_VENDA_10'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_1: TFloatField
      FieldName = 'PRECO_PROMOCAO_1'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_2: TFloatField
      FieldName = 'PRECO_PROMOCAO_2'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_3: TFloatField
      FieldName = 'PRECO_PROMOCAO_3'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_4: TFloatField
      FieldName = 'PRECO_PROMOCAO_4'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_5: TFloatField
      FieldName = 'PRECO_PROMOCAO_5'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_6: TFloatField
      FieldName = 'PRECO_PROMOCAO_6'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_7: TFloatField
      FieldName = 'PRECO_PROMOCAO_7'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_8: TFloatField
      FieldName = 'PRECO_PROMOCAO_8'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_9: TFloatField
      FieldName = 'PRECO_PROMOCAO_9'
    end
    object CdsPrecoVenda1PRECO_PROMOCAO_10: TFloatField
      FieldName = 'PRECO_PROMOCAO_10'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_1: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_1'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_2: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_2'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_3: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_3'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_4: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_4'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_5: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_5'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_6: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_6'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_7: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_7'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_8: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_8'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_9: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_9'
    end
    object CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_10: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_10'
    end
    object CdsPrecoVenda1DT_REAJUSTE_1: TDateField
      FieldName = 'DT_REAJUSTE_1'
    end
    object CdsPrecoVenda1DT_REAJUSTE_2: TDateField
      FieldName = 'DT_REAJUSTE_2'
    end
    object CdsPrecoVenda1DT_REAJUSTE_3: TDateField
      FieldName = 'DT_REAJUSTE_3'
    end
    object CdsPrecoVenda1DT_REAJUSTE_4: TDateField
      FieldName = 'DT_REAJUSTE_4'
    end
    object CdsPrecoVenda1DT_REAJUSTE_5: TDateField
      FieldName = 'DT_REAJUSTE_5'
    end
    object CdsPrecoVenda1DT_REAJUSTE_6: TDateField
      FieldName = 'DT_REAJUSTE_6'
    end
    object CdsPrecoVenda1DT_REAJUSTE_7: TDateField
      FieldName = 'DT_REAJUSTE_7'
    end
    object CdsPrecoVenda1DT_REAJUSTE_8: TDateField
      FieldName = 'DT_REAJUSTE_8'
    end
    object CdsPrecoVenda1DT_REAJUSTE_9: TDateField
      FieldName = 'DT_REAJUSTE_9'
    end
    object CdsPrecoVenda1DT_REAJUSTE_10: TDateField
      FieldName = 'DT_REAJUSTE_10'
    end
  end
  object CdsCodigoBarras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 866
    Top = 48
  end
  object Sql1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 706
    Top = 56
  end
  object CdsPrecoVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPrecoVenda'
    Left = 194
    Top = 536
  end
  object SqlBalancos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' BALANCO'#13#10'WHERE'#13#10'  CD_FILIAL = :CD_FILIAL AND'#13 +
      #10'  (ENVIADO IS NULL OR ENVIADO <> '#39'2'#39')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 316
    Top = 464
  end
  object DspBalancos: TDataSetProvider
    DataSet = SqlBalancos
    Left = 316
    Top = 506
  end
  object CdsBalancos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspBalancos'
    Left = 316
    Top = 537
    object CdsBalancosID_BALANCO: TFloatField
      FieldName = 'ID_BALANCO'
    end
    object CdsBalancosDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsBalancosHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsBalancosDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object CdsBalancosHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
    end
    object CdsBalancosDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object CdsBalancosHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object CdsBalancosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsBalancosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsBalancosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsBalancosCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object CdsBalancosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsBalancosCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsBalancosGRUPO: TStringField
      FieldName = 'GRUPO'
    end
    object CdsBalancosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsBalancosLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
    end
    object CdsBalancosCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsBalancosCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 30
    end
    object CdsBalancosCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
    object CdsBalancosPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object CdsBalancosPRECO_VENDA_ANTERIOR: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR'
    end
    object CdsBalancosESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object CdsBalancosESTOQUE_ANTERIOR: TFloatField
      FieldName = 'ESTOQUE_ANTERIOR'
    end
    object CdsBalancosSUBSTITUIESTOQUE: TStringField
      FieldName = 'SUBSTITUIESTOQUE'
      Size = 1
    end
    object CdsBalancosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsBalancosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsBalancosID_MOTIVO: TFloatField
      FieldName = 'ID_MOTIVO'
    end
    object CdsBalancosDATA_CONTAGEM: TDateField
      FieldName = 'DATA_CONTAGEM'
    end
    object CdsBalancosHORA_CONTAGEM: TTimeField
      FieldName = 'HORA_CONTAGEM'
    end
    object CdsBalancosCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 14
    end
    object CdsBalancosCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object CdsBalancosUSUARIO_ABERTURA: TStringField
      FieldName = 'USUARIO_ABERTURA'
      Size = 100
    end
    object CdsBalancosUSUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
      Size = 100
    end
  end
  object CdsAlteracaoBalancos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 898
    Top = 8
  end
  object SqlMetaFilial: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' METAS_FILIAIS.*'#13#10'FROM '#13#10' METAS_FILIAIS,'#13#10' TEMP_PRODUTOS' +
      #13#10'WHERE'#13#10' METAS_FILIAIS.ID_META = TEMP_PRODUTOS.ID_PRODUTO AND'#13#10 +
      ' TEMP_PRODUTOS.CD_FILIAL = :FILIAL AND'#13#10' TEMP_PRODUTOS.PROCESSO ' +
      '= 127'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 778
    Top = 104
  end
  object DspMetaFilial: TDataSetProvider
    DataSet = SqlMetaFilial
    Left = 778
    Top = 136
  end
  object CdsMetaFilial: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspMetaFilial'
    Left = 778
    Top = 168
    object CdsMetaFilialID_META: TFloatField
      FieldName = 'ID_META'
      Required = True
    end
    object CdsMetaFilialCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsMetaFilialMESREF: TStringField
      FieldName = 'MESREF'
      Size = 2
    end
    object CdsMetaFilialANOREF: TStringField
      FieldName = 'ANOREF'
      Size = 4
    end
    object CdsMetaFilialDIASUTEIS: TFloatField
      FieldName = 'DIASUTEIS'
    end
    object CdsMetaFilialMETAVALOR: TFloatField
      FieldName = 'METAVALOR'
    end
    object CdsMetaFilialMETAQUANTIDADE: TFloatField
      FieldName = 'METAQUANTIDADE'
    end
    object CdsMetaFilialMETACLIENTES: TFloatField
      FieldName = 'METACLIENTES'
    end
    object CdsMetaFilialMETATICKET: TFloatField
      FieldName = 'METATICKET'
    end
    object CdsMetaFilialACUMULADOVALOR: TFloatField
      FieldName = 'ACUMULADOVALOR'
    end
    object CdsMetaFilialACUMULADOQUANTIDADE: TFloatField
      FieldName = 'ACUMULADOQUANTIDADE'
    end
    object CdsMetaFilialACUMULADOCLIENTES: TFloatField
      FieldName = 'ACUMULADOCLIENTES'
    end
    object CdsMetaFilialACUMULADOTICKET: TFloatField
      FieldName = 'ACUMULADOTICKET'
    end
    object CdsMetaFilialACUMULADOCUSTO: TFloatField
      FieldName = 'ACUMULADOCUSTO'
    end
    object CdsMetaFilialACUMULADODESCONTO: TFloatField
      FieldName = 'ACUMULADODESCONTO'
    end
    object CdsMetaFilialACUMULADOLUCRO: TFloatField
      FieldName = 'ACUMULADOLUCRO'
    end
    object CdsMetaFilialENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlMetaVendedor: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' METAS_VENDEDORES.*'#13#10'FROM '#13#10' METAS_VENDEDORES,'#13#10' TEMP_PR' +
      'ODUTOS'#13#10'WHERE'#13#10' METAS_VENDEDORES.ID_META = TEMP_PRODUTOS.ID_PROD' +
      'UTO AND'#13#10' TEMP_PRODUTOS.CD_FILIAL = :FILIAL AND'#13#10' TEMP_PRODUTOS.' +
      'PROCESSO = 128'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 434
    Top = 464
  end
  object DspMetaVendedor: TDataSetProvider
    DataSet = SqlMetaVendedor
    Left = 434
    Top = 504
  end
  object CdsMetaVendedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspMetaVendedor'
    Left = 434
    Top = 536
    object CdsMetaVendedorID_META: TFloatField
      FieldName = 'ID_META'
    end
    object CdsMetaVendedorCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsMetaVendedorMETAVALOR: TFloatField
      FieldName = 'METAVALOR'
    end
    object CdsMetaVendedorMETAQUANTIDADE: TFloatField
      FieldName = 'METAQUANTIDADE'
    end
    object CdsMetaVendedorMETACLIENTES: TFloatField
      FieldName = 'METACLIENTES'
    end
    object CdsMetaVendedorMETATICKET: TFloatField
      FieldName = 'METATICKET'
    end
    object CdsMetaVendedorACUMULADOVALOR: TFloatField
      FieldName = 'ACUMULADOVALOR'
    end
    object CdsMetaVendedorACUMULADOQUANTIDADE: TFloatField
      FieldName = 'ACUMULADOQUANTIDADE'
    end
    object CdsMetaVendedorACUMULADOCLIENTES: TFloatField
      FieldName = 'ACUMULADOCLIENTES'
    end
    object CdsMetaVendedorACUMULADOTICKET: TFloatField
      FieldName = 'ACUMULADOTICKET'
    end
    object CdsMetaVendedorACUMULADOCUSTO: TFloatField
      FieldName = 'ACUMULADOCUSTO'
    end
    object CdsMetaVendedorACUMULADODESCONTO: TFloatField
      FieldName = 'ACUMULADODESCONTO'
    end
    object CdsMetaVendedorACUMULADOLUCRO: TFloatField
      FieldName = 'ACUMULADOLUCRO'
    end
    object CdsMetaVendedorENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlFamilias: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' FAMILIAS.*'#13#10'FROM '#13#10' FAMILIAS,'#13#10' TEMP_PRODUTOS'#13#10'WHERE'#13#10 +
      ' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS.PROCES' +
      'SO = 129 AND'#13#10' FAMILIAS.ID_FAMILIA = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 258
    Top = 464
  end
  object DspFamilias: TDataSetProvider
    DataSet = SqlFamilias
    Left = 258
    Top = 504
  end
  object CdsFamilias: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspFamilias'
    Left = 258
    Top = 536
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
  object CdsPrecoVendaFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 362
    Top = 48
  end
  object SqlGruposBalanco: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' GRUPOSBALANCO'#13#10'WHERE'#13#10' DT_ALTERACAO >= CURRE' +
      'NT_DATE - 5'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 146
    Top = 101
  end
  object DspGruposBalanco: TDataSetProvider
    DataSet = SqlGruposBalanco
    Left = 146
    Top = 136
  end
  object CdsGruposBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGruposBalanco'
    Left = 146
    Top = 171
    object CdsGruposBalancoCD_GRUPOBALANCO: TFloatField
      FieldName = 'CD_GRUPOBALANCO'
      Required = True
    end
    object CdsGruposBalancoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsGruposBalancoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsGruposBalancoDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsGruposBalancoENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlGruposCompras: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' GRUPOSCOMPRAS'#13#10'WHERE'#13#10' DT_ALTERACAO >= CURRE' +
      'NT_DATE - 5'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 194
    Top = 101
  end
  object DspGruposCompras: TDataSetProvider
    DataSet = SqlGruposCompras
    Left = 194
    Top = 136
  end
  object CdsGruposCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGruposCompras'
    Left = 194
    Top = 171
    object CdsGruposComprasCD_GRUPOCOMPRA: TFloatField
      FieldName = 'CD_GRUPOCOMPRA'
      Required = True
    end
    object CdsGruposComprasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsGruposComprasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsGruposComprasDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsGruposComprasENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlGruposCurvas: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' GRUPOS_CURVAS'#13#10'WHERE'#13#10' CD_FILIAL = :FILIAL A' +
      'ND'#13#10' DT_ALTERACAO >= CURRENT_DATE - 5'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 922
    Top = 221
  end
  object DspGruposCurvas: TDataSetProvider
    DataSet = SqlGruposCurvas
    Left = 922
    Top = 256
  end
  object CdsGruposCurvas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspGruposCurvas'
    Left = 922
    Top = 288
    object CdsGruposCurvasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsGruposCurvasCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object CdsGruposCurvasGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object CdsGruposCurvasCD_CURVA: TFloatField
      FieldName = 'CD_CURVA'
      Required = True
    end
    object CdsGruposCurvasCURVA: TStringField
      FieldName = 'CURVA'
      Size = 100
    end
    object CdsGruposCurvasSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 1
    end
    object CdsGruposCurvasDIASESTOQUE: TFloatField
      FieldName = 'DIASESTOQUE'
    end
    object CdsGruposCurvasESEG: TFloatField
      FieldName = 'ESEG'
    end
    object CdsGruposCurvasP1: TFloatField
      FieldName = 'P1'
    end
    object CdsGruposCurvasP2: TFloatField
      FieldName = 'P2'
    end
    object CdsGruposCurvasP1SAZ: TFloatField
      FieldName = 'P1SAZ'
    end
    object CdsGruposCurvasP2SAZ: TFloatField
      FieldName = 'P2SAZ'
    end
    object CdsGruposCurvasDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object SqlConexao: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CNPJ, EXPORTAR '#13#10'FROM'#13#10' FILIAIS'#13#10'WHERE'#13#10' CD_FILIAL = :' +
      'FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 858
    Top = 224
  end
  object DspConexao: TDataSetProvider
    DataSet = SqlConexao
    Left = 858
    Top = 256
  end
  object CdsConexao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspConexao'
    Left = 858
    Top = 288
    object CdsConexaoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CdsConexaoEXPORTAR: TStringField
      FieldName = 'EXPORTAR'
      Size = 1
    end
  end
  object SqlNumeroLancamentos2: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(*) '#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAMENTO' +
      ' >= :DATAINICIAL AND'#13#10' DATA_LANCAMENTO <= :DATAFINAL AND'#13#10' CD_FI' +
      'LIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 122
    Top = 344
  end
  object DspNumeroLancamentos2: TDataSetProvider
    DataSet = SqlNumeroLancamentos2
    Left = 122
    Top = 376
  end
  object CdsNumeroLancamentos2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroLancamentos2'
    Left = 122
    Top = 408
    object CdsNumeroLancamentos2COUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlNumeroCaixa2: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(*) '#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA >= :DATAINICIAL ' +
      'AND'#13#10' DATA <= :DATAFINAL AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 314
    Top = 344
  end
  object DspNumeroCaixa2: TDataSetProvider
    DataSet = SqlNumeroCaixa2
    Left = 314
    Top = 376
  end
  object CdsNumeroCaixa2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroCaixa2'
    Left = 314
    Top = 408
    object CdsNumeroCaixa2COUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlIdProduto: TSQLDataSet
    CommandText = 'SELECT ID_PRODUTO FROM PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 730
    Top = 104
  end
  object DspIdProduto: TDataSetProvider
    DataSet = SqlIdProduto
    Left = 730
    Top = 136
  end
  object CdsIdProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspIdProduto'
    Left = 730
    Top = 168
    object CdsIdProdutoID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object CdsComprasDeletadas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 48
  end
  object CdsProdutosTotais: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 250
    Top = 48
  end
  object SqlTransferVenda: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' * '#13#10'FROM '#13#10' TRANSFER '#13#10'WHERE '#13#10' (STATUS = '#39'G'#39' OR STATU' +
      'S = '#39'E'#39') AND '#13#10' (CD_FILIAL_DESTINO = :CD_FILIAL OR CD_FILIAL_ORI' +
      'GEM = :CD_FILIAL) AND DATA_GERACAO >=  :DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 491
    Top = 464
  end
  object DspTransferVenda: TDataSetProvider
    DataSet = SqlTransferVenda
    Left = 491
    Top = 504
  end
  object CdsTransferVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'DspTransferVenda'
    Left = 491
    Top = 537
    object FloatField6: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object DateField4: TDateField
      FieldName = 'DATA_GERACAO'
    end
    object DateField5: TDateField
      FieldName = 'DATA_ENVIO'
    end
    object TimeField3: TTimeField
      FieldName = 'HORA_ENVIO'
    end
    object DateField6: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object TimeField4: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object FloatField7: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object FloatField8: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object FloatField9: TFloatField
      FieldName = 'CD_USUARIO_ORIGEM'
    end
    object FloatField10: TFloatField
      FieldName = 'CD_USUARIO_DESTINO'
    end
    object StringField3: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object StringField4: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object SqlItensTransferVenda: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ITENS_TRANSFER.*'#13#10'FROM'#13#10' TRANSFER, '#13#10' ITENS_TRANSFER'#13#10'W' +
      'HERE'#13#10' TRANSFER.CD_TRANSFER = ITENS_TRANSFER.CD_TRANSFER AND'#13#10' (' +
      'TRANSFER.STATUS =  '#39'G'#39'  OR TRANSFER.STATUS = '#39'E'#39') AND '#13#10' (TRANSF' +
      'ER.CD_FILIAL_DESTINO = :CD_FILIAL OR TRANSFER.CD_FILIAL_ORIGEM =' +
      ' :CD_FILIAL) AND'#13#10' TRANSFER.DATA_GERACAO >= :DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 554
    Top = 464
  end
  object DspItensTransferVenda: TDataSetProvider
    DataSet = SqlItensTransferVenda
    Left = 554
    Top = 504
  end
  object CdsItensTransferVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'DspItensTransferVenda'
    Left = 554
    Top = 537
    object FloatField11: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object FloatField12: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object FloatField13: TFloatField
      FieldName = 'CD_PRODUTO'
    end
    object FloatField14: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object FloatField15: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object StringField5: TStringField
      FieldName = 'DESCRICAO'
      Size = 45
    end
    object FloatField16: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
    end
    object FloatField17: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
    end
    object FloatField18: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
    end
    object FloatField19: TFloatField
      FieldName = 'VALOR'
    end
    object StringField6: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object StringField7: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object SqlUsuarios: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' USUARIOS.*'#13#10'FROM'#13#10' USUARIOS,'#13#10' TEMP_PRODUTOS'#13#10'WHERE'#13#10' T' +
      'EMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS.PROCESSO' +
      ' = 142 AND'#13#10' USUARIOS.CD_USUARIO = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 50
    Top = 584
  end
  object DspUsuarios: TDataSetProvider
    DataSet = SqlUsuarios
    Left = 50
    Top = 616
  end
  object CdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspUsuarios'
    Left = 50
    Top = 648
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
      'SELECT'#13#10' PERMISSOES_MODULOS.*'#13#10'FROM'#13#10' PERMISSOES_MODULOS,'#13#10' TEMP' +
      '_PRODUTOS'#13#10'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TE' +
      'MP_PRODUTOS.PROCESSO = 144 AND'#13#10' PERMISSOES_MODULOS.CD_PERMISSAO' +
      ' = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 202
    Top = 584
  end
  object DspPermissoesModulos: TDataSetProvider
    DataSet = SqlPermissoesModulos
    Left = 202
    Top = 616
  end
  object CdsPermissoesModulos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPermissoesModulos'
    Left = 202
    Top = 648
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
  object SqlPermissoes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' PERMISSOES.*'#13#10'FROM'#13#10' PERMISSOES,'#13#10' TEMP_PRODUTOS'#13#10'WHERE' +
      #13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS.PROC' +
      'ESSO = 143 AND'#13#10' PERMISSOES.CD_PERMISSAO = TEMP_PRODUTOS.ID_PROD' +
      'UTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 122
    Top = 584
  end
  object DspPermissoes: TDataSetProvider
    DataSet = SqlPermissoes
    Left = 122
    Top = 616
  end
  object CdsPermissoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPermissoes'
    Left = 122
    Top = 648
    object CdsPermissoesCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object CdsPermissoesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object CdsPermissoesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 306
    Top = 48
  end
  object CdsIdProdutoLoja: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 434
    Top = 48
    Data = {
      2D0000009619E0BD0100000018000000010000000000030000002D000A49445F
      50524F4455544F08000400000000000000}
    object CdsIdProdutoLojaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
  end
  object SqlProdutosLojaInc: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 370
    Top = 584
  end
  object DspProdutosLojaInc: TDataSetProvider
    DataSet = SqlProdutosLojaInc
    Left = 370
    Top = 616
  end
  object CdsProdutosLojaInc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutosLojaInc'
    Left = 370
    Top = 648
    object CdsProdutosLojaIncID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosLojaIncCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsProdutosLojaIncCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsProdutosLojaIncCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsProdutosLojaIncCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsProdutosLojaIncID_FAMILIA: TFloatField
      FieldName = 'ID_FAMILIA'
    end
    object CdsProdutosLojaIncCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object CdsProdutosLojaIncCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
    end
    object CdsProdutosLojaIncCD_GRUPOBALANCO: TFloatField
      FieldName = 'CD_GRUPOBALANCO'
    end
    object CdsProdutosLojaIncCD_GRUPOCOMPRA: TFloatField
      FieldName = 'CD_GRUPOCOMPRA'
    end
    object CdsProdutosLojaIncTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 2
    end
    object CdsProdutosLojaIncDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsProdutosLojaIncCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Required = True
      Size = 13
    end
    object CdsProdutosLojaIncCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 13
    end
    object CdsProdutosLojaIncCOMPOSICAO: TMemoField
      FieldName = 'COMPOSICAO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsProdutosLojaIncCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
    object CdsProdutosLojaIncIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Size = 1
    end
    object CdsProdutosLojaIncQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsProdutosLojaIncICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsProdutosLojaIncLISTA: TStringField
      FieldName = 'LISTA'
      Size = 1
    end
    object CdsProdutosLojaIncENTRA_PEDIDO_ELETRONICO: TStringField
      FieldName = 'ENTRA_PEDIDO_ELETRONICO'
      Size = 1
    end
    object CdsProdutosLojaIncETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 50
    end
    object CdsProdutosLojaIncFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR'
    end
    object CdsProdutosLojaIncMARGEM_PROMOCAO: TFloatField
      FieldName = 'MARGEM_PROMOCAO'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object CdsProdutosLojaIncMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object CdsProdutosLojaIncPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      Required = True
    end
    object CdsProdutosLojaIncCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CdsProdutosLojaIncDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object CdsProdutosLojaIncDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsProdutosLojaIncDT_ULTIMA_COMPRA: TDateField
      FieldName = 'DT_ULTIMA_COMPRA'
    end
    object CdsProdutosLojaIncDT_REAJUSTE: TDateField
      FieldName = 'DT_REAJUSTE'
    end
    object CdsProdutosLojaIncDT_INVENTARIO: TDateField
      FieldName = 'DT_INVENTARIO'
    end
    object CdsProdutosLojaIncQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
    end
    object CdsProdutosLojaIncQUANTIDADE_SAIDA: TFloatField
      FieldName = 'QUANTIDADE_SAIDA'
    end
    object CdsProdutosLojaIncQUANTIDADE_TRANSFERIDA: TFloatField
      FieldName = 'QUANTIDADE_TRANSFERIDA'
    end
    object CdsProdutosLojaIncESTOQUE_0: TFloatField
      FieldName = 'ESTOQUE_0'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_0: TFloatField
      FieldName = 'ESTOQUE_MINIMO_0'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_0: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_0'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_0: TDateField
      FieldName = 'DT_ULT_VENDA_0'
    end
    object CdsProdutosLojaIncESTOQUE_1: TFloatField
      FieldName = 'ESTOQUE_1'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_1: TFloatField
      FieldName = 'ESTOQUE_MINIMO_1'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_1: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_1'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_1: TDateField
      FieldName = 'DT_ULT_VENDA_1'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_1: TFloatField
      FieldName = 'CUSTO_UNITARIO_1'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_1: TFloatField
      FieldName = 'CUSTO_MEDIO_1'
    end
    object CdsProdutosLojaIncFACE_1: TFloatField
      FieldName = 'FACE_1'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_1: TDateField
      FieldName = 'DT_ULT_COMPRA_1'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_1: TStringField
      FieldName = 'CURVA_UNITARIA_1'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_1: TStringField
      FieldName = 'CURVA_FINANCEIRA_1'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_2: TFloatField
      FieldName = 'ESTOQUE_2'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_2: TFloatField
      FieldName = 'ESTOQUE_MINIMO_2'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_2: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_2'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_2: TDateField
      FieldName = 'DT_ULT_VENDA_2'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_2: TFloatField
      FieldName = 'CUSTO_UNITARIO_2'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_2: TFloatField
      FieldName = 'CUSTO_MEDIO_2'
    end
    object CdsProdutosLojaIncFACE_2: TFloatField
      FieldName = 'FACE_2'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_2: TDateField
      FieldName = 'DT_ULT_COMPRA_2'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_2: TStringField
      FieldName = 'CURVA_UNITARIA_2'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_2: TStringField
      FieldName = 'CURVA_FINANCEIRA_2'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_3: TFloatField
      FieldName = 'ESTOQUE_3'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_3: TFloatField
      FieldName = 'ESTOQUE_MINIMO_3'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_3: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_3'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_3: TDateField
      FieldName = 'DT_ULT_VENDA_3'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_3: TFloatField
      FieldName = 'CUSTO_UNITARIO_3'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_3: TFloatField
      FieldName = 'CUSTO_MEDIO_3'
    end
    object CdsProdutosLojaIncFACE_3: TFloatField
      FieldName = 'FACE_3'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_3: TDateField
      FieldName = 'DT_ULT_COMPRA_3'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_3: TStringField
      FieldName = 'CURVA_UNITARIA_3'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_3: TStringField
      FieldName = 'CURVA_FINANCEIRA_3'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_4: TFloatField
      FieldName = 'ESTOQUE_4'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_4: TFloatField
      FieldName = 'ESTOQUE_MINIMO_4'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_4: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_4'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_4: TDateField
      FieldName = 'DT_ULT_VENDA_4'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_4: TFloatField
      FieldName = 'CUSTO_UNITARIO_4'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_4: TFloatField
      FieldName = 'CUSTO_MEDIO_4'
    end
    object CdsProdutosLojaIncFACE_4: TFloatField
      FieldName = 'FACE_4'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_4: TDateField
      FieldName = 'DT_ULT_COMPRA_4'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_4: TStringField
      FieldName = 'CURVA_UNITARIA_4'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_4: TStringField
      FieldName = 'CURVA_FINANCEIRA_4'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_5: TFloatField
      FieldName = 'ESTOQUE_5'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_5: TFloatField
      FieldName = 'ESTOQUE_MINIMO_5'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_5: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_5'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_5: TDateField
      FieldName = 'DT_ULT_VENDA_5'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_5: TFloatField
      FieldName = 'CUSTO_UNITARIO_5'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_5: TFloatField
      FieldName = 'CUSTO_MEDIO_5'
    end
    object CdsProdutosLojaIncFACE_5: TFloatField
      FieldName = 'FACE_5'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_5: TDateField
      FieldName = 'DT_ULT_COMPRA_5'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_5: TStringField
      FieldName = 'CURVA_UNITARIA_5'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_5: TStringField
      FieldName = 'CURVA_FINANCEIRA_5'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_6: TFloatField
      FieldName = 'ESTOQUE_6'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_6: TFloatField
      FieldName = 'ESTOQUE_MINIMO_6'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_6: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_6'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_6: TDateField
      FieldName = 'DT_ULT_VENDA_6'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_6: TFloatField
      FieldName = 'CUSTO_UNITARIO_6'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_6: TFloatField
      FieldName = 'CUSTO_MEDIO_6'
    end
    object CdsProdutosLojaIncFACE_6: TFloatField
      FieldName = 'FACE_6'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_6: TDateField
      FieldName = 'DT_ULT_COMPRA_6'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_6: TStringField
      FieldName = 'CURVA_UNITARIA_6'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_6: TStringField
      FieldName = 'CURVA_FINANCEIRA_6'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_7: TFloatField
      FieldName = 'ESTOQUE_7'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_7: TFloatField
      FieldName = 'ESTOQUE_MINIMO_7'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_7: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_7'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_7: TDateField
      FieldName = 'DT_ULT_VENDA_7'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_7: TFloatField
      FieldName = 'CUSTO_UNITARIO_7'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_7: TFloatField
      FieldName = 'CUSTO_MEDIO_7'
    end
    object CdsProdutosLojaIncFACE_7: TFloatField
      FieldName = 'FACE_7'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_7: TDateField
      FieldName = 'DT_ULT_COMPRA_7'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_7: TStringField
      FieldName = 'CURVA_UNITARIA_7'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_7: TStringField
      FieldName = 'CURVA_FINANCEIRA_7'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_8: TFloatField
      FieldName = 'ESTOQUE_8'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_8: TFloatField
      FieldName = 'ESTOQUE_MINIMO_8'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_8: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_8'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_8: TDateField
      FieldName = 'DT_ULT_VENDA_8'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_8: TFloatField
      FieldName = 'CUSTO_UNITARIO_8'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_8: TFloatField
      FieldName = 'CUSTO_MEDIO_8'
    end
    object CdsProdutosLojaIncFACE_8: TFloatField
      FieldName = 'FACE_8'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_8: TDateField
      FieldName = 'DT_ULT_COMPRA_8'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_8: TStringField
      FieldName = 'CURVA_UNITARIA_8'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_8: TStringField
      FieldName = 'CURVA_FINANCEIRA_8'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_9: TFloatField
      FieldName = 'ESTOQUE_9'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_9: TFloatField
      FieldName = 'ESTOQUE_MINIMO_9'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_9: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_9'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_9: TDateField
      FieldName = 'DT_ULT_VENDA_9'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_9: TFloatField
      FieldName = 'CUSTO_UNITARIO_9'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_9: TFloatField
      FieldName = 'CUSTO_MEDIO_9'
    end
    object CdsProdutosLojaIncFACE_9: TFloatField
      FieldName = 'FACE_9'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_9: TDateField
      FieldName = 'DT_ULT_COMPRA_9'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_9: TStringField
      FieldName = 'CURVA_UNITARIA_9'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_9: TStringField
      FieldName = 'CURVA_FINANCEIRA_9'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_10: TFloatField
      FieldName = 'ESTOQUE_10'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_10: TFloatField
      FieldName = 'ESTOQUE_MINIMO_10'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_10: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_10'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_10: TDateField
      FieldName = 'DT_ULT_VENDA_10'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_10: TFloatField
      FieldName = 'CUSTO_UNITARIO_10'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_10: TFloatField
      FieldName = 'CUSTO_MEDIO_10'
    end
    object CdsProdutosLojaIncFACE_10: TFloatField
      FieldName = 'FACE_10'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_10: TDateField
      FieldName = 'DT_ULT_COMPRA_10'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_10: TStringField
      FieldName = 'CURVA_UNITARIA_10'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_10: TStringField
      FieldName = 'CURVA_FINANCEIRA_10'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_11: TFloatField
      FieldName = 'ESTOQUE_11'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_11: TFloatField
      FieldName = 'ESTOQUE_MINIMO_11'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_11: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_11'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_11: TDateField
      FieldName = 'DT_ULT_VENDA_11'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_11: TFloatField
      FieldName = 'CUSTO_UNITARIO_11'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_11: TFloatField
      FieldName = 'CUSTO_MEDIO_11'
    end
    object CdsProdutosLojaIncFACE_11: TFloatField
      FieldName = 'FACE_11'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_11: TDateField
      FieldName = 'DT_ULT_COMPRA_11'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_11: TStringField
      FieldName = 'CURVA_UNITARIA_11'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_11: TStringField
      FieldName = 'CURVA_FINANCEIRA_11'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_12: TFloatField
      FieldName = 'ESTOQUE_12'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_12: TFloatField
      FieldName = 'ESTOQUE_MINIMO_12'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_12: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_12'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_12: TDateField
      FieldName = 'DT_ULT_VENDA_12'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_12: TFloatField
      FieldName = 'CUSTO_UNITARIO_12'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_12: TFloatField
      FieldName = 'CUSTO_MEDIO_12'
    end
    object CdsProdutosLojaIncFACE_12: TFloatField
      FieldName = 'FACE_12'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_12: TDateField
      FieldName = 'DT_ULT_COMPRA_12'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_12: TStringField
      FieldName = 'CURVA_UNITARIA_12'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_12: TStringField
      FieldName = 'CURVA_FINANCEIRA_12'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_13: TFloatField
      FieldName = 'ESTOQUE_13'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_13: TFloatField
      FieldName = 'ESTOQUE_MINIMO_13'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_13: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_13'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_13: TDateField
      FieldName = 'DT_ULT_VENDA_13'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_13: TFloatField
      FieldName = 'CUSTO_UNITARIO_13'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_13: TFloatField
      FieldName = 'CUSTO_MEDIO_13'
    end
    object CdsProdutosLojaIncFACE_13: TFloatField
      FieldName = 'FACE_13'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_13: TDateField
      FieldName = 'DT_ULT_COMPRA_13'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_13: TStringField
      FieldName = 'CURVA_UNITARIA_13'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_13: TStringField
      FieldName = 'CURVA_FINANCEIRA_13'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_14: TFloatField
      FieldName = 'ESTOQUE_14'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_14: TFloatField
      FieldName = 'ESTOQUE_MINIMO_14'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_14: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_14'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_14: TDateField
      FieldName = 'DT_ULT_VENDA_14'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_14: TFloatField
      FieldName = 'CUSTO_UNITARIO_14'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_14: TFloatField
      FieldName = 'CUSTO_MEDIO_14'
    end
    object CdsProdutosLojaIncFACE_14: TFloatField
      FieldName = 'FACE_14'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_14: TDateField
      FieldName = 'DT_ULT_COMPRA_14'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_14: TStringField
      FieldName = 'CURVA_UNITARIA_14'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_14: TStringField
      FieldName = 'CURVA_FINANCEIRA_14'
      Size = 1
    end
    object CdsProdutosLojaIncESTOQUE_15: TFloatField
      FieldName = 'ESTOQUE_15'
    end
    object CdsProdutosLojaIncESTOQUE_MINIMO_15: TFloatField
      FieldName = 'ESTOQUE_MINIMO_15'
    end
    object CdsProdutosLojaIncESTOQUE_MAXIMO_15: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_15'
    end
    object CdsProdutosLojaIncDT_ULT_VENDA_15: TDateField
      FieldName = 'DT_ULT_VENDA_15'
    end
    object CdsProdutosLojaIncCUSTO_UNITARIO_15: TFloatField
      FieldName = 'CUSTO_UNITARIO_15'
    end
    object CdsProdutosLojaIncCUSTO_MEDIO_15: TFloatField
      FieldName = 'CUSTO_MEDIO_15'
    end
    object CdsProdutosLojaIncFACE_15: TFloatField
      FieldName = 'FACE_15'
    end
    object CdsProdutosLojaIncDT_ULT_COMPRA_15: TDateField
      FieldName = 'DT_ULT_COMPRA_15'
    end
    object CdsProdutosLojaIncCURVA_UNITARIA_15: TStringField
      FieldName = 'CURVA_UNITARIA_15'
      Size = 1
    end
    object CdsProdutosLojaIncCURVA_FINANCEIRA_15: TStringField
      FieldName = 'CURVA_FINANCEIRA_15'
      Size = 1
    end
    object CdsProdutosLojaIncTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsProdutosLojaIncBALANCA: TStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object CdsProdutosLojaIncUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO'
    end
    object CdsProdutosLojaIncSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsProdutosLojaIncGENERICO: TStringField
      FieldName = 'GENERICO'
      Size = 1
    end
    object CdsProdutosLojaIncENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsProdutosLojaIncPRECO_VENDA_1: TFloatField
      FieldName = 'PRECO_VENDA_1'
    end
    object CdsProdutosLojaIncPRECO_VENDA_2: TFloatField
      FieldName = 'PRECO_VENDA_2'
    end
    object CdsProdutosLojaIncPRECO_VENDA_3: TFloatField
      FieldName = 'PRECO_VENDA_3'
    end
    object CdsProdutosLojaIncPRECO_VENDA_4: TFloatField
      FieldName = 'PRECO_VENDA_4'
    end
    object CdsProdutosLojaIncPRECO_VENDA_5: TFloatField
      FieldName = 'PRECO_VENDA_5'
    end
    object CdsProdutosLojaIncPRECO_VENDA_6: TFloatField
      FieldName = 'PRECO_VENDA_6'
    end
    object CdsProdutosLojaIncPRECO_VENDA_7: TFloatField
      FieldName = 'PRECO_VENDA_7'
    end
    object CdsProdutosLojaIncPRECO_VENDA_8: TFloatField
      FieldName = 'PRECO_VENDA_8'
    end
    object CdsProdutosLojaIncPRECO_VENDA_9: TFloatField
      FieldName = 'PRECO_VENDA_9'
    end
    object CdsProdutosLojaIncPRECO_VENDA_10: TFloatField
      FieldName = 'PRECO_VENDA_10'
    end
    object CdsProdutosLojaIncPRECO_VENDA_11: TFloatField
      FieldName = 'PRECO_VENDA_11'
    end
    object CdsProdutosLojaIncPRECO_VENDA_12: TFloatField
      FieldName = 'PRECO_VENDA_12'
    end
    object CdsProdutosLojaIncPRECO_VENDA_13: TFloatField
      FieldName = 'PRECO_VENDA_13'
    end
    object CdsProdutosLojaIncPRECO_VENDA_14: TFloatField
      FieldName = 'PRECO_VENDA_14'
    end
    object CdsProdutosLojaIncPRECO_VENDA_15: TFloatField
      FieldName = 'PRECO_VENDA_15'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_1: TFloatField
      FieldName = 'PRECO_PROMOCAO_1'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_2: TFloatField
      FieldName = 'PRECO_PROMOCAO_2'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_3: TFloatField
      FieldName = 'PRECO_PROMOCAO_3'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_4: TFloatField
      FieldName = 'PRECO_PROMOCAO_4'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_5: TFloatField
      FieldName = 'PRECO_PROMOCAO_5'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_6: TFloatField
      FieldName = 'PRECO_PROMOCAO_6'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_7: TFloatField
      FieldName = 'PRECO_PROMOCAO_7'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_8: TFloatField
      FieldName = 'PRECO_PROMOCAO_8'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_9: TFloatField
      FieldName = 'PRECO_PROMOCAO_9'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_10: TFloatField
      FieldName = 'PRECO_PROMOCAO_10'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_11: TFloatField
      FieldName = 'PRECO_PROMOCAO_11'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_12: TFloatField
      FieldName = 'PRECO_PROMOCAO_12'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_13: TFloatField
      FieldName = 'PRECO_PROMOCAO_13'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_14: TFloatField
      FieldName = 'PRECO_PROMOCAO_14'
    end
    object CdsProdutosLojaIncPRECO_PROMOCAO_15: TFloatField
      FieldName = 'PRECO_PROMOCAO_15'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_1: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_1'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_2: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_2'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_3: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_3'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_4: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_4'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_5: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_5'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_6: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_6'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_7: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_7'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_8: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_8'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_9: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_9'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_10: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_10'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_11: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_11'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_12: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_12'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_13: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_13'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_14: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_14'
    end
    object CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_15: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_15'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_1: TDateField
      FieldName = 'DT_REAJUSTE_1'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_2: TDateField
      FieldName = 'DT_REAJUSTE_2'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_3: TDateField
      FieldName = 'DT_REAJUSTE_3'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_4: TDateField
      FieldName = 'DT_REAJUSTE_4'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_5: TDateField
      FieldName = 'DT_REAJUSTE_5'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_6: TDateField
      FieldName = 'DT_REAJUSTE_6'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_7: TDateField
      FieldName = 'DT_REAJUSTE_7'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_8: TDateField
      FieldName = 'DT_REAJUSTE_8'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_9: TDateField
      FieldName = 'DT_REAJUSTE_9'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_10: TDateField
      FieldName = 'DT_REAJUSTE_10'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_11: TDateField
      FieldName = 'DT_REAJUSTE_11'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_12: TDateField
      FieldName = 'DT_REAJUSTE_12'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_13: TDateField
      FieldName = 'DT_REAJUSTE_13'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_14: TDateField
      FieldName = 'DT_REAJUSTE_14'
    end
    object CdsProdutosLojaIncDT_REAJUSTE_15: TDateField
      FieldName = 'DT_REAJUSTE_15'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_1: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_1'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_2: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_2'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_3: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_3'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_4: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_4'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_5: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_5'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_6: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_6'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_7: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_7'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_8: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_8'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_9: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_9'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_10: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_10'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_11: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_11'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_12: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_12'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_13: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_13'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_14: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_14'
    end
    object CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_15: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_15'
    end
    object CdsProdutosLojaIncUSOCONTINUO: TStringField
      FieldName = 'USOCONTINUO'
      Size = 1
    end
    object CdsProdutosLojaIncCOMPRIMIDOSCAIXA: TFloatField
      FieldName = 'COMPRIMIDOSCAIXA'
    end
    object CdsProdutosLojaIncDATA_VENCIMENTO_1: TDateField
      FieldName = 'DATA_VENCIMENTO_1'
    end
    object CdsProdutosLojaIncDATA_VENCIMENTO_2: TDateField
      FieldName = 'DATA_VENCIMENTO_2'
    end
    object CdsProdutosLojaIncCONTROLADO: TStringField
      FieldName = 'CONTROLADO'
      Size = 1
    end
    object CdsProdutosLojaIncID_PORTARIA: TFloatField
      FieldName = 'ID_PORTARIA'
    end
    object CdsProdutosLojaIncPRINCIPIOATIVO: TStringField
      FieldName = 'PRINCIPIOATIVO'
      Size = 1000
    end
    object CdsProdutosLojaIncREGISTROMS: TStringField
      FieldName = 'REGISTROMS'
      Size = 13
    end
    object CdsProdutosLojaIncMEDIAF_1: TFloatField
      FieldName = 'MEDIAF_1'
    end
    object CdsProdutosLojaIncMEDIAF_2: TFloatField
      FieldName = 'MEDIAF_2'
    end
    object CdsProdutosLojaIncMEDIAF_3: TFloatField
      FieldName = 'MEDIAF_3'
    end
    object CdsProdutosLojaIncMEDIAF_4: TFloatField
      FieldName = 'MEDIAF_4'
    end
    object CdsProdutosLojaIncMEDIAF_5: TFloatField
      FieldName = 'MEDIAF_5'
    end
    object CdsProdutosLojaIncMEDIAF_6: TFloatField
      FieldName = 'MEDIAF_6'
    end
    object CdsProdutosLojaIncMEDIAF_7: TFloatField
      FieldName = 'MEDIAF_7'
    end
    object CdsProdutosLojaIncMEDIAF_8: TFloatField
      FieldName = 'MEDIAF_8'
    end
    object CdsProdutosLojaIncMEDIAF_9: TFloatField
      FieldName = 'MEDIAF_9'
    end
    object CdsProdutosLojaIncMEDIAF_10: TFloatField
      FieldName = 'MEDIAF_10'
    end
    object CdsProdutosLojaIncMEDIAF_11: TFloatField
      FieldName = 'MEDIAF_11'
    end
    object CdsProdutosLojaIncMEDIAF_12: TFloatField
      FieldName = 'MEDIAF_12'
    end
    object CdsProdutosLojaIncMEDIAF_13: TFloatField
      FieldName = 'MEDIAF_13'
    end
    object CdsProdutosLojaIncMEDIAF_14: TFloatField
      FieldName = 'MEDIAF_14'
    end
    object CdsProdutosLojaIncMEDIAF_15: TFloatField
      FieldName = 'MEDIAF_15'
    end
    object CdsProdutosLojaIncSAZONAL: TStringField
      FieldName = 'SAZONAL'
      Size = 1
    end
    object CdsProdutosLojaIncJANSAZ: TStringField
      FieldName = 'JANSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncFEVSAZ: TStringField
      FieldName = 'FEVSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncMARSAZ: TStringField
      FieldName = 'MARSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncABRSAZ: TStringField
      FieldName = 'ABRSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncMAISAZ: TStringField
      FieldName = 'MAISAZ'
      Size = 1
    end
    object CdsProdutosLojaIncJUNSAZ: TStringField
      FieldName = 'JUNSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncJULSAZ: TStringField
      FieldName = 'JULSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncAGOSAZ: TStringField
      FieldName = 'AGOSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncSETSAZ: TStringField
      FieldName = 'SETSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncOUTSAZ: TStringField
      FieldName = 'OUTSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncNOVSAZ: TStringField
      FieldName = 'NOVSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncDEZSAZ: TStringField
      FieldName = 'DEZSAZ'
      Size = 1
    end
    object CdsProdutosLojaIncSITUACAOTRIBUTARIA: TStringField
      FieldName = 'SITUACAOTRIBUTARIA'
      Size = 3
    end
    object CdsProdutosLojaIncUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object CdsProdutosLojaIncRESERVA: TFloatField
      FieldName = 'RESERVA'
    end
  end
  object SqlNumeroLancamentosaPrazo: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(*) '#13#10'FROM'#13#10' LANCAMENTOS_APRAZO'#13#10'WHERE'#13#10' DATA_LAN' +
      'CAMENTO = CURRENT_DATE AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 450
    Top = 584
  end
  object DspNumeroLancamentosaPrazo: TDataSetProvider
    DataSet = SqlNumeroLancamentosaPrazo
    Left = 450
    Top = 616
  end
  object CdsNumeroLancamentosaPrazo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspNumeroLancamentosaPrazo'
    Left = 450
    Top = 648
    object CdsNumeroLancamentosaPrazoCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdLancamentoaPrazo: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CD_LANCAMENTO'#13#10'FROM'#13#10' LANCAMENTOS_APRAZO'#13#10'WHERE'#13#10' DATA' +
      '_LANCAMENTO = CURRENT_DATE AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 522
    Top = 584
  end
  object DspLancamentoaPrazo: TDataSetProvider
    DataSet = SqlCdLancamentoaPrazo
    Left = 522
    Top = 616
  end
  object CdsCdLancamentoaPrazo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspLancamentoaPrazo'
    Left = 522
    Top = 648
    object CdsCdLancamentoaPrazoCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object SqlLancamentosaPrazo: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' LANCAMENTOS_APRAZO.*'#13#10'FROM'#13#10' LANCAMENTOS_APRAZO, TEMP_L' +
      'ANCAMENTOS_APRAZO2'#13#10'WHERE'#13#10'  LANCAMENTOS_APRAZO.CD_LANCAMENTO = ' +
      'TEMP_LANCAMENTOS_APRAZO2.CD_LANCAMENTO AND'#13#10'  LANCAMENTOS_APRAZO' +
      '.CD_FILIAL = TEMP_LANCAMENTOS_APRAZO2.CD_FILIAL AND'#13#10'  TEMP_LANC' +
      'AMENTOS_APRAZO2.CD_FILIAL_DESTINO = :CD_FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 594
    Top = 584
  end
  object DspLancamentosaPrazo: TDataSetProvider
    DataSet = SqlLancamentosaPrazo
    Left = 594
    Top = 616
  end
  object CdsLancamentosaPrazo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspLancamentosaPrazo'
    Left = 594
    Top = 648
    object CdsLancamentosaPrazoCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object CdsLancamentosaPrazoID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsLancamentosaPrazoCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsLancamentosaPrazoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsLancamentosaPrazoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsLancamentosaPrazoCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsLancamentosaPrazoCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsLancamentosaPrazoCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsLancamentosaPrazoCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsLancamentosaPrazoCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsLancamentosaPrazoCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsLancamentosaPrazoCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object CdsLancamentosaPrazoCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object CdsLancamentosaPrazoCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsLancamentosaPrazoCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsLancamentosaPrazoID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object CdsLancamentosaPrazoCUSTO_MEDIO: TFloatField
      FieldName = 'CUSTO_MEDIO'
    end
    object CdsLancamentosaPrazoCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
    object CdsLancamentosaPrazoDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CdsLancamentosaPrazoDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object CdsLancamentosaPrazoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsLancamentosaPrazoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsLancamentosaPrazoCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CdsLancamentosaPrazoNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 7
    end
    object CdsLancamentosaPrazoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CdsLancamentosaPrazoPROMOCAO: TFloatField
      FieldName = 'PROMOCAO'
    end
    object CdsLancamentosaPrazoTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object CdsLancamentosaPrazoTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 1
    end
    object CdsLancamentosaPrazoENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object CdsLancamentosaPrazoETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 1
    end
    object CdsLancamentosaPrazoENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object CdsLancamentosaPrazoHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsLancamentosaPrazoESTOQUE_POSVENDA: TFloatField
      FieldName = 'ESTOQUE_POSVENDA'
    end
    object CdsLancamentosaPrazoTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object CdsLancamentosaPrazoENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsLancamentosaPrazoNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object CdsLancamentosaPrazoTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object CdsLancamentosaPrazoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object CdsLancamentosaPrazoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object CdsLancamentosaPrazoARREDONDAMENTO: TFloatField
      FieldName = 'ARREDONDAMENTO'
    end
    object CdsLancamentosaPrazoTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object CdsLancamentosaPrazoTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object CdsLancamentosaPrazoLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object CdsLancamentosaPrazoAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object CdsLancamentosaPrazoSUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object CdsLancamentosaPrazoNOTAMANUAL: TStringField
      FieldName = 'NOTAMANUAL'
      Size = 1
    end
  end
  object CdsSintegraNotas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 826
    Top = 584
  end
  object CdsSintegraNotasItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 826
    Top = 624
  end
  object CdsSintegraPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 890
    Top = 584
  end
  object CdsSintegraR60: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 890
    Top = 624
  end
  object CdsSintegraR60i: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 890
    Top = 656
  end
  object SqlEncartes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ENCARTE.*'#13#10'FROM'#13#10' ENCARTE,'#13#10' ENCARTES_FILIAIS'#13#10'WHERE'#13#10' ' +
      'ENCARTE.ID_ENCARTE = ENCARTES_FILIAIS.ID_ENCARTE AND'#13#10' ENCARTES_' +
      'FILIAIS.CD_FILIAL = :CD AND'#13#10' ENCARTE.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 802
    Top = 344
  end
  object SqlEncartesItens: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ENCARTE_ITENS.*'#13#10'FROM'#13#10' ENCARTE,'#13#10' ENCARTES_FILIAIS,'#13#10' ' +
      'ENCARTE_ITENS'#13#10'WHERE'#13#10' ENCARTE.ID_ENCARTE = ENCARTES_FILIAIS.ID_' +
      'ENCARTE AND'#13#10' ENCARTE_ITENS.ID_ENCARTE = ENCARTE.ID_ENCARTE AND'#13 +
      #10' ENCARTES_FILIAIS.CD_FILIAL = :CD AND '#13#10' ENCARTE.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 866
    Top = 344
  end
  object DspEncartes: TDataSetProvider
    DataSet = SqlEncartes
    Left = 802
    Top = 376
  end
  object DspEncartesItens: TDataSetProvider
    DataSet = SqlEncartesItens
    Left = 866
    Top = 376
  end
  object CdsEncartes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD'
        ParamType = ptInput
      end>
    ProviderName = 'DspEncartes'
    Left = 802
    Top = 408
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
  object CdsEncartesItens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD'
        ParamType = ptInput
      end>
    ProviderName = 'DspEncartesItens'
    Left = 866
    Top = 408
    object CdsEncartesItensID_ENCARTE: TFloatField
      FieldName = 'ID_ENCARTE'
      Required = True
    end
    object CdsEncartesItensID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsEncartesItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsEncartesItensPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
  end
  object SqlRedes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' REDES'#13#10'WHERE'#13#10' DT_CADASTRO >= CURRENT_DATE -' +
      ' 5 OR'#13#10' DT_ALTERACAO >= CURRENT_DATE - 5'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 634
    Top = 464
  end
  object DspRedes: TDataSetProvider
    DataSet = SqlRedes
    Left = 634
    Top = 504
  end
  object CdsRedes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRedes'
    Left = 634
    Top = 536
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
      'SELECT'#13#10' *'#13#10'FROM'#13#10' CONCORRENTES'#13#10'WHERE'#13#10' ID_FILIAL = :ID_FILIAL ' +
      'AND'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 690
    Top = 464
  end
  object DspConcorrentes: TDataSetProvider
    DataSet = SqlConcorrentes
    Left = 690
    Top = 504
  end
  object CdsConcorrentes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspConcorrentes'
    Left = 690
    Top = 536
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
      'SELECT'#13#10' PROD_CONCORRENTES.*'#13#10'FROM'#13#10' PROD_CONCORRENTES,'#13#10' TEMP_P' +
      'RODUTOS'#13#10'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP' +
      '_PRODUTOS.PROCESSO = 148 AND'#13#10' TEMP_PRODUTOS.ENVIADO = '#39'9'#39' AND'#13#10 +
      ' PROD_CONCORRENTES.ID_FILIAL = :ID_FILIAL AND'#13#10' PROD_CONCORRENTE' +
      'S.ID_PRODUTO = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 746
    Top = 464
  end
  object DspPrecosConcorrentes: TDataSetProvider
    DataSet = SqlPrecosConcorrentes
    Left = 746
    Top = 504
  end
  object CdsPrecosConcorrentes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrecosConcorrentes'
    Left = 746
    Top = 536
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
  object SqlPrecosConcorrentesDeletados: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' TEMP_PRODUTOS_CONCORRENTES'#13#10'WHERE'#13#10' CD_FILIAL' +
      ' = :CD_FILIAL AND'#13#10' PROCESSO = 149 AND'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 802
    Top = 464
  end
  object DspPrecosConcorrentesDeletados: TDataSetProvider
    DataSet = SqlPrecosConcorrentesDeletados
    Left = 802
    Top = 504
  end
  object CdsPrecosConcorrentesDeletados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrecosConcorrentesDeletados'
    Left = 802
    Top = 536
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
  object CdsClientesDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 570
    Top = 48
  end
  object CdsPosicaoEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 642
    Top = 48
  end
  object CdsCrDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 810
    Top = 48
  end
  object SqlContasReceberDeletados: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' ID_PRODUTO,'#13#10' CD_FILIAL'#13#10'FROM'#13#10' TEMP_PRODUTOS2'#13#10'WHERE'#13#10 +
      ' PROCESSO = 150 AND'#13#10' CD_FILIAL = :FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 858
    Top = 464
  end
  object DspContasReceberDeletados: TDataSetProvider
    DataSet = SqlContasReceberDeletados
    Left = 858
    Top = 504
  end
  object CdsContasReceberDeletados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspContasReceberDeletados'
    Left = 858
    Top = 536
    object CdsContasReceberDeletadosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsContasReceberDeletadosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object SqlEstoque: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'  FIRST 2000'#13#10'  PRODUTOS.ID_PRODUTO, '#13#10'  PRODUTOS.ESTOQ' +
      'UE_1, '#13#10'  PRODUTOS.ESTOQUE_2, '#13#10'  PRODUTOS.ESTOQUE_3, '#13#10'  PRODUT' +
      'OS.ESTOQUE_4, '#13#10'  PRODUTOS.ESTOQUE_5, '#13#10'  PRODUTOS.ESTOQUE_6, '#13#10 +
      '  PRODUTOS.ESTOQUE_7, '#13#10'  PRODUTOS.ESTOQUE_8, '#13#10'  PRODUTOS.ESTOQ' +
      'UE_9, '#13#10'  PRODUTOS.ESTOQUE_10,'#13#10'  PRODUTOS.ESTOQUE_11,'#13#10'  PRODUT' +
      'OS.ESTOQUE_12,'#13#10'  PRODUTOS.ESTOQUE_13,'#13#10'  PRODUTOS.ESTOQUE_14,'#13#10 +
      '  PRODUTOS.ESTOQUE_15,'#13#10'  PRODUTOS.ESTOQUE_16,'#13#10'  PRODUTOS.ESTOQ' +
      'UE_17,'#13#10'  PRODUTOS.ESTOQUE_18,'#13#10'  PRODUTOS.ESTOQUE_19,'#13#10'  PRODUT' +
      'OS.ESTOQUE_20,'#13#10'  PRODUTOS.ESTOQUE_21,'#13#10'  PRODUTOS.ESTOQUE_22,'#13#10 +
      '  PRODUTOS.ESTOQUE_23,'#13#10'  PRODUTOS.ESTOQUE_24,'#13#10'  PRODUTOS.ESTOQ' +
      'UE_25,'#13#10'  PRODUTOS.ESTOQUE_26,'#13#10'  PRODUTOS.ESTOQUE_27,'#13#10'  PRODUT' +
      'OS.ESTOQUE_28,'#13#10'  PRODUTOS.ESTOQUE_29,'#13#10'  PRODUTOS.ESTOQUE_30,'#13#10 +
      '  PRODUTOS.DT_ULT_VENDA_1,'#13#10'  PRODUTOS.DT_ULT_VENDA_2,'#13#10'  PRODUT' +
      'OS.DT_ULT_VENDA_3,'#13#10'  PRODUTOS.DT_ULT_VENDA_4,'#13#10'  PRODUTOS.DT_UL' +
      'T_VENDA_5,'#13#10'  PRODUTOS.DT_ULT_VENDA_6,'#13#10'  PRODUTOS.DT_ULT_VENDA_' +
      '7,'#13#10'  PRODUTOS.DT_ULT_VENDA_8,'#13#10'  PRODUTOS.DT_ULT_VENDA_9,'#13#10'  PR' +
      'ODUTOS.DT_ULT_VENDA_10,'#13#10'  PRODUTOS.DT_ULT_VENDA_11,'#13#10'  PRODUTOS' +
      '.DT_ULT_VENDA_12,'#13#10'  PRODUTOS.DT_ULT_VENDA_13,'#13#10'  PRODUTOS.DT_UL' +
      'T_VENDA_14,'#13#10'  PRODUTOS.DT_ULT_VENDA_15,'#13#10'  PRODUTOS.DT_ULT_VEND' +
      'A_16,'#13#10'  PRODUTOS.DT_ULT_VENDA_17,'#13#10'  PRODUTOS.DT_ULT_VENDA_18,'#13 +
      #10'  PRODUTOS.DT_ULT_VENDA_19,'#13#10'  PRODUTOS.DT_ULT_VENDA_20,'#13#10'  PRO' +
      'DUTOS.DT_ULT_VENDA_21,'#13#10'  PRODUTOS.DT_ULT_VENDA_22,'#13#10'  PRODUTOS.' +
      'DT_ULT_VENDA_23,'#13#10'  PRODUTOS.DT_ULT_VENDA_24,'#13#10'  PRODUTOS.DT_ULT' +
      '_VENDA_25,'#13#10'  PRODUTOS.DT_ULT_VENDA_26,'#13#10'  PRODUTOS.DT_ULT_VENDA' +
      '_27,'#13#10'  PRODUTOS.DT_ULT_VENDA_28,'#13#10'  PRODUTOS.DT_ULT_VENDA_29,'#13#10 +
      '  PRODUTOS.DT_ULT_VENDA_30'#13#10'FROM '#13#10' PRODUTOS,'#13#10' TEMP_PRODUTOS2'#13#10 +
      'WHERE '#13#10' TEMP_PRODUTOS2.CD_FILIAL = :FILIAL AND'#13#10' TEMP_PRODUTOS2' +
      '.PROCESSO = 1191 AND'#13#10' PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS2.ID_P' +
      'RODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 674
    Top = 584
  end
  object DspEstoque: TDataSetProvider
    DataSet = SqlEstoque
    Left = 674
    Top = 616
  end
  object CdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspEstoque'
    Left = 674
    Top = 648
    object CdsEstoqueID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsEstoqueESTOQUE_1: TFloatField
      FieldName = 'ESTOQUE_1'
    end
    object CdsEstoqueESTOQUE_2: TFloatField
      FieldName = 'ESTOQUE_2'
    end
    object CdsEstoqueESTOQUE_3: TFloatField
      FieldName = 'ESTOQUE_3'
    end
    object CdsEstoqueESTOQUE_4: TFloatField
      FieldName = 'ESTOQUE_4'
    end
    object CdsEstoqueESTOQUE_5: TFloatField
      FieldName = 'ESTOQUE_5'
    end
    object CdsEstoqueESTOQUE_6: TFloatField
      FieldName = 'ESTOQUE_6'
    end
    object CdsEstoqueESTOQUE_7: TFloatField
      FieldName = 'ESTOQUE_7'
    end
    object CdsEstoqueESTOQUE_8: TFloatField
      FieldName = 'ESTOQUE_8'
    end
    object CdsEstoqueESTOQUE_9: TFloatField
      FieldName = 'ESTOQUE_9'
    end
    object CdsEstoqueESTOQUE_10: TFloatField
      FieldName = 'ESTOQUE_10'
    end
    object CdsEstoqueESTOQUE_11: TFloatField
      FieldName = 'ESTOQUE_11'
    end
    object CdsEstoqueESTOQUE_12: TFloatField
      FieldName = 'ESTOQUE_12'
    end
    object CdsEstoqueESTOQUE_13: TFloatField
      FieldName = 'ESTOQUE_13'
    end
    object CdsEstoqueESTOQUE_14: TFloatField
      FieldName = 'ESTOQUE_14'
    end
    object CdsEstoqueESTOQUE_15: TFloatField
      FieldName = 'ESTOQUE_15'
    end
    object CdsEstoqueESTOQUE_16: TFloatField
      FieldName = 'ESTOQUE_16'
    end
    object CdsEstoqueESTOQUE_17: TFloatField
      FieldName = 'ESTOQUE_17'
    end
    object CdsEstoqueESTOQUE_18: TFloatField
      FieldName = 'ESTOQUE_18'
    end
    object CdsEstoqueESTOQUE_19: TFloatField
      FieldName = 'ESTOQUE_19'
    end
    object CdsEstoqueESTOQUE_20: TFloatField
      FieldName = 'ESTOQUE_20'
    end
    object CdsEstoqueDT_ULT_VENDA_1: TDateField
      FieldName = 'DT_ULT_VENDA_1'
    end
    object CdsEstoqueDT_ULT_VENDA_2: TDateField
      FieldName = 'DT_ULT_VENDA_2'
    end
    object CdsEstoqueDT_ULT_VENDA_3: TDateField
      FieldName = 'DT_ULT_VENDA_3'
    end
    object CdsEstoqueDT_ULT_VENDA_4: TDateField
      FieldName = 'DT_ULT_VENDA_4'
    end
    object CdsEstoqueDT_ULT_VENDA_5: TDateField
      FieldName = 'DT_ULT_VENDA_5'
    end
    object CdsEstoqueDT_ULT_VENDA_6: TDateField
      FieldName = 'DT_ULT_VENDA_6'
    end
    object CdsEstoqueDT_ULT_VENDA_7: TDateField
      FieldName = 'DT_ULT_VENDA_7'
    end
    object CdsEstoqueDT_ULT_VENDA_8: TDateField
      FieldName = 'DT_ULT_VENDA_8'
    end
    object CdsEstoqueDT_ULT_VENDA_9: TDateField
      FieldName = 'DT_ULT_VENDA_9'
    end
    object CdsEstoqueDT_ULT_VENDA_10: TDateField
      FieldName = 'DT_ULT_VENDA_10'
    end
    object CdsEstoqueDT_ULT_VENDA_11: TDateField
      FieldName = 'DT_ULT_VENDA_11'
    end
    object CdsEstoqueDT_ULT_VENDA_12: TDateField
      FieldName = 'DT_ULT_VENDA_12'
    end
    object CdsEstoqueDT_ULT_VENDA_13: TDateField
      FieldName = 'DT_ULT_VENDA_13'
    end
    object CdsEstoqueDT_ULT_VENDA_14: TDateField
      FieldName = 'DT_ULT_VENDA_14'
    end
    object CdsEstoqueDT_ULT_VENDA_15: TDateField
      FieldName = 'DT_ULT_VENDA_15'
    end
    object CdsEstoqueDT_ULT_VENDA_16: TDateField
      FieldName = 'DT_ULT_VENDA_16'
    end
    object CdsEstoqueDT_ULT_VENDA_17: TDateField
      FieldName = 'DT_ULT_VENDA_17'
    end
    object CdsEstoqueDT_ULT_VENDA_18: TDateField
      FieldName = 'DT_ULT_VENDA_18'
    end
    object CdsEstoqueDT_ULT_VENDA_19: TDateField
      FieldName = 'DT_ULT_VENDA_19'
    end
    object CdsEstoqueDT_ULT_VENDA_20: TDateField
      FieldName = 'DT_ULT_VENDA_20'
    end
    object CdsEstoqueESTOQUE_21: TFloatField
      FieldName = 'ESTOQUE_21'
    end
    object CdsEstoqueESTOQUE_22: TFloatField
      FieldName = 'ESTOQUE_22'
    end
    object CdsEstoqueESTOQUE_23: TFloatField
      FieldName = 'ESTOQUE_23'
    end
    object CdsEstoqueESTOQUE_24: TFloatField
      FieldName = 'ESTOQUE_24'
    end
    object CdsEstoqueESTOQUE_25: TFloatField
      FieldName = 'ESTOQUE_25'
    end
    object CdsEstoqueESTOQUE_26: TFloatField
      FieldName = 'ESTOQUE_26'
    end
    object CdsEstoqueESTOQUE_27: TFloatField
      FieldName = 'ESTOQUE_27'
    end
    object CdsEstoqueESTOQUE_28: TFloatField
      FieldName = 'ESTOQUE_28'
    end
    object CdsEstoqueESTOQUE_29: TFloatField
      FieldName = 'ESTOQUE_29'
    end
    object CdsEstoqueESTOQUE_30: TFloatField
      FieldName = 'ESTOQUE_30'
    end
    object CdsEstoqueDT_ULT_VENDA_21: TDateField
      FieldName = 'DT_ULT_VENDA_21'
    end
    object CdsEstoqueDT_ULT_VENDA_22: TDateField
      FieldName = 'DT_ULT_VENDA_22'
    end
    object CdsEstoqueDT_ULT_VENDA_23: TDateField
      FieldName = 'DT_ULT_VENDA_23'
    end
    object CdsEstoqueDT_ULT_VENDA_24: TDateField
      FieldName = 'DT_ULT_VENDA_24'
    end
    object CdsEstoqueDT_ULT_VENDA_25: TDateField
      FieldName = 'DT_ULT_VENDA_25'
    end
    object CdsEstoqueDT_ULT_VENDA_26: TDateField
      FieldName = 'DT_ULT_VENDA_26'
    end
    object CdsEstoqueDT_ULT_VENDA_27: TDateField
      FieldName = 'DT_ULT_VENDA_27'
    end
    object CdsEstoqueDT_ULT_VENDA_28: TDateField
      FieldName = 'DT_ULT_VENDA_28'
    end
    object CdsEstoqueDT_ULT_VENDA_29: TDateField
      FieldName = 'DT_ULT_VENDA_29'
    end
    object CdsEstoqueDT_ULT_VENDA_30: TDateField
      FieldName = 'DT_ULT_VENDA_30'
    end
  end
  object SqlLimiteCliente: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CLIENTES.CD_CLIENTE,'#13#10' CLIENTES.LIMITE_CREDITO,'#13#10' CLIEN' +
      'TES.LIMITE_PERCENTUAL,'#13#10' CLIENTES.SALDO,'#13#10' CLIENTES.STATUS'#13#10'FROM' +
      #13#10' CLIENTES,'#13#10' TEMP_PRODUTOS2'#13#10'WHERE'#13#10' TEMP_PRODUTOS2.CD_FILIAL ' +
      '= :CD_FILIAL AND'#13#10' TEMP_PRODUTOS2.PROCESSO = 151 AND'#13#10' CLIENTES.' +
      'CD_CLIENTE = TEMP_PRODUTOS2.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 738
    Top = 584
  end
  object DspLimiteCliente: TDataSetProvider
    DataSet = SqlLimiteCliente
    Left = 738
    Top = 616
  end
  object CdsLimiteCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspLimiteCliente'
    Left = 738
    Top = 648
    object CdsLimiteClienteCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object CdsLimiteClienteLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object CdsLimiteClienteLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
    end
    object CdsLimiteClienteSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object CdsLimiteClienteSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object CdsLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 954
    Top = 576
  end
  object SqlMatriz: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 954
    Top = 464
  end
  object DspMatriz: TDataSetProvider
    DataSet = SqlMatriz
    Left = 954
    Top = 504
  end
  object CdsMatriz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMatriz'
    Left = 954
    Top = 536
  end
  object CdsVirtuaCD: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1066
    Top = 8
    object CdsVirtuaCDCD: TFloatField
      FieldName = 'CD'
    end
  end
  object SqlProjetoPharmalink: TSQLDataSet
    CommandText = 'SELECT * FROM PROJETOSPHARMALINK'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 938
    Top = 344
  end
  object DspProjetoPharmalink: TDataSetProvider
    DataSet = SqlProjetoPharmalink
    Left = 938
    Top = 376
  end
  object CdsProjetoPharmalink: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProjetoPharmalink'
    Left = 938
    Top = 408
    object CdsProjetoPharmalinkID_PROJETO: TFloatField
      FieldName = 'ID_PROJETO'
      Required = True
    end
    object CdsProjetoPharmalinkDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsProjetoPharmalinkCODIGOPHARMALINK: TStringField
      FieldName = 'CODIGOPHARMALINK'
      Size = 10
    end
    object CdsProjetoPharmalinkCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsProjetoPharmalinkSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object CdsProdutosLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 922
    Top = 48
  end
  object SqlPerfilCliente: TSQLDataSet
    CommandText = 'SELECT * FROM PERFIL_CLIENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 834
    Top = 104
  end
  object DspPerfilCliente: TDataSetProvider
    DataSet = SqlPerfilCliente
    Left = 834
    Top = 136
  end
  object CdsPerfilCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPerfilCliente'
    Left = 834
    Top = 168
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
  object SqlParametros: TSQLDataSet
    CommandText = 
      'SELECT SMSTECNICO, SMSGERENCIAL, CODIGOUSUARIO, RAZAO, FONE FROM' +
      ' PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 898
    Top = 104
  end
  object DspParametros: TDataSetProvider
    DataSet = SqlParametros
    Left = 898
    Top = 136
  end
  object CdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 898
    Top = 168
    object CdsParametrosSMSGERENCIAL: TStringField
      FieldName = 'SMSGERENCIAL'
      Size = 100
    end
    object CdsParametrosCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Size = 4
    end
    object CdsParametrosSMSTECNICO: TStringField
      FieldName = 'SMSTECNICO'
      Size = 100
    end
    object CdsParametrosRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 40
    end
    object CdsParametrosFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
  end
  object SqlAcesso: TSQLDataSet
    CommandText = 'SELECT * FROM ACESSO WHERE ID_ACESSO = -1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 962
    Top = 104
  end
  object DspAcesso: TDataSetProvider
    DataSet = SqlAcesso
    Left = 962
    Top = 136
  end
  object CdsAcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAcesso'
    Left = 962
    Top = 168
    object CdsAcessoID_ACESSO: TFloatField
      FieldName = 'ID_ACESSO'
      Required = True
    end
    object CdsAcessoID_CLIENTE: TFloatField
      FieldName = 'ID_CLIENTE'
    end
    object CdsAcessoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object CdsAcessoMAQUINA: TStringField
      FieldName = 'MAQUINA'
      Size = 100
    end
    object CdsAcessoDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsAcessoHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsAcessoCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 100
    end
    object CdsAcessoVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 100
    end
    object CdsAcessoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 100
    end
    object CdsAcessoRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 100
    end
    object CdsAcessoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
  end
  object SQLContas_Pagar: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONTAS_PAGAR.*'#13#10'FROM'#13#10' CONTAS_PAGAR, TEMP_PRODUTOS2'#13#10'WH' +
      'ERE'#13#10' TEMP_PRODUTOS2.PROCESSO = 122 AND'#13#10' TEMP_PRODUTOS2.CD_FILI' +
      'AL = :CD_FILIAL AND'#13#10' CONTAS_PAGAR.CD_CONTAS_PAGAR = TEMP_PRODUT' +
      'OS2.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 826
    Top = 224
  end
  object DspContas_Pagar: TDataSetProvider
    DataSet = SQLContas_Pagar
    Left = 826
    Top = 256
  end
  object CdsContas_Pagar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspContas_Pagar'
    Left = 826
    Top = 288
    object CdsContas_PagarCD_CONTAS_PAGAR: TFloatField
      FieldName = 'CD_CONTAS_PAGAR'
      Required = True
    end
    object CdsContas_PagarCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsContas_PagarCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsContas_PagarCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object CdsContas_PagarCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object CdsContas_PagarCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsContas_PagarCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsContas_PagarNUMERO_NOTA: TStringField
      FieldName = 'NUMERO_NOTA'
      Size = 10
    end
    object CdsContas_PagarSERIAL_NOTA: TStringField
      FieldName = 'SERIAL_NOTA'
      Size = 3
    end
    object CdsContas_PagarDOCUMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'DOCUMENTO'
    end
    object CdsContas_PagarDT_NOTA: TDateField
      FieldName = 'DT_NOTA'
    end
    object CdsContas_PagarDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsContas_PagarVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsContas_PagarOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsContas_PagarDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object CdsContas_PagarDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object CdsContas_PagarDT_BOLETO: TDateField
      FieldName = 'DT_BOLETO'
    end
    object CdsContas_PagarDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
    end
    object CdsContas_PagarVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object CdsContas_PagarVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object CdsContas_PagarVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object CdsContas_PagarVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object CdsContas_PagarNOSSO_NUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'NOSSO_NUMERO'
    end
    object CdsContas_PagarBANCO: TStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object CdsContas_PagarAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 6
    end
    object CdsContas_PagarCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object CdsContas_PagarHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CdsContas_PagarNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object CdsContas_PagarSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsContas_PagarENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsContas_PagarDESPESAFINANCEIRA: TFloatField
      FieldName = 'DESPESAFINANCEIRA'
    end
  end
  object SqlParametrosFarmax: TSQLDataSet
    CommandText = 'SELECT VERSAO_GESTOR, VERSAO_LOJA'#13#10'FROM PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 954
    Top = 216
  end
  object DspParametrosFarmax: TDataSetProvider
    DataSet = SqlParametrosFarmax
    Left = 954
    Top = 256
  end
  object CdsParametrosFarmax: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametrosFarmax'
    Left = 954
    Top = 288
    object CdsParametrosFarmaxVERSAO_GESTOR: TStringField
      FieldName = 'VERSAO_GESTOR'
    end
    object CdsParametrosFarmaxVERSAO_LOJA: TStringField
      FieldName = 'VERSAO_LOJA'
    end
  end
  object SqlProdutosQuantidade: TSQLDataSet
    CommandText = 
      'SELECT ID_PRODUTO, PRECO_VENDA, QUANTIDADEINICIAL'#13#10'FROM FILIAIS_' +
      'PRECO_QUANTIDADE'#13#10'WHERE CD_FILIAL||ID_PRODUTO IN'#13#10'(SELECT CD_FIL' +
      'IAL||ID_PRODUTO FROM TEMP_PRODUTOS_QUANTIDADE WHERE CD_FILIAL = ' +
      ':FILIAL)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1050
    Top = 104
  end
  object DspProdutosQuantidade: TDataSetProvider
    DataSet = SqlProdutosQuantidade
    Left = 1050
    Top = 136
  end
  object CdsProdutosQuantidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosQuantidade'
    Left = 1050
    Top = 168
    object CdsProdutosQuantidadeID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsProdutosQuantidadeQUANTIDADEINICIAL: TFloatField
      FieldName = 'QUANTIDADEINICIAL'
      Required = True
    end
    object CdsProdutosQuantidadePRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
  end
  object SqlProdutosFP: TSQLDataSet
    CommandText = 
      'SELECT * FROM PRODUTOS_FARMACIA_POPULAR'#13#10'WHERE ID_PRODUTO IN'#13#10'(S' +
      'ELECT ID_PRODUTO FROM TEMP_PRODUTOS WHERE CD_FILIAL = :FILIAL AN' +
      'D PROCESSO = 155)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1018
    Top = 224
  end
  object DspProdutosFP: TDataSetProvider
    DataSet = SqlProdutosFP
    Left = 1018
    Top = 256
  end
  object CdsProdutosFP: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosFP'
    Left = 1018
    Top = 288
    object CdsProdutosFPID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
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
  object CdsConferenciaNota: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 986
    Top = 8
  end
  object SqlLotesItensCompras: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' ITENS_COMPRA_LOTE.* '#13#10'FROM '#13#10' ITENS_COMPRA_LOTE,'#13#10'TEMP' +
      '_ITENS_COMPRA_LOTE'#13#10'WHERE '#13#10' ITENS_COMPRA_LOTE.CD_COMPRAS = TEMP' +
      '_ITENS_COMPRA_LOTE.CD_COMPRAS AND'#13#10' ITENS_COMPRA_LOTE.ID_PRODUTO' +
      ' = TEMP_ITENS_COMPRA_LOTE.ID_PRODUTO AND'#13#10' ITENS_COMPRA_LOTE.LOT' +
      'E = TEMP_ITENS_COMPRA_LOTE.LOTE AND'#13#10' TEMP_ITENS_COMPRA_LOTE.CD_' +
      'FILIAL = :CD_FILIAL AND'#13#10' TEMP_ITENS_COMPRA_LOTE.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1050
    Top = 344
  end
  object DspLotesItensCompras: TDataSetProvider
    DataSet = SqlLotesItensCompras
    Left = 1050
    Top = 376
  end
  object CdsLotesItensCompras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspLotesItensCompras'
    Left = 1050
    Top = 408
    object CdsLotesItensComprasCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
      Required = True
    end
    object CdsLotesItensComprasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsLotesItensComprasCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object CdsLotesItensComprasNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsLotesItensComprasID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsLotesItensComprasLOTE: TStringField
      FieldName = 'LOTE'
      Required = True
    end
    object CdsLotesItensComprasQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsLotesItensComprasFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object CdsLotesItensComprasVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
  end
  object CdsLotesCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 994
    Top = 48
  end
  object SqlReexportacao: TSQLDataSet
    CommandText = 
      'SELECT * FROM TEMP_REEXPORTACAO'#13#10'WHERE CD_FILIAL = :CD_FILIAL AN' +
      'D ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1026
    Top = 464
  end
  object DspReexportacao: TDataSetProvider
    DataSet = SqlReexportacao
    Left = 1026
    Top = 504
  end
  object CdsReexportacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspReexportacao'
    Left = 1026
    Top = 536
    object CdsReexportacaoCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsReexportacaoDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsReexportacaoENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlInterligacao: TSQLDataSet
    CommandText = 'SELECT * FROM SP_INTERLIGACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1026
    Top = 576
  end
  object DspInterligacao: TDataSetProvider
    DataSet = SqlInterligacao
    Left = 1026
    Top = 616
  end
  object CdsInterligacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspInterligacao'
    Left = 1026
    Top = 656
    object CdsInterligacaoID_LOG: TFloatField
      FieldName = 'ID_LOG'
    end
    object CdsInterligacaoCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsInterligacaoIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object CdsInterligacaoDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsInterligacaoHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsInterligacaoCHAVE_ACESSO: TStringField
      FieldName = 'CHAVE_ACESSO'
      Size = 50
    end
    object CdsInterligacaoNUMERO_ITENS: TFloatField
      FieldName = 'NUMERO_ITENS'
    end
    object CdsInterligacaoNUMERO_UNIDADES: TFloatField
      FieldName = 'NUMERO_UNIDADES'
    end
    object CdsInterligacaoTOTAL_CUSTO: TFloatField
      FieldName = 'TOTAL_CUSTO'
    end
    object CdsInterligacaoTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
    end
    object CdsInterligacaoCLASSES: TFloatField
      FieldName = 'CLASSES'
    end
    object CdsInterligacaoGRUPOS: TFloatField
      FieldName = 'GRUPOS'
    end
    object CdsInterligacaoLABORATORIOS: TFloatField
      FieldName = 'LABORATORIOS'
    end
    object CdsInterligacaoDISTRIBUIDORES: TFloatField
      FieldName = 'DISTRIBUIDORES'
    end
    object CdsInterligacaoFAMILIAS: TFloatField
      FieldName = 'FAMILIAS'
    end
    object CdsInterligacaoGRUPOSBALANCO: TFloatField
      FieldName = 'GRUPOSBALANCO'
    end
    object CdsInterligacaoGRUPOSCOMPRAS: TFloatField
      FieldName = 'GRUPOSCOMPRAS'
    end
    object CdsInterligacaoCARTOES: TFloatField
      FieldName = 'CARTOES'
    end
    object CdsInterligacaoTOTAL_PROMOCAO: TFloatField
      FieldName = 'TOTAL_PROMOCAO'
    end
    object CdsInterligacaoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
  end
  object SqlProdutosFidelidade: TSQLDataSet
    CommandText = 
      'SELECT ID_PRODUTO, CD_PRODUTO, CD_LABORATORIO, CD_GRUPO, DESCRIC' +
      'AO, PRECO, DT_ALTERACAO FROM FILIAIS_FIDELIDADE'#13#10'WHERE CD_FILIAL' +
      ' = :CD_FILIAL AND ID_PRODUTO IN'#13#10'(SELECT ID_PRODUTO FROM TEMP_PR' +
      'ODUTOS WHERE CD_FILIAL = :FILIAL AND PROCESSO = 158)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1082
    Top = 224
  end
  object DspProdutosFidelidade: TDataSetProvider
    DataSet = SqlProdutosFidelidade
    Left = 1082
    Top = 256
  end
  object CdsProdutosFidelidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosFidelidade'
    Left = 1082
    Top = 288
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
  object CdsCaixasDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1138
    Top = 8
  end
  object CdsControlador: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 762
    Top = 48
    Data = {
      410100009619E0BD0100000018000000100000000000030000004101074E5F49
      74656E7304000100000000000A4E5F556E696461646573080004000000000007
      545F437573746F080004000000000007545F56656E646108000400000000000A
      545F50726F6D6F63616F080004000000000007434C4153534553080004000000
      000006475255504F5308000400000000000C4C41424F5241544F52494F530800
      0400000000000E444953545249425549444F5245530800040000000000084641
      4D494C49415308000400000000000D475255504F5342414C414E434F08000400
      000000000D475255504F53434F4D50524153080004000000000007434152544F
      455308000400000000000B4C414E43414D454E544F5308000400000000000643
      414958415308000400000000000D434F4E544153524543454245520800040000
      0000000000}
    object CdsControladorN_Itens: TIntegerField
      FieldName = 'N_Itens'
    end
    object CdsControladorN_Unidades: TFloatField
      FieldName = 'N_Unidades'
    end
    object CdsControladorT_Custo: TFloatField
      FieldName = 'T_Custo'
    end
    object CdsControladorT_Venda: TFloatField
      FieldName = 'T_Venda'
    end
    object CdsControladorT_Promocao: TFloatField
      FieldName = 'T_Promocao'
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
  object DspDuplicatas: TDataSetProvider
    DataSet = SqlDuplicatas
    Left = 1122
    Top = 504
  end
  object SqlLogBoletos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM LOGBOLETOS'#13#10'WHERE ID_CLIENTE = -1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1122
    Top = 576
  end
  object DspLogBoletos: TDataSetProvider
    DataSet = SqlLogBoletos
    Left = 1122
    Top = 616
  end
  object CdsDuplicatas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'DspDuplicatas'
    Left = 1122
    Top = 536
    object CdsDuplicatasID_BOLETO: TIntegerField
      FieldName = 'ID_BOLETO'
    end
    object CdsDuplicatasOLD: TStringField
      FieldName = 'OLD'
      Size = 8
    end
    object CdsDuplicatasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object CdsDuplicatasID_CLIENTE: TFloatField
      FieldName = 'ID_CLIENTE'
    end
    object CdsDuplicatasAREA: TStringField
      FieldName = 'AREA'
      Size = 1
    end
    object CdsDuplicatasCD_VENDED: TStringField
      FieldName = 'CD_VENDED'
      Size = 2
    end
    object CdsDuplicatasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsDuplicatasDT_VENC: TDateField
      FieldName = 'DT_VENC'
    end
    object CdsDuplicatasDT_PAGAM: TDateField
      FieldName = 'DT_PAGAM'
    end
    object CdsDuplicatasCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Size = 1
    end
    object CdsDuplicatasVL_PAGO: TFloatField
      FieldName = 'VL_PAGO'
    end
    object CdsDuplicatasFI_CLINICA: TStringField
      FieldName = 'FI_CLINICA'
      Size = 15
    end
    object CdsDuplicatasTP_PAGAM: TStringField
      FieldName = 'TP_PAGAM'
      Size = 1
    end
    object CdsDuplicatasCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Size = 10
    end
    object CdsDuplicatasFORMA: TStringField
      FieldName = 'FORMA'
      Size = 2
    end
    object CdsDuplicatasDESCRICAOFORMA: TStringField
      FieldName = 'DESCRICAOFORMA'
      Size = 100
    end
    object CdsDuplicatasUSUARIO_BAIXA: TStringField
      FieldName = 'USUARIO_BAIXA'
      Size = 100
    end
    object CdsDuplicatasDESCRICAOSERVICO: TStringField
      FieldName = 'DESCRICAOSERVICO'
      Size = 100
    end
    object CdsDuplicatasTP_BOLETO: TStringField
      FieldName = 'TP_BOLETO'
      Size = 1
    end
  end
  object CdsLogBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLogBoletos'
    Left = 1122
    Top = 656
    object CdsLogBoletosID_CLIENTE: TFloatField
      FieldName = 'ID_CLIENTE'
    end
    object CdsLogBoletosCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Size = 10
    end
    object CdsLogBoletosDATAGERACAO: TDateField
      FieldName = 'DATAGERACAO'
    end
    object CdsLogBoletosHORAGERACAO: TTimeField
      FieldName = 'HORAGERACAO'
    end
    object CdsLogBoletosDATAVENCIMETNO: TDateField
      FieldName = 'DATAVENCIMETNO'
    end
    object CdsLogBoletosVALORREAL: TFloatField
      FieldName = 'VALORREAL'
    end
    object CdsLogBoletosVALORBOLETO: TFloatField
      FieldName = 'VALORBOLETO'
    end
  end
  object SqlDuplicatas: TSQLDataSet
    CommandText = 
      'SELECT DUPLICATAS.*'#13#10'FROM DUPLICATAS, CLIENTES '#13#10'WHERE'#13#10' CLIENTE' +
      'S.STATUS = '#39'A'#39' AND  '#13#10' DUPLICATAS.ID_CLIENTE = CLIENTES.ID_CLIEN' +
      'TE AND '#13#10' CLIENTES.ID_CLIENTE = :ID AND CLIENTES.CNPJ = :CNPJ AN' +
      'D'#13#10' DUPLICATAS.CONTROLE = '#39'A'#39' AND'#13#10' DUPLICATAS.DT_VENC <= :DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1122
    Top = 464
  end
  object CdsLogBoletosVirtual: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLogBoletos'
    Left = 1248
    Top = 56
    object CdsLogBoletosVirtualID_CLIENTE: TFloatField
      FieldName = 'ID_CLIENTE'
    end
    object CdsLogBoletosVirtualCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Size = 10
    end
    object CdsLogBoletosVirtualDATAGERACAO: TDateField
      FieldName = 'DATAGERACAO'
    end
    object CdsLogBoletosVirtualHORAGERACAO: TTimeField
      FieldName = 'HORAGERACAO'
    end
    object CdsLogBoletosVirtualDATAVENCIMETNO: TDateField
      FieldName = 'DATAVENCIMETNO'
    end
    object CdsLogBoletosVirtualVALORREAL: TFloatField
      FieldName = 'VALORREAL'
    end
    object CdsLogBoletosVirtualVALORBOLETO: TFloatField
      FieldName = 'VALORBOLETO'
    end
  end
  object SqlPrincipioAtivo: TSQLDataSet
    CommandText = 
      'SELECT * FROM PRINCIPIO_ATIVO'#13#10'WHERE CD_PRINCIPIO IN'#13#10'(SELECT ID' +
      '_PRODUTO FROM TEMP_PRODUTOS WHERE CD_FILIAL = :FILIAL AND PROCES' +
      'SO = 159)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1162
    Top = 96
  end
  object DspPrincipioAtivo: TDataSetProvider
    DataSet = SqlPrincipioAtivo
    Left = 1162
    Top = 136
  end
  object CdsPrincipioAtivo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspPrincipioAtivo'
    Left = 1162
    Top = 168
    object CdsPrincipioAtivoCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
      Required = True
    end
    object CdsPrincipioAtivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1210
    Top = 464
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 1210
    Top = 504
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 1210
    Top = 544
  end
  object SqlSubGrupos: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' SUBGRUPOS.*'#13#10'FROM'#13#10' SUBGRUPOS,'#13#10' TEMP_PRODUTOS'#13#10'WHERE'#13 +
      #10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS.PROCE' +
      'SSO = 135 AND'#13#10' SUBGRUPOS.CD_SUBGRUPO = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1170
    Top = 221
  end
  object DspSubGrupos: TDataSetProvider
    DataSet = SqlSubGrupos
    Left = 1170
    Top = 256
  end
  object CdsSubGrupos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspSubGrupos'
    Left = 1170
    Top = 291
    object CdsSubGruposCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
      Required = True
    end
    object CdsSubGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsSubGruposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsSubGruposDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsSubGruposENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlProdDistr: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' PROD_DISTR.*'#13#10'FROM'#13#10' PROD_DISTR,'#13#10' TEMP_PRODUTOS'#13#10'WHER' +
      'E'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS.PRO' +
      'CESSO = 160 AND'#13#10' PROD_DISTR.ID_PRODUTO = TEMP_PRODUTOS.ID_PRODU' +
      'TO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1130
    Top = 344
  end
  object DspProdDistr: TDataSetProvider
    DataSet = SqlProdDistr
    Left = 1130
    Top = 376
  end
  object CdsProdDistr: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdDistr'
    Left = 1130
    Top = 408
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
  object SqlDicionarioFarmax: TSQLDataSet
    CommandText = 
      'SELECT * FROM PRODUTOS_FISCO'#13#10'WHERE'#13#10' CODIGO_BARRAS_1 = :CODIGO_' +
      'BARRAS OR'#13#10' CODIGO_BARRAS_2 = :CODIGO_BARRAS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1202
    Top = 344
  end
  object DspDicionarioFarmax: TDataSetProvider
    DataSet = SqlDicionarioFarmax
    Left = 1202
    Top = 376
  end
  object CdsDicionarioFarmax: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end>
    ProviderName = 'DspDicionarioFarmax'
    Left = 1202
    Top = 408
    object CdsDicionarioFarmaxCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Required = True
      Size = 4
    end
    object CdsDicionarioFarmaxID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsDicionarioFarmaxCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Required = True
      Size = 14
    end
    object CdsDicionarioFarmaxCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 14
    end
    object CdsDicionarioFarmaxDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsDicionarioFarmaxCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object CdsDicionarioFarmaxCD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object CdsDicionarioFarmaxNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object CdsDicionarioFarmaxCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object CdsDicionarioFarmaxORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsDicionarioFarmaxSITUACAOTRIBUTARIA: TStringField
      FieldName = 'SITUACAOTRIBUTARIA'
      Size = 3
    end
    object CdsDicionarioFarmaxCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 3
    end
    object CdsDicionarioFarmaxICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsDicionarioFarmaxCHAVE: TStringField
      FieldName = 'CHAVE'
    end
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
    BeforeConnect = SQLConnection1BeforeConnect
    Left = 1336
    Top = 8
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 1106
    Top = 72
  end
  object SqlFiliaisGrupos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' FILIAIS_GRUPOS'#13#10'WHERE'#13#10' CD_FILIAL = :FILIAL ' +
      'AND'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1242
    Top = 93
  end
  object DspFiliaisGrupos: TDataSetProvider
    DataSet = SqlFiliaisGrupos
    Left = 1242
    Top = 128
  end
  object CdsFiliaisGrupos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspFiliaisGrupos'
    Left = 1242
    Top = 160
    object CdsFiliaisGruposCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsFiliaisGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object CdsFiliaisGruposTX_COMISSAO: TFloatField
      FieldName = 'TX_COMISSAO'
    end
    object CdsFiliaisGruposDESCONTO: TStringField
      FieldName = 'DESCONTO'
      Size = 1
    end
    object CdsFiliaisGruposTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsFiliaisGruposTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object CdsFiliaisGruposENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlProdutosFisco: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' PRODUTOS_FISCO.*'#13#10'FROM'#13#10' PRODUTOS_FISCO,'#13#10' TEMP_PRODUT' +
      'OS'#13#10'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PROD' +
      'UTOS.PROCESSO = 161 AND'#13#10' PRODUTOS_FISCO.ID_PRODUTO = TEMP_PRODU' +
      'TOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1250
    Top = 216
  end
  object DspProdutosFisco: TDataSetProvider
    DataSet = SqlProdutosFisco
    Left = 1250
    Top = 256
  end
  object CdsProdutosFisco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosFisco'
    Left = 1250
    Top = 288
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
  object CdsProdutosLotesST: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1074
    Top = 48
  end
  object SqlProdutosCompostos: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' PRODUTOS_COMPOSTOS.*'#13#10'FROM'#13#10' PRODUTOS_COMPOSTOS,'#13#10' TEM' +
      'P_PRODUTOS_COMPOSTOS'#13#10'WHERE'#13#10' TEMP_PRODUTOS_COMPOSTOS.CD_FILIAL ' +
      '= :CD_FILIAL AND'#13#10' TEMP_PRODUTOS_COMPOSTOS.PROCESSO = 162 AND'#13#10' ' +
      'PRODUTOS_COMPOSTOS.ID_PRODUTO_PRINCIPAL = TEMP_PRODUTOS_COMPOSTO' +
      'S.ID_PRODUTO_PRINCIPAL AND'#13#10' PRODUTOS_COMPOSTOS.ID_PRODUTO_COMPO' +
      'SICAO = TEMP_PRODUTOS_COMPOSTOS.ID_PRODUTO_COMPOSICAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1290
    Top = 336
  end
  object DspProdutosCompostos: TDataSetProvider
    DataSet = SqlProdutosCompostos
    Left = 1290
    Top = 376
  end
  object CdsProdutosCompostos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosCompostos'
    Left = 1290
    Top = 408
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
  object CdsLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 42
    Top = 8
  end
  object CdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 42
    Top = 56
  end
  object CdsCadFin: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 8
  end
  object SqlConvenios_Grupos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONVENIOS_GRUPOS.*'#13#10'FROM'#13#10' CONVENIOS_GRUPOS,'#13#10' TEMP_PRO' +
      'DUTOS'#13#10'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_P' +
      'RODUTOS.PROCESSO = 136 AND'#13#10' CONVENIOS_GRUPOS.CD_CONVENIO = TEMP' +
      '_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1306
    Top = 472
  end
  object DspConvenios_Grupos: TDataSetProvider
    DataSet = SqlConvenios_Grupos
    Left = 1306
    Top = 512
  end
  object CdsConvenios_Grupos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspConvenios_Grupos'
    Left = 1306
    Top = 544
    object CdsConvenios_GruposCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
      Required = True
    end
    object CdsConvenios_GruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object CdsConvenios_GruposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object CdsConvenios_GruposDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
  end
  object SqlComprasBoletos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COMPRAS_BOLETOS.*'#13#10'FROM'#13#10' COMPRAS_BOLETOS,'#13#10' TEMP_COMPR' +
      'AS'#13#10'WHERE'#13#10' COMPRAS_BOLETOS.CD_COMPRAS = TEMP_COMPRAS.CD_COMPRAS' +
      ' AND'#13#10' COMPRAS_BOLETOS.CD_BOLETO = TEMP_COMPRAS.ID_PRODUTO AND'#13#10 +
      ' TEMP_COMPRAS.PROCESSO = '#39'163'#39' AND'#13#10' TEMP_COMPRAS.ENVIADO = '#39'9'#39' ' +
      'AND'#13#10' TEMP_COMPRAS.CD_FILIAL = :CD_FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1312
    Top = 88
  end
  object DspComprasBoletos: TDataSetProvider
    DataSet = SqlComprasBoletos
    Left = 1312
    Top = 128
  end
  object CdsComprasBoletos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspComprasBoletos'
    Left = 1312
    Top = 168
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
  object CdsRecebeComprasBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1178
    Top = 48
  end
  object SqlContasPagarCompras: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONTAS_PAGAR_COMPRAS.*'#13#10'FROM'#13#10' CONTAS_PAGAR_COMPRAS,'#13#10' ' +
      'TEMP_PRODUTOS'#13#10'WHERE'#13#10' TEMP_PRODUTOS.CD_FILIAL = :CD_FILIAL AND'#13 +
      #10' TEMP_PRODUTOS.PROCESSO = 137 AND'#13#10' CONTAS_PAGAR_COMPRAS.CD_COM' +
      'PRAS = TEMP_PRODUTOS.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1210
    Top = 600
  end
  object DspContasPagarCompras: TDataSetProvider
    DataSet = SqlContasPagarCompras
    Left = 1210
    Top = 640
  end
  object CdsContasPagarCompras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspContasPagarCompras'
    Left = 1210
    Top = 672
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
  object CdsContasPagar_Compras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1234
    Top = 16
  end
  object SqlConveniosPBM: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CONVENIOS_PBM.*'#13#10'FROM'#13#10' CONVENIOS_PBM, TEMP_PRODUTOS'#13#10'W' +
      'HERE'#13#10' CONVENIOS_PBM.ID_CONVENIOPBM = TEMP_PRODUTOS.ID_PRODUTO A' +
      'ND'#13#10' TEMP_PRODUTOS.CD_FILIAL = :FILIAL AND'#13#10' TEMP_PRODUTOS.PROCE' +
      'SSO = '#39'107'#39' AND'#13#10' TEMP_PRODUTOS.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1320
    Top = 216
  end
  object DspConveniosPBM: TDataSetProvider
    DataSet = SqlConveniosPBM
    Left = 1320
    Top = 256
  end
  object CdsConveniosPBM: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspConveniosPBM'
    Left = 1320
    Top = 288
    object CdsConveniosPBMID_CONVENIOPBM: TFloatField
      FieldName = 'ID_CONVENIOPBM'
      Required = True
    end
    object CdsConveniosPBMNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object CdsConveniosPBMURL: TStringField
      FieldName = 'URL'
      Size = 1000
    end
    object CdsConveniosPBMENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlProdutosConveniosPBM: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' PRODUTOS_CONVENIOS_PBM.*'#13#10'FROM'#13#10' PRODUTOS_CONVENIOS_PBM' +
      ', TEMP_PRODUTOS'#13#10'WHERE'#13#10' PRODUTOS_CONVENIOS_PBM.ID_PRODUTOSCONVE' +
      'NIOPBM = TEMP_PRODUTOS.ID_PRODUTO AND'#13#10' TEMP_PRODUTOS.CD_FILIAL ' +
      '= :FILIAL AND'#13#10' TEMP_PRODUTOS.PROCESSO = '#39'138'#39' AND'#13#10' TEMP_PRODUT' +
      'OS.ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1344
    Top = 336
  end
  object DspProdutosConveniosPBM: TDataSetProvider
    DataSet = SqlProdutosConveniosPBM
    Left = 1344
    Top = 376
  end
  object CdsProdutosConveniosPBM: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosConveniosPBM'
    Left = 1344
    Top = 408
    object CdsProdutosConveniosPBMID_PRODUTOSCONVENIOPBM: TFloatField
      FieldName = 'ID_PRODUTOSCONVENIOPBM'
      Required = True
    end
    object CdsProdutosConveniosPBMID_CONVENIOPBM: TFloatField
      FieldName = 'ID_CONVENIOPBM'
    end
    object CdsProdutosConveniosPBMID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsProdutosConveniosPBMENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object Dsp1: TDataSetProvider
    DataSet = Sql1
    Left = 738
    Top = 88
  end
  object Cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp1'
    Left = 786
    Top = 88
  end
  object SqlUsuariosGrupos: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' USUARIOS_GRUPOS.* '#13#10'FROM '#13#10' USUARIOS_GRUPOS, TEMP_COMP' +
      'RAS'#13#10'WHERE '#13#10'TEMP_COMPRAS.CD_FILIAL = :CD_FILIAL AND'#13#10'TEMP_COMPR' +
      'AS.PROCESSO = '#39'139'#39' AND'#13#10'USUARIOS_GRUPOS.CD_USUARIO = TEMP_COMPR' +
      'AS.CD_COMPRAS AND'#13#10'USUARIOS_GRUPOS.CD_GRUPO = TEMP_COMPRAS.ID_PR' +
      'ODUTO AND'#13#10'USUARIOS_GRUPOS.CD_FILIAL = TEMP_COMPRAS.CD_FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1307
    Top = 600
  end
  object DspUsuariosGrupos: TDataSetProvider
    DataSet = SqlUsuariosGrupos
    Left = 1307
    Top = 640
  end
  object CdsUsuariosGrupos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspUsuariosGrupos'
    Left = 1307
    Top = 673
    object CdsUsuariosGruposCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object CdsUsuariosGruposCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsUsuariosGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object CdsUsuariosGruposTX_DESCONTO_MAXIMO: TFMTBCDField
      FieldName = 'TX_DESCONTO_MAXIMO'
      Precision = 18
      Size = 2
    end
    object CdsUsuariosGruposENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsVendasItensExcluidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1328
    Top = 56
  end
  object SqlProdutosBarras: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' PRODUTOS_BARRAS.*, TEMP_PRODUTOS_BARRAS2.BARRA_ANTIGA'#13 +
      #10'FROM'#13#10' PRODUTOS_BARRAS,'#13#10' TEMP_PRODUTOS_BARRAS2'#13#10'WHERE'#13#10' TEMP_P' +
      'RODUTOS_BARRAS2.CD_FILIAL = :CD_FILIAL AND'#13#10' TEMP_PRODUTOS_BARRA' +
      'S2.PROCESSO = 164 AND'#13#10' PRODUTOS_BARRAS.ID_PRODUTO = TEMP_PRODUT' +
      'OS_BARRAS2.ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1312
    Top = 464
  end
  object DspProdutosBarras: TDataSetProvider
    DataSet = SqlProdutosBarras
    Left = 1312
    Top = 504
  end
  object CdsProdutosBarras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspProdutosBarras'
    Left = 1312
    Top = 536
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
