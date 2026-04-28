import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';

@injectable
class GetMemberVehicleUseCase {
  final IMemberVehiclesRepository _repository;

  GetMemberVehicleUseCase(this._repository);

  Future<RequestState<MemberVehicleEntity>> call({required String id}) async {
    return _repository.getMemberVehicleDetail(id: id);
  }
}
