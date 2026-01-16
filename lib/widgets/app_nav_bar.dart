import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logarte/logarte.dart';
import 'package:shake/shake.dart';
import 'package:zupa/helper/debugger/debugger_helper.dart';
import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/common/styles/icons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:zupa/common/styles/text_styles.dart';
import 'package:zupa/widgets/app_app_bar.dart';
import 'package:zupa/widgets/app_drop_down_search.dart';
import 'package:zupa/widgets/app_icon.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  late final ShakeDetector detector;
  final double iconSize = 24;

  @override
  void initState() {
    detector = .autoStart(
      onPhoneShake: (ShakeEvent event) async {
        if (await DebuggerHelper.getDebuggerMode() && mounted) {
          DebuggerHelper.debugger.attach(context: context, visible: true);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final path = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.path.split('/');
    return Scaffold(
      appBar: AppAppBar(
        text: (path.last == '' || path.length == 1 ? 'home' : path.last).tr(),
        trailing: [
          Padding(
            padding: const .only(right: 24),
            child: AppDropDownSearch(
              name: 'parkingLot',
              dropdownItems: const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'],
              initialValue: 'Bãi xe 2',
              buttonWidth: 140,
              buttonDecoration: .new(
                color: ThemeHelper.getColor(context).primary50,
                borderRadius: .circular(50),
                border: .all(color: ThemeHelper.getColor(context).primary100),
              ),
            ),
          ),
        ],
      ),
      body: PersistentTabView.router(
        resizeToAvoidBottomInset: false,
        tabs: [
          PersistentRouterTabConfig(
            item: ItemConfig(
              iconSize: iconSize,
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
          PersistentRouterTabConfig(
            item: ItemConfig(
              iconSize: iconSize,
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
          PersistentRouterTabConfig(
            item: ItemConfig(
              iconSize: iconSize,
              icon: LogarteMagicalTap(
                logarte: DebuggerHelper.debugger,
                child: AppIcon(
                  path: AppIcons.chart,
                  color: ThemeHelper.getColor(context).white,
                ),
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
          PersistentRouterTabConfig(
            item: ItemConfig(
              iconSize: iconSize,
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
        navBarOverlap: const .full(),
        backgroundColor: Colors.transparent,
        navBarBuilder: (navBarConfig) => Style2BottomNavBar(
          navBarConfig: navBarConfig,
          height: 75,
          navBarDecoration: .new(
            color: ThemeHelper.getColor(context).white,
            padding: const .symmetric(vertical: 12),
            borderRadius: const .vertical(
              top: .circular(16),
              bottom: .circular(16),
            ),
          ),
        ),
        navigationShell: widget.navigationShell,
        // onTabChanged: (value) => AppDialog.checkAuth(context),
      ),
    );
  }
}
