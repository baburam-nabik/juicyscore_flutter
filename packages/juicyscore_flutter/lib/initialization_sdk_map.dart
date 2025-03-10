import 'initialization_sdk.dart';

extension IosOptionsMap on OptionsIos {
  Map<String, Object?> toMap() => <String, Object?> {
    'setRawDataApiKeyToken' : setRawDataApiKeyToken,
    'setEnvironment' : setEnvironment,
    'setRegionalDomain' : setRegionalDomain,
    'setSendGeo' : setSendGeo,
    'setCollectUUID' : setCollectUUID,
    'setSendHostname' : setSendHostname,
    'setSendActiveCall' : setSendActiveCall,
    'setSendDns' : setSendDns,
    'setDebugJs' : setDebugJs,
    'setUseHtmlFile' : setUseHtmlFile,
    'setSendDiskData' : setSendDiskData,
    'setSendUpTime' : setSendUpTime,
    'setSendBootTime' : setSendBootTime,
    'setSendBonjour' : setSendBonjour,
    'setSendFingerPrint' : setSendFingerPrint,
  };
}

extension AndroidOptionsMap on OptionsAndroid {
  Map<String, Object?> toMap() => <String, Object?> {
    'setRawDataApiKeyToken' : setRawDataApiKeyToken,
    'setEnvironment' : setEnvironment,
    'setRegionalDomain' : setRegionalDomain,
    'setSendGeo' : setSendGeo,
    'setSendGeoWithoutGoogleServices' : setSendGeoWithoutGoogleServices,
    'setCollectDeviceId' : setCollectDeviceId,
    'setCollectGDID' : setCollectGDID,
    'setSendHostname' : setSendHostname,
    'setSendActiveCall' : setSendActiveCall,
    'setSendDns' : setSendDns,
    'setDebugJs' : setDebugJs,
    'setUseHtmlFile' : setUseHtmlFile,
    'setCollectAppsList' : setCollectAppsList,
    'setCollectFoldersList' : setCollectFoldersList,
    'setDiskData' : setDiskData,
    'setUpTime' : setUpTime,
    'setBootTime' : setBootTime,
    'setBonjour' : setBonjour,
    'setSendFingerPrint' : setSendFingerPrint,
  };
}