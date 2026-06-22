import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_list/get_employee_list_params.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_list/get_employee_list_usecase.dart';

part 'employee_list_bloc.freezed.dart';
part 'employee_list_event.dart';
part 'employee_list_state.dart';

@injectable
class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  final GetEmployeeListUseCase _getEmployeeList;
  RequestToken? _getToken;

  EmployeeListBloc({required this._getEmployeeList}) : super(const .initial()) {
    on<LoadEmployeeList>(_load);
    on<RefreshEmployeeList>(_refresh);
    on<LoadMoreEmployeeList>(_loadMore);
  }

  Future<void> _load(
    LoadEmployeeList event,
    Emitter<EmployeeListState> emit,
  ) async {
    emit(const .loading());
    _getToken?.cancel();
    _getToken = .new();
    final result = await _getEmployeeList(
      params: const .new(),
      token: _getToken,
    );

    switch (result) {
      case Success(:final data):
        emit(
          data.isEmpty
              ? const .empty()
              : .loaded(employees: data, params: const .new()),
        );
      case Error(:final message):
        emit(.failed(message: message));
      default:
        emit(const .failed(message: 'error'));
    }
  }

  Future<void> _refresh(
    RefreshEmployeeList event,
    Emitter<EmployeeListState> emit,
  ) async {
    _getToken?.cancel();
    _getToken = .new();
    final result = await _getEmployeeList(
      params: event.params,
      token: _getToken,
    );

    switch (result) {
      case Success(:final data):
        emit(
          data.isEmpty
              ? const .empty()
              : .loaded(employees: data, params: event.params),
        );
      case Error(:final message):
        emit(.failed(message: message));
      default:
        emit(const .failed(message: 'error'));
    }
  }

  Future<void> _loadMore(
    LoadMoreEmployeeList event,
    Emitter<EmployeeListState> emit,
  ) async {
    _getToken?.cancel();
    _getToken = .new();
    final currentData = [...state.currentEmployees];
    final newParams = GetEmployeeListParams(
      pageIndex: event.params.pageIndex + 1,
      pageSize: event.params.pageSize,
    );
    final result = await _getEmployeeList(params: newParams, token: _getToken);

    switch (result) {
      case Success(:final data):
        emit(
          data.isEmpty
              ? .loaded(employees: currentData, params: event.params)
              : .loaded(
                  employees: [...currentData, ...data],
                  params: newParams,
                ),
        );
      case Error(:final message):
        emit(.failed(message: message));
      default:
        emit(const .failed(message: 'error'));
    }
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    return super.close();
  }
}
