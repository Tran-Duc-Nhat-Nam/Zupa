import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';

enum AppColorSchemeSource { brand, custom, materialYou }

class AppThemes {
  AppThemes._();

  static const _iconTheme = IconThemeData(
    fill: 0,
    weight: 600,
    opticalSize: 48,
  );

  static const brandSeedColor = Color(0xFF6750A4);

  static ThemeData _buildTheme(ColorScheme scheme, AppColors appColors) => .new(
    useMaterial3: true,
    colorScheme: scheme,
    textTheme:
        (scheme.brightness == .dark
                ? ThemeData.dark().textTheme
                : ThemeData.light().textTheme)
            .apply(fontFamily: 'RobotoFlex'),
    visualDensity: .adaptivePlatformDensity,
    iconTheme: _iconTheme,
    extensions: [appColors],
    appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
    elevatedButtonTheme: .new(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      ),
    ),
    navigationBarTheme: .new(
      backgroundColor: scheme.surfaceContainer,
      indicatorColor: scheme.secondaryContainer,
      labelTextStyle: .resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? .new(fontSize: 12, fontWeight: .w600, color: scheme.onSurface)
            : .new(
                fontSize: 12,
                fontWeight: .w500,
                color: scheme.onSurfaceVariant,
              ),
      ),
      iconTheme: .resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? .new(color: scheme.onSecondaryContainer)
            : .new(color: scheme.onSurfaceVariant),
      ),
    ),
  );

  static ThemeData getTheme({
    required Brightness brightness,
    required AppColorSchemeSource colorSource,
    ColorScheme? dynamicColorScheme,
    Color? customSeedColor,
  }) {
    final seedColor = switch (colorSource) {
      .materialYou => dynamicColorScheme?.primary ?? brandSeedColor,
      .custom => customSeedColor ?? brandSeedColor,
      .brand => brandSeedColor,
    };

    final scheme = colorSource == .materialYou && dynamicColorScheme != null
        ? dynamicColorScheme
        : ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness);

    return _buildTheme(scheme, .fromColorScheme(scheme));
  }
}
