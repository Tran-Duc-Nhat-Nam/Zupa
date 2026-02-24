import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';

part 'scanner_state.dart';
part 'scanner_cubit.freezed.dart';

@lazySingleton
class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const .initial());

  Future<void> init() async {
    if (await NfcManager.instance.checkAvailability() ==
        NfcAvailability.enabled) {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          final MifareClassicAndroid? data = .from(tag);
          if (data == null) {
            emit(const .scanFailed('Cannot get data!'));
          } else {
            emit(.scanSuccess({'data': data}));
          }
        },
        pollingOptions: {.iso14443},
      );
      emit(const .loaded());
    } else {
      emit(const .failed());
    }
  }

  Future<void> reset() async {
    if (await NfcManager.instance.checkAvailability() ==
        NfcAvailability.enabled) {
      emit(const .loaded());
    } else {
      emit(const .failed());
    }
  }
}
