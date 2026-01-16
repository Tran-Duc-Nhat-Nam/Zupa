import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/common/models/vehicle_type.dart';

part 'member_vehicle.freezed.dart';
part 'member_vehicle.g.dart';

@freezed
sealed class MemberVehicle with _$MemberVehicle {
  const factory MemberVehicle({
    @Default('N/A') String id,
    @Default('N/A') String name,
    @Default('N/A') String phoneNumber,
    @Default('N/A') String licenseNumber,
    @Default('N/A') String parkingLotId,
    @Default(VehicleType()) VehicleType vehicleType,
    @Default('N/A') String cardId,
    @Default(86400) int expiredIn,
    @Default(0) int price,
  }) = _MemberVehicle;

  factory MemberVehicle.fromJson(Map<String, dynamic> json) =>
      _$MemberVehicleFromJson(json);
}
