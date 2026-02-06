import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/password/domain/repository/password_repository.dart';
import 'package:zupa/features/password/presentation/models/change_password_form.dart';

part 'password_settings_state.dart';
part 'password_settings_cubit.freezed.dart';

@injectable
class PasswordSettingsCubit extends Cubit<PasswordSettingsState> {
  final IPasswordRepository _repository;

  PasswordSettingsCubit(this._repository) : super(const .initial());

  final formModel = ChangePasswordForm(
    ChangePasswordForm.formElements(ChangePassword()),
    null,
    null,
  );

  void init() {
    emit(const .loaded());
  }

  Future<void> changePassword() async {
    if (formModel.form.valid) {
      final result = await _repository.changePassword(
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
