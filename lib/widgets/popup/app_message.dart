import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../common/constants/routes.dart';
import '../../helper/theme/theme_helper.dart';
import '../../common/styles/icons.dart';
import '../../common/styles/text_styles.dart';
import '../app_icon.dart';

abstract class AppMessage {
  static FToast toast = FToast();

  static FToast getToast() {
    if (toast.context == null && router.routerDelegate.navigatorKey.currentContext != null) {
      toast.init(router.routerDelegate.navigatorKey.currentContext!);
    }
    return toast;
  }

  static void show(String iconPath, Color color, String message) {
    getToast().showToast(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIcon(
            path: iconPath,
            color: color,
          ),
          Text(
            message,
            style: AppTextStyles.bodyMediumMedium.copyWith(
              color: ThemeHelper.getColor(null).grey700,
            ),
          ),
          AppIcon(
            path: AppIcons.close,
            color: ThemeHelper.getColor(null).grey300,
            onTap: () => toast.removeCustomToast(),
          ),
        ],
      ),
      isDismissible: true,
      gravity: ToastGravity.TOP,
      positionedToastBuilder: (context, child, gravity) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top + 8,
              horizontal: 24,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeHelper.getColor(context).grey200,
                ),
                borderRadius: BorderRadius.circular(6),
                color: ThemeHelper.getColor(context).white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0C0C0D0D),
                    offset: Offset(0, 1),
                    blurRadius: 4,
                  )
                ],
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  static void showSuccessMessage(String message, {BuildContext? context}) {
    show(AppIcons.checkCircle, ThemeHelper.getColor(context).success600, message);
  }

  static void showErrorMessage(String message, {BuildContext? context}) {
    show(AppIcons.alertCircle, ThemeHelper.getColor(context).error600, message);
  }

  static void showWarningMessage(String message, {BuildContext? context}) {
    show(AppIcons.information, ThemeHelper.getColor(context).warning600, message);
  }

  static void showInfoMessage(String message, {BuildContext? context}) {
    show(AppIcons.book, ThemeHelper.getColor(context).primary500, message);
  }

  static void showBasicMessage(String message, {BuildContext? context}) {
    show(AppIcons.message, ThemeHelper.getColor(context).grey700, message);
  }
}
