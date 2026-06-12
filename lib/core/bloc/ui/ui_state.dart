part of 'ui_cubit.dart';

@freezed
sealed class UIState with _$UIState {
  const factory UIState.initial() = Initial;

  const factory UIState.loaded({
    @Default(.new()) UISettingsEntity settings,
  }) = Loaded;
}

extension UIStateExtension on UIState {
  UISettingsEntity get currentSettings => switch (this) {
    Initial() => const .new(),
    Loaded(:final settings) => settings,
  };
}
