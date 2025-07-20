part of 'scanner_cubit.dart';

@freezed
sealed class ScannerState with _$ScannerState {
  const factory ScannerState.initial() = Initial;
  const factory ScannerState.loading() = Loading;
  const factory ScannerState.loaded() = Loaded;
  const factory ScannerState.failed() = Failed;
  const factory ScannerState.scanning() = Scanning;
  const factory ScannerState.scanSuccess(dynamic parkingData) = ScanSuccess;
  const factory ScannerState.scanFailed(String message) = ScanFailed;
}
