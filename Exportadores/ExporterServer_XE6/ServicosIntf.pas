unit ServicosIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  IServicos = interface(IInvokable)
  ['{511EDE34-F348-4CE9-80AF-2A9F8377E46C}']
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(IServicos));

end.
 