import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';

class ThemeHelper {
  static BaseColors getColor(BuildContext? context) {
    return context == null
        ? const AppColors()
        : Theme.of(context).brightness == .light
        ? const AppColors()
        : const DarkAppColors();
  }
}
