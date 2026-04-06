import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/features/camera/presentation/models/check_in_form.dart'
    as f;

part 'check_in_cubit.freezed.dart';
part 'check_in_state.dart';

class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(const .initial());

  final formModel = f.CheckInForm(
    f.CheckInForm.formElements(f.CheckIn()),
    null,
    null,
  );

  final _textRecognizer = TextRecognizer();
  bool _isProcessing = false;
  CameraDescription? _camera;

  @override
  Future<void> close() async {
    _textRecognizer.close();
    final currentState = state;
    if (currentState is CheckIn) {
      await currentState.controller.stopImageStream();
      await currentState.controller.dispose();
    } else if (currentState is CheckOut) {
      await currentState.controller.stopImageStream();
      await currentState.controller.dispose();
    }
    return super.close();
  }

  Future<void> init(bool isOut) async {
    emit(const .loading());
    final List<CameraDescription> cameras = await availableCameras();
    if (cameras.isEmpty) {
      emit(const .failed('No camera found'));
      return;
    }
    _camera = cameras[0];
    final controller = CameraController(
      _camera!,
      .high,
      enableAudio: false,
      imageFormatGroup: kIsWeb
          ? .unknown
          : defaultTargetPlatform == TargetPlatform.android
              ? .nv21
              : .bgra8888,
    );

    try {
      await controller.initialize();
      await controller.startImageStream((image) => _processImage(image, controller));
      isOut ? emit(.checkOut(controller)) : emit(.checkIn(controller));
    } catch (e) {
      if (e is CameraException) {
        emit(.failed(e.code));
      } else {
        emit(.failed(e.toString()));
      }
    }
  }

  Future<void> _processImage(CameraImage image, CameraController controller) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final inputImage = _inputImageFromCameraImage(image);
      if (inputImage == null) {
        _isProcessing = false;
        return;
      }

      final recognizedText = await _textRecognizer.processImage(inputImage);
      final plateRegex = RegExp(r'[0-9]{2}[A-Z][0-9A-Z]?-?[0-9]{3,5}(?:\.[0-9]{2})?');
      
      for (final block in recognizedText.blocks) {
        for (final line in block.lines) {
          final text = line.text.replaceAll(' ', '').toUpperCase();
          if (plateRegex.hasMatch(text)) {
            final match = plateRegex.stringMatch(text);
            if (match != null && formModel.ticketIDControl.value != match) {
              // Found a NEW potential plate!
              formModel.ticketIDControl.value = match;
              // Auto capture was not requested but this shows it's working
            }
          }
        }
      }
    } catch (e) {
      debugPrint('Error processing image: $e');
    } finally {
      _isProcessing = false;
    }
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_camera == null) return null;

    final sensorOrientation = _camera!.sensorOrientation;
    final rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw as int);
    if (format == null) return null;

    if (image.planes.isEmpty) return null;

    final plane = image.planes.first;

    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  void check(CameraController controller) async {
    emit(const .takingPicture());
    final picture = await controller.takePicture();
    controller.dispose();
    emit(
      state is CheckOut
          ? .checkedOutSuccess(picture)
          : .checkedInSuccess(
              picture,
              formModel.vehicleTypeControl.value ?? vehicleTypes[0],
            ),
    );
  }

  void reset() async {
    init(state is CheckOut);
  }

  void switchCamera() async {
    init(state is CheckOut);
  }

  void saveTicket() async {
    emit(const .submitting());
    await Future.delayed(const .new(seconds: 5));
    emit(const .submitSuccess());
  }
}
