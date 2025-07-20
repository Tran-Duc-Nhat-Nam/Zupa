import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/api/account/account_api.dart';
import '../../data/request/account/account_request.dart';
import '../../helper/api/api_helper.dart';
import '../../helper/auth/auth_helper.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  void load() {
    emit(const LoginState.loaded(true));
  }

  void login(BuildContext context, AccountRequest data) {
    emit(const LoginState.submitting());
    ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => AccountAPI(dio).login(
        AccountRequest(
          tenant: data.tenant,
          username: data.username,
          password: data.password,
        ),
      ),
      onSuccess: (response) async {
        await AuthHelper.setAuth(response.data['accessToken']);
        emit(const LoginState.loginSuccess());
      },
      onFailed: (response) => emit(
        LoginState.loginFailed(response.message),
      ),
      onError: (response) => emit(
        LoginState.loginFailed(response.toString()),
      ),
    );
  }
}
