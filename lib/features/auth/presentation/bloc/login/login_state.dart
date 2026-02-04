part of 'login_cubit.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.loaded() = Loaded;
  const factory LoginState.submitting() = Submitting;
  const factory LoginState.loginSuccess() = LoginSuccess;
  const factory LoginState.loginFailed(String message) = LoginFailed;
}
