import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_info/get_employee_info_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_list/get_employee_list_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/update/update_employee_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/update_avatar/update_avatar_params.dart';

abstract class IEmployeeRepository {
  Future<RequestState<List<EmployeeEntity>>> getEmployeeList({
    required GetEmployeeListParams params,
    RequestToken? token,
  });

  Future<RequestState<EmployeeEntity>> getEmployeeInfo({
    required GetEmployeeInfoParams params,
    RequestToken? token,
  });

  Future<RequestState<EmployeeEntity>> updateEmployeeInfo({
    required UpdateEmployeeInfoParams params,
    RequestToken? token,
  });

  Future<RequestState<String>> updateAvatar({
    required UpdateAvatarParams params,
    RequestToken? token,
  });
}
