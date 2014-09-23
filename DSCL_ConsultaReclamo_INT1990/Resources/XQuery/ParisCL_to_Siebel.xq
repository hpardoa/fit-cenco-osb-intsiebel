(:: pragma bea:local-element-parameter parameter="$dataArea1" type="ns2:ConsultaReclamo/ns1:reqConsultaReclamo/ns1:DataArea" location="../WSDL/WSDL_DSCL_ConsultaReclamo.wsdl" ::)
(:: pragma bea:global-element-return element="ns3:Request_Input" location="../../Business%20Services/WSDL/Paris_NoviosInbound.wsdl" ::)

declare namespace ns2 = "http://xmlns.cencosud.corp/CENCOSUD/Siebel/SDV/Resources/WSDL/SDV/ConsultaReclamo";
declare namespace ns1 = "http://xmlns.cencosud.corp/ConsultaReclamoRequest";
declare namespace ns3 = "http://siebel.com/asi/";
declare namespace ns0 = "http://www.siebel.com/xml/CN%20Novios_Paris";
declare namespace xf = "http://tempuri.org/DSCL_ConsultaReclamo_INT1990/Resources/XQuery/ParisCL_to_Siebel/";

declare function xf:ParisCL_to_Siebel($dataArea1 as element())
    as element(ns3:Request_Input) {
        <ns3:Request_Input>
            <ns0:Client>
                <ns0:CNDocumentType>{ data($dataArea1/ns1:TipoDocumento) }</ns0:CNDocumentType>
                <ns0:CNNoviosCode>{ data($dataArea1/ns1:CodigoNovios) }</ns0:CNNoviosCode>
                <ns0:Source>{ data($dataArea1/ns1:Origen) }</ns0:Source>
                <ns0:CNVerificationDigit>{ data($dataArea1/ns1:DigitoVerificador) }</ns0:CNVerificationDigit>
                {
                    for $Celular in $dataArea1/ns1:Celular
                    return
                        <ns0:CellularPhone>{ data($Celular) }</ns0:CellularPhone>
                }
                <ns0:CNDocumentId>{ data($dataArea1/ns1:Documento) }</ns0:CNDocumentId>
                <ns0:EmailAddress>{ data($dataArea1/ns1:Email) }</ns0:EmailAddress>
                <ns0:FirstName>{ data($dataArea1/ns1:Nombre) }</ns0:FirstName>
                <ns0:LastName>{ data($dataArea1/ns1:ApellidoPaterno) }</ns0:LastName>
                {
                    for $ApellidoMaterno in $dataArea1/ns1:ApellidoMaterno
                    return
                        <ns0:MotherMaidenName>{ data($ApellidoMaterno) }</ns0:MotherMaidenName>
                }
                <ns0:caso>
                    {
                        for $Tienda in $dataArea1/ns1:Caso/ns1:Tienda
                        return
                            <ns0:CNStoreId>{ data($Tienda) }</ns0:CNStoreId>
                    }
                    <ns0:Area>{ data($dataArea1/ns1:Caso/ns1:SubTipo) }</ns0:Area>
                    <ns0:Description>{ data($dataArea1/ns1:Caso/ns1:Mensaje) }</ns0:Description>
                    <ns0:Type>{ data($dataArea1/ns1:Caso/ns1:Tipo) }</ns0:Type>
                    <ns0:Source>{ data($dataArea1/ns1:Caso/ns1:Origen) }</ns0:Source>
                    <ns0:Status>{ data($dataArea1/ns1:Caso/ns1:Estado) }</ns0:Status>
                    {
                        for $Detalle in $dataArea1/ns1:Caso/ns1:Detalle
                        return
                            <ns0:Sub-Area>{ data($Detalle) }</ns0:Sub-Area>
                    }
                </ns0:caso>
            </ns0:Client>
        </ns3:Request_Input>
};

declare variable $dataArea1 as element() external;

xf:ParisCL_to_Siebel($dataArea1)
