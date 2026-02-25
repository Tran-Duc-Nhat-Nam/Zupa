import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

import 'package:zupa/core/services/storage_service.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getIt<StorageService>().getAuth();

    options.headers['Authorization'] = 'Bearer $token';

    // Optionally, set other headers here
    options.headers['Accept-Language'] = PlatformDispatcher.instance.locale
        .toString()
        .substring(0, 2);

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Clear token
      await getIt<StorageService>().removeAuth();

      // Navigate to login
      getIt<AppRouter>().replaceAll([const LoginRoute()]);
    }
    super.onError(err, handler);
  }
}