import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zupa/core/env/env.dart' as app_env;
import 'package:zupa/core/helper/api/interceptors.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:logarte/logarte.dart';

@module
abstract class ExternalModule {
  @lazySingleton
  SharedPreferencesAsync get sharedPreferences => SharedPreferencesAsync();

  @lazySingleton
  LocalAuthentication get localAuthentication => LocalAuthentication();

  @lazySingleton
  Dio get dio =>
      Dio(
          BaseOptions(
            baseUrl: app_env.Environment.restApiUrl,
            connectTimeout: const Duration(seconds: 30),
          ),
        )
        ..interceptors.add(AuthInterceptor())
        ..interceptors.add(LogarteDioInterceptor(DebuggerHelper.debugger));
}
