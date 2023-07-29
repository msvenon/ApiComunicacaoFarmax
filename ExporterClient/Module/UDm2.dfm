object DM2: TDM2
  OldCreateOrder = False
  Height = 771
  Width = 1346
  object DspControlador: TDataSetProvider
    DataSet = FDControlador
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
    Top = 195
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
  object DspMetasFiliais: TDataSetProvider
    DataSet = FDMetasFiliais
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
    Top = 610
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
  object DspMetasVendedores: TDataSetProvider
    DataSet = FDMetasVendedores
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
  object DspNumeroContasReceberLoja: TDataSetProvider
    DataSet = FDSqlNumeroContasReceberLoja
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
    DataSet = FDCdContasReceberLoja
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
  object DspVendedores_Classes: TDataSetProvider
    DataSet = FDVendedores_Classes
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
    object QryVendedoresClassesENVIADO: TStringField
      FieldName = 'ENVIADO'
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
  object DspConvenios_Classes: TDataSetProvider
    DataSet = FDConvenios_Classes
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
  object DspNumeroLancamentosLoja: TDataSetProvider
    DataSet = FDNumeroLancamentosLoja
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
  object DspNumeroCaixaLoja: TDataSetProvider
    DataSet = FDNumeroCaixaLoja
    Left = 132
    Top = 576
  end
  object CdsNumeroCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNumeroCaixaLoja'
    Left = 132
    Top = 610
    object CdsNumeroCaixaLojaCOUNT: TIntegerField
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
    Left = 604
    Top = 496
    object CdsCdLancamentoCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
  end
  object DspCdLancamentoLoja: TDataSetProvider
    DataSet = FDCdLancamentoLoja
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
  object CdsCdCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 244
    Top = 610
    object CdsCdCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object DspCdCaixaLoja: TDataSetProvider
    DataSet = FDCdCaixaLoja
    Left = 244
    Top = 576
  end
  object CdsCdCaixaLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCdCaixaLoja'
    Left = 252
    Top = 610
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
  object DspConexao: TDataSetProvider
    DataSet = FDConexao
    Left = 40
    Top = 576
  end
  object CdsConexao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConexao'
    Left = 40
    Top = 610
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
  object DspComprasDeletadas: TDataSetProvider
    DataSet = FDComprasDeletadas
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
  object DspParametros: TDataSetProvider
    DataSet = FDParame
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
  object DspIdProdutos: TDataSetProvider
    DataSet = FDIdProduto
    Left = 984
    Top = 408
  end
  object CdsIdProdutosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspIdProdutos'
    Left = 984
    Top = 439
    object CdsIdProdutosLojaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
  end
  object DspBalancosFilial: TDataSetProvider
    DataSet = FDBalancosFilial
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
  object DspClientesDeletados: TDataSetProvider
    DataSet = FDClientesDeletados
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
  object DspProjetosPharmalink: TDataSetProvider
    DataSet = FDProjetosPharmalink
    Left = 1096
    Top = 584
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
    Left = 1096
    Top = 616
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
    Left = 1096
    Top = 652
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
  object DspCeProdutos: TDataSetProvider
    DataSet = FDCeProdutos
    Left = 879
    Top = 408
  end
  object CdsCeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCeProdutos'
    Left = 879
    Top = 439
  end
  object DspBalancos: TDataSetProvider
    DataSet = FDBalanco
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
  object DspCaixasDeletados: TDataSetProvider
    DataSet = FDCaixasDeletados
    Left = 1240
    Top = 576
  end
  object CdsCaixasDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCaixasDeletados'
    Left = 1240
    Top = 607
    object StringField2: TStringField
      FieldName = 'CAMPO1'
    end
    object CdsCaixasDeletadosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
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
  object CdsConvenios_Grupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1084
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
  object DspConvenios_Grupos: TDataSetProvider
    DataSet = FDConvenios_Grupos
    Left = 1084
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
    Left = 1084
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
  object CdsContasPagarCompras: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    Left = 1245
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
  object DspContasPagarCompras: TDataSetProvider
    DataSet = FDContasPagarCompras
    Left = 1240
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
    Left = 1240
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
  object DspProdutos: TDataSetProvider
    Left = 552
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
    Left = 1201
    Top = 200
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
  object BindSourceDB1: TBindSourceDB
    ScopeMappings = <>
    Left = 720
    Top = 320
  end
  object FDSqlAtualizaTransportadoras: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_TRANSPORTADORAS('
      '        :CD_TRANSPORTADORA,'
      '        :NOME,'
      '        :RAZAO,'
      '        :CNPJ,'
      '        :INSCRICAO,'
      '        :ENDERECO,'
      '        :NUMERO,'
      '        :COMPLEMENTO,'
      '        :BAIRRO,'
      '        :CIDADE,'
      '        :UF,'
      '        :CEP,'
      '        :CD_MUNICIPIO,'
      '        :FONE,'
      '        :FAX,'
      '        :CAIXA_POSTAL,'
      '        :CONTATO,'
      '        :EMAIL,'
      '        :URL,'
      '        :CD_PAIS,'
      '        :PAIS,'
      '        :DT_ALTERACAO,'
      '        :ENVIADO)')
    Left = 64
    Top = 61
    ParamData = <
      item
        Name = 'CD_TRANSPORTADORA'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'RAZAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 14
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 8
      end
      item
        Name = 'CD_MUNICIPIO'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CAIXA_POSTAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'URL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_PAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'PAIS'
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
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaClientes: TFDQuery
    Connection = DM.FDConn
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
    Left = 184
    Top = 61
    ParamData = <
      item
        Name = 'CD_FILIAL'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_VENDEDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
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
        Size = 100
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 8
      end
      item
        Name = 'CAIXA_POSTAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 14
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
        Size = 100
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
        Size = 7
      end
      item
        Name = 'CD_PAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'ID_PERFIL_CLIENTE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object FDAtualizaLaboratorios: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_TRANSPORTADORAS('
      '        :CD_TRANSPORTADORA,'
      '        :NOME,'
      '        :RAZAO,'
      '        :CNPJ,'
      '        :INSCRICAO,'
      '        :ENDERECO,'
      '        :NUMERO,'
      '        :COMPLEMENTO,'
      '        :BAIRRO,'
      '        :CIDADE,'
      '        :UF,'
      '        :CEP,'
      '        :CD_MUNICIPIO,'
      '        :FONE,'
      '        :FAX,'
      '        :CAIXA_POSTAL,'
      '        :CONTATO,'
      '        :EMAIL,'
      '        :URL,'
      '        :CD_PAIS,'
      '        :PAIS,'
      '        :DT_ALTERACAO,'
      '        :ENVIADO)')
    Left = 296
    Top = 61
    ParamData = <
      item
        Name = 'CD_TRANSPORTADORA'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'RAZAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 14
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 8
      end
      item
        Name = 'CD_MUNICIPIO'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CAIXA_POSTAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'URL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_PAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'PAIS'
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
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDProdutos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT ID_PRODUTO FROM PRODUTOS'
      'WHERE STATUS = '#39'A'#39)
    Left = 424
    Top = 13
  end
  object FDAtualizaCartoes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_CARTOES('
      '        :CD_CARTAO,'
      '        :CD_CONTA,'
      '        :DESCRICAO,'
      '        :TIPO_CARTAO,'
      '        :TX_ADM,'
      '        :TX_ADM_PARC,'
      '        :PRAZO_PG,'
      '        :IMAGEM,'
      '        :USATEF,'
      '        :TRNCENTRE,'
      '        :FIDELIZE,'
      '        :HIPERCARD,'
      '        :REDEVESPAGUE,'
      '        :ENVIADO)')
    Left = 296
    Top = 159
    ParamData = <
      item
        Name = 'CD_CARTAO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_CONTA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'TIPO_CARTAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TX_ADM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TX_ADM_PARC'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PRAZO_PG'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'IMAGEM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USATEF'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'TRNCENTRE'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'FIDELIZE'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'HIPERCARD'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'REDEVESPAGUE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaDistribuidores: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_DISTRIBUIDORES('
      '        :CD_DISTRIBUIDOR,'
      '        :NOME,'
      '        :APELIDO,'
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
      '        :IE,'
      '        :PRACA,'
      '        :DT_FICHA,'
      '        :RG,'
      '        :CPF,'
      '        :EMPRESA,'
      '        :FONE_COMERCIAL,'
      '        :CEP_COMERCIAL,'
      '        :CIDADE_COMERCIAL,'
      '        :UF_COMERCIAL,'
      '        :REFERENCIA_COMERCIAL,'
      '        :REFERENCIA_BANCARIA,'
      '        :DT_CONSULTA_SPC,'
      '        :OBS_SPC,'
      '        :TIPO_ATIVIDADE,'
      '        :VENDEDOR,'
      '        :ENDERECO_COBRANCA,'
      '        :BAIRRO_COBRANCA,'
      '        :CIDADE_COBRANCA,'
      '        :UF_COBRANCA,'
      '        :CEP_COBRANCA,'
      '        :ICM_IPI,'
      '        :LIMITE_CREDITO,'
      '        :EMAIL,'
      '        :HOMEPAGE,'
      '        :CD_PLANO_CONTAS,'
      '        :RAZAO,'
      '        :DT_ALTERACAO,'
      '        :ARQUIVO_ENVIO,'
      '        :ARQUIVO_RETORNO,'
      '        :PROGRAMAENVIO,'
      '        :CODIGODICIONARIO,'
      '        :CODIGOFATURAMENTO,'
      '        :CFOP,'
      '        :CD_MUNICIPIO,'
      '        :CD_PAIS,'
      '        :COMPLEMENTO,'
      '        :NUMERO,'
      '        :SOMAICMSSUBSTITUICAO,'
      '        :SOMAIPI,'
      '        :SOMAFRETE,'
      '        :SOMASEGURO,'
      '        :SOMAOUTRASDESPESAS,'
      '        :USAFTP,'
      '        :FTPHOST,'
      '        :FTPUSUARIO,'
      '        :FTPSENHA,'
      '        :FTPDIRETORIOENVIO,'
      '        :FTPDIRETORIORETORNO,'
      '        :CONCLUINFSEMBOLETO,'
      '        :TAXABOLETO'
      ')')
    Left = 416
    Top = 62
    ParamData = <
      item
        Name = 'CD_DISTRIBUIDOR'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'APELIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 8
      end
      item
        Name = 'CAIXA_POSTAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'IE'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'PRACA'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Name = 'DT_FICHA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'RG'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'FONE_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 31
      end
      item
        Name = 'CEP_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CIDADE_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 36
      end
      item
        Name = 'UF_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'REFERENCIA_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'REFERENCIA_BANCARIA'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'DT_CONSULTA_SPC'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'OBS_SPC'
        DataType = ftString
        ParamType = ptInput
        Size = 41
      end
      item
        Name = 'TIPO_ATIVIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Name = 'VENDEDOR'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'ENDERECO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 41
      end
      item
        Name = 'BAIRRO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 21
      end
      item
        Name = 'CIDADE_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 36
      end
      item
        Name = 'UF_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'CEP_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'ICM_IPI'
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
        Size = 100
      end
      item
        Name = 'HOMEPAGE'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'CD_PLANO_CONTAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'RAZAO'
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
        Name = 'ARQUIVO_ENVIO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Name = 'ARQUIVO_RETORNO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Name = 'PROGRAMAENVIO'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Name = 'CODIGODICIONARIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CODIGOFATURAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CFOP'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_MUNICIPIO'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Name = 'CD_PAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'SOMAICMSSUBSTITUICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'SOMAIPI'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'SOMAFRETE'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'SOMASEGURO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'SOMAOUTRASDESPESAS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'USAFTP'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'FTPHOST'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Name = 'FTPUSUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'FTPSENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'FTPDIRETORIOENVIO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'FTPDIRETORIORETORNO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CONCLUINFSEMBOLETO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TAXABOLETO'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object FDAtualizaVendedores: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_VENDEDORES('
      '          :CD_VENDEDOR,'
      '          :CD_FILIAL,'
      '          :DT_ADMISSAO,'
      '          :DT_NASCIMENTO,'
      '          :TIPO_FUNCIONARIO,'
      '          :CODIGO_BARRAS,'
      '          :NOME,'
      '          :RUA,'
      '          :BAIRRO,'
      '          :CIDADE,'
      '          :UF,'
      '          :CEP,'
      '          :FONE,'
      '          :REFERENCIA,'
      '          :RG,'
      '          :CPF,'
      '          :JORNADA,'
      '          :INTERVALO,'
      '          :REPOUSO,'
      '          :NR_REGISTRO,'
      '          :CTPS,'
      '          :FUNCAO,'
      '          :SALARIO,'
      '          :TX_COMISSAO,'
      '          :COMISSAO,'
      '          :VENDA,'
      '          :ENVIADO,'
      '          :SEXO,'
      '          :ESTADO_CIVIL,'
      '          :NATURALIDADE,'
      '          :CONJUGE,'
      '          :DT_NASC_CONJUGE,'
      '          :NUM_DEPEND,'
      '          :NOMEMAE,'
      '          :NOMEPAI,'
      '          :EMPRESA_ANTERIOR,'
      '          :TEMPO_SERVICO,'
      '          :REFERENCIA_COMERCIAL,'
      '          :REFERENCIA_BANCARIA,'
      '          :DESCONTO,'
      '          :COMISSAO_MEDICAMENTOS,'
      '          :COMISSAO_BONIFICADOS,'
      '          :COMISSAO_PERFUMARIA,'
      '          :COMISSAO_OUTROS,'
      '          :COTA,'
      '          :SENHA,'
      '          :DT_ALTERACAO,'
      '          :STATUS,'
      '          :VENDEOUTRALOJA,'
      '          :USUARIOFARMACIAPOPULAR,'
      '          :SENHAFARMACIAPOPULAR)')
    Left = 536
    Top = 61
    ParamData = <
      item
        Name = 'CD_VENDEDOR'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_ADMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_NASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'TIPO_FUNCIONARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CODIGO_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 13
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'RUA'
        DataType = ftString
        ParamType = ptInput
        Size = 35
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
        Size = 23
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
        Size = 8
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'RG'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'JORNADA'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'INTERVALO'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'REPOUSO'
        DataType = ftString
        ParamType = ptInput
        Size = 13
      end
      item
        Name = 'NR_REGISTRO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CTPS'
        DataType = ftString
        ParamType = ptInput
        Size = 13
      end
      item
        Name = 'FUNCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'SALARIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TX_COMISSAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'SEXO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ESTADO_CIVIL'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'NATURALIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CONJUGE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'DT_NASC_CONJUGE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'NUM_DEPEND'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOMEMAE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'NOMEPAI'
        DataType = ftString
        ParamType = ptInput
        Size = 40
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
        Size = 10
      end
      item
        Name = 'REFERENCIA_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'REFERENCIA_BANCARIA'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'DESCONTO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'COMISSAO_MEDICAMENTOS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'COMISSAO_BONIFICADOS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'COMISSAO_PERFUMARIA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'COMISSAO_OUTROS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'COTA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 13
      end
      item
        Name = 'DT_ALTERACAO'
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
        Name = 'VENDEOUTRALOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'USUARIOFARMACIAPOPULAR'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'SENHAFARMACIAPOPULAR'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end>
  end
  object FDAtualizaClasses: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_CLASSES('
      '        :CD_CLASSE,           '
      '        :DESCRICAO,           '
      '        :TIPO,                '
      '        :VENDEESTOQUENEGATIVO,'
      '        :DT_CALCULOCURVA,     '
      '        :FREQUENCIA,          '
      '        :NPRODUTOS,           '
      '        :NITENS,              '
      '        :VPRODUTOS,           '
      '        :CPRODUTOS,           '
      '        :CONTROLALOTES,       '
      '        :ENVIADO)')
    Left = 664
    Top = 61
    ParamData = <
      item
        Name = 'CD_CLASSE'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'VENDEESTOQUENEGATIVO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DT_CALCULOCURVA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'FREQUENCIA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NPRODUTOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NITENS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VPRODUTOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CPRODUTOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CONTROLALOTES'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaPlanoContas: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_PLANO_CONTAS('
      '        :CD_PLANO_CONTAS,'
      '        :CD_HISTORICO,'
      '        :HISTORICO,'
      '        :GRAU,'
      '        :SISTEMA,'
      '        :TIPO_CONTA,'
      '        :APURACAO,'
      '        :ENVIADO)')
    Left = 800
    Top = 61
    ParamData = <
      item
        Name = 'CD_PLANO_CONTAS'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'GRAU'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'SISTEMA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TIPO_CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'APURACAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaConvenios: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_CONVENIOS('
      '        :CD_CONVENIO,'
      '        :NOME,'
      '        :RAZAO,'
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
      '        :IE,'
      '        :PRACA,'
      '        :DT_FICHA,'
      '        :RG,'
      '        :CPF,'
      '        :EMPRESA,'
      '        :FONE_COMERCIAL,'
      '        :CEP_COMERCIAL,'
      '        :CIDADE_COMERCIAL,'
      '        :UF_COMERCIAL,'
      '        :REFERENCIA_COMERCIAL,'
      '        :REFERENCIA_BANCARIA,'
      '        :DT_CONSULTA_SPC,'
      '        :OBS_SPC,'
      '        :TIPO_ATIVIDADE,'
      '        :CD_VENDEDOR,'
      '        :ENDERECO_COBRANCA,'
      '        :BAIRRO_COBRANCA,'
      '        :CIDADE_COBRANCA,'
      '        :UF_COBRANCA,'
      '        :CEP_COBRANCA,'
      '        :ICM_IPI,'
      '        :LIMITE_CREDITO,'
      '        :EMAIL,'
      '        :HOMEPAGE,'
      '        :MULTI,'
      '        :TX_DESCONTO,'
      '        :DT_VENCIMENTO,'
      '        :DT_FECHAMENTO,'
      '        :SALDO,'
      '        :JAN,'
      '        :FEV,'
      '        :MAR,'
      '        :ABR,'
      '        :MAI,'
      '        :JUN,'
      '        :JUL,'
      '        :AGO,'
      '        :SET_,'
      '        :OUT,'
      '        :NOV,'
      '        :DEZ,'
      '        :DT_ALTERACAO,'
      '        :USUARIOSITE,'
      '        :SENHASITE,'
      '        :PERMITEPARCELAMENTO,'
      '        :PAGACOMISSAO,'
      '        :PAGAAVISTA,'
      '        :STATUS,'
      '        :CD_MUNICIPIO,'
      '        :CD_PAIS,'
      '        :COMPLEMENTO,'
      '        :NUMERO,'
      '        :FATURAFECHADA,'
      '        :EXIBIRDADOSCIENTECOMPROVANTE)')
    Left = 928
    Top = 62
    ParamData = <
      item
        Name = 'CD_CONVENIO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'RAZAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 41
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 21
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 36
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CAIXA_POSTAL'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 31
      end
      item
        Name = 'FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 31
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 31
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 19
      end
      item
        Name = 'IE'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'PRACA'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Name = 'DT_FICHA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'RG'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'FONE_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 31
      end
      item
        Name = 'CEP_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CIDADE_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 36
      end
      item
        Name = 'UF_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'REFERENCIA_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'REFERENCIA_BANCARIA'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'DT_CONSULTA_SPC'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'OBS_SPC'
        DataType = ftString
        ParamType = ptInput
        Size = 41
      end
      item
        Name = 'TIPO_ATIVIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Name = 'CD_VENDEDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ENDERECO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 41
      end
      item
        Name = 'BAIRRO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 21
      end
      item
        Name = 'CIDADE_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 36
      end
      item
        Name = 'UF_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'CEP_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'ICM_IPI'
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
        Size = 46
      end
      item
        Name = 'HOMEPAGE'
        DataType = ftString
        ParamType = ptInput
        Size = 51
      end
      item
        Name = 'MULTI'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TX_DESCONTO'
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
        Name = 'DT_FECHAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'JAN'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'FEV'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'MAR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ABR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'MAI'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'JUN'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'JUL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'AGO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'SET_'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'OUT'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOV'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DEZ'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'USUARIOSITE'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'SENHASITE'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'PERMITEPARCELAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'PAGACOMISSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'PAGAAVISTA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
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
        Name = 'COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'FATURAFECHADA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'EXIBIRDADOSCIENTECOMPROVANTE'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDQuery1: TFDQuery
    Connection = DM.FDConn
    Left = 1000
    Top = 29
  end
  object FDAtualizaConveniosPBM: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_CONVENIOSPBM('
      '          :ID_CONVENIOPBM,'
      '          :NOME,'
      '          :URL,'
      '          :ENVIADO)')
    Left = 1184
    Top = 62
    ParamData = <
      item
        Name = 'ID_CONVENIOPBM'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'URL'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end>
  end
  object FDSqlAtualizaFiliais: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_FILIAIS('
      '        :CD_FILIAL,'
      '        :NOME,'
      '        :RAZAO,'
      '        :CNPJ,'
      '        :INSCRICAO,'
      '        :RUA,'
      '        :NUMERO,'
      '        :COMPLEMENTO,'
      '        :BAIRRO,'
      '        :CIDADE,'
      '        :UF,'
      '        :CEP,'
      '        :FONE,'
      '        :FONE_1,'
      '        :FAX,'
      '        :CONTATO,'
      '        :CD_DISTRIBUIDOR,'
      '        :CD_CLIENTE,'
      '        :ENDERECOWEB,'
      '        :EXPORTAR,'
      '        :METROSQUADRADOS,'
      '        :NUMEROFUNCIONARIOS,'
      '        :NUMEROPDVS,'
      '        :STATUS,'
      '        :CD_MUNICIPIO,'
      '        :IFOOD_CLIENT_ID,'
      '        :IFOOD_CLIENT_SECRET,'
      '        :IFOOD_ID_LOJA,'
      '        :IFOOD_PRECO_PRATICADO,'
      '        :IFOOD_QNTD_ENVIO,'
      '        :IFOOD_VENDEDOR,'
      '        :FARMACIASAPP_CLIENT_ID,'
      '        :FARMACIASAPP_CLIENT_SECRET,'
      '        :FARMACIASAPP_ID_LOJA,'
      '        :FARMACIASAPP_PRECO_PRATICADO,'
      '        :FARMACIASAPP_QNTD_ENVIO,'
      '        :FARMACIASAPP_VENDEDOR'
      ')')
    Left = 184
    Top = 157
    ParamData = <
      item
        Name = 'CD_FILIAL'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'RAZAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Name = 'INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 13
      end
      item
        Name = 'RUA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
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
        Size = 255
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
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
        Size = 8
      end
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'FONE_1'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CD_DISTRIBUIDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ENDERECOWEB'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'EXPORTAR'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'METROSQUADRADOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NUMEROFUNCIONARIOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NUMEROPDVS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CD_MUNICIPIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'IFOOD_CLIENT_ID'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Name = 'IFOOD_CLIENT_SECRET'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Name = 'IFOOD_ID_LOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Name = 'IFOOD_PRECO_PRATICADO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'IFOOD_QNTD_ENVIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IFOOD_VENDEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'FARMACIASAPP_CLIENT_ID'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Name = 'FARMACIASAPP_CLIENT_SECRET'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Name = 'FARMACIASAPP_ID_LOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Name = 'FARMACIASAPP_PRECO_PRATICADO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'FARMACIASAPP_QNTD_ENVIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'FARMACIASAPP_VENDEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDSqlAtualizaFamilias: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_FAMILIAS('
      '        :ID_FAMILIA,'
      '        :DESCRICAO,'
      '        :STATUS,'
      '        :DT_ALTERACAO,'
      '        :ALTERAPRECOFAMILIA,'
      '        :ENVIADO)')
    Left = 64
    Top = 157
    ParamData = <
      item
        Name = 'ID_FAMILIA'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'ALTERAPRECOFAMILIA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end>
  end
  object FDNumeroLancamentosLoja: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' COUNT(*)'
      'FROM'
      ' LANCAMENTOS'
      'WHERE'
      ' DATA_LANCAMENTO = CURRENT_DATE AND'
      ' (TIPO_VENDA = '#39'V'#39' OR TIPO_VENDA = '#39'D'#39') AND '
      ' ENVIADO = '#39'2'#39)
    Left = 504
    Top = 381
  end
  object FDCdContasReceberLoja: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_CONTAS_RECEBER'
      'FROM'
      ' CONTAS_RECEBER'
      'WHERE'
      ' DT_LANCAMENTO = CURRENT_DATE')
    Left = 416
    Top = 381
  end
  object FDAtualizaGrupos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOS('
      '        :CD_GRUPO,'
      '        :DESCRICAO,'
      '        :TX_MARCACAO,'
      '        :DESCONTO,'
      '        :TX_DESCONTO,'
      '        :TX_DESCONTO_MAXIMO,'
      '        :TX_COMISSAO,'
      '        :DIAS_EST_MIN,'
      '        :TIPO,'
      '        :DT_ALTERACAO,'
      '        :NPRODUTOS,'
      '        :NITENS,'
      '        :VPRODUTOS,'
      '        :CPRODUTOS,'
      '        :EXIGERECEITA,'
      '        :VENDEESTOQUENEGATIVO,'
      '        :PEDECRM,'
      '        :META,'
      '        :ENVIADO)')
    Left = 416
    Top = 156
    ParamData = <
      item
        Name = 'CD_GRUPO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'TX_MARCACAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DESCONTO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TX_DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TX_DESCONTO_MAXIMO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TX_COMISSAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DIAS_EST_MIN'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'NPRODUTOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NITENS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VPRODUTOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CPRODUTOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'EXIGERECEITA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'VENDEESTOQUENEGATIVO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'PEDECRM'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'META'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDConvenios_Classes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' CONVENIOS_CLASSES'
      'WHERE'
      ' CD_CONVENIO = :CONVENIO AND'
      ' CD_CLASSE = :CLASSE')
    Left = 216
    Top = 389
    ParamData = <
      item
        Position = 1
        Name = 'VENDEDOR'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'CLASSE'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object FDVendedores_Classes: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' VENDEDORES_CLASSES'
      'WHERE'
      ' CD_VENDEDOR = :VENDEDOR AND'
      ' CD_CLASSE = :CLASSE')
    Left = 136
    Top = 389
    ParamData = <
      item
        Position = 1
        Name = 'VENDEDOR'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'CLASSE'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object FDAtualizaBalancoLoja: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_BALANCO_LOJA('
      '          :ID_BALANCO,'
      '          :ID_MOTIVO,'
      '          :DATA,'
      '          :HORA,'
      '          :DATA_ABERTURA,'
      '          :HORA_ABERTURA,'
      '          :DATA_CONTAGEM,'
      '          :HORA_CONTAGEM,'
      '          :DATA_CONCLUSAO,'
      '          :HORA_CONCLUSAO,'
      '          :CD_FILIAL,'
      '          :ID_PRODUTO,'
      '          :CD_PRODUTO,'
      '          :CODIGO_BARRAS_1,'
      '          :CODIGO_BARRAS_2,'
      '          :DESCRICAO,'
      '          :CD_GRUPO,'
      '          :GRUPO,'
      '          :CD_LABORATORIO,'
      '          :LABORATORIO,'
      '          :CD_CLASSE,'
      '          :CLASSE,'
      '          :CUSTO_UNITARIO,'
      '          :PRECO_VENDA,'
      '          :PRECO_VENDA_ANTERIOR,'
      '          :ESTOQUE,'
      '          :ESTOQUE_ANTERIOR,'
      '          :SUBSTITUIESTOQUE,'
      '          :STATUS,'
      '          :ENVIADO,'
      '          :CD_SUBGRUPO,'
      '          :USUARIO_ABERTURA,'
      '          :USUARIO_CONCLUSAO)')
    Left = 536
    Top = 157
    ParamData = <
      item
        Name = 'ID_BALANCO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_MOTIVO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Name = 'DATA_ABERTURA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'HORA_ABERTURA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Name = 'DATA_CONTAGEM'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'HORA_CONTAGEM'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Name = 'DATA_CONCLUSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'HORA_CONCLUSAO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
        Value = Null
      end
      item
        Name = 'CODIGO_BARRAS_1'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Name = 'CODIGO_BARRAS_2'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_GRUPO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'GRUPO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_LABORATORIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'LABORATORIO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_CLASSE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CLASSE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CUSTO_UNITARIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PRECO_VENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PRECO_VENDA_ANTERIOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ESTOQUE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ESTOQUE_ANTERIOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'SUBSTITUIESTOQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CD_SUBGRUPO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USUARIO_ABERTURA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'USUARIO_CONCLUSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object FDAtualizaCompras: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_COMPRAS_LOJA ('
      '        :CD_COMPRAS,'
      '        :CD_FILIAL,'
      '        :CD_DISTRIBUIDOR,'
      '        :CD_PLANO_CONTAS,'
      '        :CD_OBSERVACAO,'
      '        :CD_TRANSPORTADORA,'
      '        :DT_PEDIDO,'
      '        :NOTA_FISCAL,'
      '        :SERIE_NOTA_FISCAL,'
      '        :DT_EMISSAO,'
      '        :BOLETO,'
      '        :DT_BOLETO,'
      '        :CD_CFOP,'
      '        :DT_ENTRADA,'
      '        :VL_IPI,'
      '        :VL_ICM,'
      '        :TOTAL_NOTA,'
      '        :ICM_BASE_CALCULO,'
      '        :ICM_ISENTO,'
      '        :ICM_OUTROS,'
      '        :ICM_BASESUBST,'
      '        :ICM_VALORSUBST,'
      '        :VL_TOTALPRODUTOS,'
      '        :VL_SEGURO,'
      '        :OUTRAS_DESPESAS,'
      '        :VL_FRETE,'
      '        :IPI_BASE_CALCULO,'
      '        :IPI_ISENTO,'
      '        :IPI_OUTROS,'
      '        :D_ICMV,'
      '        :D_IPIV,'
      '        :D_TOTNT,'
      '        :UNIDADES,'
      '        :NUMERO_ITENS,'
      '        :FATURAMENTO,'
      '        :MOTIVO,'
      '        :ENVIADO,'
      '        :STATUS,'
      '        :VL_DESCONTO_NOTA,'
      '        :CD_USUARIO_CRIACAO,'
      '        :USUARIO_DIGITACAO,'
      '        :CD_USUARIO_DIGITACAO,'
      '        :USUARIO_CRIACAO,'
      '        :CD_USUARIO_CONCLUSAO,'
      '        :USUARIO_CONCLUSAO,'
      '        :CD_USUARIO_ENVIO,'
      '        :USUARIO_ENVIO,'
      '        :VINCULADO,'
      '        :CD_COMPRAS_VINCULADO,'
      '        :TEMVINCULADO,'
      '        :STATUSCONFERENCIA,'
      '        :CD_USUARIO_CONFERENCIA,'
      '        :USUARIO_CONFERENCIA,'
      '        :CONFIGGERACAO,'
      '        :LOCALGERACAO,'
      '        :MODELONF,'
      '        :VL_ISENTOICMS,'
      '        :ICMS_RETIDO,'
      '        :PHARMALINK,'
      '        :BONIFICACAO,'
      '        :CHAVENFE,'
      '        :VL_PIS,'
      '        :VL_COFINS,'
      '        :INFCPL,'
      '        :TRANSFERENCIA,'
      '        :CONSIGNACAO,'
      '        :VL_FCP,'
      '        :VL_FCPST,'
      '        :VL_FCPSTRET,'
      '        :VL_II,'
      '        :ICM_BASESUBSTRET,'
      '        :ICM_VALORSUBSTRET,'
      '        :ICMSDESONERACAO)')
    Left = 176
    Top = 245
    ParamData = <
      item
        Name = 'CD_COMPRAS'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_DISTRIBUIDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_PLANO_CONTAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_OBSERVACAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_TRANSPORTADORA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_PEDIDO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'SERIE_NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'DT_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'BOLETO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DT_BOLETO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CD_CFOP'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VL_IPI'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_ICM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TOTAL_NOTA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ICM_BASE_CALCULO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ICM_ISENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ICM_OUTROS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ICM_BASESUBST'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ICM_VALORSUBST'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_TOTALPRODUTOS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_SEGURO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'OUTRAS_DESPESAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'IPI_BASE_CALCULO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'IPI_ISENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'IPI_OUTROS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'D_ICMV'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'D_IPIV'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'D_TOTNT'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'UNIDADES'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NUMERO_ITENS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'FATURAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'MOTIVO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'VL_DESCONTO_NOTA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_USUARIO_CRIACAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USUARIO_DIGITACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CD_USUARIO_DIGITACAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USUARIO_CRIACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CD_USUARIO_CONCLUSAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USUARIO_CONCLUSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CD_USUARIO_ENVIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USUARIO_ENVIO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'VINCULADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CD_COMPRAS_VINCULADO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TEMVINCULADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'STATUSCONFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CD_USUARIO_CONFERENCIA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USUARIO_CONFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CONFIGGERACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Name = 'LOCALGERACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'MODELONF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'VL_ISENTOICMS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ICMS_RETIDO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PHARMALINK'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'BONIFICACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CHAVENFE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'VL_PIS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_COFINS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'INFCPL'
        DataType = ftString
        ParamType = ptInput
        Size = 10000
      end
      item
        Name = 'TRANSFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CONSIGNACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'VL_FCP'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'VL_FCPST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'VL_FCPSTRET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'VL_II'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICM_BASESUBSTRET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICM_VALORSUBSTRET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSDESONERACAO'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object FDClientesDeletados: TFDQuery
    Connection = DM.FDConn
    Left = 736
    Top = 541
  end
  object FDCeProdutos: TFDQuery
    Connection = DM.FDConn
    Left = 880
    Top = 373
  end
  object FDParame: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_FILIAL,'
      ' PRECIFICACAO_UNICA,'
      ' TIPO_LOJA'
      'FROM'
      ' PARAMETROS')
    Left = 784
    Top = 373
  end
  object FDControlador: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' COUNT(ID_PRODUTO) AS N_ITENS,'
      ' SUM(ESTOQUE_0) AS N_UNIDADES,'
      ' SUM(CUSTO_UNITARIO) AS T_CUSTO,'
      ' SUM(PRECO_VENDA) AS T_VENDA'
      'FROM'
      ' PRODUTOS')
    Left = 704
    Top = 381
  end
  object FDCdLancamentoLoja: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_LANCAMENTO'
      'FROM'
      ' LANCAMENTOS'
      'WHERE'
      ' DATA_LANCAMENTO = CURRENT_DATE AND'
      ' (TIPO_VENDA = '#39'V'#39' OR TIPO_VENDA = '#39'D'#39')')
    Left = 600
    Top = 381
  end
  object FDAtualizaUsuariosGrupos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_ATUALIZA_USUARIOS_GRUPOS(:CD_USUARIO, :CD_F' +
        'ILIAL, :CD_GRUPO, :TX_DESCONTO_MAXIMO, :ENVIADO)')
    Left = 1198
    Top = 157
    ParamData = <
      item
        Name = 'CD_USUARIO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_GRUPO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TX_DESCONTO_MAXIMO'
        DataType = ftFloat
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDSqlNumeroContasReceberLoja: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' COUNT(*)'
      'FROM'
      ' CONTAS_RECEBER'
      'WHERE'
      ' DT_LANCAMENTO = CURRENT_DATE AND '
      ' ENVIADO = '#39'2'#39)
    Left = 312
    Top = 381
  end
  object FDMetasVendedores: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' METAS_VENDEDORES'
      'WHERE'
      ' METAS_VENDEDORES.ID_META = :ID_META  AND'
      ''
      ' METAS_VENDEDORES.CD_VENDEDOR = :CD_VENDEDOR')
    Left = 48
    Top = 389
    ParamData = <
      item
        Position = 1
        Name = 'ID_META'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'CD_VENDEDOR'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object FDAtualizaProdutosConvenioPBM: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOSCONVENIOPBM ('
      '    :ID_PRODUTOSCONVENIOPBM,'
      '    :ID_CONVENIOPBM,'
      '    :ID_PRODUTO,'
      '    :ENVIADO)')
    Left = 1063
    Top = 254
    ParamData = <
      item
        Name = 'ID_PRODUTOSCONVENIOPBM'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CONVENIOPBM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaSubGrupos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_SUBGRUPOS('
      '        :CD_SUBGRUPO,'
      '        :CD_GRUPO,'
      '        :DESCRICAO,'
      '        :DT_ALTERACAO,'
      '        :ENVIADO)')
    Left = 928
    Top = 253
    ParamData = <
      item
        Name = 'CD_SUBGRUPO'
        DataType = ftInteger
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
        Name = 'DESCRICAO'
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
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaContasReceber: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_CONTAS_RECEBER_LOJA ('
      '        :CD_CONTAS_RECEBER,'
      '        :CD_CLIENTE,'
      '        :CD_PLANO_CONTAS,'
      '        :CD_FILIAL,'
      '        :CD_CONVENIO,'
      '        :CD_VENDEDOR,'
      '        :CD_VENDA,'
      '        :CD_FORMA_PAGAMENTO,'
      '        :CD_CONTA,'
      '        :CD_CARTAO,'
      '        :CD_BORDERO,'
      '        :DT_LANCAMENTO,'
      '        :DT_VENCIMENTO,'
      '        :NOTA_FISCAL,'
      '        :SERIE_NOTA,'
      '        :DOCUMENTO,'
      '        :DT_NOTA_FISCAL,'
      '        :VENCTO,'
      '        :VALOR,'
      '        :HISTORICO,'
      '        :CD_CHEQUE_RECEBIDO,'
      '        :NR_CHEQUE,'
      '        :NR_BANCO,'
      '        :DT_PAGAMENTO,'
      '        :VL_PAGAMENTO,'
      '        :VL_JUROS,'
      '        :VL_DESCONTO,'
      '        :VL_SALDO,'
      '        :NOSSO_NUMERO,'
      '        :BANCO,'
      '        :AGENCIA,'
      '        :CONTA,'
      '        :HISTORICO_BANCO,'
      '        :STATUS,'
      '        :GERABOLETO,'
      '        :BOLETOGERADO,'
      '        :DT_ALTERACAO,'
      '        :TEFTRANSACAO,'
      '        :TEFLOTE,'
      '        :TEFAUTORIZACAO,'
      '        :TEFDATA,'
      '        :TEFHORA,'
      '        :TEFNOMEREDE,'
      '        :TEFVALOR,'
      '        :ENVIADO,'
      '        :TRNTRANSACAO,'
      '        :TRNLOTE,'
      '        :TRNAUTORIZACAO,'
      '        :TRN,'
      '        :CD_FILIAL_PAGAMENTO,'
      '        :PARCELA,'
      '        :CD_CAIXA,'
      '        :CD_FILIAL_ORIGEM)')
    Left = 416
    Top = 249
    ParamData = <
      item
        Name = 'CD_CONTAS_RECEBER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_PLANO_CONTAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CONVENIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_VENDEDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_VENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_FORMA_PAGAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CONTA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CARTAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_BORDERO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_LANCAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'SERIE_NOTA'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'DT_NOTA_FISCAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VENCTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'CD_CHEQUE_RECEBIDO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NR_CHEQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'NR_BANCO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'DT_PAGAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VL_PAGAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_JUROS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_SALDO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOSSO_NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'BANCO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'AGENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'HISTORICO_BANCO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'GERABOLETO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'BOLETOGERADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'TEFTRANSACAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TEFLOTE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TEFAUTORIZACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'TEFDATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'TEFHORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Name = 'TEFNOMEREDE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'TEFVALOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TRNTRANSACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Name = 'TRNLOTE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'TRNAUTORIZACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'TRN'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CD_FILIAL_PAGAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PARCELA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CD_CAIXA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_FILIAL_ORIGEM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object FDAtualizaItensCompraLote: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_LOTESITENSCOMPRA ('
      '    :CD_COMPRAS,'
      '    :CD_FILIAL,'
      '    :CD_DISTRIBUIDOR,'
      '    :NOTA_FISCAL,'
      '    :ID_PRODUTO,'
      '    :LOTE,'
      '    :QUANTIDADE,'
      '    :FABRICACAO,'
      '    :VALIDADE)')
    Left = 800
    Top = 253
    ParamData = <
      item
        Name = 'CD_COMPRAS'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_DISTRIBUIDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'LOTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'FABRICACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VALIDADE'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object FDAtualizaGruposCurva: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOSCURVA('
      '          :CD_FILIAL,'
      '          :CD_GRUPO,'
      '          :GRUPO,'
      '          :CD_CURVA,'
      '          :CURVA,'
      '          :SIGLA,'
      '          :DIASESTOQUE,'
      '          :ESEG,'
      '          :P1,'
      '          :P2,'
      '          :P1SAZ,'
      '          :P2SAZ,'
      '          :DT_ALTERACAO)')
    Left = 664
    Top = 249
    ParamData = <
      item
        Name = 'CD_FILIAL'
        DataType = ftInteger
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
        Name = 'GRUPO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_CURVA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CURVA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DIASESTOQUE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ESEG'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'P1'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'P2'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'P1SAZ'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'P2SAZ'
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
  object FDAtualizaContasPagar: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_CONTAS_PAGAR('
      #9'  :CD_CONTAS_PAGAR,'
      '          :CD_FILIAL,'
      '          :CD_DISTRIBUIDOR,'
      '          :CD_COMPRAS,'
      '          :CD_CONTA,'
      '          :CD_FORMA_PAGAMENTO,'
      '          :CD_PLANO_CONTAS,'
      '          :NUMERO_NOTA,'
      '          :SERIAL_NOTA,'
      '          :DOCUMENTO,'
      '          :DT_NOTA,'
      '          :DT_VENCIMENTO,'
      '          :VALOR,'
      '          :DT_LANCAMENTO,'
      '          :DT_PAGAMENTO,'
      '          :DT_BOLETO,'
      '          :DT_ENTRADA,'
      '          :VL_PAGAMENTO,'
      '          :VL_JUROS,'
      '          :VL_DESCONTO,'
      '          :VL_SALDO,'
      '          :NOSSO_NUMERO,'
      '          :BANCO,'
      '          :AGENCIA,'
      '          :CONTA,'
      '          :HISTORICO,'
      '          :NR_CHEQUE,'
      '          :STATUS,'
      '          :ENVIADO,'
      '          :DESPESAFINANCEIRA)')
    Left = 541
    Top = 249
    ParamData = <
      item
        Name = 'CD_CONTAS_PAGAR'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_DISTRIBUIDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_COMPRAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CONTA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_FORMA_PAGAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_PLANO_CONTAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NUMERO_NOTA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'SERIAL_NOTA'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'DT_NOTA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DT_LANCAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_PAGAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_BOLETO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VL_PAGAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_JUROS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_SALDO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOSSO_NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'BANCO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'AGENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Name = 'CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'NR_CHEQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DESPESAFINANCEIRA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object FDAtualizaItensCompra: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_ITENS_COMPRA ('
      '        :CD_COMPRAS,'
      '        :ID_PRODUTO,'
      '        :CD_PRODUTO,'
      '        :CD_FILIAL,'
      '        :CD_FILIAL_DESTINO,'
      '        :CODIGO,'
      '        :DESCRICAO,'
      '        :SALDO,'
      '        :ESTOQUE_MINIMO,'
      '        :ESTOQUE_MAXIMO,'
      '        :MEDIAF,'
      '        :CURVA,'
      '        :LABORATORIO,'
      '        :GRUPO,'
      '        :CLASSE,'
      '        :CD_SITUACAO_TRIB,'
      '        :QUANTIDADE,'
      '        :VL_UNITARIO,'
      '        :PERCENTUAL_ICMS,'
      '        :REDUCAO_ICMS,'
      '        :VL_ICMS,'
      '        :PERCENTUAL_DESCONTO,'
      '        :VL_DESCONTO,'
      '        :PERCENTUAL_IPI,'
      '        :VL_IPI,'
      '        :VL_TOTAL,'
      '        :PERCENTUAL_MARGEM,'
      '        :CD_ATENDIMENTO,'
      '        :NOVO_PRECO,'
      '        :NOVO_CUSTO,'
      '        :ATUALIZAR_PRECO,'
      '        :PRECO_VENDA,'
      '        :QT_EMBALAGEM,'
      '        :ULTIMOCUSTO,'
      '        :PRECO_REAJUSTADO,'
      '        :CODIGO_BARRAS,'
      '        :UNIDADE,'
      '        :ICMS,'
      '        :BASEICMS,'
      '        :BASEICMSSUBSTITUICAO,'
      '        :SITUACAOTRIBITARIA,'
      '        :LOTE,'
      '        :FABRICACAO,'
      '        :VALIDADE,'
      '        :PRECO_PROMOCAO_ATUAL,'
      '        :PRECO_PROMOCAO,'
      '        :DESCONTO_OUTROS,'
      '        :DIASSEMVENDER,'
      '        :ENVIADO,'
      '        :CFOP,'
      '        :VALORICMSSUBTITUICAO,'
      '        :CUSTO_APLICADO,'
      '        :MARGEM_VALOR_AGREGADO,'
      '        :REDUCAO_ICMS_ST,'
      '        :PERCENTUAL_ICMS_ST,'
      '        :PIS_CST,'
      '        :PIS_BASE_CALCULO,'
      '        :PIS_PERCENTUAL,'
      '        :PIS_VALOR,'
      '        :COFINS_CST,'
      '        :COFINS_BASE_CALCULO,'
      '        :COFINS_PERCENTUAL,'
      '        :COFINS_VALOR,'
      '        :VALOR_OUTRASDESPESAS,'
      '        :VALOR_SEGURO,'
      '        :VALOR_FRETE,'
      '        :VALOR_ISENTO,'
      '        :VALOR_OUTRAS,'
      '        :BASECALCULO_IPI,'
      '        :CST_IPI,'
      '        :NATUREZA_ISENTA_PIS,'
      '        :NATUREZA_ISENTA_COFINS, '
      '        :CEST,'
      '        :BASECALCULOFCP,'
      '        :ALIQUOTAFCP,'
      '        :VALORFCP,'
      '        :BASECALCULOFCPST,'
      '        :ALIQUOTAFCPST,'
      '        :VALORFCPST,'
      '        :BASECALCULOFCPSTRET,'
      '        :ALIQUOTAFCPSTRET,'
      '        :VALORFCPSTRET,'
      '        :BASEICMSSUBSTITUICAORET,'
      '        :PERCENTUAL_ICMS_ST_RET,'
      '        :VALORICMSSUBSTITUICAORET,'
      '        :NCM,'
      '        :ORIGEM,'
      '        :INFORMACOESADICIONAIS,'
      '        :MODALIDADEBC,'
      '        :MODALIDADEBCST,'
      '        :ICMSBCUFDEST,'
      '        :ICMSBCFCPUFDEST,'
      '        :ICMSPERCENTUALFCPUFDEST,'
      '        :ICMSVALORFCPUFDEST,'
      '        :ICMSPERCENTUALINTER,'
      '        :ICMSPERCENTUALUFDEST,'
      '        :ICMSVALORUFREMET,'
      '        :ICMSVALORUFDEST,'
      '        :ICMSPERCENTUALINTERPART,'
      '        :CODIGOANVISA,'
      '        :PMC,'
      ' :CODIGOBENEFICIO,'
      ' :MOTIVODESONERACAO,'
      ' :VALORDESONERACAO,'
      ' :PERCENTUALDESONERACAO)')
    Left = 296
    Top = 251
    ParamData = <
      item
        Name = 'CD_COMPRAS'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_FILIAL_DESTINO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CODIGO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ESTOQUE_MINIMO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ESTOQUE_MAXIMO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'MEDIAF'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CURVA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'LABORATORIO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'GRUPO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'CLASSE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Name = 'CD_SITUACAO_TRIB'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_UNITARIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PERCENTUAL_ICMS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'REDUCAO_ICMS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_ICMS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PERCENTUAL_DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PERCENTUAL_IPI'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_IPI'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VL_TOTAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PERCENTUAL_MARGEM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_ATENDIMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'NOVO_PRECO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOVO_CUSTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ATUALIZAR_PRECO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'PRECO_VENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'QT_EMBALAGEM'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ULTIMOCUSTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PRECO_REAJUSTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CODIGO_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'ICMS'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'BASEICMS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'BASEICMSSUBSTITUICAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'SITUACAOTRIBITARIA'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'LOTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'FABRICACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VALIDADE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'PRECO_PROMOCAO_ATUAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PRECO_PROMOCAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DESCONTO_OUTROS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DIASSEMVENDER'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'VALORICMSSUBTITUICAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CUSTO_APLICADO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'MARGEM_VALOR_AGREGADO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'REDUCAO_ICMS_ST'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PERCENTUAL_ICMS_ST'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PIS_CST'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'PIS_BASE_CALCULO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PIS_PERCENTUAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PIS_VALOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'COFINS_CST'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'COFINS_BASE_CALCULO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'COFINS_PERCENTUAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'COFINS_VALOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VALOR_OUTRASDESPESAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VALOR_SEGURO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VALOR_FRETE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VALOR_ISENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VALOR_OUTRAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'BASECALCULO_IPI'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CST_IPI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NATUREZA_ISENTA_PIS'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'NATUREZA_ISENTA_COFINS'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CEST'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'BASECALCULOFCP'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ALIQUOTAFCP'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'VALORFCP'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'BASECALCULOFCPST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ALIQUOTAFCPST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'VALORFCPST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'BASECALCULOFCPSTRET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ALIQUOTAFCPSTRET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'VALORFCPSTRET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'BASEICMSSUBSTITUICAORET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'PERCENTUAL_ICMS_ST_RET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'VALORICMSSUBSTITUICAORET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'ORIGEM'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'INFORMACOESADICIONAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Name = 'MODALIDADEBC'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'MODALIDADEBCST'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ICMSBCUFDEST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSBCFCPUFDEST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSPERCENTUALFCPUFDEST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSVALORFCPUFDEST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSPERCENTUALINTER'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSPERCENTUALUFDEST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSVALORUFREMET'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSVALORUFDEST'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'ICMSPERCENTUALINTERPART'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'CODIGOANVISA'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'PMC'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'CODIGOBENEFICIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'MOTIVODESONERACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'VALORDESONERACAO'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Name = 'PERCENTUALDESONERACAO'
        DataType = ftFMTBcd
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object FDAtualizaLancamentosAPrazo: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      
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
        'AL)')
    Left = 64
    Top = 243
    ParamData = <
      item
        Name = 'CD_LANCAMENTO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_FILIAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CD_LABORATORIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_GRUPO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CLASSE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CONVENIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_VENDEDOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_OPERADOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_USUARIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_FORMA_PAGAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CD_VENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'ID_OPERADORCAIXA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CUSTO_MEDIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'CUSTO_UNITARIO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DATA_LANCAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA_CAIXA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PROMOCAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TIPO_VENDA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'TIPO_PAGAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'ENTRADA_SAIDA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'ETIQUETA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Name = 'ESTOQUE_POSVENDA'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TROCA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'NUMERO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TERMINAL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Name = 'ARREDONDAMENTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TRN'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'TRANSACAOTRN'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'LOTETRN'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'AUTORIZACAOTRN'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'SUBSIDIOTRN'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NOTAMANUAL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object FDAtualizaFiliaisGrupos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_FILIAISGRUPOS('
      '          :CD_GRUPO,'
      '          :TX_COMISSAO,'
      '          :DESCONTO,'
      '          :TX_DESCONTO,'
      '          :TX_DESCONTO_MAXIMO)')
    Left = 1056
    Top = 67
    ParamData = <
      item
        Name = 'CD_GRUPO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TX_COMISSAO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'DESCONTO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TX_DESCONTO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'TX_DESCONTO_MAXIMO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object FDAtualizaComprasBoletos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_ATUALIZA_COMPRAS_BOLETOS(:CD_COMPRAS, :CD_B' +
        'OLETO, :NUMERO, :VENCIMENTO, :JUROS, :DEDUCOES, :DESPESASFINANCE' +
        'IRAS, :VALOR)')
    Left = 1048
    Top = 155
    ParamData = <
      item
        Name = 'CD_COMPRAS'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_BOLETO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'JUROS'
        DataType = ftFloat
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DEDUCOES'
        DataType = ftFloat
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESPESASFINANCEIRAS'
        DataType = ftFloat
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        Precision = 18
        NumericScale = 2
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDAtualizaDeletados: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_DELETADOS(:TABELA, :CAMPO, :VALOR)')
    Left = 926
    Top = 157
    ParamData = <
      item
        Name = 'TABELA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'VALOR'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object FDAtualizaGruposCompras: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOSCOMPRAS('
      ':CD_GRUPOCOMPRA,'
      ':DESCRICAO,'
      ':STATUS,'
      ':DT_ALTERACAO,'
      ':ENVIADO)')
    Left = 798
    Top = 157
    ParamData = <
      item
        Name = 'CD_GRUPOCOMPRA'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object FDAtualizaGruposBalanco: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ATUALIZA_GRUPOSBALANCO('
      '        :CD_GRUPOBALANCO,'
      '        :DESCRICAO,'
      '        :STATUS,'
      '        :DT_ALTERACAO,'
      '        :ENVIADO)')
    Left = 661
    Top = 157
    ParamData = <
      item
        Name = 'CD_GRUPOBALANCO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'ENVIADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end>
  end
  object FDComprasDeletadas: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' CAMPO1'
      'FROM'
      ' DELETADOS'
      'WHERE'
      ' TABELA = '#39'COMPRAS'#39)
    Left = 512
    Top = 533
  end
  object FDBalanco: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' BALANCO'
      'WHERE'
      ' ID_BALANCO = :ID_BALANCO')
    Left = 408
    Top = 541
    ParamData = <
      item
        Name = 'ID_BALANCO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDMetasFiliais: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM'
      ' METAS_FILIAIS'
      'WHERE'
      ' METAS_FILIAIS.ID_META = :ID_META')
    Left = 328
    Top = 541
    ParamData = <
      item
        Name = 'ID_META'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDCdCaixaLoja: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CD_CAIXA'
      'FROM'
      ' CAIXA'
      'WHERE'
      ' DATA = CURRENT_DATE AND'
      ' TIPO_VENDA = '#39'V'#39' AND'
      ' STATUS = '#39'A'#39)
    Left = 248
    Top = 549
  end
  object FDNumeroCaixaLoja: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' COUNT(*)'
      'FROM'
      ' CAIXA'
      'WHERE'
      ' DATA = CURRENT_DATE AND'
      ' TIPO_VENDA = '#39'V'#39' AND'
      ' STATUS = '#39'A'#39' AND'
      ' ENVIADO = '#39'2'#39)
    Left = 136
    Top = 541
  end
  object FDConexao: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' CGC '
      'FROM'
      ' PARAMETROS')
    Left = 40
    Top = 549
  end
  object FDProjetosPharmalink: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * FROM PROJETOSPHARMALINK'
      'WHERE ID_PROJETO = :ID_PROJETO')
    Left = 1096
    Top = 541
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDCaixasDeletados: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' CAMPO1,'
      ' CD_FILIAL'
      'FROM'
      ' DELETADOS'
      'WHERE'
      ' TABELA = '#39'CAIXA'#39)
    Left = 1240
    Top = 533
  end
  object FDContasPagarCompras: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT '
      ' CONTAS_PAGAR_COMPRAS.*'
      'FROM'
      ' CONTAS_PAGAR_COMPRAS'
      'WHERE'
      ' CONTAS_PAGAR_COMPRAS.CD_CONTAS_PAGAR = :CD_CONTAS_PAGAR AND'
      'CONTAS_PAGAR_COMPRAS.CD_COMPRAS = :CD_COMPRAS')
    Left = 1240
    Top = 373
    ParamData = <
      item
        Name = 'CD_CONTAS_PAGAR'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CD_COMPRAS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object FDConvenios_Grupos: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' CONVENIOS_GRUPOS'
      'WHERE'
      ' CD_CONVENIO = :CONVENIO AND'
      ' CD_GRUPO = :GRUPO')
    Left = 1080
    Top = 381
    ParamData = <
      item
        Name = 'CONVENIO'
        DataType = ftInteger
        Precision = 16
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'GRUPO'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end>
  end
  object FDIdProduto: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT ID_PRODUTO FROM PRODUTOS')
    Left = 976
    Top = 381
  end
  object FDBalancosFilial: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      ' BALANCO'
      'WHERE'
      ' ENVIADO = '#39'9'#39)
    Left = 624
    Top = 541
  end
end
