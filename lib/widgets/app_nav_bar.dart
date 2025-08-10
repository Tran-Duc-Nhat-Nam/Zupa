import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../helper/theme/theme_helper.dart';
import '../common/styles/icons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../common/styles/text_styles.dart';
import '../screens/history/history_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/revenue/revenue_screen.dart';
import '../screens/settings/settings_screen.dart';
import 'app_icon.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      resizeToAvoidBottomInset: false,
      gestureNavigationEnabled: true,
      tabs: [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            iconSize: 24,
            icon: AppIcon(
              path: AppIcons.home,
              color: ThemeHelper.getColor(context).white,
            ),
            activeColorSecondary: ThemeHelper.getColor(context).primary500,
            title: context.tr('home'),
            textStyle: AppTextStyles.bodySmallBold.copyWith(
              color: ThemeHelper.getColor(context).white,
            ),
            activeForegroundColor: ThemeHelper.getColor(context).white,
            inactiveIcon: AppIcon(
              path: AppIcons.home,
              color: ThemeHelper.getColor(context).primary300,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const HistoryScreen(),
          item: ItemConfig(
            iconSize: 24,
            icon: AppIcon(
              path: AppIcons.clock,
              color: ThemeHelper.getColor(context).white,
            ),
            activeColorSecondary: ThemeHelper.getColor(context).primary500,
            title: context.tr('history'),
            textStyle: AppTextStyles.bodySmallBold.copyWith(
              color: ThemeHelper.getColor(context).white,
            ),
            activeForegroundColor: ThemeHelper.getColor(context).white,
            inactiveIcon: AppIcon(
              path: AppIcons.clock,
              color: ThemeHelper.getColor(context).primary300,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const RevenueScreen(),
          item: ItemConfig(
            iconSize: 24,
            icon: AppIcon(
              path: AppIcons.chart,
              color: ThemeHelper.getColor(context).white,
            ),
            activeColorSecondary: ThemeHelper.getColor(context).primary500,
            title: context.tr('revenue'),
            textStyle: AppTextStyles.bodySmallBold.copyWith(
              color: ThemeHelper.getColor(context).white,
            ),
            activeForegroundColor: ThemeHelper.getColor(context).white,
            inactiveIcon: AppIcon(
              path: AppIcons.chart,
              color: ThemeHelper.getColor(context).primary300,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const SettingsScreen(),
          item: ItemConfig(
            iconSize: 24,
            icon: AppIcon(
              path: AppIcons.setting,
              color: ThemeHelper.getColor(context).white,
            ),
            activeColorSecondary: ThemeHelper.getColor(context).primary500,
            title: context.tr('settings'),
            textStyle: AppTextStyles.bodySmallBold.copyWith(
              color: ThemeHelper.getColor(context).white,
            ),
            activeForegroundColor: ThemeHelper.getColor(context).white,
            inactiveIcon: AppIcon(
              path: AppIcons.setting,
              color: ThemeHelper.getColor(context).primary300,
            ),
          ),
        ),
      ],
      navBarOverlap: const NavBarOverlap.full(),
      backgroundColor: Colors.transparent,
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        navBarConfig: navBarConfig,
        itemPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        height: 75,
        navBarDecoration: NavBarDecoration(
          color: ThemeHelper.getColor(context).white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
            bottom: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: ThemeHelper.getColor(context).primary50, // Color with alpha
              offset: const Offset(0, -8), // Horizontal and vertical offsets
              blurRadius: 28, // Blur radius
            ),
          ],
        ),
      ),
      // onTabChanged: (value) => AppDialog.checkAuth(context),
    );
  }
}
