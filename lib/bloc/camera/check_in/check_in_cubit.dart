import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../screens/camera/models/vehicle_type.dart';
import '../../../widgets/popup/app_toast.dart';

part 'check_in_state.dart';
part 'check_in_cubit.freezed.dart';

class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(const .initial());

  @override
  Future<void> close() {
    state.whenOrNull(
      checkIn: (controller) => controller.dispose(),
      checkOut: (controller) => controller.dispose(),
    );
    return super.close();
  }

  Future<void> init(BuildContext context, bool isOut) async {
    emit(const .loading());
    final List<CameraDescription> cameras = await availableCameras();
    final controller = CameraController(
      cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    controller
        .initialize()
        .then((_) {
          if (context.mounted) {
            isOut ? emit(.checkOut(controller)) : emit(.checkIn(controller));
          }
        })
        .catchError((Object e) {
          if (e is CameraException) {
            emit(.failed(e.code));
          }
        });
  }

  void check(CameraController controller, VehicleType vehicleType) async {
    emit(const .takingPicture());
    final picture = await controller.takePicture();
    controller.dispose();
    emit(
      state is CheckOut
          ? .checkedOutSuccess(picture)
          : .checkedInSuccess(picture, vehicleType),
    );
  }

  void reset(BuildContext context) async {
    init(context, state is CheckOut);
  }

  void switchCamera(BuildContext context) async {
    init(context, state is CheckOut);
  }

  void saveTicket(BuildContext context, dynamic ticket) async {
    emit(const .submitting());
    await Future.delayed(const .new(seconds: 5));
    if (context.mounted) {
      AppToast.showSuccessToast(context.tr('success'));
    }
    emit(const .submitSuccess());
  }
}
