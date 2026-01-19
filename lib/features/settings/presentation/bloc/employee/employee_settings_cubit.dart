import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';

import 'package:zupa/features/settings/data/models/employee.dart';
import 'package:zupa/features/settings/domain/repository/settings_repository.dart';

part 'employee_settings_state.dart';
part 'employee_settings_cubit.freezed.dart';

@injectable
class EmployeeSettingsCubit extends Cubit<EmployeeSettingsState> {
  final ISettingsRepository _repository;

  EmployeeSettingsCubit(this._repository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _repository.getEmployees();

    result.whenOrNull(
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }
}
