(:: pragma bea:global-element-parameter parameter="$eBMHeader1" element="ns2:EBMHeader" location="../../../../CommonCore/EBM/Common/EBM.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$errorHospitalContext1" element="ns0:ErrorHospitalContext" location="../Schemas/ErrorHospitalEBM.xsd" ::)
(:: pragma  parameter="$fault" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:ErrorHospitalCommonMessage" location="../Schemas/ErrorHospitalEBM.xsd" ::)

declare namespace ns2 = "http://xmlns.cencosud.corp/Core/EBM/Common/EBM";
declare namespace ns1 = "http://xmlns.cencosud.corp/Core/EBM/Common/SapControlData";
declare namespace ns0 = "http://xmlns.cencosud.corp/Common/ErrorHospital";
declare namespace xf = "http://tempuri.org/Common/ErrorHandling/Resources/XQuery/Xq/";

declare function xf:Xq($eBMHeader1 as element(ns2:EBMHeader),
    $errorHospitalContext1 as element(ns0:ErrorHospitalContext),
    $fault as element(*))
    as element(ns0:ErrorHospitalCommonMessage) {
        <ns0:ErrorHospitalCommonMessage>
            <ns2:EBMHeader>{ $eBMHeader1/@* , $eBMHeader1/node() }</ns2:EBMHeader>
            <ns0:fault>{ $fault }</ns0:fault>
            <ns0:ErrorHospitalContext>{ $errorHospitalContext1/@* , $errorHospitalContext1/node() }</ns0:ErrorHospitalContext>
        </ns0:ErrorHospitalCommonMessage>
};

declare variable $eBMHeader1 as element(ns2:EBMHeader) external;
declare variable $errorHospitalContext1 as element(ns0:ErrorHospitalContext) external;
declare variable $fault as element(*) external;

xf:Xq($eBMHeader1,
    $errorHospitalContext1,
    $fault)