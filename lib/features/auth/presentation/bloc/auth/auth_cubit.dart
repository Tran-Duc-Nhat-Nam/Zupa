import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:zupa/core/services/storage_service.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._storageService) : super(const .initial());
  final StorageService _storageService;

  Future<void> loadAuth() async {
    final biometric = await _storageService.getBiometricAuth() == true;
    emit(.loaded(biometric));
  }

  Future<void> logOut() async {
    await _storageService.removeAuth();
    emit(const .noAuthenticated());
  }

  Future<void> toggleBiometricMode(bool isOn) async {
    await _storageService.setBiometricAuth(isOn);
    emit(.loaded(isOn));
  }
}
