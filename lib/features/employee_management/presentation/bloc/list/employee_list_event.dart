part of 'employee_list_bloc.dart';

@freezed
sealed class EmployeeListEvent with _$EmployeeListEvent {
  const factory EmployeeListEvent.load() = LoadEmployeeList;
  const factory EmployeeListEvent.refresh({
    required GetEmployeeListParams params,
  }) = RefreshEmployeeList;
  const factory EmployeeListEvent.loadMore({
    required GetEmployeeListParams params,
  }) = LoadMoreEmployeeList;
}
