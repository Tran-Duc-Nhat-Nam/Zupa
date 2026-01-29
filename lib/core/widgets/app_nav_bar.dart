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
  final double _iconSize = 24;
  late ShakeDetector detector;

  final List<String> _parkingLots = const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'];

  void _onTabChange(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation with GoRouter:
      // initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  void initState() {
    detector = .autoStart(
      onPhoneShake: (ShakeEvent event) async {
        if (await getIt<StorageService>().getDebuggerMode() &&
            mounted &&
            kDebugMode) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TalkerScreen(talker: DebuggerHelper.talker),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.getColor(context);
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isHide = screenWidth < 400;

    return Scaffold(
      // 1. App Bar remains the same
      appBar: AppAppBar(
        isCenter: true,
        titleWidget: AppDropDownSearch(
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

      // 2. Body is simply the navigationShell (this holds the page stack)
      body: widget.navigationShell,
      backgroundColor: Theme.of(context).colorScheme.surface,

      // 3. Google Nav Bar implementation
      bottomNavigationBar: Padding(
        padding: const .only(left: 8, right: 8, bottom: 8),
        child: Container(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: const .all(.circular(100)),
            boxShadow: [
              .new(blurRadius: 20, color: Colors.black.withOpacity(.1)),
            ],
          ),
          child: GNav(
            selectedIndex: widget.navigationShell.currentIndex,
            onTabChange: _onTabChange,

            // Visual Config
            rippleColor: colors.primary100,
            hoverColor: colors.primary50,
            gap: 8, // Gap between icon and text
            activeColor: colors.primary500, // Text Color
            iconSize: _iconSize,
            padding: const .symmetric(horizontal: 16, vertical: 12),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            duration: const .new(milliseconds: 400),
            tabBackgroundColor: colors.primary100.withAlpha(155), // Pill background color
            color: colors.primary300, // Unselected icon color

            tabs: [
              _buildItem(.home, AppIcons.home, colors, isHide: isHide),
              _buildItem(.history, AppIcons.clock, colors, isHide: isHide),
              _buildItem(.revenue, AppIcons.chart, colors, isHide: isHide),
              _buildItem(.settings, AppIcons.setting, colors, isHide: isHide),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  GButton _buildItem(
    AppRoutes route,
    String iconPath,
    dynamic colors, {
    bool isHide = false,
  }) {
    return GButton(
      icon: Icons.home, // Dummy, effectively hidden by 'leading'
      leading: AppIcon(
        path: iconPath,
        // Calculate color based on whether this tab is active
        color: _isTabActive(route) ? colors.primary500 : colors.primary300,
        size: _iconSize,
      ),
      text: isHide ? '' : t[route.name],
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
}
