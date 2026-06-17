import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_list/get_employee_list_params.dart';

part 'employee_list_form.gform.dart';

@Rf()
class EmployeeList {
  final int pageIndex;
  final int pageSize;

  EmployeeList({
    @RfControl(validators: [RequiredValidator()])
    this.pageIndex = defaultPageIndex,
    @RfControl(validators: [RequiredValidator()])
    this.pageSize = defaultPageSize,
  });

  GetEmployeeListParams toParams() =>
      .new(pageIndex: pageIndex, pageSize: pageSize);

  factory EmployeeList.fromParams(GetEmployeeListParams params) =>
      .new(pageIndex: params.pageIndex, pageSize: params.pageSize);
}
