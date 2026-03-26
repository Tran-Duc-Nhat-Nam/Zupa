import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/domain/entities/filter/member_vehicles_filter_entity.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';

abstract class IMemberVehiclesRepository {
  Future<NetworkState<List<MemberVehicleEntity>>> getMemberVehicles({
    int? page,
    MemberVehicleFilterEntity? filter,
  });

  Future<NetworkState<SuccessResponse>> createMemberVehicle(
    MemberVehicleEntity vehicle,
  );

  Future<NetworkState<SuccessResponse>> deleteMemberVehicle(String id);
}
