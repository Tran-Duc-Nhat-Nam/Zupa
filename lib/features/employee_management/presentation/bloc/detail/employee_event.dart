part of 'employee_bloc.dart';

@freezed
sealed class EmployeeEvent with _$EmployeeEvent {
  const factory EmployeeEvent.fetch(GetEmployeeInfoParams params) =
      FetchEmployee;
  const factory EmployeeEvent.toggleEditMode() = ToggleEditMode;
  const factory EmployeeEvent.update(UpdateEmployeeInfoParams updatedFields) =
      UpdateEmployee;
}
