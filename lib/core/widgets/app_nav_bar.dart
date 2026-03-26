import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/bloc/site/site_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/responsive/responsive_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/state/app_state.dart';

@RoutePage()
class AppNavBarScreen extends StatefulWidget {
  const AppNavBarScreen({super.key});

  @override
  AppState<AppNavBarScreen> createState() => _AppNavBarScreenState();
}

class _AppNavBarScreenState extends AppState<AppNavBarScreen> {
  late ShakeDetector detector;

  @override
  void initState() {
    detector = ShakeDetector.autoStart(
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
    final colors = AppColors.of(context);

    return BlocProvider<SiteCubit>(
      create: (context) => getIt<SiteCubit>()..init(),
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          HistoryRoute(),
          RevenueRoute(),
          SettingsRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: AppAnimation(child: child),
        ),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          if (ResponsiveHelper.isMobile(context)) {
            return Scaffold(
              backgroundColor: colors.surface,
              body: child,
              bottomNavigationBar: NavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                backgroundColor: colors.surfaceContainerLowest,
                indicatorColor: colors.secondaryContainer,
                maintainBottomViewPadding: true,
                height: 80,
                animationDuration: const Duration(milliseconds: 500),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                destinations: [
                  _buildBottomDestination(
                    labelKey: 'home',
                    icon: Symbols.home_rounded,
                    colors: colors,
                  ),
                  _buildBottomDestination(
                    labelKey: 'history',
                    icon: Symbols.history_rounded,
                    colors: colors,
                  ),
                  _buildBottomDestination(
                    labelKey: 'revenue',
                    icon: Symbols.analytics_rounded,
                    colors: colors,
                  ),
                  _buildBottomDestination(
                    labelKey: 'settings',
                    icon: Symbols.settings_rounded,
                    colors: colors,
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: colors.surface,
              body: Row(
                children: [
                  NavigationRail(
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: tabsRouter.setActiveIndex,
                    backgroundColor: colors.surfaceContainerLowest,
                    indicatorColor: colors.secondaryContainer,
                    labelType: NavigationRailLabelType.all,
                    destinations: [
                      _buildRailDestination(
                        labelKey: 'home',
                        icon: Symbols.home_rounded,
                        colors: colors,
                      ),
                      _buildRailDestination(
                        labelKey: 'history',
                        icon: Symbols.history_rounded,
                        colors: colors,
                      ),
                      _buildRailDestination(
                        labelKey: 'revenue',
                        icon: Symbols.analytics_rounded,
                        colors: colors,
                      ),
                      _buildRailDestination(
                        labelKey: 'settings',
                        icon: Symbols.settings_rounded,
                        colors: colors,
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(child: child),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  NavigationDestination _buildBottomDestination({
    required String labelKey,
    required IconData icon,
    required AppColors colors,
  }) {
    return NavigationDestination(
      icon: Icon(icon, color: colors.onSurfaceVariant, fill: 0, weight: 400),
      selectedIcon: Icon(
        icon,
        color: colors.onSecondaryContainer,
        fill: 1,
        weight: 700,
      ),
      label: t['navbar.$labelKey'] ?? labelKey,
    );
  }

  NavigationRailDestination _buildRailDestination({
    required String labelKey,
    required IconData icon,
    required AppColors colors,
  }) {
    return NavigationRailDestination(
      icon: Icon(icon, color: colors.onSurfaceVariant, fill: 0, weight: 400),
      selectedIcon: Icon(
        icon,
        color: colors.onSecondaryContainer,
        fill: 1,
        weight: 700,
      ),
      label: Text(t['navbar.$labelKey'] ?? labelKey),
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }
}
