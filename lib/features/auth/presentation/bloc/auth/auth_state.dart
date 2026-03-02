part of 'auth_cubit.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loaded({required bool isBiometric, User? user}) =
      Loaded;
  const factory AuthState.noAuthenticated() = NoAuthenticated;
}
