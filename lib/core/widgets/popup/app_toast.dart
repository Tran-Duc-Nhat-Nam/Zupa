import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zupa/core/styles/colors.dart';

abstract class AppToast {
  static void showToast(String message, {BuildContext? context}) {
    if (context != null && context.mounted) {
      final colorScheme = context.colorScheme;
      Fluttertoast.showToast(
        msg: message,
        toastLength: .LENGTH_SHORT,
        gravity: .BOTTOM,
        backgroundColor: colorScheme.secondaryContainer,
        textColor: colorScheme.onSecondaryContainer,
        fontAsset: 'assets/fonts/RobotoFlex-VariableFont.ttf',
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: .LENGTH_SHORT,
        gravity: .BOTTOM,
        fontAsset: 'assets/fonts/RobotoFlex-VariableFont.ttf',
      );
    }
  }
}
