import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/data/request/account/account_request.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/resource/request_mapper.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/auth/data/api/auth_api.dart';
import 'package:zupa/features/auth/data/models/requests/change_password_request.dart';
import 'package:zupa/features/auth/data/models/responses/auth_response.dart';
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/features/auth/domain/usecases/params/change_password_params.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final RequestService _networkService;
  final AuthAPI _api;

  AuthenticationRepositoryImpl(this._networkService, this._api);

  @override
  Future<RequestState<AuthResponse>> logIn({
    required LoginParams params,
    RequestToken? token,
  }) async {
    final payload = AccountRequest(
      tenant: params.tenant,
      username: params.username,
      password: params.password,
    );

    try {
      final response = await _networkService.request(
        request: (cancelToken) =>
            _api.login(payload: payload, cancelToken: cancelToken),
        token: token,
      );

      if (response is SuccessResponse && response.data is AuthResponse) {
        return .success(response.data);
      } else if (response is ErrorResponse) {
        return .error(response.message);
      } else {
        return const .error(null);
      }
    } catch (e) {
      return .error(e.toString());
    }
  }

  @override
  Future<RequestState<User>> changePassword({
    required ChangePasswordParams params,
    RequestToken? token,
  }) async {
    final payload = ChangePasswordRequest(
      oldPassword: params.currentPassword,
      newPassword: params.newPassword,
    );

    try {
      final response = await _networkService.request(
        request: (cancelToken) => _api.changePassword(
          id: params.id.toString(),
          payload: payload,
          cancelToken: cancelToken,
        ),
        token: token,
      );

      if (response is SuccessResponse<User>) {
        return .success(response.data);
      } else if (response is ErrorResponse) {
        return response.toNetworkState<User>();
      } else {
        return const .error('error');
      }
    } catch (e) {
      return .error(e.toString());
    }
  }
}
