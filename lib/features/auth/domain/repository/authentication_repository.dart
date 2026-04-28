import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/auth/data/models/responses/auth_response.dart';
import 'package:zupa/features/auth/domain/usecases/params/change_password_params.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

abstract class AuthenticationRepository {
  Future<RequestState<AuthResponse>> logIn({required LoginParams params});

  Future<RequestState<User>> changePassword({
    required ChangePasswordParams params,
  });
}
