import 'package:flutter/material.dart';

import '../../common/constants/shared_ref.dart';
import '../../common/styles/colors.dart';

class ThemeHelper {
  static Future<void> setTheme(bool isDark) async {
    await sharedPreferences.setBool('isDark', isDark);
  }

  static Future<bool> getTheme() async {
    return await sharedPreferences.getBool('isDark') == true;
  }

  static BaseColors getColor(BuildContext? context) {
    return context == null ? const AppColors() : Theme.of(context).brightness == .light
        ? const AppColors()
        : const DarkAppColors();
  }
}
