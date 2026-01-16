import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/common/resource/network_state.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart';

part 'history_list_state.dart';
part 'history_list_cubit.freezed.dart';

@injectable
class HistoryListCubit extends Cubit<HistoryListState> {
  final IHistoryRepository _historyRepository;
  final HistoryFilterCubit _historyFilterCubit;

  HistoryListCubit(this._historyRepository, this._historyFilterCubit)
    : super(const HistoryListState());

  Future<void> init(BuildContext context) async {
    emit(state.copyWith(status: const NetworkState.loading()));
    final filter = _historyFilterCubit.state.maybeMap(
      loaded: (s) => s.filter,
      orElse: () => null,
    );
    final response = await _historyRepository.getHistory(filter: filter);

    response.when(
      initial: () => emit(state.copyWith(status: const NetworkState.initial())),
      loading: () => emit(state.copyWith(status: const NetworkState.loading())),
      success: (data) => emit(
        state.copyWith(
          tickets: data,
          page: 1,
          hasMore: data.length >= 10,
          status: NetworkState.success(data),
        ),
      ),
      error: (message) =>
          emit(state.copyWith(status: NetworkState.error(message))),
    );
  }

  Future<void> loadMore() async {
    final isLoading = state.status.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    if (!state.hasMore || isLoading) return;

    final filter = _historyFilterCubit.state.maybeMap(
      loaded: (s) => s.filter,
      orElse: () => null,
    );
    final response = await _historyRepository.getHistory(
      page: state.page + 1,
      filter: filter,
    );

    response.whenOrNull(
      success: (data) => emit(
        state.copyWith(
          tickets: [...state.tickets, ...data],
          page: state.page + 1,
          hasMore: data.length >= 10,
        ),
      ),
    );
  }
}
