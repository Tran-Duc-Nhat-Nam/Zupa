import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:zupa/core/bloc/version/version_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/firebase_options.dart';

class NotificationService {
  static final _messaging = FirebaseMessaging.instance;

  static Future<void> initialize(AppRouter router) async {
    try {
      // 1. Critical Base Initialization
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Register the background handler immediately
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      // 2. Fire-and-forget Network/Permission Requests (Do NOT block the main flow)
      _setupRemoteConfigurations();

      // 3. Setup Listeners
      _setupMessageListeners(router);
    } catch (e) {
      // Prevent Firebase initialization failure from crashing or freezing the whole app
      debugPrint('Firebase Core failed to initialize: $e');
    }
  }

  static Future<void> _setupRemoteConfigurations() async {
    try {
      await _messaging.requestPermission();
      // Safely subscribe without throwing errors back up to the app lifecycle
      await _messaging.subscribeToTopic('all_users').catchError((err) {
        debugPrint('Topic subscription failed gracefully: $err');
      });
    } catch (e) {
      debugPrint(
        'Error setting up remote notifications permissions/topics: $e',
      );
    }
  }

  static void _setupMessageListeners(AppRouter router) {
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

    // Terminated State - Executed asynchronously without hindering execution flow
    _messaging
        .getInitialMessage()
        .then((initialMessage) {
          if (initialMessage != null) {
            Future.delayed(
              const Duration(
                milliseconds: 800,
              ), // Slightly longer delay to let AutoRoute settle
              () => _handleNavigation(initialMessage, router),
            );
          }
        })
        .catchError((e) {
          debugPrint('Error fetching initial message: $e');
        });
  }

  static void _handleNavigation(RemoteMessage message, AppRouter router) {
    final routePath = message.data['route'];
    if (routePath != null) {
      router
          .pushPath(routePath)
          .catchError(
            (e, stack) => router.push(
              AppErrorRoute(
                details: FlutterErrorDetails(exception: e, stack: stack),
              ),
            ),
          );
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (_) {}
}
