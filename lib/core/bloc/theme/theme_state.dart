part of 'theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = Initial;

  const factory ThemeState.loading({@Default(ThemeSettings()) ThemeSettings settings}) = Loading;

  const factory ThemeState.loaded({@Default(ThemeSettings()) ThemeSettings settings}) = Loaded;
}
