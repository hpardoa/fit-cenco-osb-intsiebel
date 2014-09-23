(:: pragma bea:global-element-return element="ns1:EBMHeader" location="EBM.xsd" ::)

declare namespace ns1 = "http://xmlns.cencosud.corp/Core/EBM/Common/EBM";
declare namespace ns0 = "http://xmlns.cencosud.corp/Core/EBM/Common/SapControlData";
declare namespace xf = "http://tempuri.org/CommonCore/EBM/Common/BuildEBMHeaderMessage/";

declare function xf:BuildEBMHeaderMessage($ebmid as xs:string,
    $senderName as xs:string,
    $senderCountry as xs:string,
    $senderBusinessUnit as xs:string,
    $target as xs:string,
    $businessScope as xs:string,
    $integrationCode as xs:string,
    $parentEBMID as xs:string)
    as element(ns1:EBMHeader) {
        <ns1:EBMHeader>
            <ns1:EBMID>{ $ebmid }</ns1:EBMID>
            <ns1:CreationDateTime>{ fn:current-dateTime() }</ns1:CreationDateTime>
            <ns1:Sender>
                <ns1:Application>{ $senderName }</ns1:Application>
                <ns1:Country>{ $senderCountry }</ns1:Country>
                <ns1:BusinessUnit>{ $senderBusinessUnit }</ns1:BusinessUnit>
            </ns1:Sender>
            <ns1:Target>{ $target }</ns1:Target>
            <ns1:BusinessScope>{ $businessScope }</ns1:BusinessScope>
            <ns1:EBMTracking>
                <ns1:ParentEBMID>{ $parentEBMID }</ns1:ParentEBMID>
                <ns1:IntegrationCode>{ $integrationCode }</ns1:IntegrationCode>
            </ns1:EBMTracking>
        </ns1:EBMHeader>
};

declare variable $ebmid as xs:string external;
declare variable $senderName as xs:string external;
declare variable $senderCountry as xs:string external;
declare variable $senderBusinessUnit as xs:string external;
declare variable $target as xs:string external;
declare variable $businessScope as xs:string external;
declare variable $integrationCode as xs:string external;
declare variable $parentEBMID as xs:string external;

xf:BuildEBMHeaderMessage($ebmid,
    $senderName,
    $senderCountry,
    $senderBusinessUnit,
    $target,
    $businessScope,
    $integrationCode,
    $parentEBMID)