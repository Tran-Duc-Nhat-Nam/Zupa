import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/password/presentation/bloc/password/password_settings_cubit.dart';
import 'package:zupa/gen/strings.g.dart';

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
              AppToast.showNotify(t.success);
              context.read<PasswordSettingsCubit>().init();
            },
            changePasswordFailed: (message) {
              AppToast.showNotify(message);
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
              title: t.changePassword,
              footer: [
                AppButton(
                  onPressed: context.read<PasswordSettingsCubit>().changePassword,
                  text: t.changePassword,
                ),
              ],
              child: Padding(
                padding: const .symmetric(vertical: 16, horizontal: 24),
                child: AppCard(
                  child: Column(
                    spacing: 8,
                    mainAxisSize: .min,
                    children: [
                      AppTextField(
                        formControl: formModel.currentPasswordControl,
                        labelText: t.currentPassword,
                        hintText: t.enterCurrentPassword,
                        isExternalLabel: true,
                        isPassword: true,
                        required: true,
                      ),
                      Divider(color: ThemeHelper.getColor(context).grey100),
                      AppTextField(
                        formControl: formModel.newPasswordControl,
                        labelText: t.newPassword,
                        hintText: t.enterNewPassword,
                        isExternalLabel: true,
                        isPassword: true,
                        required: true,
                      ),
                      AppTextField(
                        formControl: formModel.confirmPasswordControl,
                        labelText: t.confirmPassword,
                        hintText: t.confirmPassword,
                        isPasswordConfirm: true,
                        required: true,
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
