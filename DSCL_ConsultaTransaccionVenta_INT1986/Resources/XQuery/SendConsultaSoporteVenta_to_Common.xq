(:: pragma bea:global-element-return element="ns0:CommonSoporteVenta" location="../Schemas/ConsultaTransaccionVentaCommon.xsd" ::)

declare namespace ns0 = "http://xmlns.cencosud.corp/ConsultaTransaccionVentaCommon";
declare namespace xf = "http://tempuri.org/DSCL_ConsultaTransaccionVenta_INT1986/Resources/XQuery/SendConsultaSoporteVenta_to_Common_2/";
declare namespace functx = "http://www.functx.com";




declare function xf:SendConsultaSoporteVenta_to_Common_2($string1 as xs:string)
    as element(ns0:CommonSoporteVenta) {
        <ns0:CommonSoporteVenta>
             	<ns0:Date> {substring($string1,15,8) }</ns0:Date>
            	<ns0:Time> {substring($string1,23,8) }</ns0:Time>
            	<ns0:CNResponse> {substring($string1,39,2) }</ns0:CNResponse>
            	<ns0:Massive>{substring($string1,41,string-length($string1))}</ns0:Massive>
            	<ns0:Specific> {substring($string1,9883,string-length($string1))}</ns0:Specific>
        </ns0:CommonSoporteVenta>
};


declare variable $string1 as xs:string external;

xf:SendConsultaSoporteVenta_to_Common_2($string1)