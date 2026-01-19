import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/services/storage_service.dart';

import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/core/helper/auth/auth_helper.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authRepo;

  LoginCubit(this._authRepo) : super(const .initial());

  final _storageService = GetIt.instance<StorageService>();

  Future<void> init() async {
    final accountInfo = await _storageService.getAccountInfo();
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
