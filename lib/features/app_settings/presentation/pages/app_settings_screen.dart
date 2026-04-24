import 'package:auto_route/annotations.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/bloc/animation/animation_cubit.dart';
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/bloc/ui/ui_cubit.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
import 'package:zupa/core/models/form/ui/ui_settings_form.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_switch.dart';
import 'package:zupa/core/widgets/state/app_state.dart';

@RoutePage()
class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  AppState<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends AppState<AppSettingsScreen> {
  static const List<int> _customSeedColors = [
    0xFF6750A4, // Brand
    0xFFE53935, // Red
    0xFFD81B60, // Pink
    0xFF8E24AA, // Purple
    0xFF5E35B1, // Deep Purple
    0xFF3949AB, // Indigo
    0xFF1E88E5, // Blue
    0xFF039BE5, // Light Blue
    0xFF00ACC1, // Cyan
    0xFF00897B, // Teal
    0xFF43A047, // Green
    0xFF7CB342, // Light Green
    0xFFC0CA33, // Lime
    0xFFFDD835, // Yellow
    0xFFFFB300, // Amber
    0xFFFB8C00, // Orange
    0xFFF4511E, // Deep Orange
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return AppScreen(
      title: t.settings.appSettings,
      child: Skeletonizer(
        enabled: false,
        child: Padding(
          padding: const .symmetric(vertical: 16, horizontal: 36),
          child: Column(
            spacing: 24,
            children: [
              BlocBuilder<LocalizationCubit, LocalizationState>(
                builder: (context, localizationState) {
                  return BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      return BlocBuilder<AnimationCubit, AnimationState>(
                        builder: (context, animationState) {
                          Widget buildContent(DebuggerState? debuggerState) {
                            final themeSettings = themeState.maybeWhen(
                              loaded: (s) => s,
                              orElse: () => ThemeSettings(),
                            );
                            return Column(
                              children: [
                                AppList(
                                  items: [
                                    AppListItem(
                                      leadingIcon: Symbols.globe,
                                      text: t.settings.language,
                                      trailing: AppDropDownSearch<AppLocalization>(
                                        formControl: context
                                            .read<LocalizationCubit>()
                                            .formModel
                                            .localizationModeControl,
                                        buttonDecoration: const .new(),
                                        dropdownItems: const [
                                          .vi,
                                          .en,
                                          .ja,
                                          .followSystem,
                                        ],
                                        buttonWidth: 165,
                                        iconEnabledColor: colorScheme.secondary,
                                        initialValue: localizationState.when(
                                          loaded: (locale) => locale,
                                          loading: (locale) => locale,
                                          initial: () => .followSystem,
                                        ),
                                        itemLabelGetter: (item) => item != null
                                            ? t["common.languages.${item.getLocaleString() ?? ''}"] ??
                                                  t.settings.followSystem
                                            : t.settings.followSystem,
                                        onChanged: (value) => context
                                            .read<LocalizationCubit>()
                                            .changeLocale(),
                                      ),
                                    ),
                                    AppListItem(
                                      leadingIcon: Symbols.lightbulb_rounded,
                                      text: t.settings.theme,
                                      trailing: AppDropDownSearch<ThemeMode>(
                                        formControl: context
                                            .read<ThemeCubit>()
                                            .formModel
                                            .themeModeControl,
                                        buttonDecoration: const .new(),
                                        dropdownItems: ThemeMode.values,
                                        buttonWidth: 165,
                                        iconEnabledColor: colorScheme.secondary,
                                        initialValue: themeSettings.themeMode,
                                        itemLabelGetter: (item) =>
                                            switch (item) {
                                              .light => t.settings.lightMode,
                                              .dark => t.settings.darkMode,
                                              _ => t.settings.followSystem,
                                            },
                                        onChanged: (value) => context
                                            .read<ThemeCubit>()
                                            .changeTheme(),
                                      ),
                                    ),
                                    AppListItem(
                                      leadingIcon: Symbols.palette_rounded,
                                      text: t.settings.colorScheme,
                                      trailing:
                                          AppDropDownSearch<
                                            AppColorSchemeSource
                                          >(
                                            formControl: context
                                                .read<ThemeCubit>()
                                                .formModel
                                                .colorSourceControl,
                                            buttonDecoration: const .new(),
                                            dropdownItems:
                                                AppColorSchemeSource.values,
                                            buttonWidth: 165,
                                            iconEnabledColor:
                                                colorScheme.secondary,
                                            initialValue:
                                                themeSettings.colorSource,
                                            itemLabelGetter: (item) =>
                                                switch (item) {
                                                  .brand =>
                                                    t.settings.brandColor,
                                                  .custom =>
                                                    t.settings.customColor,
                                                  .materialYou =>
                                                    t.settings.dynamicColor,
                                                  null => t.settings.brandColor,
                                                },
                                            onChanged: (value) => context
                                                .read<ThemeCubit>()
                                                .changeTheme(),
                                          ),
                                    ),
                                    AppListItem(
                                      leadingIcon: Symbols.animation_rounded,
                                      text: t.settings.animation,
                                      trailing: AppSwitch(
                                        value: animationState.maybeWhen(
                                          loaded: (isOn) => isOn,
                                          orElse: () => true,
                                        ),
                                        onToggle: (value) {
                                          context
                                              .read<AnimationCubit>()
                                              .changeAnimationMode(value);
                                        },
                                      ),
                                    ),
                                    if (kDebugMode)
                                      AppListItem(
                                        leadingIcon: Symbols.bug_report_rounded,
                                        text: t.settings.debuggerMode,
                                        trailing: AppSwitch(
                                          value:
                                              debuggerState?.maybeWhen(
                                                loaded: (isOn) => isOn,
                                                orElse: () => false,
                                              ) ??
                                              false,
                                          onToggle: (value) {
                                            context
                                                .read<DebuggerCubit>()
                                                .changeDebuggerMode(value);
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                if (themeSettings.colorSource == .custom)
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children:
                                            [
                                              null, // Color picker button
                                              ..._customSeedColors,
                                            ].map((colorValue) {
                                              if (colorValue == null) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      _showColorPickerDialog(
                                                        context,
                                                        themeSettings
                                                                .seedColorValue ??
                                                            0xFF6750A4,
                                                      ),
                                                  child: Container(
                                                    width: 45,
                                                    height: 45,
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 6,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: colorScheme
                                                          .surfaceContainerHighest,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Symbols.colorize_rounded,
                                                      size: 25,
                                                      color: colorScheme
                                                          .onSurfaceVariant,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final isSelected =
                                                  themeSettings
                                                      .seedColorValue ==
                                                  colorValue;
                                              return GestureDetector(
                                                onTap: () {
                                                  context
                                                          .read<ThemeCubit>()
                                                          .formModel
                                                          .seedColorValueControl
                                                          .value =
                                                      colorValue;
                                                  context
                                                      .read<ThemeCubit>()
                                                      .changeTheme();
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Color(colorValue),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? colorScheme
                                                                .onSurface
                                                          : Colors.transparent,
                                                      width: 3.0,
                                                    ),
                                                    boxShadow: [
                                                      if (isSelected)
                                                        BoxShadow(
                                                          color: Color(
                                                            colorValue,
                                                          ).withAlpha(180),
                                                          blurRadius: 8,
                                                          spreadRadius: 1,
                                                        ),
                                                    ],
                                                  ),
                                                  child: isSelected
                                                      ? Icon(
                                                          Symbols.check_rounded,
                                                          size: 20,
                                                          color:
                                                              Color(
                                                                    colorValue,
                                                                  ).computeLuminance() >
                                                                  0.5
                                                              ? colorScheme
                                                                    .onSurface
                                                              : colorScheme
                                                                    .surface,
                                                        )
                                                      : null,
                                                ),
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }

                          if (kDebugMode) {
                            return BlocBuilder<DebuggerCubit, DebuggerState>(
                              builder: (context, debuggerState) =>
                                  buildContent(debuggerState),
                            );
                          }
                          return buildContent(null);
                        },
                      );
                    },
                  );
                },
              ),
              UISettingsFormBuilder(
                builder: (context, formModel, _) =>
                    BlocBuilder<UICubit, UIState>(
                      builder: (context, state) {
                        state.whenOrNull(
                          loaded: (settings) => formModel.updateValue(
                            UISettings.fromEntity(settings),
                          ),
                        );
                        return AppList(
                          items: [
                            AppListItem(
                              leadingIcon: Symbols.dock_to_bottom_rounded,
                              text: t.settings.enableFloatingNavbar,
                              trailing: ReactiveValueListenableBuilder<bool>(
                                formControl: formModel.isFloatingNavbarControl,
                                builder: (context, control, child) => AppSwitch(
                                  value: control.value == true,
                                  onToggle: (value) {
                                    control.value = value;
                                    context.read<UICubit>().changeUIMode(
                                      params: formModel.model.toParams(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            AppListItem(
                              leadingIcon: Symbols.label_rounded,
                              text: t.settings.showNavbarLabel,
                              trailing: ReactiveValueListenableBuilder<bool>(
                                formControl: formModel.isShowNavbarLabelControl,
                                builder: (context, control, child) => AppSwitch(
                                  value: control.value == true,
                                  onToggle: (value) {
                                    control.value = value;
                                    context.read<UICubit>().changeUIMode(
                                      params: formModel.model.toParams(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            AppListItem(
                              leadingIcon: Symbols.blur_circular_rounded,
                              text: t.settings.enableGlassmorphism,
                              trailing: ReactiveValueListenableBuilder<bool>(
                                formControl: formModel.isGlassmorphismControl,
                                builder: (context, control, child) => AppSwitch(
                                  value: control.value == true,
                                  onToggle: (value) {
                                    control.updateValue(value);
                                    context.read<UICubit>().changeUIMode(
                                      params: formModel.model.toParams(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showColorPickerDialog(
    BuildContext context,
    int initialColorValue,
  ) async {
    final color = Color(initialColorValue);
    final themeCubit = context.read<ThemeCubit>();
    final colorScheme = AppColors.of(context);

    final resultColor = await showColorPickerDialog(
      context,
      color,
      title: Text(
        t.settings.customColor,
        style: AppTextStyles.titleMediumBold.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      tonalSubheading: Text(
        t.settings.tonal,
        style: AppTextStyles.bodyMediumSemibold.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      subheading: Text(
        t.settings.shade,
        style: AppTextStyles.bodyMediumSemibold.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      recentColorsSubheading: Text(
        t.settings.recentColors,
        style: AppTextStyles.bodyMediumSemibold.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      showRecentColors: true,
      backgroundColor: colorScheme.surfaceContainer,
      barrierColor: colorScheme.surface.withAlpha(200),
      spacing: 16,
      runSpacing: 6,
      borderRadius: 12,
      wheelDiameter: 180,
      showColorCode: true,
      colorCodeHasColor: true,
      enableTonalPalette: true,
      pickersEnabled: const <ColorPickerType, bool>{
        .both: false,
        .primary: true,
        .accent: true,
        .bw: false,
        .custom: true,
        .wheel: true,
      },
      customColorSwatchesAndNames: {
        for (final value in _customSeedColors)
          ColorTools.createPrimarySwatch(Color(value)):
              ColorTools.nameThatColor(Color(value)),
      },
      actionButtons: ColorPickerActionButtons(
        okButton: true,
        closeButton: true,
        okIcon: Symbols.check_rounded,
        closeIcon: Symbols.close_rounded,
        toolIconsThemeData: IconThemeData(color: colorScheme.primary),
      ),
      constraints: const BoxConstraints(
        minHeight: 480,
        minWidth: 320,
        maxWidth: 320,
      ),
    );

    if (resultColor != color) {
      themeCubit.formModel.seedColorValueControl.value = resultColor.toARGB32();
      themeCubit.changeTheme();
    }
  }
}
