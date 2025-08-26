import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_request.freezed.dart';
part 'account_request.g.dart';

@freezed
sealed class AccountRequest with _$AccountRequest {
  const factory AccountRequest({
    @Default('site') String tenant,
    @Default('name') String username,
    @Default('password') String password,
  }) = _AccountRequest;

  factory AccountRequest.fromJson(Map<String, Object?> json)
  => _$AccountRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}