import 'package:auto_route/auto_route.dart';

import 'package:zupa/core/helper/router/auth_guard.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

@AutoRouterConfig(deferredLoading: true)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Standalone Routes
    AutoRoute(path: '/login', page: LoginRoute.page),

    // The Shell (Bottom Nav)
    AutoRoute(
      path: '/',
      page: AppNavBarRoute.page, // You'll create this wrapper below
      guards: [AuthGuard()],
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'history', page: HistoryRoute.page),
        AutoRoute(path: 'revenue', page: RevenueRoute.page),
        AutoRoute(path: 'settings', page: SettingsRoute.page),
      ],
    ),

    // Settings Sub-routes (Outside shell to cover BottomBar)
    AutoRoute(
      path: '/settings/parking',
      page: ParkingSettingsRoute.page,
      children: [AutoRoute(path: 'detail', page: ParkingDetailsRoute.page)],
    ),

    AutoRoute(path: '/settings/app', page: AppSettingsRoute.page),

    AutoRoute(path: '/settings/employee', page: EmployeeManagementRoute.page),

    AutoRoute(
      path: '/settings/general-config',
      page: GeneralConfigRoute.page,
      children: [
        AutoRoute(path: 'member-fee', page: MemberFeeSetingRoute.page),
        AutoRoute(path: 'parking-price', page: ParkingPriceSettingRoute.page),
      ],
    ),

    AutoRoute(
      path: '/settings/vehicles',
      page: MemberVehiclesRoute.page,
      children: [
        AutoRoute(path: 'detail', page: MemberVehicleDetailRoute.page),
      ],
    ),

    AutoRoute(path: '/settings/password', page: ChangePasswordRoute.page),

    AutoRoute(path: '/check-in', page: CheckInRoute.page),
  ];
}
