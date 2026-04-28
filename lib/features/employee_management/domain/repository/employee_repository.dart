import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/employee_management/data/model/employee.dart';

abstract class IEmployeeRepository {
  Future<RequestState<List<Employee>>> getEmployees();
}
