import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/auth/data/api/auth_api.dart';
import 'package:zupa/features/auth/data/models/responses/auth_response.dart';
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/features/auth/domain/usecases/params/change_password_params.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl
    with RequestService
    implements AuthenticationRepository {
  final AuthAPI _api;

  AuthenticationRepositoryImpl(this._api);

  @override
  Future<RequestState<AuthResponse>> logIn({
    required LoginParams params,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.login(
        payload: .new(
          tenant: params.tenant,
          username: params.username,
          password: params.password,
        ),
        cancelToken: cancelToken,
      ),
      token: token,
    );

    return response.when(
      success: (data) => Success(data),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }

  @override
  Future<RequestState<User>> changePassword({
    required ChangePasswordParams params,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.changePassword(
        id: params.id.toString(),
        payload: .new(
          oldPassword: params.currentPassword,
          newPassword: params.newPassword,
        ),
        cancelToken: cancelToken,
      ),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }
}
