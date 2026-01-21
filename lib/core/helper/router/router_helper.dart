import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';

import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/biometric_service.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/features/camera/presentation/pages/camera/check_in_screen.dart';
import 'package:zupa/features/history/presentation/pages/history_screen.dart';
import 'package:zupa/features/home/presentation/pages/home_screen.dart';
import 'package:zupa/features/auth/presentation/pages/login/login_screen.dart';
import 'package:zupa/features/settings/presentation/pages/app/app_settings_screen.dart';
import 'package:zupa/features/settings/presentation/pages/employee_management/employee_management_screen.dart';
import 'package:zupa/features/settings/presentation/pages/general_config/general_config_screen.dart';
import 'package:zupa/features/settings/presentation/pages/general_config/member_fee/member_fee_seting_screen.dart';
import 'package:zupa/features/settings/presentation/pages/general_config/parking_price/parking_price_setting.dart';
import 'package:zupa/features/settings/presentation/pages/member_vehicles/create/member_vehicle_detail_screen.dart';
import 'package:zupa/features/settings/presentation/pages/member_vehicles/member_vehicles_screen.dart';
import 'package:zupa/features/settings/presentation/pages/parking/detail/parking_details_screen.dart';
import 'package:zupa/features/settings/presentation/pages/parking/parking_settings_screen.dart';
import 'package:zupa/features/settings/presentation/pages/password/change_password_screen.dart';
import 'package:zupa/features/settings/presentation/pages/settings_screen.dart';
import 'package:zupa/features/revenue/presentation/pages/revenue_screen.dart';
import 'package:zupa/core/widgets/app_nav_bar.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/transition/go_open_container.dart';
import 'package:zupa/core/helper/sensor/nfc_helper.dart';

class RouterHelper {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final _shellKey = GlobalKey<NavigatorState>();
  static final drawerKey = GlobalKey<ScaffoldState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: AppRoutes.checkIn,
        path: '/check-in',
        pageBuilder: (context, state) =>
            goOpenContainerCustomTransition(state, const CheckInScreen()),
      ),
      GoRoute(
        name: AppRoutes.login,
        path: '/login',
        pageBuilder: (context, state) =>
            goOpenContainerCustomTransition(state, LoginScreen()),
        redirect: (context, state) async {
          if ((await getIt<StorageService>().getAuth()) != null) {
            return '/';
          } else {
            return (await getIt<BiometricService>().isEnabled) == true
                ? '/'
                : null;
          }
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: navigatorKey,
        pageBuilder: (context, state, navigationShell) {
          if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
            NfcManager.instance.checkAvailability().then(
              (value) => value == NfcAvailability.enabled
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
                      pollingOptions: {.iso14443},
                    )
                  : null,
            );
          }
          return goOpenContainerCustomTransition(
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
                  return goOpenContainerCustomTransition(
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
                pageBuilder: (context, state) =>
                    goOpenContainerCustomTransition(
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
                pageBuilder: (context, state) =>
                    goOpenContainerCustomTransition(
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
                pageBuilder: (context, state) =>
                    goOpenContainerCustomTransition(
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
        pageBuilder: (context, state) => goOpenContainerCustomTransition(
          state,
          const ParkingSettingsScreen(),
        ),
        routes: [
          GoRoute(
            name: AppRoutes.parkingDetail,
            path: 'detail',
            pageBuilder: (context, state) => goOpenContainerCustomTransition(
              state,
              const ParkingDetailsScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.memberVehicles,
        path: '/settings/member-vehicles',
        pageBuilder: (context, state) => goOpenContainerCustomTransition(
          state,
          const MemberVehiclesScreen(),
        ),
        routes: [
          GoRoute(
            name: AppRoutes.memberVehiclesDetail,
            path: 'detail',
            pageBuilder: (context, state) => goOpenContainerCustomTransition(
              state,
              const MemberVehicleDetailScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.employeeManagement,
        path: '/settings/employee-management',
        pageBuilder: (context, state) => goOpenContainerCustomTransition(
          state,
          const EmployeeManagementScreen(),
        ),
      ),
      GoRoute(
        name: AppRoutes.generalConfig,
        path: '/settings/general-config',
        pageBuilder: (context, state) =>
            goOpenContainerCustomTransition(state, const GeneralConfigScreen()),
        routes: [
          GoRoute(
            name: AppRoutes.parkingPrice,
            path: 'detail',
            pageBuilder: (context, state) => goOpenContainerCustomTransition(
              state,
              const ParkingPriceSetting(),
            ),
          ),
          GoRoute(
            name: AppRoutes.memberFee,
            path: 'detail',
            pageBuilder: (context, state) => goOpenContainerCustomTransition(
              state,
              const MemberFeeSetingScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.changePassword,
        path: '/settings/change-password',
        pageBuilder: (context, state) => goOpenContainerCustomTransition(
          state,
          const ChangePasswordScreen(),
        ),
      ),
      GoRoute(
        name: AppRoutes.appSettings,
        path: '/settings/change-app',
        pageBuilder: (context, state) =>
            goOpenContainerCustomTransition(state, const AppSettingsScreen()),
      ),
    ],
  );
}
