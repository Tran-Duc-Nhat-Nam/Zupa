import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/widgets/app_app_bar.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class AppNavBarScreen extends StatefulWidget {
  const AppNavBarScreen({super.key});

  @override
  State<AppNavBarScreen> createState() => _AppNavBarScreenState();
}

class _AppNavBarScreenState extends State<AppNavBarScreen> {
  final double _iconSize = 24;
  late ShakeDetector detector;
  final List<String> _parkingLots = const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'];

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

    // AutoTabsScaffold manages the indexed stack and state preservation for you.
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        HistoryRoute(),
        RevenueRoute(),
        SettingsRoute(),
      ],
      // 1. App Bar Integration
      appBarBuilder: (context, tabsRouter) => AppAppBar(
        isCenter: true,
        titleWidget: AppDropDownSearch(
          name: 'parkingLot',
          dropdownItems: _parkingLots,
          initialValue: _parkingLots.length > 1 ? _parkingLots[1] : null,
          buttonWidth: 140,
          buttonDecoration: BoxDecoration(
            color: colors.primary50,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: colors.primary100),
          ),
          onChanged: (value) => DialogHelper.showAuthDialog(context),
        ),
      ),

      // 2. Body is automatically handled by AutoTabsScaffold
      backgroundColor: Theme.of(context).colorScheme.surface,

      // 3. Google Nav Bar Integration
      bottomNavigationBuilder: (context, tabsRouter) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
              ],
            ),
            child: GNav(
              selectedIndex: tabsRouter.activeIndex,
              onTabChange: tabsRouter.setActiveIndex, // Built-in handler

              rippleColor: colors.primary100,
              hoverColor: colors.primary50,
              gap: 8,
              activeColor: colors.primary500,
              iconSize: _iconSize,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: colors.primary100.withAlpha(155),
              color: colors.primary300,

              tabs: [
                _buildItem(
                  0,
                  tabsRouter.activeIndex,
                  'home',
                  Symbols.home_rounded,
                  colors,
                  isHide,
                ),
                _buildItem(
                  1,
                  tabsRouter.activeIndex,
                  'history',
                  Symbols.history_rounded,
                  colors,
                  isHide,
                ),
                _buildItem(
                  2,
                  tabsRouter.activeIndex,
                  'revenue',
                  Symbols.analytics_rounded,
                  colors,
                  isHide,
                ),
                _buildItem(
                  3,
                  tabsRouter.activeIndex,
                  'settings',
                  Symbols.settings_rounded,
                  colors,
                  isHide,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  GButton _buildItem(
    int index,
    int activeIndex,
    String labelKey,
    IconData icon,
    dynamic colors,
    bool isHide,
  ) {
    final isActive = index == activeIndex;
    return GButton(
      icon: Icons.home, // Dummy
      leading: Icon(
        icon,
        color: isActive ? colors.primary500 : colors.primary300,
        fill: isActive ? 1 : 0,
        size: _iconSize,
        fontWeight: .bold,
        opticalSize: 48,
      ),
      text: isHide ? '' : t[labelKey],
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }
}
