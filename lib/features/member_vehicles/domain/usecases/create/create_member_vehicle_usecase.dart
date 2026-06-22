import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';

@injectable
class CreateMemberVehicleUseCase {
  final IMemberVehiclesRepository _repository;

  CreateMemberVehicleUseCase(this._repository);

  Future<RequestState<dynamic>> call({
    required MemberVehicleEntity vehicle,
    RequestToken? token,
  }) async => _repository.createMemberVehicle(vehicle: vehicle, token: token);
}
