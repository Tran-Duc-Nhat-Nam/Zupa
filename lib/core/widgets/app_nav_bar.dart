import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shake/shake.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/di/injection.dart';

import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_app_bar.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/gen/strings.g.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  late final ShakeDetector _shakeDetector;
  final double _iconSize = 24;

  // Cache dropdown items if they are static, or move to a provider if dynamic
  final List<String> _parkingLots = const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'];

  @override
  void initState() {
    super.initState();
    _initShakeDetector();
  }

  void _initShakeDetector() {
    _shakeDetector = .autoStart(
      onPhoneShake: (event) async {
        if (mounted && await getIt<StorageService>().getDebuggerMode() && kDebugMode) {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TalkerScreen(talker: DebuggerHelper.talker),
              )
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _shakeDetector.stopListening();
    super.dispose();
  }

  /// Helper to generate tabs and avoid code repetition
  PersistentRouterTabConfig _buildTab({
    required BuildContext context,
    required String titleKey,
    required String iconPath,
    required dynamic
    colors, // Replace 'dynamic' with your specific AppColors type if available
    Widget? customIconWrapper,
  }) {
    final iconWidget = AppIcon(path: iconPath, color: colors.primary50);
    final inactiveIconWidget = AppIcon(
      path: iconPath,
      color: colors.primary300,
    );

    return PersistentRouterTabConfig(
      item: .new(
        iconSize: _iconSize,
        title: t[titleKey],
        activeColorSecondary: colors.primary500,
        activeForegroundColor: colors.primary50,
        textStyle: AppTextStyles.bodySmallBold.copyWith(
          color: colors.primary50,
        ),
        icon: customIconWrapper ?? iconWidget,
        inactiveIcon: inactiveIconWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Optimize Theme Lookup: Call once per build
    final colors = ThemeHelper.getColor(context);

    // 2. Safer Path Parsing: Use pathSegments instead of manual split
    final uri = GoRouterState.of(context).uri;
    final String currentRouteName = uri.pathSegments.isEmpty
        ? 'home'
        : uri.pathSegments.last;

    return Scaffold(
      appBar: AppAppBar(
        text: t[currentRouteName],
        trailing: [
          Padding(
            padding: const .only(right: 24),
            child: AppDropDownSearch(
              name: 'parkingLot',
              dropdownItems: _parkingLots,
              initialValue: _parkingLots.length > 1 ? _parkingLots[1] : null,
              buttonWidth: 140,
              buttonDecoration: BoxDecoration(
                color: colors.primary50,
                borderRadius: .circular(50),
                border: .all(color: colors.primary100),
              ),
              onChanged: (value) {
                // AppToast.showBasicToast(value ?? 'Hehe');
                DialogHelper.showAuthDialog(context);
              },
            ),
          ),
        ],
      ),
      body: PersistentTabView.router(
        resizeToAvoidBottomInset: false,
        navBarOverlap: const .full(),
        backgroundColor: Colors.transparent,
        navigationShell: widget.navigationShell,
        tabs: [
          _buildTab(
            context: context,
            titleKey: 'home',
            iconPath: AppIcons.home,
            colors: colors,
          ),
          _buildTab(
            context: context,
            titleKey: 'history',
            iconPath: AppIcons.clock,
            colors: colors,
          ),
          _buildTab(
            context: context,
            titleKey: 'revenue',
            iconPath: AppIcons.chart,
            colors: colors,
          ),
          _buildTab(
            context: context,
            titleKey: 'settings',
            iconPath: AppIcons.setting,
            colors: colors,
          ),
        ],
        navBarBuilder: (navBarConfig) => Style2BottomNavBar(
          navBarConfig: navBarConfig,
          height: 75,
          navBarDecoration: .new(
            color: colors.white,
            padding: const .symmetric(vertical: 12),
            borderRadius: const .vertical(
              top: .circular(16),
              bottom: .circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
