import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/settings/data/models/member_vehicle.dart';
import 'package:zupa/features/settings/domain/repository/settings_repository.dart';

part 'member_vehicle_detail_state.dart';
part 'member_vehicle_detail_cubit.freezed.dart';

@injectable
class MemberVehicleDetailCubit extends Cubit<MemberVehicleDetailState> {
  final ISettingsRepository _repository;

  MemberVehicleDetailCubit(this._repository) : super(const .initial());

  Future<void> init({String? code}) async {
    if (code == null) {
      emit(const .empty());
    } else {
      emit(const .loading());
      final result = await _repository.getMemberVehicles();
      
      result.whenOrNull(
        success: (items) {
          final item = items.firstWhere((e) => e.licenseNumber == code, orElse: () => items.first);
          emit(.loaded(item));
        },
        error: (message) => emit(.failed(message)),
      );
    }
  }

  void create(Map<String, dynamic> data) async {
    emit(const .loading());
    final result = await _repository.createMemberVehicle(data);
    
    result.whenOrNull(
      success: (response) => emit(const .initial()), // or success state
      error: (message) => emit(.failed(message)),
    );
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

