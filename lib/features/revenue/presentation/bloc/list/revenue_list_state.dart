part of 'revenue_list_cubit.dart';

@freezed
sealed class RevenueListState with _$RevenueListState {
  const factory RevenueListState.initial() = Initial;

  const factory RevenueListState.loading({required List<DailyRevenueEntity> revenueList}) =
      Loading;

  const factory RevenueListState.loaded({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = Loaded;

  const factory RevenueListState.failed({
    required List<DailyRevenueEntity> revenueList,
    String? message,
  }) = Failed;

  const factory RevenueListState.refreshing({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = Refreshing;

  const factory RevenueListState.refreshFailed({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = RefreshFailed;

  const factory RevenueListState.refreshEmpty({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = RefreshEmpty;

  const factory RevenueListState.loadingMore({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = LoadingMore;

  const factory RevenueListState.loadMoreFailed({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = LoadMoreFailed;

  const factory RevenueListState.loadMoreEmpty({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = LoadMoreEmpty;

  const factory RevenueListState.empty() = Emtpy;
}
