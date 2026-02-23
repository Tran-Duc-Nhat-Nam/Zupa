import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/features/general_config/presentation/models/general_config_form.dart';

part 'general_config_state.dart';
part 'general_config_cubit.freezed.dart';

@injectable
class GeneralConfigCubit extends Cubit<GeneralConfigState> {
  GeneralConfigCubit(this._storageService) : super(const .initial());

  final StorageService _storageService;

  final formModel = GeneralConfigForm(
    GeneralConfigForm.formElements(GeneralConfig()),
    null,
    null,
  );

  Future<void> init() async {
    emit(const .loading());
    final int threshold = await _storageService.getWarningCapacityThreshold();
    emit(.loaded(threshold >= 0, threshold));
  }

  Future<void> setWarning() async {
    final value = formModel.isWarningControl.value == true;
    await _storageService.setWarningCapacityThreshold(value ? 0 : -1);
    emit(
      .loaded(
        value,
        state.maybeWhen(
          loaded: (_, value) => value,
          orElse: () => value ? 0 : -1,
        ),
      ),
    );
  }

  Future<void> setThreshold() async {
    final value = formModel.warningThresholdControl.value ?? 0;
    await _storageService.setWarningCapacityThreshold(value);
    emit(.loaded(true, value));
  }
}
