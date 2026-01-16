import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zupa/helper/router/router_helper.dart';
import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/common/styles/icons.dart';
import 'package:zupa/common/styles/text_styles.dart';
import 'package:zupa/widgets/app_icon.dart';

abstract class AppMessage {
  static FToast toast = FToast();

  static FToast getToast(BuildContext? context) {
    if (context != null) {
      toast.init(context);
    } else if (toast.context == null &&
        RouterHelper.router.routerDelegate.navigatorKey.currentContext !=
            null) {
      toast.init(
        RouterHelper.router.routerDelegate.navigatorKey.currentContext!,
      );
    }
    return toast;
  }

  static void show(
    String iconPath,
    Color color,
    String message,
    BuildContext? context,
  ) {
    getToast(context).showToast(
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          AppIcon(path: iconPath, color: color),
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
      gravity: .TOP,
      positionedToastBuilder: (context, child, gravity) => Column(
        children: [
          Padding(
            padding: .symmetric(
              vertical: MediaQuery.of(context).padding.top + 8,
              horizontal: 24,
            ),
            child: Container(
              padding: const .symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: .all(color: ThemeHelper.getColor(context).grey200),
                borderRadius: .circular(6),
                color: ThemeHelper.getColor(context).white,
                boxShadow: const [
                  .new(
                    color: Color(0x0C0C0D0D),
                    offset: Offset(0, 1),
                    blurRadius: 4,
                  ),
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
    show(
      AppIcons.checkCircle,
      ThemeHelper.getColor(context).success600,
      message,
      context,
    );
  }

  static void showErrorMessage(String message, {BuildContext? context}) {
    show(
      AppIcons.alertCircle,
      ThemeHelper.getColor(context).error600,
      message,
      context,
    );
  }

  static void showWarningMessage(String message, {BuildContext? context}) {
    show(
      AppIcons.information,
      ThemeHelper.getColor(context).warning600,
      message,
      context,
    );
  }

  static void showInfoMessage(String message, {BuildContext? context}) {
    show(
      AppIcons.book,
      ThemeHelper.getColor(context).primary500,
      message,
      context,
    );
  }

  static void showBasicMessage(String message, {BuildContext? context}) {
    show(
      AppIcons.message,
      ThemeHelper.getColor(context).grey700,
      message,
      context,
    );
  }
}
