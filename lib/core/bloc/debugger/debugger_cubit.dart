import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/di/injection.dart';

import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';

part 'debugger_state.dart';
part 'debugger_cubit.freezed.dart';

class DebuggerCubit extends Cubit<DebuggerState> {
  DebuggerCubit() : super(const .initial());

  Future<void> loadDebugger() async {
    emit(.loaded(await getIt<StorageService>().getDebuggerMode()));
  }

  void changeDebuggerMode(bool isOn) {
    getIt<StorageService>().setDebuggerMode(isOn);
    if (!isOn) {
      DebuggerHelper.clearDebugger();
    } else {
      AppToast.showInfoToast('Shake to active debug mode');
    }
    emit(.loaded(isOn));
  }
}
