import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/di/injection.dart';

import 'package:zupa/core/services/storage_service.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const .initial());

  final _storageService = getIt<StorageService>();

  Future<void> loadAuth() async {
    emit(.loaded(await _storageService.getBiometricAuth() == true));
  }

  Future<void> logOut() async {
    await _storageService.removeAuth();
    emit(const .noAuthenticated());
  }

  void toggleBiometricMode(bool isOn) {
    _storageService.setBiometricAuth(isOn);
    emit(.loaded(isOn));
  }
}
