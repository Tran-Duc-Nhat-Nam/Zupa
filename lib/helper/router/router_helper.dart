import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';

import '../../common/constants/routes.dart';
import '../../helper/auth/auth_helper.dart';
import '../../screens/camera/check_in_screen.dart';
import '../../screens/history/history_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/settings/app/app_settings_screen.dart';
import '../../screens/settings/employee_management/employee_management_screen.dart';
import '../../screens/settings/general_config/general_config_screen.dart';
import '../../screens/settings/general_config/member_fee/member_fee_seting_screen.dart';
import '../../screens/settings/general_config/parking_price/parking_price_setting.dart';
import '../../screens/settings/member_vehicles/create/member_vehicle_detail_screen.dart';
import '../../screens/settings/member_vehicles/member_vehicles_screen.dart';
import '../../screens/settings/parking/detail/parking_details_screen.dart';
import '../../screens/settings/parking/parking_settings_screen.dart';
import '../../screens/settings/password/change_password_screen.dart';
import '../../screens/settings/settings_screen.dart';
import '../../screens/revenue/revenue_screen.dart';
import '../../widgets/app_nav_bar.dart';
import '../../widgets/popup/app_toast.dart';
import '../../widgets/transition/app_transitions.dart';
import '../sensor/nfc_helper.dart';

class RouterHelper {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final _shellKey = GlobalKey<NavigatorState>();
  static final drawerKey = GlobalKey<ScaffoldState>();

  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/login',
      routes: [
        GoRoute(
          name: AppRoutes.checkIn,
          path: '/check-in',
          pageBuilder: (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const CheckInScreen(),
          ),
        ),
        GoRoute(
          name: AppRoutes.login,
          path: '/login',
          pageBuilder: (context, state) =>
              rightToLeftJoinedTransition(context, state, LoginScreen()),
          redirect: (context, state) async {
            return (await AuthHelper.getAuth()) != null ? '/' : null;
          },
        ),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state, navigationShell) {
            if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
              NfcManager.instance.isAvailable().then(
                (value) => value
                    ? NfcManager.instance.startSession(
                        onDiscovered: (NfcTag tag) async {
                          final MifareClassicAndroid? data =
                              MifareClassicAndroid.from(tag);
                          if (data == null) {
                            AppToast.showErrorToast(context.tr('error'));
                          } else {
                            context.pushNamed('CheckIn', extra: false);
                          }
                        },
                        pollingOptions: {NfcPollingOption.iso14443},
                      )
                    : null,
              );
            }
            return rightToLeftJoinedTransition(
              context,
              state,
              AppNavBar(navigationShell: navigationShell),
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoutes.home,
                  path: '/',
                  pageBuilder: (context, state) {
                    NfcHelper.startListenToNfc(context);
                    return rightToLeftJoinedTransition(
                      context,
                      state,
                      const HomeScreen(),
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoutes.history,
                  path: '/history',
                  pageBuilder: (context, state) => rightToLeftJoinedTransition(
                    context,
                    state,
                    const HistoryScreen(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoutes.revenue,
                  path: '/revenue',
                  pageBuilder: (context, state) => rightToLeftJoinedTransition(
                    context,
                    state,
                    const RevenueScreen(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellKey,
              routes: [
                GoRoute(
                  name: AppRoutes.settings,
                  path: '/settings',
                  pageBuilder: (context, state) => rightToLeftJoinedTransition(
                    context,
                    state,
                    const SettingsScreen(),
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.parking,
          path: '/settings/parking',
          pageBuilder: (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const ParkingSettingsScreen(),
          ),
          routes: [
            GoRoute(
              name: AppRoutes.parkingDetail,
              path: 'detail',
              pageBuilder: (context, state) => rightToLeftJoinedTransition(
                context,
                state,
                const ParkingDetailsScreen(),
              ),
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.memberVehicles,
          path: '/settings/member-vehicles',
          pageBuilder: (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const MemberVehiclesScreen(),
          ),
          routes: [
            GoRoute(
              name: AppRoutes.memberVehiclesDetail,
              path: 'detail',
              pageBuilder: (context, state) => rightToLeftJoinedTransition(
                context,
                state,
                const MemberVehicleDetailScreen(),
              ),
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.employeeManagement,
          path: '/settings/employee-management',
          pageBuilder: (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const EmployeeManagementScreen(),
          ),
        ),
        GoRoute(
          name: AppRoutes.generalConfig,
          path: '/settings/general-config',
          pageBuilder: (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const GeneralConfigScreen(),
          ),
          routes: [
            GoRoute(
              name: AppRoutes.parkingPrice,
              path: 'detail',
              pageBuilder: (context, state) => rightToLeftJoinedTransition(
                context,
                state,
                const ParkingPriceSetting(),
              ),
            ),
            GoRoute(
              name: AppRoutes.memberFee,
              path: 'detail',
              pageBuilder: (context, state) => rightToLeftJoinedTransition(
                context,
                state,
                const MemberFeeSetingScreen(),
              ),
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.changePassword,
          path: '/settings/change-password',
          pageBuilder: (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const ChangePasswordScreen(),
          ),
        ),
        GoRoute(
          name: AppRoutes.appSettings,
          path: '/settings/change-app',
          pageBuilder: (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const AppSettingsScreen(),
          ),
        ),
      ],
    );
  }
}
