part of 'revenue_filter_cubit.dart';

@freezed
sealed class RevenueFilterState with _$RevenueFilterState {
  const factory RevenueFilterState.initial({
    @Default(
      RevenueFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        type: null,
        time: null,
        keyword: null,
      ),
    )
    RevenueFilterEntity filter,
  }) = Initial;

  const factory RevenueFilterState.loading({
    @Default(
      RevenueFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        type: null,
        time: null,
        keyword: null,
      ),
    )
    RevenueFilterEntity filter,
  }) = Loading;

  const factory RevenueFilterState.loaded({
    @Default(
      RevenueFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        type: null,
        time: null,
        keyword: null,
      ),
    )
    RevenueFilterEntity filter,
  }) = Loaded;

  const factory RevenueFilterState.filtering({
    @Default(
      RevenueFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        type: null,
        time: null,
        keyword: null,
      ),
    )
    RevenueFilterEntity filter,
  }) = Filtering;

  const factory RevenueFilterState.failed({
    @Default(
      RevenueFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        type: null,
        time: null,
        keyword: null,
      ),
    )
    RevenueFilterEntity filter,
    required String message,
  }) = Failed;
}
