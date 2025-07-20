import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../screens/camera/models/vehicle_type.dart';

part 'member_vehicles_filter.freezed.dart';
part 'member_vehicles_filter.g.dart';

@freezed
sealed class MemberVehiclesFilter with _$MemberVehiclesFilter {
  const factory MemberVehiclesFilter({
    String? keyword,
    DateTime? time,
    VehicleType? type,
  }) = _MemberVehiclesFilter;

  factory MemberVehiclesFilter.fromJson(Map<String, dynamic> json) =>
      _$MemberVehiclesFilterFromJson(json);
}