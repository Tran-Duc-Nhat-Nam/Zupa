part of 'auth_cubit.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loaded(bool isBiometric) = Loaded;
  const factory AuthState.noAuthenticated() = NoAuthenticated;
}
