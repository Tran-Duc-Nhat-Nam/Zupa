import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/screens/camera/models/vehicle_type.dart';
import 'package:zupa/features/settings/data/models/parking_lot_capacity.dart';

part 'parking_lot.freezed.dart';
part 'parking_lot.g.dart';

@freezed
sealed class ParkingLot with _$ParkingLot {
  const factory ParkingLot({
    @Default('N/A') String id,
    @Default('N/A') String name,
    @Default('N/A') String address,
    @Default([]) List<ParkingLotCapacity> capacity,
    @Default(VehicleType()) VehicleType vehicleType,
    @Default(false) bool isLocked,
  }) = _ParkingLot;

  factory ParkingLot.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotFromJson(json);
}

