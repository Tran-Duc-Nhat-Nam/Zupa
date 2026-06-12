part of 'theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = Initial;

  const factory ThemeState.loading({
    @Default(.new()) ThemeSettingsEntity settings,
  }) = Loading;

  const factory ThemeState.loaded({
    @Default(.new()) ThemeSettingsEntity settings,
  }) = Loaded;
}

extension ThemeStateExtension on ThemeState {
  ThemeSettingsEntity get currentSettings => switch (this) {
    Initial() => const .new(),
    Loading(:final settings) => settings,
    Loaded(:final settings) => settings,
  };
}
