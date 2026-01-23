part of 'theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = Initial;
  const factory ThemeState.loading(AppThemeMode mode) = Loading;
  const factory ThemeState.loaded(AppThemeMode mode) = Loaded;
}
