import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';

part 'member_vehicle_model.freezed.dart';
part 'member_vehicle_model.g.dart';

@freezed
sealed class MemberVehicleModel with _$MemberVehicleModel {
  const MemberVehicleModel._();

  const factory MemberVehicleModel({
    @Default('N/A') String id,
    @Default('N/A') String name,
    @Default('N/A') String phoneNumber,
    @Default('N/A') String licenseNumber,
    @Default('N/A') String parkingLotId,
    @Default(VehicleTypeModel()) VehicleTypeModel vehicleType,
    @Default('N/A') String cardId,
    @Default(86400) int expiredIn,
    @Default(0) int price,
  }) = _MemberVehicleModel;

  factory MemberVehicleModel.fromJson(Map<String, dynamic> json) =>
      _$MemberVehicleModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  MemberVehicleEntity toEntity() => .new(
    id: id,
    name: name,
    phoneNumber: phoneNumber,
    licenseNumber: licenseNumber,
    parkingLotId: parkingLotId,
    vehicleType: vehicleType.toEntity(),
    cardId: cardId,
    expiredIn: expiredIn,
    price: price,
  );

  factory MemberVehicleModel.fromEntity(MemberVehicleEntity entity) {
    return .new(
      id: entity.id,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      licenseNumber: entity.licenseNumber,
      parkingLotId: entity.parkingLotId,
      vehicleType: .fromEntity(entity.vehicleType),
      cardId: entity.cardId,
      expiredIn: entity.expiredIn,
      price: entity.price,
    );
  }
}
