import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/history/domain/usecases/get_history_usecase.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

part 'history_cubit.freezed.dart';
part 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase _getHistory;
  RequestToken? _getToken;

  HistoryCubit(this._getHistory) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    _getToken?.cancel();
    _getToken = .new();
    final response = await _getHistory(filter: .initial(), token: _getToken);

    switch (response) {
      case Success(:final data):
        emit(data.isEmpty ? const .empty() : .loaded(data, defaultPageIndex));
      case Error(:final message):
        emit(.failed(message));
      default:
        emit(const .failed('error'));
    }
  }

  Future<void> refresh({required GetHistoryParams filter}) async {
    emit(.refreshing(state.items));
    _getToken?.cancel();
    _getToken = .new();
    final response = await _getHistory(filter: filter, token: _getToken);

    switch (response) {
      case Success(:final data):
        emit(data.isEmpty ? const .empty() : .loaded(data, defaultPageIndex));
      case Error(:final message):
        emit(.failed(message));
      default:
        emit(const .failed('error'));
    }
  }

  Future<void> loadMore({required GetHistoryParams filter}) async {
    final List<HistoryTicketEntity> tempItems = state.items;
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(tempItems));
    _getToken?.cancel();
    _getToken = .new();
    final newFilter = GetHistoryParams(
      page: filter.page + 1,
      size: filter.size,
      keyword: filter.keyword,
      time: filter.time,
      type: filter.type,
    );
    final result = await _getHistory(filter: newFilter);
    switch (result) {
      case Success(data: final newItems):
        tempItems.addAll(newItems);
        emit(
          tempItems.isEmpty
              ? const .empty()
              : .loaded(
                  tempItems,
                  newItems.isEmpty ? pageIndex : pageIndex + 1,
                ),
        );
      case Error(:final message):
        emit(.failed(message));
      default:
        emit(const .failed('error'));
    }
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    return super.close();
  }
}
