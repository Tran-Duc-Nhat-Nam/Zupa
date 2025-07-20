import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/theme/theme_cubit.dart';
import '../../../common/styles/icons.dart';
import '../../../common/styles/theme.dart';
import '../../../helper/theme/theme_helper.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/app_drop_down_search.dart';
import '../../../widgets/app_list_tile.dart';
import '../../../widgets/app_screen.dart';
import '../../../widgets/state/app_state.dart';

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
                  Divider(
                    color: ThemeHelper.getColor(context).grey100,
                  ),
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
                        appDarkTheme.brightness
                      ],
                      extraDropdownItems: [
                        AppDropDownSearchExtraItem(
                          label: context.tr('followSystem'),
                        ),
                      ],
                      buttonWidth: 140,
                      initialValue: Theme.of(context).brightness,
                      itemLabelGetter: (item) => context.tr('${item?.name}Mode'),
                      onChanged: (value) =>
                          context.read<ThemeCubit>().changeBrightness(value),
                    ),
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
