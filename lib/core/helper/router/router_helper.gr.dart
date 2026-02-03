// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:zupa/core/widgets/app_nav_bar.dart' as _i1;
import 'package:zupa/features/auth/presentation/pages/login/login_screen.dart'
    as _i9;
import 'package:zupa/features/camera/presentation/pages/camera/check_in_screen.dart'
    as _i4;
import 'package:zupa/features/history/presentation/pages/history_screen.dart'
    as _i7;
import 'package:zupa/features/home/presentation/pages/home_screen.dart' as _i8;
import 'package:zupa/features/revenue/presentation/pages/revenue_screen.dart'
    as _i16;
import 'package:zupa/features/settings/data/models/parking_lot.dart' as _i20;
import 'package:zupa/features/settings/presentation/pages/app/app_settings_screen.dart'
    as _i2;
import 'package:zupa/features/settings/presentation/pages/employee_management/employee_management_screen.dart'
    as _i5;
import 'package:zupa/features/settings/presentation/pages/general_config/general_config_screen.dart'
    as _i6;
import 'package:zupa/features/settings/presentation/pages/general_config/member_fee/member_fee_seting_screen.dart'
    as _i10;
import 'package:zupa/features/settings/presentation/pages/general_config/parking_price/parking_price_setting.dart'
    as _i14;
import 'package:zupa/features/settings/presentation/pages/member_vehicles/create/member_vehicle_detail_screen.dart'
    as _i11;
import 'package:zupa/features/settings/presentation/pages/member_vehicles/member_vehicles_screen.dart'
    as _i12;
import 'package:zupa/features/settings/presentation/pages/parking/detail/parking_details_screen.dart'
    as _i13;
import 'package:zupa/features/settings/presentation/pages/parking/parking_settings_screen.dart'
    as _i15;
import 'package:zupa/features/settings/presentation/pages/password/change_password_screen.dart'
    as _i3;
import 'package:zupa/features/settings/presentation/pages/settings_screen.dart'
    as _i17;

/// generated route for
/// [_i1.AppNavBarScreen]
class AppNavBarRoute extends _i18.PageRouteInfo<void> {
  const AppNavBarRoute({List<_i18.PageRouteInfo>? children})
    : super(AppNavBarRoute.name, initialChildren: children);

  static const String name = 'AppNavBarRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppNavBarScreen();
    },
  );
}

/// generated route for
/// [_i2.AppSettingsScreen]
class AppSettingsRoute extends _i18.PageRouteInfo<void> {
  const AppSettingsRoute({List<_i18.PageRouteInfo>? children})
    : super(AppSettingsRoute.name, initialChildren: children);

  static const String name = 'AppSettingsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppSettingsScreen();
    },
  );
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordRoute extends _i18.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i18.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [_i4.CheckInScreen]
class CheckInRoute extends _i18.PageRouteInfo<CheckInRouteArgs> {
  CheckInRoute({
    _i19.Key? key,
    bool isCheckOut = false,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         CheckInRoute.name,
         args: CheckInRouteArgs(key: key, isCheckOut: isCheckOut),
         initialChildren: children,
       );

  static const String name = 'CheckInRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckInRouteArgs>(
        orElse: () => const CheckInRouteArgs(),
      );
      return _i4.CheckInScreen(key: args.key, isCheckOut: args.isCheckOut);
    },
  );
}

class CheckInRouteArgs {
  const CheckInRouteArgs({this.key, this.isCheckOut = false});

  final _i19.Key? key;

  final bool isCheckOut;

  @override
  String toString() {
    return 'CheckInRouteArgs{key: $key, isCheckOut: $isCheckOut}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CheckInRouteArgs) return false;
    return key == other.key && isCheckOut == other.isCheckOut;
  }

  @override
  int get hashCode => key.hashCode ^ isCheckOut.hashCode;
}

/// generated route for
/// [_i5.EmployeeManagementScreen]
class EmployeeManagementRoute extends _i18.PageRouteInfo<void> {
  const EmployeeManagementRoute({List<_i18.PageRouteInfo>? children})
    : super(EmployeeManagementRoute.name, initialChildren: children);

  static const String name = 'EmployeeManagementRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i5.EmployeeManagementScreen();
    },
  );
}

/// generated route for
/// [_i6.GeneralConfigScreen]
class GeneralConfigRoute extends _i18.PageRouteInfo<void> {
  const GeneralConfigRoute({List<_i18.PageRouteInfo>? children})
    : super(GeneralConfigRoute.name, initialChildren: children);

  static const String name = 'GeneralConfigRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i6.GeneralConfigScreen();
    },
  );
}

/// generated route for
/// [_i7.HistoryScreen]
class HistoryRoute extends _i18.PageRouteInfo<void> {
  const HistoryRoute({List<_i18.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i7.HistoryScreen();
    },
  );
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomeScreen();
    },
  );
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i18.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i19.Key? key, List<_i18.PageRouteInfo>? children})
    : super(
        LoginRoute.name,
        args: LoginRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'LoginRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i9.LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i10.MemberFeeSetingScreen]
class MemberFeeSetingRoute extends _i18.PageRouteInfo<void> {
  const MemberFeeSetingRoute({List<_i18.PageRouteInfo>? children})
    : super(MemberFeeSetingRoute.name, initialChildren: children);

  static const String name = 'MemberFeeSetingRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i10.MemberFeeSetingScreen();
    },
  );
}

/// generated route for
/// [_i11.MemberVehicleDetailScreen]
class MemberVehicleDetailRoute
    extends _i18.PageRouteInfo<MemberVehicleDetailRouteArgs> {
  MemberVehicleDetailRoute({
    _i19.Key? key,
    String? code,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         MemberVehicleDetailRoute.name,
         args: MemberVehicleDetailRouteArgs(key: key, code: code),
         initialChildren: children,
       );

  static const String name = 'MemberVehicleDetailRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MemberVehicleDetailRouteArgs>(
        orElse: () => const MemberVehicleDetailRouteArgs(),
      );
      return _i11.MemberVehicleDetailScreen(key: args.key, code: args.code);
    },
  );
}

class MemberVehicleDetailRouteArgs {
  const MemberVehicleDetailRouteArgs({this.key, this.code});

  final _i19.Key? key;

  final String? code;

  @override
  String toString() {
    return 'MemberVehicleDetailRouteArgs{key: $key, code: $code}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MemberVehicleDetailRouteArgs) return false;
    return key == other.key && code == other.code;
  }

  @override
  int get hashCode => key.hashCode ^ code.hashCode;
}

/// generated route for
/// [_i12.MemberVehiclesScreen]
class MemberVehiclesRoute extends _i18.PageRouteInfo<void> {
  const MemberVehiclesRoute({List<_i18.PageRouteInfo>? children})
    : super(MemberVehiclesRoute.name, initialChildren: children);

  static const String name = 'MemberVehiclesRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i12.MemberVehiclesScreen();
    },
  );
}

/// generated route for
/// [_i13.ParkingDetailsScreen]
class ParkingDetailsRoute extends _i18.PageRouteInfo<ParkingDetailsRouteArgs> {
  ParkingDetailsRoute({
    _i19.Key? key,
    _i20.ParkingLot? parkingLot,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         ParkingDetailsRoute.name,
         args: ParkingDetailsRouteArgs(key: key, parkingLot: parkingLot),
         initialChildren: children,
       );

  static const String name = 'ParkingDetailsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ParkingDetailsRouteArgs>(
        orElse: () => const ParkingDetailsRouteArgs(),
      );
      return _i13.ParkingDetailsScreen(
        key: args.key,
        parkingLot: args.parkingLot,
      );
    },
  );
}

class ParkingDetailsRouteArgs {
  const ParkingDetailsRouteArgs({this.key, this.parkingLot});

  final _i19.Key? key;

  final _i20.ParkingLot? parkingLot;

  @override
  String toString() {
    return 'ParkingDetailsRouteArgs{key: $key, parkingLot: $parkingLot}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ParkingDetailsRouteArgs) return false;
    return key == other.key && parkingLot == other.parkingLot;
  }

  @override
  int get hashCode => key.hashCode ^ parkingLot.hashCode;
}

/// generated route for
/// [_i14.ParkingPriceSettingScreen]
class ParkingPriceSettingRoute extends _i18.PageRouteInfo<void> {
  const ParkingPriceSettingRoute({List<_i18.PageRouteInfo>? children})
    : super(ParkingPriceSettingRoute.name, initialChildren: children);

  static const String name = 'ParkingPriceSettingRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i14.ParkingPriceSettingScreen();
    },
  );
}

/// generated route for
/// [_i15.ParkingSettingsScreen]
class ParkingSettingsRoute extends _i18.PageRouteInfo<void> {
  const ParkingSettingsRoute({List<_i18.PageRouteInfo>? children})
    : super(ParkingSettingsRoute.name, initialChildren: children);

  static const String name = 'ParkingSettingsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i15.ParkingSettingsScreen();
    },
  );
}

/// generated route for
/// [_i16.RevenueScreen]
class RevenueRoute extends _i18.PageRouteInfo<void> {
  const RevenueRoute({List<_i18.PageRouteInfo>? children})
    : super(RevenueRoute.name, initialChildren: children);

  static const String name = 'RevenueRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i16.RevenueScreen();
    },
  );
}

/// generated route for
/// [_i17.SettingsScreen]
class SettingsRoute extends _i18.PageRouteInfo<void> {
  const SettingsRoute({List<_i18.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i17.SettingsScreen();
    },
  );
}
