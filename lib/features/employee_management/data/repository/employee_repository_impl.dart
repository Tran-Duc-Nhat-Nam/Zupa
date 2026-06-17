import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/employee_management/data/api/employee_api.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_info/get_employee_info_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_list/get_employee_list_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/update/update_employee_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/update_avatar/update_avatar_params.dart';

@LazySingleton(as: IEmployeeRepository)
class EmployeeRepositoryImpl
    with RequestService
    implements IEmployeeRepository {
  final EmployeeAPI _api;

  EmployeeRepositoryImpl(this._api);

  @override
  Future<RequestState<List<EmployeeEntity>>> getEmployeeList({
    required GetEmployeeListParams params,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.getEmployeeList(
        params: .fromParams(params),
        cancelToken: cancelToken,
      ),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }

  @override
  Future<RequestState<EmployeeEntity>> getEmployeeInfo({
    required GetEmployeeInfoParams params,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) =>
          _api.getEmployeeInfo(id: params.id, cancelToken: cancelToken),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.toEntity()),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }

  @override
  Future<RequestState<EmployeeEntity>> updateEmployeeInfo({
    required UpdateEmployeeInfoParams params,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.updateEmployeeInfo(
        id: params.id,
        body: .fromParams(params),
        cancelToken: cancelToken,
      ),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.toEntity()),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }

  @override
  Future<RequestState<String>> updateAvatar({
    required UpdateAvatarParams params,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) async => _api.updateAvatar(
        id: params.id,
        avatar: await .fromFile(params.avatar.path),
        cancelToken: cancelToken,
      ),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }
}
