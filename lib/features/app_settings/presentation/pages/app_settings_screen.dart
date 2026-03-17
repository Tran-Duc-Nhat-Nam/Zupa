import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/theme.dart';

import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/state/app_state.dart';

@RoutePage()
class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  AppState<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends AppState<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: t.settings.appSettings,
      child: Padding(
        padding: const .symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            AppCard(
              child: Column(
                spacing: 10,
                children: [
                  BlocConsumer<LocalizationCubit, LocalizationState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        loading: (locale) {
                          if (locale == AppLocalization.followSystem) {
                            LocaleSettings.useDeviceLocale();
                          } else {
                            LocaleSettings.setLocale(
                              AppLocale.values.firstWhere(
                                (element) =>
                                    element.languageCode == locale.name,
                              ),
                            );
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      return AppListTile(
                        padding: .zero,
                        leadingIcon: Symbols.globe,
                        text: t.settings.language,
                        trailing: AppDropDownSearch<AppLocalization>(
                          formControl: context
                              .read<LocalizationCubit>()
                              .formModel
                              .localizationModeControl,
                          buttonDecoration: const .new(),
                          iconSize: 0,
                          dropdownItems: const [.vi, .en, .ja, .followSystem],
                          buttonWidth: 140,
                          initialValue: state.when(
                            loaded: (locale) => locale,
                            loading: (locale) => locale,
                            initial: () => .followSystem,
                          ),
                          itemLabelGetter: (item) => item != null
                              ? t[item.getLocaleString() ?? ''] ?? t.settings.followSystem
                              : t.settings.followSystem,
                          onChanged: (value) =>
                              context.read<LocalizationCubit>().changeLocale(),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      final settings = state.maybeWhen(
                        loaded: (s) => s,
                        orElse: () => ThemeSettings(),
                      );

                      return Column(
                        children: [
                          AppListTile(
                            padding: .zero,
                            leadingIcon: Symbols.lightbulb_rounded,
                            text: t.settings.theme,
                            trailing: AppDropDownSearch<AppThemeMode>(
                              formControl: context
                                  .read<ThemeCubit>()
                                  .formModel
                                  .themeModeControl,
                              buttonDecoration: const .new(),
                              iconSize: 0,
                              dropdownItems: AppThemeMode.values,
                              buttonWidth: 140,
                              initialValue: settings.themeMode,
                              itemLabelGetter: (item) => switch (item) {
                                AppThemeMode.light => t.settings.lightMode,
                                AppThemeMode.dark => t.settings.darkMode,
                                _ => t.settings.followSystem,
                              },
                              onChanged: (value) =>
                                  context.read<ThemeCubit>().changeTheme(),
                            ),
                          ),
                          AppListTile(
                            padding: .zero,
                            leadingIcon: Symbols.palette,
                            text: t.settings.colorScheme,
                            trailing: AppDropDownSearch<AppColorSchemeSource>(
                              formControl: context
                                  .read<ThemeCubit>()
                                  .formModel
                                  .colorSourceControl,
                              buttonDecoration: const .new(),
                              iconSize: 0,
                              dropdownItems: AppColorSchemeSource.values,
                              buttonWidth: 140,
                              initialValue: settings.colorSource,
                              itemLabelGetter: (item) => switch (item) {
                                AppColorSchemeSource.brand => t.settings.brandColor,
                                AppColorSchemeSource.custom => t.settings.customColor,
                                AppColorSchemeSource.materialYou =>
                                  t.settings.materialYou,
                                null => t.settings.brandColor,
                              },
                              onChanged: (value) =>
                                  context.read<ThemeCubit>().changeTheme(),
                            ),
                          ),
                          if (settings.colorSource ==
                              AppColorSchemeSource.custom) ...[
                            AppListTile(
                              padding: const .all(16),
                              leadingIcon: Symbols.colorize,
                              text: t.settings.customColor,
                            ),
                            Padding(
                              padding: const .all(16),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children:
                                      [
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
                                      ].map((colorValue) {
                                        final isSelected =
                                            settings.seedColorValue ==
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
                                            margin: const .symmetric(
                                              horizontal: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(colorValue),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: isSelected
                                                    ? Theme.of(
                                                        context,
                                                      ).colorScheme.onSurface
                                                    : Colors.transparent,
                                                width: 2.5,
                                              ),
                                              boxShadow: [
                                                if (isSelected)
                                                  BoxShadow(
                                                    color: Color(
                                                      colorValue,
                                                    ).withAlpha(125),
                                                    blurRadius: 8,
                                                    spreadRadius: 1,
                                                  ),
                                              ],
                                            ),
                                            child: isSelected
                                                ? Icon(
                                                    Icons.check,
                                                    size: 20,
                                                    color:
                                                        Color(
                                                              colorValue,
                                                            ).computeLuminance() >
                                                            0.5
                                                        ? AppColors.of(context).onSurface
                                                        : AppColors.of(context).surface,
                                                  )
                                                : null,
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                  if (kDebugMode)
                    BlocBuilder<DebuggerCubit, DebuggerState>(
                      builder: (context, state) {
                        return AppListTile(
                          padding: .zero,
                          leadingIcon: Symbols.bug_report_rounded,
                          text: t.settings.debuggerMode,
                          trailing: SizedBox(
                            height: 20,
                            child: Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                padding: .zero,
                                materialTapTargetSize: .shrinkWrap,
                                thumbIcon: .resolveWith<Icon?>((
                                  Set<WidgetState> states,
                                ) {
                                  if (states.contains(WidgetState.selected)) {
                                    return const .new(Icons.check);
                                  }
                                  return const .new(Icons.close);
                                }),
                                thumbColor: .all(
                                  AppColors.of(context).surface,
                                ),
                                inactiveTrackColor: AppColors.of(
                                  context,
                                ).surfaceContainerHighest,
                                trackOutlineWidth: const WidgetStatePropertyAll(
                                  0,
                                ),
                                trackOutlineColor: const WidgetStatePropertyAll(
                                  WidgetStateColor.transparent,
                                ),
                                value: state.maybeWhen(
                                  loaded: (isOn) => isOn,
                                  orElse: () => false,
                                ),
                                onChanged: (value) => context
                                    .read<DebuggerCubit>()
                                    .changeDebuggerMode(value),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  // Divider(color: AppColors.of(context).surfaceContainerHighest),
                  // BlocBuilder<AuthCubit, AuthState>(
                  //   builder: (context, state) {
                  //     return AppListTile(
                  //       padding: .zero,
                  //       leadingIcon: Symbols.notification,
                  //       text: t.biometricAuth,
                  //       trailing: SizedBox(
                  //         height: 20,
                  //         child: Transform.scale(
                  //           scale: 0.8,
                  //           child: Switch(
                  //             padding: .zero,
                  //             materialTapTargetSize: .shrinkWrap,
                  //             thumbIcon: .resolveWith<Icon?>((
                  //               Set<WidgetState> states,
                  //             ) {
                  //               if (states.contains(WidgetState.selected)) {
                  //                 return const .new(Icons.check);
                  //               }
                  //               return const .new(Icons.close);
                  //             }),
                  //             thumbColor: .all(
                  //               AppColors.of(context).surface,
                  //             ),
                  //             inactiveTrackColor: AppColors.of(
                  //               context,
                  //             ).surfaceContainerHighest,
                  //             trackOutlineWidth: const WidgetStatePropertyAll(
                  //               0,
                  //             ),
                  //             trackOutlineColor: const WidgetStatePropertyAll(
                  //               WidgetStateColor.transparent,
                  //             ),
                  //             value: state.maybeWhen(
                  //               loaded: (isOn) => isOn,
                  //               orElse: () => false,
                  //             ),
                  //             onChanged: (value) => context
                  //                 .read<AuthCubit>()
                  //                 .toggleBiometricMode(value),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
