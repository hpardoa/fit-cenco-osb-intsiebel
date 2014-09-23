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
                            <ns0:CNTransactioninteger>{ data($RespuestMasiva/NumeroTransaccion) }</ns0:CNTransactioninteger>
                            <ns0:CNTransactiondate>{ concat(substring($RespuestMasiva/FechaVenta,7,2),
	'-',
	substring($RespuestMasiva/FechaVenta,5,2),
	'-',
	substring($RespuestMasiva/FechaVenta,1,4)) }</ns0:CNTransactiondate>
                            <ns0:CNcorrelativeinteger>{ data($RespuestMasiva/NumeroCorrelativo) }</ns0:CNcorrelativeinteger>
                            <ns0:CNTransactionType>{ data($RespuestMasiva/TipoTransaccion) }</ns0:CNTransactionType>
                            <ns0:CNAccountinteger>{ data($RespuestMasiva/NumeroCuenta) }</ns0:CNAccountinteger>
                            <ns0:CNRequestinteger>{ data($RespuestMasiva/NumeroSolicitud) }</ns0:CNRequestinteger>
                            <ns0:CNTypeofRequest>{ data($RespuestMasiva/TypoSolicitud) }</ns0:CNTypeofRequest>
                            <ns0:CNCompany>{ data($RespuestMasiva/Empresa) }</ns0:CNCompany>
                            <ns0:CNDocumentinteger>{ data($RespuestMasiva/NumeroDocumento) }</ns0:CNDocumentinteger>
                            <ns0:CNVendorRutId>{ data($RespuestMasiva/Rut) }</ns0:CNVendorRutId>
                            <ns0:CNDV>{ data($RespuestMasiva/Dv) }</ns0:CNDV>
                            <ns0:CNVendorName>{ data($RespuestMasiva/Nombre) }</ns0:CNVendorName>
                            <ns0:CNVendorAddress>{ data($RespuestMasiva/Direccion) }</ns0:CNVendorAddress>
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