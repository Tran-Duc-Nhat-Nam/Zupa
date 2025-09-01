import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../bloc/login/login_cubit.dart';
import '../../helper/theme/theme_helper.dart';
import '../../common/styles/text_styles.dart';
import '../../data/request/account/account_request.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_screen.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/popup/app_toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit()..load(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            loginSuccess: () => context.mounted
                ? context.go('/')
                : AppToast.showErrorToast(
                    'Xảy ra lỗi không xác định! Vui lòng thoát ứng dụng và vào lại để đảm bảo ứng dụng hoạt động bình thường.',
                  ),
            loginFailed: (message) {
              AppToast.showErrorToast(message);
              context.read<LoginCubit>().load();
            },
          );
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return AppScreen(
              hasSafeBottomArea: false,
              hasAppBar: false,
              resizeToAvoidBottomInset: true,
              child: FormBuilder(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: Image.asset(
                          'assets/images/tsp-logo.png',
                          height: 80,
                        ),
                      ),
                      Center(
                        child: Text(
                          context.tr('title.login'),
                          style: AppTextStyles.heading6,
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
                      const SizedBox(height: 8),
                      AppTextField(
                        name: 'tenant',
                        required: true,
                        isExternalLabel: true,
                        labelText: context.tr('site'),
                        hintText: context.tr('site'),
                      ),
                      AppTextField(
                        name: 'username',
                        required: true,
                        isExternalLabel: true,
                        labelText: context.tr('username'),
                        hintText: context.tr('username'),
                      ),
                      AppTextField(
                        name: 'password',
                        required: true,
                        isPassword: true,
                        isExternalLabel: true,
                        labelText: context.tr('password'),
                        hintText: context.tr('password'),
                      ),
                      const SizedBox(height: 8),
                      AppButton(
                        onPressed: switch (state) {
                          Loaded() => () {
                            formKey.currentState?.saveAndValidate();
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                context,
                                AccountRequest(
                                  tenant: formKey.currentState!.value['tenant'],
                                  username:
                                      formKey.currentState!.value['username'],
                                  password:
                                      formKey.currentState!.value['password'],
                                ),
                              );
                            }
                          },
                          _ => null,
                        },
                        text: context.tr('title.login'),
                        child: switch (state) {
                          Submitting() => LoadingAnimationWidget.waveDots(
                            color: ThemeHelper.getColor(context).white,
                            size: 24,
                          ),
                          _ => null,
                        },
                      ),
                      const SizedBox(height: 16),
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
