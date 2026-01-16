import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/common/resource/network_state.dart';
import 'package:zupa/features/settings/data/models/member_vehicle.dart';
import 'package:zupa/features/settings/domain/repository/settings_repository.dart';

part 'member_vehicle_detail_state.dart';
part 'member_vehicle_detail_cubit.freezed.dart';

@injectable
class MemberVehicleDetailCubit extends Cubit<MemberVehicleDetailState> {
  final ISettingsRepository _repository;

  MemberVehicleDetailCubit(this._repository) : super(const MemberVehicleDetailState.initial());

  Future<void> init(BuildContext context, {String? code}) async {
    if (code == null) {
      emit(const MemberVehicleDetailState.empty());
    } else {
      emit(const MemberVehicleDetailState.loading());
      // Placeholder: in a real app, we'd fetch the specific vehicle by code/id
      // For now, let's assume we fetch all and find it, or just mock result.
      final result = await _repository.getMemberVehicles();
      
      result.when(
        initial: () {},
        loading: () {},
        success: (items) {
          final item = items.firstWhere((e) => e.licenseNumber == code, orElse: () => items.first);
          emit(MemberVehicleDetailState.loaded(item));
        },
        error: (message) => emit(MemberVehicleDetailState.failed(message)),
      );
    }
  }

  void create(BuildContext context, Map<String, dynamic> data) async {
    emit(const MemberVehicleDetailState.loading());
    final result = await _repository.createMemberVehicle(data);
    
    result.when(
      initial: () {},
      loading: () {},
      success: (response) => emit(const MemberVehicleDetailState.initial()), // or success state
      error: (message) => emit(MemberVehicleDetailState.failed(message)),
    );
  }

  void delete(BuildContext context, String id) async {
    emit(const MemberVehicleDetailState.loading());
    final result = await _repository.deleteMemberVehicle(id);
    
    result.when(
      initial: () {},
      loading: () {},
      success: (response) => emit(const MemberVehicleDetailState.initial()), // or success state
      error: (message) => emit(MemberVehicleDetailState.failed(message)),
    );
  }
}

