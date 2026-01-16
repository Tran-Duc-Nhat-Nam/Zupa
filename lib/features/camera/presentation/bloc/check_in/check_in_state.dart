part of 'check_in_cubit.dart';

@freezed
sealed class CheckInState with _$CheckInState {
  const factory CheckInState.initial() = Initial;
  const factory CheckInState.loading() = Loading;
  const factory CheckInState.checkIn(CameraController controller) = CheckIn;
  const factory CheckInState.checkOut(CameraController controller) = CheckOut;
  const factory CheckInState.failed(String message) = Failed;
  const factory CheckInState.takingPicture() = TakingPicture;
  const factory CheckInState.checkedInSuccess(
    XFile picture,
    VehicleType vehicleType,
  ) = CheckedInSuccess;
  const factory CheckInState.checkedInFailed(String message) = CheckInFailed;
  const factory CheckInState.checkedOutSuccess(XFile picture) =
      CheckedOutSuccess;
  const factory CheckInState.checkedOutFailed(String message) = CheckOutFailed;
  const factory CheckInState.submitting() = Submitting;
  const factory CheckInState.submitSuccess() = SubmitSuccess;
  const factory CheckInState.submitFailed() = SubmitFailed;
}
