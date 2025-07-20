part of 'password_settings_cubit.dart';

@freezed
sealed class PasswordSettingsState with _$PasswordSettingsState {
  const factory PasswordSettingsState.initial() = Initial;
  const factory PasswordSettingsState.loading() = Loading;
  const factory PasswordSettingsState.loaded() = Loaded;
  const factory PasswordSettingsState.changePasswordSuccess() = ChangePasswordSuccess;
  const factory PasswordSettingsState.changePasswordFailed(String message) = ChangePasswordFailed;
}
