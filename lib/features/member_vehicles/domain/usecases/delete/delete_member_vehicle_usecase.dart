import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

@injectable
class DeleteMemberVehicleUseCase {
  final IMemberVehiclesRepository _repository;

  DeleteMemberVehicleUseCase(this._repository);

  Future<RequestState<SuccessResponse>> call({required String id}) async {
    return _repository.deleteMemberVehicle(id: id);
  }
}
