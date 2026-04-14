import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/symbols.dart';
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
    final model = Login.fromParams(.initial());
    return LoginFormBuilder(
      model: model,
      builder: (context, formModel, _) {
        return BlocProvider<LoginCubit>(
          create: (context) => getIt<LoginCubit>()..init(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (tenant, username, password, isRemember) {
                  if (isRemember == true) {
                    formModel.tenantValuePatch(tenant ?? '');
                    formModel.usernameValuePatch(username ?? '');
                    formModel.passwordValuePatch(password ?? '');
                    formModel.isRememberValuePatch(true);
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
                resizeToAvoidBottomInset: true,
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
                          'TSP Parking',
                          style: AppTextStyles.displayMediumBold.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ).animateIn(index: 1),
                      const SizedBox(height: 8),
                      AppTextField(
                        formControl: formModel.tenantControl,
                        required: true,
                        labelText: t.common.info.site,
                        prefix: const Icon(Symbols.warehouse_rounded),
                      ).animateIn(index: 2),
                      AppTextField(
                        formControl: formModel.usernameControl,
                        required: true,
                        labelText: t.auth.login.username,
                        prefix: const Icon(Symbols.person_rounded),
                      ).animateIn(index: 3),
                      AppTextField(
                        formControl: formModel.passwordControl,
                        required: true,
                        isPassword: true,
                        labelText: t.auth.login.password,
                        prefix: const Icon(Symbols.lock_rounded),
                      ).animateIn(index: 4),
                      AppCheckbox(
                        formControl: formModel.isRememberControl,
                        label: Text(
                          t.auth.login.isRemember,
                          style: AppTextStyles.bodySmallSemibold.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ).animateIn(index: 5),
                      const SizedBox(height: 0),
                      AppButton(
                        onPressed: () =>
                            state is! Submitting && state is! Loading
                            ? context.read<LoginCubit>().login(
                                params: formModel.model.toParams(),
                              )
                            : null,
                        text: t.auth.login.title,
                        padding: const .all(16),
                        child: state.whenOrNull(
                          submitting: () => LoadingAnimationWidget.waveDots(
                            color: colorScheme.surface,
                            size: 24,
                          ),
                        ),
                      ).animateIn(index: 6),
                      const SizedBox(height: 72),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
