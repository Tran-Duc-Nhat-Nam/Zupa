import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

@injectable
class UpdateMemberVehicleUseCase {
  final IMemberVehiclesRepository _repository;

  UpdateMemberVehicleUseCase(this._repository);

  Future<NetworkState<SuccessResponse>> call({
    required MemberVehicleEntity vehicle,
  }) async {
    return _repository.updateMemberVehicle(vehicle: vehicle);
  }
}
