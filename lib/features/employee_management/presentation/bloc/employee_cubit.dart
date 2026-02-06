import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/employee_management/data/model/employee.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';

part 'employee_state.dart';
part 'employee_cubit.freezed.dart';

@injectable
class EmployeeCubit extends Cubit<EmployeeState> {
  final IEmployeeRepository _repository;

  EmployeeCubit(this._repository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _repository.getEmployees();

    result.whenOrNull(
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }
}
