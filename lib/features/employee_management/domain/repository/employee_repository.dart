import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/employee_management/data/model/employee_model.dart';

abstract class IEmployeeRepository {
  Future<RequestState<List<EmployeeModel>>> getEmployees({RequestToken? token});
}
