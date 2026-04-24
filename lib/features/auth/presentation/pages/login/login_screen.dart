import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/di/injection.dart';

import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_checkbox.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:zupa/features/auth/presentation/models/login/login_form.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  AppState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AppState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return LoginFormBuilder(
      builder: (context, formModel, _) => BlocProvider<LoginCubit>(
        create: (context) => getIt<LoginCubit>()..init(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (tenant, username, password, isRemember) {
                if (isRemember == true) {
                  formModel.updateValue(
                    Login(
                      tenant: tenant ?? '',
                      username: username ?? '',
                      password: password ?? '',
                      isRemember: true,
                    ),
                  );
                  formModel.form.markAllAsTouched();
                }
              },
              loginSuccess: () =>
                  context.router.replaceAll([const HomeRoute()]),
              loginFailed: (message) {
                message != null
                    ? MessageHelper.showError(
                        context,
                        message: message,
                        title: t.common.errors.loginFailed,
                      )
                    : AppToast.showToast(
                        t.common.errors.unknown,
                        context: context,
                      );
              },
            );
          },
          builder: (context, state) {
            return AppScreen(
              hasAppBar: false,
              child: Padding(
                padding: const .symmetric(vertical: 40, horizontal: 24),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  spacing: 16,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/park.png',
                        height: 72,
                        color: colorScheme.primary,
                      ),
                    ).animateIn(),
                    Center(
                      child: Text(
                        'ZUPA',
                        style: AppTextStyles.displayMediumBold.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ).animateIn(index: 1),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder<String>(
                      formControl: formModel.tenantControl,
                      builder: (context, control, child) => AppTextField(
                        labelText: t.common.info.site,
                        prefixIcon: Symbols.warehouse_rounded,
                        initialValue: control.value,
                        onChanged: (val) => control.updateValue(val),
                        errorText: control.invalid && control.touched
                            ? t.common.errors.required
                            : null,
                      ),
                    ).animateIn(index: 2),
                    ReactiveValueListenableBuilder<String>(
                      formControl: formModel.usernameControl,
                      builder: (context, control, child) => AppTextField(
                        labelText: t.auth.login.username,
                        prefixIcon: Symbols.person_rounded,
                        initialValue: control.value,
                        onChanged: (val) => control.updateValue(val),
                        errorText: control.invalid && control.touched
                            ? t.common.errors.required
                            : null,
                      ),
                    ).animateIn(index: 3),
                    ReactiveValueListenableBuilder<String>(
                      formControl: formModel.passwordControl,
                      builder: (context, control, child) => AppTextField(
                        labelText: t.auth.login.password,
                        isPassword: true,
                        prefixIcon: Symbols.lock_rounded,
                        initialValue: control.value,
                        onChanged: (val) => control.updateValue(val),
                        errorText: control.invalid && control.touched
                            ? t.common.errors.required
                            : null,
                      ),
                    ).animateIn(index: 4),
                    ReactiveValueListenableBuilder<bool>(
                      formControl: formModel.isRememberControl,
                      builder: (context, control, child) => AppCheckbox(
                        value: control.value == true,
                        onChanged: (val) => control.updateValue(val),
                        label: Text(
                          t.auth.login.isRemember,
                          style: AppTextStyles.bodySmallSemibold.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ).animateIn(index: 5),
                    const SizedBox(height: 0),
                    AppButton(
                      onPressed: () => context.read<LoginCubit>().login(
                        params: formModel.model.toParams(),
                      ),
                      text: t.auth.login.title,
                      isLoading: state is Submitting || state is Loading,
                      isDisabled: formModel.form.invalid,
                      padding: const .all(16),
                      loadingChild: LoadingAnimationWidget.staggeredDotsWave(
                        color: colorScheme.surface,
                        size: 36,
                      ),
                    ).animateIn(index: 6),
                    const SizedBox(height: 96),
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
