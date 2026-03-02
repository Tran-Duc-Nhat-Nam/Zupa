import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request.freezed.dart';
part 'change_password_request.g.dart';

@freezed
sealed class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    @Default('') String oldPassword,
    @Default('') String newPassword,
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, Object?> json) =>
      _$ChangePasswordRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
