(:: pragma bea:global-element-parameter parameter="$sendInformaCambiosNovios1" element="SendInformaCambiosNovios" location="../Schemas/ResponseMQ.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InformaCambiosNovioResponse" location="../WSDL/InformaCambiosNovios.wsdl" ::)

declare namespace ns1 = "http://xmlns.cencosud.corp/CENCOSUD/Siebel/SDV/Resources/WSDL/SDV/InformaCambiosNov/";
declare namespace ns0 = "http://xmlns.cencosud.corp/InformaCambiosNoviosResponse";
declare namespace xf = "http://tempuri.org/DSCL_InformaCambiosNovios-PE_INT2000/Resources/XQuery/ResponseMQ_to_InformaCambiosNovios/";

declare function xf:ResponseMQ_to_InformaCambiosNovios($sendInformaCambiosNovios1 as element(SendInformaCambiosNovios))
    as element(ns1:InformaCambiosNovioResponse) {
        <ns1:InformaCambiosNovioResponse>
            <ns0:respInformaCambiosNovios>
                <ns0:Novioscode>{ data($sendInformaCambiosNovios1/SRNumber) }</ns0:Novioscode>
                <ns0:ErrorCode>{ data($sendInformaCambiosNovios1/ErrorCode) }</ns0:ErrorCode>
                <ns0:ErrorMessage>{ data($sendInformaCambiosNovios1/ErrorMessage) }</ns0:ErrorMessage>
            </ns0:respInformaCambiosNovios>
        </ns1:InformaCambiosNovioResponse>
};

declare variable $sendInformaCambiosNovios1 as element(SendInformaCambiosNovios) external;

xf:ResponseMQ_to_InformaCambiosNovios($sendInformaCambiosNovios1)
