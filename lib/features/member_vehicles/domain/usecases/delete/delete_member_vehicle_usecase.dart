import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';

@injectable
class DeleteMemberVehicleUseCase {
  final IMemberVehiclesRepository _repository;

  DeleteMemberVehicleUseCase(this._repository);

  Future<RequestState<dynamic>> call({
    required String id,
    RequestToken? token,
  }) async => _repository.deleteMemberVehicle(id: id, token: token);
}
