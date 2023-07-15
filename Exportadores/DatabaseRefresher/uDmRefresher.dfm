object DmRefresher: TDmRefresher
  OldCreateOrder = False
  Left = 70
  Top = 61
  Height = 726
  Width = 1303
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FarmaXpress'
    DriverName = 'InterXpress for Firebird'
    GetDriverFunc = 'getSQLDriverFB'
    LibraryName = 'dbxup_fb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=InterXpress for Firebird'
      'RoleName='
      'Database=localhost:D:\farmaxwin\farmax.fdb'
      'WaitOnLocks=True'
      'CommitRetain=False'
      'ServerCharSet='
      'SqlDialect=3'
      'Trim Char=False'
      'USER_NAME=sysdba'
      'PASSWORD=masterkey'
      'InterXpress for Firebird TransIsolation=ReadCommited')
    VendorLib = 'fbclient.DLL'
    BeforeConnect = SQLConnection1BeforeConnect
    Left = 32
    Top = 8
  end
  object SqlParametros: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' CD_FILIAL, TIPO_LOJA, CODIGOUSUARIO, NOMEFANTASIA, RAZ' +
      'AO, ENDERECO, BAIRRO, CIDADE, UF, CEP, CX_POSTAL, CGC, INSCRICAO' +
      ', FONE, FAX, INSC_MUNIC, URL1, URL2, URL3, URL4, URL5, MENS_PROM' +
      '2, MENS_PROM3, MENS_PROM4, MENS_PROM5, FOTO, CAMINHOMATRIZ, CUST' +
      'O_OPERACIONAL, PERCENTUAL_SIMPLES, CALCULO_CUSTO, CHAVE, CONTRA_' +
      'CHAVE, DT_IMPLANTACAO, DT_AUTENTICACAO, CD_IMPRESSORA, ETIQUETA_' +
      'TIPO, ETIQUETA, DESCONTOMAXIMO, IMPRIME_PREVENDA, PREVENDA, DESC' +
      'ONTOGERENTE, NVIASCUPOMENTREGA, TEMPODESCANSO, CHAVEF10, RESUMOC' +
      'AIXA_ITEM_1, RESUMOCAIXA_ITEM_2, RESUMOCAIXA_ITEM_3, RESUMOCAIXA' +
      '_ITEM_4, RESUMOCAIXA_ITEM_5, RESUMOCAIXA_ITEM_6, RESUMOCAIXA_ITE' +
      'M_7, RESUMOCAIXA_ITEM_8, RESUMOCAIXA_ITEM_9, RESUMOCAIXA_ITEM_10' +
      ', RESUMOCAIXA_ITEM_11, RESUMOCAIXA_ITEM_12, IMPRIMEORCAMENTO, TI' +
      'PODESCONTO, URLCOTACOES, SMTP, USUARIO_SMTP, SENHA_SMTP, NAOFISC' +
      'AL, ETIQUETAS_PRN, VENDEESTOQUENEGATIVO, PEDECRMBALCAO, PEDECRMC' +
      'HECKOUT, GERARCR_TRANSFER, GERARCP_TRANSFER, LIMITEDECREDITO, SE' +
      'RVIDORMATRIZ, ESTOQUEMINIMO, NVIASTRANSFERENCIA, UTILIZAPERFUMIS' +
      'TA, DATAATUAL, ABREENTREGA, CUPOMDETALHADOPREVENDA, PARCELAVENDA' +
      'S, DESCONTOOPERADORCALLCENTER, DESCONTOGERENTECALLCENTER, PRECIF' +
      'ICACAO_UNICA, COLUNASIMPRESSORANAOFISCAL, MANTEMDESCRICAOPRODUTO' +
      ', INSTRUCOESBOLETO, USATEF, TEFTEMPOESPERA, TEFTEMPOMENSAGEM, CO' +
      'NTROLEMEDICAMENTO, CONSULTACHEQUE, IDENTIFICARCLIENTE, PERIODO_V' +
      'ENCIMENTO, PERIODO_VENCIMENTO_VENDAS, IDENTIFICAVENDAMANUAL, TRA' +
      'BALHARCAIXADIAANTERIOR, USAPRECOCONCORRENTE, PRECOPROMOCAOAUTOMA' +
      'TICO, COMPROVANTEFIADO, MANTEMDESCRICAOPRODUTOCOMPRA, FARMACEUTI' +
      'CONOME, FARMACEUTICOCPF, FARMACEUTICOCRF, FARMACEUTICOUF, DATA_U' +
      'LTIMA_TRANSMISSAO_SNGPC, ALTERAMARGEMNOTA, SOMAIPI, CAMINHOAUTEN' +
      'TICACAO, PEDIRSENHAVENDEDOR, VENDASDINHEIRO, VENDASCARTAO, VENDA' +
      'SCONVENIO, VENDASCHEQUEPRE, VENDASCREDITO, VENDASCHEQUEAVISTA, O' +
      'UTROSRECEBIMENTOS, SAIDAS, BAIXAAUTOMATICACHEQUEPRE, PERCENTUALP' +
      'REMIACAO, VALORMINIMOPREMIACAO, PERCENTUALJUROSCONTASRECEBER, CD' +
      '_CONTA_BAIXA_CHEQUE, INSTANCIAMULTIPLA, DESCONTOGRUPOSOBRECONVEN' +
      'IO, RESUMOCAIXA_ITEM_13, RESGATAPREVENDA, VALORALERTASANGRIA, VE' +
      'NDEDORAUTOMATICO, DISCRIMINARDESCONTOCUPOM, PROMOCAODESCONTOCUPO' +
      'M, USAGUILHOTINA, CONVENIOTRN, CLIENTETRN, VENCIMENTOTRN, CONVEN' +
      'IOEPHARMA, CLIENTEEPHARMA, VENCIMENTOEPHARMA, CONVENIOFUNCIONALC' +
      'ARD, CLIENTEFUNCIONALCARD, VENCIMENTOFUNCIONALCARD, CONVENIOVIDA' +
      'LINK, CLIENTEVIDALINK, VENCIMENTOVIDALINK, CONVENIOFARMACIAPOPUL' +
      'AR, CLIENTEFARMACIAPOPULAR, VENCIMENTOFARMACIAPOPULAR, LOGINFARM' +
      'ACIAPOPULAR, SENHAFARMACIAPOPULAR, LOGINFIDELIZE, SENHAFIDELIZE,' +
      ' USAIMS, CHAVESINTEGRA, IMPRIMIRRESUMOECF, IMPRIMIRVINCULADOPARA' +
      'ENTREGA, CODIGOIMS, VALORPONTUACAO, PONTOSRESGATE, VALORRESGATE,' +
      ' SUBSTITUTOTRIBUTARIO, CONTRIBUINTE_IPI, COMPLEMENTO, NUMERO, CO' +
      'NTATO, PAF_LAUDO, PAF_CNPJ, PAF_IE, PAF_IM, PAF_RAZAO, PAF_ENDER' +
      'ECO, PAF_TELEFONE, PAF_CONTATO, PAF_NOMECOMERCIAL, PAF_VERSAO, P' +
      'AF_EXECUTAVEL, PAF_MD5, PAF_ERPAFECF, PAF_CHAVEPUBLICA, PAF_CHAV' +
      'EPRIVADA, PAF_DATA, EXIBECOMISSAOVENDA, CONTROLALOTES, CONCLUI_T' +
      'RANSFERENCIAS, ENVIA_TRANSFERENCIAS, CONFERENCIAVENDA, USARVENDE' +
      'DORLOJA, CD_VENDEDORLOJA, PHARMALINKSENHA, PHARMALINKURL, PHARMA' +
      'LINKIP, DIASBLOQUEIOCLIENTE, EXIBIRVALORVENDA, LINHASAVANCO, EXI' +
      'BIRPRODUTOSRELACIONADOS, NOMEREDE, CODIGOCLOSEUP, RECEBIMENTOPAR' +
      'CIALCONTA, SERVIDORLOJA, CD_MUNICIPIO, PERFIL, EMAIL, CONTACUSTO' +
      'VENDA, VIASVINCULADOENTRGA, TEXTOPADRAOGARANTIA, VERSAO_GESTOR, ' +
      'VERSAO_LOJA, DIASSEMVENDER, RESUMOCAIXA_ITEM_14, NUMEROSERIECERT' +
      'IFICADO, NFEAMBIENTE, NFECFOP, NFECFOPTRANSFERENCIAENTRADA, NFEC' +
      'FOPTRANSFERENCIASAIDA, NFECFOPDEVOLUCAO, NFECFOPENTRADA, NFEULTI' +
      'MANOTAEMITIDA, NFEULTIMOLOTEENVIADO, TIPO_TEF, CD_VENDA, ARMAZEN' +
      'APOSICAOESTOQUEDATA, CONTADORNOME, CONTADORCPF, CONTADORCRC, CON' +
      'TADORCNPJ, CONTADORENDERECO, CONTADORNUMERO, CONTADORCOMPLEMENTO' +
      ', CONTADORBAIRRO, CONTADORCEP, CONTADORTELEFONE, CONTADORFAX, CO' +
      'NTADOREMAIL, CONTADORCD_MUNICIPIO, CHAVENFE, ACODEURL, ACODEUSUA' +
      'RIO, ACODESENHA, PHARMALINKUSUARIO, ICMSINTERESTADUALSIMPLES, IC' +
      'MSINTERESTADUALREDUZIDO, SERIENOTANFE, CD_PAIS, SERVIDORCALLCENT' +
      'ER, PREENCHERRECEITACONTROLADO, SMSTECNICO, SMSGERENCIAL, USATEC' +
      'BAN, USAHIPERCARD, USAREDECARDAMEXVISA, ABREFINALIZACAOBALCAO, E' +
      'XIBECUSTOBALCAO, CRT, EXPORTANOTASSNGPC, TRATANDOPREVENDASEMABER' +
      'TOPAF, FTPENDERECO, FTPUSUARIO, FTPSENHA, CLIENTEORIZON, CONVENI' +
      'OORIZON, NFECFOPDEVOLUCAOCOMPRA, DIAS_CARENCIA_JUROS_CR, ENQUADR' +
      'AMENTOTRIBUTARIO, RECEBECREDITOCONTASRECEBER, NFEFORNECEDORDEVOL' +
      'UCAOVENDA, CLIENTEPHARMASYSTEM, CONVENIOPHARMASYSTEM, SENHAPHARM' +
      'ASYSTEM, CONCESSAOCREDITOS, NFETIPOEMISSAO, SERIENOTANFESCAN, NF' +
      'EULTIMANOTAEMITIDASCAN, VERSAONFE, USACONFERENCIABALCAO, NFCEAMB' +
      'IENTE, NFCENOTA, NFCELOTE, NFCESERIE, NFCECIDTOKEN, NFCETOKEN, N' +
      'FEPERCENTUALCREDITOSN, PORTA_SMTP, PHARMALINKDIRETORIOENVIO, PHA' +
      'RMALINKDIRETORIORETORNO, PISALIQUOTA, COFINSALIQUOTA, AVISOPREVE' +
      'NDAABERTA, TEMPOAVISOPREVENDAABERTA, FIDELIZEFTPHOST, FIDELIZEFT' +
      'PUSUARIO, FIDELIZEFTPSENHA, USACONSULTAPRODUTOSPBM, WSCONVENIOUR' +
      'L, WSCONVENIOCODIGOACESSO, WSCONVENIOSENHA, WSCONVENIOOPERADOR, ' +
      'WSCONVENIOTOKEN, EXIBEIMAGEMPRODUTO, CLIENTEWSCONVENIO, CONVENIO' +
      'WSCONVENIO, TEFCNPJCREDENCIADORA'#13#10'FROM PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 48
    object SqlParametrosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlParametrosTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object SqlParametrosNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object SqlParametrosRAZAO: TStringField
      FieldName = 'RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object SqlParametrosENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object SqlParametrosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object SqlParametrosUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object SqlParametrosCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object SqlParametrosCX_POSTAL: TStringField
      FieldName = 'CX_POSTAL'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object SqlParametrosCGC: TStringField
      FieldName = 'CGC'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object SqlParametrosINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object SqlParametrosFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object SqlParametrosFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object SqlParametrosINSC_MUNIC: TStringField
      FieldName = 'INSC_MUNIC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosURL1: TStringField
      FieldName = 'URL1'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosURL2: TStringField
      FieldName = 'URL2'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosURL3: TStringField
      FieldName = 'URL3'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosURL4: TStringField
      FieldName = 'URL4'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosURL5: TStringField
      FieldName = 'URL5'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosMENS_PROM2: TStringField
      FieldName = 'MENS_PROM2'
      ProviderFlags = [pfInUpdate]
      Size = 48
    end
    object SqlParametrosMENS_PROM3: TStringField
      FieldName = 'MENS_PROM3'
      ProviderFlags = [pfInUpdate]
      Size = 48
    end
    object SqlParametrosMENS_PROM4: TStringField
      FieldName = 'MENS_PROM4'
      ProviderFlags = [pfInUpdate]
      Size = 48
    end
    object SqlParametrosMENS_PROM5: TStringField
      FieldName = 'MENS_PROM5'
      ProviderFlags = [pfInUpdate]
      Size = 48
    end
    object SqlParametrosFOTO: TStringField
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCAMINHOMATRIZ: TStringField
      FieldName = 'CAMINHOMATRIZ'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object SqlParametrosCUSTO_OPERACIONAL: TFloatField
      FieldName = 'CUSTO_OPERACIONAL'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPERCENTUAL_SIMPLES: TFloatField
      FieldName = 'PERCENTUAL_SIMPLES'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCALCULO_CUSTO: TStringField
      FieldName = 'CALCULO_CUSTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCHAVE: TStringField
      FieldName = 'CHAVE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SqlParametrosCONTRA_CHAVE: TStringField
      FieldName = 'CONTRA_CHAVE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SqlParametrosDT_IMPLANTACAO: TStringField
      FieldName = 'DT_IMPLANTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SqlParametrosDT_AUTENTICACAO: TStringField
      FieldName = 'DT_AUTENTICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SqlParametrosCD_IMPRESSORA: TFloatField
      FieldName = 'CD_IMPRESSORA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosETIQUETA_TIPO: TFloatField
      FieldName = 'ETIQUETA_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object SqlParametrosDESCONTOMAXIMO: TFloatField
      FieldName = 'DESCONTOMAXIMO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosIMPRIME_PREVENDA: TStringField
      FieldName = 'IMPRIME_PREVENDA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPREVENDA: TStringField
      FieldName = 'PREVENDA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosDESCONTOGERENTE: TFloatField
      FieldName = 'DESCONTOGERENTE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosNVIASCUPOMENTREGA: TFloatField
      FieldName = 'NVIASCUPOMENTREGA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosTEMPODESCANSO: TFloatField
      FieldName = 'TEMPODESCANSO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCHAVEF10: TStringField
      FieldName = 'CHAVEF10'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SqlParametrosRESUMOCAIXA_ITEM_1: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_1'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_2: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_2'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_3: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_3'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_4: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_4'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_5: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_5'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_6: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_6'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_7: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_7'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_8: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_8'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_9: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_9'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_10: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_10'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_11: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_11'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_12: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_12'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosIMPRIMEORCAMENTO: TStringField
      FieldName = 'IMPRIMEORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosTIPODESCONTO: TStringField
      FieldName = 'TIPODESCONTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosURLCOTACOES: TStringField
      FieldName = 'URLCOTACOES'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosSMTP: TStringField
      FieldName = 'SMTP'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosUSUARIO_SMTP: TStringField
      FieldName = 'USUARIO_SMTP'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosSENHA_SMTP: TStringField
      FieldName = 'SENHA_SMTP'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SqlParametrosNAOFISCAL: TFloatField
      FieldName = 'NAOFISCAL'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosETIQUETAS_PRN: TFloatField
      FieldName = 'ETIQUETAS_PRN'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPEDECRMBALCAO: TStringField
      FieldName = 'PEDECRMBALCAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPEDECRMCHECKOUT: TStringField
      FieldName = 'PEDECRMCHECKOUT'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosGERARCR_TRANSFER: TStringField
      FieldName = 'GERARCR_TRANSFER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosGERARCP_TRANSFER: TStringField
      FieldName = 'GERARCP_TRANSFER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosLIMITEDECREDITO: TFloatField
      FieldName = 'LIMITEDECREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosSERVIDORMATRIZ: TStringField
      FieldName = 'SERVIDORMATRIZ'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosESTOQUEMINIMO: TStringField
      FieldName = 'ESTOQUEMINIMO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNVIASTRANSFERENCIA: TFloatField
      FieldName = 'NVIASTRANSFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosUTILIZAPERFUMISTA: TStringField
      FieldName = 'UTILIZAPERFUMISTA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosABREENTREGA: TStringField
      FieldName = 'ABREENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCUPOMDETALHADOPREVENDA: TStringField
      FieldName = 'CUPOMDETALHADOPREVENDA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPARCELAVENDAS: TStringField
      FieldName = 'PARCELAVENDAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosDESCONTOOPERADORCALLCENTER: TFloatField
      FieldName = 'DESCONTOOPERADORCALLCENTER'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosDESCONTOGERENTECALLCENTER: TFloatField
      FieldName = 'DESCONTOGERENTECALLCENTER'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPRECIFICACAO_UNICA: TStringField
      FieldName = 'PRECIFICACAO_UNICA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCOLUNASIMPRESSORANAOFISCAL: TFloatField
      FieldName = 'COLUNASIMPRESSORANAOFISCAL'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosMANTEMDESCRICAOPRODUTO: TStringField
      FieldName = 'MANTEMDESCRICAOPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosINSTRUCOESBOLETO: TStringField
      FieldName = 'INSTRUCOESBOLETO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosUSATEF: TStringField
      FieldName = 'USATEF'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosTEFTEMPOESPERA: TFloatField
      FieldName = 'TEFTEMPOESPERA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosTEFTEMPOMENSAGEM: TFloatField
      FieldName = 'TEFTEMPOMENSAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONTROLEMEDICAMENTO: TStringField
      FieldName = 'CONTROLEMEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCONSULTACHEQUE: TStringField
      FieldName = 'CONSULTACHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosIDENTIFICARCLIENTE: TStringField
      FieldName = 'IDENTIFICARCLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPERIODO_VENCIMENTO: TFloatField
      FieldName = 'PERIODO_VENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPERIODO_VENCIMENTO_VENDAS: TFloatField
      FieldName = 'PERIODO_VENCIMENTO_VENDAS'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosIDENTIFICAVENDAMANUAL: TStringField
      FieldName = 'IDENTIFICAVENDAMANUAL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosTRABALHARCAIXADIAANTERIOR: TStringField
      FieldName = 'TRABALHARCAIXADIAANTERIOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosUSAPRECOCONCORRENTE: TStringField
      FieldName = 'USAPRECOCONCORRENTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPRECOPROMOCAOAUTOMATICO: TStringField
      FieldName = 'PRECOPROMOCAOAUTOMATICO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCOMPROVANTEFIADO: TStringField
      FieldName = 'COMPROVANTEFIADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosMANTEMDESCRICAOPRODUTOCOMPRA: TStringField
      FieldName = 'MANTEMDESCRICAOPRODUTOCOMPRA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosFARMACEUTICONOME: TStringField
      FieldName = 'FARMACEUTICONOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosFARMACEUTICOCPF: TStringField
      FieldName = 'FARMACEUTICOCPF'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object SqlParametrosFARMACEUTICOCRF: TStringField
      FieldName = 'FARMACEUTICOCRF'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosFARMACEUTICOUF: TFloatField
      FieldName = 'FARMACEUTICOUF'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosDATA_ULTIMA_TRANSMISSAO_SNGPC: TDateField
      FieldName = 'DATA_ULTIMA_TRANSMISSAO_SNGPC'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosALTERAMARGEMNOTA: TStringField
      FieldName = 'ALTERAMARGEMNOTA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosSOMAIPI: TStringField
      FieldName = 'SOMAIPI'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCAMINHOAUTENTICACAO: TStringField
      FieldName = 'CAMINHOAUTENTICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosPEDIRSENHAVENDEDOR: TStringField
      FieldName = 'PEDIRSENHAVENDEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object SqlParametrosVENDASDINHEIRO: TStringField
      FieldName = 'VENDASDINHEIRO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosVENDASCARTAO: TStringField
      FieldName = 'VENDASCARTAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosVENDASCONVENIO: TStringField
      FieldName = 'VENDASCONVENIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosVENDASCHEQUEPRE: TStringField
      FieldName = 'VENDASCHEQUEPRE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosVENDASCREDITO: TStringField
      FieldName = 'VENDASCREDITO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosVENDASCHEQUEAVISTA: TStringField
      FieldName = 'VENDASCHEQUEAVISTA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosOUTROSRECEBIMENTOS: TStringField
      FieldName = 'OUTROSRECEBIMENTOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosSAIDAS: TStringField
      FieldName = 'SAIDAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosBAIXAAUTOMATICACHEQUEPRE: TStringField
      FieldName = 'BAIXAAUTOMATICACHEQUEPRE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPERCENTUALPREMIACAO: TFloatField
      FieldName = 'PERCENTUALPREMIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVALORMINIMOPREMIACAO: TFloatField
      FieldName = 'VALORMINIMOPREMIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPERCENTUALJUROSCONTASRECEBER: TFloatField
      FieldName = 'PERCENTUALJUROSCONTASRECEBER'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCD_CONTA_BAIXA_CHEQUE: TFloatField
      FieldName = 'CD_CONTA_BAIXA_CHEQUE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosINSTANCIAMULTIPLA: TStringField
      FieldName = 'INSTANCIAMULTIPLA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosDESCONTOGRUPOSOBRECONVENIO: TStringField
      FieldName = 'DESCONTOGRUPOSOBRECONVENIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESUMOCAIXA_ITEM_13: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_13'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRESGATAPREVENDA: TStringField
      FieldName = 'RESGATAPREVENDA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosVALORALERTASANGRIA: TFloatField
      FieldName = 'VALORALERTASANGRIA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVENDEDORAUTOMATICO: TFloatField
      FieldName = 'VENDEDORAUTOMATICO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosDISCRIMINARDESCONTOCUPOM: TStringField
      FieldName = 'DISCRIMINARDESCONTOCUPOM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosPROMOCAODESCONTOCUPOM: TStringField
      FieldName = 'PROMOCAODESCONTOCUPOM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosUSAGUILHOTINA: TStringField
      FieldName = 'USAGUILHOTINA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCONVENIOTRN: TFloatField
      FieldName = 'CONVENIOTRN'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCLIENTETRN: TFloatField
      FieldName = 'CLIENTETRN'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVENCIMENTOTRN: TFloatField
      FieldName = 'VENCIMENTOTRN'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONVENIOEPHARMA: TFloatField
      FieldName = 'CONVENIOEPHARMA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCLIENTEEPHARMA: TFloatField
      FieldName = 'CLIENTEEPHARMA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVENCIMENTOEPHARMA: TFloatField
      FieldName = 'VENCIMENTOEPHARMA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONVENIOFUNCIONALCARD: TFloatField
      FieldName = 'CONVENIOFUNCIONALCARD'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCLIENTEFUNCIONALCARD: TFloatField
      FieldName = 'CLIENTEFUNCIONALCARD'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVENCIMENTOFUNCIONALCARD: TFloatField
      FieldName = 'VENCIMENTOFUNCIONALCARD'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONVENIOVIDALINK: TFloatField
      FieldName = 'CONVENIOVIDALINK'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCLIENTEVIDALINK: TFloatField
      FieldName = 'CLIENTEVIDALINK'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVENCIMENTOVIDALINK: TFloatField
      FieldName = 'VENCIMENTOVIDALINK'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONVENIOFARMACIAPOPULAR: TFloatField
      FieldName = 'CONVENIOFARMACIAPOPULAR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCLIENTEFARMACIAPOPULAR: TFloatField
      FieldName = 'CLIENTEFARMACIAPOPULAR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVENCIMENTOFARMACIAPOPULAR: TFloatField
      FieldName = 'VENCIMENTOFARMACIAPOPULAR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosLOGINFARMACIAPOPULAR: TStringField
      FieldName = 'LOGINFARMACIAPOPULAR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosSENHAFARMACIAPOPULAR: TStringField
      FieldName = 'SENHAFARMACIAPOPULAR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosLOGINFIDELIZE: TStringField
      FieldName = 'LOGINFIDELIZE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosSENHAFIDELIZE: TStringField
      FieldName = 'SENHAFIDELIZE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosUSAIMS: TStringField
      FieldName = 'USAIMS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCHAVESINTEGRA: TStringField
      FieldName = 'CHAVESINTEGRA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SqlParametrosIMPRIMIRRESUMOECF: TStringField
      FieldName = 'IMPRIMIRRESUMOECF'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosIMPRIMIRVINCULADOPARAENTREGA: TStringField
      FieldName = 'IMPRIMIRVINCULADOPARAENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCODIGOIMS: TStringField
      FieldName = 'CODIGOIMS'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object SqlParametrosVALORPONTUACAO: TFloatField
      FieldName = 'VALORPONTUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPONTOSRESGATE: TIntegerField
      FieldName = 'PONTOSRESGATE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVALORRESGATE: TFloatField
      FieldName = 'VALORRESGATE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosSUBSTITUTOTRIBUTARIO: TStringField
      FieldName = 'SUBSTITUTOTRIBUTARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCONTRIBUINTE_IPI: TStringField
      FieldName = 'CONTRIBUINTE_IPI'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosPAF_LAUDO: TStringField
      FieldName = 'PAF_LAUDO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosPAF_CNPJ: TStringField
      FieldName = 'PAF_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object SqlParametrosPAF_IE: TStringField
      FieldName = 'PAF_IE'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object SqlParametrosPAF_IM: TStringField
      FieldName = 'PAF_IM'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object SqlParametrosPAF_RAZAO: TStringField
      FieldName = 'PAF_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPAF_ENDERECO: TStringField
      FieldName = 'PAF_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPAF_TELEFONE: TStringField
      FieldName = 'PAF_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosPAF_CONTATO: TStringField
      FieldName = 'PAF_CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPAF_NOMECOMERCIAL: TStringField
      FieldName = 'PAF_NOMECOMERCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPAF_VERSAO: TStringField
      FieldName = 'PAF_VERSAO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosPAF_EXECUTAVEL: TStringField
      FieldName = 'PAF_EXECUTAVEL'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPAF_MD5: TStringField
      FieldName = 'PAF_MD5'
      ProviderFlags = [pfInUpdate]
      Size = 1024
    end
    object SqlParametrosPAF_ERPAFECF: TStringField
      FieldName = 'PAF_ERPAFECF'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object SqlParametrosPAF_CHAVEPUBLICA: TStringField
      FieldName = 'PAF_CHAVEPUBLICA'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPAF_CHAVEPRIVADA: TStringField
      FieldName = 'PAF_CHAVEPRIVADA'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPAF_DATA: TStringField
      FieldName = 'PAF_DATA'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosEXIBECOMISSAOVENDA: TStringField
      FieldName = 'EXIBECOMISSAOVENDA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCONTROLALOTES: TStringField
      FieldName = 'CONTROLALOTES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCONCLUI_TRANSFERENCIAS: TStringField
      FieldName = 'CONCLUI_TRANSFERENCIAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosENVIA_TRANSFERENCIAS: TStringField
      FieldName = 'ENVIA_TRANSFERENCIAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCONFERENCIAVENDA: TStringField
      FieldName = 'CONFERENCIAVENDA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosUSARVENDEDORLOJA: TStringField
      FieldName = 'USARVENDEDORLOJA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCD_VENDEDORLOJA: TFloatField
      FieldName = 'CD_VENDEDORLOJA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPHARMALINKSENHA: TStringField
      FieldName = 'PHARMALINKSENHA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPHARMALINKURL: TStringField
      FieldName = 'PHARMALINKURL'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPHARMALINKIP: TStringField
      FieldName = 'PHARMALINKIP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object SqlParametrosDIASBLOQUEIOCLIENTE: TIntegerField
      FieldName = 'DIASBLOQUEIOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosEXIBIRVALORVENDA: TStringField
      FieldName = 'EXIBIRVALORVENDA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosLINHASAVANCO: TFloatField
      FieldName = 'LINHASAVANCO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosEXIBIRPRODUTOSRELACIONADOS: TStringField
      FieldName = 'EXIBIRPRODUTOSRELACIONADOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNOMEREDE: TStringField
      FieldName = 'NOMEREDE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCODIGOCLOSEUP: TStringField
      FieldName = 'CODIGOCLOSEUP'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosRECEBIMENTOPARCIALCONTA: TStringField
      FieldName = 'RECEBIMENTOPARCIALCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosSERVIDORLOJA: TStringField
      FieldName = 'SERVIDORLOJA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object SqlParametrosPERFIL: TStringField
      FieldName = 'PERFIL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCONTACUSTOVENDA: TFloatField
      FieldName = 'CONTACUSTOVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVIASVINCULADOENTRGA: TIntegerField
      FieldName = 'VIASVINCULADOENTRGA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosTEXTOPADRAOGARANTIA: TStringField
      FieldName = 'TEXTOPADRAOGARANTIA'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosVERSAO_GESTOR: TStringField
      FieldName = 'VERSAO_GESTOR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosVERSAO_LOJA: TStringField
      FieldName = 'VERSAO_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosDIASSEMVENDER: TIntegerField
      FieldName = 'DIASSEMVENDER'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosRESUMOCAIXA_ITEM_14: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_14'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNUMEROSERIECERTIFICADO: TStringField
      FieldName = 'NUMEROSERIECERTIFICADO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosNFEAMBIENTE: TStringField
      FieldName = 'NFEAMBIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNFECFOP: TFloatField
      FieldName = 'NFECFOP'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosNFECFOPTRANSFERENCIAENTRADA: TFloatField
      FieldName = 'NFECFOPTRANSFERENCIAENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosNFECFOPTRANSFERENCIASAIDA: TFloatField
      FieldName = 'NFECFOPTRANSFERENCIASAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosNFECFOPDEVOLUCAO: TFloatField
      FieldName = 'NFECFOPDEVOLUCAO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosNFECFOPENTRADA: TFloatField
      FieldName = 'NFECFOPENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosNFEULTIMANOTAEMITIDA: TStringField
      FieldName = 'NFEULTIMANOTAEMITIDA'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object SqlParametrosNFEULTIMOLOTEENVIADO: TStringField
      FieldName = 'NFEULTIMOLOTEENVIADO'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object SqlParametrosTIPO_TEF: TStringField
      FieldName = 'TIPO_TEF'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosARMAZENAPOSICAOESTOQUEDATA: TStringField
      FieldName = 'ARMAZENAPOSICAOESTOQUEDATA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCONTADORNOME: TStringField
      FieldName = 'CONTADORNOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCONTADORCPF: TStringField
      FieldName = 'CONTADORCPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object SqlParametrosCONTADORCRC: TStringField
      FieldName = 'CONTADORCRC'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONTADORCNPJ: TStringField
      FieldName = 'CONTADORCNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object SqlParametrosCONTADORENDERECO: TStringField
      FieldName = 'CONTADORENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCONTADORNUMERO: TStringField
      FieldName = 'CONTADORNUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosCONTADORCOMPLEMENTO: TStringField
      FieldName = 'CONTADORCOMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCONTADORBAIRRO: TStringField
      FieldName = 'CONTADORBAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCONTADORCEP: TStringField
      FieldName = 'CONTADORCEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object SqlParametrosCONTADORTELEFONE: TStringField
      FieldName = 'CONTADORTELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosCONTADORFAX: TStringField
      FieldName = 'CONTADORFAX'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosCONTADOREMAIL: TStringField
      FieldName = 'CONTADOREMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCONTADORCD_MUNICIPIO: TStringField
      FieldName = 'CONTADORCD_MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosACODEURL: TStringField
      FieldName = 'ACODEURL'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosACODEUSUARIO: TStringField
      FieldName = 'ACODEUSUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosACODESENHA: TStringField
      FieldName = 'ACODESENHA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosPHARMALINKUSUARIO: TStringField
      FieldName = 'PHARMALINKUSUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosICMSINTERESTADUALSIMPLES: TFMTBCDField
      FieldName = 'ICMSINTERESTADUALSIMPLES'
      ProviderFlags = [pfInUpdate]
      Precision = 19
      Size = 2
    end
    object SqlParametrosICMSINTERESTADUALREDUZIDO: TFMTBCDField
      FieldName = 'ICMSINTERESTADUALREDUZIDO'
      ProviderFlags = [pfInUpdate]
      Precision = 19
      Size = 2
    end
    object SqlParametrosSERIENOTANFE: TStringField
      FieldName = 'SERIENOTANFE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object SqlParametrosSERVIDORCALLCENTER: TStringField
      FieldName = 'SERVIDORCALLCENTER'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosPREENCHERRECEITACONTROLADO: TStringField
      FieldName = 'PREENCHERRECEITACONTROLADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosSMSTECNICO: TStringField
      FieldName = 'SMSTECNICO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosSMSGERENCIAL: TStringField
      FieldName = 'SMSGERENCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosUSATECBAN: TStringField
      FieldName = 'USATECBAN'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosUSAHIPERCARD: TStringField
      FieldName = 'USAHIPERCARD'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosUSAREDECARDAMEXVISA: TStringField
      FieldName = 'USAREDECARDAMEXVISA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosABREFINALIZACAOBALCAO: TStringField
      FieldName = 'ABREFINALIZACAOBALCAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosEXIBECUSTOBALCAO: TStringField
      FieldName = 'EXIBECUSTOBALCAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCRT: TStringField
      FieldName = 'CRT'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosEXPORTANOTASSNGPC: TStringField
      FieldName = 'EXPORTANOTASSNGPC'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosTRATANDOPREVENDASEMABERTOPAF: TStringField
      FieldName = 'TRATANDOPREVENDASEMABERTOPAF'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosFTPENDERECO: TStringField
      FieldName = 'FTPENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 99
    end
    object SqlParametrosFTPUSUARIO: TStringField
      FieldName = 'FTPUSUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 99
    end
    object SqlParametrosFTPSENHA: TStringField
      FieldName = 'FTPSENHA'
      ProviderFlags = [pfInUpdate]
      Size = 99
    end
    object SqlParametrosCLIENTEORIZON: TFloatField
      FieldName = 'CLIENTEORIZON'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONVENIOORIZON: TFloatField
      FieldName = 'CONVENIOORIZON'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosNFECFOPDEVOLUCAOCOMPRA: TFloatField
      FieldName = 'NFECFOPDEVOLUCAOCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosDIAS_CARENCIA_JUROS_CR: TIntegerField
      FieldName = 'DIAS_CARENCIA_JUROS_CR'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosENQUADRAMENTOTRIBUTARIO: TStringField
      FieldName = 'ENQUADRAMENTOTRIBUTARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosRECEBECREDITOCONTASRECEBER: TStringField
      FieldName = 'RECEBECREDITOCONTASRECEBER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNFEFORNECEDORDEVOLUCAOVENDA: TFloatField
      FieldName = 'NFEFORNECEDORDEVOLUCAOVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCLIENTEPHARMASYSTEM: TFloatField
      FieldName = 'CLIENTEPHARMASYSTEM'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONVENIOPHARMASYSTEM: TFloatField
      FieldName = 'CONVENIOPHARMASYSTEM'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosSENHAPHARMASYSTEM: TStringField
      FieldName = 'SENHAPHARMASYSTEM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosCONCESSAOCREDITOS: TStringField
      FieldName = 'CONCESSAOCREDITOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNFETIPOEMISSAO: TStringField
      FieldName = 'NFETIPOEMISSAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosSERIENOTANFESCAN: TStringField
      FieldName = 'SERIENOTANFESCAN'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosNFEULTIMANOTAEMITIDASCAN: TStringField
      FieldName = 'NFEULTIMANOTAEMITIDASCAN'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object SqlParametrosVERSAONFE: TIntegerField
      FieldName = 'VERSAONFE'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosUSACONFERENCIABALCAO: TStringField
      FieldName = 'USACONFERENCIABALCAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNFCEAMBIENTE: TStringField
      FieldName = 'NFCEAMBIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosNFCENOTA: TStringField
      FieldName = 'NFCENOTA'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object SqlParametrosNFCELOTE: TStringField
      FieldName = 'NFCELOTE'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object SqlParametrosNFCESERIE: TStringField
      FieldName = 'NFCESERIE'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object SqlParametrosNFCECIDTOKEN: TStringField
      FieldName = 'NFCECIDTOKEN'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object SqlParametrosNFCETOKEN: TStringField
      FieldName = 'NFCETOKEN'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosNFEPERCENTUALCREDITOSN: TFloatField
      FieldName = 'NFEPERCENTUALCREDITOSN'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosPORTA_SMTP: TStringField
      FieldName = 'PORTA_SMTP'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SqlParametrosPHARMALINKDIRETORIOENVIO: TStringField
      FieldName = 'PHARMALINKDIRETORIOENVIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosPHARMALINKDIRETORIORETORNO: TStringField
      FieldName = 'PHARMALINKDIRETORIORETORNO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosPISALIQUOTA: TFMTBCDField
      FieldName = 'PISALIQUOTA'
      ProviderFlags = [pfInUpdate]
      Precision = 19
      Size = 2
    end
    object SqlParametrosCOFINSALIQUOTA: TFMTBCDField
      FieldName = 'COFINSALIQUOTA'
      ProviderFlags = [pfInUpdate]
      Precision = 19
      Size = 2
    end
    object SqlParametrosAVISOPREVENDAABERTA: TStringField
      FieldName = 'AVISOPREVENDAABERTA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosTEMPOAVISOPREVENDAABERTA: TIntegerField
      FieldName = 'TEMPOAVISOPREVENDAABERTA'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosFIDELIZEFTPHOST: TStringField
      FieldName = 'FIDELIZEFTPHOST'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object SqlParametrosFIDELIZEFTPUSUARIO: TStringField
      FieldName = 'FIDELIZEFTPUSUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosFIDELIZEFTPSENHA: TStringField
      FieldName = 'FIDELIZEFTPSENHA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosUSACONSULTAPRODUTOSPBM: TStringField
      FieldName = 'USACONSULTAPRODUTOSPBM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosWSCONVENIOURL: TStringField
      FieldName = 'WSCONVENIOURL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosWSCONVENIOCODIGOACESSO: TStringField
      FieldName = 'WSCONVENIOCODIGOACESSO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosWSCONVENIOSENHA: TStringField
      FieldName = 'WSCONVENIOSENHA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosWSCONVENIOOPERADOR: TStringField
      FieldName = 'WSCONVENIOOPERADOR'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosWSCONVENIOTOKEN: TStringField
      FieldName = 'WSCONVENIOTOKEN'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SqlParametrosEXIBEIMAGEMPRODUTO: TStringField
      FieldName = 'EXIBEIMAGEMPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object SqlParametrosCLIENTEWSCONVENIO: TFloatField
      FieldName = 'CLIENTEWSCONVENIO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosCONVENIOWSCONVENIO: TFloatField
      FieldName = 'CONVENIOWSCONVENIO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlParametrosTEFCNPJCREDENCIADORA: TStringField
      FieldName = 'TEFCNPJCREDENCIADORA'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
  end
  object DspParametros: TDataSetProvider
    DataSet = SqlParametros
    Left = 32
    Top = 88
  end
  object CdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametros'
    Left = 32
    Top = 128
    object CdsParametrosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object CdsParametrosTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
    object CdsParametrosCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Size = 4
    end
    object CdsParametrosNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 30
    end
    object CdsParametrosRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 40
    end
    object CdsParametrosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object CdsParametrosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsParametrosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object CdsParametrosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsParametrosCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object CdsParametrosCX_POSTAL: TStringField
      FieldName = 'CX_POSTAL'
      Size = 5
    end
    object CdsParametrosCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object CdsParametrosINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object CdsParametrosFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object CdsParametrosFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object CdsParametrosINSC_MUNIC: TStringField
      FieldName = 'INSC_MUNIC'
      Size = 10
    end
    object CdsParametrosURL1: TStringField
      FieldName = 'URL1'
      Size = 1000
    end
    object CdsParametrosURL2: TStringField
      FieldName = 'URL2'
      Size = 1000
    end
    object CdsParametrosURL3: TStringField
      FieldName = 'URL3'
      Size = 1000
    end
    object CdsParametrosURL4: TStringField
      FieldName = 'URL4'
      Size = 1000
    end
    object CdsParametrosURL5: TStringField
      FieldName = 'URL5'
      Size = 1000
    end
    object CdsParametrosMENS_PROM2: TStringField
      FieldName = 'MENS_PROM2'
      Size = 48
    end
    object CdsParametrosMENS_PROM3: TStringField
      FieldName = 'MENS_PROM3'
      Size = 48
    end
    object CdsParametrosMENS_PROM4: TStringField
      FieldName = 'MENS_PROM4'
      Size = 48
    end
    object CdsParametrosMENS_PROM5: TStringField
      FieldName = 'MENS_PROM5'
      Size = 48
    end
    object CdsParametrosFOTO: TStringField
      FieldName = 'FOTO'
      Size = 1
    end
    object CdsParametrosCAMINHOMATRIZ: TStringField
      FieldName = 'CAMINHOMATRIZ'
      Size = 255
    end
    object CdsParametrosCUSTO_OPERACIONAL: TFloatField
      FieldName = 'CUSTO_OPERACIONAL'
    end
    object CdsParametrosPERCENTUAL_SIMPLES: TFloatField
      FieldName = 'PERCENTUAL_SIMPLES'
    end
    object CdsParametrosCALCULO_CUSTO: TStringField
      FieldName = 'CALCULO_CUSTO'
      Size = 1
    end
    object CdsParametrosCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 50
    end
    object CdsParametrosCONTRA_CHAVE: TStringField
      FieldName = 'CONTRA_CHAVE'
      Size = 50
    end
    object CdsParametrosDT_IMPLANTACAO: TStringField
      FieldName = 'DT_IMPLANTACAO'
      Size = 50
    end
    object CdsParametrosDT_AUTENTICACAO: TStringField
      FieldName = 'DT_AUTENTICACAO'
      Size = 50
    end
    object CdsParametrosCD_IMPRESSORA: TFloatField
      FieldName = 'CD_IMPRESSORA'
    end
    object CdsParametrosETIQUETA_TIPO: TFloatField
      FieldName = 'ETIQUETA_TIPO'
    end
    object CdsParametrosETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 40
    end
    object CdsParametrosDESCONTOMAXIMO: TFloatField
      FieldName = 'DESCONTOMAXIMO'
    end
    object CdsParametrosIMPRIME_PREVENDA: TStringField
      FieldName = 'IMPRIME_PREVENDA'
      Size = 1
    end
    object CdsParametrosPREVENDA: TStringField
      FieldName = 'PREVENDA'
      Size = 1
    end
    object CdsParametrosDESCONTOGERENTE: TFloatField
      FieldName = 'DESCONTOGERENTE'
    end
    object CdsParametrosNVIASCUPOMENTREGA: TFloatField
      FieldName = 'NVIASCUPOMENTREGA'
    end
    object CdsParametrosTEMPODESCANSO: TFloatField
      FieldName = 'TEMPODESCANSO'
    end
    object CdsParametrosCHAVEF10: TStringField
      FieldName = 'CHAVEF10'
      Size = 50
    end
    object CdsParametrosRESUMOCAIXA_ITEM_1: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_1'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_2: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_2'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_3: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_3'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_4: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_4'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_5: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_5'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_6: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_6'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_7: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_7'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_8: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_8'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_9: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_9'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_10: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_10'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_11: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_11'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_12: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_12'
      Size = 1
    end
    object CdsParametrosIMPRIMEORCAMENTO: TStringField
      FieldName = 'IMPRIMEORCAMENTO'
      Size = 1
    end
    object CdsParametrosTIPODESCONTO: TStringField
      FieldName = 'TIPODESCONTO'
      Size = 1
    end
    object CdsParametrosURLCOTACOES: TStringField
      FieldName = 'URLCOTACOES'
      Size = 100
    end
    object CdsParametrosSMTP: TStringField
      FieldName = 'SMTP'
      Size = 100
    end
    object CdsParametrosUSUARIO_SMTP: TStringField
      FieldName = 'USUARIO_SMTP'
      Size = 100
    end
    object CdsParametrosSENHA_SMTP: TStringField
      FieldName = 'SENHA_SMTP'
      Size = 50
    end
    object CdsParametrosNAOFISCAL: TFloatField
      FieldName = 'NAOFISCAL'
    end
    object CdsParametrosETIQUETAS_PRN: TFloatField
      FieldName = 'ETIQUETAS_PRN'
    end
    object CdsParametrosVENDEESTOQUENEGATIVO: TStringField
      FieldName = 'VENDEESTOQUENEGATIVO'
      Size = 1
    end
    object CdsParametrosPEDECRMBALCAO: TStringField
      FieldName = 'PEDECRMBALCAO'
      Size = 1
    end
    object CdsParametrosPEDECRMCHECKOUT: TStringField
      FieldName = 'PEDECRMCHECKOUT'
      Size = 1
    end
    object CdsParametrosGERARCR_TRANSFER: TStringField
      FieldName = 'GERARCR_TRANSFER'
      Size = 1
    end
    object CdsParametrosGERARCP_TRANSFER: TStringField
      FieldName = 'GERARCP_TRANSFER'
      Size = 1
    end
    object CdsParametrosLIMITEDECREDITO: TFloatField
      FieldName = 'LIMITEDECREDITO'
    end
    object CdsParametrosSERVIDORMATRIZ: TStringField
      FieldName = 'SERVIDORMATRIZ'
      Size = 100
    end
    object CdsParametrosESTOQUEMINIMO: TStringField
      FieldName = 'ESTOQUEMINIMO'
      Size = 1
    end
    object CdsParametrosNVIASTRANSFERENCIA: TFloatField
      FieldName = 'NVIASTRANSFERENCIA'
    end
    object CdsParametrosUTILIZAPERFUMISTA: TStringField
      FieldName = 'UTILIZAPERFUMISTA'
      Size = 1
    end
    object CdsParametrosDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
    end
    object CdsParametrosABREENTREGA: TStringField
      FieldName = 'ABREENTREGA'
      Size = 1
    end
    object CdsParametrosCUPOMDETALHADOPREVENDA: TStringField
      FieldName = 'CUPOMDETALHADOPREVENDA'
      Size = 1
    end
    object CdsParametrosPARCELAVENDAS: TStringField
      FieldName = 'PARCELAVENDAS'
      Size = 1
    end
    object CdsParametrosDESCONTOOPERADORCALLCENTER: TFloatField
      FieldName = 'DESCONTOOPERADORCALLCENTER'
    end
    object CdsParametrosDESCONTOGERENTECALLCENTER: TFloatField
      FieldName = 'DESCONTOGERENTECALLCENTER'
    end
    object CdsParametrosPRECIFICACAO_UNICA: TStringField
      FieldName = 'PRECIFICACAO_UNICA'
      Size = 1
    end
    object CdsParametrosCOLUNASIMPRESSORANAOFISCAL: TFloatField
      FieldName = 'COLUNASIMPRESSORANAOFISCAL'
    end
    object CdsParametrosMANTEMDESCRICAOPRODUTO: TStringField
      FieldName = 'MANTEMDESCRICAOPRODUTO'
      Size = 1
    end
    object CdsParametrosINSTRUCOESBOLETO: TStringField
      FieldName = 'INSTRUCOESBOLETO'
      Size = 1000
    end
    object CdsParametrosUSATEF: TStringField
      FieldName = 'USATEF'
      Size = 1
    end
    object CdsParametrosTEFTEMPOESPERA: TFloatField
      FieldName = 'TEFTEMPOESPERA'
    end
    object CdsParametrosTEFTEMPOMENSAGEM: TFloatField
      FieldName = 'TEFTEMPOMENSAGEM'
    end
    object CdsParametrosCONTROLEMEDICAMENTO: TStringField
      FieldName = 'CONTROLEMEDICAMENTO'
      Size = 1
    end
    object CdsParametrosCONSULTACHEQUE: TStringField
      FieldName = 'CONSULTACHEQUE'
      Size = 10
    end
    object CdsParametrosIDENTIFICARCLIENTE: TStringField
      FieldName = 'IDENTIFICARCLIENTE'
      Size = 1
    end
    object CdsParametrosPERIODO_VENCIMENTO: TFloatField
      FieldName = 'PERIODO_VENCIMENTO'
    end
    object CdsParametrosPERIODO_VENCIMENTO_VENDAS: TFloatField
      FieldName = 'PERIODO_VENCIMENTO_VENDAS'
    end
    object CdsParametrosIDENTIFICAVENDAMANUAL: TStringField
      FieldName = 'IDENTIFICAVENDAMANUAL'
      Size = 1
    end
    object CdsParametrosTRABALHARCAIXADIAANTERIOR: TStringField
      FieldName = 'TRABALHARCAIXADIAANTERIOR'
      Size = 1
    end
    object CdsParametrosUSAPRECOCONCORRENTE: TStringField
      FieldName = 'USAPRECOCONCORRENTE'
      Size = 1
    end
    object CdsParametrosPRECOPROMOCAOAUTOMATICO: TStringField
      FieldName = 'PRECOPROMOCAOAUTOMATICO'
      Size = 1
    end
    object CdsParametrosCOMPROVANTEFIADO: TStringField
      FieldName = 'COMPROVANTEFIADO'
      Size = 1
    end
    object CdsParametrosMANTEMDESCRICAOPRODUTOCOMPRA: TStringField
      FieldName = 'MANTEMDESCRICAOPRODUTOCOMPRA'
      Size = 1
    end
    object CdsParametrosFARMACEUTICONOME: TStringField
      FieldName = 'FARMACEUTICONOME'
      Size = 100
    end
    object CdsParametrosFARMACEUTICOCPF: TStringField
      FieldName = 'FARMACEUTICOCPF'
      Size = 13
    end
    object CdsParametrosFARMACEUTICOCRF: TStringField
      FieldName = 'FARMACEUTICOCRF'
      Size = 10
    end
    object CdsParametrosFARMACEUTICOUF: TFloatField
      FieldName = 'FARMACEUTICOUF'
    end
    object CdsParametrosDATA_ULTIMA_TRANSMISSAO_SNGPC: TDateField
      FieldName = 'DATA_ULTIMA_TRANSMISSAO_SNGPC'
    end
    object CdsParametrosALTERAMARGEMNOTA: TStringField
      FieldName = 'ALTERAMARGEMNOTA'
      Size = 1
    end
    object CdsParametrosSOMAIPI: TStringField
      FieldName = 'SOMAIPI'
      Size = 1
    end
    object CdsParametrosCAMINHOAUTENTICACAO: TStringField
      FieldName = 'CAMINHOAUTENTICACAO'
      Size = 100
    end
    object CdsParametrosPEDIRSENHAVENDEDOR: TStringField
      FieldName = 'PEDIRSENHAVENDEDOR'
      Size = 13
    end
    object CdsParametrosVENDASDINHEIRO: TStringField
      FieldName = 'VENDASDINHEIRO'
      Size = 1
    end
    object CdsParametrosVENDASCARTAO: TStringField
      FieldName = 'VENDASCARTAO'
      Size = 1
    end
    object CdsParametrosVENDASCONVENIO: TStringField
      FieldName = 'VENDASCONVENIO'
      Size = 1
    end
    object CdsParametrosVENDASCHEQUEPRE: TStringField
      FieldName = 'VENDASCHEQUEPRE'
      Size = 1
    end
    object CdsParametrosVENDASCREDITO: TStringField
      FieldName = 'VENDASCREDITO'
      Size = 1
    end
    object CdsParametrosVENDASCHEQUEAVISTA: TStringField
      FieldName = 'VENDASCHEQUEAVISTA'
      Size = 1
    end
    object CdsParametrosOUTROSRECEBIMENTOS: TStringField
      FieldName = 'OUTROSRECEBIMENTOS'
      Size = 1
    end
    object CdsParametrosSAIDAS: TStringField
      FieldName = 'SAIDAS'
      Size = 1
    end
    object CdsParametrosBAIXAAUTOMATICACHEQUEPRE: TStringField
      FieldName = 'BAIXAAUTOMATICACHEQUEPRE'
      Size = 1
    end
    object CdsParametrosPERCENTUALPREMIACAO: TFloatField
      FieldName = 'PERCENTUALPREMIACAO'
    end
    object CdsParametrosVALORMINIMOPREMIACAO: TFloatField
      FieldName = 'VALORMINIMOPREMIACAO'
    end
    object CdsParametrosPERCENTUALJUROSCONTASRECEBER: TFloatField
      FieldName = 'PERCENTUALJUROSCONTASRECEBER'
    end
    object CdsParametrosCD_CONTA_BAIXA_CHEQUE: TFloatField
      FieldName = 'CD_CONTA_BAIXA_CHEQUE'
    end
    object CdsParametrosINSTANCIAMULTIPLA: TStringField
      FieldName = 'INSTANCIAMULTIPLA'
      Size = 1
    end
    object CdsParametrosDESCONTOGRUPOSOBRECONVENIO: TStringField
      FieldName = 'DESCONTOGRUPOSOBRECONVENIO'
      Size = 1
    end
    object CdsParametrosRESUMOCAIXA_ITEM_13: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_13'
      Size = 1
    end
    object CdsParametrosRESGATAPREVENDA: TStringField
      FieldName = 'RESGATAPREVENDA'
      Size = 1
    end
    object CdsParametrosVALORALERTASANGRIA: TFloatField
      FieldName = 'VALORALERTASANGRIA'
    end
    object CdsParametrosVENDEDORAUTOMATICO: TFloatField
      FieldName = 'VENDEDORAUTOMATICO'
    end
    object CdsParametrosDISCRIMINARDESCONTOCUPOM: TStringField
      FieldName = 'DISCRIMINARDESCONTOCUPOM'
      Size = 1
    end
    object CdsParametrosPROMOCAODESCONTOCUPOM: TStringField
      FieldName = 'PROMOCAODESCONTOCUPOM'
      Size = 1
    end
    object CdsParametrosUSAGUILHOTINA: TStringField
      FieldName = 'USAGUILHOTINA'
      Size = 1
    end
    object CdsParametrosCONVENIOTRN: TFloatField
      FieldName = 'CONVENIOTRN'
    end
    object CdsParametrosCLIENTETRN: TFloatField
      FieldName = 'CLIENTETRN'
    end
    object CdsParametrosVENCIMENTOTRN: TFloatField
      FieldName = 'VENCIMENTOTRN'
    end
    object CdsParametrosCONVENIOEPHARMA: TFloatField
      FieldName = 'CONVENIOEPHARMA'
    end
    object CdsParametrosCLIENTEEPHARMA: TFloatField
      FieldName = 'CLIENTEEPHARMA'
    end
    object CdsParametrosVENCIMENTOEPHARMA: TFloatField
      FieldName = 'VENCIMENTOEPHARMA'
    end
    object CdsParametrosCONVENIOFUNCIONALCARD: TFloatField
      FieldName = 'CONVENIOFUNCIONALCARD'
    end
    object CdsParametrosCLIENTEFUNCIONALCARD: TFloatField
      FieldName = 'CLIENTEFUNCIONALCARD'
    end
    object CdsParametrosVENCIMENTOFUNCIONALCARD: TFloatField
      FieldName = 'VENCIMENTOFUNCIONALCARD'
    end
    object CdsParametrosCONVENIOVIDALINK: TFloatField
      FieldName = 'CONVENIOVIDALINK'
    end
    object CdsParametrosCLIENTEVIDALINK: TFloatField
      FieldName = 'CLIENTEVIDALINK'
    end
    object CdsParametrosVENCIMENTOVIDALINK: TFloatField
      FieldName = 'VENCIMENTOVIDALINK'
    end
    object CdsParametrosCONVENIOFARMACIAPOPULAR: TFloatField
      FieldName = 'CONVENIOFARMACIAPOPULAR'
    end
    object CdsParametrosCLIENTEFARMACIAPOPULAR: TFloatField
      FieldName = 'CLIENTEFARMACIAPOPULAR'
    end
    object CdsParametrosVENCIMENTOFARMACIAPOPULAR: TFloatField
      FieldName = 'VENCIMENTOFARMACIAPOPULAR'
    end
    object CdsParametrosLOGINFARMACIAPOPULAR: TStringField
      FieldName = 'LOGINFARMACIAPOPULAR'
    end
    object CdsParametrosSENHAFARMACIAPOPULAR: TStringField
      FieldName = 'SENHAFARMACIAPOPULAR'
    end
    object CdsParametrosLOGINFIDELIZE: TStringField
      FieldName = 'LOGINFIDELIZE'
      Size = 100
    end
    object CdsParametrosSENHAFIDELIZE: TStringField
      FieldName = 'SENHAFIDELIZE'
      Size = 100
    end
    object CdsParametrosUSAIMS: TStringField
      FieldName = 'USAIMS'
      Size = 1
    end
    object CdsParametrosCHAVESINTEGRA: TStringField
      FieldName = 'CHAVESINTEGRA'
      Size = 50
    end
    object CdsParametrosIMPRIMIRRESUMOECF: TStringField
      FieldName = 'IMPRIMIRRESUMOECF'
      Size = 1
    end
    object CdsParametrosIMPRIMIRVINCULADOPARAENTREGA: TStringField
      FieldName = 'IMPRIMIRVINCULADOPARAENTREGA'
      Size = 1
    end
    object CdsParametrosCODIGOIMS: TStringField
      FieldName = 'CODIGOIMS'
      Size = 4
    end
    object CdsParametrosVALORPONTUACAO: TFloatField
      FieldName = 'VALORPONTUACAO'
    end
    object CdsParametrosPONTOSRESGATE: TIntegerField
      FieldName = 'PONTOSRESGATE'
    end
    object CdsParametrosVALORRESGATE: TFloatField
      FieldName = 'VALORRESGATE'
    end
    object CdsParametrosSUBSTITUTOTRIBUTARIO: TStringField
      FieldName = 'SUBSTITUTOTRIBUTARIO'
      Size = 1
    end
    object CdsParametrosCONTRIBUINTE_IPI: TStringField
      FieldName = 'CONTRIBUINTE_IPI'
      Size = 1
    end
    object CdsParametrosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object CdsParametrosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object CdsParametrosCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object CdsParametrosPAF_LAUDO: TStringField
      FieldName = 'PAF_LAUDO'
      Size = 100
    end
    object CdsParametrosPAF_CNPJ: TStringField
      FieldName = 'PAF_CNPJ'
      Size = 14
    end
    object CdsParametrosPAF_IE: TStringField
      FieldName = 'PAF_IE'
      Size = 14
    end
    object CdsParametrosPAF_IM: TStringField
      FieldName = 'PAF_IM'
      Size = 14
    end
    object CdsParametrosPAF_RAZAO: TStringField
      FieldName = 'PAF_RAZAO'
      Size = 1000
    end
    object CdsParametrosPAF_ENDERECO: TStringField
      FieldName = 'PAF_ENDERECO'
      Size = 1000
    end
    object CdsParametrosPAF_TELEFONE: TStringField
      FieldName = 'PAF_TELEFONE'
      Size = 10
    end
    object CdsParametrosPAF_CONTATO: TStringField
      FieldName = 'PAF_CONTATO'
      Size = 1000
    end
    object CdsParametrosPAF_NOMECOMERCIAL: TStringField
      FieldName = 'PAF_NOMECOMERCIAL'
      Size = 1000
    end
    object CdsParametrosPAF_VERSAO: TStringField
      FieldName = 'PAF_VERSAO'
      Size = 10
    end
    object CdsParametrosPAF_EXECUTAVEL: TStringField
      FieldName = 'PAF_EXECUTAVEL'
      Size = 1000
    end
    object CdsParametrosPAF_MD5: TStringField
      FieldName = 'PAF_MD5'
      Size = 1024
    end
    object CdsParametrosPAF_ERPAFECF: TStringField
      FieldName = 'PAF_ERPAFECF'
      Size = 4
    end
    object CdsParametrosPAF_CHAVEPUBLICA: TStringField
      FieldName = 'PAF_CHAVEPUBLICA'
      Size = 1000
    end
    object CdsParametrosPAF_CHAVEPRIVADA: TStringField
      FieldName = 'PAF_CHAVEPRIVADA'
      Size = 1000
    end
    object CdsParametrosPAF_DATA: TStringField
      FieldName = 'PAF_DATA'
      Size = 1000
    end
    object CdsParametrosEXIBECOMISSAOVENDA: TStringField
      FieldName = 'EXIBECOMISSAOVENDA'
      Size = 1
    end
    object CdsParametrosCONTROLALOTES: TStringField
      FieldName = 'CONTROLALOTES'
      Size = 1
    end
    object CdsParametrosCONCLUI_TRANSFERENCIAS: TStringField
      FieldName = 'CONCLUI_TRANSFERENCIAS'
      Size = 1
    end
    object CdsParametrosENVIA_TRANSFERENCIAS: TStringField
      FieldName = 'ENVIA_TRANSFERENCIAS'
      Size = 1
    end
    object CdsParametrosCONFERENCIAVENDA: TStringField
      FieldName = 'CONFERENCIAVENDA'
      Size = 1
    end
    object CdsParametrosUSARVENDEDORLOJA: TStringField
      FieldName = 'USARVENDEDORLOJA'
      Size = 1
    end
    object CdsParametrosCD_VENDEDORLOJA: TFloatField
      FieldName = 'CD_VENDEDORLOJA'
    end
    object CdsParametrosPHARMALINKSENHA: TStringField
      FieldName = 'PHARMALINKSENHA'
    end
    object CdsParametrosPHARMALINKURL: TStringField
      FieldName = 'PHARMALINKURL'
      Size = 1000
    end
    object CdsParametrosPHARMALINKIP: TStringField
      FieldName = 'PHARMALINKIP'
      Size = 15
    end
    object CdsParametrosDIASBLOQUEIOCLIENTE: TIntegerField
      FieldName = 'DIASBLOQUEIOCLIENTE'
    end
    object CdsParametrosEXIBIRVALORVENDA: TStringField
      FieldName = 'EXIBIRVALORVENDA'
      Size = 1
    end
    object CdsParametrosLINHASAVANCO: TFloatField
      FieldName = 'LINHASAVANCO'
    end
    object CdsParametrosEXIBIRPRODUTOSRELACIONADOS: TStringField
      FieldName = 'EXIBIRPRODUTOSRELACIONADOS'
      Size = 1
    end
    object CdsParametrosNOMEREDE: TStringField
      FieldName = 'NOMEREDE'
      Size = 100
    end
    object CdsParametrosCODIGOCLOSEUP: TStringField
      FieldName = 'CODIGOCLOSEUP'
      Size = 10
    end
    object CdsParametrosRECEBIMENTOPARCIALCONTA: TStringField
      FieldName = 'RECEBIMENTOPARCIALCONTA'
      Size = 1
    end
    object CdsParametrosSERVIDORLOJA: TStringField
      FieldName = 'SERVIDORLOJA'
      Size = 100
    end
    object CdsParametrosCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 7
    end
    object CdsParametrosPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 1
    end
    object CdsParametrosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object CdsParametrosCONTACUSTOVENDA: TFloatField
      FieldName = 'CONTACUSTOVENDA'
    end
    object CdsParametrosVIASVINCULADOENTRGA: TIntegerField
      FieldName = 'VIASVINCULADOENTRGA'
    end
    object CdsParametrosTEXTOPADRAOGARANTIA: TStringField
      FieldName = 'TEXTOPADRAOGARANTIA'
      Size = 1000
    end
    object CdsParametrosVERSAO_GESTOR: TStringField
      FieldName = 'VERSAO_GESTOR'
    end
    object CdsParametrosVERSAO_LOJA: TStringField
      FieldName = 'VERSAO_LOJA'
    end
    object CdsParametrosDIASSEMVENDER: TIntegerField
      FieldName = 'DIASSEMVENDER'
    end
    object CdsParametrosRESUMOCAIXA_ITEM_14: TStringField
      FieldName = 'RESUMOCAIXA_ITEM_14'
      Size = 1
    end
    object CdsParametrosNUMEROSERIECERTIFICADO: TStringField
      FieldName = 'NUMEROSERIECERTIFICADO'
      Size = 100
    end
    object CdsParametrosNFEAMBIENTE: TStringField
      FieldName = 'NFEAMBIENTE'
      Size = 1
    end
    object CdsParametrosNFECFOP: TFloatField
      FieldName = 'NFECFOP'
    end
    object CdsParametrosNFECFOPTRANSFERENCIAENTRADA: TFloatField
      FieldName = 'NFECFOPTRANSFERENCIAENTRADA'
    end
    object CdsParametrosNFECFOPTRANSFERENCIASAIDA: TFloatField
      FieldName = 'NFECFOPTRANSFERENCIASAIDA'
    end
    object CdsParametrosNFECFOPDEVOLUCAO: TFloatField
      FieldName = 'NFECFOPDEVOLUCAO'
    end
    object CdsParametrosNFECFOPENTRADA: TFloatField
      FieldName = 'NFECFOPENTRADA'
    end
    object CdsParametrosNFEULTIMANOTAEMITIDA: TStringField
      FieldName = 'NFEULTIMANOTAEMITIDA'
      Size = 12
    end
    object CdsParametrosNFEULTIMOLOTEENVIADO: TStringField
      FieldName = 'NFEULTIMOLOTEENVIADO'
      Size = 12
    end
    object CdsParametrosTIPO_TEF: TStringField
      FieldName = 'TIPO_TEF'
      Size = 1
    end
    object CdsParametrosCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsParametrosARMAZENAPOSICAOESTOQUEDATA: TStringField
      FieldName = 'ARMAZENAPOSICAOESTOQUEDATA'
      Size = 1
    end
    object CdsParametrosCONTADORNOME: TStringField
      FieldName = 'CONTADORNOME'
      Size = 100
    end
    object CdsParametrosCONTADORCPF: TStringField
      FieldName = 'CONTADORCPF'
      Size = 11
    end
    object CdsParametrosCONTADORCRC: TStringField
      FieldName = 'CONTADORCRC'
    end
    object CdsParametrosCONTADORCNPJ: TStringField
      FieldName = 'CONTADORCNPJ'
      Size = 14
    end
    object CdsParametrosCONTADORENDERECO: TStringField
      FieldName = 'CONTADORENDERECO'
      Size = 100
    end
    object CdsParametrosCONTADORNUMERO: TStringField
      FieldName = 'CONTADORNUMERO'
      Size = 10
    end
    object CdsParametrosCONTADORCOMPLEMENTO: TStringField
      FieldName = 'CONTADORCOMPLEMENTO'
      Size = 100
    end
    object CdsParametrosCONTADORBAIRRO: TStringField
      FieldName = 'CONTADORBAIRRO'
      Size = 100
    end
    object CdsParametrosCONTADORCEP: TStringField
      FieldName = 'CONTADORCEP'
      Size = 8
    end
    object CdsParametrosCONTADORTELEFONE: TStringField
      FieldName = 'CONTADORTELEFONE'
      Size = 10
    end
    object CdsParametrosCONTADORFAX: TStringField
      FieldName = 'CONTADORFAX'
      Size = 10
    end
    object CdsParametrosCONTADOREMAIL: TStringField
      FieldName = 'CONTADOREMAIL'
      Size = 100
    end
    object CdsParametrosCONTADORCD_MUNICIPIO: TStringField
      FieldName = 'CONTADORCD_MUNICIPIO'
      Size = 10
    end
    object CdsParametrosCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 1000
    end
    object CdsParametrosACODEURL: TStringField
      FieldName = 'ACODEURL'
      Size = 1000
    end
    object CdsParametrosACODEUSUARIO: TStringField
      FieldName = 'ACODEUSUARIO'
      Size = 100
    end
    object CdsParametrosACODESENHA: TStringField
      FieldName = 'ACODESENHA'
      Size = 100
    end
    object CdsParametrosPHARMALINKUSUARIO: TStringField
      FieldName = 'PHARMALINKUSUARIO'
      Size = 100
    end
    object CdsParametrosICMSINTERESTADUALSIMPLES: TFMTBCDField
      FieldName = 'ICMSINTERESTADUALSIMPLES'
      Precision = 19
      Size = 2
    end
    object CdsParametrosICMSINTERESTADUALREDUZIDO: TFMTBCDField
      FieldName = 'ICMSINTERESTADUALREDUZIDO'
      Precision = 19
      Size = 2
    end
    object CdsParametrosSERIENOTANFE: TStringField
      FieldName = 'SERIENOTANFE'
      Size = 10
    end
    object CdsParametrosCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 4
    end
    object CdsParametrosSERVIDORCALLCENTER: TStringField
      FieldName = 'SERVIDORCALLCENTER'
      Size = 1000
    end
    object CdsParametrosPREENCHERRECEITACONTROLADO: TStringField
      FieldName = 'PREENCHERRECEITACONTROLADO'
      Size = 1
    end
    object CdsParametrosSMSTECNICO: TStringField
      FieldName = 'SMSTECNICO'
      Size = 100
    end
    object CdsParametrosSMSGERENCIAL: TStringField
      FieldName = 'SMSGERENCIAL'
      Size = 100
    end
    object CdsParametrosUSATECBAN: TStringField
      FieldName = 'USATECBAN'
      Size = 1
    end
    object CdsParametrosUSAHIPERCARD: TStringField
      FieldName = 'USAHIPERCARD'
      Size = 1
    end
    object CdsParametrosUSAREDECARDAMEXVISA: TStringField
      FieldName = 'USAREDECARDAMEXVISA'
      Size = 1
    end
    object CdsParametrosABREFINALIZACAOBALCAO: TStringField
      FieldName = 'ABREFINALIZACAOBALCAO'
      Size = 1
    end
    object CdsParametrosEXIBECUSTOBALCAO: TStringField
      FieldName = 'EXIBECUSTOBALCAO'
      Size = 1
    end
    object CdsParametrosCRT: TStringField
      FieldName = 'CRT'
      Size = 1
    end
    object CdsParametrosEXPORTANOTASSNGPC: TStringField
      FieldName = 'EXPORTANOTASSNGPC'
      Size = 1
    end
    object CdsParametrosTRATANDOPREVENDASEMABERTOPAF: TStringField
      FieldName = 'TRATANDOPREVENDASEMABERTOPAF'
      Size = 1
    end
    object CdsParametrosFTPENDERECO: TStringField
      FieldName = 'FTPENDERECO'
      Size = 99
    end
    object CdsParametrosFTPUSUARIO: TStringField
      FieldName = 'FTPUSUARIO'
      Size = 99
    end
    object CdsParametrosFTPSENHA: TStringField
      FieldName = 'FTPSENHA'
      Size = 99
    end
    object CdsParametrosCLIENTEORIZON: TFloatField
      FieldName = 'CLIENTEORIZON'
    end
    object CdsParametrosCONVENIOORIZON: TFloatField
      FieldName = 'CONVENIOORIZON'
    end
    object CdsParametrosNFECFOPDEVOLUCAOCOMPRA: TFloatField
      FieldName = 'NFECFOPDEVOLUCAOCOMPRA'
    end
    object CdsParametrosDIAS_CARENCIA_JUROS_CR: TIntegerField
      FieldName = 'DIAS_CARENCIA_JUROS_CR'
    end
    object CdsParametrosENQUADRAMENTOTRIBUTARIO: TStringField
      FieldName = 'ENQUADRAMENTOTRIBUTARIO'
      Size = 1
    end
    object CdsParametrosRECEBECREDITOCONTASRECEBER: TStringField
      FieldName = 'RECEBECREDITOCONTASRECEBER'
      Size = 1
    end
    object CdsParametrosNFEFORNECEDORDEVOLUCAOVENDA: TFloatField
      FieldName = 'NFEFORNECEDORDEVOLUCAOVENDA'
    end
    object CdsParametrosCLIENTEPHARMASYSTEM: TFloatField
      FieldName = 'CLIENTEPHARMASYSTEM'
    end
    object CdsParametrosCONVENIOPHARMASYSTEM: TFloatField
      FieldName = 'CONVENIOPHARMASYSTEM'
    end
    object CdsParametrosSENHAPHARMASYSTEM: TStringField
      FieldName = 'SENHAPHARMASYSTEM'
      Size = 100
    end
    object CdsParametrosCONCESSAOCREDITOS: TStringField
      FieldName = 'CONCESSAOCREDITOS'
      Size = 1
    end
    object CdsParametrosNFETIPOEMISSAO: TStringField
      FieldName = 'NFETIPOEMISSAO'
      Size = 1
    end
    object CdsParametrosSERIENOTANFESCAN: TStringField
      FieldName = 'SERIENOTANFESCAN'
      Size = 10
    end
    object CdsParametrosNFEULTIMANOTAEMITIDASCAN: TStringField
      FieldName = 'NFEULTIMANOTAEMITIDASCAN'
      Size = 12
    end
    object CdsParametrosVERSAONFE: TIntegerField
      FieldName = 'VERSAONFE'
    end
    object CdsParametrosUSACONFERENCIABALCAO: TStringField
      FieldName = 'USACONFERENCIABALCAO'
      Size = 1
    end
    object CdsParametrosNFCEAMBIENTE: TStringField
      FieldName = 'NFCEAMBIENTE'
      Size = 1
    end
    object CdsParametrosNFCENOTA: TStringField
      FieldName = 'NFCENOTA'
      Size = 12
    end
    object CdsParametrosNFCELOTE: TStringField
      FieldName = 'NFCELOTE'
      Size = 12
    end
    object CdsParametrosNFCESERIE: TStringField
      FieldName = 'NFCESERIE'
      Size = 12
    end
    object CdsParametrosNFCECIDTOKEN: TStringField
      FieldName = 'NFCECIDTOKEN'
      Size = 6
    end
    object CdsParametrosNFCETOKEN: TStringField
      FieldName = 'NFCETOKEN'
      Size = 100
    end
    object CdsParametrosNFEPERCENTUALCREDITOSN: TFloatField
      FieldName = 'NFEPERCENTUALCREDITOSN'
    end
    object CdsParametrosPORTA_SMTP: TStringField
      FieldName = 'PORTA_SMTP'
      Size = 10
    end
    object CdsParametrosPHARMALINKDIRETORIOENVIO: TStringField
      FieldName = 'PHARMALINKDIRETORIOENVIO'
      Size = 100
    end
    object CdsParametrosPHARMALINKDIRETORIORETORNO: TStringField
      FieldName = 'PHARMALINKDIRETORIORETORNO'
      Size = 100
    end
    object CdsParametrosPISALIQUOTA: TFMTBCDField
      FieldName = 'PISALIQUOTA'
      Precision = 19
      Size = 2
    end
    object CdsParametrosCOFINSALIQUOTA: TFMTBCDField
      FieldName = 'COFINSALIQUOTA'
      Precision = 19
      Size = 2
    end
    object CdsParametrosAVISOPREVENDAABERTA: TStringField
      FieldName = 'AVISOPREVENDAABERTA'
      Size = 1
    end
    object CdsParametrosTEMPOAVISOPREVENDAABERTA: TIntegerField
      FieldName = 'TEMPOAVISOPREVENDAABERTA'
    end
    object CdsParametrosFIDELIZEFTPHOST: TStringField
      FieldName = 'FIDELIZEFTPHOST'
      Size = 1000
    end
    object CdsParametrosFIDELIZEFTPUSUARIO: TStringField
      FieldName = 'FIDELIZEFTPUSUARIO'
      Size = 100
    end
    object CdsParametrosFIDELIZEFTPSENHA: TStringField
      FieldName = 'FIDELIZEFTPSENHA'
      Size = 100
    end
    object CdsParametrosUSACONSULTAPRODUTOSPBM: TStringField
      FieldName = 'USACONSULTAPRODUTOSPBM'
      Size = 1
    end
    object CdsParametrosWSCONVENIOURL: TStringField
      FieldName = 'WSCONVENIOURL'
      Size = 100
    end
    object CdsParametrosWSCONVENIOCODIGOACESSO: TStringField
      FieldName = 'WSCONVENIOCODIGOACESSO'
      Size = 100
    end
    object CdsParametrosWSCONVENIOSENHA: TStringField
      FieldName = 'WSCONVENIOSENHA'
      Size = 100
    end
    object CdsParametrosWSCONVENIOOPERADOR: TStringField
      FieldName = 'WSCONVENIOOPERADOR'
      Size = 100
    end
    object CdsParametrosWSCONVENIOTOKEN: TStringField
      FieldName = 'WSCONVENIOTOKEN'
      Size = 100
    end
    object CdsParametrosEXIBEIMAGEMPRODUTO: TStringField
      FieldName = 'EXIBEIMAGEMPRODUTO'
      Size = 1
    end
    object CdsParametrosCLIENTEWSCONVENIO: TFloatField
      FieldName = 'CLIENTEWSCONVENIO'
    end
    object CdsParametrosCONVENIOWSCONVENIO: TFloatField
      FieldName = 'CONVENIOWSCONVENIO'
    end
    object CdsParametrosTEFCNPJCREDENCIADORA: TStringField
      FieldName = 'TEFCNPJCREDENCIADORA'
      Size = 14
    end
  end
  object QryProdutosTotais: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 40
  end
  object SqlPlanoContas: TSQLDataSet
    CommandText = 'SELECT'#13#10' CD_HISTORICO,'#13#10' CD_PLANO_CONTAS'#13#10'FROM '#13#10' PLANO_CONTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 800
    Top = 528
  end
  object DspPlanoContas: TDataSetProvider
    DataSet = SqlPlanoContas
    Left = 800
    Top = 568
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
    Left = 720
    Top = 528
  end
  object DspControle: TDataSetProvider
    DataSet = SqlControle
    Left = 720
    Top = 568
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
    Left = 720
    Top = 608
    object CdsControleCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 30
    end
    object CdsControleVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object CdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPlanoContas'
    Left = 800
    Top = 608
    object CdsPlanoContasCD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Size = 8
    end
    object CdsPlanoContasCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
  end
  object SqlOperadores: TSQLDataSet
    CommandText = 
      'SELECT * FROM OPERADORES'#13#10'WHERE '#13#10' CD_FILIAL = :CD_FILIAL AND'#13#10' ' +
      'ID_OPERADORCAIXA = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 640
    Top = 528
  end
  object DspOperadores: TDataSetProvider
    DataSet = SqlOperadores
    Left = 640
    Top = 568
  end
  object CdsOperadores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'DspOperadores'
    Left = 640
    Top = 608
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
  object QryCeLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 120
    object QryCeLotesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryCeLotesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryCeLotesCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 6
    end
    object QryCeLotesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryCeLotesCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryCeLotesCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryCeLotesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryCeLotesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCeLotesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCeLotesCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object QryCeLotesCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object QryCeLotesCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object QryCeLotesCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCeLotesCUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      Precision = 19
      Size = 2
    end
    object QryCeLotesCUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      Precision = 19
      Size = 2
    end
    object QryCeLotesDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object QryCeLotesDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object QryCeLotesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryCeLotesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 19
      Size = 2
    end
    object QryCeLotesNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object QryCeLotesDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 2
    end
    object QryCeLotesPROMOCAO: TFMTBCDField
      FieldName = 'PROMOCAO'
      Precision = 19
      Size = 2
    end
    object QryCeLotesTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object QryCeLotesTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 1
    end
    object QryCeLotesENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
      Size = 1
    end
    object QryCeLotesETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 1
    end
    object QryCeLotesENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object QryCeLotesHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object QryCeLotesESTOQUE_POSVENDA: TFloatField
      FieldName = 'ESTOQUE_POSVENDA'
    end
    object QryCeLotesTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object QryCeLotesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeLotesNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object QryCeLotesTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object QryCeLotesUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object QryCeLotesCD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object QryCeLotesCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 19
      Size = 2
    end
    object QryCeLotesARREDONDAMENTO: TFMTBCDField
      FieldName = 'ARREDONDAMENTO'
      Precision = 19
      Size = 2
    end
    object QryCeLotesCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object QryCeLotesID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object QryCeLotesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object QryCeLotesTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object QryCeLotesTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object QryCeLotesLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object QryCeLotesAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object QryCeLotesSUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object QryCeLotesNOTAMANUAL: TStringField
      FieldName = 'NOTAMANUAL'
      Size = 1
    end
    object QryCeLotesCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object QryCeLotesID_PRODUTO_LOTE: TFloatField
      FieldName = 'ID_PRODUTO_LOTE'
    end
    object QryCeLotesNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object QryCeLotesCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object QryCeLotesCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object QryCeLotesICMS: TStringField
      FieldName = 'ICMS'
      Size = 4
    end
    object QryCeLotesCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 14
    end
    object QryCeLotesECF: TStringField
      FieldName = 'ECF'
      Size = 14
    end
    object QryCeLotesCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object QryCeLotesSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object QryCeLotesID_CLIENTE_PROPRIEDADE: TFloatField
      FieldName = 'ID_CLIENTE_PROPRIEDADE'
    end
    object QryCeLotesCEST: TStringField
      FieldName = 'CEST'
      Size = 15
    end
    object QryCeLotesFCP: TFMTBCDField
      FieldName = 'FCP'
      Precision = 18
      Size = 2
    end
    object QryCeLotesPERCENTUALREDUCAO: TFMTBCDField
      FieldName = 'PERCENTUALREDUCAO'
      Precision = 18
      Size = 2
    end
    object QryCeLotesCOMPOSTO: TStringField
      FieldName = 'COMPOSTO'
      Size = 1
    end
    object QryCeLotesID_PRODUTO_PRINCIPAL: TFloatField
      FieldName = 'ID_PRODUTO_PRINCIPAL'
    end
    object QryCeLotesVENDA_FIDELIDADE: TStringField
      FieldName = 'VENDA_FIDELIDADE'
      Size = 1
    end
    object QryCeLotesVENDA_QUANTIDADE: TStringField
      FieldName = 'VENDA_QUANTIDADE'
      Size = 1
    end
    object QryCeLotesIFOOD: TStringField
      FieldName = 'IFOOD'
      Size = 1
    end
    object QryCeLotesFARMACIASAPP: TStringField
      FieldName = 'FARMACIASAPP'
      Size = 1
    end
  end
  object QryCeCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 40
    object QryCeCaixaCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
      Required = True
    end
    object QryCeCaixaCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryCeCaixaCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryCeCaixaCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCeCaixaCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCeCaixaCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object QryCeCaixaCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object QryCeCaixaCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object QryCeCaixaCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object QryCeCaixaCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object QryCeCaixaCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCeCaixaTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Size = 1
    end
    object QryCeCaixaDATA: TDateField
      FieldName = 'DATA'
    end
    object QryCeCaixaHORA: TTimeField
      FieldName = 'HORA'
    end
    object QryCeCaixaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryCeCaixaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 12
    end
    object QryCeCaixaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object QryCeCaixaTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object QryCeCaixaENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object QryCeCaixaENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object QryCeCaixaTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object QryCeCaixaENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeCaixaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object QryCeCaixaNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object QryCeCaixaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object QryCeCaixaTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object QryCeCaixaNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object QryCeCaixaNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object QryCeCaixaDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object QryCeCaixaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCeCaixaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object QryCeCaixaARREDONDAMENTO: TFloatField
      FieldName = 'ARREDONDAMENTO'
    end
    object QryCeCaixaID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object QryCeCaixaTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object QryCeCaixaTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object QryCeCaixaTEFAUTORIZACAO: TStringField
      FieldName = 'TEFAUTORIZACAO'
      Size = 100
    end
    object QryCeCaixaTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object QryCeCaixaTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object QryCeCaixaTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object QryCeCaixaTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 100
    end
    object QryCeCaixaTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object QryCeCaixaTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object QryCeCaixaLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object QryCeCaixaAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object QryCeCaixaPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object QryCeCaixaCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object QryCeCaixaECF: TStringField
      FieldName = 'ECF'
      Size = 40
    end
  end
  object QryCeCadfin: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 120
    object QryCeCadfinCD_CONTAS_RECEBER: TFloatField
      FieldName = 'CD_CONTAS_RECEBER'
      Required = True
    end
    object QryCeCadfinCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCeCadfinCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object QryCeCadfinCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryCeCadfinCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryCeCadfinCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCeCadfinCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCeCadfinCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object QryCeCadfinCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object QryCeCadfinDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object QryCeCadfinDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object QryCeCadfinNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object QryCeCadfinSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Size = 4
    end
    object QryCeCadfinDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object QryCeCadfinDT_NOTA_FISCAL: TDateField
      FieldName = 'DT_NOTA_FISCAL'
    end
    object QryCeCadfinVENCTO: TDateField
      FieldName = 'VENCTO'
    end
    object QryCeCadfinVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryCeCadfinHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object QryCeCadfinNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object QryCeCadfinNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object QryCeCadfinDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object QryCeCadfinVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object QryCeCadfinVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object QryCeCadfinVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object QryCeCadfinVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object QryCeCadfinNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Size = 11
    end
    object QryCeCadfinBANCO: TStringField
      FieldName = 'BANCO'
      Size = 10
    end
    object QryCeCadfinAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object QryCeCadfinCONTA: TStringField
      FieldName = 'CONTA'
      Size = 16
    end
    object QryCeCadfinHISTORICO_BANCO: TStringField
      FieldName = 'HISTORICO_BANCO'
      Size = 60
    end
    object QryCeCadfinSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCeCadfinOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object QryCeCadfinGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object QryCeCadfinENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeCadfinCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object QryCeCadfinCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object QryCeCadfinCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object QryCeCadfinBOLETOGERADO: TStringField
      FieldName = 'BOLETOGERADO'
      Size = 1
    end
    object QryCeCadfinDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object QryCeCadfinTEFTRANSACAO: TFloatField
      FieldName = 'TEFTRANSACAO'
    end
    object QryCeCadfinTEFLOTE: TFloatField
      FieldName = 'TEFLOTE'
    end
    object QryCeCadfinTEFAUTORIZACAO: TStringField
      FieldName = 'TEFAUTORIZACAO'
      Size = 100
    end
    object QryCeCadfinTEFDATA: TDateField
      FieldName = 'TEFDATA'
    end
    object QryCeCadfinTEFHORA: TTimeField
      FieldName = 'TEFHORA'
    end
    object QryCeCadfinTEFNOMEREDE: TStringField
      FieldName = 'TEFNOMEREDE'
      Size = 10
    end
    object QryCeCadfinTEFVALOR: TFloatField
      FieldName = 'TEFVALOR'
    end
    object QryCeCadfinTRNTRANSACAO: TStringField
      FieldName = 'TRNTRANSACAO'
      Size = 12
    end
    object QryCeCadfinTRNLOTE: TStringField
      FieldName = 'TRNLOTE'
      Size = 10
    end
    object QryCeCadfinTRNAUTORIZACAO: TStringField
      FieldName = 'TRNAUTORIZACAO'
      Size = 100
    end
    object QryCeCadfinTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object QryCeCadfinCD_FILIAL_PAGAMENTO: TFloatField
      FieldName = 'CD_FILIAL_PAGAMENTO'
    end
    object QryCeCadfinPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object QryCeCadfinCD_CAIXA: TFloatField
      FieldName = 'CD_CAIXA'
    end
    object QryCeCadfinCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
  end
  object QryCeDuplic: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 40
    object QryCeDuplicCD_CONTAS_PAGAR: TFloatField
      FieldName = 'CD_CONTAS_PAGAR'
      Required = True
    end
    object QryCeDuplicCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryCeDuplicCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object QryCeDuplicCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object QryCeDuplicCD_CONTA: TFloatField
      FieldName = 'CD_CONTA'
    end
    object QryCeDuplicCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object QryCeDuplicCD_PLANO_CONTAS: TFloatField
      FieldName = 'CD_PLANO_CONTAS'
    end
    object QryCeDuplicNUMERO_NOTA: TStringField
      FieldName = 'NUMERO_NOTA'
      Size = 10
    end
    object QryCeDuplicSERIAL_NOTA: TStringField
      FieldName = 'SERIAL_NOTA'
      Size = 3
    end
    object QryCeDuplicDOCUMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'DOCUMENTO'
    end
    object QryCeDuplicDT_NOTA: TDateField
      FieldName = 'DT_NOTA'
    end
    object QryCeDuplicDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object QryCeDuplicVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryCeDuplicOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object QryCeDuplicDT_LANCAMENTO: TDateField
      FieldName = 'DT_LANCAMENTO'
    end
    object QryCeDuplicDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object QryCeDuplicDT_BOLETO: TDateField
      FieldName = 'DT_BOLETO'
    end
    object QryCeDuplicDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
    end
    object QryCeDuplicVL_PAGAMENTO: TFloatField
      FieldName = 'VL_PAGAMENTO'
    end
    object QryCeDuplicVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object QryCeDuplicVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object QryCeDuplicVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object QryCeDuplicNOSSO_NUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'NOSSO_NUMERO'
    end
    object QryCeDuplicBANCO: TStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object QryCeDuplicAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 6
    end
    object QryCeDuplicCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object QryCeDuplicHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object QryCeDuplicNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Size = 10
    end
    object QryCeDuplicSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCeDuplicENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeDuplicDESPESAFINANCEIRA: TFloatField
      FieldName = 'DESPESAFINANCEIRA'
    end
  end
  object QryCeProdut: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 744
    Top = 40
  end
  object QryCeOpcaix: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 648
    object QryCeOpcaixCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryCeOpcaixCD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object QryCeOpcaixNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QryCeOpcaixSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCeOpcaixTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object QryCeOpcaixDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object QryCeOpcaixHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
    end
    object QryCeOpcaixDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
    end
    object QryCeOpcaixHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
    end
    object QryCeOpcaixDINHEIRO: TFloatField
      FieldName = 'DINHEIRO'
    end
    object QryCeOpcaixCHEQUE_PRE: TFloatField
      FieldName = 'CHEQUE_PRE'
    end
    object QryCeOpcaixCHEQUE_A_VISTA: TFloatField
      FieldName = 'CHEQUE_A_VISTA'
    end
    object QryCeOpcaixCARTAO: TFloatField
      FieldName = 'CARTAO'
    end
    object QryCeOpcaixCONVENIO: TFloatField
      FieldName = 'CONVENIO'
    end
    object QryCeOpcaixCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
    object QryCeOpcaixSAIDAS: TFloatField
      FieldName = 'SAIDAS'
    end
    object QryCeOpcaixENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeOpcaixID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object QryCeOpcaixCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
  end
  object QryCentregas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 984
    Top = 40
    object QryCentregasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryCentregasCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCentregasCD_ENTREGADOR: TFloatField
      FieldName = 'CD_ENTREGADOR'
    end
    object QryCentregasCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCentregasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryCentregasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object QryCentregasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object QryCentregasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 100
    end
    object QryCentregasDATA: TDateField
      FieldName = 'DATA'
    end
    object QryCentregasHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
    end
    object QryCentregasHORA_CHEGADA: TTimeField
      FieldName = 'HORA_CHEGADA'
    end
    object QryCentregasTROCO: TFloatField
      FieldName = 'TROCO'
    end
    object QryCentregasVALORRETORNO: TFloatField
      FieldName = 'VALORRETORNO'
    end
    object QryCentregasENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCentregasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object SqlCheques: TSQLDataSet
    CommandText = 
      'SELECT * FROM CHEQUESRECEBIDOS'#13#10'WHERE '#13#10' CD_CHEQUE_RECEBIDO = :C' +
      'D_CHEQUE_RECEBIDO AND'#13#10' CD_FILIAL = :CD_FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CHEQUE_RECEBIDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 696
    Top = 352
  end
  object DspCheques: TDataSetProvider
    DataSet = SqlCheques
    Left = 696
    Top = 392
  end
  object CdsCheques: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CHEQUE_RECEBIDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspCheques'
    Left = 696
    Top = 432
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
  object QryCeCheques: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 696
    Top = 472
    object QryCeChequesCD_CHEQUE_RECEBIDO: TFloatField
      FieldName = 'CD_CHEQUE_RECEBIDO'
    end
    object QryCeChequesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryCeChequesCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCeChequesCD_BORDERO: TFloatField
      FieldName = 'CD_BORDERO'
    end
    object QryCeChequesNUMERO_BORDERO: TStringField
      FieldName = 'NUMERO_BORDERO'
    end
    object QryCeChequesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCeChequesEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Size = 100
    end
    object QryCeChequesTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Size = 1
    end
    object QryCeChequesCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object QryCeChequesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object QryCeChequesBANCO: TStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object QryCeChequesNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 6
    end
    object QryCeChequesDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object QryCeChequesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryCeChequesCD_MOTIVO: TFloatField
      FieldName = 'CD_MOTIVO'
    end
    object QryCeChequesMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 100
    end
    object QryCeChequesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeChequesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object SqlCadFiliais: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  *'#13#10'FROM'#13#10'  FILIAIS'#13#10'WHERE'#13#10'  STATUS = '#39'A'#39#13#10'ORDER BY'#13#10' ' +
      'CD_FILIAL'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 624
    Top = 353
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
    object SqlCadFiliaisCD_GRUPO_FILIAL: TFloatField
      FieldName = 'CD_GRUPO_FILIAL'
    end
    object SqlCadFiliaisANBFARMA: TStringField
      FieldName = 'ANBFARMA'
      Size = 10
    end
    object SqlCadFiliaisAUDIFAR: TStringField
      FieldName = 'AUDIFAR'
      Size = 10
    end
    object SqlCadFiliaisBRASDROGA: TStringField
      FieldName = 'BRASDROGA'
      Size = 10
    end
    object SqlCadFiliaisCENTROAMERICA: TStringField
      FieldName = 'CENTROAMERICA'
      Size = 10
    end
    object SqlCadFiliaisMILLENIUM: TStringField
      FieldName = 'MILLENIUM'
      Size = 100
    end
    object SqlCadFiliaisCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 10
    end
  end
  object DspCadFiliais: TDataSetProvider
    DataSet = SqlCadFiliais
    UpdateMode = upWhereKeyOnly
    Left = 624
    Top = 391
  end
  object CdsCadFiliais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCadFiliais'
    Left = 624
    Top = 432
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
      Size = 100
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
    object CdsCadFiliaisCD_GRUPO_FILIAL: TFloatField
      FieldName = 'CD_GRUPO_FILIAL'
    end
    object CdsCadFiliaisANBFARMA: TStringField
      FieldName = 'ANBFARMA'
      Size = 10
    end
    object CdsCadFiliaisAUDIFAR: TStringField
      FieldName = 'AUDIFAR'
      Size = 10
    end
    object CdsCadFiliaisBRASDROGA: TStringField
      FieldName = 'BRASDROGA'
      Size = 10
    end
    object CdsCadFiliaisCENTROAMERICA: TStringField
      FieldName = 'CENTROAMERICA'
      Size = 10
    end
    object CdsCadFiliaisMILLENIUM: TStringField
      FieldName = 'MILLENIUM'
      Size = 100
    end
    object CdsCadFiliaisCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 10
    end
  end
  object SqlVendasCallCenter: TSQLDataSet
    CommandText = 
      'SELECT * FROM VENDAS WHERE CD_VENDA = :CD_VENDA AND'#13#10'CD_FILIAL =' +
      ' :CD_FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 528
    Top = 352
  end
  object DspVendasCallCenter: TDataSetProvider
    DataSet = SqlVendasCallCenter
    Left = 528
    Top = 392
  end
  object CdsVendasCallCenter: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspVendasCallCenter'
    Left = 528
    Top = 432
    object CdsVendasCallCenterCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsVendasCallCenterCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsVendasCallCenterCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object CdsVendasCallCenterCD_VENDA_TROCA: TFloatField
      FieldName = 'CD_VENDA_TROCA'
    end
    object CdsVendasCallCenterCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsVendasCallCenterCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsVendasCallCenterID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object CdsVendasCallCenterCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object CdsVendasCallCenterCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object CdsVendasCallCenterNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object CdsVendasCallCenterDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsVendasCallCenterTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object CdsVendasCallCenterTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object CdsVendasCallCenterPROMOCAO_DIFERENCA: TFloatField
      FieldName = 'PROMOCAO_DIFERENCA'
    end
    object CdsVendasCallCenterCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Size = 9
    end
    object CdsVendasCallCenterDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object CdsVendasCallCenterHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsVendasCallCenterDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object CdsVendasCallCenterDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CdsVendasCallCenterQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object CdsVendasCallCenterCODIGO_BARRA: TStringField
      FieldName = 'CODIGO_BARRA'
      Size = 14
    end
    object CdsVendasCallCenterPERMITE_DESCONTO: TStringField
      FieldName = 'PERMITE_DESCONTO'
      Size = 1
    end
    object CdsVendasCallCenterTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object CdsVendasCallCenterTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object CdsVendasCallCenterPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object CdsVendasCallCenterPRECO_UNITARIO: TFloatField
      FieldName = 'PRECO_UNITARIO'
    end
    object CdsVendasCallCenterPRECO_TOTAL: TFloatField
      FieldName = 'PRECO_TOTAL'
    end
    object CdsVendasCallCenterPRECO_DESCONTO: TFloatField
      FieldName = 'PRECO_DESCONTO'
    end
    object CdsVendasCallCenterICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object CdsVendasCallCenterTROCO: TFloatField
      FieldName = 'TROCO'
    end
    object CdsVendasCallCenterENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object CdsVendasCallCenterARREDONDAMENTO: TFloatField
      FieldName = 'ARREDONDAMENTO'
    end
    object CdsVendasCallCenterTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object CdsVendasCallCenterPRECO_PRODUTO: TFloatField
      FieldName = 'PRECO_PRODUTO'
    end
    object CdsVendasCallCenterCONCLUIDO: TStringField
      FieldName = 'CONCLUIDO'
      Size = 1
    end
    object CdsVendasCallCenterORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object CdsVendasCallCenterHORAINICIAL: TTimeField
      FieldName = 'HORAINICIAL'
    end
    object CdsVendasCallCenterHORAFINAL: TTimeField
      FieldName = 'HORAFINAL'
    end
    object CdsVendasCallCenterCALLCENTER: TStringField
      FieldName = 'CALLCENTER'
      Size = 1
    end
    object CdsVendasCallCenterTEMPENDERECO: TStringField
      FieldName = 'TEMPENDERECO'
      Size = 50
    end
    object CdsVendasCallCenterTEMPBAIRRO: TStringField
      FieldName = 'TEMPBAIRRO'
      Size = 50
    end
    object CdsVendasCallCenterTEMPREFERENCIA: TStringField
      FieldName = 'TEMPREFERENCIA'
      Size = 100
    end
    object CdsVendasCallCenterGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object CdsVendasCallCenterSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object CdsVendasCallCenterID_VENDA: TStringField
      FieldName = 'ID_VENDA'
      Size = 13
    end
    object CdsVendasCallCenterLOCALARREDONDAMENTO: TStringField
      FieldName = 'LOCALARREDONDAMENTO'
      Size = 1
    end
    object CdsVendasCallCenterBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Size = 1
    end
    object CdsVendasCallCenterTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object CdsVendasCallCenterTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object CdsVendasCallCenterLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object CdsVendasCallCenterPRETRN: TStringField
      FieldName = 'PRETRN'
      Size = 1
    end
    object CdsVendasCallCenterAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object CdsVendasCallCenterSUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object CdsVendasCallCenterCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
  end
  object QryVendasCallCenter: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 472
    object QryVendasCallCenterCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryVendasCallCenterCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryVendasCallCenterCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryVendasCallCenterCD_VENDA_TROCA: TFloatField
      FieldName = 'CD_VENDA_TROCA'
    end
    object QryVendasCallCenterCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryVendasCallCenterCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryVendasCallCenterID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryVendasCallCenterCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object QryVendasCallCenterCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryVendasCallCenterNUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object QryVendasCallCenterDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryVendasCallCenterTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object QryVendasCallCenterTROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object QryVendasCallCenterPROMOCAO_DIFERENCA: TFloatField
      FieldName = 'PROMOCAO_DIFERENCA'
    end
    object QryVendasCallCenterCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Size = 9
    end
    object QryVendasCallCenterDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object QryVendasCallCenterHORA: TTimeField
      FieldName = 'HORA'
    end
    object QryVendasCallCenterDATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object QryVendasCallCenterDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object QryVendasCallCenterQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryVendasCallCenterCODIGO_BARRA: TStringField
      FieldName = 'CODIGO_BARRA'
      Size = 14
    end
    object QryVendasCallCenterPERMITE_DESCONTO: TStringField
      FieldName = 'PERMITE_DESCONTO'
      Size = 1
    end
    object QryVendasCallCenterTX_DESCONTO: TFloatField
      FieldName = 'TX_DESCONTO'
    end
    object QryVendasCallCenterTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object QryVendasCallCenterPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object QryVendasCallCenterPRECO_UNITARIO: TFloatField
      FieldName = 'PRECO_UNITARIO'
    end
    object QryVendasCallCenterPRECO_TOTAL: TFloatField
      FieldName = 'PRECO_TOTAL'
    end
    object QryVendasCallCenterPRECO_DESCONTO: TFloatField
      FieldName = 'PRECO_DESCONTO'
    end
    object QryVendasCallCenterICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object QryVendasCallCenterTROCO: TFloatField
      FieldName = 'TROCO'
    end
    object QryVendasCallCenterENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object QryVendasCallCenterARREDONDAMENTO: TFloatField
      FieldName = 'ARREDONDAMENTO'
    end
    object QryVendasCallCenterTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object QryVendasCallCenterPRECO_PRODUTO: TFloatField
      FieldName = 'PRECO_PRODUTO'
    end
    object QryVendasCallCenterCONCLUIDO: TStringField
      FieldName = 'CONCLUIDO'
      Size = 1
    end
    object QryVendasCallCenterORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object QryVendasCallCenterHORAINICIAL: TTimeField
      FieldName = 'HORAINICIAL'
    end
    object QryVendasCallCenterHORAFINAL: TTimeField
      FieldName = 'HORAFINAL'
    end
    object QryVendasCallCenterCALLCENTER: TStringField
      FieldName = 'CALLCENTER'
      Size = 1
    end
    object QryVendasCallCenterTEMPENDERECO: TStringField
      FieldName = 'TEMPENDERECO'
      Size = 50
    end
    object QryVendasCallCenterTEMPBAIRRO: TStringField
      FieldName = 'TEMPBAIRRO'
      Size = 50
    end
    object QryVendasCallCenterTEMPREFERENCIA: TStringField
      FieldName = 'TEMPREFERENCIA'
      Size = 100
    end
    object QryVendasCallCenterGERABOLETO: TStringField
      FieldName = 'GERABOLETO'
      Size = 1
    end
    object QryVendasCallCenterSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryVendasCallCenterID_VENDA: TStringField
      FieldName = 'ID_VENDA'
      Size = 13
    end
    object QryVendasCallCenterLOCALARREDONDAMENTO: TStringField
      FieldName = 'LOCALARREDONDAMENTO'
      Size = 1
    end
    object QryVendasCallCenterBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Size = 1
    end
    object QryVendasCallCenterTRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object QryVendasCallCenterTRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object QryVendasCallCenterLOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object QryVendasCallCenterPRETRN: TStringField
      FieldName = 'PRETRN'
      Size = 1
    end
    object QryVendasCallCenterAUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object QryVendasCallCenterSUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object QryVendasCallCenterCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
  end
  object QryCeLotes2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 120
    object QryCeLotes2ID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryCeLotes2CD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryCeLotes2CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 6
    end
    object QryCeLotes2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryCeLotes2CD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryCeLotes2CD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryCeLotes2CD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryCeLotes2CD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCeLotes2CD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCeLotes2CD_OPERADOR: TFloatField
      FieldName = 'CD_OPERADOR'
    end
    object QryCeLotes2CD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object QryCeLotes2CD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object QryCeLotes2CD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCeLotes2CUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      Precision = 19
      Size = 2
    end
    object QryCeLotes2CUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      Precision = 19
      Size = 2
    end
    object QryCeLotes2DATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object QryCeLotes2DATA_CAIXA: TDateField
      FieldName = 'DATA_CAIXA'
    end
    object QryCeLotes2QUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryCeLotes2VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 19
      Size = 2
    end
    object QryCeLotes2NOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 10
    end
    object QryCeLotes2DESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 2
    end
    object QryCeLotes2PROMOCAO: TFMTBCDField
      FieldName = 'PROMOCAO'
      Precision = 19
      Size = 2
    end
    object QryCeLotes2TIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object QryCeLotes2TIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 1
    end
    object QryCeLotes2ENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
      Size = 1
    end
    object QryCeLotes2ETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      Size = 1
    end
    object QryCeLotes2ENTREGA: TStringField
      FieldName = 'ENTREGA'
      Size = 1
    end
    object QryCeLotes2HORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object QryCeLotes2ESTOQUE_POSVENDA: TFloatField
      FieldName = 'ESTOQUE_POSVENDA'
    end
    object QryCeLotes2TROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object QryCeLotes2ENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeLotes2NUMERO: TFloatField
      FieldName = 'NUMERO'
    end
    object QryCeLotes2TERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object QryCeLotes2USUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object QryCeLotes2CD_LANCAMENTO: TFloatField
      FieldName = 'CD_LANCAMENTO'
    end
    object QryCeLotes2COMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 19
      Size = 2
    end
    object QryCeLotes2ARREDONDAMENTO: TFMTBCDField
      FieldName = 'ARREDONDAMENTO'
      Precision = 19
      Size = 2
    end
    object QryCeLotes2CD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object QryCeLotes2ID_OPERADORCAIXA: TFloatField
      FieldName = 'ID_OPERADORCAIXA'
    end
    object QryCeLotes2OBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object QryCeLotes2TRN: TStringField
      FieldName = 'TRN'
      Size = 1
    end
    object QryCeLotes2TRANSACAOTRN: TStringField
      FieldName = 'TRANSACAOTRN'
      Size = 12
    end
    object QryCeLotes2LOTETRN: TStringField
      FieldName = 'LOTETRN'
      Size = 10
    end
    object QryCeLotes2AUTORIZACAOTRN: TStringField
      FieldName = 'AUTORIZACAOTRN'
      Size = 100
    end
    object QryCeLotes2SUBSIDIOTRN: TFloatField
      FieldName = 'SUBSIDIOTRN'
    end
    object QryCeLotes2NOTAMANUAL: TStringField
      FieldName = 'NOTAMANUAL'
      Size = 1
    end
  end
  object QryCeTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 864
    Top = 40
    object QryCeTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object QryCeTransferDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
    end
    object QryCeTransferHORA_GERACAO: TTimeField
      FieldName = 'HORA_GERACAO'
    end
    object QryCeTransferDATA_ENVIO: TDateField
      FieldName = 'DATA_ENVIO'
    end
    object QryCeTransferHORA_ENVIO: TTimeField
      FieldName = 'HORA_ENVIO'
    end
    object QryCeTransferDATA_CONCLUSAO: TDateField
      FieldName = 'DATA_CONCLUSAO'
    end
    object QryCeTransferHORA_CONCLUSAO: TTimeField
      FieldName = 'HORA_CONCLUSAO'
    end
    object QryCeTransferCD_FILIAL_ORIGEM: TFloatField
      FieldName = 'CD_FILIAL_ORIGEM'
    end
    object QryCeTransferCD_FILIAL_DESTINO: TFloatField
      FieldName = 'CD_FILIAL_DESTINO'
    end
    object QryCeTransferCD_USUARIO_ORIGEM: TFloatField
      FieldName = 'CD_USUARIO_ORIGEM'
    end
    object QryCeTransferCD_USUARIO_DESTINO: TFloatField
      FieldName = 'CD_USUARIO_DESTINO'
    end
    object QryCeTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object QryCeTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCeTransferENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeTransferCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
  end
  object QryCeItensTransfer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 864
    Top = 120
    object QryCeItensTransferCD_TRANSFER: TFloatField
      FieldName = 'CD_TRANSFER'
    end
    object QryCeItensTransferID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryCeItensTransferCD_PRODUTO: TFloatField
      FieldName = 'CD_PRODUTO'
    end
    object QryCeItensTransferCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryCeItensTransferCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryCeItensTransferDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 45
    end
    object QryCeItensTransferQUANTIDADE_SOLICITADA: TFloatField
      FieldName = 'QUANTIDADE_SOLICITADA'
    end
    object QryCeItensTransferQUANTIDADE_ENVIADA: TFloatField
      FieldName = 'QUANTIDADE_ENVIADA'
    end
    object QryCeItensTransferQUANTIDADE_RECEBIDA: TFloatField
      FieldName = 'QUANTIDADE_RECEBIDA'
    end
    object QryCeItensTransferVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryCeItensTransferOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Size = 255
    end
    object QryCeItensTransferSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCeItensTransferCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
  end
  object QryCeCadernoFaltas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 984
    Top = 120
    object QryCeCadernoFaltasCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryCeCadernoFaltasID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryCeCadernoFaltasCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object QryCeCadernoFaltasCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryCeCadernoFaltasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object QryCeCadernoFaltasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryCeCadernoFaltasCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryCeCadernoFaltasCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryCeCadernoFaltasCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object QryCeCadernoFaltasCURVA: TStringField
      FieldName = 'CURVA'
      Size = 1
    end
    object QryCeCadernoFaltasCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCeCadernoFaltasDATA: TDateField
      FieldName = 'DATA'
    end
    object QryCeCadernoFaltasQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryCeCadernoFaltasID_MOTIVOFALTA: TFloatField
      FieldName = 'ID_MOTIVOFALTA'
    end
    object QryCeCadernoFaltasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object SQL1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 176
  end
  object QryCeClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 120
    object QryCeClientesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryCeClientesCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object QryCeClientesCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCeClientesCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryCeClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryCeClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object QryCeClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object QryCeClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object QryCeClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object QryCeClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object QryCeClientesCAIXA_POSTAL: TStringField
      FieldName = 'CAIXA_POSTAL'
      Size = 5
    end
    object QryCeClientesFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object QryCeClientesFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object QryCeClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object QryCeClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object QryCeClientesINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object QryCeClientesPRACA: TStringField
      FieldName = 'PRACA'
      Size = 6
    end
    object QryCeClientesDATA_FICHA: TDateField
      FieldName = 'DATA_FICHA'
    end
    object QryCeClientesRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object QryCeClientesCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object QryCeClientesTITULO_ELEITO: TStringField
      FieldName = 'TITULO_ELEITO'
      Size = 12
    end
    object QryCeClientesDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object QryCeClientesSEXO: TStringField
      FieldName = 'SEXO'
      Size = 10
    end
    object QryCeClientesESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 10
    end
    object QryCeClientesNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
    end
    object QryCeClientesFILIACAO: TStringField
      FieldName = 'FILIACAO'
      Size = 60
    end
    object QryCeClientesNUMERO_DEPENDENTES: TFloatField
      FieldName = 'NUMERO_DEPENDENTES'
    end
    object QryCeClientesCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 40
    end
    object QryCeClientesDT_NASC_CONJUGE: TStringField
      FieldName = 'DT_NASC_CONJUGE'
    end
    object QryCeClientesALUGUEL: TStringField
      FieldName = 'ALUGUEL'
      Size = 3
    end
    object QryCeClientesVL_ALUGUEL: TFloatField
      FieldName = 'VL_ALUGUEL'
    end
    object QryCeClientesTEMPO_RESIDENCIA: TStringField
      FieldName = 'TEMPO_RESIDENCIA'
    end
    object QryCeClientesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 50
    end
    object QryCeClientesFONE_COMERCIAL: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 30
    end
    object QryCeClientesDT_ADMISSAO: TStringField
      FieldName = 'DT_ADMISSAO'
    end
    object QryCeClientesCEP_COMERCIAL: TStringField
      FieldName = 'CEP_COMERCIAL'
      Size = 9
    end
    object QryCeClientesCIDADE_COMERCIAL: TStringField
      FieldName = 'CIDADE_COMERCIAL'
      Size = 35
    end
    object QryCeClientesUF_COMERCIAL: TStringField
      FieldName = 'UF_COMERCIAL'
      Size = 2
    end
    object QryCeClientesFUNCAO: TStringField
      FieldName = 'FUNCAO'
    end
    object QryCeClientesEMPRESA_ANTERIOR: TStringField
      FieldName = 'EMPRESA_ANTERIOR'
      Size = 40
    end
    object QryCeClientesTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      Size = 15
    end
    object QryCeClientesREFERENCIA_COMERCIAL: TStringField
      FieldName = 'REFERENCIA_COMERCIAL'
      Size = 50
    end
    object QryCeClientesREFERENCIA_BANCARIA: TStringField
      FieldName = 'REFERENCIA_BANCARIA'
      Size = 50
    end
    object QryCeClientesCONSULTA_SPC: TStringField
      FieldName = 'CONSULTA_SPC'
    end
    object QryCeClientesOBSERVACAO_SPC: TStringField
      FieldName = 'OBSERVACAO_SPC'
      Size = 40
    end
    object QryCeClientesOBSERVACAO_GERAL: TStringField
      FieldName = 'OBSERVACAO_GERAL'
      Size = 254
    end
    object QryCeClientesENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 40
    end
    object QryCeClientesBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
    end
    object QryCeClientesCIDADE_COBRANCA: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Size = 35
    end
    object QryCeClientesUF_COBRANCA: TStringField
      FieldName = 'UF_COBRANCA'
      Size = 2
    end
    object QryCeClientesCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      Size = 9
    end
    object QryCeClientesICMS_IPI: TStringField
      FieldName = 'ICMS_IPI'
      Size = 1
    end
    object QryCeClientesNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 60
    end
    object QryCeClientesMES_NASCIMENTO: TFloatField
      FieldName = 'MES_NASCIMENTO'
    end
    object QryCeClientesRENDA: TFloatField
      FieldName = 'RENDA'
    end
    object QryCeClientesLIMITE_PERCENTUAL: TFloatField
      FieldName = 'LIMITE_PERCENTUAL'
    end
    object QryCeClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object QryCeClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 45
    end
    object QryCeClientesHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 50
    end
    object QryCeClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object QryCeClientesMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 10
    end
    object QryCeClientesSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object QryCeClientesDT_VENCIMENTO: TFloatField
      FieldName = 'DT_VENCIMENTO'
    end
    object QryCeClientesDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object QryCeClientesDT_ULTIMA_COMPRA: TDateField
      FieldName = 'DT_ULTIMA_COMPRA'
    end
    object QryCeClientesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryCeClientesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object QryCeClientesDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object QryCeClientesCOMPRAOUTRALOJA: TStringField
      FieldName = 'COMPRAOUTRALOJA'
      Size = 1
    end
    object QryCeClientesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeClientesCARTAOFIDELIDADE: TStringField
      FieldName = 'CARTAOFIDELIDADE'
      Size = 100
    end
    object QryCeClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object QryCeClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object QryCeClientesCD_MUNICIPIO: TStringField
      FieldName = 'CD_MUNICIPIO'
      Size = 10
    end
    object QryCeClientesCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Size = 10
    end
    object QryCeClientesID_PERFIL_CLIENTE: TFloatField
      FieldName = 'ID_PERFIL_CLIENTE'
    end
  end
  object QryCeCRM: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 760
    Top = 472
    object QryCeCRMCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object QryCeCRMCRM: TStringField
      FieldName = 'CRM'
      Size = 10
    end
    object QryCeCRMCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryCeCRMCD_VENDEDOR: TFloatField
      FieldName = 'CD_VENDEDOR'
    end
    object QryCeCRMCODIGO_BARRA: TStringField
      FieldName = 'CODIGO_BARRA'
      Size = 13
    end
    object QryCeCRMDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryCeCRMQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryCeCRMDATA: TDateField
      FieldName = 'DATA'
    end
    object QryCeCRMHORA: TTimeField
      FieldName = 'HORA'
    end
    object QryCeCRMENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCeCRMID_CRM: TFloatField
      FieldName = 'ID_CRM'
    end
    object QryCeCRMUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object QryCeCRMMEDICO: TStringField
      FieldName = 'MEDICO'
      Size = 100
    end
    object QryCeCRMID_MEDICO: TFloatField
      FieldName = 'ID_MEDICO'
    end
    object QryCeCRMID_ENDERECO: TFloatField
      FieldName = 'ID_ENDERECO'
    end
    object QryCeCRMID_AREA: TFloatField
      FieldName = 'ID_AREA'
    end
    object QryCeCRMTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QryCeCRMCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object QryCeCRMIMS: TStringField
      FieldName = 'IMS'
      Size = 1
    end
    object QryCeCRMID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryCeCRMCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryCeCRMFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object QryCeCRMTIPO_CRM: TStringField
      FieldName = 'TIPO_CRM'
      Size = 1
    end
    object QryCeCRMGEN: TStringField
      FieldName = 'GEN'
      Size = 1
    end
    object QryCeCRMCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
  end
  object SqlCRM: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM '#13#10' CRM'#13#10'WHERE'#13#10' CD_VENDA IS NULL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 760
    Top = 352
  end
  object DspCRM: TDataSetProvider
    DataSet = SqlCRM
    Left = 760
    Top = 392
  end
  object CdsCRM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCRM'
    Left = 760
    Top = 432
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
  object SqlInterligacao: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' LOGINTERLIGACAO'#13#10'WHERE'#13#10' ID_LOG = -1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 808
    Top = 176
  end
  object DspInterligacao: TDataSetProvider
    DataSet = SqlInterligacao
    Left = 808
    Top = 216
  end
  object CdsInterligacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspInterligacao'
    Left = 808
    Top = 256
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
  end
  object QryCeInterligacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 544
  end
  object CdsCodigoBarras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 584
  end
  object QryBalancos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 208
    object QryBalancosID_BALANCO: TFloatField
      FieldName = 'ID_BALANCO'
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
    object QryBalancosID_MOTIVO: TFloatField
      FieldName = 'ID_MOTIVO'
    end
    object QryBalancosDATA_CONTAGEM: TDateField
      FieldName = 'DATA_CONTAGEM'
    end
    object QryBalancosHORA_CONTAGEM: TTimeField
      FieldName = 'HORA_CONTAGEM'
    end
    object QryBalancosCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 14
    end
    object QryBalancosCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
    object QryBalancosUSUARIO_ABERTURA: TStringField
      FieldName = 'USUARIO_ABERTURA'
      Size = 100
    end
    object QryBalancosUSUARIO_CONCLUSAO: TStringField
      FieldName = 'USUARIO_CONCLUSAO'
      Size = 100
    end
  end
  object SqlPrecoVendaFilial: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 408
    Top = 608
  end
  object QryPrecoVendaFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 648
  end
  object SqlLogInterligacao: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' MAX(ID_LOG) AS ID_LOG'#13#10'FROM '#13#10' LOGINTERLIGACAO '#13#10'GROUP' +
      ' BY '#13#10' CD_FILIAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 832
    Top = 352
  end
  object DspLogInterligacao: TDataSetProvider
    DataSet = SqlLogInterligacao
    Left = 832
    Top = 392
  end
  object CdsLogInterligacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLogInterligacao'
    Left = 832
    Top = 432
    object CdsLogInterligacaoID_LOG: TFloatField
      FieldName = 'ID_LOG'
    end
  end
  object SqlItensLog: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10' LOGINTERLIGACAO'#13#10'WHERE'#13#10' ID_LOG = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 912
    Top = 352
  end
  object DspItensLog: TDataSetProvider
    DataSet = SqlItensLog
    Left = 912
    Top = 392
  end
  object CdsItensLog: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'DspItensLog'
    Left = 912
    Top = 432
    object CdsItensLogID_LOG: TFloatField
      FieldName = 'ID_LOG'
    end
    object CdsItensLogCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsItensLogIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object CdsItensLogDATA: TDateField
      FieldName = 'DATA'
    end
    object CdsItensLogHORA: TTimeField
      FieldName = 'HORA'
    end
    object CdsItensLogCHAVE_ACESSO: TStringField
      FieldName = 'CHAVE_ACESSO'
      Size = 50
    end
    object CdsItensLogNUMERO_ITENS: TFloatField
      FieldName = 'NUMERO_ITENS'
    end
    object CdsItensLogNUMERO_UNIDADES: TFloatField
      FieldName = 'NUMERO_UNIDADES'
    end
    object CdsItensLogTOTAL_CUSTO: TFloatField
      FieldName = 'TOTAL_CUSTO'
    end
    object CdsItensLogTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
    end
  end
  object SqlControlador: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' COUNT(ID_PRODUTO) AS N_ITENS, '#13#10' SUM(ESTOQUE_1) AS N_U' +
      'NIDADES, '#13#10' SUM(CUSTO_UNITARIO_1) AS T_CUSTO,'#13#10' SUM(PRECO_VENDA_' +
      '1) AS T_VENDA'#13#10'FROM '#13#10' PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 728
    Top = 176
  end
  object DspControlador: TDataSetProvider
    DataSet = SqlControlador
    Left = 728
    Top = 216
  end
  object CdsControlador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspControlador'
    Left = 728
    Top = 256
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
  object CdsContasReceberDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 584
  end
  object SqlContasReceberDeletados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 64
    Top = 544
  end
  object Sql: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 216
  end
  object Dsp1: TDataSetProvider
    DataSet = Sql
    Left = 32
    Top = 256
  end
  object Cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp1'
    Left = 32
    Top = 288
  end
  object CdsSintegraNFEntradaDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 568
  end
  object SqlSintegraNFEntradaDeletados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    Left = 408
    Top = 528
  end
  object SqlVendasFPCallCenter: TSQLDataSet
    CommandText = 
      'SELECT * FROM VENDAS_FP WHERE CD_VENDA = :CD_VENDA AND'#13#10'CD_FILIA' +
      'L = :CD_FILIAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 912
    Top = 176
  end
  object DspVendasFPCallCenter: TDataSetProvider
    DataSet = SqlVendasFPCallCenter
    Left = 912
    Top = 216
  end
  object CdsVendasFPCallCenter: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspVendasFPCallCenter'
    Left = 912
    Top = 256
    object CdsVendasFPCallCenterCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsVendasFPCallCenterCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object CdsVendasFPCallCenterCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object CdsVendasFPCallCenterCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object CdsVendasFPCallCenterCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object CdsVendasFPCallCenterCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object CdsVendasFPCallCenterTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Size = 1
    end
    object CdsVendasFPCallCenterBANCO: TStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object CdsVendasFPCallCenterNUMEROCHEQUE: TStringField
      FieldName = 'NUMEROCHEQUE'
      Size = 6
    end
    object CdsVendasFPCallCenterDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object CdsVendasFPCallCenterVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object QryVendasFPCallCenter: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 912
    Top = 296
    object QryVendasFPCallCenterCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryVendasFPCallCenterCD_VENDA: TFloatField
      FieldName = 'CD_VENDA'
    end
    object QryVendasFPCallCenterCD_FORMA_PAGAMENTO: TFloatField
      FieldName = 'CD_FORMA_PAGAMENTO'
    end
    object QryVendasFPCallCenterCD_CARTAO: TFloatField
      FieldName = 'CD_CARTAO'
    end
    object QryVendasFPCallCenterCD_CLIENTE: TFloatField
      FieldName = 'CD_CLIENTE'
    end
    object QryVendasFPCallCenterCD_CONVENIO: TFloatField
      FieldName = 'CD_CONVENIO'
    end
    object QryVendasFPCallCenterTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Size = 1
    end
    object QryVendasFPCallCenterBANCO: TStringField
      FieldName = 'BANCO'
      Size = 3
    end
    object QryVendasFPCallCenterNUMEROCHEQUE: TStringField
      FieldName = 'NUMEROCHEQUE'
      Size = 6
    end
    object QryVendasFPCallCenterDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object QryVendasFPCallCenterVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object SqlComprasDeletadas: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 544
    Top = 608
  end
  object CdsComprasDeletadas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 648
  end
  object SqlUsuarios: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_USUARIO,'#13#10' SENHA'#13#10'FROM'#13#10' USUARIOS'#13#10'WHERE '#13#10' CD_USUAR' +
      'IO = :CD_USUARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 352
  end
  object DspUsuarios: TDataSetProvider
    DataSet = SqlUsuarios
    Left = 32
    Top = 392
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
    Left = 32
    Top = 432
    object CdsUsuariosCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object CdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
  end
  object QryUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 472
    object QryUsuariosCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object QryUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
  end
  object SqlSintegraPedidos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' SINTEGRA_PEDIDOS_ITENS'#13#10'WHERE'#13#10' CD_FILIAL = :' +
      'CD_FILIAL AND'#13#10' COD_PEDIDOS_ITENS = :CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 304
    Top = 352
  end
  object DspSintegraPedidos: TDataSetProvider
    DataSet = SqlSintegraPedidos
    Left = 304
    Top = 392
  end
  object CdsSintegraPedidos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DspSintegraPedidos'
    Left = 304
    Top = 432
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
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' SINTEGRA_R60I'#13#10'WHERE'#13#10' CD_FILIAL = :CD_FILIAL' +
      ' AND'#13#10' COD_SINTEGRA_R60I = :CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 200
    Top = 352
  end
  object DspSintegraR60I: TDataSetProvider
    DataSet = SqlSintegraR60I
    Left = 200
    Top = 392
  end
  object CdsSintegraR60I: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DspSintegraR60I'
    Left = 200
    Top = 432
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
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' SINTEGRA_R60'#13#10'WHERE'#13#10' CD_FILIAL = :CD_FILIAL ' +
      'AND'#13#10' COD_SINTEGRA_R60 = :CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 104
    Top = 352
  end
  object DspSintegraR60: TDataSetProvider
    DataSet = SqlSintegraR60
    Left = 104
    Top = 392
  end
  object CdsSintegraR60: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DspSintegraR60'
    Left = 104
    Top = 432
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
  object QrySintegraNF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 120
    object QrySintegraNFCOD_NF_ENTRADA: TIntegerField
      FieldName = 'COD_NF_ENTRADA'
      Required = True
    end
    object QrySintegraNFCD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object QrySintegraNFNUM_FORM: TStringField
      FieldName = 'NUM_FORM'
      Size = 30
    end
    object QrySintegraNFSERIE_FORM: TStringField
      FieldName = 'SERIE_FORM'
      Size = 10
    end
    object QrySintegraNFNUM_VIA: TIntegerField
      FieldName = 'NUM_VIA'
    end
    object QrySintegraNFNUM_NF: TStringField
      FieldName = 'NUM_NF'
      Size = 30
    end
    object QrySintegraNFSERIE_NF: TStringField
      FieldName = 'SERIE_NF'
      Size = 10
    end
    object QrySintegraNFSUBSERIE_NF: TStringField
      FieldName = 'SUBSERIE_NF'
      Size = 10
    end
    object QrySintegraNFMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      FixedChar = True
      Size = 2
    end
    object QrySintegraNFSITUACAO_NF: TStringField
      FieldName = 'SITUACAO_NF'
      Size = 2
    end
    object QrySintegraNFEMITENTE_NF: TStringField
      FieldName = 'EMITENTE_NF'
      Size = 2
    end
    object QrySintegraNFNUM_ITENS: TIntegerField
      FieldName = 'NUM_ITENS'
    end
    object QrySintegraNFCOD_CLI_FORNECEDOR: TIntegerField
      FieldName = 'COD_CLI_FORNECEDOR'
    end
    object QrySintegraNFCOD_CLI_DESTINATARIO: TIntegerField
      FieldName = 'COD_CLI_DESTINATARIO'
    end
    object QrySintegraNFCOD_CLI_TRANSP: TIntegerField
      FieldName = 'COD_CLI_TRANSP'
    end
    object QrySintegraNFDATAHORA_EMISSAO: TDateField
      FieldName = 'DATAHORA_EMISSAO'
    end
    object QrySintegraNFDATAHORA_SAIDAENTRADA: TDateField
      FieldName = 'DATAHORA_SAIDAENTRADA'
    end
    object QrySintegraNFDATAHORA_SAIDA: TDateField
      FieldName = 'DATAHORA_SAIDA'
    end
    object QrySintegraNFDATAHORA_RECEBIMENTO: TDateField
      FieldName = 'DATAHORA_RECEBIMENTO'
    end
    object QrySintegraNFNATUREZA_OP: TStringField
      FieldName = 'NATUREZA_OP'
      Size = 255
    end
    object QrySintegraNFCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object QrySintegraNFDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFVALOR_TOTALPRODUTO: TFMTBCDField
      FieldName = 'VALOR_TOTALPRODUTO'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFVALOR_TOTALNF: TFMTBCDField
      FieldName = 'VALOR_TOTALNF'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFBASE_ICMS_SUBST: TFMTBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFOUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFVALOR_ICMS_SUBST: TFMTBCDField
      FieldName = 'VALOR_ICMS_SUBST'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 19
      Size = 2
    end
    object QrySintegraNFVALOR_ISENTO_IPI: TFMTBCDField
      FieldName = 'VALOR_ISENTO_IPI'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFVALOR_ISENTO_ICMS: TFMTBCDField
      FieldName = 'VALOR_ISENTO_ICMS'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFICMS_RETIDO: TFMTBCDField
      FieldName = 'ICMS_RETIDO'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFFAT_01: TStringField
      FieldName = 'FAT_01'
      Size = 30
    end
    object QrySintegraNFVENCIMENTO_01: TSQLTimeStampField
      FieldName = 'VENCIMENTO_01'
    end
    object QrySintegraNFVALOR_01: TFMTBCDField
      FieldName = 'VALOR_01'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFFAT_02: TStringField
      FieldName = 'FAT_02'
      Size = 30
    end
    object QrySintegraNFVENCIMENTO_02: TSQLTimeStampField
      FieldName = 'VENCIMENTO_02'
    end
    object QrySintegraNFVALOR_02: TFMTBCDField
      FieldName = 'VALOR_02'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFFAT_03: TStringField
      FieldName = 'FAT_03'
      Size = 30
    end
    object QrySintegraNFVENCIMENTO_03: TSQLTimeStampField
      FieldName = 'VENCIMENTO_03'
    end
    object QrySintegraNFVALOR_03: TFMTBCDField
      FieldName = 'VALOR_03'
      Precision = 19
      Size = 3
    end
    object QrySintegraNFTRANSP_NOME: TStringField
      FieldName = 'TRANSP_NOME'
      Size = 60
    end
    object QrySintegraNFTRANSP_FRETE_CONTA: TStringField
      FieldName = 'TRANSP_FRETE_CONTA'
      Size = 30
    end
    object QrySintegraNFTRANSP_PLACA_VEICULO: TStringField
      FieldName = 'TRANSP_PLACA_VEICULO'
      Size = 30
    end
    object QrySintegraNFTRANSP_UF_VEICULO: TStringField
      FieldName = 'TRANSP_UF_VEICULO'
      Size = 2
    end
    object QrySintegraNFTRANSP_CNPJ_CPF: TStringField
      FieldName = 'TRANSP_CNPJ_CPF'
      Size = 30
    end
    object QrySintegraNFTRANSP_ENDER: TStringField
      FieldName = 'TRANSP_ENDER'
      Size = 255
    end
    object QrySintegraNFTRANSP_MUNICIPIO: TStringField
      FieldName = 'TRANSP_MUNICIPIO'
      Size = 30
    end
    object QrySintegraNFTRANSP_UF: TStringField
      FieldName = 'TRANSP_UF'
      Size = 2
    end
    object QrySintegraNFTRANSP_IE: TStringField
      FieldName = 'TRANSP_IE'
      Size = 30
    end
    object QrySintegraNFTRANSP_QNT: TIntegerField
      FieldName = 'TRANSP_QNT'
    end
    object QrySintegraNFTRANSP_ESPECIE: TStringField
      FieldName = 'TRANSP_ESPECIE'
      Size = 30
    end
    object QrySintegraNFTRANSP_MARCA: TStringField
      FieldName = 'TRANSP_MARCA'
      Size = 30
    end
    object QrySintegraNFTRANSP_NRO: TIntegerField
      FieldName = 'TRANSP_NRO'
    end
    object QrySintegraNFTRANSP_PESO_B: TStringField
      FieldName = 'TRANSP_PESO_B'
      Size = 30
    end
    object QrySintegraNFTRANSP_PESO_L: TStringField
      FieldName = 'TRANSP_PESO_L'
      Size = 30
    end
    object QrySintegraNFDADOS_ADICIONAIS: TStringField
      FieldName = 'DADOS_ADICIONAIS'
      Size = 255
    end
    object QrySintegraNFOBS: TBlobField
      FieldName = 'OBS'
      Size = 8
    end
    object QrySintegraNFDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object QrySintegraNFENABLED: TIntegerField
      FieldName = 'ENABLED'
    end
    object QrySintegraNFULTATUAL: TSQLTimeStampField
      FieldName = 'ULTATUAL'
    end
    object QrySintegraNFULTATUALCODSETOR: TIntegerField
      FieldName = 'ULTATUALCODSETOR'
    end
    object QrySintegraNFULTATUALCODSETORUSER: TIntegerField
      FieldName = 'ULTATUALCODSETORUSER'
    end
    object QrySintegraNFNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 50
    end
    object QrySintegraNFENDERECO_FORNECEDOR: TStringField
      FieldName = 'ENDERECO_FORNECEDOR'
      Size = 255
    end
    object QrySintegraNFBAIRRO_FORNECEDOR: TStringField
      FieldName = 'BAIRRO_FORNECEDOR'
      Size = 50
    end
    object QrySintegraNFCIDADE_FORNECEDOR: TStringField
      FieldName = 'CIDADE_FORNECEDOR'
      Size = 50
    end
    object QrySintegraNFFONE_FORNECEDOR: TStringField
      FieldName = 'FONE_FORNECEDOR'
      Size = 30
    end
    object QrySintegraNFCEP_FORNECEDOR: TStringField
      FieldName = 'CEP_FORNECEDOR'
      Size = 30
    end
    object QrySintegraNFCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      Size = 30
    end
    object QrySintegraNFIE_FORNECEDOR: TStringField
      FieldName = 'IE_FORNECEDOR'
      Size = 30
    end
    object QrySintegraNFUF_FORNECEDOR: TStringField
      FieldName = 'UF_FORNECEDOR'
      Size = 3
    end
    object QrySintegraNFBRANCOS: TStringField
      FieldName = 'BRANCOS'
    end
    object QrySintegraNFFISCAL: TIntegerField
      FieldName = 'FISCAL'
    end
    object QrySintegraNFENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QrySintegraNFCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 100
    end
  end
  object QrySintegraItensNF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 40
    object QrySintegraItensNFCOD_NF_ENTRADA_ITENS: TIntegerField
      FieldName = 'COD_NF_ENTRADA_ITENS'
      Required = True
    end
    object QrySintegraItensNFCD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object QrySintegraItensNFCOD_NF_ENTRADA: TIntegerField
      FieldName = 'COD_NF_ENTRADA'
      Required = True
    end
    object QrySintegraItensNFCOD_PRODUTOS: TIntegerField
      FieldName = 'COD_PRODUTOS'
    end
    object QrySintegraItensNFREF_PRODUTOS: TStringField
      FieldName = 'REF_PRODUTOS'
      Size = 30
    end
    object QrySintegraItensNFNUM_ITEM: TIntegerField
      FieldName = 'NUM_ITEM'
    end
    object QrySintegraItensNFCL_FIS: TStringField
      FieldName = 'CL_FIS'
      Size = 15
    end
    object QrySintegraItensNFS_TRIB: TStringField
      FieldName = 'S_TRIB'
      Size = 15
    end
    object QrySintegraItensNFPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 50
    end
    object QrySintegraItensNFCOD_GRUPOP: TIntegerField
      FieldName = 'COD_GRUPOP'
    end
    object QrySintegraItensNFCOD_SUBGRUPOP: TIntegerField
      FieldName = 'COD_SUBGRUPOP'
    end
    object QrySintegraItensNFDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object QrySintegraItensNFQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFPRC_CUSTO: TFMTBCDField
      FieldName = 'PRC_CUSTO'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFBASE_ICMS_SUBST: TFMTBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFENABLE_NUMSERIE: TIntegerField
      FieldName = 'ENABLE_NUMSERIE'
    end
    object QrySintegraItensNFOBS: TStringField
      FieldName = 'OBS'
      Size = 255
    end
    object QrySintegraItensNFENABLED: TIntegerField
      FieldName = 'ENABLED'
    end
    object QrySintegraItensNFULTATUAL: TSQLTimeStampField
      FieldName = 'ULTATUAL'
    end
    object QrySintegraItensNFULTATUALCODSETOR: TIntegerField
      FieldName = 'ULTATUALCODSETOR'
    end
    object QrySintegraItensNFULTATUALCODSETORUSER: TIntegerField
      FieldName = 'ULTATUALCODSETORUSER'
    end
    object QrySintegraItensNFAPR_UND: TStringField
      FieldName = 'APR_UND'
      Size = 6
    end
    object QrySintegraItensNFPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFREDUCAO_BASE_ICMS: TFMTBCDField
      FieldName = 'REDUCAO_BASE_ICMS'
      Precision = 19
      Size = 3
    end
    object QrySintegraItensNFENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QrySintegraItensNFCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object QrySintegraItensNFVALOR_ISENTO: TFMTBCDField
      FieldName = 'VALOR_ISENTO'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFVALOR_OUTRASDESPESAS: TFMTBCDField
      FieldName = 'VALOR_OUTRASDESPESAS'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFCOFINS_VALOR: TFMTBCDField
      FieldName = 'COFINS_VALOR'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFCOFINS_PERCENTUAL: TFMTBCDField
      FieldName = 'COFINS_PERCENTUAL'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFCOFINS_BASE_CALCULO: TFMTBCDField
      FieldName = 'COFINS_BASE_CALCULO'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFCOFINS_CST: TStringField
      FieldName = 'COFINS_CST'
      Size = 3
    end
    object QrySintegraItensNFPIS_VALOR: TFMTBCDField
      FieldName = 'PIS_VALOR'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFPIS_PERCENTUAL: TFMTBCDField
      FieldName = 'PIS_PERCENTUAL'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFPIS_BASE_CALCULO: TFMTBCDField
      FieldName = 'PIS_BASE_CALCULO'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFPIS_CST: TStringField
      FieldName = 'PIS_CST'
      Size = 3
    end
    object QrySintegraItensNFPERCENTUAL_ICMS_ST: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFREDUCAO_ICMS_ST: TFMTBCDField
      FieldName = 'REDUCAO_ICMS_ST'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFMARGEM_VALOR_AGREGADO: TFMTBCDField
      FieldName = 'MARGEM_VALOR_AGREGADO'
      Precision = 19
      Size = 2
    end
    object QrySintegraItensNFVALOR_ICMS_SUBTITUICAO: TFMTBCDField
      FieldName = 'VALOR_ICMS_SUBTITUICAO'
      Precision = 19
      Size = 2
    end
  end
  object QrySintegraR60: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 472
    object QrySintegraR60COD_SINTEGRA_R60: TIntegerField
      FieldName = 'COD_SINTEGRA_R60'
      Required = True
    end
    object QrySintegraR60CD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object QrySintegraR60NRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
    end
    object QrySintegraR60NRO_ORDEM_EQP: TStringField
      FieldName = 'NRO_ORDEM_EQP'
      Size = 3
    end
    object QrySintegraR60MODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object QrySintegraR60BRANCOS_60M: TStringField
      FieldName = 'BRANCOS_60M'
      Size = 37
    end
    object QrySintegraR60R60M: TStringField
      FieldName = 'R60M'
      Size = 256
    end
    object QrySintegraR60DATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
    end
    object QrySintegraR60CANCELAMENTO: TFMTBCDField
      FieldName = 'CANCELAMENTO'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60DESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60SUBSTITUICAO_TRIBUTARIA: TFMTBCDField
      FieldName = 'SUBSTITUICAO_TRIBUTARIA'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60ISENTO: TFMTBCDField
      FieldName = 'ISENTO'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60NAO_INCIDENCIA: TFMTBCDField
      FieldName = 'NAO_INCIDENCIA'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60ISSQN: TFMTBCDField
      FieldName = 'ISSQN'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60ALIQUOTA01: TFMTBCDField
      FieldName = 'ALIQUOTA01'
      Precision = 5
      Size = 2
    end
    object QrySintegraR60VALOR_TPARCIAL01: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL01'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60BRANCOS_60A01: TStringField
      FieldName = 'BRANCOS_60A01'
      Size = 79
    end
    object QrySintegraR60R60A01: TStringField
      FieldName = 'R60A01'
      Size = 256
    end
    object QrySintegraR60ALIQUOTA02: TFMTBCDField
      FieldName = 'ALIQUOTA02'
      Precision = 5
      Size = 2
    end
    object QrySintegraR60VALOR_TPARCIAL02: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL02'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60BRANCOS_60A02: TStringField
      FieldName = 'BRANCOS_60A02'
      Size = 79
    end
    object QrySintegraR60R60A02: TStringField
      FieldName = 'R60A02'
      Size = 256
    end
    object QrySintegraR60ALIQUOTA03: TFMTBCDField
      FieldName = 'ALIQUOTA03'
      Precision = 5
      Size = 2
    end
    object QrySintegraR60VALOR_TPARCIAL03: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL03'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60BRANCOS_60A03: TStringField
      FieldName = 'BRANCOS_60A03'
      Size = 79
    end
    object QrySintegraR60R60A03: TStringField
      FieldName = 'R60A03'
      Size = 256
    end
    object QrySintegraR60ALIQUOTA04: TFMTBCDField
      FieldName = 'ALIQUOTA04'
      Precision = 5
      Size = 2
    end
    object QrySintegraR60VALOR_TPARCIAL04: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL04'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60BRANCOS_60A04: TStringField
      FieldName = 'BRANCOS_60A04'
      Size = 79
    end
    object QrySintegraR60R60A04: TStringField
      FieldName = 'R60A04'
      Size = 256
    end
    object QrySintegraR60ALIQUOTA05: TFMTBCDField
      FieldName = 'ALIQUOTA05'
      Precision = 5
      Size = 2
    end
    object QrySintegraR60VALOR_TPARCIAL05: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL05'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60BRANCOS_60A05: TStringField
      FieldName = 'BRANCOS_60A05'
      Size = 79
    end
    object QrySintegraR60R60A05: TStringField
      FieldName = 'R60A05'
      Size = 256
    end
    object QrySintegraR60DATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object QrySintegraR60ULTATUAL: TSQLTimeStampField
      FieldName = 'ULTATUAL'
    end
    object QrySintegraR60ULTATUALCODSETORUSER: TIntegerField
      FieldName = 'ULTATUALCODSETORUSER'
    end
    object QrySintegraR60ULTATUALCODSETOR: TIntegerField
      FieldName = 'ULTATUALCODSETOR'
    end
    object QrySintegraR60NRO_CONTADOR_INICIO: TIntegerField
      FieldName = 'NRO_CONTADOR_INICIO'
    end
    object QrySintegraR60NRO_CONTADOR_FIM: TIntegerField
      FieldName = 'NRO_CONTADOR_FIM'
    end
    object QrySintegraR60NRO_CONTADOR_Z: TIntegerField
      FieldName = 'NRO_CONTADOR_Z'
    end
    object QrySintegraR60CONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object QrySintegraR60VALOR_TOTAL_GERAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL_GERAL'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60VALOR_VENDA_BRUTA: TFMTBCDField
      FieldName = 'VALOR_VENDA_BRUTA'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60BRANCOS: TStringField
      FieldName = 'BRANCOS'
    end
    object QrySintegraR60ENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object QrySintegraR60I: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 472
    object QrySintegraR60ICOD_SINTEGRA_R60I: TIntegerField
      FieldName = 'COD_SINTEGRA_R60I'
      Required = True
    end
    object QrySintegraR60ICD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object QrySintegraR60IDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object QrySintegraR60INRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
    end
    object QrySintegraR60IMODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object QrySintegraR60ICOO: TIntegerField
      FieldName = 'COO'
    end
    object QrySintegraR60INRO_ORDEM_ITEM: TIntegerField
      FieldName = 'NRO_ORDEM_ITEM'
    end
    object QrySintegraR60IREF_PRODUTOS: TStringField
      FieldName = 'REF_PRODUTOS'
      Size = 14
    end
    object QrySintegraR60IQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 19
      Size = 3
    end
    object QrySintegraR60IVALOR_MERCADORIA: TFMTBCDField
      FieldName = 'VALOR_MERCADORIA'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60IBASECALCULO_ICMS: TFMTBCDField
      FieldName = 'BASECALCULO_ICMS'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60IVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 19
      Size = 2
    end
    object QrySintegraR60IALIQUOTA_ICMS: TStringField
      FieldName = 'ALIQUOTA_ICMS'
      Size = 4
    end
    object QrySintegraR60IBRANCOS: TStringField
      FieldName = 'BRANCOS'
      Size = 16
    end
    object QrySintegraR60IENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object QrySintegraPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 472
    object QrySintegraPedidosCOD_PEDIDOS_ITENS: TIntegerField
      FieldName = 'COD_PEDIDOS_ITENS'
    end
    object QrySintegraPedidosCD_FILIAL: TIntegerField
      FieldName = 'CD_FILIAL'
    end
    object QrySintegraPedidosREF_PRODUTOS: TStringField
      FieldName = 'REF_PRODUTOS'
      Size = 30
    end
    object QrySintegraPedidosCL_FIS: TStringField
      FieldName = 'CL_FIS'
      Size = 15
    end
    object QrySintegraPedidosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 50
    end
    object QrySintegraPedidosAPR_UND: TStringField
      FieldName = 'APR_UND'
      Required = True
      Size = 6
    end
    object QrySintegraPedidosS_TRIB: TStringField
      FieldName = 'S_TRIB'
      Size = 15
    end
    object QrySintegraPedidosALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Precision = 19
      Size = 2
    end
    object QrySintegraPedidosALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 19
      Size = 2
    end
    object QrySintegraPedidosREDUCAO_BASE_ICMS: TFMTBCDField
      FieldName = 'REDUCAO_BASE_ICMS'
      Precision = 19
      Size = 3
    end
    object QrySintegraPedidosBASE_ICMS_SUBST: TFMTBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 19
      Size = 3
    end
    object QrySintegraPedidosDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
    end
    object QrySintegraPedidosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlClientesDeletados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 544
    Top = 528
  end
  object CdsClientesDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 568
  end
  object QryPosicaoEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 472
    object QryPosicaoEstoqueDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object QryPosicaoEstoqueCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryPosicaoEstoqueID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryPosicaoEstoqueQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryPosicaoEstoqueCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object QryPosicaoEstoqueVENDA: TFloatField
      FieldName = 'VENDA'
    end
    object QryPosicaoEstoqueENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlPosicaoEstoque: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM '#13#10' POSICAOESTOQUEDATA'#13#10'WHERE'#13#10' CD_FILIAL = :CD_' +
      'FILIAL AND'#13#10' ID_PRODUTO = :ID_PRODUTO AND'#13#10' DATA = :DATA'
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
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 408
    Top = 352
  end
  object DspPosicaoEstoque: TDataSetProvider
    DataSet = SqlPosicaoEstoque
    Left = 408
    Top = 392
  end
  object CdsPosicaoEstoque: TClientDataSet
    Aggregates = <>
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
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'DspPosicaoEstoque'
    Left = 408
    Top = 432
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
  object SqlLimiteSaldoClientes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CD_CLIENTE,'#13#10' LIMITE_CREDITO,'#13#10' LIMITE_PERCENTUAL,'#13#10' SA' +
      'LDO'#13#10'FROM'#13#10' CLIENTES'#13#10'WHERE'#13#10' CD_CLIENTE = :CD_CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1032
    Top = 176
  end
  object DspLimiteSaldoClientes: TDataSetProvider
    DataSet = SqlLimiteSaldoClientes
    Left = 1032
    Top = 216
  end
  object CdsLimiteSaldoClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'DspLimiteSaldoClientes'
    Left = 1032
    Top = 256
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
  object QryLimiteSaldoClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1032
    Top = 296
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
  end
  object CdsConsistenciaCR: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 544
  end
  object QryProdutosLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 288
    object QryProdutosLotesID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryProdutosLotesCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object QryProdutosLotesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QryProdutosLotesCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object QryProdutosLotesCODIGO_BARRAS_2: TStringField
      FieldName = 'CODIGO_BARRAS_2'
      Size = 13
    end
    object QryProdutosLotesLOTE: TStringField
      FieldName = 'LOTE'
      Required = True
    end
    object QryProdutosLotesFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object QryProdutosLotesVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object QryProdutosLotesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryProdutosLotesQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
    end
    object QryProdutosLotesCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryProdutosLotesID_PRODUTO_LOTE: TFloatField
      FieldName = 'ID_PRODUTO_LOTE'
    end
    object QryProdutosLotesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlAtualizaLancamentos: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_LANCAMENTOS ('#13#10':CD_LANCAMENTO, :ID' +
      '_PRODUTO, :ID_PRODUTO_LOTE, :CD_FILIAL, :CD_PRODUTO, :DESCRICAO,' +
      ' :CD_LABORATORIO, :CD_GRUPO,'#13#10':CD_CLASSE, :CD_CONVENIO, :CD_CLIE' +
      'NTE, :CD_VENDEDOR, :CD_OPERADOR, :CD_USUARIO, :CD_FORMA_PAGAMENT' +
      'O,'#13#10':CD_VENDA, :ID_OPERADORCAIXA, :CUSTO_MEDIO, :CUSTO_UNITARIO,' +
      ' :DATA_LANCAMENTO, :DATA_CAIXA, :QUANTIDADE,'#13#10':VALOR, :COMISSAO,' +
      ' :NOTA_FISCAL, :DESCONTO, :PROMOCAO, :TIPO_VENDA, :TIPO_PAGAMENT' +
      'O, :ENTRADA_SAIDA,'#13#10':ETIQUETA, :ENTREGA, :HORA, :ESTOQUE_POSVEND' +
      'A, :TROCA, :ENVIADO, :NUMERO, :TERMINAL, :USUARIO,'#13#10':OBSERVACAO,' +
      ' :ARREDONDAMENTO, :TRN, :TRANSACAOTRN, :LOTETRN, :AUTORIZACAOTRN' +
      ', :SUBSIDIOTRN,'#13#10':NOTAMANUAL, :CD_FILIAL_ORIGEM, :NCM, :CFOP, :C' +
      'ST, :ICMS, :CODIGO_BARRAS, :ECF, :CD_SUBGRUPO, :SERIE_NOTA_FISCA' +
      'L, :ID_CLIENTE_PROPRIEDADE, :CEST, :FCP, :PERCENTUALREDUCAO, :CO' +
      'MPOSTO, :ID_PRODUTO_PRINCIPAL, :VENDA_FIDELIDADE, :VENDA_QUANTID' +
      'ADE, :IFOOD, :FARMACIASAPP)'#13#10
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
        Name = 'ID_PRODUTO_LOTE'
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
        DataType = ftDate
        Name = 'DATA_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
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
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NCM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CFOP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ECF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_SUBGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_CLIENTE_PROPRIEDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FCP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUALREDUCAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPOSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO_PRINCIPAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VENDA_FIDELIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VENDA_QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IFOOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FARMACIASAPP'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 384
    Top = 88
  end
  object SqlAtualizaCaixa: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CAIXA('#13#10'      :CD_CAIXA,          ' +
      #13#10'      :CD_FILIAL,         '#13#10'      :CD_CONVENIO,       '#13#10'      ' +
      ':CD_CLIENTE,        '#13#10'      :CD_VENDEDOR,       '#13#10'      :CD_OPER' +
      'ADOR,       '#13#10'      :CD_USUARIO,        '#13#10'      :CD_FORMA_PAGAME' +
      'NTO,'#13#10'      :CD_PLANO_CONTAS,   '#13#10'      :CD_CARTAO,         '#13#10'  ' +
      '    :CD_VENDA,          '#13#10'      :ID_OPERADORCAIXA,  '#13#10'      :TIP' +
      'O_CARTAO,       '#13#10'      :DATA,              '#13#10'      :HORA,      ' +
      '        '#13#10'      :VALOR,             '#13#10'      :DOCUMENTO,         ' +
      #13#10'      :DESCONTO,          '#13#10'      :TIPO_VENDA,        '#13#10'      ' +
      ':ENTRADA_SAIDA,     '#13#10'      :ENTREGA,           '#13#10'      :TROCA, ' +
      '            '#13#10'      :ENVIADO,           '#13#10'      :USUARIO,       ' +
      '    '#13#10'      :NUMERO,            '#13#10'      :DATA_VENCIMENTO,   '#13#10'  ' +
      '    :TERMINAL,          '#13#10'      :NR_CHEQUE,         '#13#10'      :NR_' +
      'BANCO,          '#13#10'      :DATA_CAIXA,        '#13#10'      :OBSERVACAO,' +
      '        '#13#10'      :ARREDONDAMENTO,    '#13#10'      :TEFTRANSACAO,      ' +
      #13#10'      :TEFLOTE,           '#13#10'      :TEFAUTORIZACAO,    '#13#10'      ' +
      ':TEFDATA,           '#13#10'      :TEFHORA,           '#13#10'      :TEFVALO' +
      'R,          '#13#10'      :TEFNOMEREDE,       '#13#10'      :STATUS,        ' +
      '    '#13#10'      :TRN,               '#13#10'      :TRANSACAOTRN,      '#13#10'  ' +
      '    :LOTETRN,           '#13#10'      :AUTORIZACAOTRN,    '#13#10'      :PAR' +
      'CELA,           '#13#10'      :CD_FILIAL_ORIGEM,           '#13#10'      :EC' +
      'F)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_CAIXA'
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
        Name = 'CD_PLANO_CONTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CARTAO'
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
        DataType = ftString
        Name = 'TIPO_CARTAO'
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
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENTRADA_SAIDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENTREGA'
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
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TERMINAL'
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
        Name = 'DATA_CAIXA'
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
        DataType = ftFloat
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
        DataType = ftFloat
        Name = 'TEFVALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEFNOMEREDE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
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
        Name = 'PARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ECF'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 136
    Top = 8
  end
  object SqlAtualizaProdutosTotais: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOS_TOTAIS('#13#10':ID_PRODUTO,'#13#10':C' +
      'D_FILIAL,'#13#10':CAMPO1,'#13#10':CAMPO2,'#13#10':VALOR1,'#13#10':VALOR2)'
    MaxBlobSize = -1
    Params = <
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
        Name = 'CAMPO1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAMPO2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VALOR1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VALOR2'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 248
    Top = 8
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
    Left = 136
    Top = 88
  end
  object SqlAtualizaSintegraNFItens: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_SINTEGRANFITENS('#13#10'      :COD_NF_EN' +
      'TRADA_ITENS,'#13#10'      :CD_FILIAL,'#13#10'      :COD_NF_ENTRADA,'#13#10'      :' +
      'COD_PRODUTOS,'#13#10'      :REF_PRODUTOS,'#13#10'      :NUM_ITEM,'#13#10'      :CL' +
      '_FIS,'#13#10'      :S_TRIB,'#13#10'      :PRODUTO,'#13#10'      :COD_GRUPOP,'#13#10'    ' +
      '  :COD_SUBGRUPOP,'#13#10'      :DATAHORA,'#13#10'      :QUANTIDADE,'#13#10'      :' +
      'PRC_CUSTO,'#13#10'      :VALOR_DESCONTO,'#13#10'      :VALOR_IPI,'#13#10'      :SU' +
      'BTOTAL,'#13#10'      :BASE_ICMS,'#13#10'      :BASE_ICMS_SUBST,'#13#10'      :VALO' +
      'R_ICMS,'#13#10'      :ENABLE_NUMSERIE,'#13#10'      :OBS,'#13#10'      :ENABLED,'#13#10 +
      '      :ULTATUAL,'#13#10'      :ULTATUALCODSETOR,'#13#10'      :ULTATUALCODSE' +
      'TORUSER,'#13#10'      :APR_UND,'#13#10'      :PERC_DESCONTO,'#13#10'      :ALIQUOT' +
      'A_IPI,'#13#10'      :ALIQUOTA_ICMS,'#13#10'      :REDUCAO_BASE_ICMS,'#13#10'      ' +
      ':ENVIADO,'#13#10'      :CFOP,'#13#10'      :VALOR_ICMS_SUBTITUICAO,'#13#10'      :' +
      'MARGEM_VALOR_AGREGADO,'#13#10'      :REDUCAO_ICMS_ST,'#13#10'      :PERCENTU' +
      'AL_ICMS_ST,'#13#10'      :PIS_CST,'#13#10'      :PIS_BASE_CALCULO,'#13#10'      :P' +
      'IS_PERCENTUAL,'#13#10'      :PIS_VALOR,'#13#10'      :COFINS_CST,'#13#10'      :CO' +
      'FINS_BASE_CALCULO,'#13#10'      :COFINS_PERCENTUAL,'#13#10'      :COFINS_VAL' +
      'OR,'#13#10'      :VALOR_OUTRAS_DESPESAS,'#13#10'      :VALOR_FRETE,'#13#10'      :' +
      'VALOR_SEGURO,'#13#10'      :VALOR_ISENTO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_NF_ENTRADA_ITENS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_NF_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REF_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CL_FIS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'S_TRIB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_GRUPOP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_SUBGRUPOP'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAHORA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRC_CUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUBTOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BASE_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BASE_ICMS_SUBST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENABLE_NUMSERIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ENABLED'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'ULTATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ULTATUALCODSETOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ULTATUALCODSETORUSER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'APR_UND'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERC_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQUOTA_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQUOTA_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REDUCAO_BASE_ICMS'
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
        Name = 'VALOR_ICMS_SUBTITUICAO'
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
        Name = 'VALOR_FRETE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ISENTO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 384
    Top = 8
  end
  object SqlAtualizaSintegraNF: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_SINTEGRANF('#13#10'          :COD_NF_ENT' +
      'RADA,       '#13#10'          :CD_FILIAL,            '#13#10'          :NUM_' +
      'FORM,             '#13#10'          :SERIE_FORM,           '#13#10'         ' +
      ' :NUM_VIA,              '#13#10'          :NUM_NF,               '#13#10'   ' +
      '       :SERIE_NF,             '#13#10'          :SUBSERIE_NF,         ' +
      ' '#13#10'          :MODELO_NF,            '#13#10'          :SITUACAO_NF,   ' +
      '       '#13#10'          :EMITENTE_NF,          '#13#10'          :NUM_ITENS' +
      ',            '#13#10'          :COD_CLI_FORNECEDOR,   '#13#10'          :COD' +
      '_CLI_DESTINATARIO, '#13#10'          :COD_CLI_TRANSP,       '#13#10'        ' +
      '  :DATAHORA_EMISSAO,     '#13#10'          :DATAHORA_SAIDAENTRADA,'#13#10'  ' +
      '        :DATAHORA_SAIDA,       '#13#10'          :DATAHORA_RECEBIMENTO' +
      ', '#13#10'          :NATUREZA_OP,          '#13#10'          :CFOP,         ' +
      '        '#13#10'          :DESCONTO,             '#13#10'          :VALOR_TO' +
      'TALPRODUTO,   '#13#10'          :VALOR_TOTALNF,        '#13#10'          :AL' +
      'IQUOTA_ICMS,        '#13#10'          :BASE_ICMS,            '#13#10'       ' +
      '   :VALOR_FRETE,          '#13#10'          :VALOR_ICMS,           '#13#10' ' +
      '         :VALOR_SEGURO,         '#13#10'          :BASE_ICMS_SUBST,   ' +
      '   '#13#10'          :OUTRAS_DESPESAS,      '#13#10'          :VALOR_ICMS_SU' +
      'BST,     '#13#10'          :VALOR_IPI,            '#13#10'          :VALOR_I' +
      'SENTO_IPI,     '#13#10'          :VALOR_ISENTO_ICMS,    '#13#10'          :I' +
      'CMS_RETIDO,          '#13#10'          :FAT_01,               '#13#10'      ' +
      '    :VENCIMENTO_01,        '#13#10'          :VALOR_01,             '#13#10 +
      '          :FAT_02,               '#13#10'          :VENCIMENTO_02,    ' +
      '    '#13#10'          :VALOR_02,             '#13#10'          :FAT_03,     ' +
      '          '#13#10'          :VENCIMENTO_03,        '#13#10'          :VALOR_' +
      '03,             '#13#10'          :TRANSP_NOME,          '#13#10'          :' +
      'TRANSP_FRETE_CONTA,   '#13#10'          :TRANSP_PLACA_VEICULO, '#13#10'     ' +
      '     :TRANSP_UF_VEICULO,    '#13#10'          :TRANSP_CNPJ_CPF,      '#13 +
      #10'          :TRANSP_ENDER,         '#13#10'          :TRANSP_MUNICIPIO,' +
      '     '#13#10'          :TRANSP_UF,            '#13#10'          :TRANSP_IE, ' +
      '           '#13#10'          :TRANSP_QNT,           '#13#10'          :TRANS' +
      'P_ESPECIE,       '#13#10'          :TRANSP_MARCA,         '#13#10'          ' +
      ':TRANSP_NRO,           '#13#10'          :TRANSP_PESO_B,        '#13#10'    ' +
      '      :TRANSP_PESO_L,        '#13#10'          :DADOS_ADICIONAIS,     ' +
      #13#10'          :DATAHORA,             '#13#10'          :ENABLED,        ' +
      '      '#13#10'          :ULTATUAL,             '#13#10'          :ULTATUALCO' +
      'DSETOR,     '#13#10'          :ULTATUALCODSETORUSER, '#13#10'          :NOME' +
      '_FORNECEDOR,      '#13#10'          :ENDERECO_FORNECEDOR,  '#13#10'         ' +
      ' :BAIRRO_FORNECEDOR,    '#13#10'          :CIDADE_FORNECEDOR,    '#13#10'   ' +
      '       :FONE_FORNECEDOR,      '#13#10'          :CEP_FORNECEDOR,      ' +
      ' '#13#10'          :CNPJ_FORNECEDOR,      '#13#10'          :IE_FORNECEDOR, ' +
      '       '#13#10'          :UF_FORNECEDOR,        '#13#10'          :BRANCOS, ' +
      '             '#13#10'          :FISCAL,               '#13#10'          :ENV' +
      'IADO,'#13#10'      :CHAVENFE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_NF_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_FORM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_FORM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_VIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_NF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_NF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SUBSERIE_NF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODELO_NF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SITUACAO_NF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMITENTE_NF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_ITENS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CLI_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CLI_DESTINATARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CLI_TRANSP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAHORA_EMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAHORA_SAIDAENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAHORA_SAIDA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAHORA_RECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATUREZA_OP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CFOP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTALPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTALNF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALIQUOTA_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BASE_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_FRETE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BASE_ICMS_SUBST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'OUTRAS_DESPESAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ICMS_SUBST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ISENTO_IPI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ISENTO_ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ICMS_RETIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAT_01'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'VENCIMENTO_01'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_01'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAT_02'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'VENCIMENTO_02'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_02'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FAT_03'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'VENCIMENTO_03'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_03'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_FRETE_CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_PLACA_VEICULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_UF_VEICULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_CNPJ_CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_ENDER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_IE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TRANSP_QNT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_ESPECIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_MARCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TRANSP_NRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_PESO_B'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRANSP_PESO_L'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DADOS_ADICIONAIS'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATAHORA'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'ENABLED'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'ULTATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ULTATUALCODSETOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ULTATUALCODSETORUSER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FONE_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IE_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BRANCOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CHAVENFE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 248
    Top = 88
  end
  object SqlAtualizaEstoqueMinimo: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_ESTOQUEMINIMO ('#13#10'    :CD_FILIAL,'#13#10 +
      '    :ID_PRODUTO,'#13#10'    :ESTOQUE,'#13#10'    :CUSTO_UNITARIO,'#13#10'    :CUST' +
      'O_MEDIO,'#13#10'    :IDENTIFICADOR,'#13#10'    :FACE,'#13#10'    :DT_ULT_VENDA,'#13#10' ' +
      '   :DT_ULT_COMPRA)'
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
        Name = 'ESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CUSTO_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CUSTO_MEDIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDENTIFICADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FACE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_ULT_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 744
    Top = 8
  end
  object SqlAtualizaLancamentosAPrazo: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_LANCAMENTOSAPRAZO ('#13#10#13#10':CD_LANCAME' +
      'NTO, :ID_PRODUTO, :CD_FILIAL, :CD_PRODUTO, :DESCRICAO, :CD_LABOR' +
      'ATORIO, :CD_GRUPO,'#13#10':CD_CLASSE, :CD_CONVENIO, :CD_CLIENTE, :CD_V' +
      'ENDEDOR, :CD_OPERADOR, :CD_USUARIO, :CD_FORMA_PAGAMENTO,'#13#10':CD_VE' +
      'NDA, :ID_OPERADORCAIXA, :CUSTO_MEDIO, :CUSTO_UNITARIO, :DATA_LAN' +
      'CAMENTO, :DATA_CAIXA, :QUANTIDADE,'#13#10':VALOR, :COMISSAO, :NOTA_FIS' +
      'CAL, :DESCONTO, :PROMOCAO, :TIPO_VENDA, :TIPO_PAGAMENTO, :ENTRAD' +
      'A_SAIDA,'#13#10':ETIQUETA, :ENTREGA, :HORA, :ESTOQUE_POSVENDA, :TROCA,' +
      ' :ENVIADO, :NUMERO, :TERMINAL, :USUARIO,'#13#10':OBSERVACAO, :ARREDOND' +
      'AMENTO, :TRN, :TRANSACAOTRN, :LOTETRN, :AUTORIZACAOTRN, :SUBSIDI' +
      'OTRN,'#13#10':NOTAMANUAL)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONVENIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_OPERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_FORMA_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_OPERADORCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CUSTO_MEDIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CUSTO_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATA_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATA_CAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'COMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PROMOCAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ENTRADA_SAIDA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ETIQUETA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ENTREGA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ESTOQUE_POSVENDA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TROCA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TERMINAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ARREDONDAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TRN'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TRANSACAOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'LOTETRN'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'AUTORIZACAOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SUBSIDIOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NOTAMANUAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 616
    Top = 88
  end
  object SqlAtualizaContasReceber: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONTAS_RECEBER ('#13#10'        :CD_CONT' +
      'AS_RECEBER,'#13#10'        :CD_CLIENTE,'#13#10'        :CD_PLANO_CONTAS,'#13#10'  ' +
      '      :CD_FILIAL,'#13#10'        :CD_CONVENIO,'#13#10'        :CD_VENDEDOR,'#13 +
      #10'        :CD_VENDA,'#13#10'        :CD_FORMA_PAGAMENTO,'#13#10'        :CD_C' +
      'ONTA,'#13#10'        :CD_CARTAO,'#13#10'        :CD_BORDERO,'#13#10'        :DT_LA' +
      'NCAMENTO,'#13#10'        :DT_VENCIMENTO,'#13#10'        :NOTA_FISCAL,'#13#10'     ' +
      '   :SERIE_NOTA,'#13#10'        :DOCUMENTO,'#13#10'        :DT_NOTA_FISCAL,'#13#10 +
      '        :VENCTO,'#13#10'        :VALOR,'#13#10'        :HISTORICO,'#13#10'        ' +
      ':CD_CHEQUE_RECEBIDO,'#13#10'        :NR_CHEQUE,'#13#10'        :NR_BANCO,'#13#10' ' +
      '       :DT_PAGAMENTO,'#13#10'        :VL_PAGAMENTO,'#13#10'        :VL_JUROS' +
      ','#13#10'        :VL_DESCONTO,'#13#10'        :VL_SALDO,'#13#10'        :NOSSO_NUM' +
      'ERO,'#13#10'        :BANCO,'#13#10'        :AGENCIA,'#13#10'        :CONTA,'#13#10'     ' +
      '   :HISTORICO_BANCO,'#13#10'        :STATUS,'#13#10'        :GERABOLETO,'#13#10'  ' +
      '      :BOLETOGERADO,'#13#10'        :DT_ALTERACAO,'#13#10'        :TEFTRANSA' +
      'CAO,'#13#10'        :TEFLOTE,'#13#10'        :TEFAUTORIZACAO,'#13#10'        :TEFD' +
      'ATA,'#13#10'        :TEFHORA,'#13#10'        :TEFNOMEREDE,'#13#10'        :TEFVALO' +
      'R,'#13#10'        :ENVIADO,'#13#10'        :TRNTRANSACAO,'#13#10'        :TRNLOTE,' +
      #13#10'        :TRNAUTORIZACAO,'#13#10'        :TRN,'#13#10'        :CD_FILIAL_PA' +
      'GAMENTO,'#13#10'        :PARCELA,'#13#10'        :CD_CAIXA,'#13#10'        :CD_FIL' +
      'IAL_ORIGEM,'#13#10'        :OBSERVACAO)'#13#10
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
        DataType = ftUnknown
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
        DataType = ftString
        Name = 'TEFTRANSACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
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
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 504
    Top = 88
  end
  object SqlAtualizaContasPagar: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONTAS_PAGAR ('#13#10'          :CD_CONT' +
      'AS_PAGAR,'#13#10'          :CD_FILIAL,'#13#10'          :CD_DISTRIBUIDOR,'#13#10' ' +
      '         :CD_COMPRAS,'#13#10'          :CD_CONTA,'#13#10'          :CD_FORMA' +
      '_PAGAMENTO,'#13#10'          :CD_PLANO_CONTAS,'#13#10'          :NUMERO_NOTA' +
      ','#13#10'          :SERIAL_NOTA,'#13#10'          :DOCUMENTO,'#13#10'          :DT' +
      '_NOTA,'#13#10'          :DT_VENCIMENTO,'#13#10'          :VALOR,'#13#10'          ' +
      ':DT_LANCAMENTO,'#13#10'          :DT_PAGAMENTO,'#13#10'          :DT_BOLETO,' +
      #13#10'          :DT_ENTRADA,'#13#10'          :VL_PAGAMENTO,'#13#10'          :V' +
      'L_JUROS,'#13#10'          :VL_DESCONTO,'#13#10'          :VL_SALDO,'#13#10'       ' +
      '   :NOSSO_NUMERO,'#13#10'          :BANCO,'#13#10'          :AGENCIA,'#13#10'     ' +
      '     :CONTA,'#13#10'          :HISTORICO,'#13#10'          :NR_CHEQUE,'#13#10'    ' +
      '      :STATUS,'#13#10'          :ENVIADO,'#13#10'          :DESPESAFINANCEIR' +
      'A)'#13#10
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
    Left = 616
    Top = 8
  end
  object SqlAtualizaTransfer: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_TRANSFER ('#13#10'          :CD_TRANSFER' +
      ','#13#10'          :DATA_GERACAO,'#13#10'          :HORA_GERACAO,'#13#10'         ' +
      ' :DATA_ENVIO,'#13#10'          :HORA_ENVIO,'#13#10'          :DATA_CONCLUSAO' +
      ','#13#10'          :HORA_CONCLUSAO,'#13#10'          :CD_FILIAL_ORIGEM,'#13#10'   ' +
      '       :CD_FILIAL_DESTINO,'#13#10'          :CD_USUARIO_ORIGEM,'#13#10'     ' +
      '     :CD_USUARIO_DESTINO,'#13#10'          :OBSERVACOES,'#13#10'          :E' +
      'NVIADO,'#13#10'          :STATUS, '#13#10' :CD_VENDEDOR  )'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_TRANSFER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA_GERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORA_GERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORA_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA_CONCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORA_CONCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_FILIAL_DESTINO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO_DESTINO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACOES'
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
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 864
    Top = 8
  end
  object SqlAtualizaItensTransfer: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_ITENS_TRANSFER ('#13#10'        :CD_TRAN' +
      'SFER,'#13#10'        :ID_PRODUTO,'#13#10'        :CD_PRODUTO,'#13#10'        :CD_C' +
      'LASSE,'#13#10'        :CD_GRUPO,'#13#10'        :CD_LABORATORIO,'#13#10'        :D' +
      'ESCRICAO,'#13#10'        :QUANTIDADE_SOLICITADA,'#13#10'        :QUANTIDADE_' +
      'ENVIADA,'#13#10'        :QUANTIDADE_RECEBIDA,'#13#10'        :VALOR,'#13#10'      ' +
      '  :OBSERVACOES,'#13#10'        :STATUS)'#13#10
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
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
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
        Name = 'QUANTIDADE_SOLICITADA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE_ENVIADA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE_RECEBIDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACOES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 864
    Top = 88
  end
  object SqlAtualizaEntregas: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_ENTREGAS ('#13#10'        :CD_FILIAL,'#13#10' ' +
      '       :CD_VENDA,'#13#10'        :CD_ENTREGADOR,'#13#10'        :CD_CLIENTE,' +
      #13#10'        :NOME,'#13#10'        :ENDERECO,'#13#10'        :BAIRRO,'#13#10'        ' +
      ':REFERENCIA,'#13#10'        :DATA,'#13#10'        :HORA_SAIDA,'#13#10'        :HOR' +
      'A_CHEGADA,'#13#10'        :TROCO,'#13#10'        :VALORRETORNO,'#13#10'        :EN' +
      'VIADO,'#13#10'        :STATUS)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_ENTREGADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
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
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA_SAIDA'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA_CHEGADA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TROCO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORRETORNO'
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
      end>
    SQLConnection = SQLConnection1
    Left = 984
    Top = 8
  end
  object SqlAtualizaCadernoFaltas: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CADERNO_FALTAS ('#13#10'    :CD_FILIAL,'#13 +
      #10'    :ID_PRODUTO,'#13#10'    :CD_PRODUTO,'#13#10'    :CD_CLIENTE,'#13#10'    :CLIE' +
      'NTE,'#13#10'    :DESCRICAO,'#13#10'    :CD_GRUPO,'#13#10'    :CD_LABORATORIO,'#13#10'   ' +
      ' :CD_CLASSE,'#13#10'    :CURVA,'#13#10'    :CD_VENDEDOR,'#13#10'    :DATA,'#13#10'    :Q' +
      'UANTIDADE,'#13#10'    :ID_MOTIVOFALTA,'#13#10'    :STATUS)'#13#10
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
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLIENTE'
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
        DataType = ftFloat
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CURVA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_MOTIVOFALTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 984
    Top = 88
  end
  object SqlAtualizaBalanco: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_BALANCO ('#13#10'          :ID_BALANCO,'#13 +
      #10'          :ID_MOTIVO,'#13#10'          :DATA,'#13#10'          :HORA,'#13#10'    ' +
      '      :DATA_ABERTURA,'#13#10'          :HORA_ABERTURA,'#13#10'          :DAT' +
      'A_CONTAGEM,'#13#10'          :HORA_CONTAGEM,'#13#10'          :DATA_CONCLUSA' +
      'O,'#13#10'          :HORA_CONCLUSAO,'#13#10'          :CD_FILIAL,'#13#10'         ' +
      ' :ID_PRODUTO,'#13#10'          :CD_PRODUTO,'#13#10'          :CODIGO_BARRAS_' +
      '1,'#13#10'          :CODIGO_BARRAS_2,'#13#10'          :DESCRICAO,'#13#10'        ' +
      '  :CD_GRUPO,'#13#10'          :GRUPO,'#13#10'          :CD_LABORATORIO,'#13#10'   ' +
      '       :LABORATORIO,'#13#10'          :CD_CLASSE,'#13#10'          :CLASSE,'#13 +
      #10'          :CUSTO_UNITARIO,'#13#10'          :PRECO_VENDA,'#13#10'          ' +
      ':PRECO_VENDA_ANTERIOR,'#13#10'          :ESTOQUE,'#13#10'          :ESTOQUE_' +
      'ANTERIOR,'#13#10'          :SUBSTITUIESTOQUE,'#13#10'          :STATUS,'#13#10'   ' +
      '       :ENVIADO,'#13#10'          :CD_SUBGRUPO,'#13#10'          :USUARIO_AB' +
      'ERTURA'#13#10',          :USUARIO_CONCLUSAO  )'#13#10
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
    Left = 136
    Top = 176
  end
  object SqlAtualizaProdutosLotes: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOSLOTES ('#13#10'        :ID_PRODU' +
      'TO,'#13#10'        :CD_FILIAL,'#13#10'        :CD_PRODUTO,'#13#10'        :DESCRIC' +
      'AO,'#13#10'        :CODIGO_BARRAS_1,'#13#10'        :CODIGO_BARRAS_2,'#13#10'     ' +
      '   :LOTE,'#13#10'        :FABRICACAO,'#13#10'        :VALIDADE,'#13#10'        :QU' +
      'ANTIDADE,'#13#10'        :ID_PRODUTO_LOTE,'#13#10'        :QUANTIDADE_ENTRAD' +
      'A,'#13#10'        :ENVIADO)'#13#10
    MaxBlobSize = -1
    Params = <
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
        Name = 'LOTE'
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
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO_LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 136
    Top = 256
  end
  object SqlCadClasse: TSQLDataSet
    CommandText = 'SELECT'#13#10'  *'#13#10'FROM'#13#10'  CLASSES'#13#10'ORDER BY'#13#10'  CD_CLASSE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 879
    Top = 521
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
    Left = 879
    Top = 563
  end
  object DsCadClasse: TDataSource
    DataSet = CdsCadClasse
    Left = 879
    Top = 620
  end
  object CdsCadClasse: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspCadClasse'
    Left = 880
    Top = 592
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
  object SqlCadContas: TSQLDataSet
    CommandText = 'SELECT'#13#10' *'#13#10'FROM'#13#10'  CONTAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 967
    Top = 521
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
    object SqlCadContasCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DspCadContas: TDataSetProvider
    DataSet = SqlCadContas
    UpdateMode = upWhereKeyOnly
    Left = 965
    Top = 563
  end
  object CdsCadContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCadContas'
    Left = 964
    Top = 592
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
      LookupDataSet = CdsCadFiliais
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
    object CdsCadContasCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
    end
  end
  object DsCadContas: TDataSource
    DataSet = CdsCadContas
    Left = 963
    Top = 620
  end
  object SqlBaixaAutomaticaChequePre: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' FIRST 1000 * '#13#10'FROM'#13#10' CONTAS_RECEBER '#13#10'WHERE'#13#10' DT_VENCI' +
      'MENTO <= CURRENT_DATE AND'#13#10' STATUS = '#39'A'#39' AND'#13#10' (CD_FORMA_PAGAMEN' +
      'TO = 2 OR '#13#10'  CD_FORMA_PAGAMENTO = 4 OR '#13#10'  CD_FORMA_PAGAMENTO =' +
      ' 6)'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 520
    Top = 184
  end
  object DspBaixaAutomaticaChequePre: TDataSetProvider
    DataSet = SqlBaixaAutomaticaChequePre
    Left = 520
    Top = 219
  end
  object CdsBaixaAutomaticaChequePre: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBaixaAutomaticaChequePre'
    Left = 520
    Top = 248
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
    SQLConnection = SQLConnection1
    Left = 648
    Top = 178
  end
  object DspMovimentoCaixa: TDataSetProvider
    DataSet = SqlMovimentoCaixa
    Left = 648
    Top = 217
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
    Left = 648
    Top = 253
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
  object DspSaldo: TDataSetProvider
    DataSet = SqlSaldo
    Left = 401
    Top = 217
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
    Left = 401
    Top = 253
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
    SQLConnection = SQLConnection1
    Left = 400
    Top = 178
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
  object QryConferenciaNota: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 208
    object QryConferenciaNotaID_CONFERENCIANOTA: TFloatField
      FieldName = 'ID_CONFERENCIANOTA'
      Required = True
    end
    object QryConferenciaNotaCD_COMPRAS: TFloatField
      FieldName = 'CD_COMPRAS'
    end
    object QryConferenciaNotaCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object QryConferenciaNotaNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Size = 7
    end
    object QryConferenciaNotaID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryConferenciaNotaCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 6
    end
    object QryConferenciaNotaCODIGO_BARRAS_1: TStringField
      FieldName = 'CODIGO_BARRAS_1'
      Size = 13
    end
    object QryConferenciaNotaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object QryConferenciaNotaCD_CLASSE: TFloatField
      FieldName = 'CD_CLASSE'
    end
    object QryConferenciaNotaCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
    object QryConferenciaNotaCD_LABORATORIO: TFloatField
      FieldName = 'CD_LABORATORIO'
    end
    object QryConferenciaNotaCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 100
    end
    object QryConferenciaNotaGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object QryConferenciaNotaLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Size = 100
    end
    object QryConferenciaNotaVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object QryConferenciaNotaVL_UNITARIO_NOTA: TFloatField
      FieldName = 'VL_UNITARIO_NOTA'
    end
    object QryConferenciaNotaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryConferenciaNotaQUANTIDADE_NOTA: TFloatField
      FieldName = 'QUANTIDADE_NOTA'
    end
    object QryConferenciaNotaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object QryConferenciaNotaSTATUSCONFERENCIA: TStringField
      FieldName = 'STATUSCONFERENCIA'
      Size = 1
    end
    object QryConferenciaNotaCD_USUARIO_CONFERENCIA: TFloatField
      FieldName = 'CD_USUARIO_CONFERENCIA'
    end
    object QryConferenciaNotaUSUARIO_CONFERENCIA: TStringField
      FieldName = 'USUARIO_CONFERENCIA'
    end
    object QryConferenciaNotaENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryConferenciaNotaCD_SUBGRUPO: TFloatField
      FieldName = 'CD_SUBGRUPO'
    end
  end
  object SqlatualizaConferenciaNota: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONFERENCIA_NOTA ('#13#10'        :ID_CO' +
      'NFERENCIANOTA      ,'#13#10'        :CD_COMPRAS              ,'#13#10'      ' +
      '  :CD_FILIAL               ,'#13#10'        :NOTA_FISCAL             ,' +
      #13#10'        :ID_PRODUTO              ,'#13#10'        :CD_PRODUTO       ' +
      '       ,'#13#10'        :CODIGO_BARRAS_1         ,'#13#10'        :DESCRICAO' +
      '               ,'#13#10'        :CD_CLASSE               ,'#13#10'        :C' +
      'D_GRUPO                ,'#13#10'        :CD_LABORATORIO          ,'#13#10'  ' +
      '      :CLASSE                  ,'#13#10'        :GRUPO                ' +
      '   ,'#13#10'        :LABORATORIO             ,'#13#10'        :VL_UNITARIO  ' +
      '           ,'#13#10'        :VL_UNITARIO_NOTA        ,'#13#10'        :QUANT' +
      'IDADE              ,'#13#10'        :QUANTIDADE_NOTA         ,'#13#10'      ' +
      '  :STATUS                  ,'#13#10'        :STATUSCONFERENCIA       ,' +
      #13#10'        :CD_USUARIO_CONFERENCIA  ,'#13#10'        :USUARIO_CONFERENC' +
      'IA     ,'#13#10'        :ENVIADO, :CD_SUBGRUPO'#13#10')'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_CONFERENCIANOTA'
        ParamType = ptInput
      end
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
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LABORATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_UNITARIO_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
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
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_SUBGRUPO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 248
    Top = 176
  end
  object QryCePedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 743
    Top = 124
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
    object QryCePedidoENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryCePedidoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
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
    object QryCePedidoCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 13
    end
    object QryCePedidoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object QryCePedidoICMS: TStringField
      FieldName = 'ICMS'
      Size = 2
    end
    object QryCePedidoBASEICMS: TFloatField
      FieldName = 'BASEICMS'
    end
    object QryCePedidoBASEICMSSUBSTITUICAO: TFloatField
      FieldName = 'BASEICMSSUBSTITUICAO'
    end
    object QryCePedidoSITUACAOTRIBITARIA: TStringField
      FieldName = 'SITUACAOTRIBITARIA'
      Size = 3
    end
    object QryCePedidoLOTE: TStringField
      FieldName = 'LOTE'
    end
    object QryCePedidoFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object QryCePedidoVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object QryCePedidoPRECO_PROMOCAO_ATUAL: TFloatField
      FieldName = 'PRECO_PROMOCAO_ATUAL'
    end
    object QryCePedidoPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
    end
    object QryCePedidoDESCONTO_OUTROS: TFloatField
      FieldName = 'DESCONTO_OUTROS'
    end
    object QryCePedidoDIASSEMVENDER: TStringField
      FieldName = 'DIASSEMVENDER'
      Size = 1
    end
    object QryCePedidoCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object QryCePedidoVALORICMSSUBTITUICAO: TFloatField
      FieldName = 'VALORICMSSUBTITUICAO'
    end
    object QryCePedidoCUSTO_APLICADO: TFloatField
      FieldName = 'CUSTO_APLICADO'
    end
    object QryCePedidoMARGEM_VALOR_AGREGADO: TFloatField
      FieldName = 'MARGEM_VALOR_AGREGADO'
    end
    object QryCePedidoREDUCAO_ICMS_ST: TFloatField
      FieldName = 'REDUCAO_ICMS_ST'
    end
    object QryCePedidoPERCENTUAL_ICMS_ST: TFloatField
      FieldName = 'PERCENTUAL_ICMS_ST'
    end
    object QryCePedidoPIS_CST: TStringField
      FieldName = 'PIS_CST'
      Size = 3
    end
    object QryCePedidoPIS_BASE_CALCULO: TFloatField
      FieldName = 'PIS_BASE_CALCULO'
    end
    object QryCePedidoPIS_PERCENTUAL: TFloatField
      FieldName = 'PIS_PERCENTUAL'
    end
    object QryCePedidoPIS_VALOR: TFloatField
      FieldName = 'PIS_VALOR'
    end
    object QryCePedidoCOFINS_CST: TStringField
      FieldName = 'COFINS_CST'
      Size = 3
    end
    object QryCePedidoCOFINS_BASE_CALCULO: TFloatField
      FieldName = 'COFINS_BASE_CALCULO'
    end
    object QryCePedidoCOFINS_PERCENTUAL: TFloatField
      FieldName = 'COFINS_PERCENTUAL'
    end
    object QryCePedidoCOFINS_VALOR: TFloatField
      FieldName = 'COFINS_VALOR'
    end
    object QryCePedidoVALOR_OUTRASDESPESAS: TFloatField
      FieldName = 'VALOR_OUTRASDESPESAS'
    end
    object QryCePedidoVALOR_SEGURO: TFloatField
      FieldName = 'VALOR_SEGURO'
    end
    object QryCePedidoVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object QryCePedidoVALOR_ISENTO: TFloatField
      FieldName = 'VALOR_ISENTO'
    end
    object QryCePedidoVALOR_OUTRAS: TFloatField
      FieldName = 'VALOR_OUTRAS'
    end
    object QryCePedidoBASECALCULO_IPI: TFloatField
      FieldName = 'BASECALCULO_IPI'
    end
    object QryCePedidoCST_IPI: TIntegerField
      FieldName = 'CST_IPI'
    end
    object QryCePedidoNATUREZA_ISENTA_PIS: TStringField
      FieldName = 'NATUREZA_ISENTA_PIS'
      Size = 100
    end
    object QryCePedidoNATUREZA_ISENTA_COFINS: TStringField
      FieldName = 'NATUREZA_ISENTA_COFINS'
      Size = 100
    end
    object QryCePedidoCEST: TStringField
      FieldName = 'CEST'
      Size = 15
    end
    object QryCePedidoBASECALCULOFCP: TFMTBCDField
      FieldName = 'BASECALCULOFCP'
      Precision = 19
      Size = 2
    end
    object QryCePedidoALIQUOTAFCP: TFMTBCDField
      FieldName = 'ALIQUOTAFCP'
      Precision = 19
      Size = 2
    end
    object QryCePedidoVALORFCP: TFMTBCDField
      FieldName = 'VALORFCP'
      Precision = 19
      Size = 2
    end
    object QryCePedidoBASECALCULOFCPST: TFMTBCDField
      FieldName = 'BASECALCULOFCPST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoALIQUOTAFCPST: TFMTBCDField
      FieldName = 'ALIQUOTAFCPST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoVALORFCPST: TFMTBCDField
      FieldName = 'VALORFCPST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoBASECALCULOFCPSTRET: TFMTBCDField
      FieldName = 'BASECALCULOFCPSTRET'
      Precision = 19
      Size = 2
    end
    object QryCePedidoALIQUOTAFCPSTRET: TFMTBCDField
      FieldName = 'ALIQUOTAFCPSTRET'
      Precision = 19
      Size = 2
    end
    object QryCePedidoVALORFCPSTRET: TFMTBCDField
      FieldName = 'VALORFCPSTRET'
      Precision = 19
      Size = 2
    end
    object QryCePedidoBASEICMSSUBSTITUICAORET: TFMTBCDField
      FieldName = 'BASEICMSSUBSTITUICAORET'
      Precision = 19
      Size = 2
    end
    object QryCePedidoPERCENTUAL_ICMS_ST_RET: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST_RET'
      Precision = 19
      Size = 2
    end
    object QryCePedidoVALORICMSSUBSTITUICAORET: TFMTBCDField
      FieldName = 'VALORICMSSUBSTITUICAORET'
      Precision = 19
      Size = 2
    end
    object QryCePedidoNCM: TStringField
      FieldName = 'NCM'
    end
    object QryCePedidoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 1
    end
    object QryCePedidoINFORMACOESADICIONAIS: TStringField
      FieldName = 'INFORMACOESADICIONAIS'
      Size = 500
    end
    object QryCePedidoMODALIDADEBC: TIntegerField
      FieldName = 'MODALIDADEBC'
    end
    object QryCePedidoMODALIDADEBCST: TIntegerField
      FieldName = 'MODALIDADEBCST'
    end
    object QryCePedidoICMSBCUFDEST: TFMTBCDField
      FieldName = 'ICMSBCUFDEST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSBCFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSBCFCPUFDEST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSPERCENTUALFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSPERCENTUALFCPUFDEST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSVALORFCPUFDEST: TFMTBCDField
      FieldName = 'ICMSVALORFCPUFDEST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSPERCENTUALINTER: TFMTBCDField
      FieldName = 'ICMSPERCENTUALINTER'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSPERCENTUALUFDEST: TFMTBCDField
      FieldName = 'ICMSPERCENTUALUFDEST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSVALORUFREMET: TFMTBCDField
      FieldName = 'ICMSVALORUFREMET'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSVALORUFDEST: TFMTBCDField
      FieldName = 'ICMSVALORUFDEST'
      Precision = 19
      Size = 2
    end
    object QryCePedidoICMSPERCENTUALINTERPART: TFMTBCDField
      FieldName = 'ICMSPERCENTUALINTERPART'
      Precision = 19
      Size = 2
    end
    object QryCePedidoCODIGOANVISA: TStringField
      FieldName = 'CODIGOANVISA'
      Size = 15
    end
    object QryCePedidoPMC: TFMTBCDField
      FieldName = 'PMC'
      Precision = 19
      Size = 2
    end
    object QryCePedidoCODIGOBENEFICIO: TStringField
      FieldName = 'CODIGOBENEFICIO'
      Size = 10
    end
    object QryCePedidoMOTIVODESONERACAO: TStringField
      FieldName = 'MOTIVODESONERACAO'
      Size = 100
    end
    object QryCePedidoVALORDESONERACAO: TFMTBCDField
      FieldName = 'VALORDESONERACAO'
      Precision = 18
      Size = 2
    end
    object QryCePedidoPERCENTUALDESONERACAO: TFMTBCDField
      FieldName = 'PERCENTUALDESONERACAO'
      Precision = 18
      Size = 2
    end
  end
  object QryCePedid1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 503
    Top = 44
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
    object QryCePedid1STATUSCONFERENCIA: TStringField
      FieldName = 'STATUSCONFERENCIA'
      Size = 1
    end
    object QryCePedid1CD_USUARIO_CONFERENCIA: TFloatField
      FieldName = 'CD_USUARIO_CONFERENCIA'
    end
    object QryCePedid1USUARIO_CONFERENCIA: TStringField
      FieldName = 'USUARIO_CONFERENCIA'
    end
    object QryCePedid1CONFIGGERACAO: TStringField
      FieldName = 'CONFIGGERACAO'
      Size = 1000
    end
    object QryCePedid1LOCALGERACAO: TStringField
      FieldName = 'LOCALGERACAO'
      Size = 1
    end
    object QryCePedid1MODELONF: TStringField
      FieldName = 'MODELONF'
      Size = 2
    end
    object QryCePedid1VL_ISENTOICMS: TFloatField
      FieldName = 'VL_ISENTOICMS'
    end
    object QryCePedid1ICMS_RETIDO: TFloatField
      FieldName = 'ICMS_RETIDO'
    end
    object QryCePedid1PHARMALINK: TStringField
      FieldName = 'PHARMALINK'
      Size = 1
    end
    object QryCePedid1BONIFICACAO: TStringField
      FieldName = 'BONIFICACAO'
      Size = 1
    end
    object QryCePedid1CHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 100
    end
    object QryCePedid1VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QryCePedid1VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QryCePedid1INFCPL: TStringField
      FieldName = 'INFCPL'
      Size = 10000
    end
    object QryCePedid1TRANSFERENCIA: TStringField
      FieldName = 'TRANSFERENCIA'
      Size = 1
    end
    object QryCePedid1CONSIGNACAO: TStringField
      FieldName = 'CONSIGNACAO'
      Size = 1
    end
    object QryCePedid1VL_FCP: TFMTBCDField
      FieldName = 'VL_FCP'
      Precision = 19
      Size = 2
    end
    object QryCePedid1VL_FCPST: TFMTBCDField
      FieldName = 'VL_FCPST'
      Precision = 19
      Size = 2
    end
    object QryCePedid1VL_FCPSTRET: TFMTBCDField
      FieldName = 'VL_FCPSTRET'
      Precision = 19
      Size = 2
    end
    object QryCePedid1VL_II: TFMTBCDField
      FieldName = 'VL_II'
      Precision = 19
      Size = 2
    end
    object QryCePedid1ICM_BASESUBSTRET: TFMTBCDField
      FieldName = 'ICM_BASESUBSTRET'
      Precision = 19
      Size = 2
    end
    object QryCePedid1ICM_VALORSUBSTRET: TFMTBCDField
      FieldName = 'ICM_VALORSUBSTRET'
      Precision = 19
      Size = 2
    end
    object QryCePedid1ICMSDESONERACAO: TFMTBCDField
      FieldName = 'ICMSDESONERACAO'
      Precision = 19
      Size = 2
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
    Left = 312
    Top = 248
  end
  object CdsLotesItensCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 288
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
  object SqlEventos: TSQLDataSet
    CommandText = 'SELECT * FROM EVENTOS WHERE CD_EVENTO = :CD_EVENTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_EVENTO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1024
    Top = 352
  end
  object DspEventos: TDataSetProvider
    DataSet = SqlEventos
    Left = 1024
    Top = 392
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
    Left = 1024
    Top = 424
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
  object CdsCaixasDeletados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1056
    Top = 560
  end
  object SqlCaixasDeletados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1056
    Top = 520
  end
  object Sp_Preenche_Dados_Filiais: TSQLDataSet
    CommandText = 'EXECUTE PROCEDURE SP_PREENCHE_DADOS_FILIAIS'
    MaxBlobSize = -1
    Params = <>
    Left = 312
    Top = 160
  end
  object SQLParametrosFarmax: TSQLDataSet
    CommandText = 'SELECT '#13#10'* '#13#10'FROM PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1088
    Top = 16
    object SQLParametrosFarmaxSERVIDORMATRIZ: TStringField
      FieldName = 'SERVIDORMATRIZ'
      Size = 100
    end
    object SQLParametrosFarmaxMONITORARCONEXOES: TStringField
      FieldName = 'MONITORARCONEXOES'
      Size = 1
    end
    object SQLParametrosFarmaxURL: TStringField
      FieldName = 'URL'
      Size = 100
    end
    object SQLParametrosFarmaxSMTP: TStringField
      FieldName = 'SMTP'
      Size = 100
    end
    object SQLParametrosFarmaxUSUARIO_SMTP: TStringField
      FieldName = 'USUARIO_SMTP'
      Size = 100
    end
    object SQLParametrosFarmaxSENHA_SMTP: TStringField
      FieldName = 'SENHA_SMTP'
      Size = 50
    end
    object SQLParametrosFarmaxMENSALIDADE: TFloatField
      FieldName = 'MENSALIDADE'
    end
    object SQLParametrosFarmaxPAF_LAUDO: TStringField
      FieldName = 'PAF_LAUDO'
      Size = 100
    end
    object SQLParametrosFarmaxPAF_CNPJ: TStringField
      FieldName = 'PAF_CNPJ'
      Size = 14
    end
    object SQLParametrosFarmaxPAF_IE: TStringField
      FieldName = 'PAF_IE'
      Size = 14
    end
    object SQLParametrosFarmaxPAF_IM: TStringField
      FieldName = 'PAF_IM'
      Size = 14
    end
    object SQLParametrosFarmaxPAF_RAZAO: TStringField
      FieldName = 'PAF_RAZAO'
      Size = 1000
    end
    object SQLParametrosFarmaxPAF_ENDERECO: TStringField
      FieldName = 'PAF_ENDERECO'
      Size = 1000
    end
    object SQLParametrosFarmaxPAF_TELEFONE: TStringField
      FieldName = 'PAF_TELEFONE'
      Size = 10
    end
    object SQLParametrosFarmaxPAF_CONTATO: TStringField
      FieldName = 'PAF_CONTATO'
      Size = 1000
    end
    object SQLParametrosFarmaxPAF_NOMECOMERCIAL: TStringField
      FieldName = 'PAF_NOMECOMERCIAL'
      Size = 1000
    end
    object SQLParametrosFarmaxPAF_VERSAO: TStringField
      FieldName = 'PAF_VERSAO'
      Size = 10
    end
    object SQLParametrosFarmaxPAF_EXECUTAVEL: TStringField
      FieldName = 'PAF_EXECUTAVEL'
      Size = 1000
    end
    object SQLParametrosFarmaxPAF_MD5: TStringField
      FieldName = 'PAF_MD5'
      Size = 1024
    end
    object SQLParametrosFarmaxPAF_ERPAFECF: TStringField
      FieldName = 'PAF_ERPAFECF'
      Size = 4
    end
    object SQLParametrosFarmaxPAF_CHAVEPUBLICA: TStringField
      FieldName = 'PAF_CHAVEPUBLICA'
      Size = 1000
    end
    object SQLParametrosFarmaxPAF_CHAVEPRIVADA: TStringField
      FieldName = 'PAF_CHAVEPRIVADA'
      Size = 1000
    end
    object SQLParametrosFarmaxPAF_DATA: TStringField
      FieldName = 'PAF_DATA'
      Size = 1000
    end
    object SQLParametrosFarmaxVERSAO_LOJA: TStringField
      FieldName = 'VERSAO_LOJA'
      Size = 10
    end
    object SQLParametrosFarmaxVERSAO_GESTOR: TStringField
      FieldName = 'VERSAO_GESTOR'
      Size = 10
    end
    object SQLParametrosFarmaxENDERECO_FTP: TStringField
      FieldName = 'ENDERECO_FTP'
      Size = 99
    end
    object SQLParametrosFarmaxUSUARIO_FTP: TStringField
      FieldName = 'USUARIO_FTP'
      Size = 99
    end
    object SQLParametrosFarmaxSENHA_FTP: TStringField
      FieldName = 'SENHA_FTP'
      Size = 99
    end
    object SQLParametrosFarmaxPORTA_SMTP: TStringField
      FieldName = 'PORTA_SMTP'
      Size = 10
    end
    object SQLParametrosFarmaxCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object SQLParametrosFarmaxTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
    object SQLParametrosFarmaxCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Size = 4
    end
    object SQLParametrosFarmaxNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 30
    end
    object SQLParametrosFarmaxRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 40
    end
    object SQLParametrosFarmaxENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object SQLParametrosFarmaxBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object SQLParametrosFarmaxCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object SQLParametrosFarmaxUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object SQLParametrosFarmaxCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object SQLParametrosFarmaxCX_POSTAL: TStringField
      FieldName = 'CX_POSTAL'
      Size = 5
    end
    object SQLParametrosFarmaxCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object SQLParametrosFarmaxINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object SQLParametrosFarmaxFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object SQLParametrosFarmaxFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object SQLParametrosFarmaxINSC_MUNIC: TStringField
      FieldName = 'INSC_MUNIC'
      Size = 10
    end
    object SQLParametrosFarmaxCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 50
    end
    object SQLParametrosFarmaxCONTRA_CHAVE: TStringField
      FieldName = 'CONTRA_CHAVE'
      Size = 50
    end
    object SQLParametrosFarmaxDT_IMPLANTACAO: TStringField
      FieldName = 'DT_IMPLANTACAO'
      Size = 50
    end
    object SQLParametrosFarmaxDT_AUTENTICACAO: TStringField
      FieldName = 'DT_AUTENTICACAO'
      Size = 50
    end
    object SQLParametrosFarmaxDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
    end
    object SQLParametrosFarmaxCAMINHOAUTENTICACAO: TStringField
      FieldName = 'CAMINHOAUTENTICACAO'
      Size = 100
    end
    object SQLParametrosFarmaxIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 8
    end
    object SQLParametrosFarmaxCHAVESINTEGRA: TStringField
      FieldName = 'CHAVESINTEGRA'
      Size = 50
    end
    object SQLParametrosFarmaxCONTADORNOME: TStringField
      FieldName = 'CONTADORNOME'
      Size = 100
    end
    object SQLParametrosFarmaxCONTADORCPF: TStringField
      FieldName = 'CONTADORCPF'
      Size = 11
    end
    object SQLParametrosFarmaxCONTADORCRC: TStringField
      FieldName = 'CONTADORCRC'
    end
    object SQLParametrosFarmaxCONTADORCNPJ: TStringField
      FieldName = 'CONTADORCNPJ'
      Size = 14
    end
    object SQLParametrosFarmaxCONTADORENDERECO: TStringField
      FieldName = 'CONTADORENDERECO'
      Size = 100
    end
    object SQLParametrosFarmaxCONTADORNUMERO: TStringField
      FieldName = 'CONTADORNUMERO'
      Size = 10
    end
    object SQLParametrosFarmaxCONTADORCOMPLEMENTO: TStringField
      FieldName = 'CONTADORCOMPLEMENTO'
      Size = 100
    end
    object SQLParametrosFarmaxCONTADORBAIRRO: TStringField
      FieldName = 'CONTADORBAIRRO'
      Size = 100
    end
    object SQLParametrosFarmaxCONTADORCEP: TStringField
      FieldName = 'CONTADORCEP'
      Size = 8
    end
    object SQLParametrosFarmaxCONTADORTELEFONE: TStringField
      FieldName = 'CONTADORTELEFONE'
      Size = 10
    end
    object SQLParametrosFarmaxCONTADORFAX: TStringField
      FieldName = 'CONTADORFAX'
      Size = 10
    end
    object SQLParametrosFarmaxCONTADOREMAIL: TStringField
      FieldName = 'CONTADOREMAIL'
      Size = 100
    end
    object SQLParametrosFarmaxCONTADORCD_MUNICIPIO: TStringField
      FieldName = 'CONTADORCD_MUNICIPIO'
      Size = 10
    end
    object SQLParametrosFarmaxCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 1000
    end
  end
  object DspParametrosFarmax: TDataSetProvider
    DataSet = SQLParametrosFarmax
    Left = 1088
    Top = 56
  end
  object CdsParametrosFarmax: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspParametrosFarmax'
    Left = 1088
    Top = 96
    object CdsParametrosFarmaxSERVIDORMATRIZ: TStringField
      FieldName = 'SERVIDORMATRIZ'
      Size = 100
    end
    object CdsParametrosFarmaxMONITORARCONEXOES: TStringField
      FieldName = 'MONITORARCONEXOES'
      Size = 1
    end
    object CdsParametrosFarmaxURL: TStringField
      FieldName = 'URL'
      Size = 100
    end
    object CdsParametrosFarmaxSMTP: TStringField
      FieldName = 'SMTP'
      Size = 100
    end
    object CdsParametrosFarmaxUSUARIO_SMTP: TStringField
      FieldName = 'USUARIO_SMTP'
      Size = 100
    end
    object CdsParametrosFarmaxSENHA_SMTP: TStringField
      FieldName = 'SENHA_SMTP'
      Size = 50
    end
    object CdsParametrosFarmaxMENSALIDADE: TFloatField
      FieldName = 'MENSALIDADE'
    end
    object CdsParametrosFarmaxPAF_LAUDO: TStringField
      FieldName = 'PAF_LAUDO'
      Size = 100
    end
    object CdsParametrosFarmaxPAF_CNPJ: TStringField
      FieldName = 'PAF_CNPJ'
      Size = 14
    end
    object CdsParametrosFarmaxPAF_IE: TStringField
      FieldName = 'PAF_IE'
      Size = 14
    end
    object CdsParametrosFarmaxPAF_IM: TStringField
      FieldName = 'PAF_IM'
      Size = 14
    end
    object CdsParametrosFarmaxPAF_RAZAO: TStringField
      FieldName = 'PAF_RAZAO'
      Size = 1000
    end
    object CdsParametrosFarmaxPAF_ENDERECO: TStringField
      FieldName = 'PAF_ENDERECO'
      Size = 1000
    end
    object CdsParametrosFarmaxPAF_TELEFONE: TStringField
      FieldName = 'PAF_TELEFONE'
      Size = 10
    end
    object CdsParametrosFarmaxPAF_CONTATO: TStringField
      FieldName = 'PAF_CONTATO'
      Size = 1000
    end
    object CdsParametrosFarmaxPAF_NOMECOMERCIAL: TStringField
      FieldName = 'PAF_NOMECOMERCIAL'
      Size = 1000
    end
    object CdsParametrosFarmaxPAF_VERSAO: TStringField
      FieldName = 'PAF_VERSAO'
      Size = 10
    end
    object CdsParametrosFarmaxPAF_EXECUTAVEL: TStringField
      FieldName = 'PAF_EXECUTAVEL'
      Size = 1000
    end
    object CdsParametrosFarmaxPAF_MD5: TStringField
      FieldName = 'PAF_MD5'
      Size = 1024
    end
    object CdsParametrosFarmaxPAF_ERPAFECF: TStringField
      FieldName = 'PAF_ERPAFECF'
      Size = 4
    end
    object CdsParametrosFarmaxPAF_CHAVEPUBLICA: TStringField
      FieldName = 'PAF_CHAVEPUBLICA'
      Size = 1000
    end
    object CdsParametrosFarmaxPAF_CHAVEPRIVADA: TStringField
      FieldName = 'PAF_CHAVEPRIVADA'
      Size = 1000
    end
    object CdsParametrosFarmaxPAF_DATA: TStringField
      FieldName = 'PAF_DATA'
      Size = 1000
    end
    object CdsParametrosFarmaxVERSAO_LOJA: TStringField
      FieldName = 'VERSAO_LOJA'
      Size = 10
    end
    object CdsParametrosFarmaxVERSAO_GESTOR: TStringField
      FieldName = 'VERSAO_GESTOR'
      Size = 10
    end
    object CdsParametrosFarmaxENDERECO_FTP: TStringField
      FieldName = 'ENDERECO_FTP'
      Size = 99
    end
    object CdsParametrosFarmaxUSUARIO_FTP: TStringField
      FieldName = 'USUARIO_FTP'
      Size = 99
    end
    object CdsParametrosFarmaxSENHA_FTP: TStringField
      FieldName = 'SENHA_FTP'
      Size = 99
    end
    object CdsParametrosFarmaxPORTA_SMTP: TStringField
      FieldName = 'PORTA_SMTP'
      Size = 10
    end
    object CdsParametrosFarmaxCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
    end
    object CdsParametrosFarmaxTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Size = 1
    end
    object CdsParametrosFarmaxCODIGOUSUARIO: TStringField
      FieldName = 'CODIGOUSUARIO'
      Size = 4
    end
    object CdsParametrosFarmaxNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 30
    end
    object CdsParametrosFarmaxRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 40
    end
    object CdsParametrosFarmaxENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object CdsParametrosFarmaxBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsParametrosFarmaxCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object CdsParametrosFarmaxUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsParametrosFarmaxCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object CdsParametrosFarmaxCX_POSTAL: TStringField
      FieldName = 'CX_POSTAL'
      Size = 5
    end
    object CdsParametrosFarmaxCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object CdsParametrosFarmaxINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Size = 15
    end
    object CdsParametrosFarmaxFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object CdsParametrosFarmaxFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object CdsParametrosFarmaxINSC_MUNIC: TStringField
      FieldName = 'INSC_MUNIC'
      Size = 10
    end
    object CdsParametrosFarmaxCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 50
    end
    object CdsParametrosFarmaxCONTRA_CHAVE: TStringField
      FieldName = 'CONTRA_CHAVE'
      Size = 50
    end
    object CdsParametrosFarmaxDT_IMPLANTACAO: TStringField
      FieldName = 'DT_IMPLANTACAO'
      Size = 50
    end
    object CdsParametrosFarmaxDT_AUTENTICACAO: TStringField
      FieldName = 'DT_AUTENTICACAO'
      Size = 50
    end
    object CdsParametrosFarmaxDATAATUAL: TDateField
      FieldName = 'DATAATUAL'
    end
    object CdsParametrosFarmaxCAMINHOAUTENTICACAO: TStringField
      FieldName = 'CAMINHOAUTENTICACAO'
      Size = 100
    end
    object CdsParametrosFarmaxIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 8
    end
    object CdsParametrosFarmaxCHAVESINTEGRA: TStringField
      FieldName = 'CHAVESINTEGRA'
      Size = 50
    end
    object CdsParametrosFarmaxCONTADORNOME: TStringField
      FieldName = 'CONTADORNOME'
      Size = 100
    end
    object CdsParametrosFarmaxCONTADORCPF: TStringField
      FieldName = 'CONTADORCPF'
      Size = 11
    end
    object CdsParametrosFarmaxCONTADORCRC: TStringField
      FieldName = 'CONTADORCRC'
    end
    object CdsParametrosFarmaxCONTADORCNPJ: TStringField
      FieldName = 'CONTADORCNPJ'
      Size = 14
    end
    object CdsParametrosFarmaxCONTADORENDERECO: TStringField
      FieldName = 'CONTADORENDERECO'
      Size = 100
    end
    object CdsParametrosFarmaxCONTADORNUMERO: TStringField
      FieldName = 'CONTADORNUMERO'
      Size = 10
    end
    object CdsParametrosFarmaxCONTADORCOMPLEMENTO: TStringField
      FieldName = 'CONTADORCOMPLEMENTO'
      Size = 100
    end
    object CdsParametrosFarmaxCONTADORBAIRRO: TStringField
      FieldName = 'CONTADORBAIRRO'
      Size = 100
    end
    object CdsParametrosFarmaxCONTADORCEP: TStringField
      FieldName = 'CONTADORCEP'
      Size = 8
    end
    object CdsParametrosFarmaxCONTADORTELEFONE: TStringField
      FieldName = 'CONTADORTELEFONE'
      Size = 10
    end
    object CdsParametrosFarmaxCONTADORFAX: TStringField
      FieldName = 'CONTADORFAX'
      Size = 10
    end
    object CdsParametrosFarmaxCONTADOREMAIL: TStringField
      FieldName = 'CONTADOREMAIL'
      Size = 100
    end
    object CdsParametrosFarmaxCONTADORCD_MUNICIPIO: TStringField
      FieldName = 'CONTADORCD_MUNICIPIO'
      Size = 10
    end
    object CdsParametrosFarmaxCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 1000
    end
  end
  object SqlAtualizaCompras: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_COMPRAS ('#13#10'        :CD_COMPRAS,'#13#10' ' +
      '       :CD_FILIAL,'#13#10'        :CD_DISTRIBUIDOR,'#13#10'        :CD_PLANO' +
      '_CONTAS,'#13#10'        :CD_OBSERVACAO,'#13#10'        :CD_TRANSPORTADORA,'#13#10 +
      '        :DT_PEDIDO,'#13#10'        :NOTA_FISCAL,'#13#10'        :SERIE_NOTA_' +
      'FISCAL,'#13#10'        :DT_EMISSAO,'#13#10'        :BOLETO,'#13#10'        :DT_BOL' +
      'ETO,'#13#10'        :CD_CFOP,'#13#10'        :DT_ENTRADA,'#13#10'        :VL_IPI,'#13 +
      #10'        :VL_ICM,'#13#10'        :TOTAL_NOTA,'#13#10'        :ICM_BASE_CALCU' +
      'LO,'#13#10'        :ICM_ISENTO,'#13#10'        :ICM_OUTROS,'#13#10'        :ICM_BA' +
      'SESUBST,'#13#10'        :ICM_VALORSUBST,'#13#10'        :VL_TOTALPRODUTOS,'#13#10 +
      '        :VL_SEGURO,'#13#10'        :OUTRAS_DESPESAS,'#13#10'        :VL_FRET' +
      'E,'#13#10'        :IPI_BASE_CALCULO,'#13#10'        :IPI_ISENTO,'#13#10'        :I' +
      'PI_OUTROS,'#13#10'        :D_ICMV,'#13#10'        :D_IPIV,'#13#10'        :D_TOTNT' +
      ','#13#10'        :UNIDADES,'#13#10'        :NUMERO_ITENS,'#13#10'        :FATURAME' +
      'NTO,'#13#10'        :MOTIVO,'#13#10'        :ENVIADO,'#13#10'        :STATUS,'#13#10'   ' +
      '     :VL_DESCONTO_NOTA,'#13#10'        :CD_USUARIO_CRIACAO,'#13#10'        :' +
      'USUARIO_DIGITACAO,'#13#10'        :CD_USUARIO_DIGITACAO,'#13#10'        :USU' +
      'ARIO_CRIACAO,'#13#10'        :CD_USUARIO_CONCLUSAO,'#13#10'        :USUARIO_' +
      'CONCLUSAO,'#13#10'        :CD_USUARIO_ENVIO,'#13#10'        :USUARIO_ENVIO,'#13 +
      #10'        :VINCULADO,'#13#10'        :CD_COMPRAS_VINCULADO,'#13#10'        :T' +
      'EMVINCULADO,'#13#10'        :STATUSCONFERENCIA,'#13#10'        :CD_USUARIO_C' +
      'ONFERENCIA,'#13#10'        :USUARIO_CONFERENCIA,'#13#10'        :CONFIGGERAC' +
      'AO,'#13#10'        :LOCALGERACAO,'#13#10'        :MODELONF,'#13#10'        :VL_ISE' +
      'NTOICMS,'#13#10'        :ICMS_RETIDO,'#13#10'        :PHARMALINK,'#13#10'        :' +
      'BONIFICACAO,'#13#10'        :CHAVENFE,'#13#10'        :VL_PIS,'#13#10'        :VL_' +
      'COFINS,'#13#10'        :INFCPL,'#13#10'        :TRANSFERENCIA,'#13#10'        :CON' +
      'SIGNACAO,'#13#10'        :VL_FCP,'#13#10'        :VL_FCPST,'#13#10'        :VL_FCP' +
      'STRET,'#13#10'        :VL_II,'#13#10'        :ICM_BASESUBSTRET,'#13#10'        :IC' +
      'M_VALORSUBSTRET,'#13#10'        :ICMSDESONERACAO)'
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
    Left = 504
    Top = 8
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
    Left = 744
    Top = 88
  end
  object SqlAtualizaProdutosLotesST: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_PRODUTOSLOTES ('#13#10'        :ID_PRODU' +
      'TO,'#13#10'        :CD_FILIAL,'#13#10'        :DATA,'#13#10'        :CD_DISTRIBUID' +
      'OR,'#13#10'        :NOTA_FISCAL,'#13#10'        :SERIE,'#13#10'        :LOTE,'#13#10'   ' +
      '     :QUANTIDADE,'#13#10'        :QUANTIDADE_ENTRADA,'#13#10'        :MODALI' +
      'DADE_ST,'#13#10'        :MVA,'#13#10'        :PERCENTUALREDUCAO_ST,'#13#10'       ' +
      ' :BASECALCULO_ST,'#13#10'        :ALIQUOTA_ST,'#13#10'        :VALOR_ST,'#13#10'  ' +
      '      :BASECALCULO_FCP_ST,'#13#10'        :ALIQUOTA_FCP_ST,'#13#10'        :' +
      'VALOR_FCP_ST)'#13#10
    MaxBlobSize = -1
    Params = <
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
        DataType = ftDate
        Name = 'DATA'
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
        DataType = ftString
        Name = 'SERIE'
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
        DataType = ftFloat
        Name = 'QUANTIDADE_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODALIDADE_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'MVA'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'PERCENTUALREDUCAO_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BASECALCULO_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ALIQUOTA_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VALOR_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'BASECALCULO_FCP_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ALIQUOTA_FCP_ST'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VALOR_FCP_ST'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1168
    Top = 176
  end
  object QryProdutosLotesST: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1168
    Top = 218
    object QryProdutosLotesSTID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object QryProdutosLotesSTCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryProdutosLotesSTDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object QryProdutosLotesSTCD_DISTRIBUIDOR: TFloatField
      FieldName = 'CD_DISTRIBUIDOR'
      Required = True
    end
    object QryProdutosLotesSTNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Required = True
      Size = 10
    end
    object QryProdutosLotesSTSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 10
    end
    object QryProdutosLotesSTLOTE: TStringField
      FieldName = 'LOTE'
      Required = True
      Size = 10
    end
    object QryProdutosLotesSTQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryProdutosLotesSTQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
    end
    object QryProdutosLotesSTMODALIDADE_ST: TStringField
      FieldName = 'MODALIDADE_ST'
      Size = 100
    end
    object QryProdutosLotesSTMVA: TFMTBCDField
      FieldName = 'MVA'
      Precision = 19
      Size = 2
    end
    object QryProdutosLotesSTPERCENTUALREDUCAO_ST: TFMTBCDField
      FieldName = 'PERCENTUALREDUCAO_ST'
      Precision = 19
      Size = 2
    end
    object QryProdutosLotesSTBASECALCULO_ST: TFMTBCDField
      FieldName = 'BASECALCULO_ST'
      Precision = 19
      Size = 2
    end
    object QryProdutosLotesSTALIQUOTA_ST: TFMTBCDField
      FieldName = 'ALIQUOTA_ST'
      Precision = 19
      Size = 2
    end
    object QryProdutosLotesSTVALOR_ST: TFMTBCDField
      FieldName = 'VALOR_ST'
      Precision = 19
      Size = 2
    end
    object QryProdutosLotesSTBASECALCULO_FCP_ST: TFMTBCDField
      FieldName = 'BASECALCULO_FCP_ST'
      Precision = 19
      Size = 2
    end
    object QryProdutosLotesSTALIQUOTA_FCP_ST: TFMTBCDField
      FieldName = 'ALIQUOTA_FCP_ST'
      Precision = 19
      Size = 2
    end
    object QryProdutosLotesSTVALOR_FCP_ST: TFMTBCDField
      FieldName = 'VALOR_FCP_ST'
      Precision = 19
      Size = 2
    end
  end
  object CdsComprasBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1208
    Top = 56
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
      Precision = 19
      Size = 2
    end
    object CdsComprasBoletosDEDUCOES: TFMTBCDField
      FieldName = 'DEDUCOES'
      Precision = 19
      Size = 2
    end
    object CdsComprasBoletosDESPESASFINANCEIRAS: TFMTBCDField
      FieldName = 'DESPESASFINANCEIRAS'
      Precision = 19
      Size = 2
    end
    object CdsComprasBoletosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 19
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
    Left = 1208
    Top = 8
  end
  object CdsContasPagarCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1168
    Top = 312
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
  object SqlAtualizaContasPagarCompras: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZA_CONTASPAGARCOMPRAS(:CD_FILIAL, :CD' +
      '_CONTAS_PAGAR, :CD_COMPRAS, :DT_EMISSAO, :NOTA_FISCAL, :VALOR)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'CD_FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_CONTAS_PAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_COMPRAS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_EMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOTA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1168
    Top = 272
  end
  object QryVendasItensExcluidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1168
    Top = 408
    object QryVendasItensExcluidosID_ITEM_EXCLUIDO: TFloatField
      FieldName = 'ID_ITEM_EXCLUIDO'
      Required = True
    end
    object QryVendasItensExcluidosCD_FILIAL: TFloatField
      FieldName = 'CD_FILIAL'
      Required = True
    end
    object QryVendasItensExcluidosDATA: TDateField
      FieldName = 'DATA'
    end
    object QryVendasItensExcluidosHORA: TTimeField
      FieldName = 'HORA'
    end
    object QryVendasItensExcluidosTERMINAL: TFloatField
      FieldName = 'TERMINAL'
    end
    object QryVendasItensExcluidosCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
    end
    object QryVendasItensExcluidosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object QryVendasItensExcluidosID_PRODUTO: TFloatField
      FieldName = 'ID_PRODUTO'
    end
    object QryVendasItensExcluidosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 100
    end
    object QryVendasItensExcluidosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryVendasItensExcluidosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object QryVendasItensExcluidosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
    object QryVendasItensExcluidosID_OPERADOR_CAIXA: TFloatField
      FieldName = 'ID_OPERADOR_CAIXA'
    end
  end
  object SqlAtualizaVendasItensExcluidos: TSQLDataSet
    CommandText = 
      'EXECUTE PROCEDURE SP_ATUALIZAVENDASITESNEXCLUIDOS('#13#10'          :I' +
      'D_ITEM_EXCLUIDO,'#13#10'          :CD_FILIAL,'#13#10'          :DATA,'#13#10'     ' +
      '     :HORA,'#13#10'          :TERMINAL,'#13#10'          :CD_USUARIO,'#13#10'     ' +
      '     :USUARIO,'#13#10'          :ID_PRODUTO,'#13#10'          :PRODUTO,'#13#10'   ' +
      '       :QUANTIDADE,'#13#10'          :VALOR,'#13#10'          :ENVIADO,'#13#10'   ' +
      '       :ID_OPERADOR_CAIXA'#13#10')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'ID_ITEM_EXCLUIDO'
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
      end
      item
        DataType = ftTime
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TERMINAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
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
        DataType = ftString
        Name = 'ENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_OPERADOR_CAIXA'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1168
    Top = 368
  end
end
