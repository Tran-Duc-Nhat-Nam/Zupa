import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/data/models/member_vehicle.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';
import 'package:zupa/features/member_vehicles/presentation/models/member_vehicle_detail_form.dart';

part 'member_vehicle_detail_state.dart';
part 'member_vehicle_detail_cubit.freezed.dart';

@injectable
class MemberVehicleDetailCubit extends Cubit<MemberVehicleDetailState> {
  final IMemberVehiclesRepository _repository;

  MemberVehicleDetailCubit(this._repository) : super(const .initial());

  final formModel = MemberVehicleDetailForm(
    MemberVehicleDetailForm.formElements(MemberVehicleDetail()),
    null,
    null,
  );

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
    if (formModel.form.valid) {
      emit(const .loading());
      final result = await _repository.createMemberVehicle(
        MemberVehicle(
          name: formModel.nameControl.value!,
          phoneNumber: formModel.phoneNumberControl.value!,
          licenseNumber: formModel.licenseNumberControl.value!,
          parkingLotId: formModel.branchControl.value!,
          vehicleType: formModel.vehicleTypeControl.value!,
          cardId: formModel.ticketIDControl.value!,
          expiredIn: formModel.expiredInControl.value!.inSeconds,
        ),
      );

      result.whenOrNull(
        success: (response) => emit(const .initial()), // or success state
        error: (message) => emit(.failed(message)),
      );
    } else {
      formModel.form.markAllAsTouched();
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
