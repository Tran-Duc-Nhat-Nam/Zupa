import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // IMPORT THIS
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/constants/routes.dart';
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

  final List<String> _parkingLots = const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'];

  @override
  void initState() {
    super.initState();
    _initShakeDetector();
  }

  void _initShakeDetector() {
    _shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: (event) async {
        if (mounted &&
            await getIt<StorageService>().getDebuggerMode() &&
            kDebugMode) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TalkerScreen(talker: DebuggerHelper.talker),
            ),
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

  /// Navigation logic for go_router
  void _onTabChange(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation with GoRouter:
      // initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  /// Helper to generate GButtons
  GButton _buildGButton({
    required BuildContext context,
    required String titleKey,
    required String iconPath,
    required dynamic colors,
  }) {
    // Active State
    final activeIconWidget = AppIcon(
      path: iconPath,
      color: colors.primary500, // Color when selected
      size: _iconSize,
    );

    // Inactive State
    final inactiveIconWidget = AppIcon(
      path: iconPath,
      color: colors.primary300, // Color when not selected
      size: _iconSize,
    );

    return GButton(
      // GButton requires an IconData, but we use 'leading' for custom widgets.
      // Pass a dummy icon to satisfy the requirement, it won't be shown if leading is provided.
      icon: Icons.circle,
      leading: widget.navigationShell.currentIndex == _getIndexForPath(iconPath)
          ? activeIconWidget
          : inactiveIconWidget,
      text: t[titleKey],
      textStyle: AppTextStyles.bodySmallBold.copyWith(color: colors.primary500),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.getColor(context);

    // Path parsing for AppBar title
    final uri = GoRouterState.of(context).uri;
    final String currentRouteName = uri.pathSegments.isEmpty
        ? 'home'
        : uri.pathSegments.last;

    return Scaffold(
      // 1. App Bar remains the same
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
                DialogHelper.showAuthDialog(context);
              },
            ),
          ),
        ],
      ),

      // 2. Body is simply the navigationShell (this holds the page stack)
      body: widget.navigationShell,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,

      // 3. Google Nav Bar implementation
      bottomNavigationBar: Padding(
        padding: const .only(left: 8, right: 8, bottom: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: const .all(.circular(100)),
            boxShadow: [
              .new(blurRadius: 20, color: Colors.black.withOpacity(.1)),
            ],
          ),
          child: Padding(
            padding: const .symmetric(horizontal: 16.0, vertical: 12),
            child: GNav(
              selectedIndex: widget.navigationShell.currentIndex,
              onTabChange: _onTabChange,

              // Visual Config
              rippleColor: colors.primary100,
              hoverColor: colors.primary50,
              gap: 8, // Gap between icon and text
              activeColor: colors.primary500, // Text Color
              iconSize: _iconSize,
              padding: const .symmetric(horizontal: 20, vertical: 12),
              duration: const .new(milliseconds: 400),
              tabBackgroundColor: colors.primary50, // Pill background color
              color: colors.primary300, // Unselected icon color

              tabs: [
                _buildTabItem(context, .home, AppIcons.home, colors),
                _buildTabItem(context, .history, AppIcons.clock, colors),
                _buildTabItem(context, .revenue, AppIcons.chart, colors),
                _buildTabItem(context, .settings, AppIcons.setting, colors),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GButton _buildTabItem(
    BuildContext context,
    AppRoutes route,
    String iconPath,
    dynamic colors,
  ) {
    return GButton(
      icon: Icons.home, // Dummy, effectively hidden by 'leading'
      leading: AppIcon(
        path: iconPath,
        // Calculate color based on whether this tab is active
        color: _isTabActive(route) ? colors.primary500 : colors.primary300,
        size: _iconSize,
      ),
      text: t[route.name],
    );
  }

  /// Simple helper to check if specific tab is active to color the custom AppIcon
  bool _isTabActive(AppRoutes route) {
    // Map keys to indexes matching the order in tabs[]
    final int index = switch (route) {
      .home => 0,
      .history => 1,
      .revenue => 2,
      .settings => 3,
      _ => 0,
    };
    return widget.navigationShell.currentIndex == index;
  }

  /// Helper to get index if you used path matching previously
  int _getIndexForPath(String path) {
    // Logic to match path to index if needed
    return 0;
  }
}
