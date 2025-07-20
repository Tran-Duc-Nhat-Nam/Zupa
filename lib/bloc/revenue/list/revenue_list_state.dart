part of 'revenue_list_cubit.dart';

@freezed
sealed class RevenueListState with _$RevenueListState {
  const factory RevenueListState.initial() = Initial;
  const factory RevenueListState.loading() = Loading;
  const factory RevenueListState.refreshing(List<DailyRevenue> revenue) = Refreshing;
  const factory RevenueListState.loadingMore(List<DailyRevenue> revenue) = LoadingMore;
  const factory RevenueListState.loaded(List<DailyRevenue> revenue, int pageIndex) = Loaded;
  const factory RevenueListState.failed(String message) = Failed;
  const factory RevenueListState.empty() = Emtpy;
}
