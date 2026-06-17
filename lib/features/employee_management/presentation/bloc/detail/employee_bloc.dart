import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_info/get_employee_info_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_info/get_employee_info_usecase.dart';
import 'package:zupa/features/employee_management/domain/usecase/update/update_employee_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/update/update_employee_usecase.dart';
import 'package:zupa/features/employee_management/domain/usecase/update_avatar/update_avatar_usecase.dart';

part 'employee_bloc.freezed.dart';
part 'employee_event.dart';
part 'employee_state.dart';

@injectable
class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployeeInfoUseCase getEmployee;
  final UpdateEmployeeInfoUseCase updateEmployee;
  final UpdateAvatarUseCase updateAvatar;
  RequestToken? _getToken;
  RequestToken? _actionToken;

  EmployeeBloc({
    required this.getEmployee,
    required this.updateEmployee,
    required this.updateAvatar,
  }) : super(const .initial()) {
    on<FetchEmployee>(_onFetchEmployee);
    on<ToggleEditMode>(_onToggleEditMode);
    on<UpdateEmployee>(_onUpdateEmployee);
  }

  Future<void> _onFetchEmployee(
    FetchEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(const .loading());
    _getToken?.cancel();
    _getToken = .new();
    final result = await getEmployee(params: event.params, token: _getToken);

    emit(switch (result) {
      Success(:final data) => .loaded(employee: data),
      Error(:final message) => .error(message ?? 'error'),
      _ => const .error('error'),
    });
  }

  void _onToggleEditMode(ToggleEditMode event, Emitter<EmployeeState> emit) {
    switch (state) {
      case EmployeeLoadedSuccess(:final employee):
        emit(.editing(employee: employee));
      case EmployeeEditing(:final employee):
        emit(.loaded(employee: employee));
      default:
        break;
    }
  }

  Future<void> _onUpdateEmployee(
    UpdateEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    switch (state) {
      case EmployeeLoadedSuccess(:final employee):
        emit(.updating(employee: employee));
        _actionToken?.cancel();
        _actionToken = .new();
        final result = await updateEmployee(
          params: event.updatedFields,
          token: _actionToken,
        );
        emit(switch (result) {
          Success(:final data) => .loaded(employee: data),
          Error(:final message) => .error(message ?? 'error'),
          _ => const .error('error'),
        });
      case EmployeeEditing(:final employee):
        emit(.updating(employee: employee));
        _actionToken?.cancel();
        _actionToken = .new();
        final result = await updateEmployee(
          params: event.updatedFields,
          token: _actionToken,
        );
        emit(switch (result) {
          Success(:final data) => .loaded(employee: data),
          Error(:final message) => .error(message ?? 'error'),
          _ => const .error('error'),
        });
      default:
        break;
    }
  }
}
