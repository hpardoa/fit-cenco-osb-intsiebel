(:: pragma bea:global-element-parameter parameter="$eBMHeader1" element="ns1:EBMHeader" location="../../../../CommonCore/EBM/Common/EBM.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$context" element="ns2:ErrorHospitalContext" location="../Schemas/ErrorHospitalEBM.xsd" ::)
(:: pragma  parameter="$fault" type="anyType" ::)
(:: pragma bea:schema-type-return type="ns1:ResponseEBMType" location="../../../../CommonCore/EBM/Common/EBM.xsd" ::)

declare namespace ns2 = "http://xmlns.cencosud.corp/Common/ErrorHospital";
declare namespace ns1 = "http://xmlns.cencosud.corp/Core/EBM/Common/EBM";
declare namespace ns0 = "http://xmlns.cencosud.corp/Core/EBM/Common/SapControlData";
declare namespace xf = "http://tempuri.org/Common/ErrorHandling/Resources/XQuery/ResponseEBMErrorType/";
declare namespace con = "http://www.bea.com/wli/sb/context";

declare function xf:ResponseEBMErrorType($eBMHeader1 as element(ns1:EBMHeader),
    $context as element(ns2:ErrorHospitalContext),
    $fault as element(*))
    as element() {
        <ns1:ResponseEBMType>
            <ns1:EBMHeader>{ $eBMHeader1/@* , $eBMHeader1/node() }</ns1:EBMHeader>
            <ns1:ReturnCode>{ let $sourceErrorCode := if(fn:exists($context/ns1:ErrorDetail/ns1:SourceErrorCode)) then  data($context/ns1:ErrorDetail/ns1:SourceErrorCode) else ''
            				  let $errorCode := if (exists($fault/con:errorCode)) then data($fault/con:errorCode) 	else 	'' 
            		 		  return xf:TranslateToReturnCode($errorCode, $sourceErrorCode , $eBMHeader1/ns1:Sender/ns1:Application/text()) }</ns1:ReturnCode>
            <ns1:ReturnMessage>{
            	let $sourceErrorMessage := if(fn:exists($context/ns1:ErrorDetail/ns1:SourceErrorMessage)) then  data($context/ns1:ErrorDetail/ns1:SourceErrorMessage) else ''
            	let $returnMessage := if (exists($fault/con:reason)) then data($fault/con:reason) else $sourceErrorMessage
            	return $returnMessage 
            }</ns1:ReturnMessage>
            <ns1:ErrorCode>{ let $sourceErrorCode := if(fn:exists($context/ns1:ErrorDetail/ns1:SourceErrorCode)) then  data($context/ns1:ErrorDetail/ns1:SourceErrorCode) else ''
            				  let $errorCode := if (exists($fault/con:errorCode)) then data($fault/con:errorCode) 	else 	'' 
            		 		  return xf:TranslateToErrorCode($errorCode, $sourceErrorCode , $eBMHeader1/ns1:Sender/ns1:Application/text()) }</ns1:ErrorCode>
            <ns1:ErrorDetail>
                <ns1:ErrorType>{
                   	if(fn:starts-with(data($fault/con:errorCode), 'BEA-38')) then 
            			'System' 
            		else 
            			'Application'                
                }</ns1:ErrorType>
                <ns1:HandlerServiceName>{data($context/ns2:integrationCode)}</ns1:HandlerServiceName>
                <ns1:SourceApplication>{data($context/ns2:ProviderInfo/ns2:ApplicationName)}</ns1:SourceApplication>
                <ns1:SourceServiceName>{data($context/ns2:ProviderInfo/ns2:ServiceName)}</ns1:SourceServiceName>
                <ns1:SourceErrorCode>{
if(fn:exists($context/ns1:ErrorDetail/ns1:SourceErrorCode)) then  data($context/ns1:ErrorDetail/ns1:SourceErrorCode) else if (exists($fault/con:errorCode)) then data($fault/con:errorCode) 	else 	'' 
            	}</ns1:SourceErrorCode>
                <ns1:SourceErrorMessage>{ if(fn:exists($context/ns1:ErrorDetail/ns1:SourceErrorMessage)) then  data($context/ns1:ErrorDetail/ns1:SourceErrorMessage) else if (exists($fault/con:reason)) then data($fault/con:reason) else ''
            	}</ns1:SourceErrorMessage>
                <ns1:SourceErrorTrace>{
 if(fn:exists($context/ns1:ErrorDetail/ns1:SourceErrorTrace)) then fn-bea:serialize($context/ns1:ErrorDetail/ns1:SourceErrorTrace) else
                	if (exists($fault/con:details)) then 
            			fn-bea:serialize($fault/con:details) 
            		else '' 
            	}</ns1:SourceErrorTrace>
            </ns1:ErrorDetail>
        </ns1:ResponseEBMType>
       
};

declare function xf:TranslateToReturnCode($errorCode as xs:string, $sourceErrorCode as xs:string, $applicationName as xs:string) as xs:string {
	if($applicationName = 'BPA') then
		if(fn:starts-with($errorCode, 'BEA-382505') or fn:starts-with($sourceErrorCode, 'BEA-382505') ) then 
			'2'
		else
			'3'
	else
		'1'
};

declare function xf:TranslateToErrorCode($errorCode as xs:string, $sourceErrorCode as xs:string, $applicationName as xs:string) as xs:string {
	if(fn:starts-with($errorCode, 'BEA-382505') or fn:starts-with($sourceErrorCode, 'BEA-382505') ) then 
		'SOA-000-2001'
	else if($applicationName = 'BPA') then
		'SOA-PRO-0000'
	else if (fn:starts-with($errorCode, 'SOA-')) then
		$errorCode
	else if (fn:starts-with($sourceErrorCode, 'SOA-')) then
		$sourceErrorCode		
	else
		'SOA-000-0000'
};

declare variable $eBMHeader1 as element(ns1:EBMHeader) external;
declare variable $context as element(ns2:ErrorHospitalContext) external;
declare variable $fault as element(*) external;

xf:ResponseEBMErrorType($eBMHeader1,
    $context,
    $fault)