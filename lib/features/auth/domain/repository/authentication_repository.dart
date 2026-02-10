import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/auth/data/models/auth_response.dart';

abstract class AuthenticationRepository {
  Future<NetworkState<AuthResponse>> logIn({
    required String tenant,
    required String username,
    required String password,
  });
}