import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/di/injection.dart';

import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_checkbox.dart';
import 'package:zupa/core/widgets/app_loading_widget.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/widgets/wrapper/app_form_text_field.dart';
import 'package:zupa/core/widgets/wrapper/app_input_wrapper.dart';
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
    final colorScheme = context.colorScheme;

    return LoginFormBuilder(
      builder: (context, formModel, _) => BlocProvider<LoginCubit>(
        create: (context) => getIt<LoginCubit>()..init(),
        child: BlocListener<LoginCubit, LoginState>(
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
                }
              },
              loginSuccess: () =>
                  context.router.replaceAll([const HomeRoute()]),
              loginFailed: (message) => message != null
                  ? MessageHelper.showError(
                      context,
                      message: message,
                      title: t.common.errors.loginFailed,
                    )
                  : AppToast.showToast(
                      t.common.errors.unknown,
                      context: context,
                    ),
            );
          },
          child: AppScreen(
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
                  AppFormTextField.form(
                    control: formModel.tenantControl,
                    errorText: t.common.errors.required,
                    labelText: t.common.info.site,
                    prefixIcon: Symbols.warehouse_rounded,
                  ).animateIn(index: 2),
                  AppFormTextField.form(
                    control: formModel.usernameControl,
                    errorText: t.common.errors.required,
                    labelText: t.auth.login.username,
                    prefixIcon: Symbols.person_rounded,
                  ).animateIn(index: 3),
                  AppFormTextField.form(
                    control: formModel.passwordControl,
                    errorText: t.common.errors.required,
                    labelText: t.auth.login.password,
                    isPassword: true,
                    prefixIcon: Symbols.lock_rounded,
                  ).animateIn(index: 4),
                  AppInputWrapper<bool>(
                    control: formModel.isRememberControl,
                    builder: (value, onChanged, _) => AppCheckbox(
                      value: value == true,
                      onChanged: onChanged,
                      label: Text(
                        t.auth.login.isRemember,
                        style: AppTextStyles.bodySmallSemibold.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ).animateIn(index: 5),
                  const SizedBox.shrink(),
                  ReactiveLoginFormConsumer(
                    builder: (context, formModel, _) =>
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) => AppButton(
                            onPressed: () => context.read<LoginCubit>().login(
                              params: formModel.model.toParams(),
                            ),
                            text: t.auth.login.title,
                            isLoading: state is Submitting || state is Loading,
                            isDisabled: formModel.form.invalid,
                            padding: const .all(16),
                            loadingChild: const AppLoadingWidget(size: .small,),
                          ).animateIn(index: 6),
                        ),
                  ),
                  const SizedBox(height: 96),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
