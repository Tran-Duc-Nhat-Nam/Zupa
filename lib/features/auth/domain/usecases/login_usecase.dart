import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/auth/data/models/responses/auth_response.dart';
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

@injectable
class LoginUseCase {
  final AuthenticationRepository _repository;

  LoginUseCase(this._repository);

  Future<RequestState<AuthResponse>> call({required LoginParams params}) async {
    return _repository.logIn(params: params);
  }
}
