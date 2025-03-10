import 'package:flutter/material.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'initialization_sdk.dart';
import 'juicyscore_flutter_method_channel.dart';

abstract class JuicyscoreFlutterPlatform extends PlatformInterface {
  /// Constructs a JuicyscoreFlutterPlatform.
  JuicyscoreFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static JuicyscoreFlutterPlatform _instance = MethodChannelJuicyscoreFlutter();

  /// The default instance of [JuicyscoreFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelJuicyscoreFlutter].
  static JuicyscoreFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JuicyscoreFlutterPlatform] when
  /// they register themselves.
  static set instance(JuicyscoreFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init({OptionsIos? optionsIos, OptionsAndroid? optionsAndroid}) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<void> initIos(OptionsIos optionsIos) {
    throw UnimplementedError('initIos() has not been implemented.');
  }

  Future<void> initAndroid(OptionsAndroid optionsAndroid) {
    throw UnimplementedError('initAndroid() has not been implemented.');
  }

  Future<void> startJuicyScore() {
    throw UnimplementedError('startJuicyScore() has not been implemented.');
  }

  Future<void> setSingleClick() {
    throw UnimplementedError('setSingleClick() has not been implemented.');
  }

  Future<void> setDoubleClick() {
    throw UnimplementedError('setDoubleClick() has not been implemented.');
  }

  Future<void> setMouseSpeed(int distance, int time) {
    throw UnimplementedError('setMouseSpeed() has not been implemented.');
  }

  Future<void> setTouchRadius(double radius) {
    throw UnimplementedError('setTouchRadius() has not been implemented.');
  }

  Future<void> setButtonDispersion(double deltaX, double deltaY) {
    throw UnimplementedError('setButtonDispersion() has not been implemented.');
  }

  Future<void> setContextMenu() {
    throw UnimplementedError('setContextMenu() has not been implemented.');
  }

  Future<void> detectCopy() {
    throw UnimplementedError('detectCopy() has not been implemented.');
  }

  Future<void> detectPaste() {
    throw UnimplementedError('detectPaste() has not been implemented.');
  }

  Future<void> detectCut() {
    throw UnimplementedError('detectCut() has not been implemented.');
  }

  Future<void> setScrollDistance(int distance, int time) {
    throw UnimplementedError('setScrollDistance() has not been implemented.');
  }

  Future<void> setQuarters(Size screenSize, double x, double y) {
    throw UnimplementedError('setScrollDistance() has not been implemented.');
  }
}
