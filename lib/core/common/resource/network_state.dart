import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_state.freezed.dart';

@freezed
sealed class NetworkState<T> with _$NetworkState<T> {
  const factory NetworkState.initial() = _Initial;
  const factory NetworkState.loading() = _Loading;
  const factory NetworkState.success(T data) = _Success;
  const factory NetworkState.error(String message) = _Error;
}
