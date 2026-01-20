part of 'home_filter_cubit.dart';

@freezed
sealed class HomeFilterState with _$HomeFilterState {
  const factory HomeFilterState.initial() = Initial;
  const factory HomeFilterState.loading() = Loading;
  const factory HomeFilterState.loaded({
    @Default(HomeFilter()) HomeFilter filter,
  }) = Loaded;
  const factory HomeFilterState.filtering({
    @Default(HomeFilter()) HomeFilter filter,
  }) = Filtering;
  const factory HomeFilterState.failed(String message) = Failed;
  const factory HomeFilterState.empty() = Empty;
  const factory HomeFilterState.unauthenticated() = Unauthenticated;
}
