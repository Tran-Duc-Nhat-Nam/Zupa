part of 'history_filter_cubit.dart';

@freezed
sealed class HistoryFilterState with _$HistoryFilterState {
  const factory HistoryFilterState.initial() = Initial;

  const factory HistoryFilterState.loading() = Loading;

  const factory HistoryFilterState.loaded({
    @Default(
      HistoryFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        type: null,
        time: null,
        keyword: null,
      ),
    )
    HistoryFilterEntity filter,
  }) = Loaded;

  const factory HistoryFilterState.filtering({
    @Default(
      HistoryFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        type: null,
        time: null,
        keyword: null,
      ),
    )
    HistoryFilterEntity filter,
  }) = Filtering;

  const factory HistoryFilterState.failed(String? message) = Failed;
}
