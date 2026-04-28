import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/employee_management/data/model/employee.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';

part 'employee_cubit.freezed.dart';
part 'employee_state.dart';

@injectable
class EmployeeCubit extends Cubit<EmployeeState> {
  final IEmployeeRepository _repository;
  RequestToken? _getToken;

  EmployeeCubit(this._repository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    _getToken?.cancel();
    _getToken = .new();
    final result = await _repository.getEmployees(token: _getToken);

    result.whenOrNull(
      success: (data) =>
          emit(data.isEmpty ? const .empty() : .loaded(data, defaultPageIndex)),
      error: (message) => emit(.failed(message)),
    );
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    return super.close();
  }
}
