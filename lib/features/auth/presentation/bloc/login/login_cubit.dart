import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/storage_service.dart';

import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/features/auth/presentation/models/login_form.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authRepo;

  LoginCubit(this._authRepo) : super(const .initial());

  final _storageService = getIt<StorageService>();

  final formModel = LoginForm(LoginForm.formElements(Login()), null, null);

  Future<void> init() async {
    final accountInfo = await _storageService.getAccountInfo();
    final bool isSavedRemember =
        accountInfo.tenant.isNotEmpty &&
        accountInfo.username.isNotEmpty &&
        accountInfo.password.isNotEmpty;
    if (isSavedRemember) {
      formModel.tenantControl.value = accountInfo.tenant;
      formModel.usernameControl.value = accountInfo.username;
      formModel.passwordControl.value = accountInfo.password;
      formModel.isRememberControl.value = true;
    }
    emit(const .loaded());
  }

  Future<void> load({
    String? tenant,
    String? username,
    bool? isRemember,
  }) async {
    if (tenant != null || username != null) {
      if (tenant != null) formModel.tenantControl.value = tenant;
      if (username != null) formModel.usernameControl.value = username;
      if (isRemember != null) formModel.isRememberControl.value = isRemember;
      emit(const .loaded());
    }
  }

  Future<void> login() async {
    if (formModel.form.valid) {
      emit(const .submitting());
      try {
        final result = await _authRepo.logIn(
          tenant: formModel.tenantControl.value ?? '',
          username: formModel.usernameControl.value ?? '',
          password: formModel.passwordControl.value ?? '',
        );
        result.maybeWhen(
          success: (data) async {
            await _storageService.setAuth(data.accessToken);

            if (formModel.isRememberControl.value == true) {
              await _storageService.saveAccountInfo(
                formModel.tenantControl.value ?? '',
                formModel.usernameControl.value ?? '',
                formModel.passwordControl.value ?? '',
              );
            } else {
              await _storageService.removeAccountInfo();
            }
            emit(const .loginSuccess());
          },
          error: (message) {
            emit(.loginFailed(message));
            emit(const .loaded());
          },
          orElse: () {
            emit(const .loginFailed('error'));
            emit(const .loaded());
          },
        );
      } catch (e) {
        emit(.loginFailed(e.toString()));
        emit(const .loaded());
      }
    } else {
      formModel.form.markAllAsTouched();
      emit(const .loginFailed('error'));
      emit(const .loaded());
    }
  }
}
