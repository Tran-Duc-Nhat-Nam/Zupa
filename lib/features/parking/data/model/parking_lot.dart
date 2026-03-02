import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/parking/data/model/parking_lot_capacity.dart';

part 'parking_lot.freezed.dart';
part 'parking_lot.g.dart';

@freezed
sealed class ParkingLot with _$ParkingLot {
  const factory ParkingLot({
    @Default('N/A') String id,
    @Default('N/A') String name,
    @JsonKey(name: 'location') @Default('N/A') String location,
    @Default([]) List<ParkingLotCapacity> capacity,
    @Default(VehicleType()) VehicleType vehicleType,
    @Default(false) bool isLocked,
    @Default({}) Map<String, double> pricing,
  }) = _ParkingLot;

  factory ParkingLot.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotFromJson(json);
}

