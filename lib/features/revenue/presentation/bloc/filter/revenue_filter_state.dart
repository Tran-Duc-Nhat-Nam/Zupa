part of 'revenue_filter_cubit.dart';

@freezed
sealed class RevenueFilterState with _$RevenueFilterState {
  const factory RevenueFilterState.initial() = Initial;

  const factory RevenueFilterState.loading() = Loading;

  const factory RevenueFilterState.loaded() = Loaded;

  const factory RevenueFilterState.filtering() = Filtering;

  const factory RevenueFilterState.failed({required String message}) = Failed;
}
