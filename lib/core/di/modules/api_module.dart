import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/api/ticket/ticket_api.dart';
import 'package:zupa/features/auth/data/api/account_api.dart';
import 'package:zupa/features/employee_management/data/api/employee_api.dart';
import 'package:zupa/features/history/data/api/history_api.dart';
import 'package:zupa/features/home/data/api/home_api.dart';
import 'package:zupa/features/member_vehicles/data/api/member_vehicles_api.dart';
import 'package:zupa/features/password/data/api/password_api.dart';
import 'package:zupa/features/revenue/data/api/revenue_api.dart';

@module
abstract class ApiModule {
  @lazySingleton
  RevenueAPI revenueApi(Dio dio) => RevenueAPI(dio);

  @lazySingleton
  StaffAPI staffApi(Dio dio) => StaffAPI(dio);

  @lazySingleton
  HomeAPI homeApi(Dio dio) => HomeAPI(dio);

  @lazySingleton
  MemberVehiclesAPI memberVehiclesApi(Dio dio) => MemberVehiclesAPI(dio);

  @lazySingleton
  EmployeeAPI employeeApi(Dio dio) => EmployeeAPI(dio);

  @lazySingleton
  PasswordAPI passwordApi(Dio dio) => PasswordAPI(dio);

  @lazySingleton
  HistoryAPI ticketApi(Dio dio) => HistoryAPI(dio, baseUrl: '/core/fsapp');

  @lazySingleton
  AccountAPI accountApi(Dio dio) => AccountAPI(dio);
}
