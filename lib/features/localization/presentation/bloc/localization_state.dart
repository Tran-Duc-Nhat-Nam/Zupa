part of 'localization_cubit.dart';

@freezed
sealed class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial() = Initial;

  const factory LocalizationState.loading(AppLocalization locale) = Loading;

  const factory LocalizationState.loaded(AppLocalization locale) = Loaded;
}

extension LocalizationStateExtension on LocalizationState {
  AppLocalization get currentLocale => switch (this) {
    Initial() => .followSystem,
    Loaded(:final locale) => locale,
    Loading(:final locale) => locale,
  };
}
