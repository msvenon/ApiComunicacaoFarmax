// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://farmax.dnsalias.net:8080/exporterserver/exporterserver.exe/wsdl/idmprocessa
// Encoding : utf-8
// Version  : 1.0
// (04/05/2011 17:58:21 - 1.33.2.5)
// ************************************************************************ //

unit InterfaceProcessa;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, SOAPMidas;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:anyType         - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:UDm-IDmProcessa
  // soapAction: urn:UDm-IDmProcessa#Processa
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IDmProcessabinding
  // service   : IDmProcessaservice
  // port      : idmprocessaPort
  // URL       : http://farmax.dnsalias.net:8080/exporterserver/exporterserver.exe/soap/idmprocessa
  // ************************************************************************ //
  IDmProcessa = interface(IAppServerSOAP)
  ['{1FA20367-8B73-0141-0E1F-639BCF90821B}']
    function  Processa(const Identificador: Integer; const Filial: Integer; const Cds: Variant): Variant; stdcall;
  end;



implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(IDmProcessa), 'urn:UDm-IDm', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IDmProcessa), 'urn:UDm-IDm#Processa');

end.