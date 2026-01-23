import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/services/biometric_service.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/widgets/app_nav_bar.dart';
import 'package:zupa/core/widgets/transition/go_open_container.dart';
import 'package:zupa/features/auth/presentation/pages/login/login_screen.dart';
import 'package:zupa/features/camera/presentation/pages/camera/check_in_screen.dart';
import 'package:zupa/features/history/presentation/pages/history_screen.dart';
import 'package:zupa/features/home/presentation/pages/home_screen.dart';
import 'package:zupa/features/revenue/presentation/pages/revenue_screen.dart';
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

// Removed inline NFC logic from Router.
// Use a service or put this in main.dart/App wrapper.
import 'package:zupa/core/helper/sensor/nfc_helper.dart';

class RouterHelper {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final _shellKey = GlobalKey<NavigatorState>();

  // Storage services (Cached for access in redirects)
  static final _storageService = getIt<StorageService>();
  static final _biometricService = getIt<BiometricService>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/login',
    observers: [TalkerRouteObserver(DebuggerHelper.talker)],
    redirect: (context, state) async {
      final isAuthenticated = (await _storageService.getAuth()) != null;
      if (!isAuthenticated && state.matchedLocation != '/login') {
        return '/login';
      }
      return null;
    },
    routes: [
      /* ----------------- STANDALONE ROUTES ----------------- */
      GoRoute(
        name: AppRoutes.login.name,
        path: '/login',
        pageBuilder: (context, state) => _buildPage(state, LoginScreen()),
        redirect: (context, state) async {
          // Check Token
          if ((await _storageService.getAuth()) != null) {
            return '/';
          }
          // Check Biometric Auto-login
          if ((await _biometricService.isEnabled) == true) {
            return '/';
          }
          return null;
        },
      ),
      GoRoute(
        name: AppRoutes.checkIn.name,
        path: '/check-in',
        pageBuilder: (context, state) =>
            _buildPage(state, const CheckInScreen()),
      ),

      /* ----------------- SHELL (BOTTOM NAV) ROUTES ----------------- */
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: navigatorKey,
        pageBuilder: (context, state, navigationShell) {
          // Optimization: Removed NFC session start from here.
          // Trigger this logic in main.dart or a global Provider/Bloc.

          return _buildPage(state, AppNavBar(navigationShell: navigationShell));
        },
        branches: [
          // Branch: Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.home.name,
                path: '/',
                pageBuilder: (context, state) {
                  // Ensure this helper doesn't re-add listeners on every rebuild
                  NfcHelper.startListenToNfc(context);
                  return _buildPage(state, const HomeScreen());
                },
              ),
            ],
          ),
          // Branch: History
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.history.name,
                path: '/history',
                pageBuilder: (context, state) =>
                    _buildPage(state, const HistoryScreen()),
              ),
            ],
          ),
          // Branch: Revenue
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.revenue.name,
                path: '/revenue',
                pageBuilder: (context, state) =>
                    _buildPage(state, const RevenueScreen()),
              ),
            ],
          ),
          // Branch: Settings
          StatefulShellBranch(
            navigatorKey: _shellKey,
            routes: [
              GoRoute(
                name: AppRoutes.settings.name,
                path: '/settings',
                pageBuilder: (context, state) =>
                    _buildPage(state, const SettingsScreen()),
              ),
            ],
          ),
        ],
      ),

      /* ----------------- SETTINGS SUB-ROUTES ----------------- */
      // Defined outside ShellRoute to cover the BottomNavBar when active

      // 1. Parking
      GoRoute(
        name: AppRoutes.parking.name,
        path: '/settings/parking',
        pageBuilder: (context, state) =>
            _buildPage(state, const ParkingSettingsScreen()),
        routes: [
          GoRoute(
            name: AppRoutes.parkingDetail.name,
            path: 'detail',
            pageBuilder: (context, state) =>
                _buildPage(state, const ParkingDetailsScreen()),
          ),
        ],
      ),

      // 2. Member Vehicles
      GoRoute(
        name: AppRoutes.memberVehicles.name,
        path: '/settings/member-vehicles',
        pageBuilder: (context, state) =>
            _buildPage(state, const MemberVehiclesScreen()),
        routes: [
          GoRoute(
            name: AppRoutes.memberVehiclesDetail.name,
            path: 'detail',
            pageBuilder: (context, state) =>
                _buildPage(state, const MemberVehicleDetailScreen()),
          ),
        ],
      ),

      // 3. Employee Management
      GoRoute(
        name: AppRoutes.employeeManagement.name,
        path: '/settings/employee-management',
        pageBuilder: (context, state) =>
            _buildPage(state, const EmployeeManagementScreen()),
      ),

      // 4. General Config
      GoRoute(
        name: AppRoutes.generalConfig.name,
        path: '/settings/general-config',
        pageBuilder: (context, state) =>
            _buildPage(state, const GeneralConfigScreen()),
        routes: [
          GoRoute(
            name: AppRoutes.parkingPrice.name,
            path:
                'parking-price', // Changed from 'detail' to avoid path conflicts in deep linking
            pageBuilder: (context, state) =>
                _buildPage(state, const ParkingPriceSetting()),
          ),
          GoRoute(
            name: AppRoutes.memberFee.name,
            path: 'member-fee', // Changed from 'detail'
            pageBuilder: (context, state) =>
                _buildPage(state, const MemberFeeSetingScreen()),
          ),
        ],
      ),

      // 5. Change Password
      GoRoute(
        name: AppRoutes.changePassword.name,
        path: '/settings/change-password',
        pageBuilder: (context, state) =>
            _buildPage(state, const ChangePasswordScreen()),
      ),

      // 6. App Settings
      GoRoute(
        name: AppRoutes.appSettings.name,
        path: '/settings/change-app',
        pageBuilder: (context, state) =>
            _buildPage(state, const AppSettingsScreen()),
      ),
    ],
  );

  /// Helper to reduce boilerplate for custom transitions
  static Page _buildPage(GoRouterState state, Widget child) {
    return goOpenContainerCustomTransition(state, child);
  }
}
