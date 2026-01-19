import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';

import 'package:zupa/features/settings/data/models/parking_lot.dart';
import 'package:zupa/features/settings/domain/repository/settings_repository.dart';

part 'parking_settings_state.dart';
part 'parking_settings_cubit.freezed.dart';

@injectable
class ParkingSettingsCubit extends Cubit<ParkingSettingsState> {
  final ISettingsRepository _repository;

  ParkingSettingsCubit(this._repository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _repository.getParkingLots();
    
    result.whenOrNull(
      success: (data) => emit(.loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }
}

