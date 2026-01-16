import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_response.freezed.dart';
part 'success_response.g.dart';

@freezed
sealed class SuccessResponse with _$SuccessResponse {
  const factory SuccessResponse({
    @Default(200) int code,
    required dynamic data,
    @Default('Success') String message,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);
}
