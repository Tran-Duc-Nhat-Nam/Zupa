import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_checkbox.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  AppState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AppState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>()..init(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            loginSuccess: () => context.router.replaceAll([const HomeRoute()]),
            loginFailed: (message) {
              AppToast.showNotify(message, type: .error);
            },
          );
        },
        builder: (context, state) {
          final formModel = context.read<LoginCubit>().formModel;
          return AppScreen(
            hasSafeBottomArea: false,
            hasAppBar: false,
            resizeToAvoidBottomInset: true,
            child: Padding(
              padding: const .symmetric(vertical: 40, horizontal: 24),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 16,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/tsp-logo.png',
                      height: 80,
                      color: AppColors.of(context).primary,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .scale(duration: 600.ms, curve: Curves.elasticOut),
                  Center(
                    child: Text(
                      t.auth.login.title,
                      style: AppTextStyles.heading2,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms)
                      .slideY(begin: 0.5, end: 0, curve: Curves.easeOutQuad),
                  const SizedBox(height: 16),
                  AppTextField(
                    formControl: formModel.tenantControl,
                    required: true,
                    labelText: t.common.info.site,
                    prefix: const Icon(Symbols.warehouse_rounded),
                  )
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 400.ms)
                      .slideX(begin: -0.1, end: 0, curve: Curves.easeOutQuad),
                  AppTextField(
                    formControl: formModel.usernameControl,
                    required: true,
                    labelText: t.auth.login.username,
                    prefix: const Icon(Symbols.person_rounded),
                  )
                      .animate()
                      .fadeIn(delay: 500.ms, duration: 400.ms)
                      .slideX(begin: -0.1, end: 0, curve: Curves.easeOutQuad),
                  AppTextField(
                    formControl: formModel.passwordControl,
                    required: true,
                    isPassword: true,
                    labelText: t.auth.login.password,
                    prefix: const Icon(Symbols.lock_rounded),
                  )
                      .animate()
                      .fadeIn(delay: 600.ms, duration: 400.ms)
                      .slideX(begin: -0.1, end: 0, curve: Curves.easeOutQuad),
                  AppCheckbox(
                    formControl: formModel.isRememberControl,
                    label: Text(
                      t.auth.login.isRemember,
                      style: AppTextStyles.bodySmallSemibold.copyWith(
                        color: AppColors.of(context).primary,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 700.ms, duration: 400.ms),
                  AppButton(
                    onPressed: state.whenOrNull(
                      loaded: () => context.read<LoginCubit>().login,
                    ),
                    text: t.auth.login.title,
                    padding: const .all(16),
                    child: state.whenOrNull(
                      submitting: () => LoadingAnimationWidget.waveDots(
                        color: AppColors.of(context).surface,
                        size: 24,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 800.ms, duration: 400.ms)
                      .scale(begin: const Offset(0.9, 0.9), curve: Curves.easeOutBack),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
