object DmExporterClient: TDmExporterClient
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 741
  Width = 1418
  object HTTPRIO1: THTTPRIO
    URL = 
      'http://farmax.ddns.com.br/ExporterServer/ExporterServer.exe/soap' +
      '/IDm'
    HTTPWebNode.URL = 
      'http://farmax.ddns.com.br/ExporterServer/ExporterServer.exe/soap' +
      '/IDm'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 120
    Top = 6
  end
  object SqlControlador: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(ID_PRODUTO) AS N_ITENS,'#13#10' SUM(ESTOQUE_0) AS N_UNI' +
      'DADES,'#13#10' SUM(CUSTO_UNITARIO) AS T_CUSTO,'#13#10' SUM(PRECO_VbENDA) AS ' +
      'T_VENDA'#13#10'FROM'#13#10' PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 700
    Top = 383
  end
  object DspControlador: TDataSetProvider
    DataSet = SqlControlador
    Left = 700
    Top = 420
  end
  object CdsControlador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspControlador'
    Left = 700
    Top = 460
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
  end
  object CdsGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 415
    Top = 188
    object CdsGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object CdsGruposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsGruposTX_MARCACAO: TFloatField
      FieldName = 'TX_MARCACAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposDESCONTO: TStringField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsGruposTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposTX_COMISSAO: TFloatField
      FieldName = 'TX_COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposDIAS_EST_MIN: TFloatField
      FieldName = 'DIAS_EST_MIN'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object CdsGruposDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposNPRODUTOS: TFloatField
      FieldName = 'NPRODUTOS'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposVPRODUTOS: TFloatField
      FieldName = 'VPRODUTOS'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposCPRODUTOS: TFloatField
      FieldName = 'CPRODUTOS'
      ProviderFlags = [pfInUpdate]
    end
    object CdsGruposEXIGERECEITA: TStringField
      FieldName = 'EXIGERECEITA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsGruposVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsGruposPEDECRM: TStringField
      FieldName = 'PEDECRM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsGruposENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsGruposIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CdsGruposNITENS: TFloatField
      FieldName = 'NITENS'
    end
    object CdsGruposMETA: TFloatField
      FieldName = 'META'
    end
  end
  object CdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 98
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
    object CdsPlanoContasAPURACAO: TIntegerField
      FieldName = 'APURACAO'
    end
  end
  object Sql1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 252
    Top = 6
  end
  object CdsLaboratorios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 100
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
  object CdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 100
    object CdsVendedoresCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object CdsVendedoresCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CdsVendedoresDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresTIPO_FUNCIONARIO: TStringField
      FieldName = 'TIPO_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object CdsVendedoresNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CdsVendedoresRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object CdsVendedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 23
    end
    object CdsVendedoresUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object CdsVendedoresCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CdsVendedoresFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsVendedoresREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsVendedoresRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object CdsVendedoresCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object CdsVendedoresJORNADA: TStringField
      FieldName = 'JORNADA'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object CdsVendedoresINTERVALO: TStringField
      FieldName = 'INTERVALO'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object CdsVendedoresREPOUSO: TStringField
      FieldName = 'REPOUSO'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object CdsVendedoresNR_REGISTRO: TStringField
      FieldName = 'NR_REGISTRO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CdsVendedoresCTPS: TStringField
      FieldName = 'CTPS'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object CdsVendedoresFUNCAO: TStringField
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresSALARIO: TFloatField
      FieldName = 'SALARIO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresTX_COMISSAO: TFloatField
      FieldName = 'TX_COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresVENDA: TFloatField
      FieldName = 'VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object CdsVendedoresENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresSEXO: TStringField
      FieldName = 'SEXO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresCONJUGE: TStringField
      FieldName = 'CONJUGE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsVendedoresDT_NASC_CONJUGE: TDateField
      FieldName = 'DT_NASC_CONJUGE'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresNUM_DEPEND: TFloatField
      FieldName = 'NUM_DEPEND'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsVendedoresNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsVendedoresEMPRESA_ANTERIOR: TStringField
      FieldName = 'EMPRESA_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsVendedoresTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CdsVendedoresREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 51
    end
    object CdsVendedoresREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      ProviderFlags = [pfInUpdate]
      Size = 51
    end
    object CdsVendedoresDESCONTO: TStringField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresCOMISSAO_MEDICAMENTOS: TStringField
      FieldName = 'COMISSAO_MEDICAMENTOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresCOMISSAO_BONIFICADOS: TStringField
      FieldName = 'COMISSAO_BONIFICADOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresCOMISSAO_PERFUMARIA: TStringField
      FieldName = 'COMISSAO_PERFUMARIA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresCOMISSAO_OUTROS: TStringField
      FieldName = 'COMISSAO_OUTROS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresCOTA: TFloatField
      FieldName = 'COTA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object CdsVendedoresDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsVendedoresSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsVendedoresFOTO: TBlobField
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CdsVendedoresVENDEOUTRALOJA: TStringField
      FieldName = 'VENDEOUTRALOJA'
      Size = 1
    end
    object CdsVendedoresSENHAFARMACIAPOPULAR: TStringField
      FieldName = 'SENHAFARMACIAPOPULAR'
      Size = 8
    end
    object CdsVendedoresUSUARIOFARMACIAPOPULAR: TStringField
      FieldName = 'USUARIOFARMACIAPOPULAR'
      Size = 8
    end
  end
  object SqlMetasFiliais: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' *'#13#10'FROM'#13#10' METAS_FILIAIS'#13#10'WHERE'#13#10' METAS_FILIAIS.ID_META' +
      ' = :ID_META'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'ID_META'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 324
    Top = 539
  end
  object DspMetasFiliais: TDataSetProvider
    DataSet = SqlMetasFiliais
    Left = 324
    Top = 575
  end
  object QryMetasFiliais: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFixedChar
        Name = 'ID_META'
        ParamType = ptInput
      end>
    ProviderName = 'DspMetasFiliais'
    Left = 324
    Top = 603
    object QryMetasFiliaisID_META: TFloatField
      FieldName = 'ID_META'
      Required = True
    end
    object QryMetasFiliaisCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryMetasFiliaisMESREF: TStringField
      FieldName = 'MESREF'
      Size = 2
    end
    object QryMetasFiliaisANOREF: TStringField
      FieldName = 'ANOREF'
      Size = 4
    end
    object QryMetasFiliaisDIASUTEIS: TFloatField
      FieldName = 'DIASUTEIS'
    end
    object QryMetasFiliaisMETAVALOR: TFloatField
      FieldName = 'METAVALOR'
    end
    object QryMetasFiliaisMETAQUANTIDADE: TFloatField
      FieldName = 'METAQUANTIDADE'
    end
    object QryMetasFiliaisMETACLIENTES: TFloatField
      FieldName = 'METACLIENTES'
    end
    object QryMetasFiliaisMETATICKET: TFloatField
      FieldName = 'METATICKET'
    end
    object QryMetasFiliaisACUMULADOVALOR: TFloatField
      FieldName = 'ACUMULADOVALOR'
    end
    object QryMetasFiliaisACUMULADOQUANTIDADE: TFloatField
      FieldName = 'ACUMULADOQUANTIDADE'
    end
    object QryMetasFiliaisACUMULADOCLIENTES: TFloatField
      FieldName = 'ACUMULADOCLIENTES'
    end
    object QryMetasFiliaisACUMULADOTICKET: TFloatField
      FieldName = 'ACUMULADOTICKET'
    end
    object QryMetasFiliaisACUMULADOCUSTO: TFloatField
      FieldName = 'ACUMULADOCUSTO'
    end
    object QryMetasFiliaisACUMULADODESCONTO: TFloatField
      FieldName = 'ACUMULADODESCONTO'
    end
    object QryMetasFiliaisACUMULADOLUCRO: TFloatField
      FieldName = 'ACUMULADOLUCRO'
    end
    object QryMetasFiliaisENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsMetasFiliais: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 324
    Top = 635
    object CdsMetasFiliaisID_META: TFloatField
      FieldName = 'ID_META'
      Required = True
    end
    object CdsMetasFiliaisCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsMetasFiliaisMESREF: TStringField
      FieldName = 'MESREF'
      Size = 2
    end
    object CdsMetasFiliaisANOREF: TStringField
      FieldName = 'ANOREF'
      Size = 4
    end
    object CdsMetasFiliaisDIASUTEIS: TFloatField
      FieldName = 'DIASUTEIS'
    end
    object CdsMetasFiliaisMETAVALOR: TFloatField
      FieldName = 'METAVALOR'
    end
    object CdsMetasFiliaisMETAQUANTIDADE: TFloatField
      FieldName = 'METAQUANTIDADE'
    end
    object CdsMetasFiliaisMETACLIENTES: TFloatField
      FieldName = 'METACLIENTES'
    end
    object CdsMetasFiliaisMETATICKET: TFloatField
      FieldName = 'METATICKET'
    end
    object CdsMetasFiliaisACUMULADOVALOR: TFloatField
      FieldName = 'ACUMULADOVALOR'
    end
    object CdsMetasFiliaisACUMULADOQUANTIDADE: TFloatField
      FieldName = 'ACUMULADOQUANTIDADE'
    end
    object CdsMetasFiliaisACUMULADOCLIENTES: TFloatField
      FieldName = 'ACUMULADOCLIENTES'
    end
    object CdsMetasFiliaisACUMULADOTICKET: TFloatField
      FieldName = 'ACUMULADOTICKET'
    end
    object CdsMetasFiliaisACUMULADOCUSTO: TFloatField
      FieldName = 'ACUMULADOCUSTO'
    end
    object CdsMetasFiliaisACUMULADODESCONTO: TFloatField
      FieldName = 'ACUMULADODESCONTO'
    end
    object CdsMetasFiliaisACUMULADOLUCRO: TFloatField
      FieldName = 'ACUMULADOLUCRO'
    end
    object CdsMetasFiliaisENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsConvenios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 928
    Top = 99
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
    Left = 63
    Top = 99
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
    object CdsTransportadorasNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsTransportadorasCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object CdsTransportadorasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object CdsTransportadorasUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsTransportadorasCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsTransportadorasCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 7
    end
    object CdsTransportadorasFAX: TStringField
      FieldName = 'FAX'
      Size = 10
    end
    object CdsTransportadorasCAIXA_POSTAL: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 10
    end
    object CdsTransportadorasEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object CdsTransportadorasURL: TStringField
      FieldName = 'URL'
      Size = 100
    end
    object CdsTransportadorasCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 4
    end
    object CdsTransportadorasPAIS: TStringField
      FieldName = 'PAIS'
      Size = 100
    end
  end
  object CdsCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 195
    object CdsCartoesCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object CdsCartoesCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsCartoesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsCartoesTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsCartoesTX_ADM: TFloatField
      FieldName = 'TX_ADM'
      ProviderFlags = [pfInUpdate]
    end
    object CdsCartoesTX_ADM_PARC: TFloatField
      FieldName = 'TX_ADM_PARC'
      ProviderFlags = [pfInUpdate]
    end
    object CdsCartoesPRAZO_PG: TFloatField
      FieldName = 'PRAZO_PG'
      ProviderFlags = [pfInUpdate]
    end
    object CdsCartoesIMAGEM: TFloatField
      FieldName = 'IMAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object CdsCartoesUSATEF: TStringField
      FieldName = 'USATEF'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsCartoesENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsCartoesTRNCENTRE: TStringField
      FieldName = 'TRNCENTRE'
      Size = 1
    end
    object CdsCartoesFIDELIZE: TStringField
      FieldName = 'FIDELIZE'
      Size = 1
    end
    object CdsCartoesHIPERCARD: TStringField
      FieldName = 'HIPERCARD'
      Size = 1
    end
    object CdsCartoesREDEVESPAGUE: TStringField
      FieldName = 'REDEVESPAGUE'
      Size = 50
    end
  end
  object CdsDistribuidores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 99
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
    Left = 184
    Top = 195
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
  object CdsClasses: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 104
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
  object CdsBalancos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 188
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
  object SqlMetasVendedores: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' *'#13#10'FROM'#13#10' METAS_VENDEDORES'#13#10'WHERE'#13#10' METAS_VENDEDORES.I' +
      'D_META = :ID_META  AND'#13#10#13#10' METAS_VENDEDORES.CD_VENDEDOR = :CD_VE' +
      'NDEDOR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_META'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 44
    Top = 383
    object SqlMetasVendedoresID_META: TFloatField
      FieldName = 'ID_META'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SqlMetasVendedoresCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SqlMetasVendedoresMETAVALOR: TFloatField
      FieldName = 'METAVALOR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresMETAQUANTIDADE: TFloatField
      FieldName = 'METAQUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresMETACLIENTES: TFloatField
      FieldName = 'METACLIENTES'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresMETATICKET: TFloatField
      FieldName = 'METATICKET'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresACUMULADOVALOR: TFloatField
      FieldName = 'ACUMULADOVALOR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresACUMULADOQUANTIDADE: TFloatField
      FieldName = 'ACUMULADOQUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresACUMULADOCLIENTES: TFloatField
      FieldName = 'ACUMULADOCLIENTES'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresACUMULADOTICKET: TFloatField
      FieldName = 'ACUMULADOTICKET'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresACUMULADOCUSTO: TFloatField
      FieldName = 'ACUMULADOCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresACUMULADODESCONTO: TFloatField
      FieldName = 'ACUMULADODESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresACUMULADOLUCRO: TFloatField
      FieldName = 'ACUMULADOLUCRO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlMetasVendedoresENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object DspMetasVendedores: TDataSetProvider
    DataSet = SqlMetasVendedores
    UpdateMode = upWhereKeyOnly
    Left = 44
    Top = 420
  end
  object QryMetasVendedores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_META'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end>
    ProviderName = 'DspMetasVendedores'
    Left = 44
    Top = 460
    object QryMetasVendedoresID_META: TFloatField
      FieldName = 'ID_META'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryMetasVendedoresCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryMetasVendedoresMETAVALOR: TFloatField
      FieldName = 'METAVALOR'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresMETAQUANTIDADE: TFloatField
      FieldName = 'METAQUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresMETACLIENTES: TFloatField
      FieldName = 'METACLIENTES'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresMETATICKET: TFloatField
      FieldName = 'METATICKET'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresACUMULADOVALOR: TFloatField
      FieldName = 'ACUMULADOVALOR'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresACUMULADOQUANTIDADE: TFloatField
      FieldName = 'ACUMULADOQUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresACUMULADOCLIENTES: TFloatField
      FieldName = 'ACUMULADOCLIENTES'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresACUMULADOTICKET: TFloatField
      FieldName = 'ACUMULADOTICKET'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresACUMULADOCUSTO: TFloatField
      FieldName = 'ACUMULADOCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresACUMULADODESCONTO: TFloatField
      FieldName = 'ACUMULADODESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresACUMULADOLUCRO: TFloatField
      FieldName = 'ACUMULADOLUCRO'
      ProviderFlags = [pfInUpdate]
    end
    object QryMetasVendedoresENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object CdsMetasVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 44
    Top = 496
    object CdsMetasVendedoresID_META: TFloatField
      FieldName = 'ID_META'
    end
    object CdsMetasVendedoresCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsMetasVendedoresMETAVALOR: TFloatField
      FieldName = 'METAVALOR'
    end
    object CdsMetasVendedoresMETAQUANTIDADE: TFloatField
      FieldName = 'METAQUANTIDADE'
    end
    object CdsMetasVendedoresMETACLIENTES: TFloatField
      FieldName = 'METACLIENTES'
    end
    object CdsMetasVendedoresMETATICKET: TFloatField
      FieldName = 'METATICKET'
    end
    object CdsMetasVendedoresACUMULADOVALOR: TFloatField
      FieldName = 'ACUMULADOVALOR'
    end
    object CdsMetasVendedoresACUMULADOQUANTIDADE: TFloatField
      FieldName = 'ACUMULADOQUANTIDADE'
    end
    object CdsMetasVendedoresACUMULADOCLIENTES: TFloatField
      FieldName = 'ACUMULADOCLIENTES'
    end
    object CdsMetasVendedoresACUMULADOTICKET: TFloatField
      FieldName = 'ACUMULADOTICKET'
    end
    object CdsMetasVendedoresACUMULADOCUSTO: TFloatField
      FieldName = 'ACUMULADOCUSTO'
    end
    object CdsMetasVendedoresACUMULADODESCONTO: TFloatField
      FieldName = 'ACUMULADODESCONTO'
    end
    object CdsMetasVendedoresACUMULADOLUCRO: TFloatField
      FieldName = 'ACUMULADOLUCRO'
    end
    object CdsMetasVendedoresENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 928
    Top = 190
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
    object CdsDeletadosUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
  end
  object CdsPrecosEspeciais: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 773
    Top = 6
    object CdsPrecosEspeciaisID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
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
  object SqlNumeroContasReceberLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' CONTAS_RECEBER'#13#10'WHERE'#13#10' DT_LANCAMENTO ' +
      '= CURRENT_DATE AND '#13#10' ENVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 316
    Top = 383
  end
  object DspNumeroContasReceberLoja: TDataSetProvider
    DataSet = SqlNumeroContasReceberLoja
    Left = 316
    Top = 420
  end
  object CdsNumeroContasReceberLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroContasReceberLoja'
    Left = 316
    Top = 460
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
    Left = 412
    Top = 383
  end
  object CdsCdContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 412
    Top = 496
    object CdsCdContasReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
    end
  end
  object DspCdContasReceberLoja: TDataSetProvider
    DataSet = SqlCdContasReceberLoja
    Left = 412
    Top = 420
  end
  object CdsCdContasReceberLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdContasReceberLoja'
    Left = 412
    Top = 460
    object CdsCdContasReceberLojaCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
  end
  object CdsVendedores_Classes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 132
    Top = 496
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
    Left = 132
    Top = 383
  end
  object DspVendedores_Classes: TDataSetProvider
    DataSet = SqlVendedores_Classes
    Left = 132
    Top = 420
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
    Left = 132
    Top = 460
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
  object CdsConvenios_Classes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 496
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
    Left = 220
    Top = 383
  end
  object DspConvenios_Classes: TDataSetProvider
    DataSet = SqlConvenios_Classes
    Left = 220
    Top = 420
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
    Left = 220
    Top = 460
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
  object SqlNumeroLancamentosLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAMENTO =' +
      ' CURRENT_DATE AND'#13#10' (TIPO_VENDA = '#39'V'#39' OR TIPO_VENDA = '#39'D'#39') AND '#13 +
      #10' ENVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 508
    Top = 383
  end
  object DspNumeroLancamentosLoja: TDataSetProvider
    DataSet = SqlNumeroLancamentosLoja
    Left = 508
    Top = 420
  end
  object CdsNumeroLancamentosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroLancamentosLoja'
    Left = 508
    Top = 460
    object CdsNumeroLancamentosLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlNumeroCaixaLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' COUNT(*)'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA = CURRENT_DATE AND' +
      #13#10' TIPO_VENDA = '#39'V'#39' AND'#13#10' STATUS = '#39'A'#39' AND'#13#10' ENVIADO = '#39'2'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 132
    Top = 544
  end
  object DspNumeroCaixaLoja: TDataSetProvider
    DataSet = SqlNumeroCaixaLoja
    Left = 132
    Top = 576
  end
  object CdsNumeroCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroCaixaLoja'
    Left = 132
    Top = 616
    object CdsNumeroCaixaLojaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object SqlCdLancamentoLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_LANCAMENTO'#13#10'FROM'#13#10' LANCAMENTOS'#13#10'WHERE'#13#10' DATA_LANCAME' +
      'NTO = CURRENT_DATE AND'#13#10' (TIPO_VENDA = '#39'V'#39' OR TIPO_VENDA = '#39'D'#39')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 604
    Top = 383
  end
  object CdsCdLancamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 604
    Top = 496
    object CdsCdLancamentoCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object DspCdLancamentoLoja: TDataSetProvider
    DataSet = SqlCdLancamentoLoja
    Left = 604
    Top = 420
  end
  object CdsCdLancamentoLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdLancamentoLoja'
    Left = 604
    Top = 460
    object CdsCdLancamentoLojaCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object SqlCdCaixaLoja: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_CAIXA'#13#10'FROM'#13#10' CAIXA'#13#10'WHERE'#13#10' DATA = CURRENT_DATE AND' +
      #13#10' TIPO_VENDA = '#39'V'#39' AND'#13#10' STATUS = '#39'A'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 244
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
    Left = 244
    Top = 656
    object CdsCdCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object DspCdCaixaLoja: TDataSetProvider
    DataSet = SqlCdCaixaLoja
    Left = 244
    Top = 576
  end
  object CdsCdCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdCaixaLoja'
    Left = 244
    Top = 616
    object CdsCdCaixaLojaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object CdsFamilias: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 192
    object CdsFamiliasID_FAMILIA: TFloatField
      FieldName = 'ID_FAMILIA'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object CdsFamiliasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CdsFamiliasSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsFamiliasDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsFamiliasALTERAPRECOFAMILIA: TStringField
      FieldName = 'ALTERAPRECOFAMILIA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CdsFamiliasENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object CdsGruposBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 192
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
  object CdsGruposCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 192
    object CdsGruposCompraCD_GRUPOCOMPRA: TFloatField
      FieldName = 'CD_GRUPOCOMPRA'
      Required = True
    end
    object CdsGruposCompraDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsGruposCompraSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsGruposCompraDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsGruposCompraENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsGruposCurvas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 280
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
    CommandText = 'SELECT'#13#10' CGC '#13#10'FROM'#13#10' PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 40
    Top = 544
  end
  object DspConexao: TDataSetProvider
    DataSet = SqlConexao
    Left = 40
    Top = 576
  end
  object CdsConexao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConexao'
    Left = 40
    Top = 616
    object CdsConexaoCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
  end
  object CdsIdProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1112
    Top = 14
    object CdsIdProdutoID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
  end
  object SqlComprasDeletadas: TSQLDataSet
    CommandText = 'SELECT '#13#10' CAMPO1'#13#10'FROM'#13#10' DELETADOS'#13#10'WHERE'#13#10' TABELA = '#39'COMPRAS'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 512
    Top = 541
  end
  object DspComprasDeletadas: TDataSetProvider
    DataSet = SqlComprasDeletadas
    Left = 512
    Top = 568
  end
  object CdsComprasDeletadas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspComprasDeletadas'
    Left = 512
    Top = 599
    object CdsComprasDeletadasCAMPO1: TStringField
      FieldName = 'CAMPO1'
    end
  end
  object CdsIncluiProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 6
    object CdsIncluiProdutosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object CdsIncluiProdutosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
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
    object CdsIncluiProdutosID_FAMILIA: TFloatField
      FieldName = 'ID_FAMILIA'
    end
    object CdsIncluiProdutosCD_LISTA: TFloatField
      FieldName = 'CD_LISTA'
    end
    object CdsIncluiProdutosCD_PRINCIPIO: TFloatField
      FieldName = 'CD_PRINCIPIO'
    end
    object CdsIncluiProdutosCD_GRUPOBALANCO: TFloatField
      FieldName = 'CD_GRUPOBALANCO'
    end
    object CdsIncluiProdutosCD_GRUPOCOMPRA: TFloatField
      FieldName = 'CD_GRUPOCOMPRA'
    end
    object CdsIncluiProdutosTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 2
    end
    object CdsIncluiProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsIncluiProdutosCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Required = True
      Size = 13
    end
    object CdsIncluiProdutosCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 13
    end
    object CdsIncluiProdutosCOMPOSICAO: TMemoField
      FieldName = 'COMPOSICAO'
      BlobType = ftMemo
      Size = 8
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
    object CdsIncluiProdutosETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 50
    end
    object CdsIncluiProdutosFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
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
      Required = True
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
    object CdsIncluiProdutosDT_INVENTARIO: TDateField
      FieldName = 'DT_INVENTARIO'
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
    object CdsIncluiProdutosESTOQUE_11: TFloatField
      FieldName = 'ESTOQUE_11'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_11: TFloatField
      FieldName = 'ESTOQUE_MINIMO_11'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_11: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_11'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_11: TDateField
      FieldName = 'DT_ULT_VENDA_11'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_11: TFloatField
      FieldName = 'CUSTO_UNITARIO_11'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_11: TFloatField
      FieldName = 'CUSTO_MEDIO_11'
    end
    object CdsIncluiProdutosFACE_11: TFloatField
      FieldName = 'FACE_11'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_11: TDateField
      FieldName = 'DT_ULT_COMPRA_11'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_11: TStringField
      FieldName = 'CURVA_UNITARIA_11'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_11: TStringField
      FieldName = 'CURVA_FINANCEIRA_11'
      Size = 1
    end
    object CdsIncluiProdutosESTOQUE_12: TFloatField
      FieldName = 'ESTOQUE_12'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_12: TFloatField
      FieldName = 'ESTOQUE_MINIMO_12'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_12: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_12'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_12: TDateField
      FieldName = 'DT_ULT_VENDA_12'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_12: TFloatField
      FieldName = 'CUSTO_UNITARIO_12'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_12: TFloatField
      FieldName = 'CUSTO_MEDIO_12'
    end
    object CdsIncluiProdutosFACE_12: TFloatField
      FieldName = 'FACE_12'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_12: TDateField
      FieldName = 'DT_ULT_COMPRA_12'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_12: TStringField
      FieldName = 'CURVA_UNITARIA_12'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_12: TStringField
      FieldName = 'CURVA_FINANCEIRA_12'
      Size = 1
    end
    object CdsIncluiProdutosESTOQUE_13: TFloatField
      FieldName = 'ESTOQUE_13'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_13: TFloatField
      FieldName = 'ESTOQUE_MINIMO_13'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_13: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_13'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_13: TDateField
      FieldName = 'DT_ULT_VENDA_13'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_13: TFloatField
      FieldName = 'CUSTO_UNITARIO_13'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_13: TFloatField
      FieldName = 'CUSTO_MEDIO_13'
    end
    object CdsIncluiProdutosFACE_13: TFloatField
      FieldName = 'FACE_13'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_13: TDateField
      FieldName = 'DT_ULT_COMPRA_13'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_13: TStringField
      FieldName = 'CURVA_UNITARIA_13'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_13: TStringField
      FieldName = 'CURVA_FINANCEIRA_13'
      Size = 1
    end
    object CdsIncluiProdutosESTOQUE_14: TFloatField
      FieldName = 'ESTOQUE_14'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_14: TFloatField
      FieldName = 'ESTOQUE_MINIMO_14'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_14: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_14'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_14: TDateField
      FieldName = 'DT_ULT_VENDA_14'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_14: TFloatField
      FieldName = 'CUSTO_UNITARIO_14'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_14: TFloatField
      FieldName = 'CUSTO_MEDIO_14'
    end
    object CdsIncluiProdutosFACE_14: TFloatField
      FieldName = 'FACE_14'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_14: TDateField
      FieldName = 'DT_ULT_COMPRA_14'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_14: TStringField
      FieldName = 'CURVA_UNITARIA_14'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_14: TStringField
      FieldName = 'CURVA_FINANCEIRA_14'
      Size = 1
    end
    object CdsIncluiProdutosESTOQUE_15: TFloatField
      FieldName = 'ESTOQUE_15'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_15: TFloatField
      FieldName = 'ESTOQUE_MINIMO_15'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_15: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_15'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_15: TDateField
      FieldName = 'DT_ULT_VENDA_15'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_15: TFloatField
      FieldName = 'CUSTO_UNITARIO_15'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_15: TFloatField
      FieldName = 'CUSTO_MEDIO_15'
    end
    object CdsIncluiProdutosFACE_15: TFloatField
      FieldName = 'FACE_15'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_15: TDateField
      FieldName = 'DT_ULT_COMPRA_15'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_15: TStringField
      FieldName = 'CURVA_UNITARIA_15'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_15: TStringField
      FieldName = 'CURVA_FINANCEIRA_15'
      Size = 1
    end
    object CdsIncluiProdutosTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
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
    object CdsIncluiProdutosGENERICO: TStringField
      FieldName = 'GENERICO'
      Size = 1
    end
    object CdsIncluiProdutosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_1: TFloatField
      FieldName = 'PRECO_VENDA_1'
    end
    object CdsIncluiProdutosPRECO_VENDA_2: TFloatField
      FieldName = 'PRECO_VENDA_2'
    end
    object CdsIncluiProdutosPRECO_VENDA_3: TFloatField
      FieldName = 'PRECO_VENDA_3'
    end
    object CdsIncluiProdutosPRECO_VENDA_4: TFloatField
      FieldName = 'PRECO_VENDA_4'
    end
    object CdsIncluiProdutosPRECO_VENDA_5: TFloatField
      FieldName = 'PRECO_VENDA_5'
    end
    object CdsIncluiProdutosPRECO_VENDA_6: TFloatField
      FieldName = 'PRECO_VENDA_6'
    end
    object CdsIncluiProdutosPRECO_VENDA_7: TFloatField
      FieldName = 'PRECO_VENDA_7'
    end
    object CdsIncluiProdutosPRECO_VENDA_8: TFloatField
      FieldName = 'PRECO_VENDA_8'
    end
    object CdsIncluiProdutosPRECO_VENDA_9: TFloatField
      FieldName = 'PRECO_VENDA_9'
    end
    object CdsIncluiProdutosPRECO_VENDA_10: TFloatField
      FieldName = 'PRECO_VENDA_10'
    end
    object CdsIncluiProdutosPRECO_VENDA_11: TFloatField
      FieldName = 'PRECO_VENDA_11'
    end
    object CdsIncluiProdutosPRECO_VENDA_12: TFloatField
      FieldName = 'PRECO_VENDA_12'
    end
    object CdsIncluiProdutosPRECO_VENDA_13: TFloatField
      FieldName = 'PRECO_VENDA_13'
    end
    object CdsIncluiProdutosPRECO_VENDA_14: TFloatField
      FieldName = 'PRECO_VENDA_14'
    end
    object CdsIncluiProdutosPRECO_VENDA_15: TFloatField
      FieldName = 'PRECO_VENDA_15'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_1: TFloatField
      FieldName = 'PRECO_PROMOCAO_1'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_2: TFloatField
      FieldName = 'PRECO_PROMOCAO_2'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_3: TFloatField
      FieldName = 'PRECO_PROMOCAO_3'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_4: TFloatField
      FieldName = 'PRECO_PROMOCAO_4'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_5: TFloatField
      FieldName = 'PRECO_PROMOCAO_5'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_6: TFloatField
      FieldName = 'PRECO_PROMOCAO_6'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_7: TFloatField
      FieldName = 'PRECO_PROMOCAO_7'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_8: TFloatField
      FieldName = 'PRECO_PROMOCAO_8'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_9: TFloatField
      FieldName = 'PRECO_PROMOCAO_9'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_10: TFloatField
      FieldName = 'PRECO_PROMOCAO_10'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_11: TFloatField
      FieldName = 'PRECO_PROMOCAO_11'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_12: TFloatField
      FieldName = 'PRECO_PROMOCAO_12'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_13: TFloatField
      FieldName = 'PRECO_PROMOCAO_13'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_14: TFloatField
      FieldName = 'PRECO_PROMOCAO_14'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_15: TFloatField
      FieldName = 'PRECO_PROMOCAO_15'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_1: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_1'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_2: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_2'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_3: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_3'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_4: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_4'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_5: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_5'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_6: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_6'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_7: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_7'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_8: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_8'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_9: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_9'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_10: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_10'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_11: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_11'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_12: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_12'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_13: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_13'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_14: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_14'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_15: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_15'
    end
    object CdsIncluiProdutosDT_REAJUSTE_1: TDateField
      FieldName = 'DT_REAJUSTE_1'
    end
    object CdsIncluiProdutosDT_REAJUSTE_2: TDateField
      FieldName = 'DT_REAJUSTE_2'
    end
    object CdsIncluiProdutosDT_REAJUSTE_3: TDateField
      FieldName = 'DT_REAJUSTE_3'
    end
    object CdsIncluiProdutosDT_REAJUSTE_4: TDateField
      FieldName = 'DT_REAJUSTE_4'
    end
    object CdsIncluiProdutosDT_REAJUSTE_5: TDateField
      FieldName = 'DT_REAJUSTE_5'
    end
    object CdsIncluiProdutosDT_REAJUSTE_6: TDateField
      FieldName = 'DT_REAJUSTE_6'
    end
    object CdsIncluiProdutosDT_REAJUSTE_7: TDateField
      FieldName = 'DT_REAJUSTE_7'
    end
    object CdsIncluiProdutosDT_REAJUSTE_8: TDateField
      FieldName = 'DT_REAJUSTE_8'
    end
    object CdsIncluiProdutosDT_REAJUSTE_9: TDateField
      FieldName = 'DT_REAJUSTE_9'
    end
    object CdsIncluiProdutosDT_REAJUSTE_10: TDateField
      FieldName = 'DT_REAJUSTE_10'
    end
    object CdsIncluiProdutosDT_REAJUSTE_11: TDateField
      FieldName = 'DT_REAJUSTE_11'
    end
    object CdsIncluiProdutosDT_REAJUSTE_12: TDateField
      FieldName = 'DT_REAJUSTE_12'
    end
    object CdsIncluiProdutosDT_REAJUSTE_13: TDateField
      FieldName = 'DT_REAJUSTE_13'
    end
    object CdsIncluiProdutosDT_REAJUSTE_14: TDateField
      FieldName = 'DT_REAJUSTE_14'
    end
    object CdsIncluiProdutosDT_REAJUSTE_15: TDateField
      FieldName = 'DT_REAJUSTE_15'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_1: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_1'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_2: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_2'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_3: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_3'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_4: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_4'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_5: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_5'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_6: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_6'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_7: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_7'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_8: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_8'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_9: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_9'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_10: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_10'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_11: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_11'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_12: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_12'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_13: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_13'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_14: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_14'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_15: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_15'
    end
    object CdsIncluiProdutosUSOCONTINUO: TStringField
      FieldName = 'USOCONTINUO'
      Size = 1
    end
    object CdsIncluiProdutosCOMPRIMIDOSCAIXA: TFloatField
      FieldName = 'COMPRIMIDOSCAIXA'
    end
    object CdsIncluiProdutosDATA_VENCIMENTO_1: TDateField
      FieldName = 'DATA_VENCIMENTO_1'
    end
    object CdsIncluiProdutosDATA_VENCIMENTO_2: TDateField
      FieldName = 'DATA_VENCIMENTO_2'
    end
    object CdsIncluiProdutosCONTROLADO: TStringField
      FieldName = 'CONTROLADO'
      Size = 1
    end
    object CdsIncluiProdutosID_PORTARIA: TFloatField
      FieldName = 'ID_PORTARIA'
    end
    object CdsIncluiProdutosPRINCIPIOATIVO: TStringField
      FieldName = 'PRINCIPIOATIVO'
      Size = 1000
    end
    object CdsIncluiProdutosREGISTROMS: TStringField
      FieldName = 'REGISTROMS'
      Size = 13
    end
    object CdsIncluiProdutosMEDIAF_1: TFloatField
      FieldName = 'MEDIAF_1'
    end
    object CdsIncluiProdutosMEDIAF_2: TFloatField
      FieldName = 'MEDIAF_2'
    end
    object CdsIncluiProdutosMEDIAF_3: TFloatField
      FieldName = 'MEDIAF_3'
    end
    object CdsIncluiProdutosMEDIAF_4: TFloatField
      FieldName = 'MEDIAF_4'
    end
    object CdsIncluiProdutosMEDIAF_5: TFloatField
      FieldName = 'MEDIAF_5'
    end
    object CdsIncluiProdutosMEDIAF_6: TFloatField
      FieldName = 'MEDIAF_6'
    end
    object CdsIncluiProdutosMEDIAF_7: TFloatField
      FieldName = 'MEDIAF_7'
    end
    object CdsIncluiProdutosMEDIAF_8: TFloatField
      FieldName = 'MEDIAF_8'
    end
    object CdsIncluiProdutosMEDIAF_9: TFloatField
      FieldName = 'MEDIAF_9'
    end
    object CdsIncluiProdutosMEDIAF_10: TFloatField
      FieldName = 'MEDIAF_10'
    end
    object CdsIncluiProdutosMEDIAF_11: TFloatField
      FieldName = 'MEDIAF_11'
    end
    object CdsIncluiProdutosMEDIAF_12: TFloatField
      FieldName = 'MEDIAF_12'
    end
    object CdsIncluiProdutosMEDIAF_13: TFloatField
      FieldName = 'MEDIAF_13'
    end
    object CdsIncluiProdutosMEDIAF_14: TFloatField
      FieldName = 'MEDIAF_14'
    end
    object CdsIncluiProdutosMEDIAF_15: TFloatField
      FieldName = 'MEDIAF_15'
    end
    object CdsIncluiProdutosSAZONAL: TStringField
      FieldName = 'SAZONAL'
      Size = 1
    end
    object CdsIncluiProdutosJANSAZ: TStringField
      FieldName = 'JANSAZ'
      Size = 1
    end
    object CdsIncluiProdutosFEVSAZ: TStringField
      FieldName = 'FEVSAZ'
      Size = 1
    end
    object CdsIncluiProdutosMARSAZ: TStringField
      FieldName = 'MARSAZ'
      Size = 1
    end
    object CdsIncluiProdutosABRSAZ: TStringField
      FieldName = 'ABRSAZ'
      Size = 1
    end
    object CdsIncluiProdutosMAISAZ: TStringField
      FieldName = 'MAISAZ'
      Size = 1
    end
    object CdsIncluiProdutosJUNSAZ: TStringField
      FieldName = 'JUNSAZ'
      Size = 1
    end
    object CdsIncluiProdutosJULSAZ: TStringField
      FieldName = 'JULSAZ'
      Size = 1
    end
    object CdsIncluiProdutosAGOSAZ: TStringField
      FieldName = 'AGOSAZ'
      Size = 1
    end
    object CdsIncluiProdutosSETSAZ: TStringField
      FieldName = 'SETSAZ'
      Size = 1
    end
    object CdsIncluiProdutosOUTSAZ: TStringField
      FieldName = 'OUTSAZ'
      Size = 1
    end
    object CdsIncluiProdutosNOVSAZ: TStringField
      FieldName = 'NOVSAZ'
      Size = 1
    end
    object CdsIncluiProdutosDEZSAZ: TStringField
      FieldName = 'DEZSAZ'
      Size = 1
    end
    object CdsIncluiProdutosSITUACAOTRIBUTARIA: TStringField
      FieldName = 'SITUACAOTRIBUTARIA'
      Size = 3
    end
    object CdsIncluiProdutosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object CdsIncluiProdutosRESERVA: TFloatField
      FieldName = 'RESERVA'
    end
    object CdsIncluiProdutosCOMPOSTO: TStringField
      FieldName = 'COMPOSTO'
      Size = 1
    end
    object CdsIncluiProdutosIAT: TStringField
      FieldName = 'IAT'
      Size = 1
    end
    object CdsIncluiProdutosIPPT: TStringField
      FieldName = 'IPPT'
      Size = 1
    end
    object CdsIncluiProdutosNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object CdsIncluiProdutosPIS_COFINS: TStringField
      FieldName = 'PIS_COFINS'
      Size = 1
    end
    object CdsIncluiProdutosID_PRODUTO_BASE: TFloatField
      FieldName = 'ID_PRODUTO_BASE'
    end
    object CdsIncluiProdutosCD_CFOP: TFloatField
      FieldName = 'CD_CFOP'
    end
    object CdsIncluiProdutosESTOQUE_16: TFloatField
      FieldName = 'ESTOQUE_16'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_16: TFloatField
      FieldName = 'ESTOQUE_MINIMO_16'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_16: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_16'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_16: TDateField
      FieldName = 'DT_ULT_VENDA_16'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_16: TFloatField
      FieldName = 'CUSTO_UNITARIO_16'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_16: TFloatField
      FieldName = 'CUSTO_MEDIO_16'
    end
    object CdsIncluiProdutosFACE_16: TFloatField
      FieldName = 'FACE_16'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_16: TDateField
      FieldName = 'DT_ULT_COMPRA_16'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_16: TStringField
      FieldName = 'CURVA_UNITARIA_16'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_16: TStringField
      FieldName = 'CURVA_FINANCEIRA_16'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_16: TFloatField
      FieldName = 'PRECO_VENDA_16'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_16: TFloatField
      FieldName = 'PRECO_PROMOCAO_16'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_16: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_16'
    end
    object CdsIncluiProdutosDT_REAJUSTE_16: TDateField
      FieldName = 'DT_REAJUSTE_16'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_16: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_16'
    end
    object CdsIncluiProdutosMEDIAF_16: TFloatField
      FieldName = 'MEDIAF_16'
    end
    object CdsIncluiProdutosESTOQUE_17: TFloatField
      FieldName = 'ESTOQUE_17'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_17: TFloatField
      FieldName = 'ESTOQUE_MINIMO_17'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_17: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_17'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_17: TDateField
      FieldName = 'DT_ULT_VENDA_17'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_17: TFloatField
      FieldName = 'CUSTO_UNITARIO_17'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_17: TFloatField
      FieldName = 'CUSTO_MEDIO_17'
    end
    object CdsIncluiProdutosFACE_17: TFloatField
      FieldName = 'FACE_17'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_17: TDateField
      FieldName = 'DT_ULT_COMPRA_17'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_17: TStringField
      FieldName = 'CURVA_UNITARIA_17'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_17: TStringField
      FieldName = 'CURVA_FINANCEIRA_17'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_17: TFloatField
      FieldName = 'PRECO_VENDA_17'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_17: TFloatField
      FieldName = 'PRECO_PROMOCAO_17'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_17: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_17'
    end
    object CdsIncluiProdutosDT_REAJUSTE_17: TDateField
      FieldName = 'DT_REAJUSTE_17'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_17: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_17'
    end
    object CdsIncluiProdutosMEDIAF_17: TFloatField
      FieldName = 'MEDIAF_17'
    end
    object CdsIncluiProdutosESTOQUE_18: TFloatField
      FieldName = 'ESTOQUE_18'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_18: TFloatField
      FieldName = 'ESTOQUE_MINIMO_18'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_18: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_18'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_18: TDateField
      FieldName = 'DT_ULT_VENDA_18'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_18: TFloatField
      FieldName = 'CUSTO_UNITARIO_18'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_18: TFloatField
      FieldName = 'CUSTO_MEDIO_18'
    end
    object CdsIncluiProdutosFACE_18: TFloatField
      FieldName = 'FACE_18'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_18: TDateField
      FieldName = 'DT_ULT_COMPRA_18'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_18: TStringField
      FieldName = 'CURVA_UNITARIA_18'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_18: TStringField
      FieldName = 'CURVA_FINANCEIRA_18'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_18: TFloatField
      FieldName = 'PRECO_VENDA_18'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_18: TFloatField
      FieldName = 'PRECO_PROMOCAO_18'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_18: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_18'
    end
    object CdsIncluiProdutosDT_REAJUSTE_18: TDateField
      FieldName = 'DT_REAJUSTE_18'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_18: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_18'
    end
    object CdsIncluiProdutosMEDIAF_18: TFloatField
      FieldName = 'MEDIAF_18'
    end
    object CdsIncluiProdutosESTOQUE_19: TFloatField
      FieldName = 'ESTOQUE_19'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_19: TFloatField
      FieldName = 'ESTOQUE_MINIMO_19'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_19: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_19'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_19: TDateField
      FieldName = 'DT_ULT_VENDA_19'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_19: TFloatField
      FieldName = 'CUSTO_UNITARIO_19'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_19: TFloatField
      FieldName = 'CUSTO_MEDIO_19'
    end
    object CdsIncluiProdutosFACE_19: TFloatField
      FieldName = 'FACE_19'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_19: TDateField
      FieldName = 'DT_ULT_COMPRA_19'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_19: TStringField
      FieldName = 'CURVA_UNITARIA_19'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_19: TStringField
      FieldName = 'CURVA_FINANCEIRA_19'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_19: TFloatField
      FieldName = 'PRECO_VENDA_19'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_19: TFloatField
      FieldName = 'PRECO_PROMOCAO_19'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_19: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_19'
    end
    object CdsIncluiProdutosDT_REAJUSTE_19: TDateField
      FieldName = 'DT_REAJUSTE_19'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_19: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_19'
    end
    object CdsIncluiProdutosMEDIAF_19: TFloatField
      FieldName = 'MEDIAF_19'
    end
    object CdsIncluiProdutosESTOQUE_20: TFloatField
      FieldName = 'ESTOQUE_20'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_20: TFloatField
      FieldName = 'ESTOQUE_MINIMO_20'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_20: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_20'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_20: TDateField
      FieldName = 'DT_ULT_VENDA_20'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_20: TFloatField
      FieldName = 'CUSTO_UNITARIO_20'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_20: TFloatField
      FieldName = 'CUSTO_MEDIO_20'
    end
    object CdsIncluiProdutosFACE_20: TFloatField
      FieldName = 'FACE_20'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_20: TDateField
      FieldName = 'DT_ULT_COMPRA_20'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_20: TStringField
      FieldName = 'CURVA_UNITARIA_20'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_20: TStringField
      FieldName = 'CURVA_FINANCEIRA_20'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_20: TFloatField
      FieldName = 'PRECO_VENDA_20'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_20: TFloatField
      FieldName = 'PRECO_PROMOCAO_20'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_20: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_20'
    end
    object CdsIncluiProdutosDT_REAJUSTE_20: TDateField
      FieldName = 'DT_REAJUSTE_20'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_20: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_20'
    end
    object CdsIncluiProdutosMEDIAF_20: TFloatField
      FieldName = 'MEDIAF_20'
    end
    object CdsIncluiProdutosESTOQUE_21: TFloatField
      FieldName = 'ESTOQUE_21'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_21: TFloatField
      FieldName = 'ESTOQUE_MINIMO_21'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_21: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_21'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_21: TDateField
      FieldName = 'DT_ULT_VENDA_21'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_21: TFloatField
      FieldName = 'CUSTO_UNITARIO_21'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_21: TFloatField
      FieldName = 'CUSTO_MEDIO_21'
    end
    object CdsIncluiProdutosFACE_21: TFloatField
      FieldName = 'FACE_21'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_21: TDateField
      FieldName = 'DT_ULT_COMPRA_21'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_21: TStringField
      FieldName = 'CURVA_UNITARIA_21'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_21: TStringField
      FieldName = 'CURVA_FINANCEIRA_21'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_21: TFloatField
      FieldName = 'PRECO_VENDA_21'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_21: TFloatField
      FieldName = 'PRECO_PROMOCAO_21'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_21: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_21'
    end
    object CdsIncluiProdutosDT_REAJUSTE_21: TDateField
      FieldName = 'DT_REAJUSTE_21'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_21: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_21'
    end
    object CdsIncluiProdutosMEDIAF_21: TFloatField
      FieldName = 'MEDIAF_21'
    end
    object CdsIncluiProdutosESTOQUE_22: TFloatField
      FieldName = 'ESTOQUE_22'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_22: TFloatField
      FieldName = 'ESTOQUE_MINIMO_22'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_22: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_22'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_22: TDateField
      FieldName = 'DT_ULT_VENDA_22'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_22: TFloatField
      FieldName = 'CUSTO_UNITARIO_22'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_22: TFloatField
      FieldName = 'CUSTO_MEDIO_22'
    end
    object CdsIncluiProdutosFACE_22: TFloatField
      FieldName = 'FACE_22'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_22: TDateField
      FieldName = 'DT_ULT_COMPRA_22'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_22: TStringField
      FieldName = 'CURVA_UNITARIA_22'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_22: TStringField
      FieldName = 'CURVA_FINANCEIRA_22'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_22: TFloatField
      FieldName = 'PRECO_VENDA_22'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_22: TFloatField
      FieldName = 'PRECO_PROMOCAO_22'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_22: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_22'
    end
    object CdsIncluiProdutosDT_REAJUSTE_22: TDateField
      FieldName = 'DT_REAJUSTE_22'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_22: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_22'
    end
    object CdsIncluiProdutosMEDIAF_22: TFloatField
      FieldName = 'MEDIAF_22'
    end
    object CdsIncluiProdutosESTOQUE_23: TFloatField
      FieldName = 'ESTOQUE_23'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_23: TFloatField
      FieldName = 'ESTOQUE_MINIMO_23'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_23: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_23'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_23: TDateField
      FieldName = 'DT_ULT_VENDA_23'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_23: TFloatField
      FieldName = 'CUSTO_UNITARIO_23'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_23: TFloatField
      FieldName = 'CUSTO_MEDIO_23'
    end
    object CdsIncluiProdutosFACE_23: TFloatField
      FieldName = 'FACE_23'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_23: TDateField
      FieldName = 'DT_ULT_COMPRA_23'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_23: TStringField
      FieldName = 'CURVA_UNITARIA_23'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_23: TStringField
      FieldName = 'CURVA_FINANCEIRA_23'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_23: TFloatField
      FieldName = 'PRECO_VENDA_23'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_23: TFloatField
      FieldName = 'PRECO_PROMOCAO_23'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_23: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_23'
    end
    object CdsIncluiProdutosDT_REAJUSTE_23: TDateField
      FieldName = 'DT_REAJUSTE_23'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_23: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_23'
    end
    object CdsIncluiProdutosMEDIAF_23: TFloatField
      FieldName = 'MEDIAF_23'
    end
    object CdsIncluiProdutosESTOQUE_24: TFloatField
      FieldName = 'ESTOQUE_24'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_24: TFloatField
      FieldName = 'ESTOQUE_MINIMO_24'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_24: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_24'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_24: TDateField
      FieldName = 'DT_ULT_VENDA_24'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_24: TFloatField
      FieldName = 'CUSTO_UNITARIO_24'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_24: TFloatField
      FieldName = 'CUSTO_MEDIO_24'
    end
    object CdsIncluiProdutosFACE_24: TFloatField
      FieldName = 'FACE_24'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_24: TDateField
      FieldName = 'DT_ULT_COMPRA_24'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_24: TStringField
      FieldName = 'CURVA_UNITARIA_24'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_24: TStringField
      FieldName = 'CURVA_FINANCEIRA_24'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_24: TFloatField
      FieldName = 'PRECO_VENDA_24'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_24: TFloatField
      FieldName = 'PRECO_PROMOCAO_24'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_24: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_24'
    end
    object CdsIncluiProdutosDT_REAJUSTE_24: TDateField
      FieldName = 'DT_REAJUSTE_24'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_24: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_24'
    end
    object CdsIncluiProdutosMEDIAF_24: TFloatField
      FieldName = 'MEDIAF_24'
    end
    object CdsIncluiProdutosESTOQUE_25: TFloatField
      FieldName = 'ESTOQUE_25'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_25: TFloatField
      FieldName = 'ESTOQUE_MINIMO_25'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_25: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_25'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_25: TDateField
      FieldName = 'DT_ULT_VENDA_25'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_25: TFloatField
      FieldName = 'CUSTO_UNITARIO_25'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_25: TFloatField
      FieldName = 'CUSTO_MEDIO_25'
    end
    object CdsIncluiProdutosFACE_25: TFloatField
      FieldName = 'FACE_25'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_25: TDateField
      FieldName = 'DT_ULT_COMPRA_25'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_25: TStringField
      FieldName = 'CURVA_UNITARIA_25'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_25: TStringField
      FieldName = 'CURVA_FINANCEIRA_25'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_25: TFloatField
      FieldName = 'PRECO_VENDA_25'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_25: TFloatField
      FieldName = 'PRECO_PROMOCAO_25'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_25: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_25'
    end
    object CdsIncluiProdutosDT_REAJUSTE_25: TDateField
      FieldName = 'DT_REAJUSTE_25'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_25: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_25'
    end
    object CdsIncluiProdutosMEDIAF_25: TFloatField
      FieldName = 'MEDIAF_25'
    end
    object CdsIncluiProdutosESTOQUE_26: TFloatField
      FieldName = 'ESTOQUE_26'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_26: TFloatField
      FieldName = 'ESTOQUE_MINIMO_26'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_26: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_26'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_26: TDateField
      FieldName = 'DT_ULT_VENDA_26'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_26: TFloatField
      FieldName = 'CUSTO_UNITARIO_26'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_26: TFloatField
      FieldName = 'CUSTO_MEDIO_26'
    end
    object CdsIncluiProdutosFACE_26: TFloatField
      FieldName = 'FACE_26'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_26: TDateField
      FieldName = 'DT_ULT_COMPRA_26'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_26: TStringField
      FieldName = 'CURVA_UNITARIA_26'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_26: TStringField
      FieldName = 'CURVA_FINANCEIRA_26'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_26: TFloatField
      FieldName = 'PRECO_VENDA_26'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_26: TFloatField
      FieldName = 'PRECO_PROMOCAO_26'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_26: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_26'
    end
    object CdsIncluiProdutosDT_REAJUSTE_26: TDateField
      FieldName = 'DT_REAJUSTE_26'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_26: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_26'
    end
    object CdsIncluiProdutosMEDIAF_26: TFloatField
      FieldName = 'MEDIAF_26'
    end
    object CdsIncluiProdutosESTOQUE_27: TFloatField
      FieldName = 'ESTOQUE_27'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_27: TFloatField
      FieldName = 'ESTOQUE_MINIMO_27'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_27: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_27'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_27: TDateField
      FieldName = 'DT_ULT_VENDA_27'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_27: TFloatField
      FieldName = 'CUSTO_UNITARIO_27'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_27: TFloatField
      FieldName = 'CUSTO_MEDIO_27'
    end
    object CdsIncluiProdutosFACE_27: TFloatField
      FieldName = 'FACE_27'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_27: TDateField
      FieldName = 'DT_ULT_COMPRA_27'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_27: TStringField
      FieldName = 'CURVA_UNITARIA_27'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_27: TStringField
      FieldName = 'CURVA_FINANCEIRA_27'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_27: TFloatField
      FieldName = 'PRECO_VENDA_27'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_27: TFloatField
      FieldName = 'PRECO_PROMOCAO_27'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_27: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_27'
    end
    object CdsIncluiProdutosDT_REAJUSTE_27: TDateField
      FieldName = 'DT_REAJUSTE_27'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_27: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_27'
    end
    object CdsIncluiProdutosMEDIAF_27: TFloatField
      FieldName = 'MEDIAF_27'
    end
    object CdsIncluiProdutosESTOQUE_28: TFloatField
      FieldName = 'ESTOQUE_28'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_28: TFloatField
      FieldName = 'ESTOQUE_MINIMO_28'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_28: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_28'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_28: TDateField
      FieldName = 'DT_ULT_VENDA_28'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_28: TFloatField
      FieldName = 'CUSTO_UNITARIO_28'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_28: TFloatField
      FieldName = 'CUSTO_MEDIO_28'
    end
    object CdsIncluiProdutosFACE_28: TFloatField
      FieldName = 'FACE_28'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_28: TDateField
      FieldName = 'DT_ULT_COMPRA_28'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_28: TStringField
      FieldName = 'CURVA_UNITARIA_28'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_28: TStringField
      FieldName = 'CURVA_FINANCEIRA_28'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_28: TFloatField
      FieldName = 'PRECO_VENDA_28'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_28: TFloatField
      FieldName = 'PRECO_PROMOCAO_28'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_28: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_28'
    end
    object CdsIncluiProdutosDT_REAJUSTE_28: TDateField
      FieldName = 'DT_REAJUSTE_28'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_28: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_28'
    end
    object CdsIncluiProdutosMEDIAF_28: TFloatField
      FieldName = 'MEDIAF_28'
    end
    object CdsIncluiProdutosESTOQUE_29: TFloatField
      FieldName = 'ESTOQUE_29'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_29: TFloatField
      FieldName = 'ESTOQUE_MINIMO_29'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_29: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_29'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_29: TDateField
      FieldName = 'DT_ULT_VENDA_29'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_29: TFloatField
      FieldName = 'CUSTO_UNITARIO_29'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_29: TFloatField
      FieldName = 'CUSTO_MEDIO_29'
    end
    object CdsIncluiProdutosFACE_29: TFloatField
      FieldName = 'FACE_29'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_29: TDateField
      FieldName = 'DT_ULT_COMPRA_29'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_29: TStringField
      FieldName = 'CURVA_UNITARIA_29'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_29: TStringField
      FieldName = 'CURVA_FINANCEIRA_29'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_29: TFloatField
      FieldName = 'PRECO_VENDA_29'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_29: TFloatField
      FieldName = 'PRECO_PROMOCAO_29'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_29: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_29'
    end
    object CdsIncluiProdutosDT_REAJUSTE_29: TDateField
      FieldName = 'DT_REAJUSTE_29'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_29: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_29'
    end
    object CdsIncluiProdutosMEDIAF_29: TFloatField
      FieldName = 'MEDIAF_29'
    end
    object CdsIncluiProdutosESTOQUE_30: TFloatField
      FieldName = 'ESTOQUE_30'
    end
    object CdsIncluiProdutosESTOQUE_MINIMO_30: TFloatField
      FieldName = 'ESTOQUE_MINIMO_30'
    end
    object CdsIncluiProdutosESTOQUE_MAXIMO_30: TFloatField
      FieldName = 'ESTOQUE_MAXIMO_30'
    end
    object CdsIncluiProdutosDT_ULT_VENDA_30: TDateField
      FieldName = 'DT_ULT_VENDA_30'
    end
    object CdsIncluiProdutosCUSTO_UNITARIO_30: TFloatField
      FieldName = 'CUSTO_UNITARIO_30'
    end
    object CdsIncluiProdutosCUSTO_MEDIO_30: TFloatField
      FieldName = 'CUSTO_MEDIO_30'
    end
    object CdsIncluiProdutosFACE_30: TFloatField
      FieldName = 'FACE_30'
    end
    object CdsIncluiProdutosDT_ULT_COMPRA_30: TDateField
      FieldName = 'DT_ULT_COMPRA_30'
    end
    object CdsIncluiProdutosCURVA_UNITARIA_30: TStringField
      FieldName = 'CURVA_UNITARIA_30'
      Size = 1
    end
    object CdsIncluiProdutosCURVA_FINANCEIRA_30: TStringField
      FieldName = 'CURVA_FINANCEIRA_30'
      Size = 1
    end
    object CdsIncluiProdutosPRECO_VENDA_30: TFloatField
      FieldName = 'PRECO_VENDA_30'
    end
    object CdsIncluiProdutosPRECO_PROMOCAO_30: TFloatField
      FieldName = 'PRECO_PROMOCAO_30'
    end
    object CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO_30: TDateField
      FieldName = 'DT_VENCIMENTO_PROMOCAO_30'
    end
    object CdsIncluiProdutosDT_REAJUSTE_30: TDateField
      FieldName = 'DT_REAJUSTE_30'
    end
    object CdsIncluiProdutosPRECO_VENDA_ANTERIOR_30: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR_30'
    end
    object CdsIncluiProdutosMEDIAF_30: TFloatField
      FieldName = 'MEDIAF_30'
    end
    object CdsIncluiProdutosORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsIncluiProdutosCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 3
    end
    object CdsIncluiProdutosCRIPT: TStringField
      FieldName = 'CRIPT'
      Size = 1000
    end
    object CdsIncluiProdutosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 1000
    end
    object CdsIncluiProdutosCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
  end
  object TbCeParame: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_FILIAL,'#13#10' PRECIFICACAO_UNICA,'#13#10' TIPO_LOJA'#13#10'FROM'#13#10' PA' +
      'RAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 787
    Top = 381
  end
  object DspParametros: TDataSetProvider
    DataSet = TbCeParame
    Left = 783
    Top = 408
  end
  object CdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 783
    Top = 439
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
  object SqlIdProdutos: TSQLDataSet
    CommandText = 'SELECT ID_PRODUTO FROM PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 952
    Top = 381
  end
  object DspIdProdutos: TDataSetProvider
    DataSet = SqlIdProdutos
    Left = 952
    Top = 408
  end
  object CdsIdProdutosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspIdProdutos'
    Left = 952
    Top = 439
    object CdsIdProdutosLojaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
  end
  object SqlBalancosFilial: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' BALANCO'#13#10'WHERE'#13#10' ENVIADO = '#39'9'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 628
    Top = 541
  end
  object DspBalancosFilial: TDataSetProvider
    DataSet = SqlBalancosFilial
    Left = 628
    Top = 568
  end
  object CdsBalancosFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBalancosFilial'
    Left = 628
    Top = 599
    object CdsBalancosFilialID_BALANCO: TFloatField
      FieldName = 'ID_BALANCO'
    end
    object CdsBalancosFilialID_MOTIVO: TFloatField
      FieldName = 'ID_MOTIVO'
    end
    object CdsBalancosFilialDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsBalancosFilialHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsBalancosFilialDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object CdsBalancosFilialHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
    end
    object CdsBalancosFilialDATA_CONTAGEM: TDateField
      FieldName = 'DATA_CONTAGEM'
    end
    object CdsBalancosFilialHORA_CONTAGEM: TTimeField
      FieldName = 'HORA_CONTAGEM'
    end
    object CdsBalancosFilialDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object CdsBalancosFilialHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object CdsBalancosFilialCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsBalancosFilialID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsBalancosFilialCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsBalancosFilialCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 14
    end
    object CdsBalancosFilialCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 14
    end
    object CdsBalancosFilialDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsBalancosFilialCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsBalancosFilialGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object CdsBalancosFilialCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsBalancosFilialLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 100
    end
    object CdsBalancosFilialCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object CdsBalancosFilialCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 100
    end
    object CdsBalancosFilialCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
    object CdsBalancosFilialPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object CdsBalancosFilialPRECO_VENDA_ANTERIOR: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR'
    end
    object CdsBalancosFilialESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object CdsBalancosFilialESTOQUE_ANTERIOR: TFloatField
      FieldName = 'ESTOQUE_ANTERIOR'
    end
    object CdsBalancosFilialSUBSTITUIESTOQUE: TStringField
      FieldName = 'SUBSTITUIESTOQUE'
      Size = 1
    end
    object CdsBalancosFilialSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsBalancosFilialENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsBalancosFilialCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object CdsBalancosFilialUSUARIO_ABERTURA: TStringField
      FieldName = 'USUARIO_ABERTURA'
      Size = 100
    end
    object CdsBalancosFilialUSUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
      Size = 100
    end
  end
  object SqlClientesDeletados: TSQLDataSet
    CommandText = 'SELECT '#13#10' CAMPO1'#13#10'FROM'#13#10' DELETADOS'#13#10'WHERE'#13#10' TABELA = '#39'CLIENTES'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 736
    Top = 533
  end
  object DspClientesDeletados: TDataSetProvider
    DataSet = SqlClientesDeletados
    Left = 736
    Top = 568
  end
  object CdsClientesDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClientesDeletados'
    Left = 736
    Top = 599
    object StringField1: TStringField
      FieldName = 'CAMPO1'
    end
  end
  object SqlProjetosPharmalink: TSQLDataSet
    CommandText = 'SELECT * FROM PROJETOSPHARMALINK'#13#10'WHERE ID_PROJETO = :ID_PROJETO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 848
    Top = 528
  end
  object DspProjetosPharmalink: TDataSetProvider
    DataSet = SqlProjetosPharmalink
    Left = 848
    Top = 568
  end
  object QryProjetosPharmalink: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    ProviderName = 'DspProjetosPharmalink'
    Left = 848
    Top = 600
    object QryProjetosPharmalinkID_PROJETO: TFloatField
      FieldName = 'ID_PROJETO'
      Required = True
    end
    object QryProjetosPharmalinkDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object QryProjetosPharmalinkCODIGOPHARMALINK: TStringField
      FieldName = 'CODIGOPHARMALINK'
      Size = 10
    end
    object QryProjetosPharmalinkCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryProjetosPharmalinkSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object CdsProjetosPharmalink: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 848
    Top = 640
    object CdsProjetosPharmalinkID_PROJETO: TFloatField
      FieldName = 'ID_PROJETO'
      Required = True
    end
    object CdsProjetosPharmalinkDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsProjetosPharmalinkCODIGOPHARMALINK: TStringField
      FieldName = 'CODIGOPHARMALINK'
      Size = 10
    end
    object CdsProjetosPharmalinkCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object CdsProjetosPharmalinkSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 99
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
  object SqlAtualizaClientes: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CLIENTES('#13#10'        :CD_FILIAL,'#13#10'  ' +
      '      :CD_CLIENTE,'#13#10'        :CD_VENDEDOR,'#13#10'        :CD_CONVENIO,' +
      #13#10'        :NOME,'#13#10'        :ENDERECO,'#13#10'        :BAIRRO,'#13#10'        ' +
      ':CIDADE,'#13#10'        :UF,'#13#10'        :CEP,'#13#10'        :CAIXA_POSTAL,'#13#10' ' +
      '       :FONE,'#13#10'        :FAX,'#13#10'        :CONTATO,'#13#10'        :CNPJ,'#13 +
      #10'        :INSCRICAO,'#13#10'        :PRACA,'#13#10'        :DATA_FICHA,'#13#10'   ' +
      '     :RG,'#13#10'        :CPF,'#13#10'        :TITULO_ELEITO,'#13#10'        :DT_N' +
      'ASCIMENTO,'#13#10'        :SEXO,'#13#10'        :ESTADO_CIVIL,'#13#10'        :NAT' +
      'URALIDADE,'#13#10'        :FILIACAO,'#13#10'        :NUMERO_DEPENDENTES,'#13#10'  ' +
      '      :CONJUGE,'#13#10'        :DT_NASC_CONJUGE,'#13#10'        :ALUGUEL,'#13#10' ' +
      '       :VL_ALUGUEL,'#13#10'        :TEMPO_RESIDENCIA,'#13#10'        :EMPRES' +
      'A,'#13#10'        :FONE_COMERCIAL,'#13#10'        :DT_ADMISSAO,'#13#10'        :CE' +
      'P_COMERCIAL,'#13#10'        :CIDADE_COMERCIAL,'#13#10'        :UF_COMERCIAL,' +
      #13#10'        :FUNCAO,'#13#10'        :EMPRESA_ANTERIOR,'#13#10'        :TEMPO_S' +
      'ERVICO,'#13#10'        :REFERENCIA_COMERCIAL,'#13#10'        :REFERENCIA_BAN' +
      'CARIA,'#13#10'        :CONSULTA_SPC,'#13#10'        :OBSERVACAO_SPC,'#13#10'      ' +
      '  :OBSERVACAO_GERAL,'#13#10'        :ENDERECO_COBRANCA,'#13#10'        :BAIR' +
      'RO_COBRANCA,'#13#10'        :CIDADE_COBRANCA,'#13#10'        :UF_COBRANCA,'#13#10 +
      '        :CEP_COBRANCA,'#13#10'        :ICMS_IPI,'#13#10'        :NOME_MAE,'#13#10 +
      '        :MES_NASCIMENTO,'#13#10'        :RENDA,'#13#10'        :LIMITE_PERCE' +
      'NTUAL,'#13#10'        :LIMITE_CREDITO,'#13#10'        :EMAIL,'#13#10'        :HOME' +
      'PAGE,'#13#10'        :MATRICULA,'#13#10'        :SALDO,'#13#10'        :DT_VENCIME' +
      'NTO,'#13#10'        :DESCONTO,'#13#10'        :DT_ULTIMA_COMPRA,'#13#10'        :S' +
      'TATUS,'#13#10'        :REFERENCIA,'#13#10'        :DT_ALTERACAO,'#13#10'        :C' +
      'OMPRAOUTRALOJA,'#13#10'        :CARTAOFIDELIDADE,'#13#10'        :ENVIADO,'#13#10 +
      '        :NUMERO,'#13#10'        :COMPLEMENTO,'#13#10'        :CD_MUNICIPIO,'#13 +
      #10'        :CD_PAIS,'#13#10'        :ID_PERFIL_CLIENTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONVENIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAIXA_POSTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INSCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRACA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_FICHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TITULO_ELEITO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NASCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ESTADO_CIVIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATURALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMERO_DEPENDENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONJUGE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NASC_CONJUGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ALUGUEL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_ALUGUEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEMPO_RESIDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ADMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FUNCAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_ANTERIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEMPO_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_BANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONSULTA_SPC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO_SPC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO_GERAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ICMS_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_MAE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MES_NASCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'LIMITE_PERCENTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'LIMITE_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HOMEPAGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ULTIMA_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPRAOUTRALOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CARTAOFIDELIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PERFIL_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 184
    Top = 64
  end
  object SqlAtualizaClasses: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CLASSES('#13#10'        :CD_CLASSE,     ' +
      '      '#13#10'        :DESCRICAO,           '#13#10'        :TIPO,          ' +
      '      '#13#10'        :VENDEESTOQUENEGATIVO,'#13#10'        :DT_CALCULOCURVA' +
      ',     '#13#10'        :FREQUENCIA,          '#13#10'        :NPRODUTOS,     ' +
      '      '#13#10'        :NITENS,              '#13#10'        :VPRODUTOS,     ' +
      '      '#13#10'        :CPRODUTOS,           '#13#10'        :CONTROLALOTES, ' +
      '      '#13#10'        :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VENDEESTOQUENEGATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CALCULOCURVA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FREQUENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NITENS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTROLALOTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 664
    Top = 64
  end
  object SqlAtualizaFamilias: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_FAMILIAS('#13#10'        :ID_FAMILIA,'#13#10' ' +
      '       :DESCRICAO,'#13#10'        :STATUS,'#13#10'        :DT_ALTERACAO,'#13#10'  ' +
      '      :ALTERAPRECOFAMILIA,'#13#10'        :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_FAMILIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ALTERAPRECOFAMILIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 64
    Top = 152
  end
  object SqlAtualizaDistribuidores: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_DISTRIBUIDORES('#13#10'        :CD_DISTR' +
      'IBUIDOR,'#13#10'        :NOME,'#13#10'        :APELIDO,'#13#10'        :ENDERECO,'#13 +
      #10'        :BAIRRO,'#13#10'        :CIDADE,'#13#10'        :UF,'#13#10'        :CEP,' +
      #13#10'        :CAIXA_POSTAL,'#13#10'        :FONE,'#13#10'        :FAX,'#13#10'       ' +
      ' :CONTATO,'#13#10'        :CNPJ,'#13#10'        :IE,'#13#10'        :PRACA,'#13#10'     ' +
      '   :DT_FICHA,'#13#10'        :RG,'#13#10'        :CPF,'#13#10'        :EMPRESA,'#13#10' ' +
      '       :FONE_COMERCIAL,'#13#10'        :CEP_COMERCIAL,'#13#10'        :CIDAD' +
      'E_COMERCIAL,'#13#10'        :UF_COMERCIAL,'#13#10'        :REFERENCIA_COMERC' +
      'IAL,'#13#10'        :REFERENCIA_BANCARIA,'#13#10'        :DT_CONSULTA_SPC,'#13#10 +
      '        :OBS_SPC,'#13#10'        :TIPO_ATIVIDADE,'#13#10'        :VENDEDOR,'#13 +
      #10'        :ENDERECO_COBRANCA,'#13#10'        :BAIRRO_COBRANCA,'#13#10'       ' +
      ' :CIDADE_COBRANCA,'#13#10'        :UF_COBRANCA,'#13#10'        :CEP_COBRANCA' +
      ','#13#10'        :ICM_IPI,'#13#10'        :LIMITE_CREDITO,'#13#10'        :EMAIL,'#13 +
      #10'        :HOMEPAGE,'#13#10'        :CD_PLANO_CONTAS,'#13#10'        :RAZAO,'#13 +
      #10'        :DT_ALTERACAO,'#13#10'        :ARQUIVO_ENVIO,'#13#10'        :ARQUI' +
      'VO_RETORNO,'#13#10'        :PROGRAMAENVIO,'#13#10'        :CODIGODICIONARIO,' +
      #13#10'        :CODIGOFATURAMENTO,'#13#10'        :CFOP,'#13#10'        :CD_MUNIC' +
      'IPIO,'#13#10'        :CD_PAIS,'#13#10'        :COMPLEMENTO,'#13#10'        :NUMERO' +
      ','#13#10'        :SOMAICMSSUBSTITUICAO,'#13#10'        :SOMAIPI,'#13#10'        :S' +
      'OMAFRETE,'#13#10'        :SOMASEGURO,'#13#10'        :SOMAOUTRASDESPESAS,'#13#10' ' +
      '       :USAFTP,'#13#10'        :FTPHOST,'#13#10'        :FTPUSUARIO,'#13#10'      ' +
      '  :FTPSENHA,'#13#10'        :FTPDIRETORIOENVIO,'#13#10'        :FTPDIRETORIO' +
      'RETORNO,'#13#10'        :CONCLUINFSEMBOLETO,'#13#10'        :TAXABOLETO'#13#10')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'APELIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAIXA_POSTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRACA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FICHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_BANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CONSULTA_SPC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBS_SPC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_ATIVIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICM_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'LIMITE_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HOMEPAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAZAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ARQUIVO_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ARQUIVO_RETORNO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROGRAMAENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CODIGODICIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGOFATURAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CFOP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_PAIS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SOMAICMSSUBSTITUICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SOMAIPI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SOMAFRETE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SOMASEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SOMAOUTRASDESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USAFTP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FTPHOST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FTPUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FTPSENHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FTPDIRETORIOENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FTPDIRETORIORETORNO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONCLUINFSEMBOLETO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'TAXABOLETO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 416
    Top = 64
  end
  object SqlAtualizaGrupos: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOS('#13#10'        :CD_GRUPO,'#13#10'     ' +
      '   :DESCRICAO,'#13#10'        :TX_MARCACAO,'#13#10'        :DESCONTO,'#13#10'     ' +
      '   :TX_DESCONTO,'#13#10'        :TX_DESCONTO_MAXIMO,'#13#10'        :TX_COMI' +
      'SSAO,'#13#10'        :DIAS_EST_MIN,'#13#10'        :TIPO,'#13#10'        :DT_ALTER' +
      'ACAO,'#13#10'        :NPRODUTOS,'#13#10'        :NITENS,'#13#10'        :VPRODUTOS' +
      ','#13#10'        :CPRODUTOS,'#13#10'        :EXIGERECEITA,'#13#10'        :VENDEES' +
      'TOQUENEGATIVO,'#13#10'        :PEDECRM,'#13#10'        :META,'#13#10'        :ENVI' +
      'ADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_MARCACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_DESCONTO_MAXIMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_COMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DIAS_EST_MIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NITENS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EXIGERECEITA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VENDEESTOQUENEGATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PEDECRM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'META'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 415
    Top = 152
  end
  object SqlAtualizaLaboratorios: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_LABORATORIOS('#13#10'        :CD_LABORAT' +
      'ORIO,'#13#10'        :ID_AREA,'#13#10'        :NOME,'#13#10'        :RAZAO,'#13#10'     ' +
      '   :CNPJ,'#13#10'        :ENDERECO,'#13#10'        :CIDADE,'#13#10'        :FONE,'#13 +
      #10'        :CONTATO,'#13#10'        :TX_DESCONTO,'#13#10'        :CONTROLE,'#13#10' ' +
      '       :DT_ALTERACAO,'#13#10'        :NPRODUTOS,'#13#10'        :NITENS,'#13#10'  ' +
      '      :VPRODUTOS,'#13#10'        :CPRODUTOS,'#13#10'        :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_AREA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAZAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTROLE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NITENS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 64
  end
  object SqlAtualizaVendedores: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_VENDEDORES('#13#10'          :CD_VENDEDO' +
      'R,'#13#10'          :CD_FILIAL,'#13#10'          :DT_ADMISSAO,'#13#10'          :D' +
      'T_NASCIMENTO,'#13#10'          :TIPO_FUNCIONARIO,'#13#10'          :CODIGO_B' +
      'ARRAS,'#13#10'          :NOME,'#13#10'          :RUA,'#13#10'          :BAIRRO,'#13#10' ' +
      '         :CIDADE,'#13#10'          :UF,'#13#10'          :CEP,'#13#10'          :F' +
      'ONE,'#13#10'          :REFERENCIA,'#13#10'          :RG,'#13#10'          :CPF,'#13#10' ' +
      '         :JORNADA,'#13#10'          :INTERVALO,'#13#10'          :REPOUSO,'#13#10 +
      '          :NR_REGISTRO,'#13#10'          :CTPS,'#13#10'          :FUNCAO,'#13#10' ' +
      '         :SALARIO,'#13#10'          :TX_COMISSAO,'#13#10'          :COMISSAO' +
      ','#13#10'          :VENDA,'#13#10'          :ENVIADO,'#13#10'          :SEXO,'#13#10'   ' +
      '       :ESTADO_CIVIL,'#13#10'          :NATURALIDADE,'#13#10'          :CONJ' +
      'UGE,'#13#10'          :DT_NASC_CONJUGE,'#13#10'          :NUM_DEPEND,'#13#10'     ' +
      '     :NOMEMAE,'#13#10'          :NOMEPAI,'#13#10'          :EMPRESA_ANTERIOR' +
      ','#13#10'          :TEMPO_SERVICO,'#13#10'          :REFERENCIA_COMERCIAL,'#13#10 +
      '          :REFERENCIA_BANCARIA,'#13#10'          :DESCONTO,'#13#10'         ' +
      ' :COMISSAO_MEDICAMENTOS,'#13#10'          :COMISSAO_BONIFICADOS,'#13#10'    ' +
      '      :COMISSAO_PERFUMARIA,'#13#10'          :COMISSAO_OUTROS,'#13#10'      ' +
      '    :COTA,'#13#10'          :SENHA,'#13#10'          :DT_ALTERACAO,'#13#10'       ' +
      '   :STATUS,'#13#10'          :VENDEOUTRALOJA,'#13#10'          :USUARIOFARMA' +
      'CIAPOPULAR,'#13#10'          :SENHAFARMACIAPOPULAR)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ADMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NASCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RUA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'JORNADA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INTERVALO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REPOUSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_REGISTRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CTPS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FUNCAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_COMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ESTADO_CIVIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATURALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONJUGE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NASC_CONJUGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUM_DEPEND'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEMAE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMEPAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_ANTERIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEMPO_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_BANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMISSAO_MEDICAMENTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMISSAO_BONIFICADOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMISSAO_PERFUMARIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMISSAO_OUTROS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VENDEOUTRALOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIOFARMACIAPOPULAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHAFARMACIAPOPULAR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 536
    Top = 64
  end
  object SqlAtualizaPlanoContas: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PLANO_CONTAS('#13#10'        :CD_PLANO_C' +
      'ONTAS,'#13#10'        :CD_HISTORICO,'#13#10'        :HISTORICO,'#13#10'        :GR' +
      'AU,'#13#10'        :SISTEMA,'#13#10'        :TIPO_CONTA,'#13#10'        :APURACAO,' +
      #13#10'        :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_PLANO_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_HISTORICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GRAU'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'APURACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 800
    Top = 64
  end
  object SqlAtualizaConvenios: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONVENIOS('#13#10'        :CD_CONVENIO,'#13 +
      #10'        :NOME,'#13#10'        :RAZAO,'#13#10'        :ENDERECO,'#13#10'        :B' +
      'AIRRO,'#13#10'        :CIDADE,'#13#10'        :UF,'#13#10'        :CEP,'#13#10'        :' +
      'CAIXA_POSTAL,'#13#10'        :FONE,'#13#10'        :FAX,'#13#10'        :CONTATO,'#13 +
      #10'        :CNPJ,'#13#10'        :IE,'#13#10'        :PRACA,'#13#10'        :DT_FICH' +
      'A,'#13#10'        :RG,'#13#10'        :CPF,'#13#10'        :EMPRESA,'#13#10'        :FON' +
      'E_COMERCIAL,'#13#10'        :CEP_COMERCIAL,'#13#10'        :CIDADE_COMERCIAL' +
      ','#13#10'        :UF_COMERCIAL,'#13#10'        :REFERENCIA_COMERCIAL,'#13#10'     ' +
      '   :REFERENCIA_BANCARIA,'#13#10'        :DT_CONSULTA_SPC,'#13#10'        :OB' +
      'S_SPC,'#13#10'        :TIPO_ATIVIDADE,'#13#10'        :CD_VENDEDOR,'#13#10'       ' +
      ' :ENDERECO_COBRANCA,'#13#10'        :BAIRRO_COBRANCA,'#13#10'        :CIDADE' +
      '_COBRANCA,'#13#10'        :UF_COBRANCA,'#13#10'        :CEP_COBRANCA,'#13#10'     ' +
      '   :ICM_IPI,'#13#10'        :LIMITE_CREDITO,'#13#10'        :EMAIL,'#13#10'       ' +
      ' :HOMEPAGE,'#13#10'        :MULTI,'#13#10'        :TX_DESCONTO,'#13#10'        :DT' +
      '_VENCIMENTO,'#13#10'        :DT_FECHAMENTO,'#13#10'        :SALDO,'#13#10'        ' +
      ':JAN,'#13#10'        :FEV,'#13#10'        :MAR,'#13#10'        :ABR,'#13#10'        :MAI' +
      ','#13#10'        :JUN,'#13#10'        :JUL,'#13#10'        :AGO,'#13#10'        :SET_,'#13#10 +
      '        :OUT,'#13#10'        :NOV,'#13#10'        :DEZ,'#13#10'        :DT_ALTERAC' +
      'AO,'#13#10'        :USUARIOSITE,'#13#10'        :SENHASITE,'#13#10'        :PERMIT' +
      'EPARCELAMENTO,'#13#10'        :PAGACOMISSAO,'#13#10'        :PAGAAVISTA,'#13#10'  ' +
      '      :STATUS,'#13#10'        :CD_MUNICIPIO,'#13#10'        :CD_PAIS,'#13#10'     ' +
      '   :COMPLEMENTO,'#13#10'        :NUMERO,'#13#10'        :FATURAFECHADA,'#13#10'   ' +
      '     :EXIBIRDADOSCIENTECOMPROVANTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONVENIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAZAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAIXA_POSTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRACA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FICHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_COMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA_BANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_CONSULTA_SPC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBS_SPC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_ATIVIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP_COBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICM_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'LIMITE_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HOMEPAGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MULTI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DT_FECHAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'JAN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FEV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ABR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MAI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'JUN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'JUL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'AGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SET_'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'OUT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NOV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DEZ'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIOSITE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHASITE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERMITEPARCELAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PAGACOMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PAGAAVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FATURAFECHADA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EXIBIRDADOSCLIENTECOMPROVANTE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 928
    Top = 64
  end
  object SqlAtualizaTransportadoras: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_TRANSPORTADORAS('#13#10'        :CD_TRAN' +
      'SPORTADORA,'#13#10'        :NOME,'#13#10'        :RAZAO,'#13#10'        :CNPJ,'#13#10'  ' +
      '      :INSCRICAO,'#13#10'        :ENDERECO,'#13#10'        :NUMERO,'#13#10'       ' +
      ' :COMPLEMENTO,'#13#10'        :BAIRRO,'#13#10'        :CIDADE,'#13#10'        :UF,' +
      #13#10'        :CEP,'#13#10'        :CD_MUNICIPIO,'#13#10'        :FONE,'#13#10'       ' +
      ' :FAX,'#13#10'        :CAIXA_POSTAL,'#13#10'        :CONTATO,'#13#10'        :EMAI' +
      'L,'#13#10'        :URL,'#13#10'        :CD_PAIS,'#13#10'        :PAIS,'#13#10'        :D' +
      'T_ALTERACAO,'#13#10'        :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_TRANSPORTADORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAZAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INSCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAIXA_POSTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'URL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PAIS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 63
    Top = 64
  end
  object SqlAtualizaCartoes: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CARTOES('#13#10'        :CD_CARTAO,'#13#10'   ' +
      '     :CD_CONTA,'#13#10'        :DESCRICAO,'#13#10'        :TIPO_CARTAO,'#13#10'   ' +
      '     :TX_ADM,'#13#10'        :TX_ADM_PARC,'#13#10'        :PRAZO_PG,'#13#10'      ' +
      '  :IMAGEM,'#13#10'        :USATEF,'#13#10'        :TRNCENTRE,'#13#10'        :FIDE' +
      'LIZE,'#13#10'        :HIPERCARD,'#13#10'        :REDEVESPAGUE,'#13#10'        :ENV' +
      'IADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_ADM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_ADM_PARC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRAZO_PG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IMAGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USATEF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRNCENTRE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FIDELIZE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HIPERCARD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REDEVESPAGUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 152
  end
  object SqlAtualizaFiliais: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_FILIAIS('#13#10'        :CD_FILIAL,'#13#10'   ' +
      '     :NOME,'#13#10'        :RAZAO,'#13#10'        :CNPJ,'#13#10'        :INSCRICAO' +
      ','#13#10'        :RUA,'#13#10'        :NUMERO,'#13#10'        :COMPLEMENTO,'#13#10'     ' +
      '   :BAIRRO,'#13#10'        :CIDADE,'#13#10'        :UF,'#13#10'        :CEP,'#13#10'    ' +
      '    :FONE,'#13#10'        :FONE_1,'#13#10'        :FAX,'#13#10'        :CONTATO,'#13#10 +
      '        :CD_DISTRIBUIDOR,'#13#10'        :CD_CLIENTE,'#13#10'        :ENDERE' +
      'COWEB,'#13#10'        :EXPORTAR,'#13#10'        :METROSQUADRADOS,'#13#10'        :' +
      'NUMEROFUNCIONARIOS,'#13#10'        :NUMEROPDVS,'#13#10'        :STATUS,'#13#10'   ' +
      '     :CD_MUNICIPIO,'#13#10'        :IFOOD_CLIENT_ID,'#13#10'        :IFOOD_C' +
      'LIENT_SECRET,'#13#10'        :IFOOD_ID_LOJA,'#13#10'        :IFOOD_PRECO_PRA' +
      'TICADO,'#13#10'        :IFOOD_QNTD_ENVIO,'#13#10'        :IFOOD_VENDEDOR,'#13#10' ' +
      '       :FARMACIASAPP_CLIENT_ID,'#13#10'        :FARMACIASAPP_CLIENT_SE' +
      'CRET,'#13#10'        :FARMACIASAPP_ID_LOJA,'#13#10'        :FARMACIASAPP_PRE' +
      'CO_PRATICADO,'#13#10'        :FARMACIASAPP_QNTD_ENVIO,'#13#10'        :FARMA' +
      'CIASAPP_VENDEDOR'#13#10')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAZAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INSCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RUA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE_1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECOWEB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EXPORTAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'METROSQUADRADOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMEROFUNCIONARIOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMEROPDVS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IFOOD_CLIENT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IFOOD_CLIENT_SECRET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IFOOD_ID_LOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IFOOD_PRECO_PRATICADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IFOOD_QNTD_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IFOOD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FARMACIASAPP_CLIENT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FARMACIASAPP_CLIENT_SECRET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FARMACIASAPP_ID_LOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FARMACIASAPP_PRECO_PRATICADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FARMACIASAPP_QNTD_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FARMACIASAPP_VENDEDOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 184
    Top = 152
  end
  object SqlAtualizaBalancoLoja: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_BALANCO_LOJA('#13#10'          :ID_BALAN' +
      'CO,'#13#10'          :ID_MOTIVO,'#13#10'          :DATA,'#13#10'          :HORA,'#13#10 +
      '          :DATA_ABERTURA,'#13#10'          :HORA_ABERTURA,'#13#10'          ' +
      ':DATA_CONTAGEM,'#13#10'          :HORA_CONTAGEM,'#13#10'          :DATA_CONC' +
      'LUSAO,'#13#10'          :HORA_CONCLUSAO,'#13#10'          :CD_FILIAL,'#13#10'     ' +
      '     :ID_PRODUTO,'#13#10'          :CD_PRODUTO,'#13#10'          :CODIGO_BAR' +
      'RAS_1,'#13#10'          :CODIGO_BARRAS_2,'#13#10'          :DESCRICAO,'#13#10'    ' +
      '      :CD_GRUPO,'#13#10'          :GRUPO,'#13#10'          :CD_LABORATORIO,'#13 +
      #10'          :LABORATORIO,'#13#10'          :CD_CLASSE,'#13#10'          :CLAS' +
      'SE,'#13#10'          :CUSTO_UNITARIO,'#13#10'          :PRECO_VENDA,'#13#10'      ' +
      '    :PRECO_VENDA_ANTERIOR,'#13#10'          :ESTOQUE,'#13#10'          :ESTO' +
      'QUE_ANTERIOR,'#13#10'          :SUBSTITUIESTOQUE,'#13#10'          :STATUS,'#13 +
      #10'          :ENVIADO,'#13#10'          :CD_SUBGRUPO,'#13#10'          :USUARI' +
      'O_ABERTURA,'#13#10'          :USUARIO_CONCLUSAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_BALANCO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_MOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_ABERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA_ABERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_CONTAGEM'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA_CONTAGEM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_CONCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA_CONCLUSAO'
        ParamType = ptInput
      end
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
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS_1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS_2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CUSTO_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO_VENDA_ANTERIOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_ANTERIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SUBSTITUIESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_SUBGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO_ABERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO_CONCLUSAO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 536
    Top = 152
  end
  object SqlAtualizaDeletados: TSQLDataSet
    CommandText = 'EXECUTE PROCEDURE SP_ATUALIZA_DELETADOS(:TABELA, :CAMPO, :VALOR)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAMPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VALOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 928
    Top = 152
  end
  object DspCeProdutos: TDataSetProvider
    DataSet = TbCeProdutos
    Left = 863
    Top = 408
  end
  object CdsCeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeProdutos'
    Left = 863
    Top = 439
  end
  object TbCeProdutos: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 867
    Top = 381
  end
  object SqlAtualizaGruposBalanco: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOSBALANCO('#13#10'        :CD_GRUPOB' +
      'ALANCO,'#13#10'        :DESCRICAO,'#13#10'        :STATUS,'#13#10'        :DT_ALTE' +
      'RACAO,'#13#10'        :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPOBALANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 664
    Top = 152
  end
  object SqlAtualizaGruposCompras: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOSCOMPRAS('#13#10':CD_GRUPOCOMPRA,'#13#10 +
      ':DESCRICAO,'#13#10':STATUS,'#13#10':DT_ALTERACAO,'#13#10':ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPOCOMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 800
    Top = 152
  end
  object SqlAtualizaGruposCurva: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOSCURVA('#13#10'          :CD_FILIAL' +
      ','#13#10'          :CD_GRUPO,'#13#10'          :GRUPO,'#13#10'          :CD_CURVA,' +
      #13#10'          :CURVA,'#13#10'          :SIGLA,'#13#10'          :DIASESTOQUE,'#13 +
      #10'          :ESEG,'#13#10'          :P1,'#13#10'          :P2,'#13#10'          :P1' +
      'SAZ,'#13#10'          :P2SAZ,'#13#10'          :DT_ALTERACAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CURVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CURVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SIGLA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DIASESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P1SAZ'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P2SAZ'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 664
    Top = 240
  end
  object SqlBalancos: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' BALANCO'#13#10'WHERE'#13#10' ID_BALANCO = :ID_BALANCO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 404
    Top = 541
  end
  object DspBalancos: TDataSetProvider
    DataSet = SqlBalancos
    Left = 404
    Top = 568
  end
  object QryBalancos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end>
    ProviderName = 'DspBalancos'
    Left = 404
    Top = 599
    object QryBalancosID_BALANCO: TFloatField
      FieldName = 'ID_BALANCO'
    end
    object QryBalancosID_MOTIVO: TFloatField
      FieldName = 'ID_MOTIVO'
    end
    object QryBalancosDATA: TDateField
      FieldName = 'DATA'
    end
    object QryBalancosHORA: TTimeField
      FieldName = 'HORA'
    end
    object QryBalancosDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object QryBalancosHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
    end
    object QryBalancosDATA_CONTAGEM: TDateField
      FieldName = 'DATA_CONTAGEM'
    end
    object QryBalancosHORA_CONTAGEM: TTimeField
      FieldName = 'HORA_CONTAGEM'
    end
    object QryBalancosDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object QryBalancosHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object QryBalancosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryBalancosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryBalancosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object QryBalancosCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object QryBalancosCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 14
    end
    object QryBalancosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object QryBalancosCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryBalancosGRUPO: TStringField
      FieldName = 'GRUPO'
    end
    object QryBalancosCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryBalancosLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
    end
    object QryBalancosCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object QryBalancosCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 30
    end
    object QryBalancosCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
    object QryBalancosPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object QryBalancosPRECO_VENDA_ANTERIOR: TFloatField
      FieldName = 'PRECO_VENDA_ANTERIOR'
    end
    object QryBalancosESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object QryBalancosESTOQUE_ANTERIOR: TFloatField
      FieldName = 'ESTOQUE_ANTERIOR'
    end
    object QryBalancosSUBSTITUIESTOQUE: TStringField
      FieldName = 'SUBSTITUIESTOQUE'
      Size = 1
    end
    object QryBalancosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryBalancosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsLancamentosaPrazo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 280
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
  object SqlAtualizaLancamentosAPrazo: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_LANCAMENTOSAPRAZO (:CD_LANCAMENTO,' +
      ' :ID_PRODUTO, :CD_FILIAL, :CD_PRODUTO, :DESCRICAO, :CD_LABORATOR' +
      'IO, :CD_GRUPO,:CD_CLASSE, :CD_CONVENIO, :CD_CLIENTE, :CD_VENDEDO' +
      'R, :CD_OPERADOR, :CD_USUARIO, :CD_FORMA_PAGAMENTO,:CD_VENDA, :ID' +
      '_OPERADORCAIXA, :CUSTO_MEDIO, :CUSTO_UNITARIO, :DATA_LANCAMENTO,' +
      ' :DATA_CAIXA, :QUANTIDADE,:VALOR, :COMISSAO, :NOTA_FISCAL, :DESC' +
      'ONTO, :PROMOCAO, :TIPO_VENDA, :TIPO_PAGAMENTO, :ENTRADA_SAIDA,:E' +
      'TIQUETA, :ENTREGA, :HORA, :ESTOQUE_POSVENDA, :TROCA, :ENVIADO, :' +
      'NUMERO, :TERMINAL, :USUARIO,:OBSERVACAO, :ARREDONDAMENTO, :TRN, ' +
      ':TRANSACAOTRN, :LOTETRN, :AUTORIZACAOTRN, :SUBSIDIOTRN,:NOTAMANU' +
      'AL)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONVENIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_OPERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FORMA_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_OPERADORCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CUSTO_MEDIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CUSTO_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_CAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROMOCAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENTRADA_SAIDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ETIQUETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENTREGA'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_POSVENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TROCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TERMINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ARREDONDAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSACAOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTETRN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AUTORIZACAOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUBSIDIOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTAMANUAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 64
    Top = 240
  end
  object CdsCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 183
    Top = 284
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
    object CdsComprasICMSDESONERACAO: TFMTBCDField
      FieldName = 'ICMSDESONERACAO'
      Precision = 19
      Size = 2
    end
  end
  object CdsItensCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 295
    Top = 284
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
    object CdsItensCompraENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsItensCompraPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
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
      Size = 15
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
  object CdsContas_Receber: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 283
    object CdsContas_ReceberCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
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
    object CdsContas_ReceberGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object CdsContas_ReceberENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsContas_ReceberCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object CdsContas_ReceberCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object CdsContas_ReceberCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object CdsContas_ReceberBOLETOGERADO: TStringField
      FieldName = 'BOLETOGERADO'
      Size = 1
    end
    object CdsContas_ReceberDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
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
    object CdsContas_ReceberCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
  end
  object SqlAtualizaContasReceber: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONTAS_RECEBER_LOJA ('#13#10'        :CD' +
      '_CONTAS_RECEBER,'#13#10'        :CD_CLIENTE,'#13#10'        :CD_PLANO_CONTAS' +
      ','#13#10'        :CD_FILIAL,'#13#10'        :CD_CONVENIO,'#13#10'        :CD_VENDE' +
      'DOR,'#13#10'        :CD_VENDA,'#13#10'        :CD_FORMA_PAGAMENTO,'#13#10'        ' +
      ':CD_CONTA,'#13#10'        :CD_CARTAO,'#13#10'        :CD_BORDERO,'#13#10'        :' +
      'DT_LANCAMENTO,'#13#10'        :DT_VENCIMENTO,'#13#10'        :NOTA_FISCAL,'#13#10 +
      '        :SERIE_NOTA,'#13#10'        :DOCUMENTO,'#13#10'        :DT_NOTA_FISC' +
      'AL,'#13#10'        :VENCTO,'#13#10'        :VALOR,'#13#10'        :HISTORICO,'#13#10'   ' +
      '     :CD_CHEQUE_RECEBIDO,'#13#10'        :NR_CHEQUE,'#13#10'        :NR_BANC' +
      'O,'#13#10'        :DT_PAGAMENTO,'#13#10'        :VL_PAGAMENTO,'#13#10'        :VL_' +
      'JUROS,'#13#10'        :VL_DESCONTO,'#13#10'        :VL_SALDO,'#13#10'        :NOSS' +
      'O_NUMERO,'#13#10'        :BANCO,'#13#10'        :AGENCIA,'#13#10'        :CONTA,'#13#10 +
      '        :HISTORICO_BANCO,'#13#10'        :STATUS,'#13#10'        :GERABOLETO' +
      ','#13#10'        :BOLETOGERADO,'#13#10'        :DT_ALTERACAO,'#13#10'        :TEFT' +
      'RANSACAO,'#13#10'        :TEFLOTE,'#13#10'        :TEFAUTORIZACAO,'#13#10'        ' +
      ':TEFDATA,'#13#10'        :TEFHORA,'#13#10'        :TEFNOMEREDE,'#13#10'        :TE' +
      'FVALOR,'#13#10'        :ENVIADO,'#13#10'        :TRNTRANSACAO,'#13#10'        :TRN' +
      'LOTE,'#13#10'        :TRNAUTORIZACAO,'#13#10'        :TRN,'#13#10'        :CD_FILI' +
      'AL_PAGAMENTO,'#13#10'        :PARCELA,'#13#10'        :CD_CAIXA,'#13#10'        :C' +
      'D_FILIAL_ORIGEM)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONVENIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FORMA_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_BORDERO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CHEQUE_RECEBIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_JUROS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_SALDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOSSO_NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HISTORICO_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GERABOLETO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BOLETOGERADO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TEFTRANSACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TEFLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEFAUTORIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'TEFDATA'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'TEFHORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEFNOMEREDE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TEFVALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRNTRANSACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRNLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRNAUTORIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL_ORIGEM'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 416
    Top = 240
  end
  object SqlAtualizaContasPagar: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONTAS_PAGAR('#13#10#9'  :CD_CONTAS_PAGAR' +
      ','#13#10'          :CD_FILIAL,'#13#10'          :CD_DISTRIBUIDOR,'#13#10'         ' +
      ' :CD_COMPRAS,'#13#10'          :CD_CONTA,'#13#10'          :CD_FORMA_PAGAMEN' +
      'TO,'#13#10'          :CD_PLANO_CONTAS,'#13#10'          :NUMERO_NOTA,'#13#10'     ' +
      '     :SERIAL_NOTA,'#13#10'          :DOCUMENTO,'#13#10'          :DT_NOTA,'#13#10 +
      '          :DT_VENCIMENTO,'#13#10'          :VALOR,'#13#10'          :DT_LANC' +
      'AMENTO,'#13#10'          :DT_PAGAMENTO,'#13#10'          :DT_BOLETO,'#13#10'      ' +
      '    :DT_ENTRADA,'#13#10'          :VL_PAGAMENTO,'#13#10'          :VL_JUROS,' +
      #13#10'          :VL_DESCONTO,'#13#10'          :VL_SALDO,'#13#10'          :NOSS' +
      'O_NUMERO,'#13#10'          :BANCO,'#13#10'          :AGENCIA,'#13#10'          :CO' +
      'NTA,'#13#10'          :HISTORICO,'#13#10'          :NR_CHEQUE,'#13#10'          :S' +
      'TATUS,'#13#10'          :ENVIADO,'#13#10'          :DESPESAFINANCEIRA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_PAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FORMA_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIAL_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_BOLETO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_JUROS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_SALDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOSSO_NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DESPESAFINANCEIRA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 536
    Top = 240
  end
  object CdsContas_Pagar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 283
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
  object SqlAtualizaItensCompraLote: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_LOTESITENSCOMPRA ('#13#10'    :CD_COMPRA' +
      'S,'#13#10'    :CD_FILIAL,'#13#10'    :CD_DISTRIBUIDOR,'#13#10'    :NOTA_FISCAL,'#13#10' ' +
      '   :ID_PRODUTO,'#13#10'    :LOTE,'#13#10'    :QUANTIDADE,'#13#10'    :FABRICACAO,'#13 +
      #10'    :VALIDADE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FABRICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VALIDADE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 800
    Top = 240
  end
  object CdsLotesItensCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 280
    object CdsLotesItensCompraCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object CdsLotesItensCompraCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsLotesItensCompraCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
    end
    object CdsLotesItensCompraNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsLotesItensCompraID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsLotesItensCompraLOTE: TStringField
      FieldName = 'LOTE'
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
  object CdsReexportacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1200
    Top = 16
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
  object SqlCaixasDeletados: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CAMPO1,'#13#10' CD_FILIAL'#13#10'FROM'#13#10' DELETADOS'#13#10'WHERE'#13#10' TABELA ' +
      '= '#39'CAIXA'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 944
    Top = 525
  end
  object DspCaixasDeletados: TDataSetProvider
    DataSet = SqlCaixasDeletados
    Left = 944
    Top = 560
  end
  object CdsCaixasDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCaixasDeletados'
    Left = 944
    Top = 591
    object StringField2: TStringField
      FieldName = 'CAMPO1'
    end
    object CdsCaixasDeletadosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object SqlAtualizaSubGrupos: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_SUBGRUPOS('#13#10'        :CD_SUBGRUPO,'#13 +
      #10'        :CD_GRUPO,'#13#10'        :DESCRICAO,'#13#10'        :DT_ALTERACAO,' +
      #13#10'        :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_SUBGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ALTERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 928
    Top = 240
  end
  object CdsSubGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 928
    Top = 280
    object CdsSubGruposCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
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
  object Dsp1: TDataSetProvider
    DataSet = Sql1
    Left = 312
    Top = 8
  end
  object Cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp1'
    Left = 368
    Top = 8
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
    Left = 48
    Top = 8
  end
  object CdsFiliaisGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1056
    Top = 104
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
  object SqlAtualizaFiliaisGrupos: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_FILIAISGRUPOS('#13#10'          :CD_GRUP' +
      'O,'#13#10'          :TX_COMISSAO,'#13#10'          :DESCONTO,'#13#10'          :TX' +
      '_DESCONTO,'#13#10'          :TX_DESCONTO_MAXIMO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_COMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_DESCONTO_MAXIMO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1056
    Top = 64
  end
  object SqlAtualizaCompras: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_COMPRAS_LOJA ('#13#10'        :CD_COMPRA' +
      'S,'#13#10'        :CD_FILIAL,'#13#10'        :CD_DISTRIBUIDOR,'#13#10'        :CD_' +
      'PLANO_CONTAS,'#13#10'        :CD_OBSERVACAO,'#13#10'        :CD_TRANSPORTADO' +
      'RA,'#13#10'        :DT_PEDIDO,'#13#10'        :NOTA_FISCAL,'#13#10'        :SERIE_' +
      'NOTA_FISCAL,'#13#10'        :DT_EMISSAO,'#13#10'        :BOLETO,'#13#10'        :D' +
      'T_BOLETO,'#13#10'        :CD_CFOP,'#13#10'        :DT_ENTRADA,'#13#10'        :VL_' +
      'IPI,'#13#10'        :VL_ICM,'#13#10'        :TOTAL_NOTA,'#13#10'        :ICM_BASE_' +
      'CALCULO,'#13#10'        :ICM_ISENTO,'#13#10'        :ICM_OUTROS,'#13#10'        :I' +
      'CM_BASESUBST,'#13#10'        :ICM_VALORSUBST,'#13#10'        :VL_TOTALPRODUT' +
      'OS,'#13#10'        :VL_SEGURO,'#13#10'        :OUTRAS_DESPESAS,'#13#10'        :VL' +
      '_FRETE,'#13#10'        :IPI_BASE_CALCULO,'#13#10'        :IPI_ISENTO,'#13#10'     ' +
      '   :IPI_OUTROS,'#13#10'        :D_ICMV,'#13#10'        :D_IPIV,'#13#10'        :D_' +
      'TOTNT,'#13#10'        :UNIDADES,'#13#10'        :NUMERO_ITENS,'#13#10'        :FAT' +
      'URAMENTO,'#13#10'        :MOTIVO,'#13#10'        :ENVIADO,'#13#10'        :STATUS,' +
      #13#10'        :VL_DESCONTO_NOTA,'#13#10'        :CD_USUARIO_CRIACAO,'#13#10'    ' +
      '    :USUARIO_DIGITACAO,'#13#10'        :CD_USUARIO_DIGITACAO,'#13#10'       ' +
      ' :USUARIO_CRIACAO,'#13#10'        :CD_USUARIO_CONCLUSAO,'#13#10'        :USU' +
      'ARIO_CONCLUSAO,'#13#10'        :CD_USUARIO_ENVIO,'#13#10'        :USUARIO_EN' +
      'VIO,'#13#10'        :VINCULADO,'#13#10'        :CD_COMPRAS_VINCULADO,'#13#10'     ' +
      '   :TEMVINCULADO,'#13#10'        :STATUSCONFERENCIA,'#13#10'        :CD_USUA' +
      'RIO_CONFERENCIA,'#13#10'        :USUARIO_CONFERENCIA,'#13#10'        :CONFIG' +
      'GERACAO,'#13#10'        :LOCALGERACAO,'#13#10'        :MODELONF,'#13#10'        :V' +
      'L_ISENTOICMS,'#13#10'        :ICMS_RETIDO,'#13#10'        :PHARMALINK,'#13#10'    ' +
      '    :BONIFICACAO,'#13#10'        :CHAVENFE,'#13#10'        :VL_PIS,'#13#10'       ' +
      ' :VL_COFINS,'#13#10'        :INFCPL,'#13#10'        :TRANSFERENCIA,'#13#10'       ' +
      ' :CONSIGNACAO,'#13#10'        :VL_FCP,'#13#10'        :VL_FCPST,'#13#10'        :V' +
      'L_FCPSTRET,'#13#10'        :VL_II,'#13#10'        :ICM_BASESUBSTRET,'#13#10'      ' +
      '  :ICM_VALORSUBSTRET,'#13#10'        :ICMSDESONERACAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_DISTRIBUIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_OBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_TRANSPORTADORA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_EMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BOLETO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_BOLETO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CFOP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_ICM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TOTAL_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICM_BASE_CALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICM_ISENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICM_OUTROS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICM_BASESUBST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICM_VALORSUBST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_TOTALPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_SEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'OUTRAS_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_FRETE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IPI_BASE_CALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IPI_ISENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IPI_OUTROS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'D_ICMV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'D_IPIV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'D_TOTNT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'UNIDADES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMERO_ITENS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FATURAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_DESCONTO_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO_CRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO_DIGITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO_DIGITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO_CRIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO_CONCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO_CONCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VINCULADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS_VINCULADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEMVINCULADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUSCONFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO_CONFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO_CONFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONFIGGERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOCALGERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODELONF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_ISENTOICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICMS_RETIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHARMALINK'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BONIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CHAVENFE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_PIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_COFINS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INFCPL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONSIGNACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VL_FCP'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VL_FCPST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VL_FCPSTRET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VL_II'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICM_BASESUBSTRET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICM_VALORSUBSTRET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSDESONERACAO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 184
    Top = 240
  end
  object SqlAtualizaItensCompra: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_ITENS_COMPRA ('#13#10'        :CD_COMPRA' +
      'S,'#13#10'        :ID_PRODUTO,'#13#10'        :CD_PRODUTO,'#13#10'        :CD_FILI' +
      'AL,'#13#10'        :CD_FILIAL_DESTINO,'#13#10'        :CODIGO,'#13#10'        :DES' +
      'CRICAO,'#13#10'        :SALDO,'#13#10'        :ESTOQUE_MINIMO,'#13#10'        :EST' +
      'OQUE_MAXIMO,'#13#10'        :MEDIAF,'#13#10'        :CURVA,'#13#10'        :LABORA' +
      'TORIO,'#13#10'        :GRUPO,'#13#10'        :CLASSE,'#13#10'        :CD_SITUACAO_' +
      'TRIB,'#13#10'        :QUANTIDADE,'#13#10'        :VL_UNITARIO,'#13#10'        :PER' +
      'CENTUAL_ICMS,'#13#10'        :REDUCAO_ICMS,'#13#10'        :VL_ICMS,'#13#10'      ' +
      '  :PERCENTUAL_DESCONTO,'#13#10'        :VL_DESCONTO,'#13#10'        :PERCENT' +
      'UAL_IPI,'#13#10'        :VL_IPI,'#13#10'        :VL_TOTAL,'#13#10'        :PERCENT' +
      'UAL_MARGEM,'#13#10'        :CD_ATENDIMENTO,'#13#10'        :NOVO_PRECO,'#13#10'   ' +
      '     :NOVO_CUSTO,'#13#10'        :ATUALIZAR_PRECO,'#13#10'        :PRECO_VEN' +
      'DA,'#13#10'        :QT_EMBALAGEM,'#13#10'        :ULTIMOCUSTO,'#13#10'        :PRE' +
      'CO_REAJUSTADO,'#13#10'        :CODIGO_BARRAS,'#13#10'        :UNIDADE,'#13#10'    ' +
      '    :ICMS,'#13#10'        :BASEICMS,'#13#10'        :BASEICMSSUBSTITUICAO,'#13#10 +
      '        :SITUACAOTRIBITARIA,'#13#10'        :LOTE,'#13#10'        :FABRICACA' +
      'O,'#13#10'        :VALIDADE,'#13#10'        :PRECO_PROMOCAO_ATUAL,'#13#10'        ' +
      ':PRECO_PROMOCAO,'#13#10'        :DESCONTO_OUTROS,'#13#10'        :DIASSEMVEN' +
      'DER,'#13#10'        :ENVIADO,'#13#10'        :CFOP,'#13#10'        :VALORICMSSUBTI' +
      'TUICAO,'#13#10'        :CUSTO_APLICADO,'#13#10'        :MARGEM_VALOR_AGREGAD' +
      'O,'#13#10'        :REDUCAO_ICMS_ST,'#13#10'        :PERCENTUAL_ICMS_ST,'#13#10'   ' +
      '     :PIS_CST,'#13#10'        :PIS_BASE_CALCULO,'#13#10'        :PIS_PERCENT' +
      'UAL,'#13#10'        :PIS_VALOR,'#13#10'        :COFINS_CST,'#13#10'        :COFINS' +
      '_BASE_CALCULO,'#13#10'        :COFINS_PERCENTUAL,'#13#10'        :COFINS_VAL' +
      'OR,'#13#10'        :VALOR_OUTRASDESPESAS,'#13#10'        :VALOR_SEGURO,'#13#10'   ' +
      '     :VALOR_FRETE,'#13#10'        :VALOR_ISENTO,'#13#10'        :VALOR_OUTRA' +
      'S,'#13#10'        :BASECALCULO_IPI,'#13#10'        :CST_IPI,'#13#10'        :NATUR' +
      'EZA_ISENTA_PIS,'#13#10'        :NATUREZA_ISENTA_COFINS, '#13#10'        :CES' +
      'T,'#13#10'        :BASECALCULOFCP,'#13#10'        :ALIQUOTAFCP,'#13#10'        :VA' +
      'LORFCP,'#13#10'        :BASECALCULOFCPST,'#13#10'        :ALIQUOTAFCPST,'#13#10'  ' +
      '      :VALORFCPST,'#13#10'        :BASECALCULOFCPSTRET,'#13#10'        :ALIQ' +
      'UOTAFCPSTRET,'#13#10'        :VALORFCPSTRET,'#13#10'        :BASEICMSSUBSTIT' +
      'UICAORET,'#13#10'        :PERCENTUAL_ICMS_ST_RET,'#13#10'        :VALORICMSS' +
      'UBSTITUICAORET,'#13#10'        :NCM,'#13#10'        :ORIGEM,'#13#10'        :INFOR' +
      'MACOESADICIONAIS,'#13#10'        :MODALIDADEBC,'#13#10'        :MODALIDADEBC' +
      'ST,'#13#10'        :ICMSBCUFDEST,'#13#10'        :ICMSBCFCPUFDEST,'#13#10'        ' +
      ':ICMSPERCENTUALFCPUFDEST,'#13#10'        :ICMSVALORFCPUFDEST,'#13#10'       ' +
      ' :ICMSPERCENTUALINTER,'#13#10'        :ICMSPERCENTUALUFDEST,'#13#10'        ' +
      ':ICMSVALORUFREMET,'#13#10'        :ICMSVALORUFDEST,'#13#10'        :ICMSPERC' +
      'ENTUALINTERPART,'#13#10'        :CODIGOANVISA,'#13#10'        :PMC,'#13#10' :CODIG' +
      'OBENEFICIO,'#13#10' :MOTIVODESONERACAO,'#13#10' :VALORDESONERACAO,'#13#10' :PERCEN' +
      'TUALDESONERACAO)'
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
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL_DESTINO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_MINIMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ESTOQUE_MAXIMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MEDIAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CURVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_SITUACAO_TRIB'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REDUCAO_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL_MARGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NOVO_CUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_ATENDIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NOVO_PRECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ATUALIZAR_PRECO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QT_EMBALAGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ULTIMOCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO_REAJUSTADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UNIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BASEICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BASEICMSSUBSTITUICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SITUACAOTRIBITARIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FABRICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO_PROMOCAO_ATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECO_PROMOCAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DESCONTO_OUTROS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DIASSEMVENDER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CFOP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORICMSSUBTITUICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CUSTO_APLICADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MARGEM_VALOR_AGREGADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REDUCAO_ICMS_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL_ICMS_ST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIS_CST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIS_BASE_CALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIS_PERCENTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIS_VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COFINS_CST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COFINS_BASE_CALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COFINS_PERCENTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COFINS_VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_OUTRASDESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_FRETE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ISENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_OUTRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BASECALCULO_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CST_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATUREZA_ISENTA_PIS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATUREZA_ISENTA_COFINS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BASECALCULOFCP'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ALIQUOTAFCP'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VALORFCP'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BASECALCULOFCPST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ALIQUOTAFCPST'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VALORFCPST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BASECALCULOFCPSTRET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ALIQUOTAFCPSTRET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VALORFCPSTRET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BASEICMSSUBSTITUICAORET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'PERCENTUAL_ICMS_ST_RET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VALORICMSSUBSTITUICAORET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NCM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INFORMACOESADICIONAIS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODALIDADEBC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODALIDADEBCST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSBCUFDEST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSBCFCPUFDEST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSPERCENTUALFCPUFDEST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSVALORFCPUFDEST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSPERCENTUALINTER'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSPERCENTUALUFDEST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSVALORUFREMET'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSVALORUFDEST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ICMSPERCENTUALINTERPART'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGOANVISA'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'PMC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGOBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOTIVODESONERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VALORDESONERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'PERCENTUALDESONERACAO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 240
  end
  object CdsConvenios_Grupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1060
    Top = 488
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
  object SqlConvenios_Grupos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' CONVENIOS_GRUPOS'#13#10'WHERE'#13#10' CD_CONVENIO = :CONV' +
      'ENIO AND'#13#10' CD_GRUPO = :GRUPO'
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
    Left = 1060
    Top = 375
  end
  object DspConvenios_Grupos: TDataSetProvider
    DataSet = SqlConvenios_Grupos
    Left = 1060
    Top = 412
  end
  object QryConveniosGrupos: TClientDataSet
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
    ProviderName = 'DspConvenios_Grupos'
    Left = 1060
    Top = 452
    object QryConveniosGruposCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
      Required = True
    end
    object QryConveniosGruposCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object QryConveniosGruposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object QryConveniosGruposDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
  end
  object CdsComprasBoletos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    Left = 1053
    Top = 200
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
  object SqlAtualizaComprasBoletos: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_COMPRAS_BOLETOS(:CD_COMPRAS, :CD_B' +
      'OLETO, :NUMERO, :VENCIMENTO, :JUROS, :DEDUCOES, :DESPESASFINANCE' +
      'IRAS, :VALOR)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_BOLETO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'JUROS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DEDUCOES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DESPESASFINANCEIRAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1056
    Top = 160
  end
  object CdsContasPagarCompras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    Left = 1181
    Top = 488
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
  object SqlContasPagarCompras: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CONTAS_PAGAR_COMPRAS.*'#13#10'FROM'#13#10' CONTAS_PAGAR_COMPRAS'#13#10'W' +
      'HERE'#13#10' CONTAS_PAGAR_COMPRAS.CD_CONTAS_PAGAR = :CD_CONTAS_PAGAR A' +
      'ND'#13#10'CONTAS_PAGAR_COMPRAS.CD_COMPRAS = :CD_COMPRAS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_PAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1176
    Top = 376
  end
  object DspContasPagarCompras: TDataSetProvider
    DataSet = SqlContasPagarCompras
    Left = 1176
    Top = 416
  end
  object QryContasPagarCompras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_PAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end>
    ProviderName = 'DspContasPagarCompras'
    Left = 1176
    Top = 456
    object QryContasPagarComprasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryContasPagarComprasCD_CONTAS_PAGAR: TFloatField
      FieldName = 'CD_CONTAS_PAGAR'
    end
    object QryContasPagarComprasCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object QryContasPagarComprasDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object QryContasPagarComprasNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 100
    end
    object QryContasPagarComprasVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object SqlAtualizaConveniosPBM: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONVENIOSPBM('#13#10'          :ID_CONVE' +
      'NIOPBM,'#13#10'          :NOME,'#13#10'          :URL,'#13#10'          :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_CONVENIOPBM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'URL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1184
    Top = 64
  end
  object CdsConveniosPBM: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1184
    Top = 104
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
  object SqlAtualizaProdutosConvenioPBM: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOSCONVENIOPBM ('#13#10'    :ID_PRO' +
      'DUTOSCONVENIOPBM,'#13#10'    :ID_CONVENIOPBM,'#13#10'    :ID_PRODUTO,'#13#10'    :' +
      'ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_PRODUTOSCONVENIOPBM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_CONVENIOPBM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1064
    Top = 264
  end
  object CdsProdutosConvenioPBM: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1064
    Top = 304
    object CdsProdutosConvenioPBMID_PRODUTOSCONVENIOPBM: TFloatField
      FieldName = 'ID_PRODUTOSCONVENIOPBM'
      Required = True
    end
    object CdsProdutosConvenioPBMID_CONVENIOPBM: TFloatField
      FieldName = 'ID_CONVENIOPBM'
    end
    object CdsProdutosConvenioPBMID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsProdutosConvenioPBMENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlProdutos: TSQLDataSet
    CommandText = 'SELECT ID_PRODUTO FROM PRODUTOS'#13#10'WHERE STATUS = '#39'A'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 504
    Top = 8
  end
  object DspProdutos: TDataSetProvider
    DataSet = SqlProdutos
    Left = 560
    Top = 8
  end
  object CdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProdutos'
    Left = 624
    Top = 8
    object CdsProdutosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
  end
  object CdsUsuariosGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1208
    Top = 208
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
  object SqlAtualizaUsuariosGrupos: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_USUARIOS_GRUPOS(:CD_USUARIO, :CD_F' +
      'ILIAL, :CD_GRUPO, :TX_DESCONTO_MAXIMO, :ENVIADO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TX_DESCONTO_MAXIMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1208
    Top = 160
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = SqlAtualizaBalancoLoja
    ScopeMappings = <>
    Left = 696
    Top = 352
  end
end
