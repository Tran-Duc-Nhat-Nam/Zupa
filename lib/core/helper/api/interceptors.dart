import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:zupa/core/services/auth_status_service.dart';
import 'package:zupa/core/services/storage_service.dart';

class AuthInterceptor extends QueuedInterceptor {
  final StorageService _storageService;
  final AuthStatusService _authStatusService;

  AuthInterceptor(this._storageService, this._authStatusService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storageService.getAuth();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Optionally, set other headers here
    options.headers['Accept-Language'] =
        PlatformDispatcher.instance.locale.languageCode;

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Notify the application about unauthorized access
      _authStatusService.notifyUnauthorized();
    }
    handler.next(err);
  }
}
