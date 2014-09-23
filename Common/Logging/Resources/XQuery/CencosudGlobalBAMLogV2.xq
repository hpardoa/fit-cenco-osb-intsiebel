(:: pragma bea:global-element-return element="ns0:CencosudGlobalBAMLog" location="../Schemas/CencosudGlobalBAMLog.xsd" ::)

declare namespace ns0 = "http://xmlns.cencosud.corp/Common/Logging";
declare namespace xf = "http://tempuri.org/Common/Logging/Resources/XQuery/CencosudGlobalBAMLog/";

declare function xf:CencosudGlobalBAMLog($transactionId as xs:string,
    $requesterTransactionId as xs:string,
    $lineNumber as xs:string,
    $logDateTime as xs:dateTime,
    $country as xs:string,
    $businessUnit as xs:string,
    $society as xs:string,
    $center as xs:string,
    $sourceSystem as xs:string,
    $sourceObjectType as xs:string,
    $sourceObjectName as xs:string,
    $sourceDateTime as xs:dateTime,
    $targetSystem as xs:string,
    $targetObjectType as xs:string,
    $targetObjectName as xs:string,
    $targetDateTime as xs:dateTime,
    $interfaceType as xs:string,
    $errorCode as xs:string,
    $errorDescription as xs:string,
    $transactionStatus as xs:string,
    $businessProjectDomain as xs:string,
    $interfaceId as xs:string,
    $serviceName as xs:string,
    $sourceLog as xs:string)
    as element(ns0:CencosudGlobalBAMLog) {
        <ns0:CencosudGlobalBAMLog>
            <ns0:transactionId>{ $transactionId }</ns0:transactionId>
            <ns0:requesterTransactionId>{ $requesterTransactionId }</ns0:requesterTransactionId>
            <ns0:lineNumber>{ $lineNumber }</ns0:lineNumber>
            <ns0:logDateTime>{ $logDateTime }</ns0:logDateTime>
            <ns0:country>{ $country }</ns0:country>
            <ns0:businessUnit>{ $businessUnit }</ns0:businessUnit>
            <ns0:society>{ $society }</ns0:society>
            <ns0:center>{ $center }</ns0:center>
            <ns0:sourceSystem>{ $sourceSystem }</ns0:sourceSystem>
            <ns0:sourceObjectType>{ $sourceObjectType }</ns0:sourceObjectType>
            <ns0:sourceObjectName>{ $sourceObjectName }</ns0:sourceObjectName>
            <ns0:sourceDateTime>{ $sourceDateTime }</ns0:sourceDateTime>
            <ns0:targetSystem>{ $targetSystem }</ns0:targetSystem>
            <ns0:targetObjectType>{ $targetObjectType }</ns0:targetObjectType>
            <ns0:targetObjectName>{ $targetObjectName }</ns0:targetObjectName>
            <ns0:targetDateTime>{ $targetDateTime }</ns0:targetDateTime>
            <ns0:interfaceType>{ $interfaceType }</ns0:interfaceType>
            <ns0:errorCode>{ $errorCode }</ns0:errorCode>
            <ns0:errorDescription>{ $errorDescription }</ns0:errorDescription>
            <ns0:transactionStatus>{ $transactionStatus }</ns0:transactionStatus>
            <ns0:businessProjectDomain>{ $businessProjectDomain }</ns0:businessProjectDomain>
            <ns0:interfaceId>{ $interfaceId }</ns0:interfaceId>
            <ns0:serviceName>{ $serviceName }</ns0:serviceName>
            <ns0:sourceLog>{ $sourceLog}</ns0:sourceLog>
        </ns0:CencosudGlobalBAMLog>
};

declare variable $transactionId as xs:string external;
declare variable $requesterTransactionId as xs:string external;
declare variable $lineNumber as xs:string external;
declare variable $logDateTime as xs:dateTime external;
declare variable $country as xs:string external;
declare variable $businessUnit as xs:string external;
declare variable $society as xs:string external;
declare variable $center as xs:string external;
declare variable $sourceSystem as xs:string external;
declare variable $sourceObjectType as xs:string external;
declare variable $sourceObjectName as xs:string external;
declare variable $sourceDateTime as xs:dateTime external;
declare variable $targetSystem as xs:string external;
declare variable $targetObjectType as xs:string external;
declare variable $targetObjectName as xs:string external;
declare variable $targetDateTime as xs:dateTime external;
declare variable $interfaceType as xs:string external;
declare variable $errorCode as xs:string external;
declare variable $errorDescription as xs:string external;
declare variable $transactionStatus as xs:string external;
declare variable $businessProjectDomain as xs:string external;
declare variable $interfaceId as xs:string external;
declare variable $serviceName as xs:string external;
declare variable $sourceLog as xs:string external;


xf:CencosudGlobalBAMLog($transactionId,
    $requesterTransactionId,
    $lineNumber,
    $logDateTime,
    $country,
    $businessUnit,
    $society,
    $center,
    $sourceSystem,
    $sourceObjectType,
    $sourceObjectName,
    $sourceDateTime,
    $targetSystem,
    $targetObjectType,
    $targetObjectName,
    $targetDateTime,
    $interfaceType,
    $errorCode,
    $errorDescription,
    $transactionStatus,
    $businessProjectDomain,
    $interfaceId,
    $serviceName,
    $sourceLog)