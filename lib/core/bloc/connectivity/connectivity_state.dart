part of 'connectivity_cubit.dart';

@freezed
sealed class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.initial() = Initial;

  const factory ConnectivityState.connected() = Connected;

  const factory ConnectivityState.disconnected() = Disconnected;
}
