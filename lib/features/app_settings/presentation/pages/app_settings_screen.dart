import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/styles/theme.dart';

import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/gen/strings.g.dart';

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
      title: t.appSettings,
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
                        text: t.language,
                        trailing: AppDropDownSearch<AppLocalization>(
                          formControl: context.read<LocalizationCubit>().formModel.localizationModeControl,
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
                              ? t[item.getLocaleString() ?? 'followSystem']
                              : t.followSystem,
                          onChanged: (value) => context
                              .read<LocalizationCubit>()
                              .changeLocale(),
                        ),
                      );
                    },
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return AppListTile(
                        padding: .zero,
                        leadingIcon: Symbols.lightbulb_rounded,
                        text: t.language,
                        trailing: AppDropDownSearch<AppThemeMode>(
                          formControl: context.read<ThemeCubit>().formModel.themeModeControl,
                          buttonDecoration: const .new(),
                          iconSize: 0,
                          dropdownItems: const [.light, .dark, .followSystem],
                          buttonWidth: 140,
                          initialValue: state.when(
                            initial: () => .followSystem,
                            loading: (mode) => mode,
                            loaded: (mode) => mode,
                          ),
                          itemLabelGetter: (item) => item == .light
                              ? t.lightMode
                              : item == .dark
                              ? t.darkMode
                              : t.followSystem,
                          onChanged: (value) => context
                              .read<ThemeCubit>()
                              .changeTheme(value ?? .followSystem),
                        ),
                      );
                    },
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  if (kDebugMode)
                    BlocBuilder<DebuggerCubit, DebuggerState>(
                      builder: (context, state) {
                        return AppListTile(
                          padding: .zero,
                          leadingIcon: Symbols.bug_report_rounded,
                          text: t.debuggerMode,
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
                                  ThemeHelper.getColor(context).white,
                                ),
                                inactiveTrackColor: ThemeHelper.getColor(
                                  context,
                                ).grey100,
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
                  // Divider(color: ThemeHelper.getColor(context).grey100),
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
                  //               ThemeHelper.getColor(context).white,
                  //             ),
                  //             inactiveTrackColor: ThemeHelper.getColor(
                  //               context,
                  //             ).grey100,
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
