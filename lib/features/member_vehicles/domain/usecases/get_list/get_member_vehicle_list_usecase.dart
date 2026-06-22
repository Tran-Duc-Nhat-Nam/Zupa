import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/get_member_vehicle_list_params.dart';

@injectable
class GetMemberVehicleListUseCase {
  final IMemberVehiclesRepository _repository;

  GetMemberVehicleListUseCase(this._repository);

  Future<RequestState<List<MemberVehicleEntity>>> call({
    required GetMemberVehicleListParams filter,
    RequestToken? token,
  }) async => _repository.getMemberVehicles(filter: filter, token: token);
}
