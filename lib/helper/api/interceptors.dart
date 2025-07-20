import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../common/constants/shared_ref.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await sharedPreferences.getString('accessToken');

    options.headers['Authorization'] = 'Bearer $token';

    // Optionally, set other headers here
    options.headers['Accept-Language'] = Intl.getCurrentLocale().substring(0, 2);

    super.onRequest(options, handler);
  }
}