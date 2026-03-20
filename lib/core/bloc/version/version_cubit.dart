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

  DateTime? _lastCheckTime;

  // Define your threshold here
  static const _checkInterval = Duration(minutes: 30);

  Future<void> checkForUpdates({bool force = false}) async {
    final now = DateTime.now();

    // Skip if we checked recently, unless it's a 'force' manual check
    if (!force && _lastCheckTime != null) {
      if (now.difference(_lastCheckTime!) < _checkInterval) {
        // We are within the 30-minute window; do nothing.
        return;
      }
    }

    // Don't interrupt an ongoing process
    if (state is Checking || state is Downloading || state is Installing) {
      return;
    }

    emit(const .checking());

    try {
      final updateStatus = await _versionService.checkVersion();

      _lastCheckTime = DateTime.now();

      if (updateStatus != null) {
        if (updateStatus.isMaintaining) {
          emit(const .maintaining());
        } else if (updateStatus.isForcedUpdate || !updateStatus.isUpToDate) {
          emit(.updateAvailable(updateStatus));
        } else if (updateStatus.isUpToDate) {
          emit(.upToDate(updateStatus));
        } else {
          emit(const .standby());
        }
      } else {
        // Fallback or error case that shouldn't happen with our updated service
        emit(const .standby());
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
                    if (state is! Downloading) {
                      emit(.downloading(progressController.stream, info));
                    }
                    progressController.add(
                      int.tryParse(event.value ?? '0') ?? 0,
                    );
                  case .INSTALLING:
                    emit(const .installing());
                  case .ALREADY_RUNNING_ERROR:
                    break;
                  case .PERMISSION_NOT_GRANTED_ERROR:
                    emit(.downloadFailed('Permission denied', info));
                  case .DOWNLOAD_ERROR:
                  case .INTERNAL_ERROR:
                    emit(.downloadFailed(event.value ?? 'Unknown error', info));
                  default:
                    break;
                }
              },
              onDone: () {
                progressController.close();
              },
              onError: (error) {
                emit(.downloadFailed(error.toString(), info));
                progressController.close();
              },
            );
      }
    } catch (e) {
      emit(.downloadFailed(e.toString(), info));
    }
  }

  void reset() => emit(const .standby());

  @override
  Future<void> close() {
    _otaSubscription?.cancel();
    return super.close();
  }
}
