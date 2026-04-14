import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:zupa/features/auth/domain/usecases/params/change_password_params.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';

part 'password_settings_cubit.freezed.dart';
part 'password_settings_state.dart';

@injectable
class PasswordSettingsCubit extends Cubit<PasswordSettingsState> {
  final ChangePasswordUseCase _changePassword;
  final AuthCubit _authCubit;

  PasswordSettingsCubit(this._changePassword, this._authCubit)
    : super(const .initial());

  void init() {
    emit(const .loaded());
  }

  Future<void> changePassword({required ChangePasswordParams params}) async {
    final staffMetaDataId = _authCubit.state.maybeWhen(
      loaded: (_, user) => user?.staffMetaDataId ?? user?.staffId,
      orElse: () => null,
    );

    if (staffMetaDataId == null) {
      _authCubit.logOut();
      return;
    }

    final newParams = ChangePasswordParams(
      id: staffMetaDataId,
      currentPassword: params.currentPassword,
      newPassword: params.newPassword,
    );

    emit(const .loading());

    final result = await _changePassword(params: newParams);

    result.whenOrNull(
      success: (_) => emit(const .changePasswordSuccess()),
      error: (message) => emit(.changePasswordFailed(message)),
    );
  }
}
