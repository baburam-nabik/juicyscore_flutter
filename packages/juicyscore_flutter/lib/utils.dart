class Utils {
  static String extractScriptCode(String log) {
    final regex = RegExp(r'Script code:\s*(.*)');
    final match = regex.firstMatch(log);
    return match != null ? match.group(1)! : '';
  }
}
