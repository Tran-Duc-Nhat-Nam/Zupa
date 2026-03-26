import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/parking/data/model/parking_lot_capacity_model.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';

part 'parking_lot_model.freezed.dart';
part 'parking_lot_model.g.dart';

@freezed
sealed class ParkingLotModel with _$ParkingLotModel {
  const ParkingLotModel._();

  const factory ParkingLotModel({
    @Default('N/A') String id,
    @Default('N/A') String name,
    @Default('N/A') String address,
    @Default([]) List<ParkingLotCapacityModel> capacity,
    @Default(VehicleTypeModel()) VehicleTypeModel vehicleType,
    @Default(false) bool isLocked,
  }) = _ParkingLotModel;

  factory ParkingLotModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  ParkingLotEntity toEntity() => ParkingLotEntity(
    id: id,
    name: name,
    address: address,
    capacity: capacity.map((e) => e.toEntity()).toList(),
    vehicleType: vehicleType.toEntity(),
    isLocked: isLocked,
  );
}
