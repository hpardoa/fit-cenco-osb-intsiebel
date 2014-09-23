(:: pragma bea:global-element-parameter parameter="$request_Output1" element="ns2:Request_Output" location="../../Business%20Services/WSDL/Paris_NoviosInbound.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:ConsultaReclamoResponse" location="../WSDL/WSDL_DSCL_ConsultaReclamo.wsdl" ::)

declare namespace ns2 = "http://siebel.com/asi/";
declare namespace ns1 = "http://xmlns.cencosud.corp/CENCOSUD/Siebel/SDV/Resources/WSDL/SDV/ConsultaReclamo";
declare namespace ns0 = "http://xmlns.cencosud.corp/ConsultaReclamoResponse";
declare namespace xf = "http://tempuri.org/DSCL_ConsultaReclamo_INT1990/Resources/XQuery/Siebel_to_ParisCL/";

declare function xf:Siebel_to_ParisCL($request_Output1 as element(ns2:Request_Output))
    as element(ns1:ConsultaReclamoResponse) {
        <ns1:ConsultaReclamoResponse>
            <ns0:respConsultaReclamo>
                <ns0:ServiceRequest>{ data($request_Output1/ns2:SRNumber) }</ns0:ServiceRequest>
                <ns0:CodigoRespuesta>{ data($request_Output1/ns2:ErrorCode) }</ns0:CodigoRespuesta>
                <ns0:TipoError>{ data($request_Output1/ns2:ErrorMessage) }</ns0:TipoError>
            </ns0:respConsultaReclamo>
        </ns1:ConsultaReclamoResponse>
};

declare variable $request_Output1 as element(ns2:Request_Output) external;

xf:Siebel_to_ParisCL($request_Output1)
