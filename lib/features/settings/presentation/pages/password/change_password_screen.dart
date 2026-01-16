import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zupa/features/settings/presentation/bloc/password/password_settings_cubit.dart';
import 'package:zupa/di/injection.dart';
import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/widgets/app_button.dart';
import 'package:zupa/widgets/app_card.dart';
import 'package:zupa/widgets/app_screen.dart';
import 'package:zupa/widgets/app_text_field.dart';
import 'package:zupa/widgets/popup/app_message.dart';
import 'package:zupa/widgets/state/app_state.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  AppState<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends AppState<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordSettingsCubit>(
      create: (context) => getIt<PasswordSettingsCubit>()..init(),
      child: BlocListener<PasswordSettingsCubit, PasswordSettingsState>(
        listener: (context, state) {
          state.maybeWhen(
            changePasswordSuccess: () {
              AppMessage.showSuccessMessage(
                context.tr('success'),
                context: context,
              );
              context.read<PasswordSettingsCubit>().init();
            },
            changePasswordFailed: (message) {
              AppMessage.showErrorMessage(
                message,
                context: context,
              );
              context.read<PasswordSettingsCubit>().init();
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<PasswordSettingsCubit, PasswordSettingsState>(
          builder: (context, state) {
            return AppScreen(
              formKey: formKey,
              isChildScrollable: true,
              noBackground: true,
              title: context.tr('changePassword'),
              footer: [
                AppButton(
                  onPressed: () {
                    formKey.currentState?.saveAndValidate();
                    if (formKey.currentState?.validate() == true) {
                      context.read<PasswordSettingsCubit>().changePassword(
                        formKey.currentState!.value['currentPassword'],
                        formKey.currentState!.value['newPassword'],
                      );
                    }
                  },
                  text: context.tr('changePassword'),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: AppCard(
                  child: Column(
                    spacing: 8,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextField(
                        name: 'currentPassword',
                        labelText: context.tr('currentPassword'),
                        hintText: context.tr('enterCurrentPassword'),
                        isExternalLabel: true,
                        isPassword: true,
                        required: true,
                      ),
                      Divider(color: ThemeHelper.getColor(context).grey100),
                      AppTextField(
                        name: 'newPassword',
                        labelText: context.tr('newPassword'),
                        hintText: context.tr('enterNewPassword'),
                        isExternalLabel: true,
                        isPassword: true,
                        required: true,
                      ),
                      AppTextField(
                        name: 'confirmPassword',
                        hintText: context.tr('confirmNewPassword'),
                        isPasswordConfirm: true,
                        required: true,
                        validators: [
                          (value) {
                            return value ==
                                    formKey
                                        .currentState
                                        ?.instantValue['newPassword']
                                ? null
                                : context.tr('errorMessage.confirmPassword');
                          },
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
