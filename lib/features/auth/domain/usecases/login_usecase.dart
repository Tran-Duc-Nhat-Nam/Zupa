import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/auth/data/models/auth_response.dart';
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

@injectable
class LoginUseCase {
  final AuthenticationRepository _repository;

  LoginUseCase(this._repository);

  Future<NetworkState<AuthResponse>> call({required LoginParams params}) async {
    return _repository.logIn(params: params);
  }
}
