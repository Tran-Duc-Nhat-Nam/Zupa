import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../../helper/theme/theme_helper.dart';
import 'vehicle_type_radio_cards.dart';
import '../../../widgets/app_button.dart';
import 'package:volume_listener/volume_listener.dart';


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
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int upCount = 0;
  int downCount = 0;
  Timer? upTimer;
  Timer? downTimer;
  @override
  void initState() {
    super.initState();
    VolumeListener.addListener((VolumeKey event) {
      switch (event) {
        case VolumeKey.up:
          {
            upCount++;
            if (upCount == 1) {
              upTimer = Timer(const Duration(seconds: 1), () {
                // Reset count after 1 second
                upCount = 0;
              });
            }
            if (upCount == 2) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Press up')));
              upCount = 0;
              upTimer?.cancel();
            }
            break;
          }
        case VolumeKey.down:
          {
            downCount++;
            if (downCount == 1) {
              downTimer = Timer(const Duration(seconds: 1), () {
                // Reset count after 1 second
                downCount = 0;
              });
            }
            if (downCount == 2) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Press down')));
              downCount = 0;
              downTimer?.cancel();
            }
            break;
          }
      }
    });
  }

  @override
  void dispose() {
    VolumeListener.removeListener();
    upTimer?.cancel();
    downTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.red,
            width: double.infinity,
            child: FittedBox(
              clipBehavior: Clip.antiAlias,
              fit: BoxFit.cover,
              child: SizedBox(
                width: 1000,
                child: CameraPreview(widget.controller),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: widget.isOut ? const SizedBox() : const VehicleTypeRadioCards(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Column(
              children: [
                AppButton(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  onPressed: widget.onTakePicture,
                  child: Icon(
                    Icons.camera_alt,
                    color: ThemeHelper.getColor(context).white,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
