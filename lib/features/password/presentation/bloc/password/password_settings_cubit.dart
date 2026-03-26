import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/features/password/domain/repository/password_repository.dart';
import 'package:zupa/features/password/presentation/models/change_password_form.dart';

part 'password_settings_cubit.freezed.dart';
part 'password_settings_state.dart';

@injectable
class PasswordSettingsCubit extends Cubit<PasswordSettingsState> {
  final IPasswordRepository _repository;
  final AuthCubit _authCubit;

  PasswordSettingsCubit(this._repository, this._authCubit)
    : super(const .initial());

  final formModel = ChangePasswordForm(
    ChangePasswordForm.formElements(ChangePassword()),
    null,
    null,
  );

  void init() {
    emit(const .loaded());
  }

  Future<void> changePassword(BuildContext context) async {
    if (formModel.form.valid) {
      final staffMetaDataId = _authCubit.state.maybeWhen(
        loaded: (_, user) => user?.staffMetaDataId ?? user?.staffId,
        orElse: () => null,
      );

      if (staffMetaDataId == null) {
        context.read<AuthCubit>().logOut();
        return;
      }

      emit(const .loading());

      final result = await _repository.changePassword(
        staffMetaDataId.toString(),
        formModel.currentPasswordControl.value ?? '',
        formModel.newPasswordControl.value ?? '',
      );

      result.whenOrNull(
        success: (_) => emit(const .changePasswordSuccess()),
        error: (message) => emit(.changePasswordFailed(message)),
      );
    } else {
      formModel.form.markAllAsTouched();
    }
  }
}
