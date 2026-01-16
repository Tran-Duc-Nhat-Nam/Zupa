import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/features/settings/data/api/settings_api.dart';
import 'package:zupa/features/settings/data/models/employee.dart';
import 'package:zupa/features/settings/data/models/parking_lot.dart';
import 'package:zupa/features/settings/domain/repository/settings_repository.dart';
import 'package:zupa/features/settings/data/models/parking_lot_capacity.dart';
import 'package:zupa/features/settings/data/models/member_vehicle.dart';
import 'package:zupa/features/settings/data/models/member_vehicles_filter.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

@LazySingleton(as: ISettingsRepository)
class SettingsRepositoryImpl implements ISettingsRepository {
  final SettingsAPI _api;
  final NetworkService _networkService;

  SettingsRepositoryImpl(this._networkService, Dio dio) : _api = SettingsAPI(dio);

  @override
  Future<NetworkState<List<Employee>>> getEmployees() async {
    final response = await _networkService.request((dio) => _api.getEmployees());

    if (response is SuccessResponse) {
      try {
        final List<dynamic> dataList = response.data['data'] as List<dynamic>;
        final items = dataList
            .map((e) => Employee.fromJson(e as Map<String, dynamic>))
            .toList();
        return NetworkState.success(items);
      } catch (e) {
        return NetworkState.error('Parsing Error: ${e.toString()}');
      }
    } else if (response is ErrorResponse) {
      return NetworkState.error(response.message);
    } else {
      return const NetworkState.error('Unknown Response');
    }
  }

  @override
  Future<NetworkState<List<ParkingLot>>> getParkingLots() async {
    // Returning mock data as originally implemented in the cubit
    return NetworkState.success([
      ParkingLot(
        id: '1',
        name: 'Bãi xe A',
        capacity: [
          ParkingLotCapacity(
            vehicleType: vehicleTypes[0],
            capacity: 100,
            available: 50,
          ),
          ParkingLotCapacity(
            vehicleType: vehicleTypes[1],
            capacity: 200,
            available: 150,
          ),
        ],
      ),
      ParkingLot(
        id: '2',
        name: 'Bãi xe B',
        capacity: [
          ParkingLotCapacity(
            vehicleType: vehicleTypes[0],
            capacity: 50,
            available: 20,
          ),
          ParkingLotCapacity(
            vehicleType: vehicleTypes[1],
            capacity: 100,
            available: 80,
          ),
        ],
      ),
    ]);
  }

  @override
  Future<NetworkState<List<MemberVehicle>>> getMemberVehicles(
      {int? page, MemberVehiclesFilter? filter}) async {
    final response = await _networkService.request(
      (dio) => _api.getMemberVehicles(
        page?.toString(),
        filter?.keyword,
        filter?.type?.value,
        filter?.time?.toIso8601String(),
      ),
    );

    if (response is SuccessResponse) {
      try {
        final List<dynamic> dataList = response.data['data'] as List<dynamic>;
        final items = dataList
            .map((e) => MemberVehicle.fromJson(e as Map<String, dynamic>))
            .toList();
        return NetworkState.success(items);
      } catch (e) {
        return NetworkState.error('Parsing Error: ${e.toString()}');
      }
    } else if (response is ErrorResponse) {
      return NetworkState.error(response.message);
    } else {
      return const NetworkState.error('Unknown Response');
    }
  }

  @override
  Future<NetworkState<SuccessResponse>> createMemberVehicle(
      Map<String, dynamic> data) async {
    final response =
        await _networkService.request((dio) => _api.createMemberVehicle(data));

    if (response is SuccessResponse) {
      return NetworkState.success(response);
    } else if (response is ErrorResponse) {
      return NetworkState.error(response.message);
    } else {
      return const NetworkState.error('Unknown Response');
    }
  }

  @override
  Future<NetworkState<SuccessResponse>> deleteMemberVehicle(String id) async {
    final response =
        await _networkService.request((dio) => _api.deleteMemberVehicle(id));

    if (response is SuccessResponse) {
      return NetworkState.success(response);
    } else if (response is ErrorResponse) {
      return NetworkState.error(response.message);
    } else {
      return const NetworkState.error('Unknown Response');
    }
  }

  @override
  Future<NetworkState<SuccessResponse>> changePassword(
      String currentPassword, String newPassword) async {
    // Placeholder for API call
    return const NetworkState.success(SuccessResponse(data: null));
  }
}
