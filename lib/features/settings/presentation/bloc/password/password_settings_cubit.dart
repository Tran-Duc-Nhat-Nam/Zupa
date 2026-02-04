import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/resource/network_state.dart';

import 'package:zupa/features/settings/domain/repository/settings_repository.dart';

part 'password_settings_state.dart';
part 'password_settings_cubit.freezed.dart';

@injectable
class PasswordSettingsCubit extends Cubit<PasswordSettingsState> {
  final ISettingsRepository _repository;

  PasswordSettingsCubit(this._repository) : super(const .initial());

  final FormGroup form = fb.group(
    {
      'currentPassword': ['', Validators.required],
      'newPassword': ['', Validators.required],
    },
    [const MustMatchValidator('newPassword', 'confirmPassword', true)],
  );

  void init() {
    emit(const .loaded());
  }

  Future<void> changePassword() async {
    if (form.valid) {
      final result = await _repository.changePassword(
        form.control('currentPassword').value,
        form.control('newPassword').value,
      );

      result.whenOrNull(
        success: (_) => emit(const .changePasswordSuccess()),
        error: (message) => emit(.changePasswordFailed(message)),
      );
    } else {
      form.markAllAsTouched();
    }
  }
}
