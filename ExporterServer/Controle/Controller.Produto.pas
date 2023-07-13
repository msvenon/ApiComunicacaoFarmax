{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit Controller.Produto;

interface
uses Horse,System.Json,System.SysUtils,DataSet.Serialize,Data.DB,FireDac.Comp.Client;

 procedure registry;
 procedure ListarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 procedure ListarProdutobarra(Req: THorseRequest; Res: THorseResponse; Next: TProc);


implementation

uses  Udm;


procedure registry;
begin
 //as rotas
  THorse.Get('/produto',ListarProduto);
  THorse.Get('/produto/:barra',ListarProdutobarra);
end;

procedure ListarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 sql,teste :String;
begin
   sql:='select id_produto , cd_produto, codigo_barras_1, descricao, estoque_1 from produtos ';
   dm.SqlProdutos.SQL.clear;
   dm.SqlProdutos.Open(sql);

 if dm.SqlProdutos.RecordCount >0 then
   begin
     teste:= dm.SqlProdutos.FieldByName( 'codigo_barras_1').Value;
     res.Send<TJSONArray>(dm.SqlProdutos.ToJSONArray()).Status(200);
   end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(401);
   end;


end;


procedure ListarProdutobarra(Req: THorseRequest; Res: THorseResponse; Next: TProc);
 var
 sql,teste, barra_1 :String;
begin
   barra_1:='';
   barra_1 := req.Params['barra'];
   dm.SqlProdutos.SQL.clear;
   dm.SqlProdutos.SQL.Add('select id_produto , cd_produto, codigo_barras_1, descricao, estoque_1 from produtos where codigo_barras_1 ='+barra_1);
   dm.SqlProdutos.Open();

 if dm.SqlProdutos.RecordCount >0 then
   begin
     teste:= dm.SqlProdutos.FieldByName( 'codigo_barras_1').Value;
     res.Send<TJSONObject>(dm.SqlProdutos.ToJSONObject()).Status(200);
   end
   else
   begin
     res.Send<TJSONObject>(TJSONObject.Create.AddPair('msg','Not Found')).Status(404);
   end;
end;


end.

