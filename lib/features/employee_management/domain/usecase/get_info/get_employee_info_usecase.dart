import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_info/get_employee_info_params.dart';

@injectable
class GetEmployeeInfoUseCase {
  final IEmployeeRepository _repository;

  GetEmployeeInfoUseCase(this._repository);

  Future<RequestState<EmployeeEntity>> call({
    required GetEmployeeInfoParams params,
    RequestToken? token,
  }) async => _repository.getEmployeeInfo(params: params, token: token);
}
