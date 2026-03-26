import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/data/models/site/site.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    @Default(0) int id,
    @DateTimeConverter() DateTime? dateCreated,
    @DateTimeConverter() DateTime? lastUpdated,
    @Default(0) int version,
    @Default(Site()) Site tenant,
    String? secret,
    @Default('') String fullName,
    @Default('') String username,
    dynamic metadata,
    dynamic appRoles,
    @Default('') String email,
    int? tenantUserId,
    @Default('') String phoneNumber,
    String? position,
    int? parentId,
    @Default(0) int staffId,
    String? avatar,
    @Default('') String department,
    @Default(false) bool accountEnabled,
    @Default(false) bool accountExpired,
    @Default(false) bool accountLocked,
    @Default(false) bool isCustomer,
    @Default(0) int customerId,
    int? staffMetaDataId,
    @Default(false) bool using2FA,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
