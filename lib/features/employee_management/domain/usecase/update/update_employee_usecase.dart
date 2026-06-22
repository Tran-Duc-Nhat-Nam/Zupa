import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';
import 'package:zupa/features/employee_management/domain/usecase/update/update_employee_params.dart';

@injectable
class UpdateEmployeeInfoUseCase {
  final IEmployeeRepository _repository;

  UpdateEmployeeInfoUseCase(this._repository);

  Future<RequestState<EmployeeEntity>> call({
    required UpdateEmployeeInfoParams params,
    RequestToken? token,
  }) async => _repository.updateEmployeeInfo(params: params, token: token);
}
