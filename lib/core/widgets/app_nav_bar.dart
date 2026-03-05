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
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_app_bar.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

@RoutePage()
class AppNavBarScreen extends StatefulWidget {
  const AppNavBarScreen({super.key});

  @override
  State<AppNavBarScreen> createState() => _AppNavBarScreenState();
}

class _AppNavBarScreenState extends State<AppNavBarScreen> {
  late ShakeDetector detector;
  final List<String> _parkingLots = const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'];

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
    final colors = ThemeHelper.getColor(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider<SiteCubit>(
      create: (context) => getIt<SiteCubit>()..init(),
      child: Builder(
        builder: (context) {
          return AutoTabsScaffold(
            routes: const [
              HomeRoute(),
              HistoryRoute(),
              RevenueRoute(),
              SettingsRoute(),
            ],
            appBarBuilder: (context, tabsRouter) => AppAppBar(
              isCenter: true,
              titleWidget: AppDropDownSearch(
                formControl: context.read<SiteCubit>().form.codeControl,
                dropdownItems: _parkingLots,
                initialValue: _parkingLots.length > 1 ? _parkingLots[1] : null,
                dropdownWidth: screenWidth - 64,
                buttonDecoration: BoxDecoration(
                  color: colors.primary50,
                  borderRadius: .circular(50),
                  border: .all(color: colors.primary100),
                ),
                onChanged: (value) => DialogHelper.showAuthDialog(context),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            bottomNavigationBuilder: (context, tabsRouter) {
              return NavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                // Customizing colors to match your theme
                backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                indicatorColor: colors.primary100.withAlpha(155),
                maintainBottomViewPadding: true,
                height: 88,
                labelPadding: const .all(8),
                labelTextStyle: .all(
                  AppTextStyles.bodyMediumSemibold.copyWith(
                    color: colors.primary300,
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
    required dynamic colors,
  }) {
    return NavigationDestination(
      icon: Icon(icon, color: colors.primary300, fill: 0, weight: 400),
      selectedIcon: Icon(
        icon,
        color: colors.primary500,
        fill: 1, // Filled version for active state
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
