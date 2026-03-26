import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/features/history/domain/entities/filter/history_filter_entity.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';

part 'history_list_cubit.freezed.dart';
part 'history_list_state.dart';

@injectable
class HistoryListCubit extends Cubit<HistoryListState> {
  final IHistoryRepository _historyRepository;

  HistoryListCubit(this._historyRepository) : super(const .initial());

  Future<void> init(BuildContext context) async {
    emit(const .loading());
    final response = await _historyRepository.getHistory();

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
      unauthenticated: () => context.read<AuthCubit>().logOut(),
    );
  }

  Future<void> refresh(HistoryFilterEntity? filter) async {
    final List<HistoryTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final response = await _historyRepository.getHistory(
      filter:
          filter ??
          const HistoryFilterEntity(
            page: defaultPageIndex,
            size: defaultPageSize,
            keyword: null,
            time: null,
            type: null,
          ),
    );

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> loadMore(HistoryFilterEntity? filter) async {
    final List<HistoryTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _historyRepository.getHistory(
      filter:
          filter ??
          const HistoryFilterEntity(
            page: defaultPageIndex,
            size: defaultPageSize,
            keyword: null,
            time: null,
            type: null,
          ),
      page: pageIndex + 1,
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
    );
  }
}
