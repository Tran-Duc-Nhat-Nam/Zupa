class SetUISettingsParams {
  const SetUISettingsParams({
    required this.isFloatingNavbar,
    required this.isShowNavbarLabel,
    required this.isGlassmorphism,
  });

  factory SetUISettingsParams.initial({
    bool? isFloatingNavbar,
    bool? isShowNavbarLabel,
    bool? isGlassmorphism,
  }) => .new(
    isFloatingNavbar: isFloatingNavbar ?? false,
    isShowNavbarLabel: isShowNavbarLabel ?? false,
    isGlassmorphism: isGlassmorphism ?? false,
  );

  final bool isFloatingNavbar;
  final bool isShowNavbarLabel;
  final bool isGlassmorphism;
}
