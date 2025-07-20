part of 'history_list_cubit.dart';

@freezed
sealed class HistoryListState with _$HistoryListState {
  const factory HistoryListState.initial() = Initial;
  const factory HistoryListState.loading() = Loading;
  const factory HistoryListState.refreshing(List<Ticket> tickets) = Refreshing;
  const factory HistoryListState.loadingMore(List<Ticket> tickets) = LoadingMore;
  const factory HistoryListState.loaded(List<Ticket> tickets, int pageIndex) = Loaded;
  const factory HistoryListState.failed(String message) = Failed;
  const factory HistoryListState.empty() = Emtpy;
}
