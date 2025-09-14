import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/debugger/debugger_helper.dart';
import '../../widgets/popup/app_toast.dart';

part 'debugger_state.dart';
part 'debugger_cubit.freezed.dart';

class DebuggerCubit extends Cubit<DebuggerState> {
  DebuggerCubit() : super(const DebuggerState.initial());

  Future<void> loadDebugger() async {
    emit(DebuggerState.loaded(await DebuggerHelper.getDebuggerMode()));
  }

  void changeDebuggerMode(bool isOn) {
    DebuggerHelper.setDebuggerMode(isOn);
    if (!isOn) {
      DebuggerHelper.clearDebugger();
    } else {
      AppToast.showInfoToast('Shake to active debug mode');
    }
    emit(DebuggerState.loaded(isOn));
  }
}
