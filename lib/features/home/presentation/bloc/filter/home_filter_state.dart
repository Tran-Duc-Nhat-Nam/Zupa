part of 'home_filter_cubit.dart';

@freezed
sealed class HomeFilterState with _$HomeFilterState {
  const factory HomeFilterState.initial() = Initial;
  const factory HomeFilterState.loading() = Loading;
  const factory HomeFilterState.loaded({
    @Default(HomeFilterEntity(page: defaultPageIndex, size: defaultPageSize, keyword: null, time: null, type: null))
    HomeFilterEntity filter,
  }) = Loaded;
  const factory HomeFilterState.filtering({
    @Default(HomeFilterEntity(page: defaultPageIndex, size: defaultPageSize, keyword: null, time: null, type: null))
    HomeFilterEntity filter,
  }) = Filtering;
  const factory HomeFilterState.failed(String message) = Failed;
  const factory HomeFilterState.empty() = Empty;
}
