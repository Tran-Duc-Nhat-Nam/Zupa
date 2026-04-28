import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
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
  RequestToken? _createToken;
  RequestToken? _updateToken;
  RequestToken? _deleteToken;

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

      result.whenOrNull(
        success: (item) {
          try {
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
    _createToken?.cancel();
    _createToken = .new();
    final result = await _createMemberVehicle(
      vehicle: item,
      token: _createToken,
    );

    result.whenOrNull(
      success: (response) => emit(const .createdSucceed()),
      error: (message) => emit(.failed(message)),
    );
  }

  void update({required MemberVehicleEntity item}) async {
    emit(const .loading());
    _updateToken?.cancel();
    _updateToken = .new();
    final result = await _updateMemberVehicle(
      vehicle: item,
      token: _updateToken,
    );

    result.whenOrNull(
      success: (response) => emit(const .updatedSucced()),
      error: (message) => emit(.failed(message)),
    );
  }

  void delete(String id) async {
    emit(const .loading());
    _deleteToken?.cancel();
    _deleteToken = .new();
    final result = await _deleteMemberVehicle(id: id, token: _deleteToken);

    result.whenOrNull(
      success: (response) => emit(const .initial()),
      error: (message) => emit(.failed(message)),
    );
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    _createToken?.cancel();
    _updateToken?.cancel();
    _deleteToken?.cancel();
    return super.close();
  }
}
