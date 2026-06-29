part of 'revenue_cubit.dart';

@freezed
sealed class RevenueState with _$RevenueState {
  const factory RevenueState.initial() = Initial;

  const factory RevenueState.loading({
    required List<DailyRevenueEntity> revenueList,
  }) = Loading;

  const factory RevenueState.loaded({
    required List<DailyRevenueEntity> revenueList,
    required GetRevenueParams filter,
  }) = Loaded;

  const factory RevenueState.failed({
    required List<DailyRevenueEntity> revenueList,
    String? message,
  }) = Failed;

  const factory RevenueState.refreshing({
    required List<DailyRevenueEntity> revenueList,
    required GetRevenueParams filter,
  }) = Refreshing;

  const factory RevenueState.refreshFailed({
    required List<DailyRevenueEntity> revenueList,
    required GetRevenueParams filter,
  }) = RefreshFailed;

  const factory RevenueState.loadingMore({
    required List<DailyRevenueEntity> revenueList,
    required GetRevenueParams filter,
  }) = LoadingMore;

  const factory RevenueState.loadMoreFailed({
    required List<DailyRevenueEntity> revenueList,
    required GetRevenueParams filter,
  }) = LoadMoreFailed;

  const factory RevenueState.empty() = Emtpy;
}

extension RevenueStateExtension on RevenueState {
  List<DailyRevenueEntity> get currentItems => switch (this) {
    Loaded(:final revenueList) => revenueList,
    Refreshing(:final revenueList) => revenueList,
    LoadingMore(:final revenueList) => revenueList,
    RefreshFailed(:final revenueList) => revenueList,
    LoadMoreFailed(:final revenueList) => revenueList,
    _ => [],
  };

  GetRevenueParams get currentFilter => switch (this) {
    Loaded(:final filter) => filter,
    Refreshing(:final filter) => filter,
    LoadingMore(:final filter) => filter,
    RefreshFailed(:final filter) => filter,
    LoadMoreFailed(:final filter) => filter,
    _ => .initial(),
  };

  bool get isLoading => this is Loading;
}
