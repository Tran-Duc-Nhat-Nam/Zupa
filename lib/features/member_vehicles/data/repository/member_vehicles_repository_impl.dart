import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/member_vehicles/data/api/member_vehicles_api.dart';
import 'package:zupa/features/member_vehicles/data/models/filter/member_vehicles_filter_model.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/params/get_member_vehicle_list_params.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';

@LazySingleton(as: IMemberVehiclesRepository)
class MemberVehiclesRepositoryImpl
    with RequestService
    implements IMemberVehiclesRepository {
  final MemberVehiclesAPI _api;

  MemberVehiclesRepositoryImpl(this._api);

  @override
  Future<RequestState<List<MemberVehicleEntity>>> getMemberVehicles({
    required GetMemberVehicleListParams filter,
    RequestToken? token,
  }) async {
    final payload = MemberVehiclesFilterModel.fromEntity(filter);

    final response = await request(
      request: (cancelToken) =>
          _api.getMemberVehicles(payload: payload, cancelToken: cancelToken),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => Error(code: error.code, message: error.errorMessage),
      cancelled: () => const Error(code: -1, message: 'cancelled'),
    );
  }

  @override
  Future<RequestState<MemberVehicleEntity>> getMemberVehicleDetail({
    required String id,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) =>
          _api.getMemberVehicle(id: id, cancelToken: cancelToken),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.toEntity()),
      failure: (error) => Error(code: error.code, message: error.errorMessage),
      cancelled: () => const Error(code: -1, message: 'cancelled'),
    );
  }

  @override
  Future<RequestState<dynamic>> createMemberVehicle({
    required MemberVehicleEntity vehicle,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.createMemberVehicle(
        payload: .fromEntity(vehicle),
        cancelToken: cancelToken,
      ),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.toEntity()),
      failure: (error) => Error(code: error.code, message: error.errorMessage),
      cancelled: () => const Error(code: -1, message: 'cancelled'),
    );
  }

  @override
  Future<RequestState<dynamic>> updateMemberVehicle({
    required MemberVehicleEntity vehicle,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.updateMemberVehicle(
        payload: .fromEntity(vehicle),
        cancelToken: cancelToken,
      ),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.toEntity()),
      failure: (error) => Error(code: error.code, message: error.errorMessage),
      cancelled: () => const Error(code: -1, message: 'cancelled'),
    );
  }

  @override
  Future<RequestState<dynamic>> deleteMemberVehicle({
    required String id,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) =>
          _api.deleteMemberVehicle(id: id, cancelToken: cancelToken),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.toEntity()),
      failure: (error) => Error(code: error.code, message: error.errorMessage),
      cancelled: () => const Error(code: -1, message: 'cancelled'),
    );
  }
}
