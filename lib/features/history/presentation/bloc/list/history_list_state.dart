part of 'history_list_cubit.dart';

@freezed
sealed class HistoryListState with _$HistoryListState {
  const factory HistoryListState({
    @Default([]) List<HistoryTicket> tickets,
    @Default(1) int page,
    @Default(true) bool hasMore,
    @Default(NetworkState.initial()) NetworkState<List<HistoryTicket>> status,
  }) = _HistoryListState;
}
