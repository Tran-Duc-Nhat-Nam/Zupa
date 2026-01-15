import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/authentication_repository.dart';
import '../../helper/auth/auth_helper.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authRepo;

  LoginCubit(this._authRepo) : super(const LoginState.initial());

  Future<void> load({
    String? tenant,
    String? username,
    bool? isRemember,
  }) async {
    if (tenant != null || username != null) {
      emit(
        LoginState.loaded(
          tenant ?? '',
          username ?? '',
          '',
          isRemember ?? false,
        ),
      );
      return;
    }
    final accountInfo = await AuthHelper.getAccountInfo();
    log('Loading login screen');
    bool isSavedRemember = false;
    if (accountInfo.tenant.isNotEmpty &&
        accountInfo.username.isNotEmpty &&
        accountInfo.password.isNotEmpty) {
      isSavedRemember = true;
    }
    log('Save info: $accountInfo');
    emit(
      LoginState.loaded(
        accountInfo.tenant,
        accountInfo.username,
        accountInfo.password,
        isSavedRemember,
      ),
    );
  }

  Future<void> login({
    String tenant = '',
    String username = '',
    String password = '',
    bool isRemember = false,
  }) async {
    emit(const .submitting());
    try {
      await _authRepo.logIn(
        tenant: tenant,
        username: username,
        password: password,
        isRemember: isRemember,
      );
      emit(const .loginSuccess());
    } catch (e) {
      emit(.loginFailed(e.toString()));
    }
  }
}
