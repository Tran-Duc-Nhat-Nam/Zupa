part of 'general_config_cubit.dart';

@freezed
sealed class GeneralConfigState with _$GeneralConfigState {
  const factory GeneralConfigState.initial() = Initial;

  const factory GeneralConfigState.loading() = Loading;

  const factory GeneralConfigState.loaded(
    bool isWarning,
    int warningThreshold,
  ) = Loaded;

  const factory GeneralConfigState.empty() = Empty;
}

extension GeneralConfigStateExtension on GeneralConfigState {
  bool get isWarning => switch (this) {
    Loaded(:final isWarning) => isWarning,
    _ => false,
  };
}
