part of 'theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = ThemeInitial;

  const factory ThemeState.loading({
    @Default(.new()) ThemeSettingsEntity settings,
  }) = ThemeLoading;

  const factory ThemeState.loaded({
    @Default(.new()) ThemeSettingsEntity settings,
  }) = ThemeLoaded;
}

extension ThemeStateExtension on ThemeState {
  ThemeSettingsEntity get currentSettings => switch (this) {
    ThemeInitial() => const .new(),
    ThemeLoading(:final settings) => settings,
    ThemeLoaded(:final settings) => settings,
  };
}
