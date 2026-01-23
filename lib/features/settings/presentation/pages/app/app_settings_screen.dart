import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/gen/strings.g.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  AppState<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends AppState<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      formKey: formKey,
      title: Translations.of(context).appSettings,
      child: Padding(
        padding: const .symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            AppCard(
              child: Column(
                spacing: 10,
                children: [
                  BlocListener<LocalizationCubit, LocalizationState>(
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
                    child: BlocBuilder<LocalizationCubit, LocalizationState>(
                      builder: (context, state) {
                        return AppListTile(
                          padding: .zero,
                          leadingIconPath: AppIcons.global,
                          text: Translations.of(context).language,
                          trailing: AppDropDownSearch<AppLocalization>(
                            name: 'appLocale',
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
                                ? Translations.of(
                                    context,
                                  )[item.getLocaleString() ?? 'followSystem']
                                : Translations.of(context).followSystem,
                            onChanged: (value) => context
                                .read<LocalizationCubit>()
                                .changeLocale(value ?? .followSystem),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return AppListTile(
                        padding: .zero,
                        leadingIconPath: AppIcons.lampOn,
                        text: Translations.of(context).language,
                        trailing: AppDropDownSearch<AppThemeMode>(
                          name: 'appLocale',
                          buttonDecoration: const .new(),
                          iconSize: 0,
                          dropdownItems: const [.light, .dark, .followSystem],
                          buttonWidth: 140,
                          initialValue: state.when(initial: (mode) => mode),
                          itemLabelGetter: (item) => item == .light
                              ? Translations.of(context).lightMode
                              : item == .dark
                              ? Translations.of(context).darkMode
                              : Translations.of(context).followSystem,
                          onChanged: (value) => context
                              .read<ThemeCubit>()
                              .changeTheme(value ?? .followSystem),
                        ),
                      );
                    },
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  BlocBuilder<DebuggerCubit, DebuggerState>(
                    builder: (context, state) {
                      return AppListTile(
                        padding: .zero,
                        leadingIconPath: AppIcons.notification,
                        text: Translations.of(context).debuggerMode,
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
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return AppListTile(
                        padding: .zero,
                        leadingIconPath: AppIcons.notification,
                        text: Translations.of(context).biometricAuth,
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
                                  .read<AuthCubit>()
                                  .toggleBiometricMode(value),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
