import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
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
  Dio get dio =>
      Dio(
          BaseOptions(
            baseUrl: Env.endPoint,
            connectTimeout: const .new(seconds: 30),
          ),
        )
        ..interceptors.add(AuthInterceptor())
        ..interceptors.add(TalkerDioLogger(talker: DebuggerHelper.talker));
}
