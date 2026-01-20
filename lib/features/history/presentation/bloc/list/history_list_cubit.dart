import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/features/history/presentation/bloc/filter/model/history_filter.dart';

part 'history_list_state.dart';
part 'history_list_cubit.freezed.dart';

@injectable
class HistoryListCubit extends Cubit<HistoryListState> {
  final IHistoryRepository _historyRepository;

  HistoryListCubit(this._historyRepository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final response = await _historyRepository.getHistory();

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> refresh(HistoryFilter? filter) async {
    emit(const .loading());
    final response = await _historyRepository.getHistory(filter: filter);

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> loadMore(HistoryFilter? filter) async {
    final List<HistoryTicket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _historyRepository.getHistory(
      filter: filter,
      page: pageIndex + 1,
    );
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        items.isEmpty
            ? emit(const .empty())
            : emit(
                .loaded(items, newItems.isEmpty ? pageIndex : pageIndex + 1),
              );
      },
      error: (message) {
        emit(.failed(message));
      },
    );
  }
}
