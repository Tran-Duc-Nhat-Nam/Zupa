import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/employee/employee.dart';
import '../../../data/request/request.dart';
import '../../../helper/api/api_helper.dart';

part 'employee_settings_state.dart';
part 'employee_settings_cubit.freezed.dart';

class EmployeeSettingsCubit extends Cubit<EmployeeSettingsState> {
  EmployeeSettingsCubit() : super(const EmployeeSettingsState.initial());

  Future<void> init(BuildContext context) async {
    emit(const EmployeeSettingsState.loading());
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      await ApiHelper.callAPI(
        context: context,
        apiFunction: (dio) => StaffAPI(dio).getList(const Request()),
        onSuccess: (response) {
          final List<Employee> items = [];
          response.data.data.forEach(
            (entry) => items.add(Employee.fromJson(entry)),
          );
          emit(
            items.isEmpty
                ? const EmployeeSettingsState.empty()
                : EmployeeSettingsState.loaded(items, 0),
          );
        },
        onFailed: (response) =>
            emit(EmployeeSettingsState.failed(response.message)),
      );
    } else {
      emit(const EmployeeSettingsState.initial());
    }
  }
}
