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

import '../core/services/biometric_service.dart' as _i379;
import '../core/services/network_service.dart' as _i759;
import '../core/services/storage_service.dart' as _i736;
import '../features/auth/data/repository/authentication_repository_impl.dart'
    as _i670;
import '../features/auth/domain/repository/authentication_repository.dart'
    as _i893;
import '../features/auth/presentation/bloc/login/login_cubit.dart' as _i317;
import '../features/history/data/repository/history_repository_impl.dart'
    as _i299;
import '../features/history/domain/repository/history_repository.dart' as _i928;
import '../features/history/presentation/bloc/filter/history_filter_cubit.dart'
    as _i12;
import '../features/history/presentation/bloc/list/history_list_cubit.dart'
    as _i630;
import '../features/home/data/repository/home_repository_impl.dart' as _i722;
import '../features/home/domain/repository/home_repository.dart' as _i855;
import '../features/home/presentation/bloc/ticket/home_ticket_cubit.dart'
    as _i232;
import '../features/revenue/data/repository/revenue_repository_impl.dart'
    as _i888;
import '../features/revenue/domain/repository/revenue_repository.dart' as _i457;
import '../features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart'
    as _i315;
import '../features/revenue/presentation/bloc/list/revenue_list_cubit.dart'
    as _i596;
import '../features/settings/data/repository/settings_repository_impl.dart'
    as _i933;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i816;
import '../features/settings/presentation/bloc/employee/employee_settings_cubit.dart'
    as _i312;
import '../features/settings/presentation/bloc/general_config/general_config_cubit.dart'
    as _i820;
import '../features/settings/presentation/bloc/member_vehicles/detail/member_vehicle_detail_cubit.dart'
    as _i810;
import '../features/settings/presentation/bloc/member_vehicles/filter/member_vehicles_filter_cubit.dart'
    as _i451;
import '../features/settings/presentation/bloc/member_vehicles/list/member_vehicles_list_cubit.dart'
    as _i634;
import '../features/settings/presentation/bloc/parking/detail/parking_lot_detail_cubit.dart'
    as _i168;
import '../features/settings/presentation/bloc/parking/parking_settings_cubit.dart'
    as _i80;
import '../features/settings/presentation/bloc/password/password_settings_cubit.dart'
    as _i124;
import 'modules/external_module.dart' as _i649;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalModule = _$ExternalModule();
    gh.factory<_i12.HistoryFilterCubit>(() => _i12.HistoryFilterCubit());
    gh.factory<_i315.RevenueFilterCubit>(() => _i315.RevenueFilterCubit());
    gh.factory<_i820.GeneralConfigCubit>(() => _i820.GeneralConfigCubit());
    gh.factory<_i451.MemberVehiclesFilterCubit>(
      () => _i451.MemberVehiclesFilterCubit(),
    );
    gh.factory<_i168.ParkingLotDetailCubit>(
      () => _i168.ParkingLotDetailCubit(),
    );
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => externalModule.sharedPreferences,
    );
    gh.lazySingleton<_i152.LocalAuthentication>(
      () => externalModule.localAuthentication,
    );
    gh.lazySingleton<_i361.Dio>(() => externalModule.dio);
    gh.lazySingleton<_i736.StorageService>(
      () => _i736.StorageService(gh<_i460.SharedPreferencesAsync>()),
    );
    gh.lazySingleton<_i379.BiometricService>(
      () => _i379.BiometricService(
        gh<_i152.LocalAuthentication>(),
        gh<_i736.StorageService>(),
      ),
    );
    gh.lazySingleton<_i759.NetworkService>(
      () => _i759.NetworkService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i893.AuthenticationRepository>(
      () => _i670.AuthenticationRepositoryImpl(
        gh<_i759.NetworkService>(),
        gh<_i736.StorageService>(),
      ),
    );
    gh.lazySingleton<_i816.ISettingsRepository>(
      () => _i933.SettingsRepositoryImpl(
        gh<_i759.NetworkService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i457.IRevenueRepository>(
      () => _i888.RevenueRepositoryImpl(
        gh<_i759.NetworkService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i928.IHistoryRepository>(
      () => _i299.HistoryRepositoryImpl(
        gh<_i759.NetworkService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i855.IHomeRepository>(
      () =>
          _i722.HomeRepositoryImpl(gh<_i759.NetworkService>(), gh<_i361.Dio>()),
    );
    gh.factory<_i317.LoginCubit>(
      () => _i317.LoginCubit(gh<_i893.AuthenticationRepository>()),
    );
    gh.factory<_i596.RevenueListCubit>(
      () => _i596.RevenueListCubit(
        gh<_i457.IRevenueRepository>(),
        gh<_i315.RevenueFilterCubit>(),
      ),
    );
    gh.factory<_i232.HomeTicketCubit>(
      () => _i232.HomeTicketCubit(gh<_i855.IHomeRepository>()),
    );
    gh.factory<_i630.HistoryListCubit>(
      () => _i630.HistoryListCubit(
        gh<_i928.IHistoryRepository>(),
        gh<_i12.HistoryFilterCubit>(),
      ),
    );
    gh.factory<_i312.EmployeeSettingsCubit>(
      () => _i312.EmployeeSettingsCubit(gh<_i816.ISettingsRepository>()),
    );
    gh.factory<_i810.MemberVehicleDetailCubit>(
      () => _i810.MemberVehicleDetailCubit(gh<_i816.ISettingsRepository>()),
    );
    gh.factory<_i634.MemberVehiclesListCubit>(
      () => _i634.MemberVehiclesListCubit(gh<_i816.ISettingsRepository>()),
    );
    gh.factory<_i80.ParkingSettingsCubit>(
      () => _i80.ParkingSettingsCubit(gh<_i816.ISettingsRepository>()),
    );
    gh.factory<_i124.PasswordSettingsCubit>(
      () => _i124.PasswordSettingsCubit(gh<_i816.ISettingsRepository>()),
    );
    return this;
  }
}

class _$ExternalModule extends _i649.ExternalModule {}
