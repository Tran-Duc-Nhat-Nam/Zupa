import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';

import 'package:zupa/features/settings/domain/repository/settings_repository.dart';

part 'password_settings_state.dart';
part 'password_settings_cubit.freezed.dart';

@injectable
class PasswordSettingsCubit extends Cubit<PasswordSettingsState> {
  final ISettingsRepository _repository;

  PasswordSettingsCubit(this._repository) : super(const PasswordSettingsState.initial());

  void init() {
    emit(const PasswordSettingsState.loaded());
  }

  Future<void> changePassword(String currentPassword, String newPassword) async {
    final result = await _repository.changePassword(currentPassword, newPassword);
    
    result.when(
      initial: () {},
      loading: () {},
      success: (_) => emit(const PasswordSettingsState.changePasswordSuccess()),
      error: (message) => emit(PasswordSettingsState.changePasswordFailed(message)),
    );
  }
}

