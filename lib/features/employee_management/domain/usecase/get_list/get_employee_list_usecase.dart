import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_list/get_employee_list_params.dart';

@injectable
class GetEmployeeListUseCase {
  final IEmployeeRepository _repository;

  GetEmployeeListUseCase(this._repository);

  Future<RequestState<List<EmployeeEntity>>> call({
    required GetEmployeeListParams params,
    RequestToken? token,
  }) async => _repository.getEmployeeList(params: params, token: token);
}
