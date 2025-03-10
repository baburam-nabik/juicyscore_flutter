import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'initialization_sdk.dart';
import 'juicyscore_flutter_platform_interface.dart';

class JuicyscoreFlutter {
  Future<void> init({OptionsIos? optionsIos, OptionsAndroid? optionsAndroid}) async {
    if (Platform.isAndroid && optionsAndroid != null) {
      initAndroid(optionsAndroid);
    }
    if (Platform.isIOS && optionsIos != null) {
      initIos(optionsIos);
    }
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
}
