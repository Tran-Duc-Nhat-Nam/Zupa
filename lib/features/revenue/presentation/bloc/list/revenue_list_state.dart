part of 'revenue_list_cubit.dart';

@freezed
sealed class RevenueListState with _$RevenueListState {
  const factory RevenueListState({
    @Default([]) List<DailyRevenue> revenue,
    @Default(1) int page,
    @Default(true) bool hasMore,
    @Default(NetworkState.initial()) NetworkState<List<DailyRevenue>> status,
  }) = _RevenueListState;
}
