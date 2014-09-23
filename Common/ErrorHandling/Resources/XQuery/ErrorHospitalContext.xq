(:: pragma  parameter="$payload" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:ErrorHospitalContext" location="../Schemas/ErrorHospitalEBM.xsd" ::)

declare namespace ns0 = "http://xmlns.cencosud.corp/Common/ErrorHospital";
declare namespace xf = "http://tempuri.org/Common/ErrorHandling/Resources/XQuery/ErrorHospitalContext/";

declare function xf:ErrorHospitalContext($applicationName as xs:string,
    $integrationCode as xs:string,
    $operation as xs:string,
    $payload as element(*))
    as element(ns0:ErrorHospitalContext) {
        let $string := $applicationName
        return
            <ns0:ErrorHospitalContext>
                <ns0:applicationName>{ $string }</ns0:applicationName>
                <ns0:integrationCode>{ $integrationCode }</ns0:integrationCode>
                <ns0:operation>{ $operation }</ns0:operation>
                <ns0:ProviderInfo>
                    <ns0:ApplicationName/>
                    <ns0:ServiceName/>
                </ns0:ProviderInfo>
                <ns0:payload>{ $payload }</ns0:payload>
            </ns0:ErrorHospitalContext>
};

declare variable $applicationName as xs:string external;
declare variable $integrationCode as xs:string external;
declare variable $operation as xs:string external;
declare variable $payload as element(*) external;

xf:ErrorHospitalContext($applicationName,
    $integrationCode,
    $operation,
    $payload)