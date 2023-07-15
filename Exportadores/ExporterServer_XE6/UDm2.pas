unit UDm2;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDm2 = class(TDataModule)
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
    CdsPermissoesCD_USUARIO: TFloatField;
    CdsPermissoesCD_PERMISSAO: TFloatField;
    CdsPermissoesNOME: TStringField;
    CdsPermissoesLOGIN: TStringField;
    CdsPermissoesSENHA: TStringField;
    CdsPermissoesPODEVENDER: TStringField;
    CdsPermissoesCAIXA: TStringField;
    CdsPermissoesTX_DESCONTO_MAXIMO: TFloatField;
    CdsPermissoesENVIADO: TStringField;
    CdsUsu: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm2: TDm2;

implementation

uses UDm;

{$R *.dfm}

end.
