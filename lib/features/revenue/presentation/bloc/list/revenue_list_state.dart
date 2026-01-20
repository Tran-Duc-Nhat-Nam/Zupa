part of 'revenue_list_cubit.dart';

@freezed
sealed class RevenueListState with _$RevenueListState {
  const factory RevenueListState.initial() = Initial;
  const factory RevenueListState.loading() = Loading;
  const factory RevenueListState.refreshing(List<DailyRevenue> tickets) =
  Refreshing;
  const factory RevenueListState.loadingMore(List<DailyRevenue> tickets) =
  LoadingMore;
  const factory RevenueListState.loaded(
      List<DailyRevenue> tickets,
      int pageIndex,
      ) = Loaded;
  const factory RevenueListState.failed(String message) = Failed;
  const factory RevenueListState.empty() = Emtpy;
  const factory RevenueListState.unauthenticated() = Unauthenticated;
}
