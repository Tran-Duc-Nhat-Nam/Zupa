import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/storage_service.dart';

part 'debugger_cubit.freezed.dart';
part 'debugger_state.dart';

@lazySingleton
class DebuggerCubit extends Cubit<DebuggerState> {
  DebuggerCubit(this._storageService) : super(const .initial());

  final StorageService _storageService;

  Future<void> loadDebugger() async =>
      emit(.loaded(await _storageService.getDebuggerMode()));

  Future<void> changeDebuggerMode(bool isOn) async {
    await _storageService.setDebuggerMode(isOn);
    emit(.loaded(isOn));
  }
}
