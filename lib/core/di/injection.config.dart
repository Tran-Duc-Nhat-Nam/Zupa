// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/repository/authentication_repository_impl.dart'
    as _i892;
import '../../features/auth/domain/repository/authentication_repository.dart'
    as _i251;
import '../../features/auth/presentation/bloc/auth/auth_cubit.dart' as _i190;
import '../../features/auth/presentation/bloc/login/login_cubit.dart' as _i65;
import '../../features/history/data/repository/history_repository_impl.dart'
    as _i148;
import '../../features/history/domain/repository/history_repository.dart'
    as _i757;
import '../../features/history/presentation/bloc/filter/history_filter_cubit.dart'
    as _i567;
import '../../features/history/presentation/bloc/list/history_list_cubit.dart'
    as _i110;
import '../../features/home/data/repository/home_repository_impl.dart' as _i9;
import '../../features/home/domain/repository/home_repository.dart' as _i541;
import '../../features/home/presentation/bloc/filter/home_filter_cubit.dart'
    as _i200;
import '../../features/home/presentation/bloc/ticket/home_ticket_cubit.dart'
    as _i602;
import '../../features/revenue/data/repository/revenue_repository_impl.dart'
    as _i413;
import '../../features/revenue/domain/repository/revenue_repository.dart'
    as _i286;
import '../../features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart'
    as _i912;
import '../../features/revenue/presentation/bloc/list/revenue_list_cubit.dart'
    as _i1054;
import '../../features/settings/data/repository/settings_repository_impl.dart'
    as _i910;
import '../../features/settings/domain/repository/settings_repository.dart'
    as _i187;
import '../../features/settings/presentation/bloc/employee/employee_settings_cubit.dart'
    as _i884;
import '../../features/settings/presentation/bloc/general_config/general_config_cubit.dart'
    as _i934;
import '../../features/settings/presentation/bloc/member_vehicles/detail/member_vehicle_detail_cubit.dart'
    as _i844;
import '../../features/settings/presentation/bloc/member_vehicles/filter/member_vehicles_filter_cubit.dart'
    as _i336;
import '../../features/settings/presentation/bloc/member_vehicles/list/member_vehicles_list_cubit.dart'
    as _i697;
import '../../features/settings/presentation/bloc/parking/detail/parking_lot_detail_cubit.dart'
    as _i973;
import '../../features/settings/presentation/bloc/parking/parking_settings_cubit.dart'
    as _i411;
import '../../features/settings/presentation/bloc/password/password_settings_cubit.dart'
    as _i382;
import '../bloc/connectivity/connectivity_cubit.dart' as _i332;
import '../bloc/debugger/debugger_cubit.dart' as _i618;
import '../bloc/localization/localization_cubit.dart' as _i781;
import '../bloc/scanner/scanner_cubit.dart' as _i220;
import '../bloc/theme/theme_cubit.dart' as _i810;
import '../network/network_info.dart' as _i932;
import '../services/biometric_service.dart' as _i374;
import '../services/network_service.dart' as _i463;
import '../services/storage_service.dart' as _i306;
import 'modules/external_module.dart' as _i649;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalModule = _$ExternalModule();
    gh.factory<_i618.DebuggerCubit>(() => _i618.DebuggerCubit());
    gh.factory<_i781.LocalizationCubit>(() => _i781.LocalizationCubit());
    gh.factory<_i220.ScannerCubit>(() => _i220.ScannerCubit());
    gh.factory<_i810.ThemeCubit>(() => _i810.ThemeCubit());
    gh.factory<_i190.AuthCubit>(() => _i190.AuthCubit());
    gh.factory<_i567.HistoryFilterCubit>(() => _i567.HistoryFilterCubit());
    gh.factory<_i200.HomeFilterCubit>(() => _i200.HomeFilterCubit());
    gh.factory<_i912.RevenueFilterCubit>(() => _i912.RevenueFilterCubit());
    gh.factory<_i934.GeneralConfigCubit>(() => _i934.GeneralConfigCubit());
    gh.factory<_i336.MemberVehiclesFilterCubit>(
      () => _i336.MemberVehiclesFilterCubit(),
    );
    gh.factory<_i973.ParkingLotDetailCubit>(
      () => _i973.ParkingLotDetailCubit(),
    );
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => externalModule.sharedPreferences,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => externalModule.secureStorage,
    );
    gh.lazySingleton<_i152.LocalAuthentication>(
      () => externalModule.localAuthentication,
    );
    gh.lazySingleton<_i895.Connectivity>(() => externalModule.connectivity);
    gh.lazySingleton<_i361.Dio>(() => externalModule.dio);
    gh.lazySingleton<_i306.StorageService>(
      () => _i306.StorageService(
        gh<_i460.SharedPreferencesAsync>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i374.BiometricService>(
      () => _i374.BiometricService(
        gh<_i152.LocalAuthentication>(),
        gh<_i306.StorageService>(),
      ),
    );
    gh.lazySingleton<_i463.NetworkService>(
      () => _i463.NetworkService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i251.AuthenticationRepository>(
      () => _i892.AuthenticationRepositoryImpl(
        gh<_i463.NetworkService>(),
        gh<_i306.StorageService>(),
      ),
    );
    gh.lazySingleton<_i187.ISettingsRepository>(
      () => _i910.SettingsRepositoryImpl(
        gh<_i463.NetworkService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i286.IRevenueRepository>(
      () => _i413.RevenueRepositoryImpl(
        gh<_i463.NetworkService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.factory<_i1054.RevenueListCubit>(
      () => _i1054.RevenueListCubit(gh<_i286.IRevenueRepository>()),
    );
    gh.lazySingleton<_i757.IHistoryRepository>(
      () => _i148.HistoryRepositoryImpl(
        gh<_i463.NetworkService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i541.IHomeRepository>(
      () => _i9.HomeRepositoryImpl(gh<_i463.NetworkService>(), gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.factory<_i65.LoginCubit>(
      () => _i65.LoginCubit(gh<_i251.AuthenticationRepository>()),
    );
    gh.factory<_i602.HomeTicketCubit>(
      () => _i602.HomeTicketCubit(gh<_i541.IHomeRepository>()),
    );
    gh.factory<_i884.EmployeeSettingsCubit>(
      () => _i884.EmployeeSettingsCubit(gh<_i187.ISettingsRepository>()),
    );
    gh.factory<_i844.MemberVehicleDetailCubit>(
      () => _i844.MemberVehicleDetailCubit(gh<_i187.ISettingsRepository>()),
    );
    gh.factory<_i697.MemberVehiclesListCubit>(
      () => _i697.MemberVehiclesListCubit(gh<_i187.ISettingsRepository>()),
    );
    gh.factory<_i411.ParkingSettingsCubit>(
      () => _i411.ParkingSettingsCubit(gh<_i187.ISettingsRepository>()),
    );
    gh.factory<_i382.PasswordSettingsCubit>(
      () => _i382.PasswordSettingsCubit(gh<_i187.ISettingsRepository>()),
    );
    gh.factory<_i110.HistoryListCubit>(
      () => _i110.HistoryListCubit(gh<_i757.IHistoryRepository>()),
    );
    gh.factory<_i332.ConnectivityCubit>(
      () => _i332.ConnectivityCubit(gh<_i932.NetworkInfo>()),
    );
    return this;
  }
}

class _$ExternalModule extends _i649.ExternalModule {}
