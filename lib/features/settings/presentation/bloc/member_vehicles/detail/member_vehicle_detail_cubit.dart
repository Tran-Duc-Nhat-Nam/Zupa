import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/settings/data/models/member_vehicle.dart';
import 'package:zupa/features/settings/domain/repository/settings_repository.dart';

part 'member_vehicle_detail_state.dart';
part 'member_vehicle_detail_cubit.freezed.dart';

@injectable
class MemberVehicleDetailCubit extends Cubit<MemberVehicleDetailState> {
  final ISettingsRepository _repository;

  MemberVehicleDetailCubit(this._repository) : super(const .initial());

  final FormGroup form = fb.group({
    'name': ['', Validators.required],
    'phoneNumber': ['', Validators.required],
    'licenseNumber': ['', Validators.required],
    'branch': ['', Validators.required],
    'vehicleType': ['', Validators.required],
  });

  Future<void> init({String? code}) async {
    if (code == null) {
      emit(const .empty());
    } else {
      emit(const .loading());
      final result = await _repository.getMemberVehicles();

      result.whenOrNull(
        success: (items) {
          final item = items.firstWhere(
            (e) => e.licenseNumber == code,
            orElse: () => items.first,
          );
          emit(.loaded(item));
        },
        error: (message) => emit(.failed(message)),
      );
    }
  }

  void create() async {
    if (form.valid) {
      emit(const .loading());
      final result = await _repository.createMemberVehicle(form.value);

      result.whenOrNull(
        success: (response) => emit(const .initial()), // or success state
        error: (message) => emit(.failed(message)),
      );
    } else {
      form.markAllAsTouched();
    }
  }

  void delete(String id) async {
    emit(const .loading());
    final result = await _repository.deleteMemberVehicle(id);

    result.whenOrNull(
      success: (response) => emit(const .initial()), // or success state
      error: (message) => emit(.failed(message)),
    );
  }
}
