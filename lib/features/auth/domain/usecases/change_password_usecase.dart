import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/features/auth/domain/usecases/params/change_password_params.dart';

@injectable
class ChangePasswordUseCase {
  final AuthenticationRepository _repository;

  ChangePasswordUseCase(this._repository);

  Future<RequestState<User>> call({
    required ChangePasswordParams params,
    RequestToken? token,
  }) async {
    return _repository.changePassword(params: params, token: token);
  }
}
