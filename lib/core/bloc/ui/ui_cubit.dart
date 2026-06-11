import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/usecases/ui_settings/get/get_ui_settings_usecase.dart';
import 'package:zupa/core/bloc/usecases/ui_settings/set/params/set_ui_settings_params.dart';
import 'package:zupa/core/bloc/usecases/ui_settings/set/set_ui_settings_usecase.dart';
import 'package:zupa/core/entities/ui_settings_entity.dart';

part 'ui_cubit.freezed.dart';
part 'ui_state.dart';

@lazySingleton
class UICubit extends Cubit<UIState> {
  UICubit(this._setUISettings, this._getUISettings) : super(const .loaded());

  final SetUISettingsUseCase _setUISettings;
  final GetUISettingsUseCase _getUISettings;

  Future<void> loadInfo() async =>
      emit(.loaded(settings: await _getUISettings()));

  Future<void> changeUIMode({required SetUISettingsParams params}) async {
    await _setUISettings(params: params);
    loadInfo();
  }
}
