import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:zupa/core/bloc/version/version_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/firebase_options.dart';

class NotificationService {
  static final _messaging = FirebaseMessaging.instance;

  static Future<void> initialize(AppRouter router) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await _messaging.requestPermission();
    await _messaging.subscribeToTopic('all_users');

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.data['type'] == 'update_available') {
        getIt<VersionCubit>().checkForUpdates();
      }
    });

    // Background Click
    FirebaseMessaging.onMessageOpenedApp.listen(
      (msg) => _handleNavigation(msg, router),
    );

    // Terminated State
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => _handleNavigation(initialMessage, router),
      );
    }
  }

  static void _handleNavigation(RemoteMessage message, AppRouter router) {
    final routePath = message.data['route'];
    if (routePath != null) {
      router
          .pushPath(routePath)
          .catchError(
            (e, stack) => router.push(
              AppErrorRoute(
                details: .new(exception: e, stack: stack),
              ),
            ),
          );
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
