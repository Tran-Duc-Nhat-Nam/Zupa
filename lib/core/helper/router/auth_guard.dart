import 'package:auto_route/auto_route.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/services/storage_service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final storageService = getIt<StorageService>();
    final isAuthenticated = (await storageService.getAuth()) != null;

    if (isAuthenticated) {
      // If going to login while authenticated, redirect to Home
      if (resolver.route.name == LoginRoute.name) {
        router.replaceAll([const HomeRoute()]);
      } else {
        resolver.next();
      }
    } else {
      // Not authenticated
      if (resolver.route.name != LoginRoute.name) {
        router.replaceAll([LoginRoute()]);
      } else {
        resolver.next();
      }
    }
  }
}