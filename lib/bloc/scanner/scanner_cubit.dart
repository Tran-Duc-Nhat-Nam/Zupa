import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';

part 'scanner_state.dart';
part 'scanner_cubit.freezed.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const ScannerState.initial());

  Future<void> init() async {
    if (await NfcManager.instance.isAvailable()) {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          final MifareClassicAndroid? data = MifareClassicAndroid.from(tag);
          if (data == null) {
            emit(const ScannerState.scanFailed('Cannot get data!'));
          } else {
            emit(ScannerState.scanSuccess({
              'data': data,
            }));
          }
        }, pollingOptions: {NfcPollingOption.iso14443},
      );
      emit(const ScannerState.loaded());
    } else {
      emit(const ScannerState.failed());
    }
  }

  Future<void> reset() async {
    if (await NfcManager.instance.isAvailable()) {
      emit(const ScannerState.loaded());
    } else {
      emit(const ScannerState.failed());
    }
  }
}
