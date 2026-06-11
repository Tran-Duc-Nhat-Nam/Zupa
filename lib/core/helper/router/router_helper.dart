import 'package:auto_route/auto_route.dart';
import 'package:zupa/core/bloc/animation/animation_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/auth_guard.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

@AutoRouterConfig(deferredLoading: true)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => getIt<AnimationCubit>().state.isOn
      ? const .adaptive()
      : .custom(duration: .zero, reverseDuration: .zero);

  // Optional: Define paths as constants to prevent typos
  static const loginPath = '/login';
  static const rootPath = '/';

  @override
  List<AutoRoute> get routes => [
    // 1. Public Routes
    .new(path: loginPath, page: LoginRoute.page),

    // 2. Protected Routes Wrapper
    .new(
      path: rootPath,
      page: const EmptyShellRoute('app').page,
      guards: [AuthGuard()],
      children: [
        // Main Application Shell (With Bottom Navigation)
        .new(
          path: '',
          page: AppNavBarRoute.page,
          guards: [AuthGuard()],
          children: [
            .new(path: 'home', page: HomeRoute.page, initial: true),
            .new(path: 'history', page: HistoryRoute.page),
            .new(path: 'revenue', page: RevenueRoute.page),
            .new(path: 'settings', page: SettingsRoute.page),
          ],
        ),

        // Settings Module (Full Screen - Covers Bottom Bar)
        .new(path: 'settings/parking', page: ParkingLotRoute.page),
        .new(path: 'settings/parking/detail', page: ParkingDetailsRoute.page),

        .new(path: 'settings/app', page: AppSettingsRoute.page),
        .new(path: 'settings/employee', page: EmployeeManagementRoute.page),

        // Nested Configuration Group
        .new(path: 'settings/general-config', page: GeneralConfigRoute.page),
        .new(
          path: 'settings/general-config/member-fee',
          page: MemberFeeSetingRoute.page,
        ),
        .new(
          path: 'settings/general-config/parking-price',
          page: ParkingPriceSettingRoute.page,
        ),

        .new(path: 'settings/vehicles', page: MemberVehiclesRoute.page),
        .new(
          path: 'settings/vehicles/detail',
          page: MemberVehicleDetailRoute.page,
        ),

        .new(path: 'settings/password', page: ChangePasswordRoute.page),
        .new(path: 'settings/about', page: AboutAppRoute.page),
        .new(path: 'settings/about/changelog', page: ChangelogRoute.page),

        .new(path: 'revenue/detail', page: RevenueDetailRoute.page),
        // 4. Action Routes
        .new(path: 'check-in', page: CheckInRoute.page),
        .new(path: 'debug', page: DebugRoute.page),
        .new(path: 'chatbot', page: ChatbotRoute.page),
      ],
    ),

    // 3. Catch-all
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
