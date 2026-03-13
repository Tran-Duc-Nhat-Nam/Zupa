part of 'history_list_cubit.dart';

@freezed
sealed class HistoryListState with _$HistoryListState {
  const factory HistoryListState.initial() = Initial;
  const factory HistoryListState.loading() = Loading;
  const factory HistoryListState.refreshing(List<HistoryTicketEntity> tickets) =
      Refreshing;
  const factory HistoryListState.loadingMore(List<HistoryTicketEntity> tickets) =
      LoadingMore;
  const factory HistoryListState.loaded(
    List<HistoryTicketEntity> tickets,
    int pageIndex,
  ) = Loaded;
  const factory HistoryListState.failed(String message) = Failed;
  const factory HistoryListState.empty() = Emtpy;
  const factory HistoryListState.unauthenticated() = Unauthenticated;
}
