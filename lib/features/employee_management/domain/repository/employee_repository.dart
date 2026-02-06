import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/employee_management/data/model/employee.dart';

abstract class IEmployeeRepository {
  Future<NetworkState<List<Employee>>> getEmployees();
}
