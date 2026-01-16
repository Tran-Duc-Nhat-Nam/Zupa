import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/helper/auth/auth_helper.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const .initial());

  Future<void> loadAuth() async {
    emit(.loaded(await AuthHelper.getBiometricAuth() == true));
  }

  void toggleBiometricMode(bool isOn) {
    AuthHelper.setBiometricAuth(isOn);
    emit(.loaded(isOn));
  }
}
