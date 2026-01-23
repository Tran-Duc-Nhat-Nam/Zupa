import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

abstract class AppToast {
  static void showSuccessToast(String message) {
    SmartDialog.showNotify(
      msg: message,
      notifyType: NotifyType.success,
      useAnimation: true,
      animationType: SmartAnimationType.scale,
    );
  }

  static void showErrorToast(String message) {
    SmartDialog.showNotify(
      msg: message,
      notifyType: NotifyType.error,
      useAnimation: true,
      animationType: SmartAnimationType.scale,
    );
  }

  static void showWarningToast(String message) {
    SmartDialog.showNotify(
      msg: message,
      notifyType: NotifyType.warning,
      useAnimation: true,
      animationType: SmartAnimationType.scale,
    );
  }

  static void showInfoToast(String message) {
    SmartDialog.showNotify(
      msg: message,
      notifyType: NotifyType.alert,
      useAnimation: true,
      animationType: SmartAnimationType.scale,
    );
  }

  static void showBasicToast(String message) {
    SmartDialog.showToast(
      message,
      useAnimation: true,
      animationType: SmartAnimationType.scale,
    );
  }
}
