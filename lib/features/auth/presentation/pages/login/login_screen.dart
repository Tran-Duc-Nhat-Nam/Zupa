import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zupa/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_checkbox.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>()..init(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            loginSuccess: () => context.goNamed(AppRoutes.home),
            loginFailed: (message) {
              AppToast.showErrorToast(message);
              final values = formKey.currentState?.value;
              context.read<LoginCubit>().load(
                tenant: values?['tenant'],
                username: values?['username'],
                isRemember: values?['isRemember'],
              );
            },
          );
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is Loaded) {
              formKey.currentState?.patchValue({
                'tenant': state.tenant,
                'username': state.username,
                'password': state.password,
                'isRemember': state.isRemember,
              });
            }
            return AppScreen(
              hasSafeBottomArea: false,
              hasAppBar: false,
              resizeToAvoidBottomInset: true,
              child: FormBuilder(
                key: formKey,
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
                        ),
                      ),
                      Center(
                        child: Text(
                          context.tr('title.login'),
                          style: AppTextStyles.heading2,
                        ),
                      ),
                      Center(
                        child: Text(
                          context.tr('subtitle.login'),
                          style: AppTextStyles.bodyMediumRegular.copyWith(
                            color: ThemeHelper.getColor(context).grey400,
                          ),
                        ),
                      ),
                      AppTextField(
                        name: 'tenant',
                        required: true,
                        labelText: context.tr('site'),
                        prefix: const Icon(Icons.warehouse_outlined),
                        // hintText: context.tr('site'),
                      ),
                      AppTextField(
                        name: 'username',
                        required: true,
                        labelText: context.tr('username'),
                        prefix: const Icon(Icons.person_outline_rounded),
                        // hintText: context.tr('username'),
                      ),
                      AppTextField(
                        name: 'password',
                        required: true,
                        isPassword: true,
                        labelText: context.tr('password'),
                        prefix: const Icon(Icons.lock_outline_rounded),
                        // hintText: context.tr('password'),
                      ),
                      AppCheckbox(
                        name: 'isRemember',
                        label: Text(
                          context.tr('isRemember'),
                          style: AppTextStyles.bodySmallMedium.copyWith(
                            color: ThemeHelper.getColor(context).grey700,
                          ),
                        ),
                      ),
                      AppButton(
                        onPressed: state.whenOrNull(
                          loaded: (_, _, _, value) => () {
                            formKey.currentState?.saveAndValidate();
                            if (formKey.currentState?.validate() ?? false) {
                              context.read<LoginCubit>().login(
                                tenant:
                                    formKey.currentState?.value['tenant'] ?? '',
                                username:
                                    formKey.currentState?.value['username'] ??
                                    '',
                                password:
                                    formKey.currentState?.value['password'] ??
                                    '',
                                isRemember:
                                    formKey.currentState?.value['isRemember'] ??
                                    false,
                              );
                            }
                          },
                        ),
                        text: context.tr('title.login'),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
