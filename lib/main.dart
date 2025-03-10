import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'JuicyScoreRoute.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: const Text('Start'),
            onPressed: () async {
              if (Platform.isAndroid) {
                await [
                  Permission.location,
                  Permission.bluetoothConnect
                ].request();
              }
              if (Platform.isIOS) {
                await [
                  Permission.location
                ].request();
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JuicyScoreRoute()),
              );
            },
          ),
        ),
      );
  }
}

