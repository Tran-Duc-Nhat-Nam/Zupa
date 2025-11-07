import 'package:fluttertoast/fluttertoast.dart';
import '../../helper/theme/theme_helper.dart';

abstract class AppToast {
  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ThemeHelper.getColor(null).success600,
        textColor: ThemeHelper.getColor(null).white,
        fontSize: 16.0
    );
  }

  static void showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ThemeHelper.getColor(null).error600,
        textColor: ThemeHelper.getColor(null).white,
        fontSize: 16.0
    );
  }

  static void showWarningToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ThemeHelper.getColor(null).warning600,
        textColor: ThemeHelper.getColor(null).white,
        fontSize: 16.0
    );
  }

  static void showInfoToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ThemeHelper.getColor(null).primary500,
        textColor: ThemeHelper.getColor(null).white,
        fontSize: 16.0
    );
  }

  static void showBasicToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0
    );
  }
}