import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/employee_management/data/api/employee_api.dart';
import 'package:zupa/features/employee_management/data/model/employee.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';

@LazySingleton(as: IEmployeeRepository)
class EmployeeRepositoryImpl implements IEmployeeRepository {
  final EmployeeAPI _api;
  final RequestService _networkService;

  EmployeeRepositoryImpl(this._networkService, this._api);

  @override
  Future<RequestState<List<Employee>>> getEmployees({
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) =>
          _api.getEmployees(cancelToken: cancelToken),
      token: token,
    );

    if (response is SuccessResponse) {
      try {
        final List<dynamic> dataList = response.data['data'] as List<dynamic>;
        final items = dataList
            .map((e) => Employee.fromJson(e as Map<String, dynamic>))
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
}
