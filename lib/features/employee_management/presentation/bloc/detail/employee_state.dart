part of 'employee_bloc.dart';

@freezed
sealed class EmployeeState with _$EmployeeState {
  const factory EmployeeState.initial() = EmployeeInitial;

  const factory EmployeeState.loading() = EmployeeLoading;

  const factory EmployeeState.loaded({required EmployeeEntity employee}) =
      EmployeeLoadedSuccess;

  const factory EmployeeState.editing({required EmployeeEntity employee}) =
      EmployeeEditing;

  const factory EmployeeState.updating({required EmployeeEntity employee}) =
      EmployeeUpdating;

  const factory EmployeeState.error(String errorMessage) = EmployeeLoadedError;
}

extension EmployeeStateExtension on EmployeeState {
  bool get isLoading => this is EmployeeLoading || this is EmployeeInitial;

  bool get isError => this is EmployeeLoadedError;

  EmployeeEntity? get currentEmployee => switch (this) {
    EmployeeLoadedSuccess(:final employee) => employee,
    EmployeeEditing(:final employee) => employee,
    EmployeeUpdating(:final employee) => employee,
    _ => null,
  };

  bool get isEditing => this is EmployeeEditing;

  bool get isUpdating => this is EmployeeUpdating;
}
