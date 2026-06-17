part of 'employee_list_bloc.dart';

@freezed
sealed class EmployeeListState with _$EmployeeListState {
  const factory EmployeeListState.initial() = Initial;

  const factory EmployeeListState.loading() = Loading;

  const factory EmployeeListState.refreshing({
    required List<EmployeeEntity> employees,
  }) = Refreshing;

  const factory EmployeeListState.loadingMore({
    required List<EmployeeEntity> employees,
  }) = LoadingMore;

  const factory EmployeeListState.loaded({
    required List<EmployeeEntity> employees,
    required GetEmployeeListParams params,
  }) = Loaded;

  const factory EmployeeListState.failed({required String? message}) = Failed;

  const factory EmployeeListState.empty() = Empty;
}

extension EmployeeListStateExtension on EmployeeListState {
  List<EmployeeEntity> get currentEmployees => switch (this) {
    Loaded(:final employees) => employees,
    Refreshing(:final employees) => employees,
    LoadingMore(:final employees) => employees,
    _ => [],
  };
}
