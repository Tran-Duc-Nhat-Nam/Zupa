import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_checkbox.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>()..init(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            loginSuccess: () => context.router.replaceAll([
              const HomeRoute(),
            ]),
            loginFailed: (message) {
              AppToast.showNotify(message, type: .error);
            },
          );
        },
        builder: (context, state) {
          return AppScreen(
            hasSafeBottomArea: false,
            hasAppBar: false,
            formGroup: context.read<LoginCubit>().form,
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
                      color: ThemeHelper.getColor(context).primary500,
                    ),
                  ),
                  Center(
                    child: Text(t.title.login, style: AppTextStyles.heading2),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    name: 'tenant',
                    required: true,
                    labelText: t.site,
                    prefix: const Icon(Icons.warehouse_outlined),
                  ),
                  AppTextField(
                    name: 'username',
                    required: true,
                    labelText: t.username,
                    prefix: const Icon(Icons.person_outline_rounded),
                  ),
                  AppTextField(
                    name: 'password',
                    required: true,
                    isPassword: true,
                    labelText: t.password,
                    prefix: const Icon(Icons.lock_outline_rounded),
                  ),
                  AppCheckbox(
                    name: 'isRemember',
                    label: Text(
                      t.isRemember,
                      style: AppTextStyles.bodySmallSemibold.copyWith(
                        color: ThemeHelper.getColor(context).primary400,
                      ),
                    ),
                  ),
                  AppButton(
                    isForm: true,
                    onPressed: state.whenOrNull(
                      loaded: () => context.read<LoginCubit>().login,
                    ),
                    text: t.title.login,
                    padding: const .all(16),
                    child: state.whenOrNull(
                      submitting: () => LoadingAnimationWidget.waveDots(
                        color: ThemeHelper.getColor(context).white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
