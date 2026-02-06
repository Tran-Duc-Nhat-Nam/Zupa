import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/member_vehicles/data/api/member_vehicles_api.dart';
import 'package:zupa/features/member_vehicles/data/models/member_vehicle.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicles_filter.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';

@LazySingleton(as: IMemberVehiclesRepository)
class MemberVehiclesRepositoryImpl implements IMemberVehiclesRepository {
  final MemberVehiclesAPI _api;
  final NetworkService _networkService;

  MemberVehiclesRepositoryImpl(this._networkService, Dio dio)
    : _api = MemberVehiclesAPI(dio);

  @override
  Future<NetworkState<List<MemberVehicle>>> getMemberVehicles({
    int? page,
    MemberVehiclesFilter? filter,
  }) async {
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
        return .success(items);
      } catch (e) {
        return .error('Parsing Error: ${e.toString()}');
      }
    } else if (response is ErrorResponse) {
      return .error(response.message);
    } else {
      return const .error('Unknown Response');
    }
  }

  @override
  Future<NetworkState<SuccessResponse>> createMemberVehicle(
    MemberVehicle vehicle,
  ) async {
    final response = await _networkService.request(
      (dio) => _api.createMemberVehicle(vehicle),
    );

    if (response is SuccessResponse) {
      return .success(response);
    } else if (response is ErrorResponse) {
      return .error(response.message);
    } else {
      return const .error('Unknown Response');
    }
  }

  @override
  Future<NetworkState<SuccessResponse>> deleteMemberVehicle(String id) async {
    final response = await _networkService.request(
      (dio) => _api.deleteMemberVehicle(id),
    );

    if (response is SuccessResponse) {
      return .success(response);
    } else if (response is ErrorResponse) {
      return .error(response.message);
    } else {
      return const .error('Unknown Response');
    }
  }
}
