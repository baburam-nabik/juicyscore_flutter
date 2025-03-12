import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juicyscore_flutter/initialization_sdk.dart';
import 'package:juicyscore_flutter/juicyscore_flutter.dart';

import 'ScrollText.dart';
import 'TestTapButton.dart';

const MethodChannel _channel = MethodChannel(JuicyScoreConstants.methodChannel);

class JuicyScoreRoute extends StatefulWidget {
  const JuicyScoreRoute({super.key});

  @override
  State<JuicyScoreRoute> createState() => _JuicyScoreState();
}

class _JuicyScoreState extends State<JuicyScoreRoute> {
  final _juicyscoreFlutterPlugin = JuicyscoreFlutter();
  int panStartTime = 0;
  Size? screenSize;
  bool initiated = false;
  String sessionId = "";

  @override
  void initState() {
    _channel.setMethodCallHandler((call) async => setState(() {
          switch (call.method) {
            case JuicyScoreConstants.initiated:
              {
                initiated = true;
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.initError:
              {
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.completed:
              {
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.stopped:
              {
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.version:
              {
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.session:
              {
                sessionId = call.arguments;
                initiated = true;
                _log(call.arguments);
                _log("SESSION_ID: ${call.arguments}");
                break;
              }
            case JuicyScoreConstants.error:
              {
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.log:
              {
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.jsLog:
              {
                _log(call.arguments);
                break;
              }
            case JuicyScoreConstants.warning:
              {
                _log(call.arguments);
                break;
              }
          }
        }));
    _juicyscoreFlutterPlugin.init(
        // optionsIos: OptionsIos(
        //   setRawDataApiKeyToken: "iOSRawDataApiKeyToken",
        //   setEnvironment: Environment.test.name,
        //   setRegionalDomain: RegionalDomain.auto.name,
        //   setSendHostname: true,
        //   setSendDns: true,
        // ),
        optionsAndroid: OptionsAndroid(
      setRawDataApiKeyToken: "THd9QQB8MEfEZNHCcLJPizCuTEST",
      setEnvironment: Environment.test.name,
      setRegionalDomain: RegionalDomain.mumbai.name,
      setSendHostname: true,
      setSendDns: true,
      setCollectAppsList: true,
    ));
    _juicyscoreFlutterPlugin.startJuicyScore();
    super.initState();
  }

  void _tapPosition(TapDownDetails details) {
    final tapPosition = details.globalPosition;
    final x = tapPosition.dx;
    final y = tapPosition.dy;
    if (screenSize == null) return;
    _juicyscoreFlutterPlugin.setQuarters(screenSize!, x, y);
  }

  void _handlePanStart(DragStartDetails dragStartDetails) {
    panStartTime = DateTime.now().millisecondsSinceEpoch;
  }

  void _handlePanEnd(DragEndDetails dragEndDetails) {
    var time = DateTime.now().millisecondsSinceEpoch - panStartTime;
    _juicyscoreFlutterPlugin.setMouseSpeed(dragEndDetails.velocity.pixelsPerSecond.distance.round(), time);
  }

  void _handleTapDown(TapDownDetails details) {
    _tapPosition(details);
    _juicyscoreFlutterPlugin.setSingleClick();
  }

  void _handleDoubleTap(TapDownDetails details) {
    _tapPosition(details);
    _juicyscoreFlutterPlugin.setDoubleClick();
  }

  void _log(dynamic arguments) {
    debugPrint(arguments);
  }

  getJuicyScoreApi(BuildContext context) async {
    // Initialize Dio instance
    Dio dio = Dio();

    // Set your session and endpoint here
    String session = sessionId;
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhdW5jaHBhZC5zd2lwZWxvYW4uaW4vYXBpL3YxL2F1dGgvbG9naW4iLCJpYXQiOjE3NDE2MDEwNjksImV4cCI6MTc0NDE5MzA2OSwibmJmIjoxNzQxNjAxMDY5LCJqdGkiOiJMVkNER1pWMlNJN3RvdU00Iiwic3ViIjoiNjk2MzIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.D2G0w_9pR7ah5USmY_pS-3OaSGwmDO9gR-2PTP8zW8I";
    String apiEndpoint = 'https://launchpad.swipeloan.in/api/v1/getJuicyScore';

    // Prepare headers
    Map<String, String> headers = {
      // 'token': token,
    };

    try {
      // Send POST request
      Response response = await dio.post(
        apiEndpoint,
        data: {"session_id": session, 'token': token},
        options: Options(
          headers: headers,
        ),
      );

      // Handle the response
      if (response.statusCode == 200) {
        print('Request was successful: ${response.data}');
        _showDialog(context, 'Success', 'Request was successful: ${response.data["data"]["antifraud_score"]}');
      } else {
        _showDialog(context, 'failure', 'Request failed: ${response.statusCode}');

        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      _showDialog(context, 'Error', 'Request was successful: ${e.toString()}');
    }
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return initiated
        ? GestureDetector(
            onTapDown: _handleTapDown,
            onPanStart: _handlePanStart,
            onPanEnd: _handlePanEnd,
            onDoubleTapDown: _handleDoubleTap,
            child: Listener(
              onPointerDown: (event) {
                _juicyscoreFlutterPlugin.setTouchRadius(event.radiusMajor);
              },
              child: Scaffold(
                extendBodyBehindAppBar: false,
                body: SafeArea(
                  child: Column(
                    children: [
                      TextFieldCustom(),
                      ScrollText(),
                      TestTapButton(),
                      DismissButton(),
                      SizedBox(height: 100),
                      ElevatedButton(
                        onPressed: () async {
                          await getJuicyScoreApi(context);
                        },
                        child: Text('Call Get Score Api'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: SizedBox(
                child: Center(child: CircularProgressIndicator()),
                height: 50.0,
                width: 50.0,
              ),
            ),
          );
  }
}

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({super.key});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  final _juicyscoreFlutterPlugin = JuicyscoreFlutter();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: _controller,
            onTap: () {
              _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
            },
            contextMenuBuilder: (context, editableTextState) {
              _juicyscoreFlutterPlugin.setContextMenu();
              return AdaptiveTextSelectionToolbar.buttonItems(
                anchors: editableTextState.contextMenuAnchors,
                buttonItems: <ContextMenuButtonItem>[
                  ContextMenuButtonItem(
                    onPressed: () {
                      _juicyscoreFlutterPlugin.detectCopy();
                      editableTextState.copySelection(SelectionChangedCause.toolbar);
                    },
                    type: ContextMenuButtonType.copy,
                  ),
                  ContextMenuButtonItem(
                    onPressed: () {
                      _juicyscoreFlutterPlugin.detectCut();
                      editableTextState.cutSelection(SelectionChangedCause.toolbar);
                    },
                    type: ContextMenuButtonType.cut,
                  ),
                  ContextMenuButtonItem(
                    onPressed: () {
                      _juicyscoreFlutterPlugin.detectPaste();
                      editableTextState.pasteText(SelectionChangedCause.toolbar);
                    },
                    type: ContextMenuButtonType.paste,
                  ),
                  ContextMenuButtonItem(
                    onPressed: () {
                      editableTextState.selectAll(SelectionChangedCause.toolbar);
                    },
                    type: ContextMenuButtonType.selectAll,
                  )
                ],
              );
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter text for test',
            ),
          ),
        ),
      ],
    );
  }
}

class DismissButton extends StatefulWidget {
  const DismissButton({super.key});

  @override
  State<DismissButton> createState() => _DismissButtonState();
}

class _DismissButtonState extends State<DismissButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Dismiss'));
  }
}
