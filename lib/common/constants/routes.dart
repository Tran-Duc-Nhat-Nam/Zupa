import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';
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

final navigatorKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();
final drawerKey = GlobalKey<ScaffoldState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'CheckIn',
      path: '/check-in',
      pageBuilder:
          (context, state) =>
              rightToLeftJoinedTransition(context, state, const CheckInScreen()),
    ),
    GoRoute(
      name: 'Login',
      path: '/login',
      pageBuilder:
          (context, state) => rightToLeftJoinedTransition(context, state, LoginScreen()),
      redirect: (context, state) async {
        return (await AuthHelper.getAuth()) != null ? '/' : null;
      },
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: navigatorKey,
      pageBuilder:
          (context, state, navigationShell) => rightToLeftJoinedTransition(
            context,
            state,
            AppNavBar(navigationShell: navigationShell),
          ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'Home',
              path: '/',
              pageBuilder: (context, state) {
                if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
                  NfcManager.instance.isAvailable().then(
                        (value) =>
                    value
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
                return rightToLeftJoinedTransition(context, state, const HomeScreen());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'History',
              path: '/history',
              pageBuilder:
                  (context, state) =>
                      rightToLeftJoinedTransition(context, state, const HistoryScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'Revenue',
              path: '/revenue',
              pageBuilder:
                  (context, state) =>
                      rightToLeftJoinedTransition(context, state, const RevenueScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellKey,
          routes: [
            GoRoute(
              name: 'Settings',
              path: '/settings',
              pageBuilder:
                  (context, state) =>
                      rightToLeftJoinedTransition(context, state, const SettingsScreen()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'Parking',
      path: '/settings/parking',
      pageBuilder:
          (context, state) =>
              rightToLeftJoinedTransition(context, state, const ParkingSettingsScreen()),
      routes: [
        GoRoute(
          name: 'ParkingDetail',
          path: 'detail',
          pageBuilder:
              (context, state) => rightToLeftJoinedTransition(
                context,
                state,
                const ParkingDetailsScreen(),
              ),
        ),
      ],
    ),
    GoRoute(
      name: 'MemberVehicles',
      path: '/settings/member-vehicles',
      pageBuilder:
          (context, state) => rightToLeftJoinedTransition(context, state, const MemberVehiclesScreen()),
      routes: [
        GoRoute(
          name: 'MemberVehiclesDetail',
          path: 'detail',
          pageBuilder:
              (context, state) => rightToLeftJoinedTransition(
                context,
                state,
                const MemberVehicleDetailScreen(),
              ),
        ),
      ],
    ),
    GoRoute(
      name: 'EmployeeManagement',
      path: '/settings/employee-management',
      pageBuilder:
          (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const EmployeeManagementScreen(),
          ),
    ),
    GoRoute(
      name: 'GeneralConfig',
      path: '/settings/general-config',
      pageBuilder:
          (context, state) =>
              rightToLeftJoinedTransition(context, state, const GeneralConfigScreen()),
      routes: [
        GoRoute(
          name: 'ParkingPrice',
          path: 'detail',
          pageBuilder:
              (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const ParkingPriceSetting(),
          ),
        ),
        GoRoute(
          name: 'MemberFee',
          path: 'detail',
          pageBuilder:
              (context, state) => rightToLeftJoinedTransition(
            context,
            state,
            const MemberFeeSetingScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      name: 'ChangePassword',
      path: '/settings/change-password',
      pageBuilder:
          (context, state) =>
              rightToLeftJoinedTransition(context, state, const ChangePasswordScreen()),
    ),
    GoRoute(
      name: 'AppSettings',
      path: '/settings/change-app',
      pageBuilder:
          (context, state) =>
              rightToLeftJoinedTransition(context, state, const AppSettingsScreen()),
    ),
  ],
);
