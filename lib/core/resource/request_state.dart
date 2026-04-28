import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@freezed
sealed class RequestState<T> with _$RequestState<T> {
  const factory RequestState.initial() = _Initial;

  const factory RequestState.loading() = _Loading;

  const factory RequestState.success(T data) = _Success;

  const factory RequestState.error(String? message) = _Error;

  const factory RequestState.unauthenticated() = _Unauthenticated;
}
