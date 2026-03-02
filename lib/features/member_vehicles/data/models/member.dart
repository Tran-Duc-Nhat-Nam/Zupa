import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/data/models/vehicle/vehicle.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
sealed class Member with _$Member {
  const factory Member({
    @Default('') String id,
    @JsonKey(name: 'site_id') @Default('') String siteId,
    @Default('') String name,
    @Default('') String phone,
    @Default([]) List<Vehicle> vehicles,
    @JsonKey(name: 'membership_fee') @Default(0.0) double membershipFee,
    @JsonKey(name: 'expiry_date') @DateTimeConverter() required DateTime expiryDate,
    @JsonKey(name: 'created_at') @DateTimeConverter() required DateTime createdAt,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
