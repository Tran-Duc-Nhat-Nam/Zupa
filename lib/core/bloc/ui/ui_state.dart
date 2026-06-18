part of 'ui_cubit.dart';

@freezed
sealed class UIState with _$UIState {
  const factory UIState.initial() = UIInitial;

  const factory UIState.loaded({
    @Default(.new()) UISettingsEntity settings,
  }) = UILoaded;
}

extension UIStateExtension on UIState {
  UISettingsEntity get currentSettings => switch (this) {
    UIInitial() => const .new(),
    UILoaded(:final settings) => settings,
  };
}
