Unit UDm;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm, DB, DBTables,
     Provider, DBClient, Forms, FMTBcd, SqlExpr, Dialogs, IniFiles,
     FileCtrl, Variants, TLHelp32, Windows, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
     IdHTTP, IdGlobal, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStream,
     IdSocks, Data.DBXFirebird, Soap.Rio, Soap.SOAPHTTPClient;

type
  IDm = interface(IAppServerSOAP)
    ['{1639EFA6-9721-4A85-90DC-46AD81C01957}']
    function Processa(Identificador: Integer; Filial : Integer; Cds: Variant): Variant; stdcall;
  end;

  TDm = class(TSoapDataModule, IDm, IAppServerSOAP, IAppServer)
    CdsCaixa: TClientDataSet;
    CdsPedid1: TClientDataSet;
    CdsPedido: TClientDataSet;
    CdsDuplic: TClientDataSet;
    SqlGrupos: TSQLDataSet;
    DspGrupos: TDataSetProvider;
    SqlLaboratorios: TSQLDataSet;
    DspLaboratorios: TDataSetProvider;
    SqlIncluiProdutos: TSQLDataSet;
    DspIncluiProdutos: TDataSetProvider;
    SqlVendedores: TSQLDataSet;
    DspVendedores: TDataSetProvider;
    SqlCompras: TSQLDataSet;
    DspCompras: TDataSetProvider;
    SqlItensCompra: TSQLDataSet;
    DspItensCompra: TDataSetProvider;
    CdsGrupos: TClientDataSet;
    CdsLaboratorios: TClientDataSet;
    CdsLaboratoriosCD_LABORATORIO: TFloatField;
    CdsLaboratoriosNOME: TStringField;
    CdsLaboratoriosRAZAO: TStringField;
    CdsLaboratoriosCNPJ: TStringField;
    CdsLaboratoriosENDERECO: TStringField;
    CdsLaboratoriosCIDADE: TStringField;
    CdsLaboratoriosFONE: TStringField;
    CdsLaboratoriosCONTATO: TStringField;
    CdsLaboratoriosTX_DESCONTO: TFloatField;
    CdsLaboratoriosCONTROLE: TStringField;
    CdsLaboratoriosDT_ALTERACAO: TDateField;
    CdsLaboratoriosENVIADO: TStringField;
    CdsIncluiProdutos: TClientDataSet;
    CdsVendedores: TClientDataSet;
    CdsCompras: TClientDataSet;
    CdsItensCompra: TClientDataSet;
    CdsItensCompraCD_COMPRAS: TFloatField;
    CdsItensCompraID_PRODUTO: TFloatField;
    CdsItensCompraCD_PRODUTO: TStringField;
    CdsItensCompraCD_FILIAL: TFloatField;
    CdsItensCompraCODIGO: TFloatField;
    CdsItensCompraDESCRICAO: TStringField;
    CdsItensCompraSALDO: TFloatField;
    CdsItensCompraESTOQUE_MINIMO: TFloatField;
    CdsItensCompraESTOQUE_MAXIMO: TFloatField;
    CdsItensCompraLABORATORIO: TStringField;
    CdsItensCompraGRUPO: TStringField;
    CdsItensCompraCLASSE: TStringField;
    CdsItensCompraCD_SITUACAO_TRIB: TFloatField;
    CdsItensCompraQUANTIDADE: TFloatField;
    CdsItensCompraVL_UNITARIO: TFloatField;
    CdsItensCompraPERCENTUAL_ICMS: TFloatField;
    CdsItensCompraREDUCAO_ICMS: TFloatField;
    CdsItensCompraVL_ICMS: TFloatField;
    CdsItensCompraPERCENTUAL_DESCONTO: TFloatField;
    CdsItensCompraVL_DESCONTO: TFloatField;
    CdsItensCompraPERCENTUAL_IPI: TFloatField;
    CdsItensCompraVL_IPI: TFloatField;
    CdsItensCompraVL_TOTAL: TFloatField;
    CdsItensCompraPERCENTUAL_MARGEM: TFloatField;
    CdsItensCompraCD_ATENDIMENTO: TStringField;
    CdsItensCompraNOVO_PRECO: TFloatField;
    CdsItensCompraNOVO_CUSTO: TFloatField;
    CdsItensCompraATUALIZAR_PRECO: TStringField;
    SqlPrecosEspeciais: TSQLDataSet;
    DspPrecosEspeciais: TDataSetProvider;
    CdsPrecosEspeciais: TClientDataSet;
    CdsPrecosEspeciaisCD_FILIAL: TFloatField;
    CdsPrecosEspeciaisID_PRODUTO: TFloatField;
    CdsPrecosEspeciaisPRECO_VENDA: TFloatField;
    CdsPrecosEspeciaisPRECO_PROMOCAO: TFloatField;
    CdsPrecosEspeciaisCD_PRODUTO: TStringField;
    CdsProdut: TClientDataSet;
    SqlDeletados: TSQLDataSet;
    DspDeletados: TDataSetProvider;
    CdsDeletados: TClientDataSet;
    CdsDeletadosTABELA: TStringField;
    CdsDeletadosCAMPO1: TStringField;
    CdsDeletadosCAMPO2: TStringField;
    CdsDeletadosDATA: TDateField;
    CdsDeletadosUSUARIO: TStringField;
    CdsOperadores: TClientDataSet;
    SqlPlanoContas: TSQLDataSet;
    SqlConvenios: TSQLDataSet;
    SqlTransportadoras: TSQLDataSet;
    SqlCartoes: TSQLDataSet;
    SqlDistribuidores: TSQLDataSet;
    SqlFiliais: TSQLDataSet;
    SqlFormasPagamento: TSQLDataSet;
    DspPlanoContas: TDataSetProvider;
    DspConvenios: TDataSetProvider;
    DspTransportadoras: TDataSetProvider;
    DspCartoes: TDataSetProvider;
    DspDistribuidores: TDataSetProvider;
    DspFiliais: TDataSetProvider;
    DspFormasPagamento: TDataSetProvider;
    CdsPlanoContas: TClientDataSet;
    CdsConvenios: TClientDataSet;
    CdsTransportadoras: TClientDataSet;
    CdsCartoes: TClientDataSet;
    CdsDistribuidores: TClientDataSet;
    CdsFiliais: TClientDataSet;
    CdsFormasPagamento: TClientDataSet;
    CdsPlanoContasCD_PLANO_CONTAS: TFloatField;
    CdsPlanoContasCD_HISTORICO: TStringField;
    CdsPlanoContasHISTORICO: TStringField;
    CdsPlanoContasGRAU: TStringField;
    CdsPlanoContasSISTEMA: TStringField;
    CdsPlanoContasTIPO_CONTA: TStringField;
    CdsPlanoContasENVIADO: TStringField;
    CdsTransportadorasCD_TRANSPORTADORA: TFloatField;
    CdsTransportadorasNOME: TStringField;
    CdsTransportadorasRAZAO: TStringField;
    CdsTransportadorasCNPJ: TStringField;
    CdsTransportadorasINSCRICAO: TStringField;
    CdsTransportadorasENDERECO: TStringField;
    CdsTransportadorasCIDADE: TStringField;
    CdsTransportadorasFONE: TStringField;
    CdsTransportadorasCONTATO: TStringField;
    CdsTransportadorasDT_ALTERACAO: TDateField;
    CdsTransportadorasENVIADO: TStringField;
    CdsCartoesCD_CARTAO: TFloatField;
    CdsCartoesCD_CONTA: TFloatField;
    CdsCartoesDESCRICAO: TStringField;
    CdsCartoesTIPO_CARTAO: TStringField;
    CdsCartoesTX_ADM: TFloatField;
    CdsCartoesTX_ADM_PARC: TFloatField;
    CdsCartoesPRAZO_PG: TFloatField;
    CdsEntregas: TClientDataSet;
    CdsCeTransfer: TClientDataSet;
    CdsCeItensTransfer: TClientDataSet;
    SqlTransfer: TSQLDataSet;
    DspTransfer: TDataSetProvider;
    CdsTransfer: TClientDataSet;
    FloatField1: TFloatField;
    DateField1: TDateField;
    DateField2: TDateField;
    TimeField1: TTimeField;
    DateField3: TDateField;
    TimeField2: TTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    SqlItensTransfer: TSQLDataSet;
    DspItensTransfer: TDataSetProvider;
    CdsItensTransfer: TClientDataSet;
    CdsCadernoFaltas: TClientDataSet;
    SqlPrecos: TSQLDataSet;
    DspPrecos: TDataSetProvider;
    CdsPrecos: TClientDataSet;
    CdsComprasCD_COMPRAS: TFloatField;
    CdsComprasCD_FILIAL: TFloatField;
    CdsComprasCD_DISTRIBUIDOR: TFloatField;
    CdsComprasCD_PLANO_CONTAS: TFloatField;
    CdsComprasCD_OBSERVACAO: TFloatField;
    CdsComprasCD_TRANSPORTADORA: TFloatField;
    CdsComprasDT_PEDIDO: TDateField;
    CdsComprasNOTA_FISCAL: TStringField;
    CdsComprasSERIE_NOTA_FISCAL: TStringField;
    CdsComprasDT_EMISSAO: TDateField;
    CdsComprasBOLETO: TStringField;
    CdsComprasDT_BOLETO: TDateField;
    CdsComprasCD_CFOP: TFloatField;
    CdsComprasDT_ENTRADA: TDateField;
    CdsComprasVL_IPI: TFloatField;
    CdsComprasVL_ICM: TFloatField;
    CdsComprasTOTAL_NOTA: TFloatField;
    CdsComprasICM_BASE_CALCULO: TFloatField;
    CdsComprasICM_ISENTO: TFloatField;
    CdsComprasICM_OUTROS: TFloatField;
    CdsComprasICM_BASESUBST: TFloatField;
    CdsComprasICM_VALORSUBST: TFloatField;
    CdsComprasVL_TOTALPRODUTOS: TFloatField;
    CdsComprasVL_SEGURO: TFloatField;
    CdsComprasOUTRAS_DESPESAS: TFloatField;
    CdsComprasVL_FRETE: TFloatField;
    CdsComprasIPI_BASE_CALCULO: TFloatField;
    CdsComprasIPI_ISENTO: TFloatField;
    CdsComprasIPI_OUTROS: TFloatField;
    CdsComprasD_ICMV: TFloatField;
    CdsComprasD_IPIV: TFloatField;
    CdsComprasD_TOTNT: TFloatField;
    CdsComprasUNIDADES: TFloatField;
    CdsComprasNUMERO_ITENS: TFloatField;
    CdsComprasFATURAMENTO: TStringField;
    CdsComprasMOTIVO: TStringField;
    CdsComprasENVIADO: TStringField;
    CdsComprasSTATUS: TStringField;
    CdsComprasVL_DESCONTO_NOTA: TFloatField;
    CdsComprasCD_USUARIO_CRIACAO: TFloatField;
    CdsComprasUSUARIO_DIGITACAO: TStringField;
    CdsComprasCD_USUARIO_DIGITACAO: TFloatField;
    CdsComprasUSUARIO_CRIACAO: TStringField;
    CdsComprasCD_USUARIO_CONCLUSAO: TFloatField;
    CdsComprasUSUARIO_CONCLUSAO: TStringField;
    CdsComprasCD_USUARIO_ENVIO: TFloatField;
    CdsComprasUSUARIO_ENVIO: TStringField;
    CdsItensTransferCD_TRANSFER: TFloatField;
    CdsItensTransferID_PRODUTO: TFloatField;
    CdsItensTransferCD_PRODUTO: TFloatField;
    CdsItensTransferCD_GRUPO: TFloatField;
    CdsItensTransferCD_LABORATORIO: TFloatField;
    CdsItensTransferDESCRICAO: TStringField;
    CdsItensTransferQUANTIDADE_SOLICITADA: TFloatField;
    CdsItensTransferQUANTIDADE_ENVIADA: TFloatField;
    CdsItensTransferQUANTIDADE_RECEBIDA: TFloatField;
    CdsItensTransferVALOR: TFloatField;
    CdsItensTransferOBSERVACOES: TStringField;
    CdsItensTransferSTATUS: TStringField;
    SqlClasses: TSQLDataSet;
    DspClasses: TDataSetProvider;
    CdsClasses: TClientDataSet;
    SqlLog: TSQLDataSet;
    DspLog: TDataSetProvider;
    CdsLog: TClientDataSet;
    CdsLogID_LOG: TFloatField;
    CdsLogCD_FILIAL: TFloatField;
    CdsLogIP: TStringField;
    CdsLogDATA: TDateField;
    CdsLogHORA: TTimeField;
    CdsLogCHAVE_ACESSO: TStringField;
    SqlControle: TSQLDataSet;
    DspControle: TDataSetProvider;
    CdsControle: TClientDataSet;
    CdsControleCAMPO: TStringField;
    CdsControleVALOR: TFloatField;
    SqlContas_Receber: TSQLDataSet;
    DspContas_Receber: TDataSetProvider;
    CdsContas_Receber: TClientDataSet;
    CdsContas_ReceberCD_CONTAS_RECEBER: TFloatField;
    CdsContas_ReceberCD_CLIENTE: TFloatField;
    CdsContas_ReceberCD_PLANO_CONTAS: TFloatField;
    CdsContas_ReceberCD_FILIAL: TFloatField;
    CdsContas_ReceberCD_CONVENIO: TFloatField;
    CdsContas_ReceberCD_VENDEDOR: TFloatField;
    CdsContas_ReceberCD_VENDA: TFloatField;
    CdsContas_ReceberCD_FORMA_PAGAMENTO: TFloatField;
    CdsContas_ReceberCD_CONTA: TFloatField;
    CdsContas_ReceberCD_CARTAO: TFloatField;
    CdsContas_ReceberCD_BORDERO: TFloatField;
    CdsContas_ReceberDT_LANCAMENTO: TDateField;
    CdsContas_ReceberDT_VENCIMENTO: TDateField;
    CdsContas_ReceberNOTA_FISCAL: TStringField;
    CdsContas_ReceberSERIE_NOTA: TStringField;
    CdsContas_ReceberDOCUMENTO: TStringField;
    CdsContas_ReceberDT_NOTA_FISCAL: TDateField;
    CdsContas_ReceberVENCTO: TDateField;
    CdsContas_ReceberVALOR: TFloatField;
    CdsContas_ReceberHISTORICO: TStringField;
    CdsContas_ReceberCD_CHEQUE_RECEBIDO: TFloatField;
    CdsContas_ReceberNR_CHEQUE: TStringField;
    CdsContas_ReceberNR_BANCO: TStringField;
    CdsContas_ReceberDT_PAGAMENTO: TDateField;
    CdsContas_ReceberVL_PAGAMENTO: TFloatField;
    CdsContas_ReceberVL_JUROS: TFloatField;
    CdsContas_ReceberVL_DESCONTO: TFloatField;
    CdsContas_ReceberVL_SALDO: TFloatField;
    CdsContas_ReceberNOSSO_NUMERO: TStringField;
    CdsContas_ReceberBANCO: TStringField;
    CdsContas_ReceberAGENCIA: TStringField;
    CdsContas_ReceberCONTA: TStringField;
    CdsContas_ReceberHISTORICO_BANCO: TStringField;
    CdsContas_ReceberSTATUS: TStringField;
    CdsContas_ReceberOBSERVACAO: TMemoField;
    CdsContas_ReceberENVIADO: TStringField;
    CdsContas_ReceberDT_ALTERACAO: TDateField;
    SqlClientes: TSQLDataSet;
    DspClientes: TDataSetProvider;
    CdsClientes: TClientDataSet;
    CdsClientesCD_FILIAL: TFloatField;
    CdsClientesCD_CLIENTE: TFloatField;
    CdsClientesCD_VENDEDOR: TFloatField;
    CdsClientesCD_CONVENIO: TFloatField;
    CdsClientesNOME: TStringField;
    CdsClientesENDERECO: TStringField;
    CdsClientesBAIRRO: TStringField;
    CdsClientesCIDADE: TStringField;
    CdsClientesUF: TStringField;
    CdsClientesCEP: TStringField;
    CdsClientesCAIXA_POSTAL: TStringField;
    CdsClientesFONE: TStringField;
    CdsClientesFAX: TStringField;
    CdsClientesCONTATO: TStringField;
    CdsClientesCNPJ: TStringField;
    CdsClientesINSCRICAO: TStringField;
    CdsClientesPRACA: TStringField;
    CdsClientesDATA_FICHA: TDateField;
    CdsClientesRG: TStringField;
    CdsClientesCPF: TStringField;
    CdsClientesTITULO_ELEITO: TStringField;
    CdsClientesDT_NASCIMENTO: TDateField;
    CdsClientesSEXO: TStringField;
    CdsClientesESTADO_CIVIL: TStringField;
    CdsClientesNATURALIDADE: TStringField;
    CdsClientesFILIACAO: TStringField;
    CdsClientesNUMERO_DEPENDENTES: TFloatField;
    CdsClientesCONJUGE: TStringField;
    CdsClientesDT_NASC_CONJUGE: TStringField;
    CdsClientesALUGUEL: TStringField;
    CdsClientesVL_ALUGUEL: TFloatField;
    CdsClientesTEMPO_RESIDENCIA: TStringField;
    CdsClientesEMPRESA: TStringField;
    CdsClientesFONE_COMERCIAL: TStringField;
    CdsClientesDT_ADMISSAO: TStringField;
    CdsClientesCEP_COMERCIAL: TStringField;
    CdsClientesCIDADE_COMERCIAL: TStringField;
    CdsClientesUF_COMERCIAL: TStringField;
    CdsClientesFUNCAO: TStringField;
    CdsClientesEMPRESA_ANTERIOR: TStringField;
    CdsClientesTEMPO_SERVICO: TStringField;
    CdsClientesREFERENCIA_COMERCIAL: TStringField;
    CdsClientesREFERENCIA_BANCARIA: TStringField;
    CdsClientesCONSULTA_SPC: TStringField;
    CdsClientesOBSERVACAO_SPC: TStringField;
    CdsClientesOBSERVACAO_GERAL: TStringField;
    CdsClientesENDERECO_COBRANCA: TStringField;
    CdsClientesBAIRRO_COBRANCA: TStringField;
    CdsClientesCIDADE_COBRANCA: TStringField;
    CdsClientesUF_COBRANCA: TStringField;
    CdsClientesCEP_COBRANCA: TStringField;
    CdsClientesICMS_IPI: TStringField;
    CdsClientesNOME_MAE: TStringField;
    CdsClientesMES_NASCIMENTO: TFloatField;
    CdsClientesRENDA: TFloatField;
    CdsClientesLIMITE_PERCENTUAL: TFloatField;
    CdsClientesLIMITE_CREDITO: TFloatField;
    CdsClientesEMAIL: TStringField;
    CdsClientesHOMEPAGE: TStringField;
    CdsClientesFOTO: TBlobField;
    CdsClientesMATRICULA: TStringField;
    CdsClientesSALDO: TFloatField;
    CdsClientesDT_VENCIMENTO: TFloatField;
    CdsClientesDESCONTO: TFloatField;
    CdsClientesDT_ULTIMA_COMPRA: TDateField;
    CdsClientesSTATUS: TStringField;
    CdsClientesREFERENCIA: TStringField;
    CdsClientesDT_ALTERACAO: TDateField;
    CdsLogNUMERO_ITENS: TFloatField;
    CdsLogNUMERO_UNIDADES: TFloatField;
    CdsLogTOTAL_CUSTO: TFloatField;
    CdsLogTOTAL_VENDA: TFloatField;
    SqlNumeroLancamentos: TSQLDataSet;
    DspNumeroLancamentos: TDataSetProvider;
    SqlNumeroCaixa: TSQLDataSet;
    DspNumeroCaixa: TDataSetProvider;
    SqlCdLancamento: TSQLDataSet;
    DspCd_Lancamento: TDataSetProvider;
    SqlCdCaixa: TSQLDataSet;
    DspCdCaixa: TDataSetProvider;
    CdsNumeroLancamentos: TClientDataSet;
    CdsNumeroLancamentosCOUNT: TIntegerField;
    CdsCdLancamento: TClientDataSet;
    CdsCdLancamentoCD_LANCAMENTO: TFloatField;
    CdsNumeroCaixa: TClientDataSet;
    CdsNumeroCaixaCOUNT: TIntegerField;
    CdsCdCaixa: TClientDataSet;
    CdsCdCaixaCD_CAIXA: TFloatField;
    CdsCRM: TClientDataSet;
    CdsItensCompraPRECO_VENDA: TFloatField;
    SqlNumeroTransfer: TSQLDataSet;
    DspNumeroTransfer: TDataSetProvider;
    CdsNumeroTransfer: TClientDataSet;
    SqlCdTransfer: TSQLDataSet;
    DspCdTransfer: TDataSetProvider;
    CdsCdTransfer: TClientDataSet;
    SqlNumeroItensTransfer: TSQLDataSet;
    DspNumeroItensTransfer: TDataSetProvider;
    CdsNumeroItensTransfer: TClientDataSet;
    CdsNumeroTransferCOUNT: TIntegerField;
    CdsCdTransferCD_TRANSFER: TFloatField;
    CdsNumeroItensTransferCOUNT: TIntegerField;
    SqlCdItensTransfer: TSQLDataSet;
    DspCdItensTransfer: TDataSetProvider;
    CdsCdItensTransfer: TClientDataSet;
    CdsCdItensTransferCD_TRANSFER: TFloatField;
    CdsCdItensTransferID_PRODUTO: TFloatField;
    SqlVendedores_Classes: TSQLDataSet;
    DspVendedores_Classes: TDataSetProvider;
    CdsVendedores_Classes: TClientDataSet;
    CdsVendedores_ClassesCD_VENDEDOR: TFloatField;
    CdsVendedores_ClassesCD_CLASSE: TFloatField;
    CdsVendedores_ClassesDESCRICAO: TStringField;
    CdsVendedores_ClassesCOMISSAO: TStringField;
    CdsCheques: TClientDataSet;
    CdsLaboratoriosNPRODUTOS: TFloatField;
    CdsLaboratoriosVPRODUTOS: TFloatField;
    CdsLaboratoriosCPRODUTOS: TFloatField;
    SqlNumeroContasReceber: TSQLDataSet;
    DspNumeroContasReceber: TDataSetProvider;
    SqlCdContasReceber: TSQLDataSet;
    DspCdContasReceber: TDataSetProvider;
    CdsNumeroContasReceber: TClientDataSet;
    CdsCdContasReceber: TClientDataSet;
    CdsNumeroContasReceberCOUNT: TIntegerField;
    CdsCdContasReceberCD_CONTAS_RECEBER: TFloatField;
    CdsItensCompraQT_EMBALAGEM: TFloatField;
    CdsItensCompraENVIADO: TStringField;
    SqlConvenios_Classes: TSQLDataSet;
    DspConvenios_Classes: TDataSetProvider;
    CdsConvenios_Classes: TClientDataSet;
    CdsConvenios_ClassesCD_CONVENIO: TFloatField;
    CdsConvenios_ClassesCD_CLASSE: TFloatField;
    CdsConvenios_ClassesDESCRICAO: TStringField;
    CdsConvenios_ClassesDESCONTO: TFloatField;
    SqlPrecoVenda: TSQLDataSet;
    DspPrecoVenda: TDataSetProvider;
    CdsPrecoVenda1: TClientDataSet;
    CdsContas_ReceberGERABOLETO: TStringField;
    CdsContas_ReceberBOLETOGERADO: TStringField;
    CdsCodigoBarras: TClientDataSet;
    CdsPrecosID_PRODUTO: TFloatField;
    CdsPrecosCD_PRODUTO: TStringField;
    CdsPrecosCD_GRUPO: TFloatField;
    CdsPrecosCD_LABORATORIO: TFloatField;
    CdsPrecosCD_CLASSE: TFloatField;
    CdsPrecosCD_LISTA: TFloatField;
    CdsPrecosCODIGO_BARRAS_1: TStringField;
    CdsPrecosCODIGO_BARRAS_2: TStringField;
    CdsPrecosDESCRICAO: TStringField;
    CdsPrecosTIPO_PRODUTO: TStringField;
    CdsPrecosUNIDADE: TStringField;
    CdsPrecosSTATUS: TStringField;
    CdsPrecosQT_EMBALAGEM: TFloatField;
    CdsPrecosESTOQUE_1: TFloatField;
    CdsPrecosESTOQUE_2: TFloatField;
    CdsPrecosESTOQUE_3: TFloatField;
    CdsPrecosESTOQUE_4: TFloatField;
    CdsPrecosESTOQUE_5: TFloatField;
    CdsPrecosESTOQUE_6: TFloatField;
    CdsPrecosESTOQUE_7: TFloatField;
    CdsPrecosESTOQUE_8: TFloatField;
    CdsPrecosESTOQUE_9: TFloatField;
    CdsPrecosESTOQUE_10: TFloatField;
    Sql1: TSQLDataSet;
    CdsPrecoVenda1ID_PRODUTO: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_1: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_2: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_3: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_4: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_5: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_6: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_7: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_8: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_9: TFloatField;
    CdsPrecoVenda1PRECO_VENDA_10: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_1: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_2: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_3: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_4: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_5: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_6: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_7: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_8: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_9: TFloatField;
    CdsPrecoVenda1PRECO_PROMOCAO_10: TFloatField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_1: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_2: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_3: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_4: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_5: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_6: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_7: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_8: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_9: TDateField;
    CdsPrecoVenda1DT_VENCIMENTO_PROMOCAO_10: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_1: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_2: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_3: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_4: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_5: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_6: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_7: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_8: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_9: TDateField;
    CdsPrecoVenda1DT_REAJUSTE_10: TDateField;
    CdsPrecoVenda: TClientDataSet;
    SqlBalancos: TSQLDataSet;
    DspBalancos: TDataSetProvider;
    CdsBalancos: TClientDataSet;
    CdsBalancosID_BALANCO: TFloatField;
    CdsBalancosDATA: TDateField;
    CdsBalancosHORA: TTimeField;
    CdsBalancosDATA_ABERTURA: TDateField;
    CdsBalancosHORA_ABERTURA: TTimeField;
    CdsBalancosDATA_CONCLUSAO: TDateField;
    CdsBalancosHORA_CONCLUSAO: TTimeField;
    CdsBalancosCD_FILIAL: TFloatField;
    CdsBalancosID_PRODUTO: TFloatField;
    CdsBalancosCD_PRODUTO: TStringField;
    CdsBalancosCODIGO_BARRAS_1: TStringField;
    CdsBalancosDESCRICAO: TStringField;
    CdsBalancosCD_GRUPO: TFloatField;
    CdsBalancosGRUPO: TStringField;
    CdsBalancosCD_LABORATORIO: TFloatField;
    CdsBalancosLABORATORIO: TStringField;
    CdsBalancosCD_CLASSE: TFloatField;
    CdsBalancosCLASSE: TStringField;
    CdsBalancosCUSTO_UNITARIO: TFloatField;
    CdsBalancosPRECO_VENDA: TFloatField;
    CdsBalancosPRECO_VENDA_ANTERIOR: TFloatField;
    CdsBalancosESTOQUE: TFloatField;
    CdsBalancosESTOQUE_ANTERIOR: TFloatField;
    CdsBalancosSUBSTITUIESTOQUE: TStringField;
    CdsBalancosSTATUS: TStringField;
    CdsBalancosENVIADO: TStringField;
    CdsAlteracaoBalancos: TClientDataSet;
    CdsContas_ReceberTEFTRANSACAO: TFloatField;
    CdsContas_ReceberTEFLOTE: TFloatField;
    CdsContas_ReceberTEFDATA: TDateField;
    CdsContas_ReceberTEFHORA: TTimeField;
    CdsContas_ReceberTEFNOMEREDE: TStringField;
    CdsContas_ReceberTEFVALOR: TFloatField;
    CdsDeletadosHORA: TTimeField;
    SqlMetaFilial: TSQLDataSet;
    DspMetaFilial: TDataSetProvider;
    CdsMetaFilial: TClientDataSet;
    CdsMetaFilialID_META: TFloatField;
    CdsMetaFilialCD_FILIAL: TFloatField;
    CdsMetaFilialMESREF: TStringField;
    CdsMetaFilialANOREF: TStringField;
    CdsMetaFilialDIASUTEIS: TFloatField;
    CdsMetaFilialMETAVALOR: TFloatField;
    CdsMetaFilialMETAQUANTIDADE: TFloatField;
    CdsMetaFilialMETACLIENTES: TFloatField;
    CdsMetaFilialMETATICKET: TFloatField;
    CdsMetaFilialACUMULADOVALOR: TFloatField;
    CdsMetaFilialACUMULADOQUANTIDADE: TFloatField;
    CdsMetaFilialACUMULADOCLIENTES: TFloatField;
    CdsMetaFilialACUMULADOTICKET: TFloatField;
    CdsMetaFilialACUMULADOCUSTO: TFloatField;
    CdsMetaFilialACUMULADODESCONTO: TFloatField;
    CdsMetaFilialACUMULADOLUCRO: TFloatField;
    CdsMetaFilialENVIADO: TStringField;
    SqlMetaVendedor: TSQLDataSet;
    DspMetaVendedor: TDataSetProvider;
    CdsMetaVendedor: TClientDataSet;
    CdsMetaVendedorID_META: TFloatField;
    CdsMetaVendedorCD_VENDEDOR: TFloatField;
    CdsMetaVendedorMETAVALOR: TFloatField;
    CdsMetaVendedorMETAQUANTIDADE: TFloatField;
    CdsMetaVendedorMETACLIENTES: TFloatField;
    CdsMetaVendedorMETATICKET: TFloatField;
    CdsMetaVendedorACUMULADOVALOR: TFloatField;
    CdsMetaVendedorACUMULADOQUANTIDADE: TFloatField;
    CdsMetaVendedorACUMULADOCLIENTES: TFloatField;
    CdsMetaVendedorACUMULADOTICKET: TFloatField;
    CdsMetaVendedorACUMULADOCUSTO: TFloatField;
    CdsMetaVendedorACUMULADODESCONTO: TFloatField;
    CdsMetaVendedorACUMULADOLUCRO: TFloatField;
    CdsMetaVendedorENVIADO: TStringField;
    CdsPrecosID_FAMILIA: TFloatField;
    SqlFamilias: TSQLDataSet;
    DspFamilias: TDataSetProvider;
    CdsFamilias: TClientDataSet;
    CdsComprasVINCULADO: TStringField;
    CdsComprasCD_COMPRAS_VINCULADO: TFloatField;
    CdsComprasTEMVINCULADO: TStringField;
    CdsItensCompraCD_FILIAL_DESTINO: TFloatField;
    CdsItensCompraULTIMOCUSTO: TFloatField;
    CdsItensCompraPRECO_REAJUSTADO: TStringField;
    CdsCartoesIMAGEM: TFloatField;
    CdsCartoesUSATEF: TStringField;
    CdsCartoesENVIADO: TStringField;
    CdsFormasPagamentoCD_FORMA_PAGAMENTO: TFloatField;
    CdsFormasPagamentoDESCRICAO: TStringField;
    CdsFormasPagamentoARREDONDAMENTO: TStringField;
    CdsFormasPagamentoARREDONDA: TStringField;
    CdsFormasPagamentoINDICE_R: TFloatField;
    CdsFormasPagamentoINDICE_M: TFloatField;
    CdsFormasPagamentoLOCALECF: TStringField;
    CdsFormasPagamentoAVISTA: TStringField;
    CdsFormasPagamentoPERMITE_DESCONTO: TStringField;
    CdsFormasPagamentoJUROSPARCELAMENTO: TStringField;
    CdsFormasPagamentoPARCELAINICIAL: TFloatField;
    CdsFormasPagamentoJUROS: TFloatField;
    CdsFormasPagamentoNUMEROVIAS: TFloatField;
    CdsFormasPagamentoPAGAMENTOCOMISSAOAVISTA: TStringField;
    CdsDistribuidoresCD_DISTRIBUIDOR: TFloatField;
    CdsDistribuidoresNOME: TStringField;
    CdsDistribuidoresAPELIDO: TStringField;
    CdsDistribuidoresENDERECO: TStringField;
    CdsDistribuidoresBAIRRO: TStringField;
    CdsDistribuidoresCIDADE: TStringField;
    CdsDistribuidoresUF: TStringField;
    CdsDistribuidoresCEP: TStringField;
    CdsDistribuidoresCAIXA_POSTAL: TStringField;
    CdsDistribuidoresFONE: TStringField;
    CdsDistribuidoresFAX: TStringField;
    CdsDistribuidoresCONTATO: TStringField;
    CdsDistribuidoresCNPJ: TStringField;
    CdsDistribuidoresIE: TStringField;
    CdsDistribuidoresPRACA: TStringField;
    CdsDistribuidoresDT_FICHA: TDateField;
    CdsDistribuidoresRG: TStringField;
    CdsDistribuidoresCPF: TStringField;
    CdsDistribuidoresEMPRESA: TStringField;
    CdsDistribuidoresFONE_COMERCIAL: TStringField;
    CdsDistribuidoresCEP_COMERCIAL: TStringField;
    CdsDistribuidoresCIDADE_COMERCIAL: TStringField;
    CdsDistribuidoresUF_COMERCIAL: TStringField;
    CdsDistribuidoresREFERENCIA_COMERCIAL: TStringField;
    CdsDistribuidoresREFERENCIA_BANCARIA: TStringField;
    CdsDistribuidoresDT_CONSULTA_SPC: TDateField;
    CdsDistribuidoresOBS_SPC: TStringField;
    CdsDistribuidoresTIPO_ATIVIDADE: TStringField;
    CdsDistribuidoresOBS_GERAL: TMemoField;
    CdsDistribuidoresVENDEDOR: TStringField;
    CdsDistribuidoresENDERECO_COBRANCA: TStringField;
    CdsDistribuidoresBAIRRO_COBRANCA: TStringField;
    CdsDistribuidoresCIDADE_COBRANCA: TStringField;
    CdsDistribuidoresUF_COBRANCA: TStringField;
    CdsDistribuidoresCEP_COBRANCA: TStringField;
    CdsDistribuidoresICM_IPI: TFloatField;
    CdsDistribuidoresFOTO: TBlobField;
    CdsDistribuidoresLIMITE_CREDITO: TFloatField;
    CdsDistribuidoresEMAIL: TStringField;
    CdsDistribuidoresHOMEPAGE: TStringField;
    CdsDistribuidoresCD_PLANO_CONTAS: TFloatField;
    CdsDistribuidoresRAZAO: TStringField;
    CdsDistribuidoresDT_ALTERACAO: TDateField;
    CdsDistribuidoresCODIGODICIONARIO: TFloatField;
    CdsDistribuidoresCODIGOFATURAMENTO: TStringField;
    CdsConveniosCD_CONVENIO: TFloatField;
    CdsConveniosNOME: TStringField;
    CdsConveniosRAZAO: TStringField;
    CdsConveniosENDERECO: TStringField;
    CdsConveniosBAIRRO: TStringField;
    CdsConveniosCIDADE: TStringField;
    CdsConveniosUF: TStringField;
    CdsConveniosCEP: TStringField;
    CdsConveniosCAIXA_POSTAL: TStringField;
    CdsConveniosFONE: TStringField;
    CdsConveniosFAX: TStringField;
    CdsConveniosCONTATO: TStringField;
    CdsConveniosCNPJ: TStringField;
    CdsConveniosIE: TStringField;
    CdsConveniosPRACA: TStringField;
    CdsConveniosDT_FICHA: TDateField;
    CdsConveniosRG: TStringField;
    CdsConveniosCPF: TStringField;
    CdsConveniosEMPRESA: TStringField;
    CdsConveniosFONE_COMERCIAL: TStringField;
    CdsConveniosCEP_COMERCIAL: TStringField;
    CdsConveniosCIDADE_COMERCIAL: TStringField;
    CdsConveniosUF_COMERCIAL: TStringField;
    CdsConveniosREFERENCIA_COMERCIAL: TStringField;
    CdsConveniosREFERENCIA_BANCARIA: TStringField;
    CdsConveniosDT_CONSULTA_SPC: TDateField;
    CdsConveniosOBS_SPC: TStringField;
    CdsConveniosTIPO_ATIVIDADE: TStringField;
    CdsConveniosOBS_GERAL: TMemoField;
    CdsConveniosCD_VENDEDOR: TFloatField;
    CdsConveniosENDERECO_COBRANCA: TStringField;
    CdsConveniosBAIRRO_COBRANCA: TStringField;
    CdsConveniosCIDADE_COBRANCA: TStringField;
    CdsConveniosUF_COBRANCA: TStringField;
    CdsConveniosCEP_COBRANCA: TStringField;
    CdsConveniosICM_IPI: TFloatField;
    CdsConveniosFOTO: TBlobField;
    CdsConveniosLIMITE_CREDITO: TFloatField;
    CdsConveniosEMAIL: TStringField;
    CdsConveniosHOMEPAGE: TStringField;
    CdsConveniosMULTI: TStringField;
    CdsConveniosTX_DESCONTO: TFloatField;
    CdsConveniosDT_VENCIMENTO: TFloatField;
    CdsConveniosSALDO: TFloatField;
    CdsConveniosJAN: TFloatField;
    CdsConveniosFEV: TFloatField;
    CdsConveniosMAR: TFloatField;
    CdsConveniosABR: TFloatField;
    CdsConveniosMAI: TFloatField;
    CdsConveniosJUN: TFloatField;
    CdsConveniosJUL: TFloatField;
    CdsConveniosAGO: TFloatField;
    CdsConveniosSET_: TFloatField;
    CdsConveniosOUT: TFloatField;
    CdsConveniosNOV: TFloatField;
    CdsConveniosDEZ: TFloatField;
    CdsConveniosDT_ALTERACAO: TDateField;
    CdsConveniosUSUARIOSITE: TStringField;
    CdsConveniosSENHASITE: TStringField;
    CdsConveniosPERMITEPARCELAMENTO: TStringField;
    CdsGruposCD_GRUPO: TFloatField;
    CdsGruposDESCRICAO: TStringField;
    CdsGruposTX_MARCACAO: TFloatField;
    CdsGruposDESCONTO: TStringField;
    CdsGruposTX_DESCONTO: TFloatField;
    CdsGruposTX_DESCONTO_MAXIMO: TFloatField;
    CdsGruposTX_COMISSAO: TFloatField;
    CdsGruposDIAS_EST_MIN: TFloatField;
    CdsGruposTIPO: TStringField;
    CdsGruposDT_ALTERACAO: TDateField;
    CdsGruposNPRODUTOS: TFloatField;
    CdsGruposVPRODUTOS: TFloatField;
    CdsGruposCPRODUTOS: TFloatField;
    CdsGruposEXIGERECEITA: TStringField;
    CdsGruposVENDEESTOQUENEGATIVO: TStringField;
    CdsGruposPEDECRM: TStringField;
    CdsGruposIMAGEM: TBlobField;
    CdsGruposENVIADO: TStringField;
    CdsFamiliasID_FAMILIA: TFloatField;
    CdsFamiliasDESCRICAO: TStringField;
    CdsFamiliasSTATUS: TStringField;
    CdsFamiliasDT_ALTERACAO: TDateField;
    CdsFamiliasALTERAPRECOFAMILIA: TStringField;
    CdsFamiliasENVIADO: TStringField;
    CdsVendedoresCD_VENDEDOR: TFloatField;
    CdsVendedoresCD_FILIAL: TFloatField;
    CdsVendedoresDT_ADMISSAO: TDateField;
    CdsVendedoresDT_NASCIMENTO: TDateField;
    CdsVendedoresTIPO_FUNCIONARIO: TStringField;
    CdsVendedoresCODIGO_BARRAS: TStringField;
    CdsVendedoresNOME: TStringField;
    CdsVendedoresRUA: TStringField;
    CdsVendedoresBAIRRO: TStringField;
    CdsVendedoresCIDADE: TStringField;
    CdsVendedoresUF: TStringField;
    CdsVendedoresCEP: TStringField;
    CdsVendedoresFONE: TStringField;
    CdsVendedoresREFERENCIA: TStringField;
    CdsVendedoresRG: TStringField;
    CdsVendedoresCPF: TStringField;
    CdsVendedoresJORNADA: TStringField;
    CdsVendedoresINTERVALO: TStringField;
    CdsVendedoresREPOUSO: TStringField;
    CdsVendedoresNR_REGISTRO: TStringField;
    CdsVendedoresCTPS: TStringField;
    CdsVendedoresFUNCAO: TStringField;
    CdsVendedoresSALARIO: TFloatField;
    CdsVendedoresTX_COMISSAO: TFloatField;
    CdsVendedoresCOMISSAO: TFloatField;
    CdsVendedoresVENDA: TFloatField;
    CdsVendedoresOBSERVACAO: TMemoField;
    CdsVendedoresENVIADO: TStringField;
    CdsVendedoresSEXO: TStringField;
    CdsVendedoresESTADO_CIVIL: TStringField;
    CdsVendedoresNATURALIDADE: TStringField;
    CdsVendedoresCONJUGE: TStringField;
    CdsVendedoresDT_NASC_CONJUGE: TDateField;
    CdsVendedoresNUM_DEPEND: TFloatField;
    CdsVendedoresNOMEMAE: TStringField;
    CdsVendedoresNOMEPAI: TStringField;
    CdsVendedoresEMPRESA_ANTERIOR: TStringField;
    CdsVendedoresTEMPO_SERVICO: TStringField;
    CdsVendedoresREFERENCIA_COMERCIAL: TStringField;
    CdsVendedoresREFERENCIA_BANCARIA: TStringField;
    CdsVendedoresDESCONTO: TStringField;
    CdsVendedoresCOMISSAO_MEDICAMENTOS: TStringField;
    CdsVendedoresCOMISSAO_BONIFICADOS: TStringField;
    CdsVendedoresCOMISSAO_PERFUMARIA: TStringField;
    CdsVendedoresCOMISSAO_OUTROS: TStringField;
    CdsVendedoresCOTA: TFloatField;
    CdsVendedoresSENHA: TStringField;
    CdsVendedoresDT_ALTERACAO: TDateField;
    CdsVendedoresSTATUS: TStringField;
    CdsVendedoresFOTO: TBlobField;
    CdsClassesCD_CLASSE: TFloatField;
    CdsClassesDESCRICAO: TStringField;
    CdsClassesTIPO: TStringField;
    CdsClassesVENDEESTOQUENEGATIVO: TStringField;
    CdsClassesDT_CALCULOCURVA: TDateField;
    CdsClassesFREQUENCIA: TIntegerField;
    CdsClassesENVIADO: TStringField;
    CdsPrecoVendaFilial: TClientDataSet;
    SqlGruposBalanco: TSQLDataSet;
    DspGruposBalanco: TDataSetProvider;
    CdsGruposBalanco: TClientDataSet;
    CdsGruposBalancoCD_GRUPOBALANCO: TFloatField;
    CdsGruposBalancoDESCRICAO: TStringField;
    CdsGruposBalancoSTATUS: TStringField;
    CdsGruposBalancoDT_ALTERACAO: TDateField;
    CdsGruposBalancoENVIADO: TStringField;
    SqlGruposCompras: TSQLDataSet;
    DspGruposCompras: TDataSetProvider;
    CdsGruposCompras: TClientDataSet;
    CdsGruposComprasCD_GRUPOCOMPRA: TFloatField;
    CdsGruposComprasDESCRICAO: TStringField;
    CdsGruposComprasSTATUS: TStringField;
    CdsGruposComprasDT_ALTERACAO: TDateField;
    CdsGruposComprasENVIADO: TStringField;
    SqlGruposCurvas: TSQLDataSet;
    DspGruposCurvas: TDataSetProvider;
    CdsGruposCurvas: TClientDataSet;
    CdsGruposCurvasCD_FILIAL: TFloatField;
    CdsGruposCurvasCD_GRUPO: TFloatField;
    CdsGruposCurvasGRUPO: TStringField;
    CdsGruposCurvasCD_CURVA: TFloatField;
    CdsGruposCurvasCURVA: TStringField;
    CdsGruposCurvasSIGLA: TStringField;
    CdsGruposCurvasDIASESTOQUE: TFloatField;
    CdsGruposCurvasESEG: TFloatField;
    CdsGruposCurvasP1: TFloatField;
    CdsGruposCurvasP2: TFloatField;
    CdsGruposCurvasP1SAZ: TFloatField;
    CdsGruposCurvasP2SAZ: TFloatField;
    CdsGruposCurvasDT_ALTERACAO: TDateField;
    CdsItensCompraCURVA: TStringField;
    CdsItensCompraMEDIAF: TFloatField;
    CdsPrecosMARGEM_PROMOCAO: TFloatField;
    CdsComprasSTATUSCONFERENCIA: TStringField;
    CdsComprasCD_USUARIO_CONFERENCIA: TFloatField;
    CdsComprasUSUARIO_CONFERENCIA: TStringField;
    CdsComprasCONFIGGERACAO: TStringField;
    CdsComprasLOCALGERACAO: TStringField;
    SqlConexao: TSQLDataSet;
    DspConexao: TDataSetProvider;
    CdsConexao: TClientDataSet;
    CdsConexaoCNPJ: TStringField;
    SqlNumeroLancamentos2: TSQLDataSet;
    DspNumeroLancamentos2: TDataSetProvider;
    CdsNumeroLancamentos2: TClientDataSet;
    CdsNumeroLancamentos2COUNT: TIntegerField;
    SqlNumeroCaixa2: TSQLDataSet;
    DspNumeroCaixa2: TDataSetProvider;
    CdsNumeroCaixa2: TClientDataSet;
    CdsNumeroCaixa2COUNT: TIntegerField;
    SqlIdProduto: TSQLDataSet;
    DspIdProduto: TDataSetProvider;
    CdsIdProduto: TClientDataSet;
    CdsIdProdutoID_PRODUTO: TFloatField;
    CdsPrecosUSOCONTINUO: TStringField;
    CdsLogCLASSES: TFloatField;
    CdsLogGRUPOS: TFloatField;
    CdsLogLABORATORIOS: TFloatField;
    CdsLogDISTRIBUIDORES: TFloatField;
    CdsLogFAMILIAS: TFloatField;
    CdsLogGRUPOSBALANCO: TFloatField;
    CdsLogGRUPOSCOMPRAS: TFloatField;
    CdsLogCARTOES: TFloatField;
    CdsConveniosPAGACOMISSAO: TStringField;
    CdsClientesCOMPRAOUTRALOJA: TStringField;
    CdsLogTOTAL_PROMOCAO: TFloatField;
    CdsPrecosCOMISSAO: TFloatField;
    CdsPrecosTX_DESCONTO: TFloatField;
    CdsComprasDeletadas: TClientDataSet;
    CdsPrecosCOMPRIMIDOSCAIXA: TFloatField;
    CdsProdutosTotais: TClientDataSet;
    SqlTransferVenda: TSQLDataSet;
    DspTransferVenda: TDataSetProvider;
    CdsTransferVenda: TClientDataSet;
    FloatField6: TFloatField;
    DateField4: TDateField;
    DateField5: TDateField;
    TimeField3: TTimeField;
    DateField6: TDateField;
    TimeField4: TTimeField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    SqlItensTransferVenda: TSQLDataSet;
    DspItensTransferVenda: TDataSetProvider;
    CdsItensTransferVenda: TClientDataSet;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField5: TStringField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    SqlUsuarios: TSQLDataSet;
    DspUsuarios: TDataSetProvider;
    CdsUsuarios: TClientDataSet;
    CdsUsuariosCD_USUARIO: TFloatField;
    CdsUsuariosCD_PERMISSAO: TFloatField;
    CdsUsuariosNOME: TStringField;
    CdsUsuariosLOGIN: TStringField;
    CdsUsuariosSENHA: TStringField;
    CdsUsuariosPODEVENDER: TStringField;
    CdsUsuariosCAIXA: TStringField;
    CdsUsuariosTX_DESCONTO_MAXIMO: TFloatField;
    CdsUsuariosENVIADO: TStringField;
    SqlPermissoesModulos: TSQLDataSet;
    DspPermissoesModulos: TDataSetProvider;
    CdsPermissoesModulos: TClientDataSet;
    CdsPermissoesModulosCD_PERMISSAO: TFloatField;
    CdsPermissoesModulosCD_MODULO: TFloatField;
    CdsPermissoesModulosPERMITIDO: TStringField;
    CdsPermissoesModulosINCLUSAO: TStringField;
    CdsPermissoesModulosALTERACAO: TStringField;
    CdsPermissoesModulosEXCLUSAO: TStringField;
    CdsPermissoesModulosIMPRESSAO: TStringField;
    CdsPermissoesModulosENVIADO: TStringField;
    SqlPermissoes: TSQLDataSet;
    DspPermissoes: TDataSetProvider;
    CdsPermissoes: TClientDataSet;
    CdsUsu: TClientDataSet;
    CdsPrecosESTOQUE_11: TFloatField;
    CdsPrecosESTOQUE_12: TFloatField;
    CdsPrecosESTOQUE_13: TFloatField;
    CdsPrecosESTOQUE_14: TFloatField;
    CdsPrecosESTOQUE_15: TFloatField;
    CdsIdProdutoLoja: TClientDataSet;
    SqlProdutosLojaInc: TSQLDataSet;
    DspProdutosLojaInc: TDataSetProvider;
    CdsProdutosLojaInc: TClientDataSet;
    CdsProdutosLojaIncID_PRODUTO: TFloatField;
    CdsProdutosLojaIncCD_PRODUTO: TStringField;
    CdsProdutosLojaIncCD_LABORATORIO: TFloatField;
    CdsProdutosLojaIncCD_GRUPO: TFloatField;
    CdsProdutosLojaIncCD_CLASSE: TFloatField;
    CdsProdutosLojaIncID_FAMILIA: TFloatField;
    CdsProdutosLojaIncCD_LISTA: TFloatField;
    CdsProdutosLojaIncCD_PRINCIPIO: TFloatField;
    CdsProdutosLojaIncCD_GRUPOBALANCO: TFloatField;
    CdsProdutosLojaIncCD_GRUPOCOMPRA: TFloatField;
    CdsProdutosLojaIncTIPO_PRODUTO: TStringField;
    CdsProdutosLojaIncDESCRICAO: TStringField;
    CdsProdutosLojaIncCODIGO_BARRAS_1: TStringField;
    CdsProdutosLojaIncCODIGO_BARRAS_2: TStringField;
    CdsProdutosLojaIncCOMPOSICAO: TMemoField;
    CdsProdutosLojaIncCURVA: TStringField;
    CdsProdutosLojaIncIDENTIFICADOR: TStringField;
    CdsProdutosLojaIncQT_EMBALAGEM: TFloatField;
    CdsProdutosLojaIncDT_VENCIMENTO: TDateField;
    CdsProdutosLojaIncICMS: TStringField;
    CdsProdutosLojaIncLISTA: TStringField;
    CdsProdutosLojaIncENTRA_PEDIDO_ELETRONICO: TStringField;
    CdsProdutosLojaIncETIQUETA: TStringField;
    CdsProdutosLojaIncFOTO: TBlobField;
    CdsProdutosLojaIncCUSTO_UNITARIO: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR: TFloatField;
    CdsProdutosLojaIncMARGEM_PROMOCAO: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO: TFloatField;
    CdsProdutosLojaIncMARGEM: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA: TFloatField;
    CdsProdutosLojaIncCOMISSAO: TFloatField;
    CdsProdutosLojaIncDT_CADASTRO: TDateField;
    CdsProdutosLojaIncDT_ALTERACAO: TDateField;
    CdsProdutosLojaIncDT_ULTIMA_COMPRA: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE: TDateField;
    CdsProdutosLojaIncDT_INVENTARIO: TDateField;
    CdsProdutosLojaIncQUANTIDADE_ENTRADA: TFloatField;
    CdsProdutosLojaIncQUANTIDADE_SAIDA: TFloatField;
    CdsProdutosLojaIncQUANTIDADE_TRANSFERIDA: TFloatField;
    CdsProdutosLojaIncESTOQUE_0: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_0: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_0: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_0: TDateField;
    CdsProdutosLojaIncESTOQUE_1: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_1: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_1: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_1: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_1: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_1: TFloatField;
    CdsProdutosLojaIncFACE_1: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_1: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_1: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_1: TStringField;
    CdsProdutosLojaIncESTOQUE_2: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_2: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_2: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_2: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_2: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_2: TFloatField;
    CdsProdutosLojaIncFACE_2: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_2: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_2: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_2: TStringField;
    CdsProdutosLojaIncESTOQUE_3: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_3: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_3: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_3: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_3: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_3: TFloatField;
    CdsProdutosLojaIncFACE_3: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_3: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_3: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_3: TStringField;
    CdsProdutosLojaIncESTOQUE_4: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_4: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_4: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_4: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_4: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_4: TFloatField;
    CdsProdutosLojaIncFACE_4: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_4: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_4: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_4: TStringField;
    CdsProdutosLojaIncESTOQUE_5: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_5: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_5: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_5: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_5: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_5: TFloatField;
    CdsProdutosLojaIncFACE_5: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_5: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_5: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_5: TStringField;
    CdsProdutosLojaIncESTOQUE_6: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_6: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_6: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_6: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_6: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_6: TFloatField;
    CdsProdutosLojaIncFACE_6: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_6: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_6: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_6: TStringField;
    CdsProdutosLojaIncESTOQUE_7: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_7: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_7: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_7: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_7: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_7: TFloatField;
    CdsProdutosLojaIncFACE_7: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_7: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_7: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_7: TStringField;
    CdsProdutosLojaIncESTOQUE_8: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_8: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_8: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_8: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_8: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_8: TFloatField;
    CdsProdutosLojaIncFACE_8: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_8: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_8: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_8: TStringField;
    CdsProdutosLojaIncESTOQUE_9: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_9: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_9: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_9: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_9: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_9: TFloatField;
    CdsProdutosLojaIncFACE_9: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_9: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_9: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_9: TStringField;
    CdsProdutosLojaIncESTOQUE_10: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_10: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_10: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_10: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_10: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_10: TFloatField;
    CdsProdutosLojaIncFACE_10: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_10: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_10: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_10: TStringField;
    CdsProdutosLojaIncESTOQUE_11: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_11: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_11: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_11: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_11: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_11: TFloatField;
    CdsProdutosLojaIncFACE_11: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_11: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_11: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_11: TStringField;
    CdsProdutosLojaIncESTOQUE_12: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_12: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_12: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_12: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_12: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_12: TFloatField;
    CdsProdutosLojaIncFACE_12: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_12: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_12: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_12: TStringField;
    CdsProdutosLojaIncESTOQUE_13: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_13: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_13: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_13: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_13: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_13: TFloatField;
    CdsProdutosLojaIncFACE_13: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_13: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_13: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_13: TStringField;
    CdsProdutosLojaIncESTOQUE_14: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_14: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_14: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_14: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_14: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_14: TFloatField;
    CdsProdutosLojaIncFACE_14: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_14: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_14: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_14: TStringField;
    CdsProdutosLojaIncESTOQUE_15: TFloatField;
    CdsProdutosLojaIncESTOQUE_MINIMO_15: TFloatField;
    CdsProdutosLojaIncESTOQUE_MAXIMO_15: TFloatField;
    CdsProdutosLojaIncDT_ULT_VENDA_15: TDateField;
    CdsProdutosLojaIncCUSTO_UNITARIO_15: TFloatField;
    CdsProdutosLojaIncCUSTO_MEDIO_15: TFloatField;
    CdsProdutosLojaIncFACE_15: TFloatField;
    CdsProdutosLojaIncDT_ULT_COMPRA_15: TDateField;
    CdsProdutosLojaIncCURVA_UNITARIA_15: TStringField;
    CdsProdutosLojaIncCURVA_FINANCEIRA_15: TStringField;
    CdsProdutosLojaIncTX_DESCONTO: TFloatField;
    CdsProdutosLojaIncBALANCA: TStringField;
    CdsProdutosLojaIncUNIDADE: TStringField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO: TDateField;
    CdsProdutosLojaIncSTATUS: TStringField;
    CdsProdutosLojaIncGENERICO: TStringField;
    CdsProdutosLojaIncENVIADO: TStringField;
    CdsProdutosLojaIncPRECO_VENDA_1: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_2: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_3: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_4: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_5: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_6: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_7: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_8: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_9: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_10: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_11: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_12: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_13: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_14: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_15: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_1: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_2: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_3: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_4: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_5: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_6: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_7: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_8: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_9: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_10: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_11: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_12: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_13: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_14: TFloatField;
    CdsProdutosLojaIncPRECO_PROMOCAO_15: TFloatField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_1: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_2: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_3: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_4: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_5: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_6: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_7: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_8: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_9: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_10: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_11: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_12: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_13: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_14: TDateField;
    CdsProdutosLojaIncDT_VENCIMENTO_PROMOCAO_15: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_1: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_2: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_3: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_4: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_5: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_6: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_7: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_8: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_9: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_10: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_11: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_12: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_13: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_14: TDateField;
    CdsProdutosLojaIncDT_REAJUSTE_15: TDateField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_1: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_2: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_3: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_4: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_5: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_6: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_7: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_8: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_9: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_10: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_11: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_12: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_13: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_14: TFloatField;
    CdsProdutosLojaIncPRECO_VENDA_ANTERIOR_15: TFloatField;
    CdsProdutosLojaIncUSOCONTINUO: TStringField;
    CdsProdutosLojaIncCOMPRIMIDOSCAIXA: TFloatField;
    CdsProdutosLojaIncDATA_VENCIMENTO_1: TDateField;
    CdsProdutosLojaIncDATA_VENCIMENTO_2: TDateField;
    CdsProdutosLojaIncCONTROLADO: TStringField;
    CdsProdutosLojaIncID_PORTARIA: TFloatField;
    CdsProdutosLojaIncPRINCIPIOATIVO: TStringField;
    CdsProdutosLojaIncREGISTROMS: TStringField;
    CdsProdutosLojaIncMEDIAF_1: TFloatField;
    CdsProdutosLojaIncMEDIAF_2: TFloatField;
    CdsProdutosLojaIncMEDIAF_3: TFloatField;
    CdsProdutosLojaIncMEDIAF_4: TFloatField;
    CdsProdutosLojaIncMEDIAF_5: TFloatField;
    CdsProdutosLojaIncMEDIAF_6: TFloatField;
    CdsProdutosLojaIncMEDIAF_7: TFloatField;
    CdsProdutosLojaIncMEDIAF_8: TFloatField;
    CdsProdutosLojaIncMEDIAF_9: TFloatField;
    CdsProdutosLojaIncMEDIAF_10: TFloatField;
    CdsProdutosLojaIncMEDIAF_11: TFloatField;
    CdsProdutosLojaIncMEDIAF_12: TFloatField;
    CdsProdutosLojaIncMEDIAF_13: TFloatField;
    CdsProdutosLojaIncMEDIAF_14: TFloatField;
    CdsProdutosLojaIncMEDIAF_15: TFloatField;
    CdsProdutosLojaIncSAZONAL: TStringField;
    CdsProdutosLojaIncJANSAZ: TStringField;
    CdsProdutosLojaIncFEVSAZ: TStringField;
    CdsProdutosLojaIncMARSAZ: TStringField;
    CdsProdutosLojaIncABRSAZ: TStringField;
    CdsProdutosLojaIncMAISAZ: TStringField;
    CdsProdutosLojaIncJUNSAZ: TStringField;
    CdsProdutosLojaIncJULSAZ: TStringField;
    CdsProdutosLojaIncAGOSAZ: TStringField;
    CdsProdutosLojaIncSETSAZ: TStringField;
    CdsProdutosLojaIncOUTSAZ: TStringField;
    CdsProdutosLojaIncNOVSAZ: TStringField;
    CdsProdutosLojaIncDEZSAZ: TStringField;
    CdsProdutosLojaIncSITUACAOTRIBUTARIA: TStringField;
    CdsProdutosLojaIncUSUARIO: TStringField;
    CdsProdutosLojaIncRESERVA: TFloatField;
    CdsIdProdutoLojaID_PRODUTO: TFloatField;
    CdsClassesNPRODUTOS: TFloatField;
    CdsClassesNITENS: TFloatField;
    CdsClassesVPRODUTOS: TFloatField;
    CdsClassesCPRODUTOS: TFloatField;
    CdsClassesCONTROLALOTES: TStringField;
    CdsLaboratoriosID_AREA: TFloatField;
    CdsLaboratoriosNITENS: TFloatField;
    CdsGruposNITENS: TFloatField;
    CdsGruposMETA: TFloatField;
    CdsPrecosPRINCIPIOATIVO: TStringField;
    CdsPermissoesCD_PERMISSAO: TFloatField;
    CdsPermissoesDESCRICAO: TStringField;
    CdsPermissoesENVIADO: TStringField;
    CdsPrecosCD_GRUPOBALANCO: TFloatField;
    CdsPrecosCD_GRUPOCOMPRA: TFloatField;
    SqlNumeroLancamentosaPrazo: TSQLDataSet;
    DspNumeroLancamentosaPrazo: TDataSetProvider;
    CdsNumeroLancamentosaPrazo: TClientDataSet;
    SqlCdLancamentoaPrazo: TSQLDataSet;
    DspLancamentoaPrazo: TDataSetProvider;
    CdsCdLancamentoaPrazo: TClientDataSet;
    CdsNumeroLancamentosaPrazoCOUNT: TIntegerField;
    CdsCdLancamentoaPrazoCD_LANCAMENTO: TFloatField;
    SqlLancamentosaPrazo: TSQLDataSet;
    DspLancamentosaPrazo: TDataSetProvider;
    CdsLancamentosaPrazo: TClientDataSet;
    CdsLancamentosaPrazoCD_LANCAMENTO: TFloatField;
    CdsLancamentosaPrazoID_PRODUTO: TFloatField;
    CdsLancamentosaPrazoCD_FILIAL: TFloatField;
    CdsLancamentosaPrazoCD_PRODUTO: TStringField;
    CdsLancamentosaPrazoDESCRICAO: TStringField;
    CdsLancamentosaPrazoCD_LABORATORIO: TFloatField;
    CdsLancamentosaPrazoCD_GRUPO: TFloatField;
    CdsLancamentosaPrazoCD_CLASSE: TFloatField;
    CdsLancamentosaPrazoCD_CONVENIO: TFloatField;
    CdsLancamentosaPrazoCD_CLIENTE: TFloatField;
    CdsLancamentosaPrazoCD_VENDEDOR: TFloatField;
    CdsLancamentosaPrazoCD_OPERADOR: TFloatField;
    CdsLancamentosaPrazoCD_USUARIO: TFloatField;
    CdsLancamentosaPrazoCD_FORMA_PAGAMENTO: TFloatField;
    CdsLancamentosaPrazoCD_VENDA: TFloatField;
    CdsLancamentosaPrazoID_OPERADORCAIXA: TFloatField;
    CdsLancamentosaPrazoCUSTO_MEDIO: TFloatField;
    CdsLancamentosaPrazoCUSTO_UNITARIO: TFloatField;
    CdsLancamentosaPrazoDATA_LANCAMENTO: TDateField;
    CdsLancamentosaPrazoDATA_CAIXA: TDateField;
    CdsLancamentosaPrazoQUANTIDADE: TFloatField;
    CdsLancamentosaPrazoVALOR: TFloatField;
    CdsLancamentosaPrazoCOMISSAO: TFloatField;
    CdsLancamentosaPrazoNOTA_FISCAL: TStringField;
    CdsLancamentosaPrazoDESCONTO: TFloatField;
    CdsLancamentosaPrazoPROMOCAO: TFloatField;
    CdsLancamentosaPrazoTIPO_VENDA: TStringField;
    CdsLancamentosaPrazoTIPO_PAGAMENTO: TStringField;
    CdsLancamentosaPrazoENTRADA_SAIDA: TStringField;
    CdsLancamentosaPrazoETIQUETA: TStringField;
    CdsLancamentosaPrazoENTREGA: TStringField;
    CdsLancamentosaPrazoHORA: TTimeField;
    CdsLancamentosaPrazoESTOQUE_POSVENDA: TFloatField;
    CdsLancamentosaPrazoTROCA: TStringField;
    CdsLancamentosaPrazoENVIADO: TStringField;
    CdsLancamentosaPrazoNUMERO: TFloatField;
    CdsLancamentosaPrazoTERMINAL: TFloatField;
    CdsLancamentosaPrazoUSUARIO: TStringField;
    CdsLancamentosaPrazoOBSERVACAO: TStringField;
    CdsLancamentosaPrazoARREDONDAMENTO: TFloatField;
    CdsLancamentosaPrazoTRN: TStringField;
    CdsLancamentosaPrazoTRANSACAOTRN: TStringField;
    CdsLancamentosaPrazoLOTETRN: TStringField;
    CdsLancamentosaPrazoAUTORIZACAOTRN: TStringField;
    CdsLancamentosaPrazoSUBSIDIOTRN: TFloatField;
    CdsSintegraNotas: TClientDataSet;
    CdsSintegraNotasItens: TClientDataSet;
    CdsSintegraPedidos: TClientDataSet;
    CdsSintegraR60: TClientDataSet;
    CdsSintegraR60i: TClientDataSet;
    SqlEncartes: TSQLDataSet;
    SqlEncartesItens: TSQLDataSet;
    DspEncartes: TDataSetProvider;
    DspEncartesItens: TDataSetProvider;
    CdsEncartes: TClientDataSet;
    CdsEncartesID_ENCARTE: TFloatField;
    CdsEncartesDATA: TDateField;
    CdsEncartesHORA: TTimeField;
    CdsEncartesDESCRICAO: TStringField;
    CdsEncartesDATA_INICIAL: TDateField;
    CdsEncartesDATA_FINAL: TDateField;
    CdsEncartesDATA_CONCLUSAO: TDateField;
    CdsEncartesUSUARIO_CRIACAO: TStringField;
    CdsEncartesUSUARIO_CONCLUSAO: TStringField;
    CdsEncartesSTATUS: TStringField;
    CdsEncartesENVIADO: TStringField;
    CdsEncartesItens: TClientDataSet;
    CdsEncartesItensID_ENCARTE: TFloatField;
    CdsEncartesItensID_PRODUTO: TFloatField;
    CdsEncartesItensDESCRICAO: TStringField;
    CdsEncartesItensPRECO_VENDA: TFloatField;
    SqlRedes: TSQLDataSet;
    DspRedes: TDataSetProvider;
    CdsRedes: TClientDataSet;
    CdsRedesID_REDE: TFloatField;
    CdsRedesNOME: TStringField;
    CdsRedesSTATUS: TStringField;
    CdsRedesOBSERVACOES: TStringField;
    CdsRedesIMAGEM: TBlobField;
    CdsRedesSISTEMA: TStringField;
    CdsRedesDT_CADASTRO: TDateField;
    CdsRedesDT_ALTERACAO: TDateField;
    CdsRedesENVIADO: TStringField;
    SqlConcorrentes: TSQLDataSet;
    DspConcorrentes: TDataSetProvider;
    CdsConcorrentes: TClientDataSet;
    CdsConcorrentesID_CONCORRENTE: TFloatField;
    CdsConcorrentesID_REDE: TFloatField;
    CdsConcorrentesID_FILIAL: TFloatField;
    CdsConcorrentesNOME: TStringField;
    CdsConcorrentesDISTANCIA: TFloatField;
    CdsConcorrentesOBSERVACOES: TStringField;
    CdsConcorrentesSTATUS: TStringField;
    CdsConcorrentesENVIADO: TStringField;
    SqlPrecosConcorrentes: TSQLDataSet;
    DspPrecosConcorrentes: TDataSetProvider;
    CdsPrecosConcorrentes: TClientDataSet;
    CdsPrecosConcorrentesID_FILIAL: TFloatField;
    CdsPrecosConcorrentesID_CONCORRENTE: TFloatField;
    CdsPrecosConcorrentesCONCORRENTE: TStringField;
    CdsPrecosConcorrentesID_PRODUTO: TFloatField;
    CdsPrecosConcorrentesPRODUTO: TStringField;
    CdsPrecosConcorrentesCD_CLASSE: TFloatField;
    CdsPrecosConcorrentesCLASSE: TStringField;
    CdsPrecosConcorrentesCD_GRUPO: TFloatField;
    CdsPrecosConcorrentesGRUPO: TStringField;
    CdsPrecosConcorrentesCD_LABORATORIO: TFloatField;
    CdsPrecosConcorrentesLABORATORIO: TStringField;
    CdsPrecosConcorrentesPRECO: TFMTBCDField;
    CdsPrecosConcorrentesENVIADO: TStringField;
    SqlPrecosConcorrentesDeletados: TSQLDataSet;
    DspPrecosConcorrentesDeletados: TDataSetProvider;
    CdsPrecosConcorrentesDeletados: TClientDataSet;
    CdsPrecosConcorrentesDeletadosID_PRODUTO: TFloatField;
    CdsPrecosConcorrentesDeletadosCD_FILIAL: TFloatField;
    CdsPrecosConcorrentesDeletadosID_CONCORRENTE: TFloatField;
    CdsPrecosConcorrentesDeletadosPROCESSO: TFloatField;
    CdsPrecosConcorrentesDeletadosENVIADO: TStringField;
    CdsTransferHORA_GERACAO: TTimeField;
    CdsItensCompraCODIGO_BARRAS: TStringField;
    CdsItensCompraUNIDADE: TStringField;
    CdsItensCompraICMS: TStringField;
    CdsItensCompraBASEICMS: TFloatField;
    CdsItensCompraBASEICMSSUBSTITUICAO: TFloatField;
    CdsItensCompraSITUACAOTRIBITARIA: TStringField;
    CdsItensCompraLOTE: TStringField;
    CdsItensCompraFABRICACAO: TDateField;
    CdsItensCompraVALIDADE: TDateField;
    CdsItensCompraPRECO_PROMOCAO_ATUAL: TFloatField;
    CdsItensCompraPRECO_PROMOCAO: TFloatField;
    CdsItensCompraDESCONTO_OUTROS: TFloatField;
    CdsClientesDeletados: TClientDataSet;
    CdsVendedoresVENDEOUTRALOJA: TStringField;
    CdsPosicaoEstoque: TClientDataSet;
    CdsPrecosCONTROLADO: TStringField;
    CdsCrDeletados: TClientDataSet;
    SqlContasReceberDeletados: TSQLDataSet;
    DspContasReceberDeletados: TDataSetProvider;
    CdsContasReceberDeletados: TClientDataSet;
    CdsContasReceberDeletadosID_PRODUTO: TFloatField;
    CdsContasReceberDeletadosCD_FILIAL: TFloatField;
    CdsConveniosDT_FECHAMENTO: TFloatField;
    CdsConveniosSTATUS: TStringField;
    CdsPrecosPIS_COFINS: TStringField;
    CdsPrecosNCM: TStringField;
    SqlEstoque: TSQLDataSet;
    DspEstoque: TDataSetProvider;
    CdsEstoque: TClientDataSet;
    CdsEstoqueID_PRODUTO: TFloatField;
    CdsEstoqueESTOQUE_1: TFloatField;
    CdsEstoqueESTOQUE_2: TFloatField;
    CdsEstoqueESTOQUE_3: TFloatField;
    CdsEstoqueESTOQUE_4: TFloatField;
    CdsEstoqueESTOQUE_5: TFloatField;
    CdsEstoqueESTOQUE_6: TFloatField;
    CdsEstoqueESTOQUE_7: TFloatField;
    CdsEstoqueESTOQUE_8: TFloatField;
    CdsEstoqueESTOQUE_9: TFloatField;
    CdsEstoqueESTOQUE_10: TFloatField;
    CdsEstoqueESTOQUE_11: TFloatField;
    CdsEstoqueESTOQUE_12: TFloatField;
    CdsEstoqueESTOQUE_13: TFloatField;
    CdsEstoqueESTOQUE_14: TFloatField;
    CdsEstoqueESTOQUE_15: TFloatField;
    SqlLimiteCliente: TSQLDataSet;
    DspLimiteCliente: TDataSetProvider;
    CdsLimiteCliente: TClientDataSet;
    CdsLimiteClienteCD_CLIENTE: TFloatField;
    CdsLimiteClienteLIMITE_CREDITO: TFloatField;
    CdsLimiteClienteLIMITE_PERCENTUAL: TFloatField;
    CdsLimiteClienteSALDO: TFloatField;
    CdsLoja: TClientDataSet;
    SqlMatriz: TSQLDataSet;
    DspMatriz: TDataSetProvider;
    CdsMatriz: TClientDataSet;
    CdsLimiteClienteSTATUS: TStringField;
    CdsVirtuaCD: TClientDataSet;
    CdsVirtuaCDCD: TFloatField;
    CdsComprasMODELONF: TStringField;
    CdsComprasVL_ISENTOICMS: TFloatField;
    CdsComprasICMS_RETIDO: TFloatField;
    CdsComprasPHARMALINK: TStringField;
    CdsItensCompraDIASSEMVENDER: TStringField;
    CdsItensCompraCFOP: TStringField;
    CdsDistribuidoresARQUIVO_ENVIO: TStringField;
    CdsDistribuidoresARQUIVO_RETORNO: TStringField;
    CdsDistribuidoresPROGRAMAENVIO: TStringField;
    CdsDistribuidoresCFOP: TFloatField;
    CdsContas_ReceberTRNTRANSACAO: TStringField;
    CdsContas_ReceberTRNLOTE: TStringField;
    CdsContas_ReceberTRN: TStringField;
    CdsContas_ReceberCD_FILIAL_PAGAMENTO: TFloatField;
    CdsContas_ReceberPARCELA: TIntegerField;
    CdsContas_ReceberCD_CAIXA: TFloatField;
    SqlProjetoPharmalink: TSQLDataSet;
    DspProjetoPharmalink: TDataSetProvider;
    CdsProjetoPharmalink: TClientDataSet;
    CdsProjetoPharmalinkID_PROJETO: TFloatField;
    CdsProjetoPharmalinkDESCRICAO: TStringField;
    CdsProjetoPharmalinkCODIGOPHARMALINK: TStringField;
    CdsProjetoPharmalinkCD_LABORATORIO: TFloatField;
    CdsProjetoPharmalinkSTATUS: TStringField;
    CdsItensCompraVALORICMSSUBTITUICAO: TFloatField;
    CdsPrecosICMS: TStringField;
    CdsPrecosESTOQUE_16: TFloatField;
    CdsPrecosESTOQUE_17: TFloatField;
    CdsPrecosESTOQUE_18: TFloatField;
    CdsPrecosESTOQUE_19: TFloatField;
    CdsPrecosESTOQUE_20: TFloatField;
    CdsPrecosESTOQUE_MINIMO: TFloatField;
    CdsPrecosESTOQUE_MAXIMO: TFloatField;
    CdsPrecosMEDIAF: TFloatField;
    CdsPrecosCURVA_UNITARIA: TStringField;
    CdsPrecosCURVA_FINANCEIRA: TStringField;
    CdsProdutosLotes: TClientDataSet;
    CdsContas_ReceberCD_FILIAL_ORIGEM: TFloatField;
    SqlPerfilCliente: TSQLDataSet;
    DspPerfilCliente: TDataSetProvider;
    CdsPerfilCliente: TClientDataSet;
    CdsPerfilClienteID_PERFIL_CLIENTE: TFloatField;
    CdsPerfilClienteDESCRICAO: TStringField;
    CdsPerfilClienteENVIADO: TStringField;
    CdsClientesCARTAOFIDELIDADE: TStringField;
    CdsClientesENVIADO: TStringField;
    CdsClientesNUMERO: TStringField;
    CdsClientesCOMPLEMENTO: TStringField;
    CdsClientesCD_MUNICIPIO: TStringField;
    CdsClientesCD_PAIS: TStringField;
    CdsClientesID_PERFIL_CLIENTE: TFloatField;
    CdsComprasBONIFICACAO: TStringField;
    CdsItensTransferCD_CLASSE: TFloatField;
    SqlParametros: TSQLDataSet;
    DspParametros: TDataSetProvider;
    CdsParametros: TClientDataSet;
    CdsParametrosSMSGERENCIAL: TStringField;
    CdsParametrosCODIGOUSUARIO: TStringField;
    CdsParametrosSMSTECNICO: TStringField;
    CdsParametrosRAZAO: TStringField;
    CdsParametrosFONE: TStringField;
    CdsFiliaisCD_FILIAL: TFloatField;
    CdsFiliaisNOME: TStringField;
    CdsFiliaisRAZAO: TStringField;
    CdsFiliaisCNPJ: TStringField;
    CdsFiliaisINSCRICAO: TStringField;
    CdsFiliaisRUA: TStringField;
    CdsFiliaisNUMERO: TStringField;
    CdsFiliaisCOMPLEMENTO: TStringField;
    CdsFiliaisBAIRRO: TStringField;
    CdsFiliaisCIDADE: TStringField;
    CdsFiliaisUF: TStringField;
    CdsFiliaisCEP: TStringField;
    CdsFiliaisFONE: TStringField;
    CdsFiliaisFONE_1: TStringField;
    CdsFiliaisFAX: TStringField;
    CdsFiliaisCONTATO: TStringField;
    CdsFiliaisCD_DISTRIBUIDOR: TFloatField;
    CdsFiliaisCD_CLIENTE: TFloatField;
    CdsFiliaisENDERECOWEB: TStringField;
    CdsFiliaisEXPORTAR: TStringField;
    CdsFiliaisMETROSQUADRADOS: TFloatField;
    CdsFiliaisNUMEROFUNCIONARIOS: TFloatField;
    CdsFiliaisNUMEROPDVS: TFloatField;
    CdsFiliaisSTATUS: TStringField;
    CdsFiliaisCD_MUNICIPIO: TStringField;
    CdsEstoqueESTOQUE_16: TFloatField;
    CdsEstoqueESTOQUE_17: TFloatField;
    CdsEstoqueESTOQUE_18: TFloatField;
    CdsEstoqueESTOQUE_19: TFloatField;
    CdsEstoqueESTOQUE_20: TFloatField;
    CdsEstoqueDT_ULT_VENDA_1: TDateField;
    CdsEstoqueDT_ULT_VENDA_2: TDateField;
    CdsEstoqueDT_ULT_VENDA_3: TDateField;
    CdsEstoqueDT_ULT_VENDA_4: TDateField;
    CdsEstoqueDT_ULT_VENDA_5: TDateField;
    CdsEstoqueDT_ULT_VENDA_6: TDateField;
    CdsEstoqueDT_ULT_VENDA_7: TDateField;
    CdsEstoqueDT_ULT_VENDA_8: TDateField;
    CdsEstoqueDT_ULT_VENDA_9: TDateField;
    CdsEstoqueDT_ULT_VENDA_10: TDateField;
    CdsEstoqueDT_ULT_VENDA_11: TDateField;
    CdsEstoqueDT_ULT_VENDA_12: TDateField;
    CdsEstoqueDT_ULT_VENDA_13: TDateField;
    CdsEstoqueDT_ULT_VENDA_14: TDateField;
    CdsEstoqueDT_ULT_VENDA_15: TDateField;
    CdsEstoqueDT_ULT_VENDA_16: TDateField;
    CdsEstoqueDT_ULT_VENDA_17: TDateField;
    CdsEstoqueDT_ULT_VENDA_18: TDateField;
    CdsEstoqueDT_ULT_VENDA_19: TDateField;
    CdsEstoqueDT_ULT_VENDA_20: TDateField;
    CdsVendedoresUSUARIOFARMACIAPOPULAR: TStringField;
    CdsVendedoresSENHAFARMACIAPOPULAR: TStringField;
    SqlAcesso: TSQLDataSet;
    DspAcesso: TDataSetProvider;
    CdsAcesso: TClientDataSet;
    CdsAcessoID_ACESSO: TFloatField;
    CdsAcessoID_CLIENTE: TFloatField;
    CdsAcessoUSUARIO: TStringField;
    CdsAcessoMAQUINA: TStringField;
    CdsAcessoDATA: TDateField;
    CdsAcessoHORA: TTimeField;
    CdsAcessoCHAVE: TStringField;
    CdsAcessoVERSAO: TStringField;
    CdsAcessoCNPJ: TStringField;
    CdsAcessoRAZAO: TStringField;
    CdsAcessoTELEFONE: TStringField;
    CdsPrecosGENERICO: TStringField;
    SQLContas_Pagar: TSQLDataSet;
    DspContas_Pagar: TDataSetProvider;
    CdsContas_Pagar: TClientDataSet;
    CdsContas_PagarCD_CONTAS_PAGAR: TFloatField;
    CdsContas_PagarCD_FILIAL: TFloatField;
    CdsContas_PagarCD_DISTRIBUIDOR: TFloatField;
    CdsContas_PagarCD_COMPRAS: TFloatField;
    CdsContas_PagarCD_CONTA: TFloatField;
    CdsContas_PagarCD_FORMA_PAGAMENTO: TFloatField;
    CdsContas_PagarCD_PLANO_CONTAS: TFloatField;
    CdsContas_PagarNUMERO_NOTA: TStringField;
    CdsContas_PagarSERIAL_NOTA: TStringField;
    CdsContas_PagarDOCUMENTO: TStringField;
    CdsContas_PagarDT_NOTA: TDateField;
    CdsContas_PagarDT_VENCIMENTO: TDateField;
    CdsContas_PagarVALOR: TFloatField;
    CdsContas_PagarOBSERVACAO: TMemoField;
    CdsContas_PagarDT_LANCAMENTO: TDateField;
    CdsContas_PagarDT_PAGAMENTO: TDateField;
    CdsContas_PagarDT_BOLETO: TDateField;
    CdsContas_PagarDT_ENTRADA: TDateField;
    CdsContas_PagarVL_PAGAMENTO: TFloatField;
    CdsContas_PagarVL_JUROS: TFloatField;
    CdsContas_PagarVL_DESCONTO: TFloatField;
    CdsContas_PagarVL_SALDO: TFloatField;
    CdsContas_PagarNOSSO_NUMERO: TStringField;
    CdsContas_PagarBANCO: TStringField;
    CdsContas_PagarAGENCIA: TStringField;
    CdsContas_PagarCONTA: TStringField;
    CdsContas_PagarHISTORICO: TStringField;
    CdsContas_PagarNR_CHEQUE: TStringField;
    CdsContas_PagarSTATUS: TStringField;
    CdsContas_PagarENVIADO: TStringField;
    SqlParametrosFarmax: TSQLDataSet;
    DspParametrosFarmax: TDataSetProvider;
    CdsParametrosFarmax: TClientDataSet;
    CdsParametrosFarmaxVERSAO_GESTOR: TStringField;
    CdsParametrosFarmaxVERSAO_LOJA: TStringField;
    SqlProdutosQuantidade: TSQLDataSet;
    DspProdutosQuantidade: TDataSetProvider;
    CdsProdutosQuantidade: TClientDataSet;
    CdsProdutosQuantidadeID_PRODUTO: TFloatField;
    CdsProdutosQuantidadeQUANTIDADEINICIAL: TFloatField;
    CdsProdutosQuantidadePRECO_VENDA: TFloatField;
    SqlProdutosFP: TSQLDataSet;
    DspProdutosFP: TDataSetProvider;
    CdsProdutosFP: TClientDataSet;
    CdsProdutosFPID_PRODUTO: TFloatField;
    CdsProdutosFPCD_PRODUTO: TStringField;
    CdsProdutosFPCD_LABORATORIO: TFloatField;
    CdsProdutosFPDESCRICAO: TStringField;
    CdsProdutosFPPRECO: TFloatField;
    CdsComprasCHAVENFE: TStringField;
    CdsConferenciaNota: TClientDataSet;
    CdsComprasVL_PIS: TFloatField;
    CdsComprasVL_COFINS: TFloatField;
    CdsComprasINFCPL: TStringField;
    CdsItensCompraCUSTO_APLICADO: TFloatField;
    SqlLotesItensCompras: TSQLDataSet;
    DspLotesItensCompras: TDataSetProvider;
    CdsLotesItensCompras: TClientDataSet;
    CdsLotesItensComprasCD_COMPRAS: TFloatField;
    CdsLotesItensComprasCD_FILIAL: TFloatField;
    CdsLotesItensComprasCD_DISTRIBUIDOR: TFloatField;
    CdsLotesItensComprasNOTA_FISCAL: TStringField;
    CdsLotesItensComprasID_PRODUTO: TFloatField;
    CdsLotesItensComprasLOTE: TStringField;
    CdsLotesItensComprasQUANTIDADE: TFloatField;
    CdsLotesItensComprasFABRICACAO: TDateField;
    CdsLotesItensComprasVALIDADE: TDateField;
    CdsLotesCompra: TClientDataSet;
    CdsPrecosORIGEM: TStringField;
    CdsPrecosCSOSN: TStringField;
    CdsPrecosSITUACAOTRIBUTARIA: TStringField;
    SqlReexportacao: TSQLDataSet;
    DspReexportacao: TDataSetProvider;
    CdsReexportacao: TClientDataSet;
    CdsReexportacaoCD_FILIAL: TFloatField;
    CdsReexportacaoDATA: TDateField;
    CdsReexportacaoENVIADO: TStringField;
    CdsPrecosIDENTIFICADOR: TStringField;
    CdsPrecosMARGEM: TFloatField;
    SqlInterligacao: TSQLDataSet;
    DspInterligacao: TDataSetProvider;
    CdsInterligacao: TClientDataSet;
    SqlProdutosFidelidade: TSQLDataSet;
    DspProdutosFidelidade: TDataSetProvider;
    CdsProdutosFidelidade: TClientDataSet;
    CdsInterligacaoID_LOG: TFloatField;
    CdsInterligacaoCD_FILIAL: TFloatField;
    CdsInterligacaoIP: TStringField;
    CdsInterligacaoDATA: TDateField;
    CdsInterligacaoHORA: TTimeField;
    CdsInterligacaoCHAVE_ACESSO: TStringField;
    CdsInterligacaoNUMERO_ITENS: TFloatField;
    CdsInterligacaoNUMERO_UNIDADES: TFloatField;
    CdsInterligacaoTOTAL_CUSTO: TFloatField;
    CdsInterligacaoTOTAL_VENDA: TFloatField;
    CdsInterligacaoCLASSES: TFloatField;
    CdsInterligacaoGRUPOS: TFloatField;
    CdsInterligacaoLABORATORIOS: TFloatField;
    CdsInterligacaoDISTRIBUIDORES: TFloatField;
    CdsInterligacaoFAMILIAS: TFloatField;
    CdsInterligacaoGRUPOSBALANCO: TFloatField;
    CdsInterligacaoGRUPOSCOMPRAS: TFloatField;
    CdsInterligacaoCARTOES: TFloatField;
    CdsInterligacaoTOTAL_PROMOCAO: TFloatField;
    CdsInterligacaoCNPJ: TStringField;
    CdsCaixasDeletados: TClientDataSet;
    CdsPrecosESTOQUE_21: TFloatField;
    CdsPrecosESTOQUE_22: TFloatField;
    CdsPrecosESTOQUE_23: TFloatField;
    CdsPrecosESTOQUE_24: TFloatField;
    CdsPrecosESTOQUE_25: TFloatField;
    CdsPrecosESTOQUE_26: TFloatField;
    CdsPrecosESTOQUE_27: TFloatField;
    CdsPrecosESTOQUE_28: TFloatField;
    CdsPrecosESTOQUE_29: TFloatField;
    CdsPrecosESTOQUE_30: TFloatField;
    CdsEstoqueESTOQUE_21: TFloatField;
    CdsEstoqueESTOQUE_22: TFloatField;
    CdsEstoqueESTOQUE_23: TFloatField;
    CdsEstoqueESTOQUE_24: TFloatField;
    CdsEstoqueESTOQUE_25: TFloatField;
    CdsEstoqueESTOQUE_26: TFloatField;
    CdsEstoqueESTOQUE_27: TFloatField;
    CdsEstoqueESTOQUE_28: TFloatField;
    CdsEstoqueESTOQUE_29: TFloatField;
    CdsEstoqueESTOQUE_30: TFloatField;
    CdsEstoqueDT_ULT_VENDA_21: TDateField;
    CdsEstoqueDT_ULT_VENDA_22: TDateField;
    CdsEstoqueDT_ULT_VENDA_23: TDateField;
    CdsEstoqueDT_ULT_VENDA_24: TDateField;
    CdsEstoqueDT_ULT_VENDA_25: TDateField;
    CdsEstoqueDT_ULT_VENDA_26: TDateField;
    CdsEstoqueDT_ULT_VENDA_27: TDateField;
    CdsEstoqueDT_ULT_VENDA_28: TDateField;
    CdsEstoqueDT_ULT_VENDA_29: TDateField;
    CdsEstoqueDT_ULT_VENDA_30: TDateField;
    CdsControlador: TClientDataSet;
    CdsControladorN_Itens: TIntegerField;
    CdsControladorN_Unidades: TFloatField;
    CdsControladorT_Custo: TFloatField;
    CdsControladorT_Venda: TFloatField;
    CdsControladorT_Promocao: TFloatField;
    CdsControladorCLASSES: TFloatField;
    CdsControladorGRUPOS: TFloatField;
    CdsControladorLABORATORIOS: TFloatField;
    CdsControladorDISTRIBUIDORES: TFloatField;
    CdsControladorFAMILIAS: TFloatField;
    CdsControladorGRUPOSBALANCO: TFloatField;
    CdsControladorGRUPOSCOMPRAS: TFloatField;
    CdsControladorCARTOES: TFloatField;
    CdsControladorLANCAMENTOS: TFloatField;
    CdsControladorCAIXAS: TFloatField;
    CdsControladorCONTASRECEBER: TFloatField;
    CdsLogLANCAMENTOS: TFloatField;
    CdsLogCAIXAS: TFloatField;
    CdsLogCONTASRECEBER: TFloatField;
    DspDuplicatas: TDataSetProvider;
    SqlLogBoletos: TSQLDataSet;
    DspLogBoletos: TDataSetProvider;
    CdsDuplicatas: TClientDataSet;
    CdsDuplicatasID_BOLETO: TIntegerField;
    CdsDuplicatasOLD: TStringField;
    CdsDuplicatasSITUACAO: TStringField;
    CdsDuplicatasID_CLIENTE: TFloatField;
    CdsDuplicatasAREA: TStringField;
    CdsDuplicatasCD_VENDED: TStringField;
    CdsDuplicatasVALOR: TFloatField;
    CdsDuplicatasDT_VENC: TDateField;
    CdsDuplicatasDT_PAGAM: TDateField;
    CdsDuplicatasCONTROLE: TStringField;
    CdsDuplicatasVL_PAGO: TFloatField;
    CdsDuplicatasFI_CLINICA: TStringField;
    CdsDuplicatasTP_PAGAM: TStringField;
    CdsDuplicatasCHEQUE: TStringField;
    CdsDuplicatasFORMA: TStringField;
    CdsDuplicatasDESCRICAOFORMA: TStringField;
    CdsDuplicatasUSUARIO_BAIXA: TStringField;
    CdsDuplicatasDESCRICAOSERVICO: TStringField;
    CdsDuplicatasTP_BOLETO: TStringField;
    CdsLogBoletos: TClientDataSet;
    CdsLogBoletosID_CLIENTE: TFloatField;
    CdsLogBoletosCHEQUE: TStringField;
    CdsLogBoletosDATAGERACAO: TDateField;
    CdsLogBoletosHORAGERACAO: TTimeField;
    CdsLogBoletosDATAVENCIMETNO: TDateField;
    CdsLogBoletosVALORREAL: TFloatField;
    CdsLogBoletosVALORBOLETO: TFloatField;
    SqlDuplicatas: TSQLDataSet;
    CdsLogBoletosVirtual: TClientDataSet;
    CdsLogBoletosVirtualID_CLIENTE: TFloatField;
    CdsLogBoletosVirtualCHEQUE: TStringField;
    CdsLogBoletosVirtualDATAGERACAO: TDateField;
    CdsLogBoletosVirtualHORAGERACAO: TTimeField;
    CdsLogBoletosVirtualDATAVENCIMETNO: TDateField;
    CdsLogBoletosVirtualVALORREAL: TFloatField;
    CdsLogBoletosVirtualVALORBOLETO: TFloatField;
    SqlPrincipioAtivo: TSQLDataSet;
    DspPrincipioAtivo: TDataSetProvider;
    CdsPrincipioAtivo: TClientDataSet;
    CdsPrincipioAtivoCD_PRINCIPIO: TFloatField;
    CdsPrincipioAtivoDESCRICAO: TStringField;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    SqlSubGrupos: TSQLDataSet;
    DspSubGrupos: TDataSetProvider;
    CdsSubGrupos: TClientDataSet;
    CdsSubGruposCD_SUBGRUPO: TFloatField;
    CdsSubGruposCD_GRUPO: TFloatField;
    CdsSubGruposDESCRICAO: TStringField;
    CdsSubGruposDT_ALTERACAO: TDateField;
    CdsSubGruposENVIADO: TStringField;
    CdsUsuariosCD_FILIAL: TFloatField;
    CdsItensCompraMARGEM_VALOR_AGREGADO: TFloatField;
    CdsItensCompraREDUCAO_ICMS_ST: TFloatField;
    CdsItensCompraPERCENTUAL_ICMS_ST: TFloatField;
    CdsItensCompraPIS_CST: TStringField;
    CdsItensCompraPIS_BASE_CALCULO: TFloatField;
    CdsItensCompraPIS_PERCENTUAL: TFloatField;
    CdsItensCompraPIS_VALOR: TFloatField;
    CdsItensCompraCOFINS_CST: TStringField;
    CdsItensCompraCOFINS_BASE_CALCULO: TFloatField;
    CdsItensCompraCOFINS_PERCENTUAL: TFloatField;
    CdsItensCompraCOFINS_VALOR: TFloatField;
    CdsItensCompraVALOR_OUTRASDESPESAS: TFloatField;
    CdsItensCompraVALOR_SEGURO: TFloatField;
    CdsItensCompraVALOR_FRETE: TFloatField;
    CdsItensCompraVALOR_ISENTO: TFloatField;
    CdsItensCompraVALOR_OUTRAS: TFloatField;
    CdsItensCompraBASECALCULO_IPI: TFloatField;
    CdsItensCompraCST_IPI: TIntegerField;
    CdsItensCompraNATUREZA_ISENTA_PIS: TStringField;
    CdsItensCompraNATUREZA_ISENTA_COFINS: TStringField;
    CdsDistribuidoresCD_MUNICIPIO: TFloatField;
    CdsDistribuidoresCD_PAIS: TFloatField;
    CdsDistribuidoresCOMPLEMENTO: TStringField;
    CdsDistribuidoresNUMERO: TStringField;
    CdsDistribuidoresSOMAICMSSUBSTITUICAO: TStringField;
    CdsDistribuidoresSOMAIPI: TStringField;
    CdsDistribuidoresSOMAFRETE: TStringField;
    CdsDistribuidoresSOMASEGURO: TStringField;
    CdsDistribuidoresSOMAOUTRASDESPESAS: TStringField;
    CdsComprasTRANSFERENCIA: TStringField;
    CdsComprasCONSIGNACAO: TStringField;
    CdsLancamentosaPrazoNOTAMANUAL: TStringField;
    SqlProdDistr: TSQLDataSet;
    DspProdDistr: TDataSetProvider;
    CdsProdDistr: TClientDataSet;
    CdsProdDistrID_PRODUTO: TFloatField;
    CdsProdDistrCD_DISTRIBUIDOR: TFloatField;
    CdsProdDistrCD_PRODUTO: TStringField;
    CdsProdDistrCODIGO: TFloatField;
    CdsProdDistrCODIGO_BARRAS_1: TStringField;
    CdsProdDistrQT_EMBALAGEM: TFloatField;
    CdsProdDistrENVIADO: TStringField;
    CdsConexaoEXPORTAR: TStringField;
    CdsContas_PagarDESPESAFINANCEIRA: TFloatField;
    CdsDistribuidoresUSAFTP: TStringField;
    CdsDistribuidoresFTPHOST: TStringField;
    CdsDistribuidoresFTPUSUARIO: TStringField;
    CdsDistribuidoresFTPSENHA: TStringField;
    CdsDistribuidoresFTPDIRETORIOENVIO: TStringField;
    CdsDistribuidoresFTPDIRETORIORETORNO: TStringField;
    CdsProdutosFPUSAPRECOLOJA: TStringField;
    CdsBalancosID_MOTIVO: TFloatField;
    CdsBalancosDATA_CONTAGEM: TDateField;
    CdsBalancosHORA_CONTAGEM: TTimeField;
    CdsBalancosCODIGO_BARRAS_2: TStringField;
    CdsBalancosCD_SUBGRUPO: TFloatField;
    CdsBalancosUSUARIO_ABERTURA: TStringField;
    CdsBalancosUSUARIO_CONCLUSAO: TStringField;
    CdsItensCompraCEST: TStringField;
    CdsIncluiProdutosID_PRODUTO: TFloatField;
    CdsIncluiProdutosCD_PRODUTO: TStringField;
    CdsIncluiProdutosCODIGO_BARRAS_1: TStringField;
    CdsIncluiProdutosCODIGO_BARRAS_2: TStringField;
    CdsIncluiProdutosDESCRICAO: TStringField;
    CdsIncluiProdutosCD_LABORATORIO: TFloatField;
    CdsIncluiProdutosCD_GRUPO: TFloatField;
    CdsIncluiProdutosCD_GRUPOBALANCO: TFloatField;
    CdsIncluiProdutosCD_GRUPOCOMPRA: TFloatField;
    CdsIncluiProdutosCD_CLASSE: TFloatField;
    CdsIncluiProdutosID_FAMILIA: TFloatField;
    CdsIncluiProdutosTIPO_PRODUTO: TStringField;
    CdsIncluiProdutosENTRA_PEDIDO_ELETRONICO: TStringField;
    CdsIncluiProdutosCD_LISTA: TFloatField;
    CdsIncluiProdutosTX_DESCONTO: TFloatField;
    CdsIncluiProdutosIDENTIFICADOR: TStringField;
    CdsIncluiProdutosBALANCA: TStringField;
    CdsIncluiProdutosUNIDADE: TStringField;
    CdsIncluiProdutosQT_EMBALAGEM: TFloatField;
    CdsIncluiProdutosCOMISSAO: TFloatField;
    CdsIncluiProdutosPRECO_VENDA: TFloatField;
    CdsIncluiProdutosPRECO_PROMOCAO: TFloatField;
    CdsIncluiProdutosICMS: TStringField;
    CdsIncluiProdutosMARGEM: TFloatField;
    CdsIncluiProdutosMARGEM_PROMOCAO: TFloatField;
    CdsIncluiProdutosDT_CADASTRO: TDateField;
    CdsIncluiProdutosCURVA: TStringField;
    CdsIncluiProdutosSTATUS: TStringField;
    CdsIncluiProdutosUSOCONTINUO: TStringField;
    CdsIncluiProdutosPIS_COFINS: TStringField;
    CdsIncluiProdutosNCM: TStringField;
    CdsIncluiProdutosCD_SUBGRUPO: TFloatField;
    CdsIncluiProdutosCEST: TStringField;
    CdsIncluiProdutosCD_CFOP: TFloatField;
    CdsIncluiProdutosSITUACAOTRIBUTARIA: TStringField;
    CdsIncluiProdutosORIGEM: TStringField;
    CdsIncluiProdutosCSOSN: TStringField;
    CdsIncluiProdutosIAT: TStringField;
    CdsIncluiProdutosIPPT: TStringField;
    CdsIncluiProdutosCOMPRIMIDOSCAIXA: TFloatField;
    CdsIncluiProdutosCONTROLADO: TStringField;
    CdsIncluiProdutosGENERICO: TStringField;
    CdsIncluiProdutosCD_PRINCIPIO: TFloatField;
    CdsIncluiProdutosDT_VENCIMENTO_PROMOCAO: TDateField;
    CdsIncluiProdutosCUSTO_UNITARIO: TFloatField;
    CdsPrecosCEST: TStringField;
    CdsPrecosCD_PRINCIPIO: TFloatField;
    SqlDicionarioFarmax: TSQLDataSet;
    DspDicionarioFarmax: TDataSetProvider;
    CdsDicionarioFarmax: TClientDataSet;
    CdsDicionarioFarmaxCODIGOUSUARIO: TStringField;
    CdsDicionarioFarmaxID_PRODUTO: TFloatField;
    CdsDicionarioFarmaxCODIGO_BARRAS_1: TStringField;
    CdsDicionarioFarmaxCODIGO_BARRAS_2: TStringField;
    CdsDicionarioFarmaxDESCRICAO: TStringField;
    CdsDicionarioFarmaxCD_LISTA: TFloatField;
    CdsDicionarioFarmaxCD_CFOP: TFloatField;
    CdsDicionarioFarmaxNCM: TStringField;
    CdsDicionarioFarmaxCEST: TStringField;
    CdsDicionarioFarmaxORIGEM: TStringField;
    CdsDicionarioFarmaxSITUACAOTRIBUTARIA: TStringField;
    CdsDicionarioFarmaxCSOSN: TStringField;
    CdsDicionarioFarmaxICMS: TStringField;
    CdsDicionarioFarmaxCHAVE: TStringField;
    SQLConnection1: TSQLConnection;
    HTTPRIO1: THTTPRIO;
    SqlFiliaisGrupos: TSQLDataSet;
    DspFiliaisGrupos: TDataSetProvider;
    CdsFiliaisGrupos: TClientDataSet;
    CdsFiliaisGruposCD_FILIAL: TFloatField;
    CdsFiliaisGruposCD_GRUPO: TFloatField;
    CdsFiliaisGruposTX_COMISSAO: TFloatField;
    CdsFiliaisGruposDESCONTO: TStringField;
    CdsFiliaisGruposTX_DESCONTO: TFloatField;
    CdsFiliaisGruposTX_DESCONTO_MAXIMO: TFloatField;
    CdsFiliaisGruposENVIADO: TStringField;
    CdsComprasVL_FCP: TFMTBCDField;
    CdsComprasVL_FCPST: TFMTBCDField;
    CdsComprasVL_FCPSTRET: TFMTBCDField;
    CdsComprasVL_II: TFMTBCDField;
    CdsComprasICM_BASESUBSTRET: TFMTBCDField;
    CdsComprasICM_VALORSUBSTRET: TFMTBCDField;
    CdsItensCompraBASECALCULOFCP: TFMTBCDField;
    CdsItensCompraALIQUOTAFCP: TFMTBCDField;
    CdsItensCompraVALORFCP: TFMTBCDField;
    CdsItensCompraBASECALCULOFCPST: TFMTBCDField;
    CdsItensCompraALIQUOTAFCPST: TFMTBCDField;
    CdsItensCompraVALORFCPST: TFMTBCDField;
    CdsItensCompraBASECALCULOFCPSTRET: TFMTBCDField;
    CdsItensCompraALIQUOTAFCPSTRET: TFMTBCDField;
    CdsItensCompraVALORFCPSTRET: TFMTBCDField;
    CdsItensCompraBASEICMSSUBSTITUICAORET: TFMTBCDField;
    CdsItensCompraPERCENTUAL_ICMS_ST_RET: TFMTBCDField;
    CdsItensCompraVALORICMSSUBSTITUICAORET: TFMTBCDField;
    CdsItensCompraNCM: TStringField;
    CdsItensCompraORIGEM: TStringField;
    CdsItensCompraINFORMACOESADICIONAIS: TStringField;
    CdsItensCompraMODALIDADEBC: TIntegerField;
    CdsItensCompraMODALIDADEBCST: TIntegerField;
    CdsItensCompraICMSBCUFDEST: TFMTBCDField;
    CdsItensCompraICMSBCFCPUFDEST: TFMTBCDField;
    CdsItensCompraICMSPERCENTUALFCPUFDEST: TFMTBCDField;
    CdsItensCompraICMSVALORFCPUFDEST: TFMTBCDField;
    CdsItensCompraICMSPERCENTUALINTER: TFMTBCDField;
    CdsItensCompraICMSPERCENTUALUFDEST: TFMTBCDField;
    CdsItensCompraICMSVALORUFREMET: TFMTBCDField;
    CdsItensCompraICMSVALORUFDEST: TFMTBCDField;
    CdsItensCompraICMSPERCENTUALINTERPART: TFMTBCDField;
    CdsItensCompraCODIGOANVISA: TStringField;
    CdsItensCompraPMC: TFMTBCDField;
    CdsProdutosFidelidadeID_PRODUTO: TFloatField;
    CdsProdutosFidelidadeCD_PRODUTO: TStringField;
    CdsProdutosFidelidadeCD_LABORATORIO: TFloatField;
    CdsProdutosFidelidadeCD_GRUPO: TFloatField;
    CdsProdutosFidelidadeDESCRICAO: TStringField;
    CdsProdutosFidelidadePRECO: TFloatField;
    CdsProdutosFidelidadeDT_ALTERACAO: TDateField;
    SqlProdutosFisco: TSQLDataSet;
    DspProdutosFisco: TDataSetProvider;
    CdsProdutosFisco: TClientDataSet;
    CdsProdutosFiscoID_PRODUTO: TFloatField;
    CdsProdutosFiscoCODIGO_BARRAS: TStringField;
    CdsProdutosFiscoDESCRICAO: TStringField;
    CdsProdutosFiscoCD_CLASSE: TFloatField;
    CdsProdutosFiscoCD_LISTA: TFloatField;
    CdsProdutosFiscoCD_CFOP: TFloatField;
    CdsProdutosFiscoORIGEM: TStringField;
    CdsProdutosFiscoSITUACAO_TRIBUTARIA: TStringField;
    CdsProdutosFiscoCST_ICMS: TStringField;
    CdsProdutosFiscoCST_PIS_COFINS_ENTRADA: TStringField;
    CdsProdutosFiscoCST_PIS_COFINS_SAIDA: TStringField;
    CdsProdutosFiscoALIQUOTA_ICMS: TFMTBCDField;
    CdsProdutosFiscoALIQUOTA_PIS: TFMTBCDField;
    CdsProdutosFiscoALIQUOTA_COFINS: TFMTBCDField;
    CdsProdutosFiscoNATUREZA_RECEITA_PISCOFINS: TStringField;
    CdsProdutosFiscoNCM: TStringField;
    CdsProdutosFiscoCEST: TStringField;
    CdsProdutosFiscoDATA_ATAUALIZACAO: TDateField;
    CdsProdutosFiscoSTATUS: TStringField;
    CdsProdutosFiscoID_SEGMENTO: TFloatField;
    CdsProdutosFiscoSEGMENTO: TStringField;
    CdsProdutosFiscoICMSSAIDA: TFMTBCDField;
    CdsProdutosFiscoICMSLEISAIDA: TStringField;
    CdsProdutosFiscoICMSLEISAIDALINK: TStringField;
    CdsProdutosFiscoIPI: TFMTBCDField;
    CdsProdutosFiscoICMSPERCENTUALREDUCAO: TFMTBCDField;
    CdsProdutosFiscoALIQUOTACHEIA: TFMTBCDField;
    CdsProdutosFiscoSUBITEMST: TFMTBCDField;
    CdsProdutosFiscoMVAINTERNO: TFMTBCDField;
    CdsProdutosFiscoMVAEXTERNO: TFMTBCDField;
    CdsProdutosFiscoMVAIMPORTADO: TFMTBCDField;
    CdsProdutosFiscoBASEREDUZIDA: TFMTBCDField;
    CdsProdutosFiscoICMSLEIINTERNO: TStringField;
    CdsProdutosFiscoICMSLEIINTERNOLINK: TStringField;
    CdsProdutosFiscoSITUACAO_TRIBUTARIA_PIS_COFINS: TStringField;
    CdsProdutosFiscoPISCOFINSLEI: TStringField;
    CdsProdutosFiscoPISCOFINSLEILINK: TStringField;
    CdsProdutosFiscoPISCOFINS_NATUREZA_RECEITA: TStringField;
    CdsProdutosFiscoDT_CADASTRO: TDateField;
    CdsProdutosFiscoCADASTROSOLICITADO: TStringField;
    CdsProdutosFiscoFCP: TFMTBCDField;
    CdsProdutosFiscoCST_IPI_SAIDA: TStringField;
    CdsProdutosFiscoALIQ_IPI_SAIDA: TStringField;
    CdsProdutosFiscoREDUCAO_BASE_SAIDA: TFMTBCDField;
    CdsProdutosFiscoDESC_CST_SAIDA: TStringField;
    CdsProdutosFiscoREDUCAO_BASE_ENTRADA: TFMTBCDField;
    CdsProdutosFiscoCFOP_ENTRADA: TFloatField;
    CdsProdutosFiscoALIQ_ICMS_ENTRADA: TFMTBCDField;
    CdsProdutosFiscoCST_IPI_ENTRADA: TStringField;
    CdsProdutosFiscoALIQ_IPI_ENTRADA: TFMTBCDField;
    CdsProdutosFiscoUF_DESTINO: TStringField;
    CdsProdutosFiscoICMS_ATAC_AC: TStringField;
    CdsProdutosFiscoICMS_INDU_AC: TStringField;
    CdsProdutosFiscoICMS_ATAC_AL: TStringField;
    CdsProdutosFiscoICMS_INDU_AL: TStringField;
    CdsProdutosFiscoICMS_ATAC_AM: TStringField;
    CdsProdutosFiscoICMS_INDU_AM: TStringField;
    CdsProdutosFiscoICMS_ATAC_AP: TStringField;
    CdsProdutosFiscoICMS_INDU_AP: TStringField;
    CdsProdutosFiscoICMS_ATAC_BA: TStringField;
    CdsProdutosFiscoICMS_INDU_BA: TStringField;
    CdsProdutosFiscoICMS_ATAC_CE: TStringField;
    CdsProdutosFiscoICMS_INDU_CE: TStringField;
    CdsProdutosFiscoICMS_ATAC_DF: TStringField;
    CdsProdutosFiscoICMS_INDU_DF: TStringField;
    CdsProdutosFiscoICMS_ATAC_ES: TStringField;
    CdsProdutosFiscoICMS_INDU_ES: TStringField;
    CdsProdutosFiscoICMS_ATAC_GO: TStringField;
    CdsProdutosFiscoICMS_INDU_GO: TStringField;
    CdsProdutosFiscoICMS_ATAC_MA: TStringField;
    CdsProdutosFiscoICMS_INDU_MA: TStringField;
    CdsProdutosFiscoICMS_ATAC_MG: TStringField;
    CdsProdutosFiscoICMS_INDU_MG: TStringField;
    CdsProdutosFiscoICMS_ATAC_MS: TStringField;
    CdsProdutosFiscoICMS_INDU_MS: TStringField;
    CdsProdutosFiscoICMS_ATAC_MT: TStringField;
    CdsProdutosFiscoICMS_INDU_MT: TStringField;
    CdsProdutosFiscoICMS_ATAC_PA: TStringField;
    CdsProdutosFiscoICMS_INDU_PA: TStringField;
    CdsProdutosFiscoICMS_ATAC_PB: TStringField;
    CdsProdutosFiscoICMS_INDU_PB: TStringField;
    CdsProdutosFiscoICMS_ATAC_PE: TStringField;
    CdsProdutosFiscoICMS_INDU_PE: TStringField;
    CdsProdutosFiscoICMS_ATAC_PI: TStringField;
    CdsProdutosFiscoICMS_INDU_PI: TStringField;
    CdsProdutosFiscoICMS_ATAC_PR: TStringField;
    CdsProdutosFiscoICMS_INDU_PR: TStringField;
    CdsProdutosFiscoICMS_ATAC_RJ: TStringField;
    CdsProdutosFiscoICMS_INDU_RJ: TStringField;
    CdsProdutosFiscoICMS_ATAC_RN: TStringField;
    CdsProdutosFiscoICMS_INDU_RN: TStringField;
    CdsProdutosFiscoICMS_ATAC_RO: TStringField;
    CdsProdutosFiscoICMS_INDU_RO: TStringField;
    CdsProdutosFiscoICMS_ATAC_RR: TStringField;
    CdsProdutosFiscoICMS_INDU_RR: TStringField;
    CdsProdutosFiscoICMS_ATAC_RS: TStringField;
    CdsProdutosFiscoICMS_INDU_RS: TStringField;
    CdsProdutosFiscoICMS_ATAC_SC: TStringField;
    CdsProdutosFiscoICMS_INDU_SC: TStringField;
    CdsProdutosFiscoICMS_ATAC_SE: TStringField;
    CdsProdutosFiscoICMS_INDU_SE: TStringField;
    CdsProdutosFiscoICMS_ATAC_SP: TStringField;
    CdsProdutosFiscoICMS_INDU_SP: TStringField;
    CdsProdutosFiscoICMS_ATAC_TO: TStringField;
    CdsProdutosFiscoICMS_INDU_TO: TStringField;
    CdsProdutosFiscoPIS_SITUACAO: TStringField;
    CdsProdutosFiscoCOFINS_SITUACAO: TStringField;
    CdsProdutosFiscoDT_ATUALIZACAO_FARMAX: TDateField;
    CdsProdutosLotesST: TClientDataSet;
    SqlProdutosCompostos: TSQLDataSet;
    DspProdutosCompostos: TDataSetProvider;
    CdsProdutosCompostos: TClientDataSet;
    CdsProdutosCompostosID_PRODUTO_PRINCIPAL: TFloatField;
    CdsProdutosCompostosID_PRODUTO_COMPOSICAO: TFloatField;
    CdsProdutosCompostosDESCRICAO: TStringField;
    CdsProdutosCompostosQUANTIDADE: TFloatField;
    CdsProdutosCompostosENVIADO: TStringField;
    CdsLotes: TClientDataSet;
    CdsCliente: TClientDataSet;
    CdsCadFin: TClientDataSet;
    CdsProdutosFiscoCODIGOANP: TStringField;
    CdsProdutosFiscoSUBLIMITEICMS: TFMTBCDField;
    CdsProdutosFiscoSUBLIMITEFCP: TFMTBCDField;
    CdsProdutosFiscoSUBLIMITECST: TStringField;
    CdsProdutosFiscoCODBENEFICIO: TStringField;
    CdsProdutosFiscoDESONERACAOMOTIVO: TStringField;
    CdsProdutosFiscoDESONERACAOICMS: TFMTBCDField;
    CdsProdutosFiscoDESONERACAOFCP: TFMTBCDField;
    CdsPrecosCOMPOSTO: TStringField;
    CdsItensCompraCODIGOBENEFICIO: TStringField;
    CdsItensCompraMOTIVODESONERACAO: TStringField;
    CdsItensCompraVALORDESONERACAO: TFMTBCDField;
    CdsItensCompraPERCENTUALDESONERACAO: TFMTBCDField;
    SqlConvenios_Grupos: TSQLDataSet;
    DspConvenios_Grupos: TDataSetProvider;
    CdsConvenios_Grupos: TClientDataSet;
    CdsConvenios_GruposCD_CONVENIO: TFloatField;
    CdsConvenios_GruposCD_GRUPO: TFloatField;
    CdsConvenios_GruposDESCRICAO: TStringField;
    CdsConvenios_GruposDESCONTO: TFloatField;
    CdsConveniosPAGAAVISTA: TStringField;
    CdsConveniosCD_MUNICIPIO: TStringField;
    CdsConveniosCD_PAIS: TStringField;
    CdsConveniosCOMPLEMENTO: TStringField;
    CdsConveniosNUMERO: TStringField;
    CdsConveniosFATURAFECHADA: TStringField;
    CdsConveniosEXIBIRDADOSCLIENTECOMPROVANTE: TStringField;
    CdsPrecosOBSERVACAO: TStringField;
    CdsIncluiProdutosOBSERVACAO: TStringField;
    CdsDistribuidoresCONCLUSAONFSEMBOLETO: TStringField;
    CdsDistribuidoresTAXABOLETO: TFMTBCDField;
    SqlComprasBoletos: TSQLDataSet;
    DspComprasBoletos: TDataSetProvider;
    CdsComprasBoletos: TClientDataSet;
    CdsComprasBoletosCD_COMPRAS: TFloatField;
    CdsComprasBoletosCD_BOLETO: TFloatField;
    CdsComprasBoletosNUMERO: TStringField;
    CdsComprasBoletosVENCIMENTO: TDateField;
    CdsComprasBoletosJUROS: TFMTBCDField;
    CdsComprasBoletosDEDUCOES: TFMTBCDField;
    CdsComprasBoletosDESPESASFINANCEIRAS: TFMTBCDField;
    CdsComprasBoletosVALOR: TFMTBCDField;
    CdsRecebeComprasBoletos: TClientDataSet;
    SqlContasPagarCompras: TSQLDataSet;
    DspContasPagarCompras: TDataSetProvider;
    CdsContasPagarCompras: TClientDataSet;
    CdsContasPagarComprasCD_FILIAL: TFloatField;
    CdsContasPagarComprasCD_CONTAS_PAGAR: TFloatField;
    CdsContasPagarComprasCD_COMPRAS: TFloatField;
    CdsContasPagarComprasDT_EMISSAO: TDateField;
    CdsContasPagarComprasNOTA_FISCAL: TStringField;
    CdsContasPagarComprasVALOR: TFMTBCDField;
    CdsContasPagar_Compras: TClientDataSet;
    CdsFiliaisIFOOD_CLIENT_ID: TStringField;
    CdsFiliaisIFOOD_CLIENT_SECRET: TStringField;
    CdsFiliaisIFOOD_ID_LOJA: TStringField;
    CdsFiliaisIFOOD_PRECO_PRATICADO: TStringField;
    CdsFiliaisIFOOD_QNTD_ENVIO: TIntegerField;
    CdsFiliaisIFOOD_VENDEDOR: TIntegerField;
    CdsFiliaisFARMACIASAPP_CLIENT_ID: TStringField;
    CdsFiliaisFARMACIASAPP_CLIENT_SECRET: TStringField;
    CdsFiliaisFARMACIASAPP_ID_LOJA: TStringField;
    CdsFiliaisFARMACIASAPP_PRECO_PRATICADO: TStringField;
    CdsFiliaisFARMACIASAPP_QNTD_ENVIO: TIntegerField;
    CdsFiliaisFARMACIASAPP_VENDEDOR: TIntegerField;
    SqlConveniosPBM: TSQLDataSet;
    DspConveniosPBM: TDataSetProvider;
    CdsConveniosPBM: TClientDataSet;
    CdsConveniosPBMID_CONVENIOPBM: TFloatField;
    CdsConveniosPBMNOME: TStringField;
    CdsConveniosPBMURL: TStringField;
    CdsConveniosPBMENVIADO: TStringField;
    SqlProdutosConveniosPBM: TSQLDataSet;
    DspProdutosConveniosPBM: TDataSetProvider;
    CdsProdutosConveniosPBM: TClientDataSet;
    CdsProdutosConveniosPBMID_PRODUTOSCONVENIOPBM: TFloatField;
    CdsProdutosConveniosPBMID_CONVENIOPBM: TFloatField;
    CdsProdutosConveniosPBMID_PRODUTO: TFloatField;
    CdsProdutosConveniosPBMENVIADO: TStringField;
    Dsp1: TDataSetProvider;
    Cds1: TClientDataSet;
    CdsTransferENVIADO: TStringField;
    CdsTransferCD_VENDEDOR: TFloatField;
    SqlUsuariosGrupos: TSQLDataSet;
    DspUsuariosGrupos: TDataSetProvider;
    CdsUsuariosGrupos: TClientDataSet;
    CdsUsuariosGruposCD_USUARIO: TFloatField;
    CdsUsuariosGruposCD_FILIAL: TFloatField;
    CdsUsuariosGruposCD_GRUPO: TFloatField;
    CdsUsuariosGruposTX_DESCONTO_MAXIMO: TFMTBCDField;
    CdsUsuariosGruposENVIADO: TStringField;
    CdsContas_ReceberTRNAUTORIZACAO: TStringField;
    CdsContas_ReceberTEFAUTORIZACAO: TStringField;
    CdsVendasItensExcluidos: TClientDataSet;
    SqlProdutosBarras: TSQLDataSet;
    DspProdutosBarras: TDataSetProvider;
    CdsProdutosBarras: TClientDataSet;
    CdsProdutosBarrasID_PRODUTO: TFloatField;
    CdsProdutosBarrasCODIGO_BARRAS: TStringField;
    CdsProdutosBarrasQT_EMBALAGEM: TFloatField;
    CdsProdutosBarrasBARRA_ANTIGA: TStringField;
    function  Processa(Identificador: Integer; Filial : Integer; Cds: Variant): Variant; stdcall;
    function  RetornaID(Campo: String): Extended;
    procedure GeraLogInterligacao(Filial : Integer; N_ITENS, N_UNIDADES, T_CUSTO, T_VENDA, T_PROMOCAO : Real;
                      CLASSES, GRUPOS, LABORATORIOS, DISTRIBUIDORES, FAMILIAS, GRUPOSBALANCO,
                      GRUPOSCOMPRAS, CARTOES, LANCAMENTOS, CAIXAS, CONTASRECEBER : Real );
    procedure SQLConnection1BeforeConnect(Sender: TObject);
    procedure SoapDataModuleCreate(Sender: TObject);
    procedure AbreTransacao;
    procedure ConfirmaTransacao;
    procedure CancelaTransacao;
    procedure GravaLog(Texto : String);
    procedure GravaLogFarmaSoft(Texto : String);
    procedure GravaLogAcesso(Texto : String);
    procedure GravaLogRefresher(cMensagem: string);
    procedure MontaSQL_Precos(Filial : String);
    procedure CriaCamposPrecos(sFilial : String);
    function StrZero(Num : Real ; Zeros, Deci: integer): string;
    function Alltrim(Text : string) : string;

    procedure TrataRetornoSMS(Retorno : String);
    function  EnviaSMS(Telefone, Mensagem : String) : Boolean;
    procedure SoapDataModuleDestroy(Sender: TObject);

    procedure FecharTodosDataSets;

  private

  public
    procedure VerificaRefresher;
    procedure ApagaProcessos(sPrograma: string);

  end;


Procedure FecharDataSet(Cds : TClientDataSet);
function Crypt(Action, Src: String): String;

var
  Log, Importer : TextFile;
  Caminho : String;
  TD : TTransactionDesc;
  StrFilial : String;
  CaminhoBanco : TIniFile;
  Senha : String;
  Dias : String;
  Reenvia : Boolean;

implementation

uses UWm;

{$R *.DFM}


procedure TDm.TrataRetornoSMS(Retorno : String);
var
 iRetorno : Integer;
 Mensagem : String;
begin
  Mensagem := '';
  if (Retorno = 'X01') or (Retorno = 'X02') then
     Mensagem := 'Parâmetros com Erro'
  else
   begin
     iRetorno := StrtoInt(Retorno);
     Mensagem := 'Erro de envio de SMS - ';
     case iRetorno of
        0  : Mensagem := '';
        1  : Mensagem := Mensagem + 'Credencial inválida.';
        5  : Mensagem := Mensagem + 'Número de Telefone fora do formato:Formato +999(9999)99999999.';
        7  : Mensagem := Mensagem + '"SEND_PROJECT" tem que ser S ou N.';
        8  : Mensagem := Mensagem + 'Mensagem maior que 142 caracteres.';
        9  : Mensagem := Mensagem + 'Sem crédito para envio de SMS. Favor repor.';
        10 : Mensagem := Mensagem + 'Gateway bloqueado.';
        12 : Mensagem := Mensagem + 'Número de Telefone no formato padrão, mas incorreto.';
        13 : Mensagem := Mensagem + 'Mensagem vazia ou corpo inválido.';
        15 : Mensagem := Mensagem + 'País sem operação.';
        16 : Mensagem := Mensagem + 'Número de Telefone com tamanho do código de área inválido.';
        17 : Mensagem := Mensagem + 'Operadora não autorizada para esta credencial.';
        800..899 : Mensagem := Mensagem + 'Falha no gateway "Mobile Pronto". Contate o suporte "Farmax".';
        900 : Mensagem := Mensagem + 'Erro de autenticação ou limite de segurança excedido.';
        901..999 : Mensagem := Mensagem + 'Erro no acesso as operadoras.';
     end;
   end;
  if Mensagem <> '' then
     GravaLog(Mensagem);
end;

Function StrTran( cString, cProcura, cTroca : string ): string;
Var posatu, posAtuAnt : integer;
Begin
   cTroca := LowerCase(cTroca);
   posatu := Pos( cProcura, cString );
   While PosAtu <> 0 do Begin
       PosAtuAnt := PosAtu + Length( cTroca );
       Try
       Delete( cString, PosAtu, Length(cProcura) );
       Insert( cTroca, cString, PosAtu );
       Finally
       PosAtu := Pos( cProcura, cString );
       End;
       if PosAtu < PosAtuAnt then Break;
   End;
   result := cString
End;


function TDm.EnviaSMS(Telefone, Mensagem : String) : Boolean;
var
 IdHttp1 : TIdHttp;
 sRet: String;
 sHttp: String;
 sParametros: String;
 sUrl: String;
 Retorno : TStringList;
begin
  IdHttp1 := TIdHTTP.Create(nil);
  IdHTTP1.Socket.Host := 'http://mpgateway.com';
  sHttp := 'http://mpgateway.com/v_2_00/smspush/enviasms.aspx?' ;
  IdHTTP1.Socket.Port := 80;
  Mensagem := StrTran(Mensagem, ' ', '%20');
  Telefone := Trim(Telefone);
  sParametros := 'Credencial=CCF9DC8A695E58ED8698E24229F3B939303EF380&Principal_User=FARMAX&Aux_User=F1&Mobile=55' + Telefone + '&Send_Project=S&Message=' + Mensagem ;
  sUrl := sHttp + sParametros;

  Retorno := TStringList.Create;
  Retorno.Text := IdHTTP1.Get (sUrl);
  TrataRetornoSMS(Trim(Retorno.Text));
  Retorno.Free;
end;


function Crypt(Action, Src: String): String;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Exit;
  end;
  Key :=
'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToIntDef('$'+ copy(Src,1,2),0);
    SrcPos := 3;
  repeat
    SrcAsc := StrToIntDef('$'+ copy(Src,SrcPos,2),0);
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
end;


procedure TDmCreateInstance(out obj: TObject);

begin
 obj := TDm.Create(nil);
end;

{ TDm }

procedure TDm.GeraLogInterligacao(Filial : Integer; N_ITENS, N_UNIDADES, T_CUSTO, T_VENDA, T_PROMOCAO : Real;
                                  CLASSES, GRUPOS, LABORATORIOS, DISTRIBUIDORES, FAMILIAS, GRUPOSBALANCO,
                                  GRUPOSCOMPRAS, CARTOES, LANCAMENTOS, CAIXAS, CONTASRECEBER : Real );
begin
  AbreTransacao;
  CdsLog.Open;
  CdsLog.Append;
  CdsLogID_LOG.AsFloat        := RetornaID('ID_LOG');
  CdsLogCD_FILIAL.AsInteger   := Filial;
  CdsLogDATA.AsDateTime       := Date;
  CdsLogHORA.AsDateTime       := Time;
  CdsLogCHAVE_ACESSO.AsString := '';
  CdsLogIP.AsString           := '';
  CdsLogNUMERO_ITENS.AsFloat  := N_ITENS;
  CdsLogNUMERO_UNIDADES.AsFloat := N_UNIDADES;
  CdsLogTOTAL_CUSTO.AsFloat   := T_CUSTO;
  CdsLogTOTAL_VENDA.AsFloat   := T_VENDA;
  CdsLogTOTAL_PROMOCAO.AsFloat := T_PROMOCAO;
  CdsLogCLASSES.AsFloat       := CLASSES;
  CdsLogGRUPOS.AsFloat        := GRUPOS;
  CdsLogLABORATORIOS.AsFloat  := LABORATORIOS;
  CdsLogDISTRIBUIDORES.AsFloat := DISTRIBUIDORES;
  CdsLogFAMILIAS.AsFloat      := FAMILIAS;
  CdsLogGRUPOSBALANCO.AsFloat := GRUPOSBALANCO;
  CdsLogGRUPOSCOMPRAS.AsFloat := GRUPOSCOMPRAS;
  CdsLogCARTOES.AsFloat       := CARTOES;
  CdsLogLANCAMENTOS.AsFloat   := LANCAMENTOS;
  CdsLogCAIXAS.AsFloat        := CAIXAS;
  CdsLogCONTASRECEBER.AsFloat := CONTASRECEBER; 
  CdsLog.Post;
  Try
    CdsLog.ApplyUpdates(0);
    ConfirmaTransacao;
  Except
    CancelaTransacao;
  End;
end;


function TDm.Processa(Identificador: Integer; Filial : Integer; Cds: Variant): Variant; stdcall;
var i : integer;
    Sql : String;
    Campo : TField;
    Rec : TSearchRec;
    Lista : TStrings;
    Posicao : Integer;
    DataInicial, DataFinal : String;
    GeraTemp : Boolean;
    Dados, Id_Cliente, Maquina, Usuario, Versao, CNPJ, Razao, Telefone : String;
begin
  //StrFilial := StrZero(Filial, 4,0);  // InttoStr(Filial); //alterado GML 20230516
  StrFilial := InttoStr(Filial); //StrZero(Filial, 4,0);  // InttoStr(Filial); //alterado GML 20230516 // FML - 21.06.2023

  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Importacao') then
     CreateDir(ExtractFilePath(Application.ExeName)+'Importacao');
  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Logs') then
     CreateDir(ExtractFilePath(Application.ExeName)+'Logs');

  Lista := TStringList.Create;
  if FindFirst(ExtractFilePath(Application.ExeName)+'Importacao\*.*', faAnyFile, Rec) = 0 then
   begin
    repeat
      Lista.Add(Rec.Name);
    until FindNext(Rec) <> 0;
   end;

  //comentado para que essa condicao permita a conexao quando nao envolver o envio de dados da filial para a aMatriz
  //esta condicao foi colocada junto a cada processo.
  if Lista.Count > 2000 then
   begin
     ApagaProcessos('FarmaxRefr');
     GravaLog('Arquivos pendentes para Refresher ------- Refresher derrubado.');
     GravaLog(InttoStr(Lista.Count) + ' arquivos pendentes para Refresher.');
     Result := 'FALHA';
     Exit;
   end;


  //VerificaRefresher;


  if Identificador = 0 then
   begin
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 0 - LogInterligacao');

     Result := 'True';
     CdsControlador.Data := Cds;
     //CdsControlador.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ControleValores_' + FloatToStr(Filial) + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Inicio de GeraLogInterligacao ');
     GeraLogInterligacao(Filial, CdsControladorN_Itens.AsFloat, CdsControladorN_Unidades.AsFloat,
                         CdsControladorT_Custo.AsFloat, CdsControladorT_Venda.AsFloat, CdsControladorT_Promocao.AsFloat,
                         CdsControladorCLASSES.AsFloat, CdsControladorGRUPOS.AsFloat,
                         CdsControladorLABORATORIOS.AsFloat, CdsControladorDISTRIBUIDORES.AsFloat,
                         CdsControladorFAMILIAS.AsFloat, CdsControladorGRUPOSBALANCO.AsFloat,
                         CdsControladorGRUPOSCOMPRAS.AsFloat, CdsControladorCARTOES.AsFloat,
                         CdsControladorLANCAMENTOS.AsFloat, CdsControladorCAIXAS.AsFloat, CdsControladorCONTASRECEBER.AsFloat);
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Final de GeraLogInterligacao ');
   end
  else


  //Recebe Lancamentos
  if (Identificador = 1) and (Lista.Count < 2000) then
   begin
      Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1 - Lancamentos');
          // Lancamentos
          Result := 'True';
          CdsLotes.Data := Cds;
          CdsLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Lancamentos_'+ strFilial + '_' +FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
          if CdsLotes.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1 - Lancamentos Recebidos: ' + FloatToStr(CdsLotes.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Lancamentos - '+ E.Message);
            CdsLotes.Close;
            Result := 'False';
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
 else

 //Recebe Caixa
 if (Identificador = 2) and (Lista.Count < 2000) then
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2 - Caixa');
          //CECAIXA
          Result := 'True';
          CdsCaixa.Data := Cds;
          CdsCaixa.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Caixa_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
          if CdsCaixa.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2 - Lancamentos de Caixa Recebidos: ' + FloatToStr(CdsCaixa.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Caixa - '+ E.Message);
            Result := 'False';
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Contas a Receber
  if (Identificador = 3) and (Lista.Count < 2000) then     //gml 23.04.2014
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 3 - Contas a Receber');

          //CECADFIN
          Result := 'True';
          CdsCadFin.Data := Cds;
          CdsCadFin.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Contas_Receber_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
          if CdsCadfin.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 3 - Contas a Receber Recebidos: ' + FloatToStr(CdsCadfin.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Contas a Receber - '+ E.Message);
            Result := null;
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Compras
  if (Identificador = 4) and (Lista.Count < 2000) then
   begin
      Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 4 - Compras');
          //CEPEDID1
          Result := 'True';
          CdsPedid1.Data := Cds;
          CdsPedid1.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Compras_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
          if CdsPedid1.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 4 - Pedidos de Compra Recebidos: ' + FloatToStr(CdsPedid1.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Compras - '+ E.Message);
            Result := null;
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Itens Compras
  if (Identificador = 5) and (Lista.Count < 2000) then
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 5 - ItensCompra');
          //CEPEDIDO
          Result := 'True';
          CdsPedido.Data := Cds;
          CdsPedido.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Itens_Compra_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
          if CdsPedido.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 5 - Itens de Pedido de Compra Recebidos: ' + FloatToStr(CdsPedido.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Itens Compras - '+ E.Message);
            Result := null;
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Contas a Pagar
  if (Identificador = 6) and (Lista.Count < 2000) then
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 6 - Contas a Pagar');
          //CEDUPLIC
          Result := 'True';
          CdsDuplic.Data := Cds;
          CdsDuplic.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Contas_Pagar_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
          if CdsDuplic.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 6 - Contas a Pagar Recebidos: ' + FloatToStr(CdsDuplic.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Contas a Pagar - '+ E.Message);
            Result := null;
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Estoque de Produtos
  if (Identificador = 7) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 7 - Estoque');
         //CEPRODUT
         Result := 'True';
         CdsProdut.Data := Cds;
         //Sleep(1000);
         CdsProdut.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Produtos_' + StrZero(Filial,2,0) + '_' + FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
         if CdsProdut.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 7 - Estoque de Produtos Recebidos: ' + FloatToStr(CdsProdut.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Estoques de Produtos - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Operadores de Caixa
  if (Identificador = 8) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 8  - Operadores de Caixa');
         //Operadores de Caixa
         Result := 'True';
         CdsOperadores.Data := Cds;
         CdsOperadores.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Operadores_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsOperadores.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 8 - Operadores de Caixa Recebidos: ' + FloatToStr(CdsOperadores.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Operadores de Caixa - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Entregas
  if (Identificador = 9) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 9 - Entregas');
         //Entregas
         Result := 'True';
         CdsEntregas.Data := Cds;
         CdsEntregas.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Entregas_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsEntregas.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 9 - Entregas Recebidas: ' + FloatToStr(CdsEntregas.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Entregas - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Cheques
  if (Identificador = 10) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10 - Cheques');
         //Cheques
         Result := 'True';
         CdsCheques.Data := Cds;
         CdsCheques.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Cheques_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCheques.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10 - Cheques Recebidos: ' + FloatToStr(CdsCheques.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Cheques - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Transfer
  if (Identificador = 11) and (Lista.Count < 2000) then
   begin
     Try
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 11 - Transferencias');
         //Transfer
         Result := 'True';
         CdsCeTransfer.Data := Cds;
         CdsCeTransfer.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Transfer_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCeTransfer.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 11 - Transferencias Recebidas: ' + FloatToStr(CdsCeTransfer.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Transfer - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe ItensTransfer
  if (Identificador = 12) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 12 - Itens das Transferencias');
         //ItensTransfer
         Result := 'True';
         CdsCeItensTransfer.Data := Cds;
         CdsCeItensTransfer.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ItensTransfer_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCeItensTransfer.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 12 - Itens de Transferencia Recebidos: ' + FloatToStr(CdsCeItensTransfer.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de ItensTransfer - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Caderno Faltas
  if (Identificador = 13) and (Lista.Count < 2000) then
   begin
     Try
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 13 - Caderno de Faltas');
         //Caderno Faltas
         Result := 'True';
         CdsCadernoFaltas.Data := Cds;
         CdsCadernoFaltas.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\CadernoFaltas_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCadernoFaltas.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 13 - Itens de CadernoFaltas Recebidos: ' + FloatToStr(CdsCadernoFaltas.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Caderno Faltas - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Clientes
  if (Identificador = 14) and (Lista.Count < 2000) then   //gml 23.04.2014
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 14 - Clientes');
         //Clientes
         Result := 'True';
         CdsCliente.Data := Cds;
         CdsCliente.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Clientes_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
         if CdsCliente.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 14 - Clientes Recebidos: ' + FloatToStr(CdsCliente.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Clientes - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end

  else
  //Recebe CRM
  if (Identificador = 15) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 15 - CRM');
         //Caderno Faltas
         Result := 'True';
         CdsCRM.Data := Cds;
         CdsCRM.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\CRM_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCRM.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 15 - CRM Recebidos: ' + FloatToStr(CdsCRM.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de CRM - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Lancamentos A Prazo
  if (Identificador = 16) and (Lista.Count < 2000) then
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 16 - Lancamentos a Prazo');
          // Lancamentos
          Result := 'True';
          CdsLotes.Data := Cds;
          CdsLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\LancamentosaPrazo_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
          if CdsLotes.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 16 - Lancamentos a Prazo Recebidos: ' + FloatToStr(CdsLotes.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Lancamentos a Prazo - '+ E.Message);
            CdsLotes.Close;
            Result := 'False';
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Compras Boletos
  if (Identificador = 17) and (Lista.Count < 2000) then
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 17 - Compras Boletos');
          // Compras Boletos
          Result := 'True';
          CdsRecebeComprasBoletos.Data := Cds;
          CdsRecebeComprasBoletos.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ComprasBoletos_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
          if CdsRecebeComprasBoletos.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 17 - Compras Boletos : ' + FloatToStr(CdsRecebeComprasBoletos.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Compras Boletos - '+ E.Message);
            CdsRecebeComprasBoletos.Close;
            Result := 'False';
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Vendas para CallCenter
  if (Identificador = 18) and (Lista.Count < 2000) then
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 18 - Vendas para CallCenter');
          // Vendas para CallCenter
          Result := 'True';
          CdsLotes.Data := Cds;
          CdsLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\VendasCallCenter_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
          if CdsLotes.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 18 - Vendas para CallCenter Recebidos: ' + FloatToStr(CdsLotes.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Vendas para CallCenter - '+ E.Message);
            CdsLotes.Close;
            Result := null;
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe VendasFP para CallCenter
  if (Identificador = 19) and (Lista.Count < 2000) then
   begin
      Try
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 19 - VendasFP para CallCenter');
          // Vendas para CallCenter
          Result := 'True';
          CdsLotes.Data := Cds;
          CdsLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\VendasFPCallCenter_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
          if CdsLotes.RecordCount > 0 then
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 19 - VendasFP para CallCenter Recebidos: ' + FloatToStr(CdsLotes.RecordCount));
      Except
         on E:Exception do
          begin
            CancelaTransacao;

            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de VendasFP para CallCenter - '+ E.Message);
            CdsLotes.Close;
            Result := null;
          end;
      End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Codigo de Barras proveniente de Balanço
  if (Identificador = 50) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 50 - Codigo de Barras proveniente de Balanco');
         //Codigo de Barras
         Result := 'True';
         CdsCodigoBarras.Data := Cds;
         CdsCodigoBarras.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\CodigoBarras_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCodigoBarras.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 50 - Codigo de Barras Recebidos: ' + FloatToStr(CdsCodigoBarras.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Codigo de Barras - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Balanços
  if (Identificador = 51) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 51 - Balancos');
         //Balancos Concluidos
         Result := 'True';
         CdsAlteracaoBalancos.Data := Cds;
         CdsAlteracaoBalancos.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\BalancosConcluidos_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsAlteracaoBalancos.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 51 - Balancos Concluidos: ' + FloatToStr(CdsAlteracaoBalancos.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Balanços Concluídos - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Preços da Filial
  if (Identificador = 52) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 52 - Precos da Filial');
         Result := 'True';

         CdsPrecoVendaFilial.Data := Cds;
         CdsPrecoVendaFilial.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\PrecoVendaFilial_'+ StrZero(Filial,2,0) + '_' + FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
         if CdsPrecoVendaFilial.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 52 - Precos Recebidos da Filial: ' + FloatToStr(CdsPrecoVendaFilial.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Preços da Filial - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Compras Deletadas
  if (Identificador = 53) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 53 - Compras Deletadas');
         Result := 'True';
         CdsComprasDeletadas.Data := Cds;
         CdsComprasDeletadas.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ComprasDeletadas_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsComprasDeletadas.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 53 - Compras Deletadas Recebidas: ' + FloatToStr(CdsComprasDeletadas.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Compras Deletadas - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Produtos Totais
  if (Identificador = 54) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 54 - Produtos Totais');
         Result := 'True';
         CdsProdutosTotais.Data := Cds;
         CdsProdutosTotais.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ProdutosTotais_' + StrZero(Filial,2,0) + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsProdutosTotais.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 54 - Produto Totais da Filial ' + StrFilial + ' : ' + InttoStr(CdsProdutosTotais.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Totais - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Usuarios
  if (Identificador = 55) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 55 - Usuarios');
         //Usuarios
         Result := 'True';
         CdsUsu.Data := Cds;
         CdsUsu.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\Usuarios_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsUsu.RecordCount >  0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 55 - Usuarios Recebidos: ' + FloatToStr(CdsUsu.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Usuarios - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe SintegraNotas
  if (Identificador = 56) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 56 - Sintegra Notas');
         //Sintegra Notas
         Result := null;
         // Comentado FML - 08/12/2015
         {Result := 'True';
         CdsSintegraNotas.Data := Cds;
         CdsSintegraNotas.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\SintegraNotas_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsSintegraNotas.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 56 - Sintegra Notas Recebidos: ' + FloatToStr(CdsSintegraNotas.RecordCount));}
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Sintegra Notas - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe SintegraItensNotas
  if (Identificador = 57) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 57 - Sintegra Itens Notas');
         //Sintegra Notas Itens
         Result := null;
         // Comentado FML - 08/12/2015
         {Result := 'True';
         CdsSintegraNotasItens.Data := Cds;
         CdsSintegraNotasItens.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\SintegraItensNotas_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsSintegraNotasItens.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 57 - Sintegra Notas Itens Recebidos: ' + FloatToStr(CdsSintegraNotasItens.RecordCount));}
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Sintegra Notas Itens - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe SintegraPedidosItens
  if (Identificador = 58) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 58 - Sintegra Pedidos Itens');
         //Sintegra Notas Pedidos
         Result := null;
         // Comentado FML - 08/12/2015
         {Result := 'True';
         CdsSintegraPedidos.Data := Cds;
         CdsSintegraPedidos.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\SintegraPedidos_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsSintegraPedidos.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 58 - Sintegra Pedidos Recebidos: ' + FloatToStr(CdsSintegraPedidos.RecordCount));}
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Sintegra Pedidos - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe SintegraR60 (Reducoes)
  if (Identificador = 59) and (Lista.Count < 2000) then
   begin
     Try
        GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 59 - SintegraR60');
         //Sintegra R60
         Result := null;
         // Comentado FML - 08/12/2015
         {Result := 'True';
         CdsSintegraR60.Data := Cds;
         CdsSintegraR60.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\SintegraR60_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsSintegraR60.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 59 - Sintegra R60 Recebidos: ' + FloatToStr(CdsSintegraR60.RecordCount));}
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Sintegra R60 - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe SintegraR60I (Vendas)
  if (Identificador = 60) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 60 - SintegraR60I');
         //Sintegra R60
         Result := null;
         // Comentado FML - 08/12/2015
         {Result := 'True';
         CdsSintegraR60I.Data := Cds;
         CdsSintegraR60I.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\SintegraIR60_'+ strFilial + '_'+FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsSintegraR60I.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 60 - Sintegra R60I Recebidos: ' + FloatToStr(CdsSintegraR60I.RecordCount));}
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Sintegra R60I - '+ E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Contas a Pagar Deletadas
  if (Identificador = 61) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 61 - Contas a Pagar Deletadas');
         Result := 'True';
         CdsComprasDeletadas.Data := Cds;
         CdsComprasDeletadas.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ContasPagarDeletadas_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsComprasDeletadas.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 61 - Contas a Pagar Deletadas Recebidas: ' + FloatToStr(CdsComprasDeletadas.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Contas a Pagar Deletadas - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Clientes Deletados
  if (Identificador = 62) and (Lista.Count < 2000) then  //gml 23.04.2014
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 62 - Clientes Deletados');
         Result := 'True';
         CdsClientesDeletados.Data := Cds;
         CdsClientesDeletados.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ClientesDeletados_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsClientesDeletados.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 62 - Clientes Deletados Recebidos: ' + FloatTostr(CdsClientesDeletados.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Clientes Deletados - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Posicao Estoque
  if (Identificador = 63) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 63 - Posicao Estoque');
         Result := 'True';
         CdsPosicaoEstoque.Data := Cds;
         CdsPosicaoEstoque.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\PosicaoEstoque_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
         if CdsPosicaoEstoque.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 63 - Posicao de Estoque Recebidos: ' + FloatToStr(CdsPosicaoEstoque.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Posicao Estoque - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Contas a Receber Deletados
  if (Identificador = 64) and (Lista.Count < 2000) then   //gml 23.04.2014
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 64 - Contas a Receber Deletadas');
         Result := 'True';
         CdsCrDeletados.Data := Cds;
         CdsCrDeletados.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ContasReceberDeletados_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
         if CdsCrDeletados.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 64 - Contas Receber Deletados Recebidos: ' + FloatToStr(CdsCrDeletados.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Contas Receber Deletados - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Sintegra_NF_Entrada Deletados
  if (Identificador = 65) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 65 - Sintegra Notas Deletadas');
         Result := null;
         // Comentado FML - 08/12/2015
         {Result := 'True';
         CdsCrDeletados.Data := Cds;
         CdsCrDeletados.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\SintegraNFEntradaDeletados_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCrDeletados.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 65 - SintegraNFEntrada Deletados Recebidos: ' + FloatToStr(CdsCrDeletados.RecordCount));}
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de SintegraNFEntrada Deletados - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Produtos Lotes
  if (Identificador = 66) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 66 - Produtos Lotas');
         Result := 'True';
         CdsProdutosLotes.Data := Cds;
         CdsProdutosLotes.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ProdutosLotes_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
         If CdsProdutosLotes.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 66 - Produtos Lotes Recebidos: ' + FloatToStr(CdsProdutosLotes.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Lotes - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Conferencia Nota
  if (Identificador = 67) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 67 - Conferencia Nota');
         Result := 'True';
         CdsConferenciaNota.Data := Cds;
         CdsConferenciaNota.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ConferenciaNota_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsConferenciaNota.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 67 - Conferencias Notas Recebidas: ' + FloatToStr(CdsConferenciaNota.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia Nota - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Lotes Itens Compras
  if (Identificador = 68) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 68 - Itens Compras Lotes');
         Result := 'True';
         CdsLotesCompra.Data := Cds;
         CdsLotesCompra.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\LotesItensCompras_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsLotesCompra.RecordCount >  0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 68 - Lotes Itens Compras Recebidos: ' + FloatTostr(CdsLotesCompra.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Lotes Itens Compras - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Recebe Caixas Deletados
  if (Identificador = 69) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 69 - Caixas Deletados');
         Result := 'True';
         CdsCaixasDeletados.Data := Cds;
         CdsCaixasDeletados.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\CaixasDeletados_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsCaixasDeletados.RecordCount > 0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 69 - Caixas Deletados Recebidos: ' + FloatTostr(CdsCaixasDeletados.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Caixas Deletados - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

    //Recebe Produtos Lotes ST
  if (Identificador = 70) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 70 - Produtos Lotes ST');
         Result := 'True';
         CdsProdutosLotesST.Data := Cds;
         CdsProdutosLotesST.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ProdutosLotesST_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmsszzz',Now)+'.xml', dfXML);
         if CdsProdutosLotesST.RecordCount >  0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 70 - Produtos Lotes ST Recebidos: ' + FloatTostr(CdsProdutosLotesST.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Lotes ST - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

    //Recebe ContasPagarCompras
  if (Identificador = 71) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 71 - ContasPagarCompras');
         Result := 'True';
         CdsContasPagar_Compras.Data := Cds;
         CdsContasPagar_Compras.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ContasPagarCompras_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsContasPagar_Compras.RecordCount >  0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 71 - ContasPagarCompras Recebidos: ' + FloatTostr(CdsContasPagar_Compras.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de ContasPagarCompras - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

    //Recebe VendasItensExcluidos
  if (Identificador = 72) and (Lista.Count < 2000) then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 72 - VendasItensExcluidos');
         Result := 'True';
         CdsVendasItensExcluidos.Data := Cds;
         CdsVendasItensExcluidos.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\VendasItensExcluidos_'+ strFilial + '_' + FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);
         if CdsVendasItensExcluidos.RecordCount >  0 then
           GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 72 - VendasItensExcluidos Recebidos: ' + FloatTostr(CdsVendasItensExcluidos.RecordCount));
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de VendasItensExcluidos - ' + E.Message);
            Result := null;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////// Inicia Processamento dos Envios ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  //Envia Grupos
  if Identificador = 100 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 100 - Grupos');

       AbreTransacao;
       CdsGrupos.Params[0].AsFloat := Filial;
       CdsGrupos.Open;
       ConfirmaTransacao;
       if CdsGrupos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 100 - Enviando Grupos: ' + FloatToStr(CdsGrupos.RecordCount));
       if CdsGrupos.RecordCount = 0 then
          Result := Null
       else
          Result := CdsGrupos.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 100';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Grupos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Laboratorios
  if Identificador = 101 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 101 - Laboratorios');

       AbreTransacao;
       CdsLaboratorios.Params[0].AsFloat := Filial;
       CdsLaboratorios.Open;
       ConfirmaTransacao;
       if CdsLaboratorios.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 101 - Enviando Laboratorios: ' + FloatToStr(CdsLaboratorios.RecordCount));
       if CdsLaboratorios.RecordCount = 0 then
          Result := Null
       else
          Result := CdsLaboratorios.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 101';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Laboratorios - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia FiliaisGrupos
  if Identificador = 102 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 102 - FiliaisGrupos');

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER FILIAIS_GRUPOS_BIU0 INACTIVE';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'UPDATE FILIAIS_GRUPOS SET ENVIADO = ''' + '9' + '''' +
                           'WHERE CD_FILIAL = ' + strFilial + ' AND ((ENVIADO IS NULL) OR (ENVIADO <> '''+ '2' + '''))';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsFiliaisGrupos.Close;
       AbreTransacao;
       CdsFiliaisGrupos.Params[0].AsFloat := Filial;
       CdsFiliaisGrupos.Open;
       ConfirmaTransacao;
       if CdsFiliaisGrupos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 102 - Enviando FiliaisGrupos: ' + FloatToStr(CdsFiliaisGrupos.RecordCount));
       if CdsFiliaisGrupos.RecordCount = 0 then
          Result := Null
       else
         Result := CdsFiliaisGrupos.Data;

       AbreTransacao;
       Sql1.CommandText := 'UPDATE FILIAIS_GRUPOS SET ENVIADO = ''' + '2' + '''' +
                           'WHERE CD_FILIAL = ' + strFilial + ' AND ENVIADO = '''+ '9' + '''';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER FILIAIS_GRUPOS_BIU0 ACTIVE';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de FiliaisGrupos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Produtos Incluidos
  if Identificador = 103 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 103 - Produtos Incluidos');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 300 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 103';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       CdsIncluiProdutos.Close;
       CdsIncluiProdutos.Params[0].AsFloat := Filial;
       CdsIncluiProdutos.Open;
       ConfirmaTransacao;
       if CdsIncluiProdutos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 103 - Enviando Produtos Novos: ' + FloatToStr(CdsIncluiProdutos.RecordCount));
       if CdsIncluiProdutos.RecordCount = 0 then
          Result := Null
       else
          Result := CdsIncluiProdutos.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 103 AND ' +
                           ' ID_PRODUTO IN ( SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 103 )';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 103';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 103)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 103';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Incluidos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Vendedores
  if Identificador = 104 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 104 - Vendedores');

       AbreTransacao;
       CdsVendedores.Open;
       ConfirmaTransacao;
       if CdsVendedores.RecordCount > 0 then
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 104 - Enviando Vendedores: ' + FloatToStr(CdsVendedores.RecordCount));
       if CdsVendedores.RecordCount = 0 then
          Result := Null
       else
       Result := CdsVendedores.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Vendedores - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Compras
  if Identificador = 105 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 105 - Compras');

       Try
         Sql1.CommandText := 'UPDATE TEMP_COMPRAS SET ENVIADO = ''' + '9' + ''' WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = ''' + '4' + ''' AND ENVIADO <> ''' + '2' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       CdsCompras.Close;
       CdsCompras.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsCompras.Open;
       ConfirmaTransacao;
       if CdsCompras.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 105 - Enviando Compras: ' + FloatToStr(CdsCompras.RecordCount));
       if CdsCompras.RecordCount = 0 then
          Result := Null
       else
          Result := CdsCompras.Data;

       Try
         Sql1.CommandText := 'DELETE FROM TEMP_COMPRAS WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = ''' + '4' + ''' AND ENVIADO = ''' + '9' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Compras - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Itens Compras
  if Identificador = 106 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 106 - Itens Compras');

       Try
         Sql1.CommandText := 'UPDATE TEMP_COMPRAS SET ENVIADO = ''' + '9' + ''' WHERE PROCESSO = ''' + '5' + ''' AND CD_FILIAL = ' + strFilial + ' AND ENVIADO <> ''' + '2' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       CdsItensCompra.Close;
       CdsItensCompra.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsItensCompra.Open;
       ConfirmaTransacao;
       if CdsItensCompra.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 106 - Enviando Itens Compra: ' + FloatToStr(CdsItensCompra.RecordCount));
       if CdsItensCompra.RecordCount = 0 then
          Result := Null
       else
       Result := CdsItensCompra.Data;

       Try
         Sql1.CommandText := 'DELETE FROM TEMP_COMPRAS WHERE PROCESSO = ''' + '5' + ''' AND CD_FILIAL = ' + strFilial + ' AND ENVIADO = ''' + '9' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Itens Compras - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia ConveniosPBM
  if Identificador = 107 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 107 - ConveniosPBM');

       Try
         Sql1.CommandText := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ''' + '9' + ''' WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = ''' + '107' + ''' AND ENVIADO <> ''' + '2' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       CdsConveniosPBM.Close;
       CdsConveniosPBM.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsConveniosPBM.Open;
       ConfirmaTransacao;
       if CdsConveniosPBM.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 107 - Enviando ConveniosPBM: ' + FloatToStr(CdsConveniosPBM.RecordCount));
       if CdsConveniosPBM.RecordCount = 0 then
          Result := Null
       else
          Result := CdsConveniosPBM.Data;

       Try
         Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = ''' + '107' + ''' AND ENVIADO = ''' + '9' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de ConveniosPBM - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Registros Deletados
  if Identificador = 108 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 108 - Registros Deletados');

       AbreTransacao;
       Sql1.CommandText := 'UPDATE DELETADOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND TABELA = ' + QuotedStr(Cds) + ' AND CD_FILIAL = ' + StrFilial;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsDeletados.Close;
       CdsDeletados.Params[0].AsFloat := Filial;
       CdsDeletados.Params[1].AsString := Cds;
       AbreTransacao;
       CdsDeletados.Open;
       ConfirmaTransacao;
       if CdsDeletados.RecordCount = 0 then
          Result := Null
       else
        begin
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 108 - Enviando Registros Deletados da Tabela ' + QuotedStr(Cds) + ': ' + FloatToStr(CdsDeletados.RecordCount));
          Result := CdsDeletados.Data;
        end;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM DELETADOS WHERE ENVIADO = ' + QuotedStr('9') + ' AND TABELA = ' + QuotedStr(Cds) + ' AND CD_FILIAL = ' + StrFilial;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Deletados - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Plano de Contas
  if Identificador = 109 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 109 - Plano Contas');

       CdsPlanoContas.Close;
       AbreTransacao;
       CdsPlanoContas.Params[0].AsFloat := Filial;
       CdsPlanoContas.Open;
       ConfirmaTransacao;
       if CdsPlanoContas.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 109 - Enviando Plano de Contas: ' + FloatToStr(CdsPlanoContas.RecordCount));
       if CdsPlanoContas.RecordCount = 0 then
          Result := Null
       else
       Result := CdsPlanoContas.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 109';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Plano de Contas - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Clientes
  if Identificador = 110 then      //gml 23.04.2014
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 110 - Clientes');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 110';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsClientes.Close;
       AbreTransacao;
       CdsClientes.Params[0].AsFloat := Filial;
       CdsClientes.Open;
       ConfirmaTransacao;
       if CdsClientes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 110 - Enviando Clientes: ' + FloatToStr(CdsClientes.RecordCount));
       if CdsClientes.RecordCount = 0 then
          Result := Null
       else
       Result := CdsClientes.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 110 AND ' +
                           ' ID_PRODUTO IN ( SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 110 )';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 110';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 110)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 110';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Clientes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Convênios
  if Identificador = 111 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 111 - Convenios');

       CdsConvenios.Close;
       AbreTransacao;
       CdsConvenios.Open;
       ConfirmaTransacao;
       if CdsConvenios.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 111 - Enviando Convenios: ' + FloatToStr(CdsConvenios.RecordCount));
       if CdsConvenios.RecordCount = 0 then
          Result := Null
       else
       Result := CdsConvenios.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Convenios - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Transportadoras
  if Identificador = 112 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 112 - Transportadoras');

       CdsTransportadoras.Close;
       AbreTransacao;
       CdsTransportadoras.Open;
       ConfirmaTransacao;
       if CdsTransportadoras.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 112 - Enviando Transportadoras: ' + FloatToStr(CdsTransportadoras.RecordCount));
       if CdsTransportadoras.RecordCount = 0 then
          Result := Null
       else
       Result := CdsTransportadoras.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Transportadoras - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Cartões
  if Identificador = 113 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 113 - Cartoes');

       CdsCartoes.Close;
       AbreTransacao;
       CdsCartoes.Open;
       ConfirmaTransacao;
       if CdsCartoes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 113 - Enviando Cartoes: ' + FloatToStr(CdsCartoes.RecordCount));
       if CdsCartoes.RecordCount = 0 then
          Result := Null
       else
       Result := CdsCartoes.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Cartoes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Distribuidores
  if Identificador = 114 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 114 - Distribuidores');

       CdsDistribuidores.Close;
       AbreTransacao;
       CdsDistribuidores.Params[0].AsFloat := Filial;
       CdsDistribuidores.Open;
       ConfirmaTransacao;
       if CdsDistribuidores.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 114 - Enviando Distribuidores: ' + FloatToStr(CdsDistribuidores.RecordCount));
       if CdsDistribuidores.RecordCount = 0 then
        begin
          Result := Null;
          Exit;
        end;

       Result := CdsDistribuidores.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 114';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Distribuidores - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Filiais
  if Identificador = 115 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 115 - Filiais');

       CdsFiliais.Close;
       AbreTransacao;
       CdsFiliais.Open;
       ConfirmaTransacao;
       if CdsFiliais.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 115 - Enviando Filiais: ' + FloatToStr(CdsFiliais.RecordCount));
       if CdsFiliais.RecordCount = 0 then
          Result := Null
       else
       Result := CdsFiliais.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Filiais - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Formas de Pagamento
  if Identificador = 116 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 116 - Formas de Pagamento');

       CdsFormasPagamento.Close;
       AbreTransacao;
       CdsFormasPagamento.Open;
       ConfirmaTransacao;
       if CdsFormasPagamento.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 116 - Enviando Forma de Pagamento: ' + FloatToStr(CdsFormasPagamento.RecordCount));
       if CdsFormasPagamento.RecordCount = 0 then
          Result := Null
       else
       Result := CdsFormasPagamento.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Formas de Pagamento - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Transfer
  if Identificador = 117 then
   begin
     Try
       Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 117 - Transferencias');

         AbreTransacao;
         Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER INACTIVE';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

         AbreTransacao;
         Sql1.CommandText := 'UPDATE TRANSFER SET ENVIADO = ''' + '9' +
                             ''' WHERE (((CD_FILIAL_ORIGEM = ' + strFilial + ') AND (STATUS <> ' + QuotedStr('E') + ')) or ((CD_FILIAL_DESTINO = ' + strFilial + ') AND ((STATUS = ' + QuotedStr('E') + ') OR (STATUS = ' + QuotedStr('C') + ')))) AND ((ENVIADO IS NULL) OR (ENVIADO <> '''+ '2' + ''')) AND STATUS <> ''' + 'A' + '''';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

         AbreTransacao;
         Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

       Except
         CancelaTransacao;
       End;

       CdsTransfer.Close;
       CdsTransfer.Params[0].AsFloat := Filial;
       CdsTransfer.Params[1].AsFloat := Filial;
       AbreTransacao;
       CdsTransfer.Open;
       ConfirmaTransacao;
       if CdsTransfer.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 117 - Enviando Transferencias: ' + FloatToStr(CdsTransfer.RecordCount));
       if CdsTransfer.RecordCount = 0 then
          Result := Null
       else
       Result := CdsTransfer.Data;

       {Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 117 - Transferencias');

         AbreTransacao;
         Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER INACTIVE';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

         AbreTransacao;
         Sql1.CommandText := 'UPDATE TRANSFER SET ENVIADO = ''' + '2' +
                             ''' WHERE (((CD_FILIAL_ORIGEM = ' + strFilial + ') AND (STATUS <> ' + QuotedStr('E') + ')) or ((CD_FILIAL_DESTINO = ' + strFilial + ') AND (STATUS = ' + QuotedStr('E') + '))) AND ((ENVIADO = '''+ '9' + ''')) AND STATUS <> ''' + 'A' + '''';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

         AbreTransacao;
         Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

       Except
         CancelaTransacao;
       End;}

       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Transfer - '+ E.Message);
            Result := Null;

            Try
              AbreTransacao;
              Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
              Sql1.ExecSQL(True);
              ConfirmaTransacao;
            Except
              CancelaTransacao;
            End;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia ItensTransfer
  if Identificador = 118 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 118 - Itens Transferencias');

       CdsItensTransfer.Close;
       CdsItensTransfer.Params[0].AsFloat := Filial;
       CdsItensTransfer.Params[1].AsFloat := Filial;
       AbreTransacao;
       CdsItensTransfer.Open;
       ConfirmaTransacao;
       if CdsItensTransfer.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 118 - Enviando ItensTransfer: ' + InttoStr(CdsItensTransfer.RecordCount));
       if CdsItensTransfer.RecordCount = 0 then
          Result := Null
       else
       Result := CdsItensTransfer.Data;

       Try
         AbreTransacao;
         Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER INACTIVE';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

         AbreTransacao;
         Sql1.CommandText := 'UPDATE TRANSFER SET ENVIADO = ''' + '2' +
                             ''' WHERE (((CD_FILIAL_ORIGEM = ' + strFilial + ') AND (STATUS <> ' + QuotedStr('E') + ')) or ((CD_FILIAL_DESTINO = ' + strFilial + ') AND (STATUS = ' + QuotedStr('E') + '))) AND ENVIADO = '''+ '9' + ''' AND STATUS <> ''' + 'A' + '''';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;

         AbreTransacao;
         Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de ItensTransfer - '+ E.Message);

            AbreTransacao;
            Sql1.CommandText := 'ALTER TRIGGER TG_AT_ENVIADO_TRANSFER ACTIVE';
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Cadastro dos Produtos
  if Identificador = 119 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 119 - Cadastro dos Produtos');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 119';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsPrecos.Close;
       SqlPrecos.CommandText :=
                  'SELECT ' +
                  'FIRST 2000 PRODUTOS.ID_PRODUTO, PRODUTOS.CD_PRODUTO, PRODUTOS.CD_GRUPO, PRODUTOS.CD_LABORATORIO, PRODUTOS.CD_CLASSE, ' +
                  'PRODUTOS.CD_LISTA, PRODUTOS.PRINCIPIOATIVO, PRODUTOS.CODIGO_BARRAS_1, PRODUTOS.CODIGO_BARRAS_2, PRODUTOS.DESCRICAO, ' +
                  'PRODUTOS.TIPO_PRODUTO, PRODUTOS.UNIDADE, PRODUTOS.STATUS, PRODUTOS.QT_EMBALAGEM, PRODUTOS.ESTOQUE_1, PRODUTOS.ESTOQUE_2, ' +
                  'PRODUTOS.ESTOQUE_3, PRODUTOS.ESTOQUE_4, PRODUTOS.ESTOQUE_5, PRODUTOS.ESTOQUE_6, PRODUTOS.ESTOQUE_7, PRODUTOS.ESTOQUE_8, ' +
                  'PRODUTOS.ESTOQUE_9, PRODUTOS.ESTOQUE_10, PRODUTOS.ESTOQUE_11, PRODUTOS.ESTOQUE_12, PRODUTOS.ESTOQUE_13, PRODUTOS.ESTOQUE_14, ' +
                  'PRODUTOS.ESTOQUE_15, PRODUTOS.ESTOQUE_16, PRODUTOS.ESTOQUE_17, PRODUTOS.ESTOQUE_18, PRODUTOS.ESTOQUE_19, PRODUTOS.ESTOQUE_20, ' +
                  'PRODUTOS.ESTOQUE_21, PRODUTOS.ESTOQUE_22, PRODUTOS.ESTOQUE_23, PRODUTOS.ESTOQUE_24, PRODUTOS.ESTOQUE_25, ' +
                  'PRODUTOS.ESTOQUE_26, PRODUTOS.ESTOQUE_27, PRODUTOS.ESTOQUE_28, PRODUTOS.ESTOQUE_29, PRODUTOS.ESTOQUE_30, ' +
                  'PRODUTOS.ID_FAMILIA, PRODUTOS.MARGEM_PROMOCAO, PRODUTOS.USOCONTINUO, PRODUTOS.COMISSAO, PRODUTOS.TX_DESCONTO, PRODUTOS.COMPRIMIDOSCAIXA, ' +
                  'PRODUTOS.CD_GRUPOBALANCO, PRODUTOS.CD_GRUPOCOMPRA, PRODUTOS.CONTROLADO, PRODUTOS.PIS_COFINS, PRODUTOS.NCM, PRODUTOS.ICMS, PRODUTOS.GENERICO, ' +
                  'PRODUTOS.ENTRA_PEDIDO_ELETRONICO, PRODUTOS.BALANCA, PRODUTOS.IPPT, PRODUTOS.IAT, PRODUTOS.CD_CFOP, PRODUTOS.REGISTROMS, PRODUTOS.IDENTIFICADOR, PRODUTOS.MARGEM,' +
                  'PRODUTOS.ESTOQUE_MINIMO_' + strFilial + ' AS ESTOQUE_MINIMO, ' +
                  'PRODUTOS.ESTOQUE_MAXIMO_' + strFilial + ' AS ESTOQUE_MAXIMO, ' +
                  'PRODUTOS.CURVA_UNITARIA_' + strFilial + ' AS CURVA_UNITARIA, ' +
                  'PRODUTOS.CURVA_FINANCEIRA_' + strFilial + ' AS CURVA_FINANCEIRA, ' +
                  'PRODUTOS.MEDIAF_' + strFilial + ' AS MEDIAF, PRODUTOS.ORIGEM, PRODUTOS.CSOSN, PRODUTOS.SITUACAOTRIBUTARIA, PRODUTOS.CD_SUBGRUPO, PRODUTOS.CD_PRINCIPIO, PRODUTOS.CEST, ' +
                  'PRODUTOS.COMPOSTO, PRODUTOS.OBSERVACAO ' +
                  'FROM PRODUTOS, TEMP_PRODUTOS2 WHERE TEMP_PRODUTOS2.CD_FILIAL = :CD_FILIAL AND TEMP_PRODUTOS2.PROCESSO = 119 AND PRODUTOS.ID_PRODUTO = TEMP_PRODUTOS2.ID_PRODUTO';
       AbreTransacao;
       CdsPrecos.Params[0].AsInteger := Filial;
       CdsPrecos.Open;
       ConfirmaTransacao;
       if CdsPrecos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 119 - Enviando Cadastro de Produtos: ' + FloatToStr(CdsPrecos.RecordCount));
       if CdsPrecos.RecordCount = 0 then
          Result := Null
       else
          Result := CdsPrecos.Data;
       CdsPrecos.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 119 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 119)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 119';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 119)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 119';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Cadastros - '+ E.Message) ;
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else


  //Envia Estoque
  if Identificador = 1191 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1191 - Estoque');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 1191';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsEstoque.Close;
       AbreTransacao;
       CdsEstoque.Params[0].AsInteger := Filial;
       CdsEstoque.Open;
       ConfirmaTransacao;
       if CdsEstoque.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1191 - Enviando Estoque dos Produtos: ' + FloatToStr(CdsEstoque.RecordCount));
       if CdsEstoque.RecordCount = 0 then
          Result := Null
       else
          Result := CdsEstoque.Data;
       CdsEstoque.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 1191 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 1191)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 1191';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 1191';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Estoques - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Consistencia Estoque Lojas
  if Identificador = 1192 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1192 - Consistencia Estoque Lojas');

       AbreTransacao;

       CdsFiliais.Close;
       CdsFiliais.Open;
       CdsFiliais.Filter := 'CD_FILIAL <> ' + IntToStr(CdsFiliaisCD_FILIAL.AsInteger) + ' AND EXPORTAR = ' + QuotedStr('S');
       CdsFiliais.Filtered := True;

       ClientDataSet1.Close;
       SQLDataSet1.CommandText := 'SELECT ID_PRODUTO FROM PRODUTOS WHERE STATUS = ' + QuotedStr('A');
       ClientDataSet1.Params.Clear;
       ClientDataSet1.Open;

       CdsFiliais.First;
       while not (CdsFiliais.Eof) do
        begin
          ClientDataSet1.First;
          while not (ClientDataSet1.Eof) do
           begin
              Sql1.CommandText := 'SELECT COUNT(*) FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + IntToStr(CdsFiliaisCD_FILIAL.AsInteger) +
                                 ' AND PROCESSO = 1191 AND ID_PRODUTO = ' + IntToStr(ClientDataSet1.Fields[0].AsInteger);
              Cds1.Params.Clear;
              Cds1.Open;
              if Cds1.Fields[0].AsInteger = 0 then
               begin
                 Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + IntToStr(ClientDataSet1.Fields[0].AsInteger) + ', ' +
                                     IntToStr(CdsFiliaisCD_FILIAL.AsInteger) + ', 1191, ' + QuotedStr('') + ')';
                 Sql1.ExecSQL(True);
               end;

              ClientDataSet1.Next;
           end;

          CdsFiliais.Next;
        end;

       ConfirmaTransacao;

       ClientDataSet1.Close;
       CdsFiliais.Filter := '';
       CdsFiliais.Filtered := False;
       CdsFiliais.Close;

     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia Estoque Lojas - '+ E.Message);
            Result := Null;

            ClientDataSet1.Close;
            CdsFiliais.Filter := '';
            CdsFiliais.Filtered := False;
            CdsFiliais.Close;

            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Classes
  if Identificador = 120 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 120 - Classes');

       CdsClasses.Close;
       AbreTransacao;
       CdsClasses.Open;
       ConfirmaTransacao;
       if CdsClasses.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 120 - Enviando Classes: ' + FloatToStr(CdsClasses.RecordCount));
       if CdsClasses.RecordCount = 0 then
          Result := Null
       else
       Result := CdsClasses.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Classes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Contas Receber
  if Identificador = 121 then  //gml 23.04.2014
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 121 - Contas a Receber');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 121';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsContas_Receber.Close;
       CdsContas_Receber.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsContas_Receber.Open;
       ConfirmaTransacao;
       if CdsContas_Receber.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 121 - Enviando Contas a Receber: ' + FloatToStr(CdsContas_Receber.RecordCount));
       if CdsContas_Receber.RecordCount = 0 then
          Result := Null
       else
          Result := CdsContas_Receber.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 121 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 121)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 121';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 121)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 121';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Contas Receber - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Contas Pagar
  if Identificador = 122 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 122 - Contas a Pagar');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 122';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsContas_Pagar.Close;
       CdsContas_Pagar.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsContas_Pagar.Open;
       ConfirmaTransacao;
       if CdsContas_Pagar.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 122 - Enviando Contas a Pagar: ' + FloatToStr(CdsContas_Pagar.RecordCount));
       if CdsContas_Pagar.RecordCount = 0 then
          Result := Null
       else
          Result := CdsContas_Pagar.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 122 AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 122)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 122';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 122)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 122';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Contas Pagar - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Vendedores_Classes
  if Identificador = 123 then
   begin
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 123 - Vendedores Classes');

     Try
       Sql1.CommandText := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE CD_FILIAL = ' + StrFilial + ' AND ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND PROCESSO = 123';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
     Except
       CancelaTransacao;
     End;

     Try
       AbreTransacao;
       CdsVendedores_Classes.Close;
       CdsVendedores_Classes.Params[0].AsFloat := Filial;
       CdsVendedores_Classes.Open;
       if CdsVendedores_Classes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 123 - Enviando Vendedores Classes: ' + FloatToStr(CdsVendedores_Classes.RecordCount));
       ConfirmaTransacao;
       if CdsVendedores_Classes.RecordCount = 0 then
          Result := Null
       else
          Result := CdsVendedores_Classes.Data;
       AbreTransacao;
       Try
         Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 123 AND ENVIADO = ' + QuotedStr('9');
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Vendedores_Classes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Convenios_Classes
  if Identificador = 124 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 124 - Convenios Classes');

       Try
         Sql1.CommandText := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE CD_FILIAL = ' + StrFilial + ' AND ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND PROCESSO = 124';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       AbreTransacao;
       CdsConvenios_Classes.Close;
       CdsConvenios_Classes.Params[0].AsFloat := Filial;
       CdsConvenios_Classes.Open;
       ConfirmaTransacao;
       if CdsConvenios_Classes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 124 - Enviando Convenios Classes: ' + FloatToStr(CdsConvenios_Classes.RecordCount));
       if CdsConvenios_Classes.RecordCount = 0 then
          Result := Null
       else
          Result := CdsConvenios_Classes.Data;
       Try
         Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 124 AND ENVIADO = ' + QuotedStr('9');
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Convenios_Classes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Precos de Venda dos Produtos
  if Identificador = 125 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 125 - Precos de Venda');

       AbreTransacao;
       CdsPrecoVenda.Close;
       MontaSQL_Precos(strFilial);
       CdsPrecoVenda.Open;
       ConfirmaTransacao;
       if CdsPrecoVenda.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 125 - Enviando Precos de Venda: ' + FloatToStr(CdsPrecoVenda.RecordCount));
       if CdsPrecoVenda.RecordCount <> 0 then
          Result := CdsPrecoVenda.Data
       else
          Result := Null;

       Sql1.CommandText := 'DELETE FROM REAJUSTE WHERE CD_FILIAL = ' + StrFilial + ' AND ENVIADO = ' + QuotedStr('9') + ' AND USUARIO = ' + QuotedStr('SP') ;
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'UPDATE REAJUSTE SET ENVIADO = ' + QuotedStr('2') + ' WHERE CD_FILIAL = ' + StrFilial + ' AND ENVIADO = ' + QuotedStr('9');
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_REAJUSTE WHERE CD_FILIAL = ' + StrFilial;
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
       on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Preco de Venda - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Balancos
  if Identificador = 126 then   //gml 26.04.2016
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 126 - Balancos');

       AbreTransacao;
       CdsBalancos.Close;
       CdsBalancos.Params[0].AsFloat := Filial;
       CdsBalancos.Open;
       ConfirmaTransacao;
       if CdsBalancos.RecordCount > 0 then
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 126 - Enviando Balancos: ' + FloatToStr(CdsBalancos.RecordCount));
         Result := CdsBalancos.Data;
        end
       else
          Result := Null;

       Sql1.CommandText := 'UPDATE BALANCO SET ENVIADO = ' + QuotedStr('2') + ' WHERE CD_FILIAL = ' + StrFilial + ' AND (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ')';  //GML 26.04.2016
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
       on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Balancos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Metas da Filial
  if Identificador = 127 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 127 - Metas da Filial');

       CdsMetaFilial.Close;
       AbreTransacao;
       CdsMetaFilial.Params[0].AsInteger := Filial;
       CdsMetaFilial.Open;
       ConfirmaTransacao;
       if CdsMetaFilial.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 127 - Enviando Metas da Filial: ' + FloatToStr(CdsMetaFilial.RecordCount));
       if CdsMetaFilial.RecordCount = 0 then
          Result := Null
       else
       Result := CdsMetaFilial.Data;
       CdsMetaFilial.First;
       while not CdsMetaFilial.Eof do
        begin
          Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 127 AND ID_PRODUTO = ' + CdsMetaFilialID_META.AsString;
          AbreTransacao;
          Sql1.ExecSQL(True);
          ConfirmaTransacao;
          CdsMetaFilial.Next;
        end;
       AbreTransacao;
       CdsMetaFilial.ApplyUpdates(0);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Cadastros - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Metas do Vendedor
  if Identificador = 128 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 128 - Metas dos Vendedores');

       CdsMetaVendedor.Close;
       AbreTransacao;
       CdsMetaVendedor.Params[0].AsInteger := Filial;
       CdsMetaVendedor.Open;
       ConfirmaTransacao;
       if CdsMetaVendedor.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 128 - Enviando Metas dos Vendedores: ' + FloatToStr(CdsMetaVendedor.RecordCount));
       if CdsMetaVendedor.RecordCount = 0 then
          Result := Null
       else
          Result := CdsMetaVendedor.Data;
       CdsMetaVendedor.First;
       while not CdsMetaVendedor.Eof do
        begin
          Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 128 AND ID_PRODUTO = ' + CdsMetaVendedorID_META.AsString;
          AbreTransacao;
          Sql1.ExecSQL(True);
          ConfirmaTransacao;
          CdsMetaVendedor.Next;
        end;
       AbreTransacao;
       CdsMetaVendedor.ApplyUpdates(0);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Cadastros - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Familias
  if Identificador = 129 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 129 - Familias');

       CdsFamilias.Close;
       AbreTransacao;
       CdsFamilias.Params[0].AsFloat := Filial;
       CdsFamilias.Open;
       ConfirmaTransacao;
       if CdsFamilias.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 129 - Enviando Familias: ' + FloatToStr(CdsFamilias.RecordCount));
       if CdsFamilias.RecordCount = 0 then
          Result := Null
       else
       Result := CdsFamilias.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 129';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Familias - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia GruposBalanco
  if Identificador = 130 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 130 - Grupos de Balanco');

       CdsGruposBalanco.Close;
       AbreTransacao;
       CdsGruposBalanco.Open;
       ConfirmaTransacao;
       if CdsGruposBalanco.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 130 - Enviando Grupos de Balanco: ' + FloatToStr(CdsGruposBalanco.RecordCount));
       if CdsGruposBalanco.RecordCount = 0 then
          Result := Null
       else
       Result := CdsGruposBalanco.Data;
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Grupos de Balanço - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia GruposCompra
  if Identificador = 131 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 131 - Grupos de Compras');

       CdsGruposCompras.Close;
       AbreTransacao;
       CdsGruposCompras.Open;
       ConfirmaTransacao;
       if CdsGruposCompras.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 131 - Enviando Grupos de Compra: ' + FloatToStr(CdsGruposCompras.RecordCount));
       if CdsGruposCompras.RecordCount = 0 then
          Result := Null
       else
       Result := CdsGruposCompras.Data;
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Grupos de Compra - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia GruposCurvas
  if Identificador = 132 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 132 - Grupos Curvas');

       CdsGruposCurvas.Close;
       AbreTransacao;
       CdsGruposCurvas.Params[0].AsFloat := Filial;
       CdsGruposCurvas.Open;
       ConfirmaTransacao;
       if CdsGruposCurvas.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 132 - Enviando Grupos Curvas: ' + FloatToStr(CdsGruposCurvas.RecordCount));
       if CdsGruposCurvas.RecordCount = 0 then
          Result := Null
       else
       Result := CdsGruposCurvas.Data;
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Grupos Curvas - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Redes
  if Identificador = 133 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 133 - Redes');

       CdsRedes.Close;
       AbreTransacao;
       CdsRedes.Open;
       ConfirmaTransacao;
       if CdsRedes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 133 - Enviando Redes: ' + FloatToStr(CdsRedes.RecordCount));
       if CdsRedes.RecordCount = 0 then
          Result := Null
       else
       Result := CdsRedes.Data;
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Redes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Concorrentes
  if Identificador = 134 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 134 - Concorrentes');

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 INACTIVE';
       Sql1.ExecSql(True);
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'UPDATE CONCORRENTES SET ENVIADO = ' + QuotedStr('9') + ' WHERE (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ') AND ID_FILIAL = ' + StrFilial;
       Sql1.ExecSql(True);
       ConfirmaTransacao;

       CdsConcorrentes.Close;
       AbreTransacao;
       CdsConcorrentes.Params[0].AsFloat := Filial;
       CdsConcorrentes.Open;
       ConfirmaTransacao;
       if CdsConcorrentes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 134 - Enviando Concorrentes: ' + FloatToStr(CdsConcorrentes.RecordCount));
       if CdsConcorrentes.RecordCount = 0 then
          Result := Null
       else
       Result := CdsConcorrentes.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'UPDATE CONCORRENTES SET ENVIADO = ' + QuotedStr('2') + ' WHERE ENVIADO = ' + QuotedStr('9') + ' AND ID_FILIAL = ' + StrFilial;
       Sql1.ExecSql(True);
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
       Sql1.ExecSql(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Concorrentes - '+ E.Message);

            AbreTransacao;
            Sql1.CommandText := 'ALTER TRIGGER CONCORRENTES_BIU0 ACTIVE';
            Sql1.ExecSql(True);
            ConfirmaTransacao;

            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else
  //Envia SubGrupos
  if Identificador = 135 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 135 - SubGrupos');

       AbreTransacao;
       CdsSubGrupos.Params[0].AsFloat := Filial;
       CdsSubGrupos.Open;
       ConfirmaTransacao;
       if CdsSubGrupos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 135 - Enviando SubGrupos: ' + FloatToStr(CdsSubGrupos.RecordCount));
       if CdsSubGrupos.RecordCount = 0 then
          Result := Null
       else
          Result := CdsSubGrupos.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 135';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de SubGrupos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Convenios_Grupos
  if Identificador = 136 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 136 - Convenios Grupos');

       Try
         Sql1.CommandText := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE CD_FILIAL = ' + StrFilial + ' AND ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND PROCESSO = 136';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       AbreTransacao;
       CdsConvenios_Grupos.Close;
       CdsConvenios_Grupos.Params[0].AsFloat := Filial;
       CdsConvenios_Grupos.Open;
       ConfirmaTransacao;
       if CdsConvenios_Grupos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 136 - Enviando Convenios Grupos: ' + FloatToStr(CdsConvenios_Grupos.RecordCount));
       if CdsConvenios_Grupos.RecordCount = 0 then
          Result := Null
       else
          Result := CdsConvenios_Grupos.Data;
       Try
         Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 136 AND ENVIADO = ' + QuotedStr('9');
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Convenios_Grupos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Contas_Pagar_Compras
  if Identificador = 137 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 137 - Contas_Pagar_Compras');

       Try
         Sql1.CommandText := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE CD_FILIAL = ' + StrFilial + ' AND ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND PROCESSO = 137';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       AbreTransacao;
       CdsContasPagarCompras.Close;
       CdsContasPagarCompras.Params[0].AsFloat := Filial;
       CdsContasPagarCompras.Open;
       ConfirmaTransacao;
       if CdsContasPagarCompras.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 137 - Enviando Contas_Pagar_Compras: ' + FloatToStr(CdsContasPagarCompras.RecordCount));
       if CdsContasPagarCompras.RecordCount = 0 then
          Result := Null
       else
          Result := CdsContasPagarCompras.Data;
       Try
         Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 137 AND ENVIADO = ' + QuotedStr('9');
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Contas_Pagar_Compras - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Produtos_Convenios_PBM
  if Identificador = 138 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 138 - Produtos_Convenios_PBM');

       Try
         Sql1.CommandText := 'UPDATE TEMP_PRODUTOS SET ENVIADO = ' + QuotedStr('9') + ' WHERE CD_FILIAL = ' + StrFilial + ' AND ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND PROCESSO = 138';
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       AbreTransacao;
       CdsProdutosConveniosPBM.Close;
       CdsProdutosConveniosPBM.Params[0].AsFloat := Filial;
       CdsProdutosConveniosPBM.Open;
       ConfirmaTransacao;
       if CdsProdutosConveniosPBM.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 138 - Enviando Produtos_Convenios_PBM: ' + FloatToStr(CdsProdutosConveniosPBM.RecordCount));
       if CdsProdutosConveniosPBM.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdutosConveniosPBM.Data;
       Try
         Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 138 AND ENVIADO = ' + QuotedStr('9');
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos_Convenios_PBM - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  // Usuarios_Grupos
  if Identificador = 139 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 139 - Usuários Grupos');

       CdsUsuariosGrupos.Close;
       CdsUsuariosGrupos.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsUsuariosGrupos.Open;
       ConfirmaTransacao;
       if CdsUsuariosGrupos.RecordCount > 0 then
        begin
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 139 - Usuários Grupos: ' + FloatToStr(CdsUsuariosGrupos.RecordCount));
         Result := CdsUsuariosGrupos.Data;
        end
       else
        begin
          Result := Null;
        end;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Usuários Grupos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else


  //Envia Transfer no ato de Venda
  if Identificador = 140 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 140 - Transferencias no ato da venda');

       CdsTransferVenda.Close;
       CdsTransferVenda.Params[0].AsFloat := Filial;
       CdsTransferVenda.Params[1].AsFloat := Filial;
       CdsTransferVenda.Params[2].AsDate := Date;
       AbreTransacao;
       CdsTransferVenda.Open;
       ConfirmaTransacao;
       if CdsTransferVenda.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 140 - Enviando Transferencias pela Venda: ' + FloatToStr(CdsTransferVenda.RecordCount));
       if CdsTransferVenda.RecordCount = 0 then
          Result := Null
       else
       Result := CdsTransferVenda.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Transfer - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia ItensTransfer no ato de Venda
  if Identificador = 141 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 141 - Itens da transferencia no ato da venda');

       CdsItensTransferVenda.Close;
       CdsItensTransferVenda.Params[0].AsFloat := Filial;
       CdsItensTransferVenda.Params[1].AsFloat := Filial;
       CdsItensTransferVenda.Params[2].AsDate := Date;
       AbreTransacao;
       CdsItensTransferVenda.Open;
       ConfirmaTransacao;
       if CdsItensTransferVenda.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 141 - Enviando ItensTransfer pela Venda: ' + InttoStr(CdsItensTransferVenda.RecordCount));
       if CdsItensTransferVenda.RecordCount = 0 then
          Result := Null
       else
       Result := CdsItensTransferVenda.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de ItensTransfer - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
   else

  //Envia Usuarios
  if Identificador = 142 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 142 - Usuarios');

       CdsUsuarios.Close;
       CdsUsuarios.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsUsuarios.Open;
       ConfirmaTransacao;
       if CdsUsuarios.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 142 - Enviando Usuarios: ' + FloatToStr(CdsUsuarios.RecordCount));
       if CdsUsuarios.RecordCount = 0 then
          Result := Null
       else
       Result := CdsUsuarios.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 142';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Usuarios - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Permissoes
  if Identificador = 143 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 143 - Permissoes');

       CdsPermissoes.Close;
       CdsPermissoes.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsPermissoes.Open;
       ConfirmaTransacao;
       if CdsPermissoes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 143 - Enviando Permissões : ' + FloatToStr(CdsPermissoes.RecordCount));
       if CdsPermissoes.RecordCount = 0 then
          Result := Null
       else
       Result := CdsPermissoes.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 143';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Permissões Módulos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Permissoes Modulos
  if Identificador = 144 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 144 - Permissoes Modulos');

       CdsPermissoesModulos.Close;
       AbreTransacao;
       CdsPermissoesModulos.Params[0].AsFloat := Filial;
       CdsPermissoesModulos.Open;
       ConfirmaTransacao;
       if CdsPermissoesModulos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 144 - Enviando Permissões Modulos : ' + FloatToStr(CdsPermissoesModulos.RecordCount));
       if CdsPermissoesModulos.RecordCount = 0 then
          Result := Null
       else
       Result := CdsPermissoesModulos.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 144';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Permissões Módulos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Lancamentos a Prazo
  if Identificador = 145 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 145 - Lancamentos a Prazo');

       Sql1.CommandText := 'INSERT INTO TEMP_LANCAMENTOS_APRAZO2 SELECT FIRST 1000 * FROM TEMP_LANCAMENTOS_APRAZO WHERE CD_FILIAL_DESTINO = ' + StrFilial;
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsLancamentosaPrazo.Close;
       AbreTransacao;
       CdsLancamentosaPrazo.Params[0].AsFloat := Filial;
       CdsLancamentosaPrazo.Open;
       ConfirmaTransacao;
       if CdsLancamentosaPrazo.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 145 - Enviando Lancamentos a Prazo : ' + FloatToStr(CdsLancamentosaPrazo.RecordCount));
       if CdsLancamentosaPrazo.RecordCount = 0 then
        begin
          Result := Null;
          Exit;
        end
       else
       Result := CdsLancamentosaPrazo.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO WHERE CD_FILIAL_DESTINO = ' + StrFilial + ' AND CD_LANCAMENTO||CD_FILIAL IN (SELECT CD_LANCAMENTO||CD_FILIAL FROM TEMP_LANCAMENTOS_APRAZO2 WHERE CD_FILIAL_DESTINO = ' + StrFilial + ')';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO2 WHERE CD_FILIAL_DESTINO = ' + StrFilial;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {AbreTransacao;
       Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPLANCAMENTOSAPRAZO(' + StrFilial + ')';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            AbreTransacao;
            Sql1.CommandText := 'DELETE FROM TEMP_LANCAMENTOS_APRAZO2 WHERE CD_FILIAL_DESTINO = ' + StrFilial;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;
            SQLConnection1.Close;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Lancamentos a Prazo - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else


  //Envia Encartes
  if Identificador = 146 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 146 - Encartes');

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER ENCARTE_BU0 INACTIVE';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'UPDATE ENCARTE SET ENVIADO = ' + QuotedStr('9') + ' WHERE ((ENVIADO IS NULL) OR (ENVIADO <> ' + QuotedStr('2') + ')) AND ' +
                           ' ID_ENCARTE IN (SELECT ID_ENCARTE FROM ENCARTES_FILIAIS WHERE CD_FILIAL = ' + StrFilial + ')';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsEncartes.Close;
       AbreTransacao;
       CdsEncartes.Params[0].AsFloat := Filial;
       CdsEncartes.Open;
       ConfirmaTransacao;
       if CdsEncartes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 146 - Enviando Encartes : ' + FloatToStr(CdsEncartes.RecordCount));
       if CdsEncartes.RecordCount = 0 then
        begin
          Result := Null;
          Exit;
        end
       else
       Result := CdsEncartes.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER ENCARTE_BU0 ACTIVE';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Encartes - '+ E.Message);

            AbreTransacao;
            Sql1.CommandText := 'ALTER TRIGGER ENCARTE_BU0 ACTIVE';
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia EncartesItens
  if Identificador = 147 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 147 - Itens dos Encartes');

       CdsEncartesItens.Close;
       AbreTransacao;
       CdsEncartesItens.Params[0].AsFloat := Filial;
       CdsEncartesItens.Open;
       ConfirmaTransacao;
       if CdsEncartesItens.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 147 - Enviando Itens de Encartes : ' + FloatToStr(CdsEncartesItens.RecordCount));
       if CdsEncartesItens.RecordCount = 0 then
        begin
          Result := Null;
          Exit;
        end
       else
       Result := CdsEncartesItens.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER ENCARTE_BU0 INACTIVE';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'UPDATE ENCARTE SET ENVIADO = ' + QuotedStr('2') + ' WHERE (ENVIADO = ' + QuotedStr('9') + ') AND ' +
                           ' ID_ENCARTE IN (SELECT ID_ENCARTE FROM ENCARTES_FILIAIS WHERE CD_FILIAL = ' + StrFilial + ')';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'ALTER TRIGGER ENCARTE_BU0 ACTIVE';
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Itens de Encartes - '+ E.Message);

            AbreTransacao;
            Sql1.CommandText := 'ALTER TRIGGER ENCARTE_BU0 ACTIVE';
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Precos Concorrentes
  if Identificador = 148 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 148 - Precos dos Concorrentes');

       AbreTransacao;
       Sql1.CommandText := 'UPDATE TEMP_PRODUTOS_CONCORRENTES SET ENVIADO = ' + QuotedStr('9') + ' WHERE (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ') AND PROCESSO = 148 AND CD_FILIAL = ' + StrFilial;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsPrecosConcorrentes.Close;
       AbreTransacao;
       CdsPrecosConcorrentes.Params[0].AsFloat := Filial;
       CdsPrecosConcorrentes.Params[1].AsFloat := Filial;
       CdsPrecosConcorrentes.Open;
       ConfirmaTransacao;
       if CdsPrecosConcorrentes.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 148 - Enviando Precos Concorrentes : ' + FloatToStr(CdsPrecosConcorrentes.RecordCount));
       if CdsPrecosConcorrentes.RecordCount = 0 then
        begin
          Result := Null;
          Exit;
        end
       else
       Result := CdsPrecosConcorrentes.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_CONCORRENTES WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 148 AND ENVIADO = ' + QuotedStr('9');
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Precos Concorrentes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Precos Concorrentes Deletados
  if Identificador = 149 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 149 - Precos Deletados dos Concorrentes');

       AbreTransacao;
       Sql1.CommandText := 'UPDATE TEMP_PRODUTOS_CONCORRENTES SET ENVIADO = ' + QuotedStr('9') + ' WHERE (ENVIADO IS NULL OR ENVIADO <> ' + QuotedStr('2') + ') AND PROCESSO = 149 AND CD_FILIAL = ' + StrFilial;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       CdsPrecosConcorrentesDeletados.Close;
       AbreTransacao;
       CdsPrecosConcorrentesDeletados.Params[0].AsFloat := Filial;
       CdsPrecosConcorrentesDeletados.Open;
       ConfirmaTransacao;
       if CdsPrecosConcorrentesDeletados.RecordCount > 0 then
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 149 - Enviando Precos Concorrentes Deletados : ' + FloatToStr(CdsPrecosConcorrentesDeletados.RecordCount));
       if CdsPrecosConcorrentesDeletados.RecordCount = 0 then
        begin
          Result := Null;
          Exit;
        end
       else
       Result := CdsPrecosConcorrentesDeletados.Data;
       ConfirmaTransacao;

       AbreTransacao;
       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_CONCORRENTES WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 149 AND ENVIADO = ' + QuotedStr('9');
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Precos Concorrentes Deletados - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Contas a Receber Deletados
  if Identificador = 150 then  //gml 23.04.2014
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 150 - Contas a Receber Deletados');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 150';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       CdsContasReceberDeletados.Close;
       CdsContasReceberDeletados.Params[0].AsFloat := Filial;
       CdsContasReceberDeletados.Open;
       ConfirmaTransacao;
       if CdsContasReceberDeletados.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 150 - Enviando Contas a Receber Deletados: ' + FloatToStr(CdsContasReceberDeletados.RecordCount));
       if CdsContasReceberDeletados.RecordCount = 0 then
          Result := Null
       else
       Result := CdsContasReceberDeletados.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 150 AND ' +
                           ' ID_PRODUTO IN ( SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 150 )';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 150';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 150)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 150';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Incluidos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Limite e Saldo de Clientes
  if Identificador = 151 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 151 - Limite e Saldo dos Clientes');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 151';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       CdsLimiteCliente.Close;
       CdsLimiteCliente.Params[0].AsFloat := Filial;
       CdsLimiteCliente.Open;
       ConfirmaTransacao;
       if CdsLimiteCliente.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 151 - Enviando Limite e Saldo dos Clientes: ' + FloatToStr(CdsLimiteCliente.RecordCount));
       if CdsLimiteCliente.RecordCount = 0 then
          Result := Null
       else
       Result := CdsLimiteCliente.Data;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 151 AND ' +
                           ' ID_PRODUTO IN ( SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 151 )';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 151';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 151)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 151';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Limite e Saldo dos Clientes - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Projetos Pharmalink
  if Identificador = 152 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 152 - Projetos Pharmalink');

       AbreTransacao;
       CdsProjetoPharmalink.Close;
       CdsProjetoPharmalink.Open;
       ConfirmaTransacao;
       if CdsProjetoPharmalink.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 152 - Enviando Projetos Pharmalink: ' + FloatToStr(CdsProjetoPharmalink.RecordCount));
       if CdsProjetoPharmalink.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProjetoPharmalink.Data;
       CdsProjetoPharmalink.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Projetos Pharmlink - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Perfis de Cliente
  if Identificador = 153 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 153 - Perfis de Clientes');

       AbreTransacao;
       CdsPerfilCliente.Close;
       CdsPerfilCliente.Open;
       ConfirmaTransacao;
       if CdsPerfilCliente.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 153 - Enviando Perfis de Cliente: ' + FloatToStr(CdsPerfilCliente.RecordCount));
       if CdsPerfilCliente.RecordCount = 0 then
          Result := Null
       else
          Result := CdsPerfilCliente.Data;
       CdsPerfilCliente.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Perfis de Cliente - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Produtos_Quantidade
  if Identificador = 154 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 154 - Produtos Quantidade');

       AbreTransacao;
       CdsProdutosQuantidade.Close;
       CdsProdutosQuantidade.Params[0].AsFloat := Filial;
       CdsProdutosQuantidade.Open;
       ConfirmaTransacao;
       if CdsProdutosQuantidade.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 154 - Enviando Produtos Quantidade: ' + FloatToStr(CdsProdutosQuantidade.RecordCount));
       if CdsProdutosQuantidade.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdutosQuantidade.Data;
       CdsProdutosQuantidade.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_QUANTIDADE WHERE CD_FILIAL = ' + strFilial;
       Sql1.ExecSQL(True);

       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Quantidade - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Produtos_Farmacia_Popular
  if Identificador = 155 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 155 - Produtos Farmacia Popular');

       AbreTransacao;
       CdsProdutosFP.Close;
       CdsProdutosFP.Params[0].AsFloat := Filial;
       CdsProdutosFP.Open;
       ConfirmaTransacao;
       if CdsProdutosFP.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 155 - Enviando Produtos Farmacia Popular: ' + FloatToStr(CdsProdutosFP.RecordCount));
       if CdsProdutosFP.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdutosFP.Data;
       CdsProdutosFP.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = 155';
       Sql1.ExecSQL(True);

       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Farmacia Popular - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Itens Compras Lote
  if Identificador = 156 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 156 - Itens Compras Lote');

       Try
         Sql1.CommandText := 'UPDATE TEMP_ITENS_COMPRA_LOTE SET ENVIADO = ''' + '9' + ''' WHERE CD_FILIAL = ' + FloattoStr(Filial) + ' AND ENVIADO <> ''' + '2' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       CdsLotesItensCompras.Close;
       CdsLotesItensCompras.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsLotesItensCompras.Open;
       ConfirmaTransacao;
       if CdsLotesItensCompras.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 156 - Enviando Lotes Itens Compra: ' + FloatToStr(CdsLotesItensCompras.RecordCount));
       if CdsLotesItensCompras.RecordCount = 0 then
          Result := Null
       else
       Result := CdsLotesItensCompras.Data;

       Try
         Sql1.CommandText := 'DELETE FROM TEMP_ITENS_COMPRA_LOTE WHERE CD_FILIAL = ' + FloattoStr(Filial) + ' AND ENVIADO = ''' + '9' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Lotes Itens Compras - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Comando de Reexportacao dos Dados da Filial para Matriz
  if Identificador = 157 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 157 - Comando de Reexportacao de Dados');

       Try
         Sql1.CommandText := 'UPDATE TEMP_REEXPORTACAO SET ENVIADO = ''' + '9' + ''' WHERE CD_FILIAL = ' + FloattoStr(Filial) + ' AND ENVIADO <> ' + QuotedStr('2');
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       CdsReexportacao.Close;
       CdsReexportacao.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsReexportacao.Open;
       ConfirmaTransacao;
       if CdsReexportacao.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 157 - Enviando Reexportacao: ' + FloatToStr(CdsReexportacao.RecordCount));
       if CdsReexportacao.RecordCount = 0 then
          Result := Null
       else
          Result := CdsReexportacao.Data;

       Try
         Sql1.CommandText := 'DELETE FROM TEMP_REEXPORTACAO WHERE CD_FILIAL = ' + FloattoStr(Filial) + ' AND ENVIADO = ''' + '9' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Reexportacao - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Produtos_Fidelidade
  if Identificador = 158 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 158 - Produtos Fidelidade');

       AbreTransacao;
       CdsProdutosFidelidade.Close;
       CdsProdutosFidelidade.Params[0].AsFloat := Filial;
       CdsProdutosFidelidade.Params[1].AsFloat := Filial;
       CdsProdutosFidelidade.Open;
       ConfirmaTransacao;
       if CdsProdutosFidelidade.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 158 - Enviando Produtos Fidelidade: ' + FloatToStr(CdsProdutosFidelidade.RecordCount));
       if CdsProdutosFidelidade.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdutosFidelidade.Data;
       CdsProdutosFidelidade.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = 158';
       Sql1.ExecSQL(True);

       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Fidelidade - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Principio Ativo
  if Identificador = 159 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 159 - Principio Ativo');

       AbreTransacao;
       CdsPrincipioAtivo.Close;
       CdsPrincipioAtivo.Params[0].AsFloat := Filial;
       CdsPrincipioAtivo.Open;
       ConfirmaTransacao;
       if CdsPrincipioAtivo.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 159 - Enviando Principio Ativo: ' + FloatToStr(CdsPrincipioAtivo.RecordCount));
       if CdsPrincipioAtivo.RecordCount = 0 then
          Result := Null
       else
          Result := CdsPrincipioAtivo.Data;
       CdsPrincipioAtivo.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = 159';
       Sql1.ExecSQL(True);

       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Principio Ativo - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Prod_Distr
  if Identificador = 160 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 160 - Dicionario de Codigo');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 160';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       CdsProdDistr.Close;
       CdsProdDistr.Params[0].AsFloat := Filial;
       CdsProdDistr.Open;
       ConfirmaTransacao;
       if CdsProdDistr.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 160 - Enviando Prod_Distr: ' + FloatToStr(CdsProdDistr.RecordCount));
       if CdsProdDistr.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdDistr.Data;
       CdsProdDistr.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 160 AND ' +
                           ' ID_PRODUTO IN ( SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 160 )';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = 160';
       Sql1.ExecSQL(True);
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 160)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 160';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Prod_Distr - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Produtos Fisco
  if Identificador = 161 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 161 - Produtos Fisco');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS2 SELECT FIRST 500 * FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 161';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       CdsProdutosFisco.Close;
       CdsProdutosFisco.Params[0].AsFloat := Filial;
       CdsProdutosFisco.Open;
       ConfirmaTransacao;
       if CdsProdutosFisco.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 161 - Enviando Produtos Fisco: ' + FloatToStr(CdsProdutosFisco.RecordCount));
       if CdsProdutosFisco.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdutosFisco.Data;
       CdsProdutosFisco.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 161 AND ' +
                           ' ID_PRODUTO IN ( SELECT ID_PRODUTO FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 161 )';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = 161';
       Sql1.ExecSQL(True);
       SQLConnection1.Close;


       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOS(' + StrFilial + ', 161)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 161';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Fisco - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

    //Envia Produtos Compostos
  if Identificador = 162 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 162 - Produtos Compostos');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS_COMPOSTOS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS_COMPOSTOS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 162';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       CdsProdutosCompostos.Close;
       CdsProdutosCompostos.Params[0].AsFloat := Filial;
       CdsProdutosCompostos.Open;
       ConfirmaTransacao;
       if CdsProdutosCompostos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 162 - Enviando Produtos Compostos: ' + FloatToStr(CdsProdutosCompostos.RecordCount));
       if CdsProdutosCompostos.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdutosCompostos.Data;
       CdsProdutosCompostos.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_COMPOSTOS WHERE ID_PRODUTO_PRINCIPAL||ID_PRODUTO_COMPOSICAO||CD_FILIAL||PROCESSO IN ' +
                           '(SELECT ID_PRODUTO_PRINCIPAL||ID_PRODUTO_COMPOSICAO||CD_FILIAL||PROCESSO FROM TEMP_PRODUTOS_COMPOSTOS2)';

       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_COMPOSTOS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 162';
       Sql1.ExecSQL(True);
       SQLConnection1.Close;

       {Sql1.CommandText := 'EXECUTE PROCEDURE SP_APAGA_TEMPPRODUTOSCOMPOSTOS(' + StrFilial + ', 162)';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;
       SQLConnection1.Close;}

     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Compostos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Compras Boletos
  if Identificador = 163 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 163 - Compras Boletos');

       Try
         Sql1.CommandText := 'UPDATE TEMP_COMPRAS SET ENVIADO = ''' + '9' + ''' WHERE PROCESSO = ''' + '163' + ''' AND CD_FILIAL = ' + strFilial + ' AND ENVIADO <> ''' + '2' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;

       CdsComprasBoletos.Close;
       CdsComprasBoletos.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsComprasBoletos.Open;
       ConfirmaTransacao;
       if CdsComprasBoletos.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 163 - Enviando Compras Boletos: ' + FloatToStr(CdsComprasBoletos.RecordCount));
       if CdsComprasBoletos.RecordCount = 0 then
          Result := Null
       else
       Result := CdsComprasBoletos.Data;

       Try
         Sql1.CommandText := 'DELETE FROM TEMP_COMPRAS WHERE PROCESSO = ''' + '163' + ''' AND CD_FILIAL = ' + strFilial + ' AND ENVIADO = ''' + '9' + '''';
         AbreTransacao;
         Sql1.ExecSQL(True);
         ConfirmaTransacao;
       Except
         CancelaTransacao;
       End;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Compras Boletos - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envia Produtos Barras
  if Identificador = 164 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 164 - Produtos Barras');

       Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS_BARRAS2 SELECT FIRST 1000 * FROM TEMP_PRODUTOS_BARRAS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 164';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       AbreTransacao;
       CdsProdutosBarras.Close;
       CdsProdutosBarras.Params[0].AsFloat := Filial;
       CdsProdutosBarras.Open;
       ConfirmaTransacao;
       if CdsProdutosBarras.RecordCount > 0 then
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 164 - Enviando Produtos Barras: ' + FloatToStr(CdsProdutosBarras.RecordCount));
       if CdsProdutosBarras.RecordCount = 0 then
          Result := Null
       else
          Result := CdsProdutosBarras.Data;
       CdsProdutosBarras.Close;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_BARRAS WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 164 AND ' +
                           ' ID_PRODUTO IN ( SELECT ID_PRODUTO FROM TEMP_PRODUTOS_BARRAS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 164 )';
       AbreTransacao;
       Sql1.ExecSQL(True);
       ConfirmaTransacao;

       Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_BARRAS2 WHERE CD_FILIAL = ' + strFilial + ' AND PROCESSO = 164';
       Sql1.ExecSQL(True);
       SQLConnection1.Close;

     Except
         on E:Exception do
          begin
            Sql1.CommandText := 'DELETE FROM TEMP_PRODUTOS_BARRAS2 WHERE CD_FILIAL = ' + StrFilial + ' AND PROCESSO = 164';
            AbreTransacao;
            Sql1.ExecSQL(True);
            ConfirmaTransacao;

            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Produtos Barras - '+ E.Message);
            Result := Null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //verificacao de conexao e filial - validacao de conexao
  if Identificador = 999 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 999 - Validacao de Conexao');

       Result := 'True';
       CdsConexao.Close;
       CdsConexao.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsConexao.Open;
       ConfirmaTransacao;
       if CdsConexaoEXPORTAR.AsString = 'S' then
         Result := CdsConexaoCNPJ.AsString
       else
         begin
          Result := 'FALHA';
          GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Processo = 999 - Filial ' + strFilial + ': CNPJ - '+ CdsConexaoCNPJ.AsString + ' - Exportar = N');
         end;

       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Processo = 999 - Erro no processo de Verificacao de Conexao Filial: CNPJ - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Conferencia dos lancamentos
  if Identificador = 1000 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1000 - Conferencia de Lancamentos');

       Result := 'True';
       CdsNumeroLancamentos.Close;
       CdsNumeroLancamentos.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroLancamentos.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1000 - Conferindo Numero de Lancamentos ');
       Result := CdsNumeroLancamentosCOUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Lancamentos - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Conferencia do caixa
  if Identificador = 1001 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1001 - Conferencia de Caixa');

       Result := 'True';
       CdsNumeroCaixa.Close;
       CdsNumeroCaixa.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroCaixa.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1001 - Conferindo Numero de Caixas ');
       Result := CdsNumeroCaixaCOUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Caixa - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envio dos Codigos dos Lancamentos
  if Identificador = 1002 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1002 - Envio de Codigos dos Lancamentos');

       Result := 'True';
       CdsCdLancamento.Close;
       CdsCdLancamento.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsCdLancamento.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1002 - Enviando Codigos de Lancamentos: ' + FloatToStr(CdsCdLancamento.RecordCount));
       Result := CdsCdLancamento.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Codigos de Lancamentos - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else


  //Conferencia dos lancamentos A PRAZO
  if Identificador = 1012 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1012 - Conferencia de Lancamentos a Prazo');

       Result := 'True';
       CdsNumeroLancamentosAPrazo.Close;
       CdsNumeroLancamentosAPrazo.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroLancamentosAPrazo.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1012 - Conferindo Numero de Lancamentos a Prazo');
       Result := CdsNumeroLancamentosAPrazoCOUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Lancamentos a Prazo - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envio dos Codigos dos Lancamentos A PRAZO
  if Identificador = 1013 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1013 - Envio de Codigos de Lancamentos a Prazo');

       Result := 'True';
       CdsCdLancamentoAPrazo.Close;
       CdsCdLancamentoAPrazo.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsCdLancamentoAPrazo.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1013 - Enviando Codigos de Lancamentos a Prazo: ' + FloatToStr(CdsCdLancamento.RecordCount));
       Result := CdsCdLancamentoAPrazo.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Codigos de Lancamentos a Prazo - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else


  //Envio dos Codigos do Caixa
  if Identificador = 1003 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1003 - Envio de Codigos do Caixa');

       Result := 'True';
       CdsCdCaixa.Close;
       CdsCdCaixa.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsCdCaixa.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1003 - Enviando Codigos de Caixa: ' + FloatToStr(CdsCdCaixa.RecordCount));
       Result := CdsCdCaixa.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Codigos do Caixa - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Conferencia das Transferencias
  if Identificador = 1004 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1004 - Conferencia de Transferencias');

       Result := 'True';
       CdsNumeroTransfer.Close;
       CdsNumeroTransfer.Params[0].AsFloat := Filial;
       CdsNumeroTransfer.Params[1].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroTransfer.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1004 - Conferindo Transferencias');
       Result := CdsNumeroTransferCOUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia das Transferencias - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Conferencia de ItensTransfer
  if Identificador = 1005 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1005 - Conferencia de Itens das Transferencias');

       Result := 'True';
       CdsNumeroItensTransfer.Close;
       CdsNumeroItensTransfer.Params[0].AsFloat := Filial;
       CdsNumeroItensTransfer.Params[1].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroItensTransfer.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1005 - Conferindo Itens de Transferencias ');
       Result := CdsNumeroItensTransferCOUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Itens Transferencia - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envio dos Codigos das Transferencias
  if Identificador = 1006 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1006 - Envio de Codigos das Transferencias');

       Result := 'True';
       CdsCdTransfer.Close;
       CdsCdTransfer.Params[0].AsFloat := Filial;
       CdsCdTransfer.Params[1].AsFloat := Filial;
       AbreTransacao;
       CdsCdTransfer.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1006 - Conferindo Codigos de Transferencias ');
       Result := CdsCdTransfer.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Codigo das Transferencias - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envio dos Codigos de ItensTransfer
  if Identificador = 1007 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1007 - Envio de Codigos dos Itens das Transfencias');

       Result := 'True';
       CdsCdItensTransfer.Close;
       CdsCdItensTransfer.Params[0].AsFloat := Filial;
       CdsCdItensTransfer.Params[1].AsFloat := Filial;
       AbreTransacao;
       CdsCdItensTransfer.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - 1007 -  ' + strFilial + ' - Processo = 1007 - Conferindo Itens de Transferencias: ' + FloatToStr(CdsGruposCompras.RecordCount));
       Result := CdsCdItensTransfer.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - 1007 - ' + strFilial +  ' - Erro no processo de Codigo de Itens Transferencias - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Conferencia dos Contas a Receber
  if Identificador = 1008 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1008 - Conferencia de Contas a Receber');

       Result := 'True';
       CdsNumeroContasReceber.Close;
       CdsNumeroContasReceber.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroContasReceber.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1008 - Conferindo Numero de Contas a Receber');
       Result := CdsNumeroContasReceberCOUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Contas a Receber - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envio dos Codigos das Contas a Receber
  if Identificador = 1009 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1009 - Envio de Codigos das Contas a Receber');

       Result := 'True';
       CdsCdContasReceber.Close;
       CdsCdContasReceber.Params[0].AsFloat := Filial;
       AbreTransacao;
       CdsCdContasReceber.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1009 - Enviando Codigos de Contas a Receber');
       Result := CdsCdContasReceber.Data;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Codigos de Contas a Receber - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envio de Codigos de Produtos - Exclusao
  if Identificador = 10109999 then
   begin
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10109999 - Envio de Codigo de Produtos para Exclusao');

     Result := null;
     Try
       Result := 'True';
       CdsIdProduto.Close;
       CdsIdProduto.Open;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1010 - Enviando Id_Produto para Conferencia ');
       Result := CdsIdProduto.Data;
       CdsIdProduto.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsIdProduto.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Codigos de Produtos - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Envio de Codigos de Produtos - Inclusao
  if Identificador = 10119999 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10119999 - Envio de Codigo dos Produtos para Inclusao');

       CdsIdProdutoLoja.Close;
       CdsIdProdutoLoja.Data := Cds;
       CdsIdProdutoLoja.Open;
       GravaLog(InttoStr(CdsIdProdutoLoja.RecordCount));
       if CdsIdProdutoLoja.RecordCount > 0 then
        begin
          SqlProdutosLojaInc.CommandText := 'SELECT * FROM PRODUTOS WHERE ';
          CdsIdProdutoLoja.First;
          while not CdsIdProdutoLoja.Eof do
           begin
             if Pos('ID_PRODUTO', SqlProdutosLojaInc.CommandText) > 0 then
                SqlProdutosLojaInc.CommandText := SqlProdutosLojaInc.CommandText + ' OR ID_PRODUTO =  ' + CdsIdProdutoLojaID_PRODUTO.AsString
             else
                SqlProdutosLojaInc.CommandText := SqlProdutosLojaInc.CommandText + ' ID_PRODUTO =  ' + CdsIdProdutoLojaID_PRODUTO.AsString;
             CdsIdProdutoLoja.Next;
           end;
          //GravaLog(SqlProdutosLojaInc.CommandText);
          CdsProdutosLojaInc.Open;
          if CdsProdutosLojaInc.RecordCount > 0 then
             GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 1011 - Enviando Produtos para inclusao: ' + InttoStr(CdsProdutosLojaInc.RecordCount));
          if CdsProdutosLojaInc.RecordCount > 0 then
             Result := CdsProdutosLojaInc.Data
          else
             Result := null;
        end;
       CdsProdutosLojaInc.Close;
       CdsIdProduto.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsIdProduto.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Codigos de Produtos - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else


  // Processos de verificação de consistencia dos cadastros
  if Identificador = 2001 then // Classes
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2001 - Consistencia de Classes ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_CLASSE FROM CLASSES WHERE CD_CLASSE = :CD_CLASSE';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('CLASSES') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_CLASSE FROM CLASSES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'UPDATE CLASSES SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CLASSE = ' + CdsMatriz.Fields[0].AsString;
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_CLASSE FROM CLASSES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'UPDATE CLASSES SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CLASSE = ' + CdsMatriz.Fields[0].AsString;
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;

       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Classes - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2002 then // Grupos
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2002 - Consistencia de Grupos ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_GRUPO FROM GRUPOS WHERE CD_GRUPO = :CD_GRUPO';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('GRUPOS') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_GRUPO FROM GRUPOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 100, ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_GRUPO FROM GRUPOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 100, ' + QuotedStr('') + ')';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Grupo - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2003 then // Laboratorios
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2003 - Consistencia de Laboratorios ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_LABORATORIO FROM LABORATORIOS WHERE CD_LABORATORIO = :CD_LABORATORIO';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('LABORATORIOS') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_LABORATORIO FROM LABORATORIOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 101, ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_LABORATORIO FROM LABORATORIOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 101, ' + QuotedStr('') + ')';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Laboratorio - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2004 then // Familias
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2004 - Consistencia de Familias ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT ID_FAMILIA FROM FAMILIAS WHERE ID_FAMILIA = :ID_FAMILIA';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('FAMILIAS') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT ID_FAMILIA FROM FAMILIAS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 129, ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT ID_FAMILIA FROM FAMILIAS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 129, ' + QuotedStr('') + ')';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Familia - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2005 then // Grupos Compras
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2005 - Consistencia de Grupos Compras ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_GRUPOCOMPRA FROM GRUPOSCOMPRAS WHERE CD_GRUPOCOMPRA = :CD_GRUPOCOMPRA';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('GRUPOSCOMPRAS') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_GRUPOCOMPRA FROM GRUPOSCOMPRAS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'UPDATE GRUPOSCOMPRAS SET DT_ALTERACAO = CURRENT_DATE';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_GRUPOCOMPRA FROM GRUPOSCOMPRAS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'UPDATE GRUPOSCOMPRAS SET DT_ALTERACAO = CURRENT_DATE';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Grupo Compra - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2006 then // Grupo Balanco
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2006 - Consistencia de Grupos Balanco ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_GRUPOBALANCO FROM GRUPOSBALANCO WHERE CD_GRUPOBALANCO = :CD_GRUPOBALANCO';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('GRUPOSBALANCO') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_GRUPOBALANCO FROM GRUPOSBALANCO';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'UPDATE GRUPOSBALANCO SET DT_ALTERACAO = CURRENT_DATE';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_GRUPOBALANCO FROM GRUPOSBALANCO';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'UPDATE GRUPOSBALANCO SET DT_ALTERACAO = CURRENT_DATE';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Grupo Balanco - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2007 then // Distribuidores
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2007 - Consistencia de Distribuidores ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_DISTRIBUIDOR FROM DISTRIBUIDORES WHERE CD_DISTRIBUIDOR = :CD_DISTRIBUIDOR';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('DISTRIBUIDORES') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_DISTRIBUIDOR FROM DISTRIBUIDORES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 114, ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_DISTRIBUIDOR FROM DISTRIBUIDORES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 114, ' + QuotedStr('') + ')';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Distribuidores - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2008 then // Cartoes
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2008 - Consistencia de Cartoes ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_CARTAO FROM CARTOES WHERE CD_CARTAO = :CD_CARTAO';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('CARTOES') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_CARTAO FROM CARTOES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'UPDATE CARTOES SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CARTAO = ' + CdsMatriz.Fields[0].AsString;
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_CARTAO FROM CARTOES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'UPDATE CARTOES SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CARTAO = ' + CdsMatriz.Fields[0].AsString;
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Cartoes - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2009 then // Plano Contas
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2009 - Consistencia de Plano Contas ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_PLANO_CONTAS FROM PLANO_CONTAS WHERE CD_PLANO_CONTAS = :CD_PLANO_CONTAS';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('PLANO_CONTAS') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_PLANO_CONTAS FROM PLANO_CONTAS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 109, ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_PLANO_CONTAS FROM PLANO_CONTAS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[0].AsString + ', ' + StrFilial + ', 109, ' + QuotedStr('') + ')';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Plano Contas - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2010 then // Vendedores
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2010 - Consistencia de Vendedores ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_VENDEDOR FROM VENDEDORES WHERE CD_VENDEDOR = :CD_VENDEDOR';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('VENDEDORES') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_VENDEDOR FROM VENDEDORES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'UPDATE VENDEDORES SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_VENDEDOR = ' + CdsMatriz.Fields[0].AsString;
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_VENDEDOR FROM VENDEDORES';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'UPDATE VENDEDORES SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_VENDEDOR = ' + CdsMatriz.Fields[0].AsString;
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Vendedores - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2011 then // Convenios
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2011 - Consistencia de Convenios ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_CONVENIO FROM CONVENIOS WHERE CD_CONVENIO = :CD_CONVENIO';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('CONVENIOS') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_CONVENIO FROM CONVENIOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'UPDATE CONVENIOS SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CONVENIO = ' + CdsMatriz.Fields[0].AsString;
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_CONVENIO FROM CONVENIOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'UPDATE CONVENIOS SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CONVENIO = ' + CdsMatriz.Fields[0].AsString;
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Convenios - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  {if Identificador = 2012 then // Clientes
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2012 - Consistencia de Clientes ');
       SqlMatriz.CommandText := 'SELECT CD_CLIENTE FROM CLIENTES WHERE CD_CLIENTE IN ' +
                                '(SELECT DISTINCT CD_CLIENTE FROM CONTAS_RECEBER WHERE CD_FORMA_PAGAMENTO > 2 AND STATUS = ' + QuotedStr('A') + ')';
       CdsMatriz.Params.Clear;
       CdsMatriz.FetchParams;
       CdsMatriz.Open;
       Result := CdsMatriz.Data;
       CdsMatriz.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Clientes - '+ E.Message);
            Result := null;
          end;
     End;
   end
  else}

  if Identificador = 2013 then // Contas a Receber
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2013 - Consistencia de Contas a Receber ');
       CdsMatriz.Close;
       SqlMatriz.CommandText := 'SELECT CD_CONTAS_RECEBER FROM CONTAS_RECEBER WHERE ' +
                                '(DT_LANCAMENTO >= CURRENT_DATE - ' + Dias + ') AND ' +
                                '(((CD_FORMA_PAGAMENTO = 3) OR (CD_FORMA_PAGAMENTO = 5) OR (CD_FORMA_PAGAMENTO IS NULL)) OR ' +
                                '(((CD_FORMA_PAGAMENTO = 2) OR (CD_FORMA_PAGAMENTO = 4) OR (CD_FORMA_PAGAMENTO = 6)) AND (CD_FILIAL = ' + StrFilial + ')))';
       CdsMatriz.Open;
       if CdsMatriz.RecordCount > 0 then
          begin
            CdsMatriz.Append;
            CdsMatriz.Fields[0].AsFloat := StrToFloat(Dias);
            CdsMatriz.Post;
            Result := CdsMatriz.Data;
          end
       else
          Result := null;
       CdsMatriz.Close;   
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Contas a Receber - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2014 then // Contas a Receber
   begin
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2014 - Consistencia de Contas a Receber ');

     Try
       Sql1.CommandText := 'ALTER TRIGGER TG_AT_DT_ALTERACAO_CR ACTIVE';
       Sql1.ExecSQL(True);
     Except
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2014 - Erro no processo de Consistencia de Contas a Receber - Ativando Trigger');
     End;

     Try
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.SaveToFile(ExtractFilePath(Application.ExeName)+'Importacao\ConsistenciaCR_'+ strFilial + '_' +FormatDateTime('yyyymmddhhmmss',Now)+'.xml', dfXML);

{      CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             Sql1.CommandText := 'UPDATE CONTAS_RECEBER SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_CONTAS_RECEBER = ' + CdsLoja.Fields[0].AsString;
             Sql1.ExecSQL(True);
             CdsLoja.Next;
           end;
        end;
       CdsLoja.Close;}
       Result := 'True';
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Contas a Receber - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2015 then // Usuarios
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2015 - Consistencia de Usuarios ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_USUARIO FROM USUARIOS WHERE CD_USUARIO = :CD_USUARIO';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('USUARIOS') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[0].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_USUARIO FROM USUARIOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'UPDATE USUARIOS SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_USUARIO = ' + CdsMatriz.Fields[0].AsString;
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT CD_USUARIO FROM USUARIOS';
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'UPDATE USUARIOS SET ENVIADO = ' + QuotedStr('') + ' WHERE CD_USUARIO = ' + CdsMatriz.Fields[0].AsString;
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Usuarios - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2016 then // Produtos Preço Quantidade
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2016 - Consistencia de Produtos Preço Quantidade ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT ID_PRODUTO, QUANTIDADEINICIAL FROM FILIAIS_PRECO_QUANTIDADE ' +
                                   'WHERE CD_FILIAL = ' + StrFilial +' AND ID_PRODUTO = :ID_PRODUTO AND QUANTIDADEINICIAL = :QUANTIDADEINICIAL';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('PRODUTOS_PRECO_QUANTIDADE') + ', ' +
                                     CdsLoja.Fields[0].AsString + ', ' + CdsLoja.Fields[1].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT ID_PRODUTO, QUANTIDADEINICIAL FROM PRODUTOS_PRECO_QUANTIDADE WHERE CD_FILIAL = ' +  StrFilial;
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if (CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat) AND
                   (CdsMatriz.Fields[1].AsFloat = CdsLoja.Fields[1].AsFloat) then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS_QUANTIDADE VALUES (' + StrFilial + ', ' + CdsMatriz.Fields[0].AsString + ', ' + CdsMatriz.Fields[1].AsString + ')';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT ID_PRODUTO, QUANTIDADEINICIAL FROM FILIAIS_PRECO_QUANTIDADE WHERE CD_FILIAL = ' + StrFilial;
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS_QUANTIDADE VALUES (' + StrFilial + ', ' + CdsMatriz.Fields[0].AsString + ', ' + CdsMatriz.Fields[0].AsString + ')';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Produtos Preço Quantidade - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 2017 then // Produtos Fidelidade
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 2017 - Consistencia de Produtos Fidelidade ');
       CdsLoja.Close;
       CdsLoja.Data := Cds;
       CdsLoja.Open;
       if CdsLoja.RecordCount > 0 then
        begin
          SqlMatriz.CommandText := 'SELECT CD_FILIAL, ID_PRODUTO FROM FILIAIS_FIDELIDADE WHERE CD_FILIAL = ' + StrFilial + ' AND ID_PRODUTO = :ID_PRODUTO';
          CdsMatriz.Params.Clear;
          CdsMatriz.FetchParams;
          CdsLoja.First;
          while not CdsLoja.Eof do
           begin
             CdsMatriz.Close;
             CdsMatriz.Params[0].AsFloat := CdsLoja.Fields[0].AsFloat;
             CdsMatriz.Open;
             if CdsMatriz.RecordCount = 0 then
              begin
                Sql1.CommandText := 'INSERT INTO DELETADOS VALUES (' + strFilial + ', ' + QuotedStr('USUARIOS') + ', ' +
                                     CdsLoja.Fields[1].AsString + ', ' + CdsLoja.Fields[1].AsString + ', ' +
                                     QuotedStr(FormatDateTime('mm/dd/yyyy', Date)) + ', ' + QuotedStr(FormatDateTime('hh:mm', Time)) + ', ' +
                                     QuotedStr('CONSISTENCIA') + ', ' + QuotedStr('') + ')';
                Sql1.ExecSQL(True);
              end;
             CdsLoja.Next;
           end;
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT ID_PRODUTO FROM FILIAIS_FIDELIDADE WHERE CD_FILIAL = ' + StrFilial;
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             GeraTemp := True;
             CdsLoja.First;
             while not CdsLoja.Eof do
              begin
                if (CdsMatriz.Fields[0].AsFloat = CdsLoja.Fields[0].AsFloat) then
                 begin
                   GeraTemp := False;
                   Break;
                 end;
                CdsLoja.Next;
              end;
             if GeraTemp then
              begin
                Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[1].AsString + ' , ' + StrFilial + ', 158, '''')';
                Sql1.ExecSQL(True);
              end;
             CdsMatriz.Next;
           end;
          Result := 'True';
        end
       else
        begin
          CdsMatriz.Close;
          SqlMatriz.CommandText := 'SELECT ID_PRODUTO FROM FILIAIS_FIDELIDADE WHERE CD_FILIAL = ' + StrFilial;
          CdsMatriz.Params.Clear;
          CdsMatriz.Open;
          CdsMatriz.First;
          while not CdsMatriz.Eof do
           begin
             Sql1.CommandText := 'INSERT INTO TEMP_PRODUTOS VALUES (' + CdsMatriz.Fields[1].AsString + ' , ' + StrFilial + ', 158, '''')';
             Sql1.ExecSQL(True);
             CdsMatriz.Next;
           end;
        end;
       CdsLoja.Close;
       CdsMatriz.Close;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            CdsLoja.Close;
            CdsMatriz.Close;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Consistencia de Produtos Fidelidade - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  // Processos de verificação de consistencia dos cadastros


  //Conferencia dos lancamentos
  if Identificador = 10000 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10000  - Conferencia dos Lancamentos');

       Result := 'True';
       DataInicial := Copy(Cds, 1, 2) + '/' + Copy(Cds, 3, 2) + '/' + Copy(Cds, 5, 4);
       DataFinal := Copy(Cds, 9, 2) + '/' + Copy(Cds, 11, 2) + '/' + Copy(Cds, 13, 4);
       CdsNumeroLancamentos2.Close;
       CdsNumeroLancamentos2.Params[0].AsString := DataInicial;
       CdsNumeroLancamentos2.Params[1].AsString := DataFinal;
       CdsNumeroLancamentos2.Params[2].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroLancamentos2.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10000 - Enviando NumeroLancamentos ');
       Result := CdsNumeroLancamentos2COUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Lancamentos - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  //Conferencia dos caixas
  if Identificador = 10001 then
   begin
     Try
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10001  - Conferencia de Caixas');

       Result := 'True';
       DataInicial := Copy(Cds, 1, 2) + '/' + Copy(Cds, 3, 2) + '/' + Copy(Cds, 5, 4);
       DataFinal := Copy(Cds, 9, 2) + '/' + Copy(Cds, 11, 2) + '/' + Copy(Cds, 13, 4);
       CdsNumeroCaixa2.Close;
       CdsNumeroCaixa2.Params[0].AsString := DataInicial;
       CdsNumeroCaixa2.Params[1].AsString := DataFinal;
       CdsNumeroCaixa2.Params[2].AsFloat := Filial;
       AbreTransacao;
       CdsNumeroCaixa2.Open;
       ConfirmaTransacao;
       GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 10001 - Enviando NumeroCaixa');
       Result := CdsNumeroCaixa2COUNT.AsInteger;
       SQLConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Conferencia de Caixa - '+ E.Message);
            Result := null;
            SQLConnection1.Close;
          end;
     End;
     SQLConnection1.Close;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 90001 then
   begin
      GravaLogAcesso(FormatDateTime('hh:mm:ss', Time) + ' - Loja ' + strFilial + ' - Processo = 90001  - LogAcesso');

      Dados := Cds;
      Id_Cliente := Copy(Dados, 1, Pos(';', Dados) - 1);
      Delete(Dados, 1, Pos(';', Dados));
      Maquina := Copy(Dados, 1, Pos(';', Dados) - 1);
      Delete(Dados, 1, Pos(';', Dados));
      Usuario := Copy(Dados, 1, Pos(';', Dados) - 1);
      Delete(Dados, 1, Pos(';', Dados));
      Versao := Copy(Dados, 7, Pos(';', Dados) - 7);
      Delete(Dados, 1, Pos(';', Dados));
      CNPJ := Copy(Dados, 1, Pos(';', Dados) - 1);
      Delete(Dados, 1, Pos(';', Dados));
      Razao := Copy(Dados, 1, Pos(';', Dados) - 1);
      Delete(Dados, 1, Pos(';', Dados));
      Telefone := Copy(Dados, 1, Length(Dados));

      CdsAcesso.Close;
      CdsAcesso.Open;
      CdsAcesso.Append;
      CdsAcessoDATA.AsDateTime := Date;
      CdsAcessoHORA.AsDateTime := Time;
      CdsAcessoID_ACESSO.AsFloat := RetornaID('ID_ACESSO');
      CdsAcessoID_CLIENTE.AsFloat := StrtoFloat(Id_Cliente);
      CdsAcessoMAQUINA.AsString := Maquina;
      CdsAcessoUSUARIO.AsString := Usuario;
      CdsAcessoVERSAO.AsString := Versao;
      CdsAcessoCNPJ.AsString := CNPJ;
      CdsAcessoRAZAO.AsString := Razao;
      CdsAcessoTELEFONE.AsString := Telefone;
      CdsAcesso.Post;
      CdsAcesso.ApplyUpdates(0);
      CdsAcesso.Close;

      CdsParametrosFarmax.Open;
      Result := CdsParametrosFarmaxVERSAO_GESTOR.AsString + ';' + CdsParametrosFarmaxVERSAO_LOJA.AsString;
      CdsParametrosFarmax.Close;
   end
  else

  if Identificador = 90002 then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja ' + strFilial + ' - Processo = 90002  - Interligacao');

         CdsInterligacao.Close;
         AbreTransacao;
         CdsInterligacao.Open;
         ConfirmaTransacao;
         if CdsInterligacao.RecordCount > 0 then
            Result := CdsInterligacao.Data
         else
            Result := Null;
         CdsInterligacao.Close;
         SqlConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja ' + strFilial +  ' - Erro no processo de Interligacao (SoftTech) - '+ E.Message);
            Result := null;
            CdsInterligacao.Close;
            SQLConnection1.Close;
          end;
     End;
     //GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 90003 then
   begin
     Try
         GravaLogFarmaSoft(FormatDateTime('hh:mm:ss', Time) + ' - Loja ' + strFilial + ' - 90003 Verifica Financeiro');

         ClientDataSet1.Close;
         SQLDataSet1.CommandText := 'SELECT STATUS FROM CLIENTES WHERE ID_CLIENTE = ' + strFilial + ' AND CNPJ = ' + QuotedStr(Cds);
         ClientDataSet1.Params.Clear;
         ClientDataSet1.Open;

         //acrescentada flag 'S' para SUSPENDER acesso de uma loja a criterio da FarmaSoft
         if (ClientDataSet1.RecordCount = 0) or (ClientDataSet1.Fields[0].AsString = 'I') or (ClientDataSet1.Fields[0].AsString = 'S')then
          begin
            Result := 'INATIVO';
            GravaLogFarmaSoft(FormatDateTime('hh:mm:ss', Time) + ' - Loja ' + strFilial + ' - 90003 Verifica Financeiro com Retorno INATIVO');
            Exit;
          end;

         CdsDuplicatas.Close;
         CdsDuplicatas.Params[0].AsFloat := Filial;
         CdsDuplicatas.Params[1].AsString := Cds;
         CdsDuplicatas.Params[2].AsDate := Date - 5;
         AbreTransacao;
         CdsDuplicatas.Open;
         ConfirmaTransacao;
         {CdsDuplicatas.Filter := 'DT_VENC <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', Date - 5));
         CdsDuplicatas.Filtered := True;}
         if CdsDuplicatas.RecordCount > 0 then
            Result := CdsDuplicatas.Data
         else
            Result := Null;
         CdsDuplicatas.Close;
         SqlDuplicatas.CommandText := Sql;
         SqlConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLogFarmaSoft(FormatDateTime('hh:mm:ss', Time) + ' - Loja ' + strFilial +  ' - Erro no processo de Verificação do Financeiro (SoftTech) - '+ E.Message);
            GravaLogFarmaSoft(FormatDateTime('hh:mm:ss', Time) + ' - Loja ' + strFilial +  ' - ' + SqlDuplicatas.Filter);
            Result := '';
            CdsDuplicatas.Close;
            SQLConnection1.Close;
          end;
     End;
//   GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');  //comentado por GML 20230516
   end
  else

  if Identificador = 90004 then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 90004  - Boletos Farmax');

         Result := '';
         if Dados <> Null then
          begin
            CdsLogBoletosVirtual.Close;
            CdsLogBoletosVirtual.Data := Cds;
            CdsLogBoletosVirtual.Open;
            if CdsLogBoletosVirtual.RecordCount > 0 then
             begin
                CdsLogBoletos.Close;
                CdsLogBoletos.Open;
                CdsLogBoletosVirtual.First;
                while not CdsLogBoletosVirtual.Eof do
                 begin
                    CdsLogBoletos.Append;
                    CdsLogBoletosCHEQUE.AsString := CdsLogBoletosVirtualCHEQUE.AsString;
                    CdsLogBoletosDATAGERACAO.AsDateTime := CdsLogBoletosVirtualDATAGERACAO.AsDateTime;
                    CdsLogBoletosDATAVENCIMETNO.AsDateTime := CdsLogBoletosVirtualDATAVENCIMETNO.AsDateTime;
                    CdsLogBoletosHORAGERACAO.AsDateTime := CdsLogBoletosVirtualHORAGERACAO.AsDateTime;
                    CdsLogBoletosID_CLIENTE.AsFloat := CdsLogBoletosVirtualID_CLIENTE.AsFloat;
                    CdsLogBoletosVALORBOLETO.AsFloat := CdsLogBoletosVirtualVALORBOLETO.AsFloat;
                    CdsLogBoletosVALORREAL.AsFloat := CdsLogBoletosVirtualVALORREAL.AsFloat;
                    CdsLogBoletos.Post;

                    CdsLogBoletosVirtual.Next;
                 end;
                CdsLogBoletos.ApplyUpdates(0);
             end;
          end;

         CdsLogBoletos.Close;
         CdsLogBoletosVirtual.Close;
         SqlConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Geração de LogBoleto (SoftTech) - '+ E.Message);
            Result := '';
            CdsLogBoletos.Close;
            CdsLogBoletosVirtual.Close;
            SQLConnection1.Close;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 90005 then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Processo = 90005  - Duplicatas Farmax');

         CdsDuplicatas.Close;
         CdsDuplicatas.Params[0].AsFloat := Filial;
         CdsDuplicatas.Params[1].AsString := Cds;
         AbreTransacao;
         CdsDuplicatas.Open;
         ConfirmaTransacao;
         if CdsDuplicatas.RecordCount > 0 then
            Result := CdsDuplicatas.Data
         else
            Result := Null;
         CdsDuplicatas.Close;
         SqlConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Verificação do Financeiro (SoftTech) - '+ E.Message);
            Result := '';
            CdsDuplicatas.Close;
            SQLConnection1.Close;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end
  else

  if Identificador = 90100 then
   begin
     Try
         GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - Loja : ' + InttoStr(Filial)  + ' - Código de Barras : ' + Cds + ' - Processo = 90100  - Dicionário Farmax');

         CdsDicionarioFarmax.Close;
         CdsDicionarioFarmax.Params[0].AsString := Cds;
         AbreTransacao;
         CdsDicionarioFarmax.Open;
         ConfirmaTransacao;
         if CdsDicionarioFarmax.RecordCount > 0 then
            Result := CdsDicionarioFarmax.Data
         else
            Result := Null;
         CdsDicionarioFarmax.Close;
         SqlConnection1.Close;
     Except
         on E:Exception do
          begin
            CancelaTransacao;
            GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial +  ' - Erro no processo de Verificação do Dicionário Farmax - '+ E.Message);
            Result := '';
            CdsDicionarioFarmax.Close;
            SQLConnection1.Close;
          end;
     End;
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Fim');
   end;

  FecharTodosDataSets;
  
end;

function TDm.RetornaID(Campo: String): Extended;
begin
   Try
     Repeat
        CdsControle.Close;
        CdsControle.Params[0].AsString := UpperCase(Campo);
        CdsControle.Open;
        If CdsControle.RecordCount = 0 then
         begin
           CdsControle.Append;
           CdsControleCAMPO.AsString := UpperCase(Campo);
           CdsControleVALOR.AsFloat := 0;
           CdsControle.ApplyUpdates(0);
         end;
        CdsControle.Edit;
        CdsControleVALOR.AsFloat := CdsControleVALOR.AsFloat + 1;
        CdsControle.Post;
     Until CdsControle.ApplyUpdates(0) = 0;
   Finally
      Result := CdsControleVALOR.AsFloat;
      CdsControle.Close;
   End;
end;


procedure TDm.SQLConnection1BeforeConnect(Sender: TObject);
begin
   Try
      if not FileExists(ExtractFilePath(Application.ExeName) + 'ExporterServer.TXT') then
       begin
        AssignFile(Importer, ExtractFilePath(Application.ExeName) + 'ExporterServer.TXT');
        Rewrite(Importer);
        writeln(Importer, 'localhost:c:\farmaxwin\matriz.fdb');
        writeln(Importer, '30');
        CloseFile(Importer);
       end;

      AssignFile(Importer, ExtractFilePath(Application.ExeName) + 'ExporterServer.TXT');
      Reset(Importer);
      Readln(Importer, Caminho);
      ReadLn(Importer, Dias);
      CloseFile(Importer);

      if StrtoFloatDef(Dias, 0) = 0 then
         Dias := '30';

      SQLConnection1.Params.Values['Database'] := Caminho;

      CaminhoBanco := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CaminhoBD.Ini');
      Senha := CaminhoBanco.ReadString('FARMAX', 'FARMAX', '');
      CaminhoBanco.Free;
      if Senha <> '' then
         SQLConnection1.Params.Values['Password'] := Crypt('D', Senha)
      else
         SQLConnection1.Params.Values['Password'] := 'masterkey';
  Except
     GravaLog('Erro em BeforeConnect');
  End;
end;

procedure TDm.SoapDataModuleCreate(Sender: TObject);
begin
  TD.TransactionID := 1;
  TD.IsolationLevel := xilREADCOMMITTED;
end;

procedure TDm.AbreTransacao;
begin
 if SQLConnection1.InTransaction then
  begin
    SQLConnection1.Rollback(TD);
  end;
 SQLConnection1.StartTransaction(TD);
end;

procedure TDm.CancelaTransacao;
begin
 if SQLConnection1.InTransaction then
  begin
    SQLConnection1.Rollback(TD);
  end;
end;

procedure TDm.ConfirmaTransacao;
begin
 if SQLConnection1.InTransaction then
  begin
    SQLConnection1.Commit(TD);
  end;
end;

// Função para Colocar zeros à esquerda de valores
function TDM.StrZero(Num : Real ; Zeros,Deci: integer): string;
var tam,z : integer;
    res,zer : string;
begin
   Str(Num:Zeros:Deci, res);
   res := Alltrim(res);
   tam := length(res);
   zer := '';
   for z := 1 to (Zeros-tam) do zer := zer + '0';
   Result := zer+res;
end;


function TDM.Alltrim(Text : string) : string;
begin
 while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
 Result := Text;
end;


procedure TDm.GravaLog(Texto: String);
begin
//  exit;
  AssignFile(Log, 'Logs\LogServer'+FormatDateTime('yyyymmdd', Date)+ '_' +Strzero(StrToFloat(StrFilial),4,0)+'.txt');
  if FileExists('Logs\LogServer'+FormatDateTime('yyyymmdd', Date)+ '_' +Strzero(StrToFloat(StrFilial),4,0)+'.txt') then
     Append(Log)
  else
     ReWrite(Log);
  Writeln(Log, Texto);
  //Flush(Log);
  CloseFile(Log);
end;

procedure TDm.GravaLogFarmaSoft(Texto: String);
begin
//  exit;
  AssignFile(Log, 'Logs\LogFinanceiro'+FormatDateTime('yyyymmdd', Date)+'.txt');
  if FileExists('Logs\LogFinanceiro'+FormatDateTime('yyyymmdd', Date)+'.txt') then
     Append(Log)
  else
     ReWrite(Log);
  Writeln(Log, Texto);
  //Flush(Log);
  CloseFile(Log);
end;

procedure TDm.GravaLogAcesso(Texto: String);
begin
//  exit;
  AssignFile(Log, 'Logs\LogAcesso'+FormatDateTime('yyyymmdd', Date)+'.txt');
  if FileExists('Logs\LogAcesso'+FormatDateTime('yyyymmdd', Date)+'.txt') then
     Append(Log)
  else
     ReWrite(Log);
  Writeln(Log, Texto);
  //Flush(Log);
  CloseFile(Log);
end;


procedure TDm.GravaLogRefresher(cMensagem: string);
var Log : TextFile;
begin
  if FileExists('Logs\LogRefresher' + FormatDateTime('yyyymmdd',Date) + '.txt') then
   begin
     AssignFile(Log, 'Logs\LogRefresher' + FormatDateTime('yyyymmdd',Date) + '.txt');
     Append(Log);
   end
  else
    begin
     AssignFile(Log, 'Logs\LogRefresher' + FormatDateTime('yyyymmdd',Date) + '.txt');
     Rewrite(Log);
     Writeln(Log, '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Iniciando o Dia ' + FormatDateTime('yyyymmdd',Date) + ' as ' + FormatDateTime('hh:mm:ss',Time) + ' horas');
    end;
  Writeln(Log, cMensagem);
  CloseFile(Log);
end;


procedure TDm.MontaSQL_Precos(Filial : String);
var
 ComandoSQL : String;
begin
  ComandoSQL := '';
  ComandoSQL := 'INSERT INTO TEMP_REAJUSTE SELECT FIRST 1000 * FROM REAJUSTE ' +
                'WHERE CD_FILIAL = ' + Filial + ' AND ENVIADO <> ' + QuotedStr('2');
  SqlPrecoVenda.CommandText := ComandoSql;
  SqlPrecoVenda.ExecSQL(True);

  ComandoSQL := '';
  ComandoSQL := 'UPDATE REAJUSTE SET ENVIADO = ' + QuotedStr('9') +
                ' WHERE CD_FILIAL = ' + Filial + ' AND ENVIADO <> ' + QuotedStr('2') + ' AND ID_PRODUTO IN (SELECT ID_PRODUTO FROM TEMP_REAJUSTE WHERE CD_FILIAL = ' + Filial + ')';
  SqlPrecoVenda.CommandText := ComandoSql;
  SqlPrecoVenda.ExecSQL(True);

  ComandoSQL := '';
  ComandoSQL := 'SELECT * ' +
                ' FROM TEMP_REAJUSTE ' +
                ' WHERE CD_FILIAL = ' + Filial;
  SqlPrecoVenda.CommandText := ComandoSQL;
  SqlPrecoVenda.Params.Clear;
  CriaCamposPrecos(Filial);
end;


procedure TDm.CriaCamposPrecos(sFilial : String);
var fIdProduto, fFilial, fPrecoAnterior, fPrecoNovo, fPrecoPromocaoAnterior, fPrecoPromocaoNovo : TFloatField;
    fVencimentoPromocaoAnterior, fVencimentoPromocaoNovo, fDataReajuste : TDateField;
    fReajustado, fEnviado, fUsuarioReajuste : TStringField;
begin
 fFilial               := TFloatField.Create(Self);
 fFilial.FieldName     := 'CD_FILIAL';
 fFilial.FieldKind     := fkData;
 fFilial.DisplayLabel  := 'CD_FILIAL';
 fFilial.Visible       := True;
 fFilial.Name          := CdsPrecoVenda.Name + fFilial.FieldName;
 fFilial.Index         := 0;
 fFilial.DataSet       :=  (CdsPrecoVenda as TDataSet);

 fIdProduto               := TFloatField.Create(Self);
 fIdProduto.FieldName     := 'ID_PRODUTO';
 fIdProduto.FieldKind     := fkData;
 fIdProduto.DisplayLabel  := 'ID_PRODUTO';
 fIdProduto.Visible       := True;
 fIdProduto.Name          := CdsPrecoVenda.Name + fIdProduto.FieldName;
 fIdProduto.Index         := 1;
 fIdProduto.DataSet       :=  (CdsPrecoVenda as TDataSet);

 fPrecoAnterior              := TFloatField.Create(Self);
 fPrecoAnterior.FieldName    := 'PRECO_ANTERIOR';
 fPrecoAnterior.FieldKind    := fkData;
 fPrecoAnterior.DisplayLabel := 'PRECO_ANTERIOR';
 fPrecoAnterior.Visible      := True;
 fPrecoAnterior.Name         := CdsPrecoVenda.Name + fPrecoAnterior.FieldName;
 fPrecoAnterior.Index        := 2;
 fPrecoAnterior.DataSet      := (CdsPrecoVenda as TDataSet);

 fPrecoNovo              := TFloatField.Create(Self);
 fPrecoNovo.FieldName    := 'PRECO_NOVO';
 fPrecoNovo.FieldKind    := fkData;
 fPrecoNovo.DisplayLabel := 'PRECO_NOVO';
 fPrecoNovo.Visible      := True;
 fPrecoNovo.Name         := CdsPrecoVenda.Name + fPrecoNovo.FieldName;
 fPrecoNovo.Index        := 3;
 fPrecoNovo.DataSet      := (CdsPrecoVenda as TDataSet);

 fPrecoPromocaoAnterior           := TFloatField.Create(Self);
 fPrecoPromocaoAnterior.FieldName := 'PRECO_PROMOCAO_ANTERIOR';
 fPrecoPromocaoAnterior.FieldKind := fkData;
 fPrecoPromocaoAnterior.DisplayLabel := 'PRECO_PROMOCAO_ANTERIOR';
 fPrecoPromocaoAnterior.Visible   := True;
 fPrecoPromocaoAnterior.Name      := CdsPrecoVenda.Name + fPrecoPromocaoAnterior.FieldName;
 fPrecoPromocaoAnterior.Index     := 4;
 fPrecoPromocaoAnterior.DataSet   := (CdsPrecoVenda as TDataSet);

 fPrecoPromocaoNovo           := TFloatField.Create(Self);
 fPrecoPromocaoNovo.FieldName := 'PRECO_PROMOCAO_NOVO';
 fPrecoPromocaoNovo.FieldKind := fkData;
 fPrecoPromocaoNovo.DisplayLabel := 'PRECO_PROMOCAO_NOVO';
 fPrecoPromocaoNovo.Visible   := True;
 fPrecoPromocaoNovo.Name      := CdsPrecoVenda.Name + fPrecoPromocaoNovo.FieldName;
 fPrecoPromocaoNovo.Index     := 5;
 fPrecoPromocaoNovo.DataSet   := (CdsPrecoVenda as TDataSet);

 fVencimentoPromocaoAnterior              := TDateField.Create(Self);
 fVencimentoPromocaoAnterior.FieldName    := 'VENCIMENTO_PROMOCAO_ANTERIOR';
 fVencimentoPromocaoAnterior.FieldKind    := fkData;
 fVencimentoPromocaoAnterior.DisplayLabel := 'VENCIMENTO_PROMOCAO_ANTERIOR';
 fVencimentoPromocaoAnterior.Visible      := True;
 fVencimentoPromocaoAnterior.Name         := CdsPrecoVenda.Name + fVencimentoPromocaoAnterior.FieldName;
 fVencimentoPromocaoAnterior.Index        := 6;
 fVencimentoPromocaoAnterior.DataSet      := (CdsPrecoVenda as TDataSet);

 fVencimentoPromocaoNovo              := TDateField.Create(Self);
 fVencimentoPromocaoNovo.FieldName    := 'VENCIMENTO_PROMOCAO_NOVO';
 fVencimentoPromocaoNovo.FieldKind    := fkData;
 fVencimentoPromocaoNovo.DisplayLabel := 'VENCIMENTO_PROMOCAO_NOVO';
 fVencimentoPromocaoNovo.Visible      := True;
 fVencimentoPromocaoNovo.Name         := CdsPrecoVenda.Name + fVencimentoPromocaoNovo.FieldName;
 fVencimentoPromocaoNovo.Index        := 7;
 fVencimentoPromocaoNovo.DataSet      := (CdsPrecoVenda as TDataSet);

 fReajustado              := TStringField.Create(Self);
 fReajustado.FieldName    := 'REAJUSTADO';
 fReajustado.FieldKind    := fkData;
 fReajustado.DisplayLabel := 'REAJUSTADO';
 fReajustado.Visible      := True;
 fReajustado.Name         := CdsPrecoVenda.Name + fReajustado.FieldName;
 fReajustado.Index        := 8;
 fReajustado.DataSet      := (CdsPrecoVenda as TDataSet);

 fDataReajuste              := TDateField.Create(Self);
 fDataReajuste.FieldName    := 'DATA_REAJUSTE';
 fDataReajuste.FieldKind    := fkData;
 fDataReajuste.DisplayLabel := 'DATA_REAJUSTE';
 fDataReajuste.Visible      := True;
 fDataReajuste.Name         := CdsPrecoVenda.Name + fDataReajuste.FieldName;
 fDataReajuste.Index        := 9;
 fDataReajuste.DataSet      := (CdsPrecoVenda as TDataSet);

 fUsuarioReajuste              := TStringField.Create(Self);
 fUsuarioReajuste.FieldName    := 'USUARIOREAJUSTE';
 fUsuarioReajuste.FieldKind    := fkData;
 fUsuarioReajuste.DisplayLabel := 'USUARIOREAJUSTE';
 fUsuarioReajuste.Visible      := True;
 fUsuarioReajuste.Name         := CdsPrecoVenda.Name + fUsuarioReajuste.FieldName;
 fUsuarioReajuste.Index        := 10;
 fUsuarioReajuste.DataSet      := (CdsPrecoVenda as TDataSet);

 fEnviado              := TStringField.Create(Self);
 fEnviado.FieldName    := 'ENVIADO';
 fEnviado.FieldKind    := fkData;
 fEnviado.DisplayLabel := 'ENVIADO';
 fEnviado.Visible      := True;
 fEnviado.Name         := CdsPrecoVenda.Name + fEnviado.FieldName;
 fEnviado.Index        := 11;
 fEnviado.DataSet      := (CdsPrecoVenda as TDataSet);

 CdsPrecoVenda.FieldDefs.Update;
end;


//envio de SMS aos tecnicos em caso de interrupcao dos servicos
procedure TDm.VerificaRefresher;
var
  Linha : String;
  Hora : TDateTime;
  Refresher : TextFile;
  Mensagem, Telefone, Usuario, Razao : String;
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'RefresherTime.TXT') then
      Exit;
  try
    AssignFile(Refresher, ExtractFilePath(Application.ExeName) + 'RefresherTime.TXT');
    Reset(Refresher);
    Readln(Refresher, Linha);
    CloseFile(Refresher);

    Hora := StrtoTimeDef(Linha, Now);
    if TimetoStr(Time - Hora) >= '01:30:00'  then
     begin
        ApagaProcessos('FarmaxRefr');
        CdsParametros.Open;
        Usuario := CdsParametrosCODIGOUSUARIO.AsString;
        Razao := Copy(CdsParametrosRAZAO.AsString, 1, 40);
        Telefone := CdsParametrosFONE.AsString;
        if (CdsParametrosSMSTECNICO.AsString <> '') then
          begin
            Mensagem := 'Importação de Dados parada no cliente "' + Usuario + ' - ' + Razao + ' - Tel. ' + Telefone + '".';
            EnviaSMS(CdsParametrosSMSTECNICO.AsString, Mensagem);
          end;
        CdsParametros.Close;
     end;
  except
  end;

  ////////////////////////////////////////////////////// verificacao dos enderecos do banco.... refresher.txt as vezes perde o conteudo.
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Refresher.TXT') then
   begin
    AssignFile(Refresher, ExtractFilePath(Application.ExeName) + 'Refresher.TXT');
    Rewrite(Refresher);
    Writeln(Refresher, 'localhost:c:\farmaxwin\farmax.fdb');
    CloseFile(Refresher);
   end;

  AssignFile(Refresher, ExtractFilePath(Application.ExeName) + 'Refresher.TXT');
  Reset(Refresher);
  Readln(Refresher, Caminho);
  CloseFile(Refresher);
  if Caminho = '' then
    begin
     CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'ExporterServer.txt'), PChar(ExtractFilePath(Application.ExeName) + 'Refresher.txt'), True);
     GravaLog(FormatDateTime('hh:mm:ss', Time) + ' - ' + strFilial + ' - Remontado o arquivo Refresher.txt por falha de conteudo...... ');
    end;
end;


procedure TDm.ApagaProcessos(sPrograma: string);
var
  SnapShot:THandle;
  pe:TProcessEntry32;
  codigo: string;
  processo: DWORD;
  C: integer;
begin
  SnapShot   := CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize  := sizeof(TProcessEntry32);
  Process32First(SnapShot,pe);
  codigo     := '';
  processo   := 0;
  // procura todos os Programa abertos
  repeat
    //if (String(pe.szExeFile) = sPrograma) then
    if Pos(UpperCase(sPrograma), UpperCase(ExtractFileName(pe.szExeFile))) > 0 then
      begin
        codigo := format('%x',[pe.th32ProcessID]);
        // Converte a string em dword
        for C:=1 to length(codigo) do
          begin
            processo := processo shl 4;
            if ord(codigo[C]) >= ord('A') then
              processo:=processo + (ord(codigo[C])-ord('A')+10)
            else
              processo:=processo + (ord(codigo[C])-ord('0'));
          end;
        // fecha o processo
        try
          GravaLogRefresher(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' >><<<>>><<<>>><<<>>><<<>>><<< - Derrubando o processo FarmaxRefresher por time-out...');
          TerminateProcess(OpenProcess($0001,false,processo),0); // $0001 = Process_Terminate.
          codigo     := '';
          processo   := 0;
        except
          //showmessage('Falha ao encerrar o processo !');
        end;
      end;
  until Process32Next(SnapShot,pe) = false;
end;



procedure TDm.SoapDataModuleDestroy(Sender: TObject);
begin
  SQLConnection1.CloseDataSets;
  SQLConnection1.Close;
end;

procedure TDm.FecharTodosDataSets;
var z, i : Integer;
begin
  for i := 0 to Application.ComponentCount - 1 do
     begin
       if Application.Components[i].ClassParent = TDataModule then
           if Assigned((Application.Components[i] as TDataModule)) then
              for z := 0 to (Application.Components[i] as TDataModule).ComponentCount - 1 do
                  if (Application.Components[i] as TDataModule).Components[z].ClassName = 'TClientDataSet' then
                       begin
                          FecharDataSet(((Application.Components[i] as TDataModule).Components[z] as TClientDataSet));
                          Application.ProcessMessages;
                       end;
     end;
   SQLConnection1.Close;
end;

Procedure FecharDataSet(Cds : TClientDataSet);
begin
  Cds.Close;
  Cds.IndexFieldNames := '';
  Cds.IndexName := '';
  Cds.Filter := '';
  Cds.Filtered := False;
end;



initialization
   InvRegistry.RegisterInvokableClass(TDm, TDmCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IDm));
end.

