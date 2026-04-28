import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/features/history/domain/usecases/get_history_usecase.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

part 'history_cubit.freezed.dart';
part 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase _getHistory;
  final AuthCubit _authCubit;

  HistoryCubit(this._getHistory, this._authCubit)
    : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final response = await _getHistory(filter: .initial());

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
      unauthenticated: () => _authCubit.logOut(),
    );
  }

  Future<void> refresh({required GetHistoryParams filter}) async {
    final List<HistoryTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final response = await _getHistory(filter: filter);

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
      unauthenticated: () => _authCubit.logOut(),
    );
  }

  Future<void> loadMore({required GetHistoryParams filter}) async {
    final List<HistoryTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final newFilter = GetHistoryParams(
      page: filter.page + 1,
      size: filter.size,
      keyword: filter.keyword,
      time: filter.time,
      type: filter.type,
    );
    final result = await _getHistory(
      filter: newFilter,
    );
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        emit(
          items.isEmpty
              ? const .empty()
              : .loaded(items, newItems.isEmpty ? pageIndex : pageIndex + 1),
        );
      },
      error: (message) {
        emit(.failed(message));
      },
      unauthenticated: () => _authCubit.logOut(),
    );
  }
}
