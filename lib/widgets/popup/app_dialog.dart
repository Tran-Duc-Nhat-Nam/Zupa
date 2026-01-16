import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import 'package:zupa/common/styles/icons.dart';
import 'package:zupa/common/styles/text_styles.dart';
import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/widgets/app_button.dart';
import 'package:zupa/widgets/app_icon.dart';

abstract class AppDialog {
  static void showAuthDialog(BuildContext context) {
    Dialogs.materialDialog(
      context: context,
      msg: context.tr('subtitle.sessionEnded'),
      title: context.tr('title.sessionEnded'),
      color: ThemeHelper.getColor(context).white,
      barrierLabel: '',
      barrierDismissible: false,
      actionsBuilder: (actionContext) => [
        IconsOutlineButton(
          onPressed: () {
            context.goNamed('Login');
          },
          text: context.tr('title.login'),
          iconData: Icons.login,
          textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
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
    AppDialogTheme theme = .confirm,
    void Function()? onOk,
    void Function()? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      builder: (context) => Center(
        child: Padding(
          padding: const .symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: .min,
            children: [
              Card(
                child: Padding(
                  padding: const .all(16),
                  child: Stack(
                    children: [
                      Align(
                        alignment: .topRight,
                        child: AppIcon(
                          path: AppIcons.close,
                          onTap: () => context.pop(),
                        ),
                      ),
                      child ??
                          Column(
                            spacing: 24,
                            mainAxisSize: .min,
                            children: [
                              Column(
                                spacing: 12,
                                children: [
                                  Center(
                                    child: Text(
                                      titleText ?? context.tr('ok'),
                                      style: AppTextStyles.bodyLargeSemibold
                                          .copyWith(
                                            color: ThemeHelper.getColor(
                                              context,
                                            ).grey900,
                                          ),
                                    ),
                                  ),
                                  if (subtitleText != null) Text(subtitleText),
                                ],
                              ),
                              Column(
                                spacing: 12,
                                mainAxisSize: .min,
                                children: [
                                  AppButton(
                                    onPressed: onOk != null
                                        ? () {
                                            onOk();
                                            context.pop();
                                          }
                                        : null,
                                    text: okText,
                                    color: theme == .confirm ? .basic : .error,
                                  ),
                                  AppButton(
                                    onPressed: () {
                                      onCancel?.call();
                                      context.pop();
                                    },
                                    text: cancelText,
                                    theme: .outline,
                                    color: theme == .confirm ? .basic : .error,
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
