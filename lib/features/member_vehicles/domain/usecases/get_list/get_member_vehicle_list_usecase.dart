import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/params/get_member_vehicle_list_params.dart';

@injectable
class GetMemberVehicleListUseCase {
  final IMemberVehiclesRepository _repository;

  GetMemberVehicleListUseCase(this._repository);

  Future<RequestState<List<MemberVehicleEntity>>> call({
    required GetMemberVehicleListParams filter,
    RequestToken? token,
  }) async {
    return _repository.getMemberVehicles(filter: filter, token: token);
  }
}
