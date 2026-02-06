part of 'employee_cubit.dart';

@freezed
sealed class EmployeeState with _$EmployeeState {
  const factory EmployeeState.initial() = Initial;
  const factory EmployeeState.loading() = Loading;
  const factory EmployeeState.refreshing(List<Employee> employees) =
      Refreshing;
  const factory EmployeeState.loadingMore(List<Employee> employees) =
      LoadingMore;
  const factory EmployeeState.loaded(
    List<Employee> employees,
    int pageIndex,
  ) = Loaded;
  const factory EmployeeState.failed(String message) = Failed;
  const factory EmployeeState.empty() = Empty;
  const factory EmployeeState.unauthenticated() = Unauthenticated;
}

