unit uDmTrigger;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DBXpress;

type
  TDM = class(TDataModule)
    SqlCadFiliais: TSQLDataSet;
    SqlCadFiliaisNOME: TStringField;
    SqlCadFiliaisCD_FILIAL: TFloatField;
    SqlCadFiliaisRAZAO: TStringField;
    SqlCadFiliaisCNPJ: TStringField;
    SqlCadFiliaisINSCRICAO: TStringField;
    SqlCadFiliaisRUA: TStringField;
    SqlCadFiliaisBAIRRO: TStringField;
    SqlCadFiliaisCIDADE: TStringField;
    SqlCadFiliaisUF: TStringField;
    SqlCadFiliaisCEP: TStringField;
    SqlCadFiliaisFONE: TStringField;
    SqlCadFiliaisFONE_1: TStringField;
    SqlCadFiliaisFAX: TStringField;
    SqlCadFiliaisCONTATO: TStringField;
    SqlCadFiliaisCOMPROFAR: TStringField;
    SqlCadFiliaisITA: TStringField;
    SqlCadFiliaisINTERMED: TStringField;
    SqlCadFiliaisLUNAR: TStringField;
    SqlCadFiliaisFARMASERVICE: TStringField;
    SqlCadFiliaisPANARELLO: TStringField;
    SqlCadFiliaisPROFARMA: TStringField;
    SqlCadFiliaisFARMACRUZ: TStringField;
    SqlCadFiliaisRIODROGS: TStringField;
    SqlCadFiliaisJAN_ITENS: TFloatField;
    SqlCadFiliaisFEV_ITENS: TFloatField;
    SqlCadFiliaisMAR_ITENS: TFloatField;
    SqlCadFiliaisABR_ITENS: TFloatField;
    SqlCadFiliaisMAI_ITENS: TFloatField;
    SqlCadFiliaisJUN_ITENS: TFloatField;
    SqlCadFiliaisJUL_ITENS: TFloatField;
    SqlCadFiliaisAGO_ITENS: TFloatField;
    SqlCadFiliaisSET_ITENS: TFloatField;
    SqlCadFiliaisOUT_ITENS: TFloatField;
    SqlCadFiliaisNOV_ITENS: TFloatField;
    SqlCadFiliaisDEZ_ITENS: TFloatField;
    SqlCadFiliaisJAN_VALVENDA: TFloatField;
    SqlCadFiliaisFEV_VALVENDA: TFloatField;
    SqlCadFiliaisMAR_VALVENDA: TFloatField;
    SqlCadFiliaisABR_VALVENDA: TFloatField;
    SqlCadFiliaisMAI_VALVENDA: TFloatField;
    SqlCadFiliaisJUN_VALVENDA: TFloatField;
    SqlCadFiliaisJUL_VALVENDA: TFloatField;
    SqlCadFiliaisAGO_VALVENDA: TFloatField;
    SqlCadFiliaisSET_VALVENDA: TFloatField;
    SqlCadFiliaisOUT_VALVENDA: TFloatField;
    SqlCadFiliaisNOV_VALVENDA: TFloatField;
    SqlCadFiliaisDEZ_VALVENDA: TFloatField;
    SqlCadFiliaisJAN_VALCOMPRA: TFloatField;
    SqlCadFiliaisFEV_VALCOMPRA: TFloatField;
    SqlCadFiliaisMAR_VALCOMPRA: TFloatField;
    SqlCadFiliaisABR_VALCOMPRA: TFloatField;
    SqlCadFiliaisMAI_VALCOMPRA: TFloatField;
    SqlCadFiliaisJUN_VALCOMPRA: TFloatField;
    SqlCadFiliaisJUL_VALCOMPRA: TFloatField;
    SqlCadFiliaisAGO_VALCOMPRA: TFloatField;
    SqlCadFiliaisSET_VALCOMPRA: TFloatField;
    SqlCadFiliaisOUT_VALCOMPRA: TFloatField;
    SqlCadFiliaisNOV_VALCOMPRA: TFloatField;
    SqlCadFiliaisDEZ_VALCOMPRA: TFloatField;
    SqlCadFiliaisSTATUS: TStringField;
    SqlCadFiliaisCD_DISTRIBUIDOR: TFloatField;
    SqlCadFiliaisCD_CLIENTE: TFloatField;
    SqlCadFiliaisEMEFARMA: TStringField;
    SqlCadFiliaisJAMYR: TStringField;
    SqlCadFiliaisSERVIMED: TStringField;
    SqlCadFiliaisENDERECOWEB: TStringField;
    SqlCadFiliaisEXPORTAR: TStringField;
    SqlCadFiliaisMETROSQUADRADOS: TFloatField;
    SqlCadFiliaisNUMEROFUNCIONARIOS: TFloatField;
    SqlCadFiliaisNUMEROPDVS: TFloatField;
    SqlCadFiliaisDROGACENTER: TStringField;
    SqlCadFiliaisFLEXFARMA: TStringField;
    SqlCadFiliaisDPC: TStringField;
    SqlCadFiliaisNUMERO: TStringField;
    SqlCadFiliaisCOMPLEMENTO: TStringField;
    SqlCadFiliaisPHARMALINK: TStringField;
    SqlCadFiliaisANBFARMA: TStringField;
    SqlCadFiliaisAUDIFAR: TStringField;
    SqlCadFiliaisBRASDROGA: TStringField;
    SqlCadFiliaisCENTROAMERICA: TStringField;
    SqlCadFiliaisCD_MUNICIPIO: TStringField;
    DspCadFiliais: TDataSetProvider;
    CdsCadFiliais: TClientDataSet;
    CdsCadFiliaisCD_FILIAL: TFloatField;
    CdsCadFiliaisNOME: TStringField;
    CdsCadFiliaisCD_DISTRIBUIDOR: TFloatField;
    CdsCadFiliaisCD_CLIENTE: TFloatField;
    CdsCadFiliaisRAZAO: TStringField;
    CdsCadFiliaisCONTATO: TStringField;
    CdsCadFiliaisFONE: TStringField;
    CdsCadFiliaisFONE_1: TStringField;
    CdsCadFiliaisCNPJ: TStringField;
    CdsCadFiliaisINSCRICAO: TStringField;
    CdsCadFiliaisRUA: TStringField;
    CdsCadFiliaisBAIRRO: TStringField;
    CdsCadFiliaisCIDADE: TStringField;
    CdsCadFiliaisUF: TStringField;
    CdsCadFiliaisCEP: TStringField;
    CdsCadFiliaisCOMPROFAR: TStringField;
    CdsCadFiliaisITA: TStringField;
    CdsCadFiliaisINTERMED: TStringField;
    CdsCadFiliaisLUNAR: TStringField;
    CdsCadFiliaisFARMASERVICE: TStringField;
    CdsCadFiliaisPANARELLO: TStringField;
    CdsCadFiliaisPROFARMA: TStringField;
    CdsCadFiliaisFARMACRUZ: TStringField;
    CdsCadFiliaisRIODROGS: TStringField;
    CdsCadFiliaisSTATUS: TStringField;
    CdsCadFiliaisJAN_ITENS: TFloatField;
    CdsCadFiliaisFEV_ITENS: TFloatField;
    CdsCadFiliaisMAR_ITENS: TFloatField;
    CdsCadFiliaisABR_ITENS: TFloatField;
    CdsCadFiliaisMAI_ITENS: TFloatField;
    CdsCadFiliaisJUN_ITENS: TFloatField;
    CdsCadFiliaisJUL_ITENS: TFloatField;
    CdsCadFiliaisAGO_ITENS: TFloatField;
    CdsCadFiliaisSET_ITENS: TFloatField;
    CdsCadFiliaisOUT_ITENS: TFloatField;
    CdsCadFiliaisNOV_ITENS: TFloatField;
    CdsCadFiliaisDEZ_ITENS: TFloatField;
    CdsCadFiliaisJAN_VALVENDA: TFloatField;
    CdsCadFiliaisFEV_VALVENDA: TFloatField;
    CdsCadFiliaisMAR_VALVENDA: TFloatField;
    CdsCadFiliaisABR_VALVENDA: TFloatField;
    CdsCadFiliaisMAI_VALVENDA: TFloatField;
    CdsCadFiliaisJUN_VALVENDA: TFloatField;
    CdsCadFiliaisJUL_VALVENDA: TFloatField;
    CdsCadFiliaisAGO_VALVENDA: TFloatField;
    CdsCadFiliaisSET_VALVENDA: TFloatField;
    CdsCadFiliaisOUT_VALVENDA: TFloatField;
    CdsCadFiliaisNOV_VALVENDA: TFloatField;
    CdsCadFiliaisDEZ_VALVENDA: TFloatField;
    CdsCadFiliaisJAN_VALCOMPRA: TFloatField;
    CdsCadFiliaisFEV_VALCOMPRA: TFloatField;
    CdsCadFiliaisMAR_VALCOMPRA: TFloatField;
    CdsCadFiliaisABR_VALCOMPRA: TFloatField;
    CdsCadFiliaisMAI_VALCOMPRA: TFloatField;
    CdsCadFiliaisJUN_VALCOMPRA: TFloatField;
    CdsCadFiliaisJUL_VALCOMPRA: TFloatField;
    CdsCadFiliaisAGO_VALCOMPRA: TFloatField;
    CdsCadFiliaisSET_VALCOMPRA: TFloatField;
    CdsCadFiliaisOUT_VALCOMPRA: TFloatField;
    CdsCadFiliaisNOV_VALCOMPRA: TFloatField;
    CdsCadFiliaisDEZ_VALCOMPRA: TFloatField;
    CdsCadFiliaisFAX: TStringField;
    CdsCadFiliaisEMEFARMA: TStringField;
    CdsCadFiliaisJAMYR: TStringField;
    CdsCadFiliaisSERVIMED: TStringField;
    CdsCadFiliaisENDERECOWEB: TStringField;
    CdsCadFiliaisEXPORTAR: TStringField;
    CdsCadFiliaisMETROSQUADRADOS: TFloatField;
    CdsCadFiliaisNUMEROFUNCIONARIOS: TFloatField;
    CdsCadFiliaisNUMEROPDVS: TFloatField;
    CdsCadFiliaisDROGACENTER: TStringField;
    CdsCadFiliaisFLEXFARMA: TStringField;
    CdsCadFiliaisVirtualSelected: TBooleanField;
    CdsCadFiliaisDPC: TStringField;
    CdsCadFiliaisNUMERO: TStringField;
    CdsCadFiliaisCOMPLEMENTO: TStringField;
    CdsCadFiliaisPHARMALINK: TStringField;
    CdsCadFiliaisANBFARMA: TStringField;
    CdsCadFiliaisAUDIFAR: TStringField;
    CdsCadFiliaisBRASDROGA: TStringField;
    CdsCadFiliaisCENTROAMERICA: TStringField;
    CdsCadFiliaisCD_MUNICIPIO: TStringField;
    DsCadFiliais: TDataSource;
    SQlParametros: TSQLDataSet;
    SQlParametrosCD_FILIAL: TFloatField;
    SQlParametrosTIPO_LOJA: TStringField;
    SQlParametrosCD_VENDA: TFloatField;
    SQlParametrosSERVIDORMATRIZ: TStringField;
    SQlParametrosCHAVESINTEGRA: TStringField;
    SQlParametrosDT_IMPLANTACAO: TStringField;
    SQlParametrosDATAATUAL: TDateField;
    SQlParametrosESTOQUEMINIMO: TStringField;
    SQlParametrosDIASBLOQUEIOCLIENTE: TIntegerField;
    SQlParametrosBAIXAAUTOMATICACHEQUEPRE: TStringField;
    SQlParametrosCD_CONTA_BAIXA_CHEQUE: TFloatField;
    DspParametros: TDataSetProvider;
    CdsParametros: TClientDataSet;
    CdsParametrosCD_FILIAL: TFloatField;
    CdsParametrosTIPO_LOJA: TStringField;
    CdsParametrosCD_VENDA: TFloatField;
    CdsParametrosSERVIDORMATRIZ: TStringField;
    CdsParametrosCHAVESINTEGRA: TStringField;
    CdsParametrosDT_IMPLANTACAO: TStringField;
    CdsParametrosDATAATUAL: TDateField;
    CdsParametrosESTOQUEMINIMO: TStringField;
    CdsParametrosDIASBLOQUEIOCLIENTE: TIntegerField;
    CdsParametrosBAIXAAUTOMATICACHEQUEPRE: TStringField;
    CdsParametrosCD_CONTA_BAIXA_CHEQUE: TFloatField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    FloatField4: TFloatField;
    StringField7: TStringField;
    FloatField5: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    DateField2: TDateField;
    StringField11: TStringField;
    IntegerField2: TIntegerField;
    StringField12: TStringField;
    FloatField6: TFloatField;
    SqlMovimentoCaixa: TSQLDataSet;
    DspMovimentoCaixa: TDataSetProvider;
    CdsMovimentoCaixa: TClientDataSet;
    CdsMovimentoCaixaCD_MOVIMENTOCAIXA: TFloatField;
    CdsMovimentoCaixaCD_CONTA: TFloatField;
    CdsMovimentoCaixaDATA: TDateField;
    CdsMovimentoCaixaHISTORICO: TStringField;
    CdsMovimentoCaixaCD_CENTRO_CUSTO: TFloatField;
    CdsMovimentoCaixaTIPO_MOVIMENTO: TStringField;
    CdsMovimentoCaixaMESREFERENCIA: TStringField;
    CdsMovimentoCaixaANOREFERENCIA: TStringField;
    CdsMovimentoCaixaVALOR: TFloatField;
    CdsMovimentoCaixaCD_PLANO_CONTAS: TFloatField;
    CdsMovimentoCaixaDOCUMENTO: TStringField;
    CdsMovimentoCaixaCD_FILIAL: TFloatField;
    CdsMovimentoCaixaCD_CONTAS_PAGAR: TFloatField;
    CdsMovimentoCaixaATIVO: TStringField;
    CdsMovimentoCaixaVirtualFilial: TStringField;
    CdsMovimentoCaixaCD_CONTAS_RECEBER: TFloatField;
    SqlSaldo: TSQLDataSet;
    SqlSaldoCD_CONTA: TFloatField;
    SqlSaldoDATA: TDateField;
    SqlSaldoSALDO: TFloatField;
    DspSaldo: TDataSetProvider;
    CdsSaldo: TClientDataSet;
    CdsSaldoCD_CONTA: TFloatField;
    CdsSaldoDATA: TDateField;
    CdsSaldoSALDO: TFloatField;
    SqlCadContas: TSQLDataSet;
    SqlCadContasCD_CONTA: TFloatField;
    SqlCadContasCD_FILIAL: TFloatField;
    SqlCadContasBANCO: TStringField;
    SqlCadContasNOME_BANCO: TStringField;
    SqlCadContasAGENCIA: TStringField;
    SqlCadContasCONTA_CORRENTE: TStringField;
    SqlCadContasTITULAR: TStringField;
    SqlCadContasTIPO: TStringField;
    SqlCadContasSTATUS: TStringField;
    DspCadContas: TDataSetProvider;
    CdsCadContas: TClientDataSet;
    CdsCadContasCD_CONTA: TFloatField;
    CdsCadContasNOME_BANCO: TStringField;
    CdsCadContasAGENCIA: TStringField;
    CdsCadContasCONTA_CORRENTE: TStringField;
    CdsCadContasBANCO: TStringField;
    CdsCadContasTITULAR: TStringField;
    CdsCadContasCD_FILIAL: TFloatField;
    CdsCadContasTIPO: TStringField;
    CdsCadContasVirtualFilial: TStringField;
    CdsCadContasVirtualTipo: TStringField;
    CdsCadContasSTATUS: TStringField;
    DsCadContas: TDataSource;
    SqlBaixaAutomaticaChequePre: TSQLDataSet;
    DspBaixaAutomaticaChequePre: TDataSetProvider;
    CdsBaixaAutomaticaChequePre: TClientDataSet;
    CdsBaixaAutomaticaChequePreVirtualCliente: TStringField;
    CdsBaixaAutomaticaChequePreCD_CONTAS_RECEBER: TFloatField;
    CdsBaixaAutomaticaChequePreCD_CLIENTE: TFloatField;
    CdsBaixaAutomaticaChequePreCD_PLANO_CONTAS: TFloatField;
    CdsBaixaAutomaticaChequePreCD_FILIAL: TFloatField;
    CdsBaixaAutomaticaChequePreCD_CONVENIO: TFloatField;
    CdsBaixaAutomaticaChequePreCD_VENDEDOR: TFloatField;
    CdsBaixaAutomaticaChequePreCD_VENDA: TFloatField;
    CdsBaixaAutomaticaChequePreCD_FORMA_PAGAMENTO: TFloatField;
    CdsBaixaAutomaticaChequePreCD_CONTA: TFloatField;
    CdsBaixaAutomaticaChequePreCD_CARTAO: TFloatField;
    CdsBaixaAutomaticaChequePreCD_BORDERO: TFloatField;
    CdsBaixaAutomaticaChequePreDT_LANCAMENTO: TDateField;
    CdsBaixaAutomaticaChequePreDT_VENCIMENTO: TDateField;
    CdsBaixaAutomaticaChequePreNOTA_FISCAL: TStringField;
    CdsBaixaAutomaticaChequePreSERIE_NOTA: TStringField;
    CdsBaixaAutomaticaChequePreDOCUMENTO: TStringField;
    CdsBaixaAutomaticaChequePreDT_NOTA_FISCAL: TDateField;
    CdsBaixaAutomaticaChequePreVENCTO: TDateField;
    CdsBaixaAutomaticaChequePreVALOR: TFloatField;
    CdsBaixaAutomaticaChequePreHISTORICO: TStringField;
    CdsBaixaAutomaticaChequePreCD_CHEQUE_RECEBIDO: TFloatField;
    CdsBaixaAutomaticaChequePreNR_CHEQUE: TStringField;
    CdsBaixaAutomaticaChequePreNR_BANCO: TStringField;
    CdsBaixaAutomaticaChequePreDT_PAGAMENTO: TDateField;
    CdsBaixaAutomaticaChequePreVL_PAGAMENTO: TFloatField;
    CdsBaixaAutomaticaChequePreVL_JUROS: TFloatField;
    CdsBaixaAutomaticaChequePreVL_DESCONTO: TFloatField;
    CdsBaixaAutomaticaChequePreVL_SALDO: TFloatField;
    CdsBaixaAutomaticaChequePreNOSSO_NUMERO: TStringField;
    CdsBaixaAutomaticaChequePreBANCO: TStringField;
    CdsBaixaAutomaticaChequePreAGENCIA: TStringField;
    CdsBaixaAutomaticaChequePreCONTA: TStringField;
    CdsBaixaAutomaticaChequePreHISTORICO_BANCO: TStringField;
    CdsBaixaAutomaticaChequePreSTATUS: TStringField;
    CdsBaixaAutomaticaChequePreOBSERVACAO: TMemoField;
    CdsBaixaAutomaticaChequePreGERABOLETO: TStringField;
    CdsBaixaAutomaticaChequePreBOLETOGERADO: TStringField;
    CdsBaixaAutomaticaChequePreDT_ALTERACAO: TDateField;
    CdsBaixaAutomaticaChequePreTEFTRANSACAO: TFloatField;
    CdsBaixaAutomaticaChequePreTEFLOTE: TFloatField;
    CdsBaixaAutomaticaChequePreTEFAUTORIZACAO: TFloatField;
    CdsBaixaAutomaticaChequePreTEFDATA: TDateField;
    CdsBaixaAutomaticaChequePreTEFHORA: TTimeField;
    CdsBaixaAutomaticaChequePreTEFNOMEREDE: TStringField;
    CdsBaixaAutomaticaChequePreTEFVALOR: TFloatField;
    CdsBaixaAutomaticaChequePreENVIADO: TStringField;
    SqlCadClasse: TSQLDataSet;
    SqlCadClasseCD_CLASSE: TFloatField;
    SqlCadClasseDESCRICAO: TStringField;
    SqlCadClasseTIPO: TStringField;
    SqlCadClasseVENDEESTOQUENEGATIVO: TStringField;
    SqlCadClasseDT_CALCULOCURVA: TDateField;
    SqlCadClasseENVIADO: TStringField;
    SqlCadClasseFREQUENCIA: TIntegerField;
    SqlCadClasseNPRODUTOS: TFloatField;
    SqlCadClasseNITENS: TFloatField;
    SqlCadClasseVPRODUTOS: TFloatField;
    SqlCadClasseCPRODUTOS: TFloatField;
    SqlCadClasseCONTROLALOTES: TStringField;
    DspCadClasse: TDataSetProvider;
    DsCadClasse: TDataSource;
    CdsCadClasse: TClientDataSet;
    CdsCadClasseDESCRICAO: TStringField;
    CdsCadClasseCD_CLASSE: TFloatField;
    CdsCadClasseTIPO: TStringField;
    CdsCadClasseVENDEESTOQUENEGATIVO: TStringField;
    CdsCadClasseDT_CALCULOCURVA: TDateField;
    CdsCadClasseENVIADO: TStringField;
    CdsCadClasseFREQUENCIA: TIntegerField;
    CdsCadClasseNPRODUTOS: TFloatField;
    CdsCadClasseNITENS: TFloatField;
    CdsCadClasseVPRODUTOS: TFloatField;
    CdsCadClasseCPRODUTOS: TFloatField;
    CdsCadClasseCONTROLALOTES: TStringField;
    CdsCadClasseVirtualNProdutos: TAggregateField;
    CdsCadClasseVirtualCProdutos: TAggregateField;
    CdsCadClasseVirtualVProdutos: TAggregateField;
    CdsCadClasseVirtualNItens: TAggregateField;
    SqlEventos: TSQLDataSet;
    DspEventos: TDataSetProvider;
    CdsEventos: TClientDataSet;
    CdsEventosCD_EVENTO: TFloatField;
    CdsEventosDESCRICAO: TStringField;
    CdsEventosHORAINICIO: TTimeField;
    CdsEventosHORAFIM: TTimeField;
    CdsEventosSTATUS: TStringField;
    CdsEventosENVIADO: TStringField;
    CdsEventosDATA: TDateField;
    SqlControle: TSQLDataSet;
    SqlControleCAMPO: TStringField;
    SqlControleVALOR: TFloatField;
    DspControle: TDataSetProvider;
    CdsControle: TClientDataSet;
    CdsControleCAMPO: TStringField;
    CdsControleVALOR: TFloatField;
    Sp_Preenche_Dados_Filiais: TSQLDataSet;
    SQL: TSQLDataSet;
    SQLConn: TSQLConnection;
    SQlParametrosUSAIMS: TStringField;
    CdsParametrosUSAIMS: TStringField;
    Sql1: TSQLDataSet;
    Cds1: TClientDataSet;
    Dsp1: TDataSetProvider;
    SQlParametrosCODIGOUSUARIO: TStringField;
    CdsParametrosCODIGOUSUARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.