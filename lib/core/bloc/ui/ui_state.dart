part of 'ui_cubit.dart';

@freezed
sealed class UIState with _$UIState {
  const factory UIState.initial() = Initial;

  const factory UIState.loaded({
    @Default(
      UISettingsEntity(
        isFloatingNavbar: false,
        isShowNavbarLabel: false,
        isGlassmorphism: false,
      ),
    )
    UISettingsEntity settings,
  }) = Loaded;
}
