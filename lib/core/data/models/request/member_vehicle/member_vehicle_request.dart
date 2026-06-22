import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_vehicle_request.freezed.dart';
part 'member_vehicle_request.g.dart';

@freezed
sealed class MemberVehicleRequest with _$MemberVehicleRequest {
  const factory MemberVehicleRequest({
    required String name,
    required String phoneNumber,
    required String licenseNumber,
    required String cardID,
    required String branchID,
    required String vehicleTypeID,
    required DateTime expiredIn,
  }) = _MemberVehicleRequest;

  factory MemberVehicleRequest.fromJson(Map<String, dynamic> json) =>
      _$MemberVehicleRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
