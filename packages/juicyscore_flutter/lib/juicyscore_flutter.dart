import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:juicyscore_flutter/juicyscore_constants.dart';

import 'initialization_sdk.dart';
import 'juicyscore_event.dart';
import 'juicyscore_flutter_platform_interface.dart';

export 'initialization_sdk.dart';
export 'initialization_sdk_map.dart';
export 'juicyscore_constants.dart';
export 'juicyscore_event.dart';
export 'juicyscore_flutter_method_channel.dart';

class JuicyScoreFlutter {
  static const MethodChannel _channel = MethodChannel(JuicyScoreConstants.methodChannel);

  Future<void> init({OptionsIos? optionsIos, OptionsAndroid? optionsAndroid}) async {
    if (Platform.isAndroid && optionsAndroid != null) {
      initAndroid(optionsAndroid);
    }
    if (Platform.isIOS && optionsIos != null) {
      initIos(optionsIos);
    }
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  Future<void> initIos(OptionsIos optionsIos) async {
    JuicyscoreFlutterPlatform.instance.initIos(optionsIos);
  }

  Future<void> initAndroid(OptionsAndroid optionsAndroid) async {
    JuicyscoreFlutterPlatform.instance.initAndroid(optionsAndroid);
  }

  Future<void> startJuicyScore() async {
    JuicyscoreFlutterPlatform.instance.startJuicyScore();
  }

  Future<void> setSingleClick() async {
    JuicyscoreFlutterPlatform.instance.setSingleClick();
  }

  Future<void> setDoubleClick() async {
    JuicyscoreFlutterPlatform.instance.setDoubleClick();
  }

  Future<void> setMouseSpeed(int distance, int time) async {
    JuicyscoreFlutterPlatform.instance.setMouseSpeed(distance, time);
  }

  Future<void> setTouchRadius(double radius) async {
    JuicyscoreFlutterPlatform.instance.setTouchRadius(radius);
  }

  Future<void> setButtonDispersion(double deltaX, double deltaY) async {
    JuicyscoreFlutterPlatform.instance.setButtonDispersion(deltaX, deltaY);
  }

  Future<void> setContextMenu() async {
    JuicyscoreFlutterPlatform.instance.setContextMenu();
  }

  Future<void> detectCopy() async {
    JuicyscoreFlutterPlatform.instance.detectCopy();
  }

  Future<void> detectPaste() async {
    JuicyscoreFlutterPlatform.instance.detectPaste();
  }

  Future<void> detectCut() async {
    JuicyscoreFlutterPlatform.instance.detectCut();
  }

  Future<void> setScrollDistance(int distance, int time) async {
    JuicyscoreFlutterPlatform.instance.setScrollDistance(distance, time);
  }

  Future<void> setQuarters(Size screenSize, double x, double y) async {
    JuicyscoreFlutterPlatform.instance.setQuarters(screenSize, x, y);
  }

  ///------------------------------------------------------------------------
  static final StreamController<JuicyScoreEvent> _eventController = StreamController.broadcast();

  /// Expose stream for listening to JuicyScore events
  static Stream<JuicyScoreEvent> get eventsStream => _eventController.stream;

  static Future<void> _handleMethodCall(MethodCall call) async {
    final event = JuicyScoreEvent.fromMethodCall(call.method, call.arguments);
    _eventController.add(event);
  }

  /// Dispose StreamController when no longer needed
  static void dispose() {
    _eventController.close();
  }
}
