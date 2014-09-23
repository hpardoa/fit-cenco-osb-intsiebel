(:: pragma bea:global-element-parameter parameter="$detailReturn1" element="DetailReturn" location="../Schemas/DetailReturn.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ConsutaTransVentaOpResponse" location="../WSDL/ConsultaTransaccionVenta.wsdl" ::)

declare namespace ns1 = "http://xmlns.cencosud.corp/CENCOSUD/Siebel/SDV/Resources/WSDL/SDV/ConsultaTransVentas/";
declare namespace ns0 = "http://xmlns.cencosud.corp/ConsultaTransaccionVentaResponse";
declare namespace xf = "http://tempuri.org/DSCL_ConsultaTransaccionVenta_INT1986/Resources/XQuery/DetailReturn_to_ConsultaTransaccionVenta/";

declare function xf:DetailReturn_to_ConsultaTransaccionVenta($detailReturn1 as element(DetailReturn),
    $Date as xs:string,
    $Time as xs:string,
    $CNResponse as xs:string)
    as element(ns1:ConsutaTransVentaOpResponse) {
        <ns1:ConsutaTransVentaOpResponse>
            <ns0:respConsultaTransaccionVenta>
                <ns0:Date>{ data($Date) }</ns0:Date>
                <ns0:Time>{ data($Time) }</ns0:Time>
                <ns0:CNResponse>{ data($CNResponse) }</ns0:CNResponse>
                <ns0:DetailReturn>
                    <ns0:CNStoreID1>{ data($detailReturn1/RespuestaEspecifica/sLocal) }</ns0:CNStoreID1>
                    <ns0:CNPOS1>{ data($detailReturn1/RespuestaEspecifica/sTerminal) }</ns0:CNPOS1>
                    <ns0:CNTransactioninteger1>{ data($detailReturn1/RespuestaEspecifica/sNumeroTransaccion) }</ns0:CNTransactioninteger1>
                    <ns0:CNTransactiondate1>{ data($detailReturn1/RespuestaEspecifica/sFechaVenta) }</ns0:CNTransactiondate1>
                    <ns0:CNcorrelativeinteger1>{ data($detailReturn1/RespuestaEspecifica/sNumeroCorrelativo) }</ns0:CNcorrelativeinteger1>
                    <ns0:CNTransactionType1>{ data($detailReturn1/RespuestaEspecifica/sTipoTransaccion) }</ns0:CNTransactionType1>
                    <ns0:CNAccountinteger1>{ data($detailReturn1/RespuestaEspecifica/sNumeroCuenta) }</ns0:CNAccountinteger1>
                    <ns0:CNRequestinteger1>{ data($detailReturn1/RespuestaEspecifica/sNumeroSolicitud) }</ns0:CNRequestinteger1>
                    <ns0:CNTypeofRequest1>{ data($detailReturn1/RespuestaEspecifica/sTypoSolicitud) }</ns0:CNTypeofRequest1>
                    <ns0:CNCompany1>{ data($detailReturn1/RespuestaEspecifica/sEmpresa) }</ns0:CNCompany1>
                    <ns0:CNDocumentinteger1>{ data($detailReturn1/RespuestaEspecifica/sNumeroDocumento) }</ns0:CNDocumentinteger1>
                    <ns0:CNVendorRutId1>{ data($detailReturn1/RespuestaEspecifica/sRut) }</ns0:CNVendorRutId1>
                    <ns0:CNDV1>{ data($detailReturn1/RespuestaEspecifica/sDv) }</ns0:CNDV1>
                    <ns0:CNVendorName1>{ data($detailReturn1/RespuestaEspecifica/sNombre) }</ns0:CNVendorName1>
                    <ns0:CNVendorAddress1>{ data($detailReturn1/RespuestaEspecifica/sDireccion) }</ns0:CNVendorAddress1>
                    <ns0:CNInvoiceMark1>{ data($detailReturn1/RespuestaEspecifica/sMarcaFactura) }</ns0:CNInvoiceMark1>
                    <ns0:CNNoviosCode1>{ data($detailReturn1/RespuestaEspecifica/sCodNovios) }</ns0:CNNoviosCode1>
                    <ns0:CNPaymentOcurrences>{ data($detailReturn1/RespuestaEspecifica/sMediosPagoOcurrs) }</ns0:CNPaymentOcurrences>
                    {
                        for $MediosDePago in $detailReturn1/RespuestaEspecifica/MediosDePago
                        where $MediosDePago/MontoFormaPago > 0
                        return
                            <ns0:MeansOfPayment>
                                <ns0:CNCodeAsMeansOfPayment>{ data($MediosDePago/CodigoMedioPago) }</ns0:CNCodeAsMeansOfPayment>
                                <ns0:CNAmountPaymentForm>{ data($MediosDePago/MontoFormaPago) }</ns0:CNAmountPaymentForm>
                            </ns0:MeansOfPayment>
                    }
                    {
                        for $ListaSKU in $detailReturn1/RespuestaEspecifica/ListaSKU
                        where $ListaSKU/SKU > 0
                        return
                            <ns0:ListOfSKU>
                                <ns0:CNSKU>{ data($ListaSKU/SKU) }</ns0:CNSKU>
                                <ns0:CNSKUDesc>{ data($ListaSKU/DescrpcionSKU) }</ns0:CNSKUDesc>
                                <ns0:CNQuantity>{ data($ListaSKU/CantidadSKU) }</ns0:CNQuantity>
                                <ns0:CNValue>{ data($ListaSKU/ValorSKU) }</ns0:CNValue>
                                <ns0:CNIndicatorProv>{ data($ListaSKU/IndicadorProv) }</ns0:CNIndicatorProv>
                                <ns0:CNVendorRutId>{ data($ListaSKU/ProveedorRut) }</ns0:CNVendorRutId>
                                <ns0:CNDV>{ data($ListaSKU/ProveedorDV) }</ns0:CNDV>
                                <ns0:CNVendorName>{ data($ListaSKU/ProveedorNombre) }</ns0:CNVendorName>
                                <ns0:CNDispatchflag>{ data($ListaSKU/MarcaDespacho) }</ns0:CNDispatchflag>
                                <ns0:CNBrandcode>{ data($ListaSKU/CodigoMarca) }</ns0:CNBrandcode>
                                <ns0:CNBranddesc>{ data($ListaSKU/DescripcionMarca) }</ns0:CNBranddesc>
                                <ns0:CNDispatchReleaseFlag>{ data($ListaSKU/EmisionGui) }</ns0:CNDispatchReleaseFlag>
                                <ns0:CNNoviosRetainedGift>{ data($ListaSKU/IndicadorRegaloRetenido) }</ns0:CNNoviosRetainedGift>
                                <ns0:CNCreditNoteReleaseFlag>{ data($ListaSKU/EmisionNC) }</ns0:CNCreditNoteReleaseFlag>
                                <ns0:CNDepartment>{ data($ListaSKU/Departamento) }</ns0:CNDepartment>
                                {
                                    for $DetalleGuias in $ListaSKU/DetalleGuias
                                    where $DetalleGuias/NumeroGuia > 0
                                    return
                                        <ns0:ListOfDispatchOrders>
                                            <ns0:CNDispatchOrderinteger>{ data($DetalleGuias/NumeroGuia) }</ns0:CNDispatchOrderinteger>
                                            <ns0:CNDispatchType>{ data($DetalleGuias/TipoGuia) }</ns0:CNDispatchType>
                                            <ns0:CNDispatchStatus>{ data($DetalleGuias/EstadoGuia) }</ns0:CNDispatchStatus>
                                            <ns0:CNDispatchDt>{ data($DetalleGuias/FechaGuia) }</ns0:CNDispatchDt>
                                            <ns0:CNReqinteger>{ data($DetalleGuias/Solicitud) }</ns0:CNReqinteger>
                                            <ns0:CNReqType>{ data($DetalleGuias/TipoSolicitud) }</ns0:CNReqType>
                                            <ns0:CNReqStatus>{ data($DetalleGuias/EstadoSolicitud) }</ns0:CNReqStatus>
                                        </ns0:ListOfDispatchOrders>
                                }
                            </ns0:ListOfSKU>
                    }
                </ns0:DetailReturn>
            </ns0:respConsultaTransaccionVenta>
        </ns1:ConsutaTransVentaOpResponse>
};

declare variable $detailReturn1 as element(DetailReturn) external;
declare variable $Date as xs:string external;
declare variable $Time as xs:string external;
declare variable $CNResponse as xs:string external;

xf:DetailReturn_to_ConsultaTransaccionVenta($detailReturn1,
    $Date,
    $Time,
    $CNResponse)