part of 'revenue_filter_cubit.dart';

@freezed
sealed class RevenueFilterState with _$RevenueFilterState {
  const factory RevenueFilterState.initial() = Initial;

  const factory RevenueFilterState.loading({required RevenueFilterEntity filter}) = Loading;

  const factory RevenueFilterState.loaded({required RevenueFilterEntity filter}) = Loaded;

  const factory RevenueFilterState.filtering({required RevenueFilterEntity filter}) = Filtering;

  const factory RevenueFilterState.failed({required RevenueFilterEntity filter, required String message}) = Failed;
}
