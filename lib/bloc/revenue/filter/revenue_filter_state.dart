part of 'revenue_filter_cubit.dart';

@freezed
sealed class RevenueFilterState with _$RevenueFilterState {
  const factory RevenueFilterState.initial() = Initial;
  const factory RevenueFilterState.loading() = Loading;
  const factory RevenueFilterState.loaded({@Default(RevenueFilter()) RevenueFilter filter}) = Loaded;
  const factory RevenueFilterState.filtering({@Default(RevenueFilter()) RevenueFilter filter}) = Filtering;
  const factory RevenueFilterState.failed(String message) = Failed;
}
