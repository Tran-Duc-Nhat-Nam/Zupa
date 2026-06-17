import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/employee_management/domain/repository/employee_repository.dart';
import 'package:zupa/features/employee_management/domain/usecase/update_avatar/update_avatar_params.dart';

@injectable
class UpdateAvatarUseCase {
  final IEmployeeRepository _repository;

  UpdateAvatarUseCase(this._repository);

  Future<RequestState<String>> call({
    required UpdateAvatarParams params,
    RequestToken? token,
  }) async => _repository.updateAvatar(params: params, token: token);
}
