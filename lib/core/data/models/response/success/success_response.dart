import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_response.freezed.dart';
part 'success_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class SuccessResponse<T> with _$SuccessResponse<T> {
  const factory SuccessResponse({
    @Default(200) int code,
    required T data,
    @Default('Success') String message,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$SuccessResponseFromJson(json, fromJsonT);
}
