import 'package:juicyscore_flutter/utils.dart';

class JuicyScoreEvent {
  final JuicyScoreEventMethod method;
  final dynamic data;

  JuicyScoreEvent({required this.method, this.data});

  factory JuicyScoreEvent.fromMethodCall(String method, dynamic arguments) {
    String? callback = Utils.extractScriptCode(arguments);
    return JuicyScoreEvent(method: JuicyScoreEventMethod.fromString(method), data: arguments);
  }

  @override
  String toString() => 'JuicyScoreEvent(method: $method, data: $data)';
}

enum JuicyScoreEventMethod {
  initiated,
  initError,
  completed,
  stopped,
  version,
  session,
  error,
  log,
  jsLog,
  warning,
  unknown;

  /// Convert method string to `JuicyScoreEventType`
  static JuicyScoreEventMethod fromString(String method) {
    return JuicyScoreEventMethod.values.firstWhere(
      (e) => e.name == method,
      orElse: () => JuicyScoreEventMethod.unknown,
    );
  }
}
