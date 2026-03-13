import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:zupa/core/bloc/site/site_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_app_bar.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_radio_group.dart';
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
        builder: (siteContext) {
          return AutoTabsScaffold(
            routes: const [
              HomeRoute(),
              HistoryRoute(),
              RevenueRoute(),
              SettingsRoute(),
            ],
            appBarBuilder: (context, tabsRouter) => AppAppBar(
              isCenter: true,
              // Inside your AppBarBuilder
              titleWidget: InkWell(
                onTap: () => _showSitePicker(siteContext),
                borderRadius: .circular(100),
                child: Container(
                  width: screenWidth,
                  padding: const .symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: colors.primary50, // Using your existing palette
                    borderRadius: .circular(100),
                  ),
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Icon(
                        Symbols.location_on_rounded,
                        size: 18,
                        color: colors.primary500,
                      ),
                      BlocBuilder<SiteCubit, SiteState>(
                        builder: (context, state) {
                          DebuggerHelper.talker.log(state.toString());
                          return Text(
                            state.maybeWhen(
                              loaded: (data) => data ?? '',
                              orElse: () => _parkingLots[0],
                            ),
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: colors.primary500,
                            ),
                          );
                        },
                      ),
                      Icon(
                        Symbols.keyboard_arrow_down_rounded,
                        size: 20,
                        color: colors.primary500,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            bottomNavigationBuilder: (context, tabsRouter) {
              return ClipRRect(
                borderRadius: const .only(
                  topLeft: .circular(24),
                  topRight: .circular(24),
                ),
                child: NavigationBar(
                  selectedIndex: tabsRouter.activeIndex,
                  onDestinationSelected: tabsRouter.setActiveIndex,
                  // Customizing colors to match your theme
                  backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                  indicatorColor: colors.primary100.withAlpha(155),
                  maintainBottomViewPadding: true,
                  height: 96,
                  animationDuration: const Duration(milliseconds: 500),
                  labelBehavior: .onlyShowSelected,
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
                ),
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
      selectedIcon: Icon(icon, color: colors.primary500, fill: 1, weight: 700),
      label: t['navbar.$labelKey'] ?? labelKey,
    );
  }

  void _showSitePicker(BuildContext context) {
    final siteCubit = context.read<SiteCubit>();

    WoltModalSheet.show(
      context: context,
      pageListBuilder: (context) {
        return [
          WoltModalSheetPage(
            enableDrag: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            resizeToAvoidBottomInset: true,
            hasTopBarLayer: false,
            pageTitle: const SizedBox(height: 24),
            stickyActionBar: Padding(
              padding: const .only(bottom: 16, left: 24, right: 24),
              child: AppButton(
                height: 40,
                onPressed: () {
                  siteCubit.changeSite();
                  Navigator.of(context).pop();
                },
                text: t.common.actions.filter,
              ),
            ),
            child: Padding(
              padding: const .only(bottom: 80),
              child: AppRadioGroup<String>(
                formControl: siteCubit.form.codeControl,
                items: _parkingLots,
                isVertical: true,
                showRadio: false,
                itemBuilder:
                    (context, item, isSelected, onSelect, radioButton) =>
                        InkWell(
                          onTap: onSelect,
                          child: Container(
                            width: .infinity,
                            padding: const .symmetric(
                              vertical: 12,
                              horizontal: 32,
                            ),
                            child: Text(
                              item,
                              style: AppTextStyles.bodyMediumSemibold.copyWith(
                                color: isSelected
                                    ? ThemeHelper.getColor(context).primary400
                                    : ThemeHelper.getColor(context).grey800,
                              ),
                            ),
                          ),
                        ),
              ),
            ),
          ),
        ];
      },
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }
}
