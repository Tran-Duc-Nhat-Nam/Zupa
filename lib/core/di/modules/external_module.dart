import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_cache_isar_store/http_cache_isar_store.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:zupa/core/env/env.dart';

import 'package:zupa/core/helper/api/interceptors.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';

@module
abstract class ExternalModule {
  @lazySingleton
  SharedPreferencesAsync get sharedPreferences => SharedPreferencesAsync();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  @lazySingleton
  LocalAuthentication get localAuthentication => LocalAuthentication();

  @lazySingleton
  InternetConnection get connection => InternetConnection();

  @preResolve
  Future<CacheOptions> get cacheOptions async {
    final directory = await getApplicationDocumentsDirectory();
    return CacheOptions(
      store: IsarCacheStore(directory.path),
      hitCacheOnErrorCodes: [500],
      hitCacheOnNetworkFailure: true,
      maxStale: const Duration(days: 1),
    );
  }

  @lazySingleton
  Dio dio(CacheOptions options) =>
      Dio(
          BaseOptions(
            baseUrl: Env.endPoint,
            connectTimeout: const .new(seconds: 30),
          ),
        )
        ..interceptors.add(DioCacheInterceptor(options: options))
        ..interceptors.add(AuthInterceptor())
        ..interceptors.add(TalkerDioLogger(talker: DebuggerHelper.talker));
}
