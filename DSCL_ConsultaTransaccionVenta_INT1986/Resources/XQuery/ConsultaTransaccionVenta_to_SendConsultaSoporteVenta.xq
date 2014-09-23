(:: pragma bea:local-element-parameter parameter="$dataArea1" type="ns1:ConsutaTransVentaOp/ns0:reqConsultaTransaccionVenta/ns0:DataArea" location="../WSDL/ConsultaTransaccionVenta.wsdl" ::)

declare namespace ns1 = "http://xmlns.cencosud.corp/CENCOSUD/Siebel/SDV/Resources/WSDL/SDV/ConsultaTransVentas/";
declare namespace ns0 = "http://xmlns.cencosud.corp/ConsultaTransaccionVentaRequest";
declare namespace xf = "http://tempuri.org/DSCL_ConsultaTransaccionVenta_INT1986/Resources/XQuery/ConsultaTransaccionVenta_to_SendConsultaSoporteVenta/";

declare function xf:ConsultaTransaccionVenta_to_SendConsultaSoporteVenta($dataArea1 as element())
    as xs:string {
        concat($dataArea1/ns0:Flag , $dataArea1/ns0:NroSegment , $dataArea1/ns0:LongSegment , $dataArea1/ns0:ServiceCode , $dataArea1/ns0:Version , $dataArea1/ns0:Company , $dataArea1/ns0:Fecha , $dataArea1/ns0:Hora , $dataArea1/ns0:ServiceClass , $dataArea1/ns0:TransactionType , $dataArea1/ns0:Version2 , $dataArea1/ns0:CNDispatchRequestNumber , $dataArea1/ns0:CNDispatchOrderNumber , $dataArea1/ns0:CNStoreID , $dataArea1/ns0:CNTerminal , $dataArea1/ns0:CNTransactionNumber , $dataArea1/ns0:CNTransactiondate , $dataArea1/ns0:CNAccountNumber , $dataArea1/ns0:CNMeanofpayment , $dataArea1/ns0:CNDateFrom , $dataArea1/ns0:CNDateto , $dataArea1/ns0:CNSKU)
};

declare variable $dataArea1 as element() external;

xf:ConsultaTransaccionVenta_to_SendConsultaSoporteVenta($dataArea1)