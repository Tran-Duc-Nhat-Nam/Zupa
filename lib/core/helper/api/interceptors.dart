import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
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
    options.headers['Accept-Language'] = Intl.getCurrentLocale().substring(
      0,
      2,
    );

    super.onRequest(options, handler);
  }
}
