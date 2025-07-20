part of 'history_filter_cubit.dart';

@freezed
sealed class HistoryFilterState with _$HistoryFilterState {
  const factory HistoryFilterState.initial() = Initial;
  const factory HistoryFilterState.loading() = Loading;
  const factory HistoryFilterState.loaded({@Default(HistoryFilter()) HistoryFilter filter}) = Loaded;
  const factory HistoryFilterState.filtering({@Default(HistoryFilter()) HistoryFilter filter}) = Filtering;
  const factory HistoryFilterState.failed(String message) = Failed;
}
