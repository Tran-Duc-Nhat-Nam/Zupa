import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/password/presentation/bloc/password/password_settings_cubit.dart';

@RoutePage()
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
          state.whenOrNull(
            changePasswordSuccess: () {
              AppToast.showToast(t.common.success, context: context);
              context.read<PasswordSettingsCubit>().init();
            },
            changePasswordFailed: (message) {
              message != null
                  ? MessageHelper.showError(context, message: message)
                  : AppToast.showToast(
                      t.common.errors.unknown,
                      context: context,
                    );
              context.read<PasswordSettingsCubit>().init();
            },
          );
        },
        child: BlocBuilder<PasswordSettingsCubit, PasswordSettingsState>(
          builder: (context, state) {
            final formModel = context.read<PasswordSettingsCubit>().formModel;
            return AppScreen(
              isChildScrollable: true,
              noBackground: true,
              title: t.settings.changePassword,
              footer: [
                AppButton(
                  onPressed: () => context
                      .read<PasswordSettingsCubit>()
                      .changePassword(context),
                  text: t.settings.changePassword,
                ),
              ],
              child: Padding(
                padding: const .symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  spacing: 16,
                  children: [
                    AppCard(
                      child: AppTextField(
                        formControl: formModel.currentPasswordControl,
                        labelText: t.auth.password.current,
                        hintText: t.auth.password.enterCurrent,
                        isPassword: true,
                        required: true,
                      ),
                    ),
                    AppCard(
                      child: Column(
                        spacing: 8,
                        mainAxisSize: .min,
                        children: [
                          AppTextField(
                            formControl: formModel.newPasswordControl,
                            labelText: t.auth.password.kNew,
                            hintText: t.auth.password.enterNew,
                            isPassword: true,
                            required: true,
                          ),
                          AppTextField(
                            formControl: formModel.confirmPasswordControl,
                            labelText: t.auth.password.confirm,
                            hintText: t.auth.password.enterConfirm,
                            isPasswordConfirm: true,
                            required: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
