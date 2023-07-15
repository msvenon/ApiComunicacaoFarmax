object DM: TDM
  OldCreateOrder = False
  Left = 273
  Top = 155
  Height = 473
  Width = 973
  object SqlCadFiliais: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  *'#13#10'FROM'#13#10'  FILIAIS'#13#10'WHERE'#13#10'  STATUS = '#39'A'#39#13#10'ORDER BY'#13#10' ' +
      'CD_FILIAL'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 528
    Top = 1
    object SqlCadFiliaisNOME: TStringField
      DisplayLabel = 'Filial'
      DisplayWidth = 40
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object SqlCadFiliaisCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object SqlCadFiliaisRAZAO: TStringField
      FieldName = 'RAZAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
      Size = 40
    end
    object SqlCadFiliaisCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 14
    end
    object SqlCadFiliaisINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 13
    end
    object SqlCadFiliaisRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 35
    end
    object SqlCadFiliaisBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 2
    end
    object SqlCadFiliaisCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 8
    end
    object SqlCadFiliaisFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisFONE_1: TStringField
      FieldName = 'FONE_1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 8
    end
    object SqlCadFiliaisCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisCOMPROFAR: TStringField
      FieldName = 'COMPROFAR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisITA: TStringField
      FieldName = 'ITA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisINTERMED: TStringField
      FieldName = 'INTERMED'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisLUNAR: TStringField
      FieldName = 'LUNAR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisFARMASERVICE: TStringField
      FieldName = 'FARMASERVICE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisPANARELLO: TStringField
      FieldName = 'PANARELLO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisPROFARMA: TStringField
      FieldName = 'PROFARMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisFARMACRUZ: TStringField
      FieldName = 'FARMACRUZ'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisRIODROGS: TStringField
      FieldName = 'RIODROGS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisJAN_ITENS: TFloatField
      FieldName = 'JAN_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisFEV_ITENS: TFloatField
      FieldName = 'FEV_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisMAR_ITENS: TFloatField
      FieldName = 'MAR_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisABR_ITENS: TFloatField
      FieldName = 'ABR_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisMAI_ITENS: TFloatField
      FieldName = 'MAI_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJUN_ITENS: TFloatField
      FieldName = 'JUN_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJUL_ITENS: TFloatField
      FieldName = 'JUL_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisAGO_ITENS: TFloatField
      FieldName = 'AGO_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisSET_ITENS: TFloatField
      FieldName = 'SET_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisOUT_ITENS: TFloatField
      FieldName = 'OUT_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisNOV_ITENS: TFloatField
      FieldName = 'NOV_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisDEZ_ITENS: TFloatField
      FieldName = 'DEZ_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJAN_VALVENDA: TFloatField
      FieldName = 'JAN_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisFEV_VALVENDA: TFloatField
      FieldName = 'FEV_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisMAR_VALVENDA: TFloatField
      FieldName = 'MAR_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisABR_VALVENDA: TFloatField
      FieldName = 'ABR_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisMAI_VALVENDA: TFloatField
      FieldName = 'MAI_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJUN_VALVENDA: TFloatField
      FieldName = 'JUN_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJUL_VALVENDA: TFloatField
      FieldName = 'JUL_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisAGO_VALVENDA: TFloatField
      FieldName = 'AGO_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisSET_VALVENDA: TFloatField
      FieldName = 'SET_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisOUT_VALVENDA: TFloatField
      FieldName = 'OUT_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisNOV_VALVENDA: TFloatField
      FieldName = 'NOV_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisDEZ_VALVENDA: TFloatField
      FieldName = 'DEZ_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJAN_VALCOMPRA: TFloatField
      FieldName = 'JAN_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisFEV_VALCOMPRA: TFloatField
      FieldName = 'FEV_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisMAR_VALCOMPRA: TFloatField
      FieldName = 'MAR_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisABR_VALCOMPRA: TFloatField
      FieldName = 'ABR_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisMAI_VALCOMPRA: TFloatField
      FieldName = 'MAI_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJUN_VALCOMPRA: TFloatField
      FieldName = 'JUN_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisJUL_VALCOMPRA: TFloatField
      FieldName = 'JUL_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisAGO_VALCOMPRA: TFloatField
      FieldName = 'AGO_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisSET_VALCOMPRA: TFloatField
      FieldName = 'SET_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisOUT_VALCOMPRA: TFloatField
      FieldName = 'OUT_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisNOV_VALCOMPRA: TFloatField
      FieldName = 'NOV_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisDEZ_VALCOMPRA: TFloatField
      FieldName = 'DEZ_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object SqlCadFiliaisCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadFiliaisEMEFARMA: TStringField
      FieldName = 'EMEFARMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisJAMYR: TStringField
      FieldName = 'JAMYR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisSERVIMED: TStringField
      FieldName = 'SERVIMED'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisENDERECOWEB: TStringField
      FieldName = 'ENDERECOWEB'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object SqlCadFiliaisEXPORTAR: TStringField
      FieldName = 'EXPORTAR'
      Visible = False
      Size = 1
    end
    object SqlCadFiliaisMETROSQUADRADOS: TFloatField
      FieldName = 'METROSQUADRADOS'
      Visible = False
    end
    object SqlCadFiliaisNUMEROFUNCIONARIOS: TFloatField
      FieldName = 'NUMEROFUNCIONARIOS'
      Visible = False
    end
    object SqlCadFiliaisNUMEROPDVS: TFloatField
      FieldName = 'NUMEROPDVS'
      Visible = False
    end
    object SqlCadFiliaisDROGACENTER: TStringField
      FieldName = 'DROGACENTER'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisFLEXFARMA: TStringField
      FieldName = 'FLEXFARMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object SqlCadFiliaisDPC: TStringField
      FieldName = 'DPC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlCadFiliaisNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlCadFiliaisCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object SqlCadFiliaisPHARMALINK: TStringField
      FieldName = 'PHARMALINK'
      ProviderFlags = [pfInUpdate]
    end
    object SqlCadFiliaisANBFARMA: TStringField
      FieldName = 'ANBFARMA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlCadFiliaisAUDIFAR: TStringField
      FieldName = 'AUDIFAR'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlCadFiliaisBRASDROGA: TStringField
      FieldName = 'BRASDROGA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlCadFiliaisCENTROAMERICA: TStringField
      FieldName = 'CENTROAMERICA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlCadFiliaisCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object DspCadFiliais: TDataSetProvider
    DataSet = SqlCadFiliais
    UpdateMode = upWhereKeyOnly
    Left = 528
    Top = 43
  end
  object CdsCadFiliais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCadFiliais'
    Left = 528
    Top = 72
    object CdsCadFiliaisCD_FILIAL: TFloatField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CD_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsCadFiliaisNOME: TStringField
      DisplayLabel = 'Filial'
      DisplayWidth = 40
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 18
    end
    object CdsCadFiliaisCD_DISTRIBUIDOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisCD_CLIENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 40
      FieldName = 'RAZAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
      Size = 40
    end
    object CdsCadFiliaisCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '9999-!9999;0;_'
      Size = 10
    end
    object CdsCadFiliaisFONE_1: TStringField
      FieldName = 'FONE_1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '9999-!9999;0;_'
      Size = 10
    end
    object CdsCadFiliaisCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '99.!999.!999/!9999-!99;0;_'
      Size = 14
    end
    object CdsCadFiliaisINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 13
    end
    object CdsCadFiliaisRUA: TStringField
      DisplayWidth = 100
      FieldName = 'RUA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 35
    end
    object CdsCadFiliaisBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 2
    end
    object CdsCadFiliaisCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      EditMask = '99999-!999;0;_'
      Size = 8
    end
    object CdsCadFiliaisCOMPROFAR: TStringField
      FieldName = 'COMPROFAR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisITA: TStringField
      FieldName = 'ITA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisINTERMED: TStringField
      FieldName = 'INTERMED'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisLUNAR: TStringField
      FieldName = 'LUNAR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisFARMASERVICE: TStringField
      FieldName = 'FARMASERVICE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisPANARELLO: TStringField
      FieldName = 'PANARELLO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisPROFARMA: TStringField
      FieldName = 'PROFARMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisFARMACRUZ: TStringField
      FieldName = 'FARMACRUZ'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisRIODROGS: TStringField
      FieldName = 'RIODROGS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object CdsCadFiliaisJAN_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'JAN_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisFEV_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'FEV_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisMAR_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'MAR_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisABR_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'ABR_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisMAI_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'MAI_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJUN_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'JUN_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJUL_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'JUL_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisAGO_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'AGO_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisSET_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'SET_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisOUT_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'OUT_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisNOV_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'NOV_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisDEZ_ITENS: TFloatField
      DisplayWidth = 10
      FieldName = 'DEZ_ITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJAN_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'JAN_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisFEV_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'FEV_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisMAR_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'MAR_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisABR_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'ABR_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisMAI_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'MAI_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJUN_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'JUN_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJUL_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'JUL_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisAGO_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'AGO_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisSET_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'SET_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisOUT_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'OUT_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisNOV_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'NOV_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisDEZ_VALVENDA: TFloatField
      DisplayWidth = 10
      FieldName = 'DEZ_VALVENDA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJAN_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'JAN_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisFEV_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'FEV_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisMAR_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'MAR_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisABR_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'ABR_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisMAI_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'MAI_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJUN_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'JUN_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisJUL_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'JUL_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisAGO_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'AGO_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisSET_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'SET_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisOUT_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'OUT_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisNOV_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'NOV_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisDEZ_VALCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'DEZ_VALCOMPRA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 8
    end
    object CdsCadFiliaisEMEFARMA: TStringField
      FieldName = 'EMEFARMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisJAMYR: TStringField
      FieldName = 'JAMYR'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisSERVIMED: TStringField
      FieldName = 'SERVIMED'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisENDERECOWEB: TStringField
      FieldName = 'ENDERECOWEB'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object CdsCadFiliaisEXPORTAR: TStringField
      FieldName = 'EXPORTAR'
      Visible = False
      Size = 1
    end
    object CdsCadFiliaisMETROSQUADRADOS: TFloatField
      FieldName = 'METROSQUADRADOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisNUMEROFUNCIONARIOS: TFloatField
      FieldName = 'NUMEROFUNCIONARIOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisNUMEROPDVS: TFloatField
      FieldName = 'NUMEROPDVS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisDROGACENTER: TStringField
      DisplayWidth = 10
      FieldName = 'DROGACENTER'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisFLEXFARMA: TStringField
      DisplayWidth = 10
      FieldName = 'FLEXFARMA'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisVirtualSelected: TBooleanField
      DisplayWidth = 5
      FieldKind = fkInternalCalc
      FieldName = 'VirtualSelected'
    end
    object CdsCadFiliaisDPC: TStringField
      FieldName = 'DPC'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 10
    end
    object CdsCadFiliaisCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 255
    end
    object CdsCadFiliaisPHARMALINK: TStringField
      FieldName = 'PHARMALINK'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadFiliaisANBFARMA: TStringField
      FieldName = 'ANBFARMA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CdsCadFiliaisAUDIFAR: TStringField
      FieldName = 'AUDIFAR'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CdsCadFiliaisBRASDROGA: TStringField
      FieldName = 'BRASDROGA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CdsCadFiliaisCENTROAMERICA: TStringField
      FieldName = 'CENTROAMERICA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CdsCadFiliaisCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object DsCadFiliais: TDataSource
    DataSet = CdsCadFiliais
    Left = 528
    Top = 100
  end
  object SQlParametros: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CD_FILIAL, '#13#10' TIPO_LOJA, '#13#10' CD_VENDA, '#13#10' SERVIDORMATRI' +
      'Z, '#13#10' CHAVESINTEGRA, '#13#10' DT_IMPLANTACAO, '#13#10' DATAATUAL, '#13#10' ESTOQUE' +
      'MINIMO, '#13#10' DIASBLOQUEIOCLIENTE, '#13#10' BAIXAAUTOMATICACHEQUEPRE, '#13#10' ' +
      'CD_CONTA_BAIXA_CHEQUE ,'#13#10'USAIMS, CODIGOUSUARIO'#13#10'FROM '#13#10' PARAMETR' +
      'OS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 272
    Top = 56
    object SQlParametrosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object SQlParametrosTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
    object SQlParametrosCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object SQlParametrosSERVIDORMATRIZ: TStringField
      FieldName = 'SERVIDORMATRIZ'
      Size = 100
    end
    object SQlParametrosCHAVESINTEGRA: TStringField
      FieldName = 'CHAVESINTEGRA'
      Size = 50
    end
    object SQlParametrosDT_IMPLANTACAO: TStringField
      FieldName = 'DT_IMPLANTACAO'
      Size = 50
    end
    object SQlParametrosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
    end
    object SQlParametrosESTOQUEMINIMO: TStringField
      FieldName = 'ESTOQUEMINIMO'
      Size = 1
    end
    object SQlParametrosDIASBLOQUEIOCLIENTE: TIntegerField
      FieldName = 'DIASBLOQUEIOCLIENTE'
    end
    object SQlParametrosBAIXAAUTOMATICACHEQUEPRE: TStringField
      FieldName = 'BAIXAAUTOMATICACHEQUEPRE'
      Size = 1
    end
    object SQlParametrosCD_CONTA_BAIXA_CHEQUE: TFloatField
      FieldName = 'CD_CONTA_BAIXA_CHEQUE'
    end
    object SQlParametrosUSAIMS: TStringField
      FieldName = 'USAIMS'
      Size = 1
    end
    object SQlParametrosCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Size = 4
    end
  end
  object DspParametros: TDataSetProvider
    DataSet = SQlParametros
    Left = 272
    Top = 96
  end
  object CdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 272
    Top = 136
    object CdsParametrosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsParametrosTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
    object CdsParametrosCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsParametrosSERVIDORMATRIZ: TStringField
      FieldName = 'SERVIDORMATRIZ'
      Size = 100
    end
    object CdsParametrosCHAVESINTEGRA: TStringField
      FieldName = 'CHAVESINTEGRA'
      Size = 50
    end
    object CdsParametrosDT_IMPLANTACAO: TStringField
      FieldName = 'DT_IMPLANTACAO'
      Size = 50
    end
    object CdsParametrosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
    end
    object CdsParametrosESTOQUEMINIMO: TStringField
      FieldName = 'ESTOQUEMINIMO'
      Size = 1
    end
    object CdsParametrosDIASBLOQUEIOCLIENTE: TIntegerField
      FieldName = 'DIASBLOQUEIOCLIENTE'
    end
    object CdsParametrosBAIXAAUTOMATICACHEQUEPRE: TStringField
      FieldName = 'BAIXAAUTOMATICACHEQUEPRE'
      Size = 1
    end
    object CdsParametrosCD_CONTA_BAIXA_CHEQUE: TFloatField
      FieldName = 'CD_CONTA_BAIXA_CHEQUE'
    end
    object CdsParametrosUSAIMS: TStringField
      FieldName = 'USAIMS'
      Size = 1
    end
    object CdsParametrosCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Size = 4
    end
  end
  object DataSetProvider1: TDataSetProvider
    Left = 176
    Top = 56
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 176
    Top = 104
    object FloatField4: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object StringField7: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
    object FloatField5: TFloatField
      FieldName = 'CD_VENDA'
    end
    object StringField8: TStringField
      FieldName = 'SERVIDORMATRIZ'
      Size = 100
    end
    object StringField9: TStringField
      FieldName = 'CHAVESINTEGRA'
      Size = 50
    end
    object StringField10: TStringField
      FieldName = 'DT_IMPLANTACAO'
      Size = 50
    end
    object DateField2: TDateField
      FieldName = 'DATAATUAL'
    end
    object StringField11: TStringField
      FieldName = 'ESTOQUEMINIMO'
      Size = 1
    end
    object IntegerField2: TIntegerField
      FieldName = 'DIASBLOQUEIOCLIENTE'
    end
    object StringField12: TStringField
      FieldName = 'BAIXAAUTOMATICACHEQUEPRE'
      Size = 1
    end
    object FloatField6: TFloatField
      FieldName = 'CD_CONTA_BAIXA_CHEQUE'
    end
  end
  object SqlMovimentoCaixa: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' MOVIMENTOCAIXA'#13#10'WHERE'#13#10' CD_CONTAS_PAGAR = :C' +
      'D_CONTAS_PAGAR OR'#13#10' CD_CONTAS_RECEBER = :CD_CONTAS_RECEBER'#13#10'ORDE' +
      'R BY'#13#10' DATA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_PAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    SQLConnection = SQLConn
    Left = 168
    Top = 218
  end
  object DspMovimentoCaixa: TDataSetProvider
    DataSet = SqlMovimentoCaixa
    Left = 168
    Top = 258
  end
  object CdsMovimentoCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_PAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_RECEBER'
        ParamType = ptInput
      end>
    ProviderName = 'DspMovimentoCaixa'
    Left = 168
    Top = 287
    object CdsMovimentoCaixaCD_MOVIMENTOCAIXA: TFloatField
      FieldName = 'CD_MOVIMENTOCAIXA'
      Required = True
    end
    object CdsMovimentoCaixaCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object CdsMovimentoCaixaDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsMovimentoCaixaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CdsMovimentoCaixaCD_CENTRO_CUSTO: TFloatField
      FieldName = 'CD_CENTRO_CUSTO'
    end
    object CdsMovimentoCaixaTIPO_MOVIMENTO: TStringField
      FieldName = 'TIPO_MOVIMENTO'
      Size = 1
    end
    object CdsMovimentoCaixaMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 2
    end
    object CdsMovimentoCaixaANOREFERENCIA: TStringField
      FieldName = 'ANOREFERENCIA'
      Size = 4
    end
    object CdsMovimentoCaixaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsMovimentoCaixaCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsMovimentoCaixaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object CdsMovimentoCaixaCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsMovimentoCaixaCD_CONTAS_PAGAR: TFloatField
      FieldName = 'CD_CONTAS_PAGAR'
    end
    object CdsMovimentoCaixaATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object CdsMovimentoCaixaVirtualFilial: TStringField
      FieldKind = fkLookup
      FieldName = 'VirtualFilial'
      LookupKeyFields = 'CD_FILIAL'
      LookupResultField = 'NOME'
      KeyFields = 'CD_FILIAL'
      Size = 40
      Lookup = True
    end
    object CdsMovimentoCaixaCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
    end
  end
  object SqlSaldo: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' SALDO'#13#10'WHERE'#13#10' CD_CONTA = :CD_CONTA'#13#10'ORDER BY' +
      #13#10' DATA'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'parId'
        ParamType = ptInput
      end>
    SQLConnection = SQLConn
    Left = 416
    Top = 210
    object SqlSaldoCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlSaldoDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlSaldoSALDO: TFloatField
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object DspSaldo: TDataSetProvider
    DataSet = SqlSaldo
    Left = 417
    Top = 250
  end
  object CdsSaldo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'parId'
        ParamType = ptInput
      end>
    ProviderName = 'DspSaldo'
    Left = 417
    Top = 279
    object CdsSaldoCD_CONTA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsSaldoDATA: TDateField
      DisplayWidth = 10
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsSaldoSALDO: TFloatField
      DisplayWidth = 10
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object SqlCadContas: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10'  CONTAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 543
    Top = 185
    object SqlCadContasCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlCadContasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SqlCadContasBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object SqlCadContasNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 30
    end
    object SqlCadContasAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 5
    end
    object SqlCadContasCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object SqlCadContasTITULAR: TStringField
      FieldName = 'TITULAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 40
    end
    object SqlCadContasTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 1
    end
    object SqlCadContasSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 1
    end
  end
  object DspCadContas: TDataSetProvider
    DataSet = SqlCadContas
    UpdateMode = upWhereKeyOnly
    Left = 541
    Top = 227
  end
  object CdsCadContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCadContas'
    Left = 540
    Top = 256
    object CdsCadContasCD_CONTA: TFloatField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CD_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object CdsCadContasNOME_BANCO: TStringField
      DisplayLabel = 'Nome do Banco'
      DisplayWidth = 30
      FieldName = 'NOME_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object CdsCadContasAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      DisplayWidth = 5
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object CdsCadContasCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta Corrente'
      DisplayWidth = 10
      FieldName = 'CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object CdsCadContasBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 3
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 3
    end
    object CdsCadContasTITULAR: TStringField
      DisplayLabel = 'Titular'
      FieldName = 'TITULAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 40
    end
    object CdsCadContasCD_FILIAL: TFloatField
      DisplayLabel = 'Filial'
      FieldName = 'CD_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object CdsCadContasTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 1
    end
    object CdsCadContasVirtualFilial: TStringField
      DisplayLabel = 'Filial'
      FieldKind = fkLookup
      FieldName = 'VirtualFilial'
      LookupKeyFields = 'CD_FILIAL'
      LookupResultField = 'NOME'
      KeyFields = 'CD_FILIAL'
      Visible = False
      Lookup = True
    end
    object CdsCadContasVirtualTipo: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'VirtualTipo'
      Visible = False
      Calculated = True
    end
    object CdsCadContasSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 1
    end
  end
  object DsCadContas: TDataSource
    DataSet = CdsCadContas
    Left = 539
    Top = 284
  end
  object SqlBaixaAutomaticaChequePre: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' FIRST 1000 * '#13#10'FROM'#13#10' CONTAS_RECEBER '#13#10'WHERE'#13#10' (CD_FORM' +
      'A_PAGAMENTO = 2 OR '#13#10'  CD_FORMA_PAGAMENTO = 4 OR '#13#10'  CD_FORMA_PA' +
      'GAMENTO = 6) AND'#13#10' DT_VENCIMENTO <= CURRENT_DATE AND'#13#10' STATUS = ' +
      #39'A'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 648
    Top = 176
  end
  object DspBaixaAutomaticaChequePre: TDataSetProvider
    DataSet = SqlBaixaAutomaticaChequePre
    Left = 648
    Top = 211
  end
  object CdsBaixaAutomaticaChequePre: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBaixaAutomaticaChequePre'
    Left = 648
    Top = 240
    object CdsBaixaAutomaticaChequePreVirtualCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'VirtualCliente'
      LookupKeyFields = 'CD_CLIENTE'
      LookupResultField = 'NOME'
      KeyFields = 'CD_CLIENTE'
      Visible = False
      Size = 40
      Lookup = True
    end
    object CdsBaixaAutomaticaChequePreCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
    object CdsBaixaAutomaticaChequePreCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object CdsBaixaAutomaticaChequePreCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsBaixaAutomaticaChequePreCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsBaixaAutomaticaChequePreCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsBaixaAutomaticaChequePreCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsBaixaAutomaticaChequePreCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsBaixaAutomaticaChequePreCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object CdsBaixaAutomaticaChequePreCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object CdsBaixaAutomaticaChequePreCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object CdsBaixaAutomaticaChequePreDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object CdsBaixaAutomaticaChequePreDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsBaixaAutomaticaChequePreNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object CdsBaixaAutomaticaChequePreSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Size = 4
    end
    object CdsBaixaAutomaticaChequePreDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object CdsBaixaAutomaticaChequePreDT_NOTA_FISCAL: TDateField
      FieldName = 'DT_NOTA_FISCAL'
    end
    object CdsBaixaAutomaticaChequePreVENCTO: TDateField
      FieldName = 'VENCTO'
    end
    object CdsBaixaAutomaticaChequePreVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsBaixaAutomaticaChequePreHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object CdsBaixaAutomaticaChequePreCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object CdsBaixaAutomaticaChequePreNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object CdsBaixaAutomaticaChequePreNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object CdsBaixaAutomaticaChequePreDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object CdsBaixaAutomaticaChequePreVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object CdsBaixaAutomaticaChequePreVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object CdsBaixaAutomaticaChequePreVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object CdsBaixaAutomaticaChequePreVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object CdsBaixaAutomaticaChequePreNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Size = 11
    end
    object CdsBaixaAutomaticaChequePreBANCO: TStringField
      FieldName = 'BANCO'
      Size = 10
    end
    object CdsBaixaAutomaticaChequePreAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object CdsBaixaAutomaticaChequePreCONTA: TStringField
      FieldName = 'CONTA'
      Size = 16
    end
    object CdsBaixaAutomaticaChequePreHISTORICO_BANCO: TStringField
      FieldName = 'HISTORICO_BANCO'
      Size = 60
    end
    object CdsBaixaAutomaticaChequePreSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsBaixaAutomaticaChequePreOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsBaixaAutomaticaChequePreGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object CdsBaixaAutomaticaChequePreBOLETOGERADO: TStringField
      FieldName = 'BOLETOGERADO'
      Size = 1
    end
    object CdsBaixaAutomaticaChequePreDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object CdsBaixaAutomaticaChequePreTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object CdsBaixaAutomaticaChequePreTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object CdsBaixaAutomaticaChequePreTEFAUTORIZACAO: TFloatField
      FieldName = 'TEFAUTORIZACAO'
    end
    object CdsBaixaAutomaticaChequePreTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object CdsBaixaAutomaticaChequePreTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object CdsBaixaAutomaticaChequePreTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 10
    end
    object CdsBaixaAutomaticaChequePreTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object CdsBaixaAutomaticaChequePreENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlCadClasse: TSQLDataSet
    CommandText = 'SELECT'#13#10'  *'#13#10'FROM'#13#10'  CLASSES'#13#10'ORDER BY'#13#10'  CD_CLASSE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 671
    Top = 1
    object SqlCadClasseCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlCadClasseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object SqlCadClasseTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 2
    end
    object SqlCadClasseVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object SqlCadClasseDT_CALCULOCURVA: TDateField
      FieldName = 'DT_CALCULOCURVA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadClasseENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object SqlCadClasseFREQUENCIA: TIntegerField
      FieldName = 'FREQUENCIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadClasseNPRODUTOS: TFloatField
      FieldName = 'NPRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadClasseNITENS: TFloatField
      FieldName = 'NITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadClasseVPRODUTOS: TFloatField
      FieldName = 'VPRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadClasseCPRODUTOS: TFloatField
      FieldName = 'CPRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object SqlCadClasseCONTROLALOTES: TStringField
      FieldName = 'CONTROLALOTES'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
  end
  object DspCadClasse: TDataSetProvider
    DataSet = SqlCadClasse
    UpdateMode = upWhereKeyOnly
    Left = 671
    Top = 43
  end
  object DsCadClasse: TDataSource
    DataSet = CdsCadClasse
    Left = 671
    Top = 100
  end
  object CdsCadClasse: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspCadClasse'
    Left = 672
    Top = 72
    object CdsCadClasseDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object CdsCadClasseCD_CLASSE: TFloatField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CD_CLASSE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsCadClasseTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 2
    end
    object CdsCadClasseVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object CdsCadClasseDT_CALCULOCURVA: TDateField
      FieldName = 'DT_CALCULOCURVA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadClasseENVIADO: TStringField
      FieldName = 'ENVIADO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object CdsCadClasseFREQUENCIA: TIntegerField
      FieldName = 'FREQUENCIA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object CdsCadClasseNPRODUTOS: TFloatField
      FieldName = 'NPRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '#,##0'
    end
    object CdsCadClasseNITENS: TFloatField
      FieldName = 'NITENS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '#,##0'
    end
    object CdsCadClasseVPRODUTOS: TFloatField
      FieldName = 'VPRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object CdsCadClasseCPRODUTOS: TFloatField
      FieldName = 'CPRODUTOS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object CdsCadClasseCONTROLALOTES: TStringField
      FieldName = 'CONTROLALOTES'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object CdsCadClasseVirtualNProdutos: TAggregateField
      FieldName = 'VirtualNProdutos'
      Active = True
      Expression = 'SUM(NPRODUTOS)'
    end
    object CdsCadClasseVirtualCProdutos: TAggregateField
      FieldName = 'VirtualCProdutos'
      Active = True
      Expression = 'SUM(CPRODUTOS)'
    end
    object CdsCadClasseVirtualVProdutos: TAggregateField
      FieldName = 'VirtualVProdutos'
      Active = True
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(VPRODUTOS)'
    end
    object CdsCadClasseVirtualNItens: TAggregateField
      FieldName = 'VirtualNItens'
      Active = True
      Expression = 'SUM(NITENS)'
    end
  end
  object SqlEventos: TSQLDataSet
    CommandText = 'SELECT * FROM EVENTOS WHERE CD_EVENTO = :CD_EVENTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_EVENTO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConn
    Left = 768
    Top = 8
  end
  object DspEventos: TDataSetProvider
    DataSet = SqlEventos
    Left = 768
    Top = 48
  end
  object CdsEventos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_EVENTO'
        ParamType = ptInput
      end>
    ProviderName = 'DspEventos'
    Left = 768
    Top = 80
    object CdsEventosCD_EVENTO: TFloatField
      FieldName = 'CD_EVENTO'
      Required = True
    end
    object CdsEventosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CdsEventosHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
    end
    object CdsEventosHORAFIM: TTimeField
      FieldName = 'HORAFIM'
    end
    object CdsEventosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsEventosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object CdsEventosDATA: TDateField
      FieldName = 'DATA'
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
    SQLConnection = SQLConn
    Left = 40
    Top = 226
    object SqlControleCAMPO: TStringField
      FieldName = 'CAMPO'
      Required = True
      Size = 30
    end
    object SqlControleVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object DspControle: TDataSetProvider
    DataSet = SqlControle
    Left = 41
    Top = 257
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
    Left = 40
    Top = 285
    object CdsControleCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 30
    end
    object CdsControleVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object Sp_Preenche_Dados_Filiais: TSQLDataSet
    CommandText = 'EXECUTE PROCEDURE SP_PREENCHE_DADOS_FILIAIS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 312
    Top = 240
  end
  object SQL: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 24
    Top = 72
  end
  object SQLConn: TSQLConnection
    ConnectionName = 'FarmaxPress'
    DriverName = 'InterXpress for Firebird'
    GetDriverFunc = 'getSQLDriverFB'
    LibraryName = 'dbxup_fb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=InterXpress for Firebird'
      'Database=localhost:D:\FARMAXWIN\FARMAX.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'fbclient.DLL'
    Left = 33
    Top = 8
  end
  object Sql1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConn
    Left = 352
    Top = 56
  end
  object Cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp1'
    Left = 352
    Top = 136
  end
  object Dsp1: TDataSetProvider
    DataSet = Sql1
    Left = 352
    Top = 96
  end
end
