// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i695;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:zupa/core/bloc/connectivity/connectivity_cubit.dart' as _i792;
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart' as _i614;
import 'package:zupa/core/bloc/localization/localization_cubit.dart' as _i478;
import 'package:zupa/core/bloc/scanner/scanner_cubit.dart' as _i804;
import 'package:zupa/core/bloc/site/site_cubit.dart' as _i227;
import 'package:zupa/core/bloc/theme/theme_cubit.dart' as _i241;
import 'package:zupa/core/data/api/ticket/ticket_api.dart' as _i521;
import 'package:zupa/core/di/modules/api_module.dart' as _i413;
import 'package:zupa/core/di/modules/external_module.dart' as _i849;
import 'package:zupa/core/helper/router/router_helper.dart' as _i347;
import 'package:zupa/core/network/network_info.dart' as _i862;
import 'package:zupa/core/services/auth_status_service.dart' as _i802;
import 'package:zupa/core/services/biometric_service.dart' as _i46;
import 'package:zupa/core/services/network_service.dart' as _i986;
import 'package:zupa/core/services/storage_service.dart' as _i492;
import 'package:zupa/features/auth/data/api/account_api.dart' as _i117;
import 'package:zupa/features/auth/data/repository/authentication_repository_impl.dart'
    as _i260;
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart'
    as _i792;
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart'
    as _i815;
import 'package:zupa/features/auth/presentation/bloc/login/login_cubit.dart'
    as _i0;
import 'package:zupa/features/employee_management/data/api/employee_api.dart'
    as _i1003;
import 'package:zupa/features/employee_management/data/repository/employee_repository_impl.dart'
    as _i985;
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart'
    as _i221;
import 'package:zupa/features/employee_management/presentation/bloc/employee_cubit.dart'
    as _i45;
import 'package:zupa/features/general_config/presentation/bloc/general_config_cubit.dart'
    as _i311;
import 'package:zupa/features/history/data/api/history_api.dart' as _i639;
import 'package:zupa/features/history/data/repository/history_repository_impl.dart'
    as _i736;
import 'package:zupa/features/history/domain/repository/history_repository.dart'
    as _i36;
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart'
    as _i163;
import 'package:zupa/features/history/presentation/bloc/list/history_list_cubit.dart'
    as _i396;
import 'package:zupa/features/home/data/api/home_api.dart' as _i769;
import 'package:zupa/features/home/data/repository/home_repository_impl.dart'
    as _i79;
import 'package:zupa/features/home/domain/repository/home_repository.dart'
    as _i741;
import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart'
    as _i140;
import 'package:zupa/features/home/presentation/bloc/ticket/home_ticket_cubit.dart'
    as _i759;
import 'package:zupa/features/member_vehicles/data/api/member_vehicles_api.dart'
    as _i712;
import 'package:zupa/features/member_vehicles/data/repository/member_vehicles_repository_impl.dart'
    as _i758;
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart'
    as _i382;
import 'package:zupa/features/member_vehicles/presentation/bloc/detail/member_vehicle_detail_cubit.dart'
    as _i919;
import 'package:zupa/features/member_vehicles/presentation/bloc/filter/member_vehicles_filter_cubit.dart'
    as _i518;
import 'package:zupa/features/member_vehicles/presentation/bloc/list/member_vehicles_list_cubit.dart'
    as _i585;
import 'package:zupa/features/parking/data/repository/parking_lot_repository_impl.dart'
    as _i574;
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart'
    as _i436;
import 'package:zupa/features/parking/presentation/bloc/detail/parking_lot_detail_cubit.dart'
    as _i625;
import 'package:zupa/features/parking/presentation/bloc/parking_lot_cubit.dart'
    as _i622;
import 'package:zupa/features/password/data/api/password_api.dart' as _i490;
import 'package:zupa/features/password/data/repository/password_repository_impl.dart'
    as _i439;
import 'package:zupa/features/password/domain/repository/password_repository.dart'
    as _i468;
import 'package:zupa/features/password/presentation/bloc/password/password_settings_cubit.dart'
    as _i955;
import 'package:zupa/features/revenue/data/api/revenue_api.dart' as _i203;
import 'package:zupa/features/revenue/data/repository/revenue_repository_impl.dart'
    as _i247;
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart'
    as _i481;
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart'
    as _i646;
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart'
    as _i665;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalModule = _$ExternalModule();
    final apiModule = _$ApiModule();
    gh.factory<_i227.SiteCubit>(() => _i227.SiteCubit());
    await gh.factoryAsync<_i695.CacheOptions>(
      () => externalModule.cacheOptions,
      preResolve: true,
    );
    gh.factory<_i163.HistoryFilterCubit>(() => _i163.HistoryFilterCubit());
    gh.factory<_i140.HomeFilterCubit>(() => _i140.HomeFilterCubit());
    gh.factory<_i518.MemberVehiclesFilterCubit>(
      () => _i518.MemberVehiclesFilterCubit(),
    );
    gh.factory<_i625.ParkingLotDetailCubit>(
      () => _i625.ParkingLotDetailCubit(),
    );
    gh.factory<_i646.RevenueFilterCubit>(() => _i646.RevenueFilterCubit());
    gh.singleton<_i347.AppRouter>(() => externalModule.appRouter);
    gh.lazySingleton<_i804.ScannerCubit>(() => _i804.ScannerCubit());
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => externalModule.sharedPreferences,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => externalModule.secureStorage,
    );
    gh.lazySingleton<_i152.LocalAuthentication>(
      () => externalModule.localAuthentication,
    );
    gh.lazySingleton<_i161.InternetConnection>(() => externalModule.connection);
    gh.lazySingleton<_i802.AuthStatusService>(
      () => _i802.AuthStatusService(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => externalModule.dio(gh<_i695.CacheOptions>()),
    );
    gh.lazySingleton<_i492.StorageService>(
      () => _i492.StorageService(
        gh<_i460.SharedPreferencesAsync>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i46.BiometricService>(
      () => _i46.BiometricService(
        gh<_i152.LocalAuthentication>(),
        gh<_i492.StorageService>(),
      ),
    );
    gh.lazySingleton<_i203.RevenueAPI>(
      () => apiModule.revenueApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i521.StaffAPI>(() => apiModule.staffApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i769.HomeAPI>(() => apiModule.homeApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i712.MemberVehiclesAPI>(
      () => apiModule.memberVehiclesApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1003.EmployeeAPI>(
      () => apiModule.employeeApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i490.PasswordAPI>(
      () => apiModule.passwordApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i639.HistoryAPI>(
      () => apiModule.ticketApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i117.AccountAPI>(
      () => apiModule.accountApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i986.NetworkService>(
      () => _i986.NetworkService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i468.IPasswordRepository>(
      () => _i439.PasswordRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i490.PasswordAPI>(),
      ),
    );
    gh.factory<_i311.GeneralConfigCubit>(
      () => _i311.GeneralConfigCubit(gh<_i492.StorageService>()),
    );
    gh.lazySingleton<_i614.DebuggerCubit>(
      () => _i614.DebuggerCubit(gh<_i492.StorageService>()),
    );
    gh.lazySingleton<_i478.LocalizationCubit>(
      () => _i478.LocalizationCubit(gh<_i492.StorageService>()),
    );
    gh.lazySingleton<_i241.ThemeCubit>(
      () => _i241.ThemeCubit(gh<_i492.StorageService>()),
    );
    gh.lazySingleton<_i382.IMemberVehiclesRepository>(
      () => _i758.MemberVehiclesRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i712.MemberVehiclesAPI>(),
      ),
    );
    gh.lazySingleton<_i436.IParkingLotRepository>(
      () => _i574.ParkingLotRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i815.AuthCubit>(
      () => _i815.AuthCubit(
        gh<_i492.StorageService>(),
        gh<_i802.AuthStatusService>(),
      ),
    );
    gh.lazySingleton<_i481.IRevenueRepository>(
      () => _i247.RevenueRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i203.RevenueAPI>(),
      ),
    );
    gh.factory<_i955.PasswordSettingsCubit>(
      () => _i955.PasswordSettingsCubit(gh<_i468.IPasswordRepository>()),
    );
    gh.lazySingleton<_i862.NetworkInfo>(
      () => _i862.NetworkInfoImpl(gh<_i161.InternetConnection>()),
    );
    gh.factory<_i665.RevenueListCubit>(
      () => _i665.RevenueListCubit(gh<_i481.IRevenueRepository>()),
    );
    gh.lazySingleton<_i792.AuthenticationRepository>(
      () => _i260.AuthenticationRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i117.AccountAPI>(),
      ),
    );
    gh.factory<_i919.MemberVehicleDetailCubit>(
      () =>
          _i919.MemberVehicleDetailCubit(gh<_i382.IMemberVehiclesRepository>()),
    );
    gh.factory<_i585.MemberVehiclesListCubit>(
      () =>
          _i585.MemberVehiclesListCubit(gh<_i382.IMemberVehiclesRepository>()),
    );
    gh.lazySingleton<_i221.IEmployeeRepository>(
      () => _i985.EmployeeRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i1003.EmployeeAPI>(),
      ),
    );
    gh.factory<_i45.EmployeeCubit>(
      () => _i45.EmployeeCubit(gh<_i221.IEmployeeRepository>()),
    );
    gh.lazySingleton<_i36.IHistoryRepository>(
      () => _i736.HistoryRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i639.HistoryAPI>(),
      ),
    );
    gh.lazySingleton<_i741.IHomeRepository>(
      () => _i79.HomeRepositoryImpl(
        gh<_i986.NetworkService>(),
        gh<_i769.HomeAPI>(),
      ),
    );
    gh.factory<_i622.ParkingLotCubit>(
      () => _i622.ParkingLotCubit(gh<_i436.IParkingLotRepository>()),
    );
    gh.factory<_i396.HistoryListCubit>(
      () => _i396.HistoryListCubit(gh<_i36.IHistoryRepository>()),
    );
    gh.factory<_i0.LoginCubit>(
      () => _i0.LoginCubit(
        gh<_i492.StorageService>(),
        gh<_i792.AuthenticationRepository>(),
        gh<_i815.AuthCubit>(),
      ),
    );
    gh.lazySingleton<_i792.ConnectivityCubit>(
      () => _i792.ConnectivityCubit(gh<_i862.NetworkInfo>()),
    );
    gh.factory<_i759.HomeTicketCubit>(
      () => _i759.HomeTicketCubit(gh<_i741.IHomeRepository>()),
    );
    return this;
  }
}

class _$ExternalModule extends _i849.ExternalModule {}

class _$ApiModule extends _i413.ApiModule {}
