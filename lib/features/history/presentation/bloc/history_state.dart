part of 'history_cubit.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = Initial;

  const factory HistoryState.loading() = Loading;

  const factory HistoryState.refreshing(List<HistoryTicketEntity> tickets) =
      Refreshing;

  const factory HistoryState.loadingMore(
    List<HistoryTicketEntity> tickets,
  ) = LoadingMore;

  const factory HistoryState.loaded(
    List<HistoryTicketEntity> tickets,
    int pageIndex,
  ) = Loaded;

  const factory HistoryState.failed(String? message) = Failed;

  const factory HistoryState.empty() = Emtpy;
}
