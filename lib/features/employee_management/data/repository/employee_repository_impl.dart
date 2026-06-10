import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/employee_management/data/api/employee_api.dart';
import 'package:zupa/features/employee_management/data/model/employee_model.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';

@LazySingleton(as: IEmployeeRepository)
class EmployeeRepositoryImpl
    with RequestService
    implements IEmployeeRepository {
  final EmployeeAPI _api;

  EmployeeRepositoryImpl(this._api);

  @override
  Future<RequestState<List<EmployeeModel>>> getEmployees({
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.getEmployees(cancelToken: cancelToken),
      token: token,
    );

    return response.maybeWhen(
      success: (data) => .success(data.data),
      failure: (error) => .error(error.errorMessage),
      cancelled: () => const .error('cancelled'),
      orElse: () => const .error('unknown_response'),
    );
  }
}
