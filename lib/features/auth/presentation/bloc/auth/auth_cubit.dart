import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/services/auth_status_service.dart';
import 'package:zupa/core/services/storage_service.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._storageService, this._authStatusService)
    : super(const .initial()) {
    _unauthorizedSubscription = _authStatusService.unauthorizedEvents.listen(
      (_) => logOut(),
    );
  }

  final StorageService _storageService;
  final AuthStatusService _authStatusService;
  StreamSubscription? _unauthorizedSubscription;

  Future<void> loadAuth() async {
    final biometric = await _storageService.getBiometricAuth() == true;
    final user = await _storageService.getUser();
    emit(.loaded(isBiometric: biometric, user: user));
  }

  Future<void> logOut() async {
    await _storageService.removeAuth();
    await _storageService.removeUser();
    emit(const .noAuthenticated());
  }

  Future<void> toggleBiometricMode(bool isOn) async {
    await _storageService.setBiometricAuth(isOn);
    final user = await _storageService.getUser();
    emit(.loaded(isBiometric: isOn, user: user));
  }

  @override
  Future<void> close() {
    _unauthorizedSubscription?.cancel();
    return super.close();
  }
}
