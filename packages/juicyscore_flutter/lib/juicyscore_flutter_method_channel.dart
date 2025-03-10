import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:juicyscore_flutter/initialization_sdk_map.dart';

import 'initialization_sdk.dart';
import 'juicyscore_flutter_platform_interface.dart';

/// An implementation of [JuicyscoreFlutterPlatform] that uses method channels.
class MethodChannelJuicyscoreFlutter extends JuicyscoreFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('juicyscore_flutter');

  @override
  Future<void> initIos(OptionsIos? optionsIos) async {
    methodChannel.invokeMethod('initIos', optionsIos?.toMap());
  }

  @override
  Future<void> initAndroid(OptionsAndroid? optionsAndroid) async {
    methodChannel.invokeMethod('initAndroid', optionsAndroid?.toMap());
  }

  @override
  Future<void> startJuicyScore() async {
    await methodChannel.invokeMethod('startJuicyScore');
  }

  @override
  Future<void> setSingleClick() async {
    await methodChannel.invokeMethod('setSingleClick');
  }

  @override
  Future<void> setDoubleClick() async {
    await methodChannel.invokeMethod('setDoubleClick');
  }

  @override
  Future<void> setMouseSpeed(int distance, int time) async {
    await methodChannel.invokeMethod('setMouseSpeed', <String, Object?>{
      'distance' : distance,
      'time' : time,
    },);
  }

  @override
  Future<void> setTouchRadius(double radius) async {
    radius = radius * 10;
    await methodChannel.invokeMethod('setTouchRadius', <String, Object?>{
      'radius' : radius,
    },);
  }

  @override
  Future<void> setButtonDispersion(double deltaX, double deltaY) async {
    await methodChannel.invokeMethod('setButtonDispersion', <String, Object?>{
      'deltaX' : deltaX.round(),
      'deltaY' : deltaY.round(),
    },);
  }

  @override
  Future<void> setContextMenu() async {
    await methodChannel.invokeMethod('setContextMenu');
  }

  @override
  Future<void> detectCopy() async {
    await methodChannel.invokeMethod('detectCopy');
  }

  @override
  Future<void> detectPaste() async {
    await methodChannel.invokeMethod('detectPaste');
  }

  @override
  Future<void> detectCut() async {
    await methodChannel.invokeMethod('detectCut');
  }

  @override
  Future<void> setScrollDistance(int distance, int time) async {
    await methodChannel.invokeMethod('setScrollDistance', <String, Object?>{
      'distance' : distance,
      'time' : time,
    },);
  }

  @override
  Future<void> setQuarters(Size screenSize, double x, double y) async {
    bool leftSide = screenSize.width / 2 > x;
    bool upperSide = screenSize.height / 2 > y;
    String quarter = generateQuartersString(leftSide, upperSide);
    await methodChannel.invokeMethod('setQuarters', <String, Object?>{
      'quarter' : quarter,
    },);
  }

  String generateQuartersString(bool leftSide, bool upperSide) {
    String quarter;
    if (leftSide && upperSide)
      quarter = "1|0|0|0";
    else if (!leftSide && upperSide)
      quarter = "0|1|0|0";
    else if (leftSide && !upperSide)
      quarter = "0|0|1|0";
    else
      quarter = "0|0|0|1";
    return quarter;
  }

}
