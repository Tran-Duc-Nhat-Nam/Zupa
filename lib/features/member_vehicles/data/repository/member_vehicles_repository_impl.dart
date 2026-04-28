import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/member_vehicles/data/api/member_vehicles_api.dart';
import 'package:zupa/features/member_vehicles/data/models/filter/member_vehicles_filter_model.dart';
import 'package:zupa/features/member_vehicles/data/models/member_vehicle_model.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/params/get_member_vehicle_list_params.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';

@LazySingleton(as: IMemberVehiclesRepository)
class MemberVehiclesRepositoryImpl implements IMemberVehiclesRepository {
  final MemberVehiclesAPI _api;
  final RequestService _networkService;

  MemberVehiclesRepositoryImpl(this._networkService, this._api);

  @override
  Future<RequestState<List<MemberVehicleEntity>>> getMemberVehicles({
    required GetMemberVehicleListParams filter,
    RequestToken? token,
  }) async {
    final payload = MemberVehiclesFilterModel.fromEntity(filter);

    final response = await _networkService.request(
      request: (cancelToken) =>
          _api.getMemberVehicles(payload: payload, cancelToken: cancelToken),
      token: token,
    );

    if (response is SuccessResponse<List<MemberVehicleModel>>) {
      try {
        final vehicles = response.data
            .map<MemberVehicleEntity>((e) => e.toEntity())
            .toList();
        return .success(vehicles);
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
  Future<RequestState<MemberVehicleEntity>> getMemberVehicleDetail({
    required String id,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) =>
          _api.getMemberVehicle(id: id, cancelToken: cancelToken),
      token: token,
    );

    if (response is SuccessResponse<MemberVehicleModel>) {
      try {
        final vehicle = response.data.toEntity();
        return .success(vehicle);
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
  Future<RequestState<SuccessResponse>> createMemberVehicle({
    required MemberVehicleEntity vehicle,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) => _api.createMemberVehicle(
        payload: MemberVehicleModel.fromEntity(vehicle),
        cancelToken: cancelToken,
      ),
      token: token,
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
  Future<RequestState<SuccessResponse>> updateMemberVehicle({
    required MemberVehicleEntity vehicle,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) => _api.updateMemberVehicle(
        payload: .fromEntity(vehicle),
        cancelToken: cancelToken,
      ),
      token: token,
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
  Future<RequestState<SuccessResponse>> deleteMemberVehicle({
    required String id,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) =>
          _api.deleteMemberVehicle(id: id, cancelToken: cancelToken),
      token: token,
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
