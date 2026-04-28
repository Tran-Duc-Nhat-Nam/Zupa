import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_capacity_entity.dart';

part 'parking_lot_capacity_model.freezed.dart';
part 'parking_lot_capacity_model.g.dart';

@freezed
sealed class ParkingLotCapacityModel with _$ParkingLotCapacityModel {
  const ParkingLotCapacityModel._();

  const factory ParkingLotCapacityModel({
    @Default(.new()) VehicleTypeModel vehicleType,
    @Default(0) int capacity,
    @Default(0) int available,
  }) = _ParkingLotCapacityModel;

  factory ParkingLotCapacityModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotCapacityModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  ParkingLotCapacityEntity toEntity() => .new(
    vehicleType: vehicleType.toEntity(),
    capacity: capacity,
    available: available,
  );
}
