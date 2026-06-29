import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:volume_button_listener/volume_button_listener.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/camera/presentation/pages/camera/widgets/vehicle_type_radio_cards.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.isOut,
    required this.controller,
    required this.onTakePicture,
  });

  final bool isOut;
  final CameraController controller;
  final void Function() onTakePicture;

  @override
  AppState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends AppState<CameraScreen> {
  int upCount = 0;
  int downCount = 0;
  Timer? upTimer;
  Timer? downTimer;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    VolumeButtonListener.instance.removeButtonPressedListener(_onPressed);
    upTimer?.cancel();
    downTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Column(
      mainAxisSize: .min,
      mainAxisAlignment: .center,
      spacing: 16,
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: .infinity,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: .circular(28),
              ),
              clipBehavior: .antiAlias,
              child: FittedBox(
                clipBehavior: .antiAlias,
                fit: .cover,
                child: SizedBox(
                  width: 1000,
                  child: RepaintBoundary(
                    child: CameraPreview(widget.controller),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: widget.isOut
              ? const SizedBox.shrink()
              : const VehicleTypeRadioCards(),
        ),
        Padding(
          padding: const .only(bottom: 48, top: 0),
          child: AppButton(
            padding: const .all(16),
            onPressed: widget.onTakePicture,
            child: Icon(
              Symbols.camera_alt_rounded,
              color: colorScheme.surface,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }

  void _onPressed(VolumeButtonDirection direction) {
    switch (direction) {
      case .up:
        {
          upCount++;
          if (upCount == 1) {
            upTimer = Timer(const .new(seconds: 1), () => upCount = 0);
          }
          if (upCount == 2) {
            AppToast.showToast('Press up');
            upCount = 0;
            upTimer?.cancel();
          }
        }
      case .down:
        {
          downCount++;
          if (downCount == 1) {
            downTimer = Timer(const .new(seconds: 1), () => downCount = 0);
          }
          if (downCount == 2) {
            AppToast.showToast('Press down');
            downCount = 0;
            downTimer?.cancel();
          }
        }
    }
  }

  Future<void> _init() async {
    final listener = VolumeButtonListener.instance;

    if (VolumeButtonListener.supportsVolumeButtonListener) {
      listener.showVolumeUI = false;
      listener.suppressRepeatedPressEvents = true;
      await listener.addButtonPressedListener(_onPressed);
    }
  }
}
