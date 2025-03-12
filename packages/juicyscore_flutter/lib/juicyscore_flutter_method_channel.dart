import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:juicyscore_flutter/initialization_sdk_map.dart';

import 'initialization_sdk.dart';
import 'juicyscore_constants.dart';
import 'juicyscore_flutter_platform_interface.dart';

/// An implementation of [JuicyscoreFlutterPlatform] that uses method channels.
class MethodChannelJuicyscoreFlutter extends JuicyscoreFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(JuicyScoreConstants.methodChannel);

  @override
  Future<void> initIos(OptionsIos? optionsIos) async {
    methodChannel.invokeMethod(JuicyScoreConstants.initIos, optionsIos?.toMap());
  }

  @override
  Future<void> initAndroid(OptionsAndroid? optionsAndroid) async {
    methodChannel.invokeMethod(JuicyScoreConstants.initAndroid, optionsAndroid?.toMap());
  }

  @override
  Future<void> startJuicyScore() async {
    await methodChannel.invokeMethod(JuicyScoreConstants.startJuicyScore);
  }

  @override
  Future<void> setSingleClick() async {
    await methodChannel.invokeMethod(JuicyScoreConstants.setSingleClick);
  }

  @override
  Future<void> setDoubleClick() async {
    await methodChannel.invokeMethod(JuicyScoreConstants.setDoubleClick);
  }

  @override
  Future<void> setMouseSpeed(int distance, int time) async {
    await methodChannel.invokeMethod(
      JuicyScoreConstants.setMouseSpeed,
      <String, Object?>{
        JuicyScoreConstants.distance: distance,
        JuicyScoreConstants.time: time,
      },
    );
  }

  @override
  Future<void> setTouchRadius(double radius) async {
    radius = radius * 10;
    await methodChannel.invokeMethod(
      JuicyScoreConstants.setTouchRadius,
      <String, Object?>{
        JuicyScoreConstants.radius: radius,
      },
    );
  }

  @override
  Future<void> setButtonDispersion(double deltaX, double deltaY) async {
    await methodChannel.invokeMethod(
      JuicyScoreConstants.setButtonDispersion,
      <String, Object?>{
        JuicyScoreConstants.deltaX: deltaX.round(),
        JuicyScoreConstants.deltaY: deltaY.round(),
      },
    );
  }

  @override
  Future<void> setContextMenu() async {
    await methodChannel.invokeMethod(JuicyScoreConstants.setContextMenu);
  }

  @override
  Future<void> detectCopy() async {
    await methodChannel.invokeMethod(JuicyScoreConstants.detectCopy);
  }

  @override
  Future<void> detectPaste() async {
    await methodChannel.invokeMethod(JuicyScoreConstants.detectPaste);
  }

  @override
  Future<void> detectCut() async {
    await methodChannel.invokeMethod(JuicyScoreConstants.detectCut);
  }

  @override
  Future<void> setScrollDistance(int distance, int time) async {
    await methodChannel.invokeMethod(
      JuicyScoreConstants.setScrollDistance,
      <String, Object?>{
        JuicyScoreConstants.distance: distance,
        JuicyScoreConstants.time: time,
      },
    );
  }

  @override
  Future<void> setQuarters(Size screenSize, double x, double y) async {
    bool leftSide = screenSize.width / 2 > x;
    bool upperSide = screenSize.height / 2 > y;
    String quarter = generateQuartersString(leftSide, upperSide);
    await methodChannel.invokeMethod(
      JuicyScoreConstants.setQuarters,
      <String, Object?>{
        JuicyScoreConstants.quarter: quarter,
      },
    );
  }

  String generateQuartersString(bool leftSide, bool upperSide) {
    String quarter;
    if (leftSide && upperSide) {
      quarter = JuicyScoreConstants.quarterFirst;
    } else if (!leftSide && upperSide) {
      quarter = JuicyScoreConstants.quarterSecond;
    } else if (leftSide && !upperSide) {
      quarter = JuicyScoreConstants.quarterThird;
    } else {
      quarter = JuicyScoreConstants.quarterFourth;
    }

    return quarter;
  }
}
