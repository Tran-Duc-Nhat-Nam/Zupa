import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';

part 'general_config_state.dart';
part 'general_config_cubit.freezed.dart';

@injectable
class GeneralConfigCubit extends Cubit<GeneralConfigState> {
  GeneralConfigCubit() : super(const .initial());

  final _storageService = getIt<StorageService>();

  Future<void> init() async {
    emit(const .loading());
    final int threshold = await _storageService.getWarningCapacityThreshold();
    emit(.loaded(threshold >= 0, threshold));
  }

  Future<void> setWarning(bool value) async {
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

  Future<void> setThreshold(int value) async {
    await _storageService.setWarningCapacityThreshold(value);
    emit(.loaded(true, value));
  }
}
