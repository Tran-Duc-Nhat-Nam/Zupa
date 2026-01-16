part of 'revenue_filter_cubit.dart';

@freezed
sealed class RevenueFilterState with _$RevenueFilterState {
  const factory RevenueFilterState.initial({
    @Default(RevenueFilter()) RevenueFilter filter,
  }) = Initial;
  const factory RevenueFilterState.loading({
    @Default(RevenueFilter()) RevenueFilter filter,
  }) = Loading;
  const factory RevenueFilterState.loaded({
    @Default(RevenueFilter()) RevenueFilter filter,
  }) = Loaded;
  const factory RevenueFilterState.filtering({
    @Default(RevenueFilter()) RevenueFilter filter,
  }) = Filtering;
  const factory RevenueFilterState.failed({
    @Default(RevenueFilter()) RevenueFilter filter,
    required String message,
  }) = Failed;
}
