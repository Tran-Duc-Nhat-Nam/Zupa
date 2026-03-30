part of 'ui_cubit.dart';

@freezed
sealed class UIState with _$UIState {
  const factory UIState.initial() = Initial;
  const factory UIState.loaded({required UISettingsEntity settings}) = Loaded;
}
