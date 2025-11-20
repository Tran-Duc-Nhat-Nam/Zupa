import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_settings_state.dart';
part 'password_settings_cubit.freezed.dart';

class PasswordSettingsCubit extends Cubit<PasswordSettingsState> {
  PasswordSettingsCubit() : super(const .initial());

  void init() {
    emit(const .loaded());
  }

  void changePassword(String currentPassword, String newPassword) {
    emit(const .changePasswordSuccess());
  }
}
