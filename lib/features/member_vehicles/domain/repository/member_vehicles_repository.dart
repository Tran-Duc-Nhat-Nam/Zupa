import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/get_member_vehicle_list_params.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';

abstract class IMemberVehiclesRepository {
  Future<RequestState<List<MemberVehicleEntity>>> getMemberVehicles({
    required GetMemberVehicleListParams filter,
    RequestToken? token,
  });

  Future<RequestState<MemberVehicleEntity>> getMemberVehicleDetail({
    required String id,
    RequestToken? token,
  });

  Future<RequestState<dynamic>> createMemberVehicle({
    required MemberVehicleEntity vehicle,
    RequestToken? token,
  });

  Future<RequestState<dynamic>> updateMemberVehicle({
    required MemberVehicleEntity vehicle,
    RequestToken? token,
  });

  Future<RequestState<dynamic>> deleteMemberVehicle({
    required String id,
    RequestToken? token,
  });
}
