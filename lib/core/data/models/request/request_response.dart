import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_response.freezed.dart';
part 'request_response.g.dart';

@freezed
sealed class RequestResponse<T> with _$RequestResponse<T> {
  const factory RequestResponse.success(T data) = _Success<T>;
  const factory RequestResponse.failure(ErrorResponse error) = _Failure<T>;
  const factory RequestResponse.cancelled() = _Cancelled<T>;
}

@Freezed(genericArgumentFactories: true)
sealed class SuccessResponse<T> with _$SuccessResponse<T> {
  const factory SuccessResponse({T? data, String? message}) =
      _SuccessResponse<T>;

  factory SuccessResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$SuccessResponseFromJson(json, fromJsonT);
}

@freezed
sealed class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    required int code,
    required String errorMessage,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
