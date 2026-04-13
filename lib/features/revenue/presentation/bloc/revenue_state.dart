part of 'revenue_cubit.dart';

@freezed
sealed class RevenueState with _$RevenueState {
  const factory RevenueState.initial() = Initial;

  const factory RevenueState.loading({
    required List<DailyRevenueEntity> revenueList,
  }) = Loading;

  const factory RevenueState.loaded({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = Loaded;

  const factory RevenueState.failed({
    required List<DailyRevenueEntity> revenueList,
    String? message,
  }) = Failed;

  const factory RevenueState.refreshing({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = Refreshing;

  const factory RevenueState.refreshFailed({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = RefreshFailed;

  const factory RevenueState.refreshEmpty({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = RefreshEmpty;

  const factory RevenueState.loadingMore({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = LoadingMore;

  const factory RevenueState.loadMoreFailed({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = LoadMoreFailed;

  const factory RevenueState.loadMoreEmpty({
    required List<DailyRevenueEntity> revenueList,
    required int pageIndex,
  }) = LoadMoreEmpty;

  const factory RevenueState.empty() = Emtpy;
}
