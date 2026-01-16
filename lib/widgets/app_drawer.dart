import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'dart:math' as math;

import 'package:zupa/core/common/bloc/theme/theme_cubit.dart';
import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/common/styles/text_styles.dart';
import 'package:zupa/common/styles/theme.dart';

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
                context.tr('drawer'),
                style: AppTextStyles.heading2.copyWith(
                  color: ThemeHelper.getColor(context).white,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(context.tr('changeLanguage')),
            leading: Text(
              context.locale.toString().toUpperCase(),
              style: AppTextStyles.heading3,
            ),
            onTap: () {
              context.setLocale(
                context.locale.toString() == 'en'
                    ? const Locale('vi')
                    : const Locale('en'),
              );
            },
          ),
          ListTile(
            title: Text(context.tr('changeTheme')),
            leading: AnimatedSwitcher(
              duration: const .new(milliseconds: 300),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
              child:
                  context.read<ThemeCubit>().state.theme.brightness ==
                      Brightness.light
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
            onTap: () {
              final themeCubit = context.read<ThemeCubit>();
              if (themeCubit.state.theme.brightness == Brightness.light) {
                themeCubit.changeTheme(appDarkTheme);
              } else {
                themeCubit.changeTheme(appTheme);
              }
            },
          ),
          ListTile(
            onTap: () {
              context.push('/settings');
            },
            leading: const Icon(Icons.settings),
            title: Text(
              context.tr('settings'),
              style: const .new(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
