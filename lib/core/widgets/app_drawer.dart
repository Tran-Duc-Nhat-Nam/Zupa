
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'dart:math' as math;

import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/gen/strings.g.dart';

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
                Translations.of(context).drawer,
                style: AppTextStyles.heading2.copyWith(
                  color: ThemeHelper.getColor(context).white,
                ),
              ),
            ),
          ),
          // ListTile(
          //   title: Text(Translations.of(context).changeLanguage),
          //   leading: Text(
          //     Translations.of(context)[LocaleSettings.currentLocale.languageCode],
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
            title: Text(Translations.of(context).changeTheme),
            leading: AnimatedSwitcher(
              duration: const .new(milliseconds: 300),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
              child:
                  context.read<ThemeCubit>().state.when(
                    initial: (mode) => mode == .light,
                  )
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
            onTap: () {
              final themeCubit = context.read<ThemeCubit>();
              if (themeCubit.state.when(initial: (mode) => mode == .light)) {
                themeCubit.changeTheme(.dark);
              } else {
                themeCubit.changeTheme(.light);
              }
            },
          ),
          ListTile(
            onTap: () {
              context.pushNamed(AppRoutes.settings.name);
            },
            leading: const Icon(Icons.settings),
            title: Text(
              Translations.of(context).settings,
              style: const .new(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
