import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/camera/presentation/models/check_in_form.dart' as f;

part 'check_in_state.dart';
part 'check_in_cubit.freezed.dart';

class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(const .initial());

  final formModel = f.CheckInForm(f.CheckInForm.formElements(f.CheckIn()), null, null);

  @override
  Future<void> close() {
    state.whenOrNull(
      checkIn: (controller) => controller.dispose(),
      checkOut: (controller) => controller.dispose(),
    );
    return super.close();
  }

  Future<void> init(bool isOut) async {
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
          isOut ? emit(.checkOut(controller)) : emit(.checkIn(controller));
        })
        .catchError((Object e) {
          if (e is CameraException) {
            emit(.failed(e.code));
          }
        });
  }

  void check(CameraController controller) async {
    emit(const .takingPicture());
    final picture = await controller.takePicture();
    controller.dispose();
    emit(
      state is CheckOut
          ? .checkedOutSuccess(picture)
          : .checkedInSuccess(picture, formModel.vehicleTypeControl.value ?? vehicleTypes[0]),
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
