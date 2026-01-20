import 'package:logarte/logarte.dart';

class DebuggerHelper {
  static final Logarte debugger = Logarte();

  static Future<void> clearDebugger() async {
    debugger.detachOverlay();
  }
}
