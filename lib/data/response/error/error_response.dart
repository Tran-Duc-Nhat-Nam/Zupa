import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
sealed class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @Default(500) int code,
    @Default('Unknown error') String message,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, Object?> json)
  => _$ErrorResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}