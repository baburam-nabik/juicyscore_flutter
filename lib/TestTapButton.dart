import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:juicyscore_flutter/juicyscore_flutter.dart';

class TestTapButton extends StatefulWidget {
  const TestTapButton({super.key});

  @override
  State<TestTapButton> createState() => _TestTapButtonState();
}

class _TestTapButtonState extends State<TestTapButton> {
  final _juicyscoreFlutterPlugin = JuicyscoreFlutter();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Listener (
          onPointerUp: (details) {
            _juicyscoreFlutterPlugin.setButtonDispersion(details.position.dx, details.position.dy);
          },
          child: ElevatedButton(
            onPressed: (){},
            child: const Text('Test tap button')
          ),
      ),
    );
  }
  
}