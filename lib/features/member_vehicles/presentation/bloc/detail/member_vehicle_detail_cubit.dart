import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/create/create_member_vehicle_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/delete/delete_member_vehicle_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/get_member_vehicle_list_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/update/update_member_vehicle_usecase.dart';

part 'member_vehicle_detail_cubit.freezed.dart';
part 'member_vehicle_detail_state.dart';

@injectable
class MemberVehicleDetailCubit extends Cubit<MemberVehicleDetailState> {
  final GetMemberVehicleListUseCase _getMemberVehicleList;
  final CreateMemberVehicleUseCase _createMemberVehicle;
  final UpdateMemberVehicleUseCase _updateMemberVehicle;
  final DeleteMemberVehicleUseCase _deleteMemberVehicle;

  MemberVehicleDetailCubit(
    this._getMemberVehicleList,
    this._createMemberVehicle,
    this._updateMemberVehicle,
    this._deleteMemberVehicle,
  ) : super(const .initial());

  Future<void> init({String? code}) async {
    if (code == null) {
      emit(const .createNew());
    } else {
      emit(const .loading());
      final result = await _getMemberVehicleList(filter: .initial());

      result.whenOrNull(
        success: (items) {
          try {
            final item = items.firstWhere((e) => e.licenseNumber == code);
            emit(.loaded(item));
          } catch (e) {
            emit(const .empty());
          }
        },
        error: (message) => emit(.failed(message)),
      );
    }
  }

  void create({required MemberVehicleEntity item}) async {
    emit(const .loading());
    final result = await _createMemberVehicle(vehicle: item);

    result.whenOrNull(
      success: (response) => emit(const .createdSucceed()),
      error: (message) => emit(.failed(message)),
    );
  }

  void update({required MemberVehicleEntity item}) async {
    emit(const .loading());
    final result = await _updateMemberVehicle(vehicle: item);

    result.whenOrNull(
      success: (response) => emit(const .updatedSucced()),
      error: (message) => emit(.failed(message)),
    );
  }

  void delete(String id) async {
    emit(const .loading());
    final result = await _deleteMemberVehicle(id: id);

    result.whenOrNull(
      success: (response) => emit(const .initial()), // or success state
      error: (message) => emit(.failed(message)),
    );
  }
}
