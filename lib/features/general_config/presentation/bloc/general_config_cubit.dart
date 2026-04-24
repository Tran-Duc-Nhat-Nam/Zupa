import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/general_config/domain/usecases/get/get_general_config_usecase.dart';
import 'package:zupa/features/general_config/domain/usecases/set/params/set_general_config_params.dart';
import 'package:zupa/features/general_config/domain/usecases/set/set_general_config_usecase.dart';

part 'general_config_cubit.freezed.dart';
part 'general_config_state.dart';

@injectable
class GeneralConfigCubit extends Cubit<GeneralConfigState> {
  GeneralConfigCubit(this._getGeneralConfig, this._setGeneralConfig)
    : super(const .initial());

  final GetGeneralConfigUseCase _getGeneralConfig;
  final SetGeneralConfigUseCase _setGeneralConfig;

  Future<void> init() async {
    emit(const .loading());
    final result = await _getGeneralConfig();
    emit(.loaded(result.isWarning, result.warningThreshold));
  }

  Future<void> setConfig({required SetGeneralConfigParams params}) async {
    await _setGeneralConfig(params: params);
    final result = await _getGeneralConfig();
    emit(.loaded(result.isWarning, result.warningThreshold));
  }
}
