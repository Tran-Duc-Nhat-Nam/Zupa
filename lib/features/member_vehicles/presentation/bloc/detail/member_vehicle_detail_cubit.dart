import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/create/create_member_vehicle_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/delete/delete_member_vehicle_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_detail/get_member_vehicle_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/update/update_member_vehicle_usecase.dart';

part 'member_vehicle_detail_cubit.freezed.dart';
part 'member_vehicle_detail_state.dart';

@injectable
class MemberVehicleDetailCubit extends Cubit<MemberVehicleDetailState> {
  final GetMemberVehicleUseCase _getMemberVehicle;
  final CreateMemberVehicleUseCase _createMemberVehicle;
  final UpdateMemberVehicleUseCase _updateMemberVehicle;
  final DeleteMemberVehicleUseCase _deleteMemberVehicle;
  RequestToken? _getToken;
  RequestToken? _actionToken;

  MemberVehicleDetailCubit(
    this._getMemberVehicle,
    this._createMemberVehicle,
    this._updateMemberVehicle,
    this._deleteMemberVehicle,
  ) : super(const .initial());

  Future<void> init({String? code}) async {
    if (code == null) {
      emit(const .createNew());
    } else {
      emit(const .loading());
      _getToken?.cancel();
      _getToken = .new();
      final result = await _getMemberVehicle(id: code, token: _getToken);

      switch (result) {
        case Success(:final data):
          try {
            emit(.loaded(data));
          } catch (e) {
            emit(const .empty());
          }
        case Error(:final message):
          emit(.failed(message));
        default:
          emit(const .failed('error'));
      }
    }
  }

  void create({required MemberVehicleEntity item}) async {
    emit(const .loading());
    _actionToken?.cancel();
    _actionToken = .new();
    final result = await _createMemberVehicle(
      vehicle: item,
      token: _actionToken,
    );

    switch (result) {
      case Success():
        emit(const .createdSucceed());
      case Error(:final message):
        emit(.failed(message));
      default:
        emit(const .failed('error'));
    }
  }

  void update({required MemberVehicleEntity item}) async {
    emit(const .loading());
    _actionToken?.cancel();
    _actionToken = .new();
    final result = await _updateMemberVehicle(
      vehicle: item,
      token: _actionToken,
    );

    switch (result) {
      case Success():
        emit(const .updatedSucced());
      case Error(:final message):
        emit(.failed(message));
      default:
        emit(const .failed('error'));
    }
  }

  void delete(String id) async {
    emit(const .loading());
    _actionToken?.cancel();
    _actionToken = .new();
    final result = await _deleteMemberVehicle(id: id, token: _actionToken);

    switch (result) {
      case Success():
        emit(const .initial());
      case Error(:final message):
        emit(.failed(message));
      default:
        emit(const .failed('error'));
    }
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    _actionToken?.cancel();
    return super.close();
  }
}
