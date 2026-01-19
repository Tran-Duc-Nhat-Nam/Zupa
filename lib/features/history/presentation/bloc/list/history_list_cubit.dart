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

  HistoryListCubit(this._historyRepository) : super(const .new());

  Future<void> init() async {
    emit(state.copyWith(status: const .loading()));
    final response = await _historyRepository.getHistory();

    response.when(
      initial: () => emit(state.copyWith(status: const .initial())),
      loading: () => emit(state.copyWith(status: const .loading())),
      success: (data) => emit(
        state.copyWith(
          tickets: data,
          page: 1,
          hasMore: data.length >= 10,
          status: .success(data),
        ),
      ),
      error: (message) => emit(state.copyWith(status: .error(message))),
    );
  }

  Future<void> refresh(HistoryFilter? filter) async {
    emit(state.copyWith(status: const .loading()));
    final response = await _historyRepository.getHistory(filter: filter);

    response.whenOrNull(
      success: (data) => emit(
        state.copyWith(
          tickets: data,
          page: 1,
          hasMore: data.length >= 10,
          status: .success(data),
        ),
      ),
      error: (message) => emit(state.copyWith(status: .error(message))),
    );
  }

  Future<void> loadMore(HistoryFilter? filter) async {
    final isLoading = state.status.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    if (!state.hasMore || isLoading) return;

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
