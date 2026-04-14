import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/auth/data/models/auth_response.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

abstract class AuthenticationRepository {
  Future<NetworkState<AuthResponse>> logIn({
    required LoginParams params,
  });
}
