import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/di/injection.dart';

import 'package:zupa/core/services/storage_service.dart';

part 'debugger_state.dart';
part 'debugger_cubit.freezed.dart';

@injectable
class DebuggerCubit extends Cubit<DebuggerState> {
  DebuggerCubit() : super(const .initial());

  Future<void> loadDebugger() async {
    emit(.loaded(await getIt<StorageService>().getDebuggerMode()));
  }

  void changeDebuggerMode(bool isOn) {
    getIt<StorageService>().setDebuggerMode(isOn);
    emit(.loaded(isOn));
  }
}
