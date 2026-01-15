import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/employee/employee.dart';
import '../../../helper/api/api_helper.dart';

part 'employee_settings_state.dart';
part 'employee_settings_cubit.freezed.dart';

class EmployeeSettingsCubit extends Cubit<EmployeeSettingsState> {
  EmployeeSettingsCubit() : super(const .initial());

  Future<void> init(BuildContext context) async {
    emit(const .loading());
    await Future.delayed(const .new(seconds: 2));
    if (context.mounted) {
      await ApiHelper.callAPI(
  
        apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
        onSuccess: (response) {
          final List<Employee> items = [];
          response.data.data.forEach(
            (entry) => items.add(.fromJson(entry)),
          );
          emit(
            items.isEmpty
                ? const .empty()
                : .loaded(items, 0),
          );
        },
        onFailed: (response) =>
            emit(.failed(response.message)),
      );
    } else {
      emit(const .initial());
    }
  }
}
