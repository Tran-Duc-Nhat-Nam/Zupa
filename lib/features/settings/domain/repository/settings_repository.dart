import 'package:zupa/features/settings/data/models/employee.dart';
import 'package:zupa/features/settings/data/models/parking_lot.dart';
import 'package:zupa/features/settings/data/models/member_vehicle.dart';
import 'package:zupa/features/settings/data/models/member_vehicles_filter.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

abstract class ISettingsRepository {
  Future<NetworkState<List<Employee>>> getEmployees();
  Future<NetworkState<List<ParkingLot>>> getParkingLots();
  Future<NetworkState<List<MemberVehicle>>> getMemberVehicles({int? page, MemberVehiclesFilter? filter});

  Future<NetworkState<SuccessResponse>> createMemberVehicle(Map<String, dynamic> data);

  Future<NetworkState<SuccessResponse>> deleteMemberVehicle(String id);

  Future<NetworkState<SuccessResponse>> changePassword(
      String currentPassword, String newPassword);
}
