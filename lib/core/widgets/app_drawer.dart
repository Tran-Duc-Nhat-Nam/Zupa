import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'dart:math' as math;

import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Drawer(
      child: ListView(
        padding: .zero,
        children: [
          DrawerHeader(
            padding: .zero,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colors.onPrimaryContainer, colors.primary],
                stops: const [0.0, 1.0],
                transform: const GradientRotation(math.pi / 4),
              ),
            ),
            child: Center(
              child: Text(
                t.home.drawer,
                style: AppTextStyles.heading2.copyWith(color: colors.surface),
              ),
            ),
          ),
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
                    loaded: (settings) => settings.themeMode == .light,
                    orElse: () => true,
                  )
                  ? Icon(Symbols.light_mode_rounded, color: colors.primary)
                  : Icon(Symbols.dark_mode_rounded, color: colors.primary),
            ),
            onTap: () {
              final themeCubit = context.read<ThemeCubit>();
              final currentSettings = themeCubit.state.maybeWhen(
                loaded: (s) => s,
                orElse: () => ThemeSettings(),
              );

              themeCubit.formModel.themeModeControl.value =
                  currentSettings.themeMode;
              themeCubit.changeTheme();
            },
          ),
          ListTile(
            onTap: () {
              context.pushRoute(const SettingsRoute());
            },
            leading: Icon(Symbols.settings_rounded, color: colors.primary),
            title: Text(
              t.settings.title,
              style: AppTextStyles.bodyLargeSemibold.copyWith(
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
