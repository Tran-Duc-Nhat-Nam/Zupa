part of 'employee_settings_cubit.dart';

@freezed
sealed class EmployeeSettingsState with _$EmployeeSettingsState {
  const factory EmployeeSettingsState.initial() = Initial;
  const factory EmployeeSettingsState.loading() = Loading;
  const factory EmployeeSettingsState.refreshing(List<Employee> employees) =
      Refreshing;
  const factory EmployeeSettingsState.loadingMore(List<Employee> employees) =
      LoadingMore;
  const factory EmployeeSettingsState.loaded(
    List<Employee> employees,
    int pageIndex,
  ) = Loaded;
  const factory EmployeeSettingsState.failed(String message) = Failed;
  const factory EmployeeSettingsState.empty() = Empty;
}

