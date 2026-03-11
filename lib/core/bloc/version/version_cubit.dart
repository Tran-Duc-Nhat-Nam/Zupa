import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ota_update/ota_update.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/models/version_info.dart';
import 'package:zupa/core/services/device_service.dart';
import 'package:zupa/core/services/version_service.dart';

part 'version_state.dart';
part 'version_cubit.freezed.dart';

@lazySingleton
class VersionCubit extends Cubit<VersionState> {
  VersionCubit(this._versionService, this._deviceService)
    : super(const .initial());

  StreamSubscription? _otaSubscription;

  final VersionService _versionService;
  final DeviceService _deviceService;

  Future<void> checkForUpdates() async {
    emit(const .checking());

    try {
      final updateStatus = await _versionService.checkVersion();

      if (updateStatus != null) {
        if (updateStatus.isMaintaining) {
          emit(const .maintaining());
          return;
        } else {
          emit(.updateAvailable(updateStatus));
        }
      } else {
        emit(const .upToDate());
      }
    } catch (e) {
      // Fallback to standby or error state if the check fails
      emit(const .standby());
    }
  }

  Future<void> executeUpdate(VersionInfo info) async {
    try {
      final abi = await _deviceService.getDeviceAbi();

      final finalUrl = info.updateUrl?[TargetPlatform.android]
          ?.replaceAll('<version>', info.latestVersion!)
          .replaceAll('<abi>', abi);

      DebuggerHelper.talker.log('Downloading from: $finalUrl');
      if (finalUrl == null) {
        emit(const .standby());
      } else {
        final progressController = StreamController<int>();
        _otaSubscription = OtaUpdate()
            .execute(finalUrl)
            .listen(
              (OtaEvent event) {
                switch (event.status) {
                  case .DOWNLOADING:
                    // Emit the downloading state with the progress stream once
                    if (state is! Downloading) {
                      emit(.downloading(progressController.stream));
                    }
                    progressController.add(
                      int.tryParse(event.value ?? '0') ?? 0,
                    );
                  case .INSTALLING:
                    emit(const .installing());
                  case .ALREADY_RUNNING_ERROR:
                    // Handle case where update is already in progress
                    break;
                  case .PERMISSION_NOT_GRANTED_ERROR:
                    emit(const .downloadFailed('Permission denied'));
                  case .DOWNLOAD_ERROR:
                  case .INTERNAL_ERROR:
                    emit(.downloadFailed('Update failed: ${event.value}'));
                  default:
                    break;
                }
              },
              onDone: () {
                // Note: On many Android devices, the app closes/restarts here
                progressController.close();
              },
              onError: (error) {
                emit(.downloadFailed(error.toString()));
                progressController.close();
              },
            );
      }
    } catch (e) {
      emit(.downloadFailed(e.toString()));
    }
  }

  void reset() => emit(const .standby());

  @override
  Future<void> close() {
    _otaSubscription?.cancel();
    return super.close();
  }
}
