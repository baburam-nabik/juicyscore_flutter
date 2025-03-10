class OptionsIos {
  String? setRawDataApiKeyToken;
  String? setEnvironment;
  String? setRegionalDomain;
  bool? setSendGeo;
  bool? setCollectUUID;
  bool? setSendHostname;
  bool? setSendActiveCall;
  bool? setSendDns;
  bool? setDebugJs;
  bool? setUseHtmlFile;
  bool? setSendDiskData;
  bool? setSendUpTime;
  bool? setSendBootTime;
  bool? setSendBonjour;
  bool? setSendFingerPrint;

  OptionsIos({
    this.setRawDataApiKeyToken,
    this.setEnvironment,
    this.setRegionalDomain,
    this.setSendGeo,
    this.setCollectUUID,
    this.setSendHostname,
    this.setSendActiveCall,
    this.setSendDns,
    this.setDebugJs,
    this.setUseHtmlFile,
    this.setSendDiskData,
    this.setSendUpTime,
    this.setSendBootTime,
    this.setSendBonjour,
    this.setSendFingerPrint,
  });
}

class OptionsAndroid {
  String? setRawDataApiKeyToken;
  String? setEnvironment;
  String? setRegionalDomain;
  bool? setSendGeo;
  bool? setSendGeoWithoutGoogleServices;
  bool? setCollectDeviceId;
  bool? setCollectGDID;
  bool? setSendHostname;
  bool? setSendActiveCall;
  bool? setSendDns;
  bool? setDebugJs;
  bool? setUseHtmlFile;
  bool? setCollectAppsList;
  bool? setCollectFoldersList;
  bool? setDiskData;
  bool? setUpTime;
  bool? setBootTime;
  bool? setBonjour;
  bool? setSendFingerPrint;

  OptionsAndroid({
    this.setRawDataApiKeyToken,
    this.setEnvironment,
    this.setRegionalDomain,
    this.setSendGeo,
    this.setSendGeoWithoutGoogleServices,
    this.setCollectDeviceId,
    this.setCollectGDID,
    this.setSendHostname,
    this.setSendActiveCall,
    this.setSendDns,
    this.setDebugJs,
    this.setUseHtmlFile,
    this.setCollectAppsList,
    this.setCollectFoldersList,
    this.setDiskData,
    this.setUpTime,
    this.setBootTime,
    this.setBonjour,
    this.setSendFingerPrint,
  });
}

enum Environment {test, prod, jcsc, dev}
enum RegionalDomain {auto, amsterdam, singapore, saintpetersburg, northamerica, mumbai, abudhabi, hochiminh, jakarta }