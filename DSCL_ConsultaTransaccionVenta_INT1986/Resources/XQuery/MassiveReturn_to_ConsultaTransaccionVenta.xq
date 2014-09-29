(:: pragma bea:global-element-parameter parameter="$massiveReturn1" element="MassiveReturn" location="../Schemas/MassiveReturn.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ConsutaTransVentaOpResponse" location="../WSDL/ConsultaTransaccionVenta.wsdl" ::)

declare namespace ns1 = "http://xmlns.cencosud.corp/CENCOSUD/Siebel/SDV/Resources/WSDL/SDV/ConsultaTransVentas/";
declare namespace ns0 = "http://xmlns.cencosud.corp/ConsultaTransaccionVentaResponse";
declare namespace xf = "http://tempuri.org/DSCL_ConsultaTransaccionVenta_INT1986/Resources/XQuery/MassiveReturn_to_ConsultaTransaccionVenta1/";

declare function xf:MassiveReturn_to_ConsultaTransaccionVenta1($massiveReturn1 as element(MassiveReturn),
    $Date as xs:string,
    $Time as xs:string,
    $CNResponse as xs:string)
    as element(ns1:ConsutaTransVentaOpResponse) {
        <ns1:ConsutaTransVentaOpResponse>
            <ns0:respConsultaTransaccionVenta>
                 <ns0:Date>{ concat(substring($Date,1,4),'-',substring($Date,5,2),'-',substring($Date,7,2)) }</ns0:Date>
                <ns0:Time>{ concat(substring($Date,1,4),'-',substring($Date,5,2),'-',substring($Date,7,2),'T',substring($Time,1,2),':',substring($Time,3,2),':',substring($Time,5,2)) }</ns0:Time>
                <ns0:CNResponse>{ data($CNResponse) }</ns0:CNResponse>
                {
                    for $RespuestMasiva in $massiveReturn1/RespuestMasiva
                    return
                        <ns0:MassiveReturn>
                            <ns0:CNStoreID>{ data($RespuestMasiva/Local) }</ns0:CNStoreID>
                            <ns0:CNPOS>{ data($RespuestMasiva/Terminal) }</ns0:CNPOS>
                            <ns0:CNTransactionNumber>{ data($RespuestMasiva/NumeroTransaccion) }</ns0:CNTransactionNumber>
                            <ns0:CNTransactiondate>{ concat(substring($RespuestMasiva/FechaVenta,7,2),
	'-',
	substring($RespuestMasiva/FechaVenta,5,2),
	'-',
	substring($RespuestMasiva/FechaVenta,1,4)) }</ns0:CNTransactiondate>
                            <ns0:CNcorrelativeNumber>{ data($RespuestMasiva/NumeroCorrelativo) }</ns0:CNcorrelativeNumber>
                            <ns0:CNTransactionType>{ data($RespuestMasiva/TipoTransaccion) }</ns0:CNTransactionType>
                            <ns0:CNAccountNumber>{ data($RespuestMasiva/NumeroCuenta) }</ns0:CNAccountNumber>
                            <ns0:CNRequestNumber>{ data($RespuestMasiva/NumeroSolicitud) }</ns0:CNRequestNumber>
                            <ns0:CNTypeofRequest>{ data($RespuestMasiva/TypoSolicitud) }</ns0:CNTypeofRequest>
                            <ns0:CNCompany>{ data($RespuestMasiva/Empresa) }</ns0:CNCompany>
                            <ns0:CNDocumentNumber>{ data($RespuestMasiva/NumeroDocumento) }</ns0:CNDocumentNumber>
                            <ns0:CNCustomerDocumentId>{ data($RespuestMasiva/Rut) }</ns0:CNCustomerDocumentId>
                            <ns0:CNCustomerVerificationDigit>{ data($RespuestMasiva/Dv) }</ns0:CNCustomerVerificationDigit>
                            <ns0:CNCustomerName>{ data($RespuestMasiva/Nombre) }</ns0:CNCustomerName>
                            <ns0:CNCustomerAddress>{ data($RespuestMasiva/Direccion) }</ns0:CNCustomerAddress>
                            <ns0:CNInvoiceMark>{ data($RespuestMasiva/MarcaFactura) }</ns0:CNInvoiceMark>
                            <ns0:CNNoviosCode>{ data($RespuestMasiva/CodNovios) }</ns0:CNNoviosCode>
                        </ns0:MassiveReturn>
                }
            </ns0:respConsultaTransaccionVenta>
        </ns1:ConsutaTransVentaOpResponse>
};

declare variable $massiveReturn1 as element(MassiveReturn) external;
declare variable $Date as xs:string external;
declare variable $Time as xs:string external;
declare variable $CNResponse as xs:string external;

xf:MassiveReturn_to_ConsultaTransaccionVenta1($massiveReturn1,
    $Date,
    $Time,
    $CNResponse)