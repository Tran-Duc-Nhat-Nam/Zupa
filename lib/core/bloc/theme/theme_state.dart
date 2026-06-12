part of 'theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = Initial;

  const factory ThemeState.loading({@Default(ThemeSettingsEntity()) ThemeSettingsEntity settings}) = Loading;

  const factory ThemeState.loaded({@Default(ThemeSettingsEntity()) ThemeSettingsEntity settings}) = Loaded;
}

extension ThemeStateExtension on ThemeState {
  ThemeSettingsEntity get currentSettings => switch (this) {
    Initial() => const ThemeSettingsEntity(),
    Loading(:final settings) => settings,
    Loaded(:final settings) => settings,
  };
}
