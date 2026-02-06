import 'package:zupa/features/member_vehicles/data/models/member_vehicle.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicles_filter.dart';

abstract class IMemberVehiclesRepository {
  Future<NetworkState<List<MemberVehicle>>> getMemberVehicles({int? page, MemberVehiclesFilter? filter});

  Future<NetworkState<SuccessResponse>> createMemberVehicle(MemberVehicle vehicle);

  Future<NetworkState<SuccessResponse>> deleteMemberVehicle(String id);
}
