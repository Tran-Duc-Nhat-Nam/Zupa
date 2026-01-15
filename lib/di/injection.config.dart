// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../bloc/login/login_cubit.dart' as _i764;
import '../data/repository/authentication_repository.dart' as _i434;
import '../data/service/biometric_service.dart' as _i143;
import '../data/service/network_service.dart' as _i940;
import '../data/service/storage_service.dart' as _i677;
import 'modules/external_module.dart' as _i649;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalModule = _$ExternalModule();
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => externalModule.sharedPreferences,
    );
    gh.lazySingleton<_i152.LocalAuthentication>(
      () => externalModule.localAuthentication,
    );
    gh.lazySingleton<_i361.Dio>(() => externalModule.dio);
    gh.lazySingleton<_i677.StorageService>(
      () => _i677.StorageService(gh<_i460.SharedPreferencesAsync>()),
    );
    gh.lazySingleton<_i940.NetworkService>(
      () => _i940.NetworkService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i143.BiometricService>(
      () => _i143.BiometricService(
        gh<_i152.LocalAuthentication>(),
        gh<_i677.StorageService>(),
      ),
    );
    gh.lazySingleton<_i434.AuthenticationRepository>(
      () => _i434.AuthenticationRepository(
        gh<_i940.NetworkService>(),
        gh<_i677.StorageService>(),
      ),
    );
    gh.factory<_i764.LoginCubit>(
      () => _i764.LoginCubit(gh<_i434.AuthenticationRepository>()),
    );
    return this;
  }
}

class _$ExternalModule extends _i649.ExternalModule {}
