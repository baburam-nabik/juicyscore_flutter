import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:juicyscore_flutter/initialization_sdk_map.dart';

import 'constants.dart';
import 'initialization_sdk.dart';
import 'juicyscore_flutter_platform_interface.dart';

/// An implementation of [JuicyscoreFlutterPlatform] that uses method channels.
class MethodChannelJuicyscoreFlutter extends JuicyscoreFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(Constants.methodChannel);

  @override
  Future<void> initIos(OptionsIos? optionsIos) async {
    methodChannel.invokeMethod(Constants.initIos, optionsIos?.toMap());
  }

  @override
  Future<void> initAndroid(OptionsAndroid? optionsAndroid) async {
    methodChannel.invokeMethod(Constants.initAndroid, optionsAndroid?.toMap());
  }

  @override
  Future<void> startJuicyScore() async {
    await methodChannel.invokeMethod(Constants.startJuicyScore);
  }

  @override
  Future<void> setSingleClick() async {
    await methodChannel.invokeMethod(Constants.setSingleClick);
  }

  @override
  Future<void> setDoubleClick() async {
    await methodChannel.invokeMethod(Constants.setDoubleClick);
  }

  @override
  Future<void> setMouseSpeed(int distance, int time) async {
    await methodChannel.invokeMethod(
      Constants.setMouseSpeed,
      <String, Object?>{
        Constants.distance: distance,
        Constants.time: time,
      },
    );
  }

  @override
  Future<void> setTouchRadius(double radius) async {
    radius = radius * 10;
    await methodChannel.invokeMethod(
      Constants.setTouchRadius,
      <String, Object?>{
        Constants.radius: radius,
      },
    );
  }

  @override
  Future<void> setButtonDispersion(double deltaX, double deltaY) async {
    await methodChannel.invokeMethod(
      Constants.setButtonDispersion,
      <String, Object?>{
        Constants.deltaX: deltaX.round(),
        Constants.deltaY: deltaY.round(),
      },
    );
  }

  @override
  Future<void> setContextMenu() async {
    await methodChannel.invokeMethod(Constants.setContextMenu);
  }

  @override
  Future<void> detectCopy() async {
    await methodChannel.invokeMethod(Constants.detectCopy);
  }

  @override
  Future<void> detectPaste() async {
    await methodChannel.invokeMethod(Constants.detectPaste);
  }

  @override
  Future<void> detectCut() async {
    await methodChannel.invokeMethod(Constants.detectCut);
  }

  @override
  Future<void> setScrollDistance(int distance, int time) async {
    await methodChannel.invokeMethod(
      Constants.setScrollDistance,
      <String, Object?>{
        Constants.distance: distance,
        Constants.time: time,
      },
    );
  }

  @override
  Future<void> setQuarters(Size screenSize, double x, double y) async {
    bool leftSide = screenSize.width / 2 > x;
    bool upperSide = screenSize.height / 2 > y;
    String quarter = generateQuartersString(leftSide, upperSide);
    await methodChannel.invokeMethod(
      Constants.setQuarters,
      <String, Object?>{
        Constants.quarter: quarter,
      },
    );
  }

  String generateQuartersString(bool leftSide, bool upperSide) {
    String quarter;
    if (leftSide && upperSide) {
      quarter = Constants.quarterFirst;
    } else if (!leftSide && upperSide) {
      quarter = Constants.quarterSecond;
    } else if (leftSide && !upperSide) {
      quarter = Constants.quarterThird;
    } else {
      quarter = Constants.quarterFourth;
    }

    return quarter;
  }
}
