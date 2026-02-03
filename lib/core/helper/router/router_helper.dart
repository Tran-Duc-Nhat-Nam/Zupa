import 'package:auto_route/auto_route.dart';

import 'package:zupa/core/helper/router/auth_guard.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Standalone Routes
    CustomRoute(
      page: LoginRoute.page,
      path: '/login',
      transitionsBuilder: TransitionsBuilders.fadeIn, // Or your custom one
    ),

    // The Shell (Bottom Nav)
    AutoRoute(
      path: '/',
      page: AppNavBarRoute.page, // You'll create this wrapper below
      guards: [AuthGuard()],
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'history', page: HistoryRoute.page),
        AutoRoute(path: 'revenue', page: RevenueRoute.page),
        AutoRoute(path: 'settings', page: SettingsRoute.page),
      ],
    ),

    // Settings Sub-routes (Outside shell to cover BottomBar)
    CustomRoute(
      path: '/settings/parking',
      page: ParkingSettingsRoute.page,
      children: [AutoRoute(path: 'detail', page: ParkingDetailsRoute.page)],
    ),


  ];
}
