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

  ParkingSettingsCubit(this._repository) : super(const ParkingSettingsState.initial());

  Future<void> init() async {
    emit(const ParkingSettingsState.loading());
    final result = await _repository.getParkingLots();
    
    result.when(
      initial: () {},
      loading: () {},
      success: (data) => emit(ParkingSettingsState.loaded(data, 0)),
      error: (message) => emit(ParkingSettingsState.failed(message)),
    );
  }
}

