import 'package:logarte/logarte.dart';

import '../../common/constants/shared_ref.dart';

class DebuggerHelper {
  static final Logarte debugger = Logarte();

  static Future<void> clearDebugger() async {
    debugger.detachOverlay();
  }

  static Future<void> setDebuggerMode(bool isOn) async {
    await sharedPreferences.setBool('isDebuggerMode', isOn);
  }

  static Future<bool> getDebuggerMode() async {
    return await sharedPreferences.getBool('isDebuggerMode') == true;
  }
}
