import 'package:auto_route/auto_route.dart';

import 'package:zupa/core/helper/router/auth_guard.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

@AutoRouterConfig(deferredLoading: true)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Standalone Routes
    AutoRoute(
      page: LoginRoute.page,
    ),

    // The Shell (Bottom Nav)
    AutoRoute(
      initial: true,
      page: AppNavBarRoute.page, // You'll create this wrapper below
      guards: [AuthGuard()],
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: RevenueRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),

    // Settings Sub-routes (Outside shell to cover BottomBar)
    AutoRoute(
      page: ParkingSettingsRoute.page,
      children: [AutoRoute(path: 'detail', page: ParkingDetailsRoute.page)],
    ),

    AutoRoute(
      page: AppSettingsRoute.page,
    ),

    AutoRoute(
      page: EmployeeManagementRoute.page,
    ),

    AutoRoute(
      page: GeneralConfigRoute.page,
    ),

    AutoRoute(
      page: MemberVehiclesRoute.page,
      children: [AutoRoute(
        page: MemberVehicleDetailRoute.page,
      ),]
    ),

    AutoRoute(
      page: ChangePasswordRoute.page,
    ),

    AutoRoute(
      page: CheckInRoute.page,
    ),
  ];
}
