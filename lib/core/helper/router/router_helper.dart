import 'package:auto_route/auto_route.dart';
import 'package:zupa/core/helper/router/auth_guard.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

@AutoRouterConfig(deferredLoading: true)
class AppRouter extends RootStackRouter {
  // Optional: Define paths as constants to prevent typos
  static const String loginPath = '/login';
  static const String rootPath = '/';

  @override
  List<AutoRoute> get routes => [
    // 1. Public Routes
    AutoRoute(path: loginPath, page: LoginRoute.page),

    // 2. Protected Routes Wrapper
    AutoRoute(
      path: rootPath,
      page: const EmptyShellRoute('app').page,
      guards: [AuthGuard()],
      children: [
        // Main Application Shell (With Bottom Navigation)
        AutoRoute(
          path: '',
          page: AppNavBarRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
            AutoRoute(path: 'history', page: HistoryRoute.page),
            AutoRoute(path: 'revenue', page: RevenueRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),

        // Settings Module (Full Screen - Covers Bottom Bar)
        AutoRoute(
          path: 'settings/parking',
          page: ParkingLotRoute.page,
          children: [AutoRoute(path: 'detail', page: ParkingDetailsRoute.page)],
        ),

        AutoRoute(path: 'settings/app', page: AppSettingsRoute.page),
        AutoRoute(
          path: 'settings/employee',
          page: EmployeeManagementRoute.page,
        ),

        // Nested Configuration Group
        AutoRoute(
          path: 'settings/general-config',
          page: GeneralConfigRoute.page,
          children: [
            AutoRoute(path: 'member-fee', page: MemberFeeSetingRoute.page),
            AutoRoute(
              path: 'parking-price',
              page: ParkingPriceSettingRoute.page,
            ),
          ],
        ),

        AutoRoute(
          path: 'settings/vehicles',
          page: MemberVehiclesRoute.page,
          children: [
            AutoRoute(path: 'detail', page: MemberVehicleDetailRoute.page),
          ],
        ),

        AutoRoute(path: 'settings/password', page: ChangePasswordRoute.page),

        // 4. Action Routes
        AutoRoute(path: 'check-in', page: CheckInRoute.page),
      ],
    ),

    // 3. Catch-all
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
