import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';

class ThemeHelper {
  static BaseColors getColor(BuildContext context) {
    return BaseColors.fromColorScheme(Theme.of(context).colorScheme);
  }
}
