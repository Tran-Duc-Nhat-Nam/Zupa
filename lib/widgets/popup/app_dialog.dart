import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../common/styles/icons.dart';
import '../../common/styles/text_styles.dart';
import '../../helper/theme/theme_helper.dart';
import '../app_button.dart';
import '../app_icon.dart';

abstract class AppDialog {
  static void showAuthDialog(BuildContext context) {
    Dialogs.materialDialog(
      context: context,
      msg: context.tr('subtitle.sessionEnded'),
      title: context.tr('title.sessionEnded'),
      color: ThemeHelper.getColor(context).white,
      barrierLabel: '',
      barrierDismissible: false,
      actionsBuilder:
          (actionContext) => [
            IconsOutlineButton(
              onPressed: () {
                context.goNamed('Login');
              },
              text: context.tr('title.login'),
              iconData: Icons.login,
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              iconColor: Theme.of(context).colorScheme.primary,
            ),
          ],
    );
  }

  static void showModal(
    BuildContext context, {
    Widget? child,
    String? titleText,
    String? subtitleText,
    String? okText,
    String? cancelText,
    AppDialogTheme theme = AppDialogTheme.confirm,
    void Function()? onOk,
    void Function()? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      builder:
          (context) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: AppIcon(
                              path: AppIcons.close,
                              onTap: () => context.pop(),
                            ),
                          ),
                          child ??
                              Column(
                                spacing: 24,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    spacing: 12,
                                    children: [
                                      Center(
                                        child: Text(
                                          titleText ?? context.tr('ok'),
                                          style: AppTextStyles.bodyLargeSemibold
                                              .copyWith(
                                                color:
                                                    ThemeHelper.getColor(
                                                      context,
                                                    ).grey900,
                                              ),
                                        ),
                                      ),
                                      if (subtitleText != null)
                                        Text(subtitleText),
                                    ],
                                  ),
                                  Column(
                                    spacing: 12,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppButton(
                                        onPressed:
                                            onOk != null
                                                ? () {
                                                  onOk();
                                                  context.pop();
                                                }
                                                : null,
                                        text: okText,
                                        color:
                                            theme == AppDialogTheme.confirm
                                                ? AppButtonColor.basic
                                                : AppButtonColor.error,
                                      ),
                                      AppButton(
                                        onPressed: () {
                                          onCancel?.call();
                                          context.pop();
                                        },
                                        text: cancelText,
                                        theme: AppButtonTheme.outline,
                                        color:
                                            theme == AppDialogTheme.confirm
                                                ? AppButtonColor.basic
                                                : AppButtonColor.error,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

enum AppDialogTheme { confirm, warning }
