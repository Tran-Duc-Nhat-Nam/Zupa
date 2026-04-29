import 'package:auto_route/annotations.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/bloc/animation/animation_cubit.dart';
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
    return AppScreen(
      title: t.settings.appSettings,
      child: Skeletonizer(
        enabled: false,
        child: Padding(
          padding: const .symmetric(vertical: 16, horizontal: 36),
          child: Column(
            spacing: 24,
            children: [
              ThemeSettingsFormBuilder(
                builder: (context, formModel, _) =>
                    BlocBuilder<LocalizationCubit, LocalizationState>(
                      builder: (context, localizationState) {
                        return BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, themeState) {
                            themeState.whenOrNull(
                              loaded: (settings) =>
                                  formModel.updateValue(settings),
                            );
                            return BlocBuilder<AnimationCubit, AnimationState>(
                              builder: (context, animationState) => Column(
                                children: [
                                  AppList(
                                    items: [
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
                                      _localizationItem(context: context),
                                      _themeModeItem(context: context),
                                      _colorSourceItem(context: context),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
              ),
              BlocBuilder<UICubit, UIState>(
                builder: (context, state) => UISettingsFormBuilder(
                  initState: (context, formModel) => state.whenOrNull(
                    loaded: (settings) =>
                        formModel.updateValue(UISettings.fromEntity(settings)),
                  ),
                  builder: (context, formModel, _) => AppList(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppListItem _localizationItem({required BuildContext context}) {
    final colorScheme = AppColors.of(context);
    final cubit = context.read<LocalizationCubit>();
    return AppListItem(
      leadingIcon: Symbols.globe,
      text: t.settings.language,
      trailing: AppDropDownSearch<AppLocalization>(
        buttonDecoration: const .new(),
        dropdownItems: const [.vi, .en, .ja, .followSystem],
        buttonWidth: 135,
        buttonPadding: const .symmetric(vertical: 8),
        iconEnabledColor: colorScheme.secondary,
        initialValue: cubit.state.when(
          loaded: (locale) => locale,
          loading: (locale) => locale,
          initial: () => .followSystem,
        ),
        itemLabelGetter: (item) =>
            t["common.languages.${item?.getLocaleString() ?? ''}"] ??
            t.settings.followSystem,
        onChanged: (value) => cubit.changeLocale(value ?? .followSystem),
      ),
    );
  }

  AppListItem _themeModeItem({required BuildContext context}) {
    final colorScheme = AppColors.of(context);
    final cubit = context.read<ThemeCubit>();
    final formModel = ReactiveThemeSettingsForm.of(context);

    return AppListItem(
      leadingIcon: Symbols.lightbulb_rounded,
      text: t.settings.theme,
      trailing: ReactiveValueListenableBuilder<ThemeMode>(
        formControl: formModel?.themeModeControl,
        builder: (context, control, child) => AppDropDownSearch<ThemeMode>(
          buttonDecoration: const .new(),
          dropdownItems: ThemeMode.values,
          buttonWidth: 135,
          buttonPadding: const .symmetric(vertical: 8),
          iconEnabledColor: colorScheme.secondary,
          initialValue: control.value,
          itemLabelGetter: (item) => switch (item) {
            .light => t.settings.lightMode,
            .dark => t.settings.darkMode,
            _ => t.settings.followSystem,
          },
          onChanged: (value) {
            control.updateValue(value);
            cubit.changeTheme(
              params: formModel?.model.toParams() ?? .initial(themeMode: value),
            );
          },
        ),
      ),
    );
  }

  AppListItem _colorSourceItem({required BuildContext context}) {
    final colorScheme = AppColors.of(context);
    final cubit = context.read<ThemeCubit>();
    final formModel = ReactiveThemeSettingsForm.of(context);

    return AppListItem(
      leadingIcon: Symbols.palette_rounded,
      text: t.settings.colorScheme,
      trailing: ReactiveValueListenableBuilder<AppColorSchemeSource>(
        formControl: formModel?.colorSourceControl,
        builder: (context, control, child) => Column(
          children: [
            AppDropDownSearch<AppColorSchemeSource>(
              buttonDecoration: const .new(),
              dropdownItems: AppColorSchemeSource.values,
              buttonWidth: 135,
              buttonPadding: const .symmetric(vertical: 8),
              iconEnabledColor: colorScheme.secondary,
              initialValue: control.value,
              itemLabelGetter: (item) => switch (item) {
                .brand => t.settings.brandColor,
                .custom => t.settings.customColor,
                .materialYou => t.settings.dynamicColor,
                null => t.settings.brandColor,
              },
              onChanged: (value) {
                control.updateValue(value);
                cubit.changeTheme(
                  params:
                      formModel?.model.toParams() ??
                      .initial(colorSource: value),
                );
              },
            ),
          ],
        ),
      ),
      isExpandable: formModel?.colorSourceControl.value == .custom,
      isExpanded: formModel?.colorSourceControl.value == .custom,
      children: [_colorPickerItem(context: context)],
    );
  }

  Widget _colorPickerItem({required BuildContext context}) {
    final colorScheme = AppColors.of(context);
    final formModel = ReactiveThemeSettingsForm.of(context);

    return ReactiveValueListenableBuilder<int?>(
      formControl: formModel?.seedColorValueControl,
      builder: (context, control, _) => SingleChildScrollView(
        scrollDirection: .horizontal,
        child: Padding(
          padding: const .only(bottom: 16),
          child: Row(
            children: [
              const SizedBox(width: 6),
              ...[
                null, // Color picker button
                ..._customSeedColors,
              ].map((colorValue) {
                if (colorValue == null) {
                  return GestureDetector(
                    onTap: () => _showColorPickerDialog(
                      context: context,
                      initialColorValue: control.value ?? 0xFF6750A4,
                    ),
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: const .symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        shape: .circle,
                      ),
                      child: Icon(
                        Symbols.colorize_rounded,
                        size: 20,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  );
                }
                final isSelected = control.value == colorValue;
                return GestureDetector(
                  onTap: () {
                    control.value = colorValue;
                    context.read<ThemeCubit>().changeTheme(
                      params:
                          formModel?.model.toParams() ??
                          .initial(seedColorValue: colorValue),
                    );
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    margin: const .symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Color(colorValue),
                      shape: .circle,
                      border: .all(
                        color: isSelected
                            ? colorScheme.secondary
                            : Colors.transparent,
                        width: 3.0,
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            Symbols.check_rounded,
                            size: 20,
                            color: colorScheme.primary,
                          )
                        : null,
                  ),
                );
              }),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showColorPickerDialog({
    required BuildContext context,
    required int initialColorValue,
  }) async {
    final color = Color(initialColorValue);
    final colorScheme = AppColors.of(context);
    final formModel = ReactiveThemeSettingsForm.of(context);
    final themeCubit = context.read<ThemeCubit>();
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
      formModel?.seedColorValueControl.value = resultColor.toARGB32();
      themeCubit.changeTheme(
        params:
            formModel?.model.toParams() ??
            .initial(seedColorValue: resultColor.toARGB32()),
      );
    }
  }
}
