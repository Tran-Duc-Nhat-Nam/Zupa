import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/screens/camera/models/vehicle_type.dart';

part 'parking_lot_capacity.freezed.dart';
part 'parking_lot_capacity.g.dart';

@freezed
sealed class ParkingLotCapacity with _$ParkingLotCapacity {
  const factory ParkingLotCapacity({
    @Default(VehicleType()) VehicleType vehicleType,
    @Default(0) int capacity,
    @Default(0) int available,
  }) = _ParkingLotCapacity;

  factory ParkingLotCapacity.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotCapacityFromJson(json);
}

