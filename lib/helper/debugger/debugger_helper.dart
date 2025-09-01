import 'dart:developer';

import 'package:logarte/logarte.dart';

import '../../common/constants/shared_ref.dart';

class DebuggerHelper {
  static late final Logarte debugger;

  static Future<void> initDebugger() async {
    debugger = Logarte(
      ignorePassword: true,
      onShare: (String content) {
        log(content, time: DateTime.now());
      },
    );
  }

  static Future<void> clearDebugger() async {
    debugger.detachOverlay();
  }

  static Future<void> setDebuggerMode(bool isOn) async {
    await sharedPreferences.setBool('isDebuggerMode', isOn);;
  }

  static Future<bool> getDebuggerMode() async {
    return await sharedPreferences.getBool('isDebuggerMode') == true;
  }
}
