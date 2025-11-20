import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../common/constants/shared_ref.dart';

part 'general_config_state.dart';
part 'general_config_cubit.freezed.dart';

class GeneralConfigCubit extends Cubit<GeneralConfigState> {
  GeneralConfigCubit() : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final bool isWarning =
        await sharedPreferences.getBool('isWarningCapacityThreshold') ?? false;
    if (isWarning) {
      final int threshold =
          await sharedPreferences.getInt('warningCapacityThreshold') ?? 0;
      emit(.loaded(isWarning, threshold));
    } else {
      emit(.loaded(isWarning, -1));
    }
  }

  Future<void> setWarning(bool? value) async {
    value ??=
        !(await sharedPreferences.getBool('isWarningCapacityThreshold') ??
            false);
    await sharedPreferences.setBool('isWarningCapacityThreshold', value);
    if (value) {
      emit(
        .loaded(value, switch (state) {
          Loaded(:final warningThreshold) => warningThreshold,
          _ => 0,
        }),
      );
    } else {
      emit(.loaded(value, -1));
    }
  }

  Future<void> setThreshold(int value) async {
    await sharedPreferences.setInt('warningCapacityThreshold', value);
    emit(.loaded(true, value));
  }
}
