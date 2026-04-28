import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/auth/data/api/auth_api.dart';
import 'package:zupa/features/employee_management/data/api/employee_api.dart';
import 'package:zupa/features/history/data/api/history_api.dart';
import 'package:zupa/features/home/data/api/home_api.dart';
import 'package:zupa/features/member_vehicles/data/api/member_vehicles_api.dart';
import 'package:zupa/features/parking/data/api/parking_lot_api.dart';
import 'package:zupa/features/revenue/data/api/revenue_api.dart';

@module
abstract class ApiModule {
  @lazySingleton
  RevenueAPI revenueApi(Dio dio) =>
      .new(dio, baseUrl: '/core/report/v2/provisionalRevenue');

  @lazySingleton
  HomeAPI homeApi(Dio dio) => .new(dio);

  @lazySingleton
  MemberVehiclesAPI memberVehiclesApi(Dio dio) => .new(dio);

  @lazySingleton
  EmployeeAPI employeeApi(Dio dio) => .new(dio);

  @lazySingleton
  HistoryAPI ticketApi(Dio dio) => .new(dio, baseUrl: '/core/fsapp');

  @lazySingleton
  AuthAPI accountApi(Dio dio) => .new(dio);

  @lazySingleton
  ParkingLotAPI parkingLotApi(Dio dio) => .new(dio);
}
