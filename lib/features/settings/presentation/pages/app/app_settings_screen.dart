import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/bloc/auth/auth_cubit.dart';
import 'package:zupa/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/bloc/theme/theme_cubit.dart';
import 'package:zupa/common/styles/icons.dart';
import 'package:zupa/common/styles/theme.dart';
import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/widgets/app_card.dart';
import 'package:zupa/widgets/app_drop_down_search.dart';
import 'package:zupa/widgets/app_list_tile.dart';
import 'package:zupa/widgets/app_screen.dart';
import 'package:zupa/widgets/state/app_state.dart';

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
      title: context.tr('appSettings'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            AppCard(
              child: Column(
                spacing: 10,
                children: [
                  AppListTile(
                    padding: EdgeInsets.zero,
                    leadingIconPath: AppIcons.lampOn,
                    text: context.tr('language'),
                    trailing: AppDropDownSearch<Locale>(
                      name: 'appLocale',
                      buttonDecoration: const BoxDecoration(),
                      iconSize: 0,
                      dropdownItems: const [
                        Locale('en', 'US'),
                        Locale('vi', 'VN'),
                      ],
                      extraDropdownItems: [
                        AppDropDownSearchExtraItem(
                          label: context.tr('followSystem'),
                        ),
                      ],
                      buttonWidth: 140,
                      initialValue: context.locale,
                      itemLabelGetter: (item) =>
                          context.tr(item?.languageCode ?? ''),
                      onChanged: (value) => context.setLocale(
                        value is Locale
                            ? value
                            : Locale(
                                Intl.systemLocale.substring(0, 2),
                                Intl.systemLocale.substring(3, 5),
                              ),
                      ),
                    ),
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  AppListTile(
                    padding: EdgeInsets.zero,
                    leadingIconPath: AppIcons.global,
                    text: context.tr('language'),
                    trailing: AppDropDownSearch<Brightness>(
                      name: 'appLocale',
                      buttonDecoration: const BoxDecoration(),
                      iconSize: 0,
                      dropdownItems: [
                        appTheme.brightness,
                        appDarkTheme.brightness,
                      ],
                      extraDropdownItems: [
                        AppDropDownSearchExtraItem(
                          label: context.tr('followSystem'),
                        ),
                      ],
                      buttonWidth: 140,
                      initialValue: Theme.of(context).brightness,
                      itemLabelGetter: (item) =>
                          context.tr('${item?.name}Mode'),
                      onChanged: (value) =>
                          context.read<ThemeCubit>().changeBrightness(value),
                    ),
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  BlocBuilder<DebuggerCubit, DebuggerState>(
                    builder: (context, state) {
                      return AppListTile(
                        padding: EdgeInsets.zero,
                        leadingIconPath: AppIcons.notification,
                        text: context.tr('debuggerMode'),
                        trailing: SizedBox(
                          height: 20,
                          child: Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              padding: EdgeInsets.zero,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return const Icon(Icons.check);
                                  }
                                  return const Icon(Icons.close);
                                },
                              ),
                              thumbColor: WidgetStateProperty.all(
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
                        padding: EdgeInsets.zero,
                        leadingIconPath: AppIcons.notification,
                        text: context.tr('biometricAuth'),
                        trailing: SizedBox(
                          height: 20,
                          child: Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              padding: EdgeInsets.zero,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return const Icon(Icons.check);
                                  }
                                  return const Icon(Icons.close);
                                },
                              ),
                              thumbColor: WidgetStateProperty.all(
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

