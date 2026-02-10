import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:http_cache_isar_store/http_cache_isar_store.dart';
import 'package:zupa/core/di/injection.dart';

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
}

final cacheOptions = CacheOptions(
  // A default store is required for interceptor.
  store: IsarCacheStore(
    'cache'
  ),
  // Returns a cached response on error for given status codes.
  // Defaults to `[]`.
  hitCacheOnErrorCodes: [500],
  // Allows to return a cached response on network errors (e.g. offline usage).
  // Defaults to `false`.
  hitCacheOnNetworkFailure: true,
  // Overrides any HTTP directive to delete entry past this duration.
  // Useful only when origin server has no cache config or custom behaviour is desired.
  // Defaults to `null`.
  maxStale: const Duration(days: 1),
);
