import 'dart:developer';

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
  LoginCubit() : super(const .initial());

  Future<void> load() async {
    final accountInfo = await AuthHelper.getAccountInfo();
    log('Loading login screen');
    bool isRemember = false;
    if (accountInfo.tenant.isNotEmpty &&
        accountInfo.username.isNotEmpty &&
        accountInfo.password.isNotEmpty) {
      isRemember = true;
    }
    log('Save info: $accountInfo');
    emit(
      .loaded(
        accountInfo.tenant,
        accountInfo.username,
        accountInfo.password,
        isRemember,
      ),
    );
  }

  void login(
    BuildContext context, {
    String tenant = '',
    String username = '',
    String password = '',
    bool isRemember = false,
  }) {
    emit(const .submitting());
    final payload = AccountRequest(
      tenant: tenant,
      username: username,
      password: password,
    );
    ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => AccountAPI(dio).login(payload),
      onSuccess: (response) async {
        await AuthHelper.setAuth(response.data['accessToken']);
        isRemember
            ? await AuthHelper.saveAccountInfo(payload)
            : await AuthHelper.removeAccountInfo();
        emit(const .loginSuccess());
      },
      onFailed: (response) => emit(.loginFailed(response.message)),
      onError: (response) => emit(.loginFailed(response.toString())),
    );
  }
}
