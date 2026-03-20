import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/bloc/site/site_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
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
      child: AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          HistoryRoute(),
          RevenueRoute(),
          SettingsRoute(),
        ],
        backgroundColor: colors.surface,
        bottomNavigationBuilder: (context, tabsRouter) {
          return NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            backgroundColor: colors.surfaceContainerLowest,
            indicatorColor: colors.secondaryContainer,
            maintainBottomViewPadding: true,
            height: 96,
            animationDuration: const Duration(milliseconds: 500),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            labelPadding: const EdgeInsets.all(8),
            labelTextStyle: WidgetStateProperty.all(
              AppTextStyles.bodyMediumSemibold.copyWith(
                color: colors.onSecondaryContainer,
              ),
            ),
            destinations: [
              _buildDestination(
                index: 0,
                activeIndex: tabsRouter.activeIndex,
                labelKey: 'home',
                icon: Symbols.home_rounded,
                colors: colors,
              ),
              _buildDestination(
                index: 1,
                activeIndex: tabsRouter.activeIndex,
                labelKey: 'history',
                icon: Symbols.history_rounded,
                colors: colors,
              ),
              _buildDestination(
                index: 2,
                activeIndex: tabsRouter.activeIndex,
                labelKey: 'revenue',
                icon: Symbols.analytics_rounded,
                colors: colors,
              ),
              _buildDestination(
                index: 3,
                activeIndex: tabsRouter.activeIndex,
                labelKey: 'settings',
                icon: Symbols.settings_rounded,
                colors: colors,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDestination({
    required int index,
    required int activeIndex,
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

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }
}
