import 'package:flutter/cupertino.dart';
import 'package:juicyscore_flutter/juicyscore_flutter.dart';

class ScrollText extends StatefulWidget {
  const ScrollText({super.key});

  @override
  State<ScrollText> createState() => _ScrollTextState();
}

class _ScrollTextState extends State<ScrollText> {
  final _juicyscoreFlutterPlugin = JuicyScoreFlutter();
  static const String scrollTextExample =
      'Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.';
  double? startScrollPosition;
  int? startScrollTime;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollState) {
        if (scrollState is ScrollStartNotification) {
          startScrollPosition = scrollState.metrics.pixels;
          startScrollTime = DateTime.now().millisecondsSinceEpoch;
        }
        if (scrollState is ScrollEndNotification && startScrollPosition != null && startScrollTime != null) {
          var distance = (startScrollPosition! - scrollState.metrics.pixels).abs().round();
          var time = DateTime.now().millisecondsSinceEpoch - startScrollTime!;
          _juicyscoreFlutterPlugin.setScrollDistance(distance, time);
        }
        return false;
      },
      child: const SizedBox(
        height: 100,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Text(scrollTextExample),
        ),
      ),
    );
  }
}
