import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/features/parking/data/model/parking_lot.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
sealed class Site with _$Site {
  const factory Site({
    @Default('') String id,
    @Default('') String code,
    @Default('') String name,
    @Default('') String fullName,
    @Default([]) List<User> users,
    @JsonKey(name: 'parking_lots') @Default([]) List<ParkingLot> parkingLots,
    String? logo,
    String? logoFullSizeUrl,
    @Default('') String address,
    String? phoneNumber,
    @Default('') String email,
    @Default('') String currency,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) =>
      _$SiteFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}