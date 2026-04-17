import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/params/get_member_vehicle_list_params.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';

abstract class IMemberVehiclesRepository {
  Future<NetworkState<List<MemberVehicleEntity>>> getMemberVehicles({
    int? page,
    GetMemberVehicleListParams? filter,
  });

  Future<NetworkState<SuccessResponse>> createMemberVehicle({
    required MemberVehicleEntity vehicle,
  });

  Future<NetworkState<SuccessResponse>> updateMemberVehicle({
    required MemberVehicleEntity vehicle,
  });

  Future<NetworkState<SuccessResponse>> deleteMemberVehicle(String id);
}
