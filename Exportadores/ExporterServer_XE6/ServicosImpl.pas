unit ServicosImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, ServicosIntf;

type

  TServicos = class(TInvokableClass, IServicos)
  public
  end;

implementation

initialization
  InvRegistry.RegisterInvokableClass(TServicos);

end.
 