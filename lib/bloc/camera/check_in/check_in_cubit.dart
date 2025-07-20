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
  CheckInCubit() : super(const CheckInState.initial());

  @override
  Future<void> close() {
    switch (state) {
      case CheckIn(:final controller):
        controller.dispose();
      case CheckOut(:final controller):
        controller.dispose();
      default:
    }
    return super.close();
  }

  Future<void> init(BuildContext context, bool isOut) async {
    emit(const CheckInState.loading());
    final List<CameraDescription> cameras = await availableCameras();
    final CameraController controller = CameraController(
      cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    controller
        .initialize()
        .then((_) {
          if (context.mounted) {
            isOut
                ? emit(CheckInState.checkOut(controller))
                : emit(CheckInState.checkIn(controller));
          }
        })
        .catchError((Object e) {
          if (e is CameraException) {
            emit(CheckInState.failed(e.code));
          }
        });
  }

  void check(CameraController controller, VehicleType vehicleType) async {
    emit(const CheckInState.takingPicture());
    final XFile picture = await controller.takePicture();
    controller.dispose();
    emit(
      state is CheckOut
          ? CheckInState.checkedOutSuccess(picture)
          : CheckInState.checkedInSuccess(picture, vehicleType),
    );
  }

  void reset(BuildContext context) async {
    init(context, state is CheckOut);
  }

  void switchCamera(BuildContext context) async {
    init(context, state is CheckOut);
  }

  void saveTicket(BuildContext context, dynamic ticket) async {
    emit(const CheckInState.submitting());
    await Future.delayed(const Duration(seconds: 2));
    AppToast.showSuccessToast(context.tr('success'));
    emit(const CheckInState.submitSuccess());
  }
}
