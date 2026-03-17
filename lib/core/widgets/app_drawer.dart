import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math' as math;

import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: .zero,
        children: [
          DrawerHeader(
            padding: .zero,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimaryContainer,
                  Theme.of(context).colorScheme.primary,
                ],
                stops: const [0.0, 1.0],
                transform: const GradientRotation(math.pi / 4),
              ),
            ),
            child: Center(
              child: Text(
                t.home.drawer,
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.of(context).surface,
                ),
              ),
            ),
          ),
          // ListTile(
          //   title: Text(t.changeLanguage),
          //   leading: Text(
          //     t[LocaleSettings.currentLocale.languageCode],
          //     style: AppTextStyles.heading3,
          //   ),
          //   onTap: () {
          //     LocaleSettings.setLocale(
          //       context.locale.toString() == 'en'
          //           ? const .new('vi')
          //           : const .new('en'),
          //     );
          //   },
          // ),
          ListTile(
            title: Text(t.settings.changeTheme),
            leading: AnimatedSwitcher(
              duration: const .new(milliseconds: 300),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
              child:
                  context.watch<ThemeCubit>().state.maybeWhen(
                    loaded: (settings) =>
                        settings.themeMode == AppThemeMode.light,
                    orElse: () => true,
                  )
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
            onTap: () {
              final themeCubit = context.read<ThemeCubit>();
              final currentSettings = themeCubit.state.maybeWhen(
                loaded: (s) => s,
                orElse: () => ThemeSettings(),
              );

              final newMode = currentSettings.themeMode == AppThemeMode.light
                  ? AppThemeMode.dark
                  : AppThemeMode.light;

              themeCubit.formModel.themeModeControl.value = newMode;
              themeCubit.changeTheme();
            },
          ),
          ListTile(
            onTap: () {
              context.pushRoute(const SettingsRoute());
            },
            leading: const Icon(Icons.settings),
            title: Text(
              t.settings.title,
              style: const .new(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
