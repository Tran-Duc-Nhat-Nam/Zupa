import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';

import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authRepo;

  LoginCubit(this._authRepo) : super(const .initial());

  final _storageService = getIt<StorageService>();

  final FormGroup form = fb.group({
    'tenant': ['', Validators.required],
    'username': ['', Validators.required],
    'password': ['', Validators.required],
    'isRemember': [false],
  });

  Future<void> init() async {
    final accountInfo = await _storageService.getAccountInfo();
    final bool isSavedRemember =
        accountInfo.tenant.isNotEmpty &&
        accountInfo.username.isNotEmpty &&
        accountInfo.password.isNotEmpty;
    if (isSavedRemember) {
      form.patchValue({
        'tenant': accountInfo.tenant,
        'username': accountInfo.username,
        'password': accountInfo.password,
        'isRemember': isSavedRemember,
      });
    }
    emit(const LoginState.loaded());
  }

  Future<void> load({
    String? tenant,
    String? username,
    bool? isRemember,
  }) async {
    if (tenant != null || username != null) {
      form.patchValue({
        'tenant': tenant,
        'username': username,
        'isRemember': isRemember,
      });
      emit(const LoginState.loaded());
    }
  }

  Future<void> login() async {
    if (form.valid) {
      emit(const .submitting());
      try {
        await _authRepo.logIn(
          tenant: form.control('tenant').value,
          username: form.control('username').value,
          password: form.control('password').value,
          isRemember: form.control('isRemember').value,
        );
        emit(const .loginSuccess());
      } catch (e) {
        emit(.loginFailed(e.toString()));
      }
    } else {
      form.markAllAsTouched();
    }
  }
}
