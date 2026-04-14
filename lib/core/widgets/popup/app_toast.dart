import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zupa/core/styles/colors.dart';

abstract class AppToast {
  static void showToast(String message, {BuildContext? context}) {
    if (context != null) {
      final colorScheme = AppColors.of(context);
      Fluttertoast.showToast(
        msg: message,
        toastLength: .LENGTH_SHORT,
        gravity: .BOTTOM,
        backgroundColor: colorScheme.secondaryContainer,
        textColor: colorScheme.onSecondaryContainer,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: .LENGTH_SHORT,
        gravity: .BOTTOM,
        fontSize: 16.0,
      );
    }
  }
}
