import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/params/get_member_vehicle_list_params.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';

abstract class IMemberVehiclesRepository {
  Future<RequestState<List<MemberVehicleEntity>>> getMemberVehicles({
    required GetMemberVehicleListParams filter,
  });

  Future<RequestState<MemberVehicleEntity>> getMemberVehicleDetail({
    required String id,
  });

  Future<RequestState<SuccessResponse>> createMemberVehicle({
    required MemberVehicleEntity vehicle,
  });

  Future<RequestState<SuccessResponse>> updateMemberVehicle({
    required MemberVehicleEntity vehicle,
  });

  Future<RequestState<SuccessResponse>> deleteMemberVehicle({
    required String id,
  });
}
