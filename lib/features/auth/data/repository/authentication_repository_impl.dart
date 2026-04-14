import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/request/account/account_request.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/features/auth/data/api/account_api.dart';
import 'package:zupa/features/auth/data/models/auth_response.dart';
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkService _networkService;
  final AccountAPI _api;

  AuthenticationRepositoryImpl(this._networkService, this._api);

  @override
  Future<NetworkState<AuthResponse>> logIn({
    required LoginParams params,
  }) async {
    final payload = AccountRequest(
      tenant: params.tenant,
      username: params.username,
      password: params.password,
    );

    try {
      final response = await _networkService.request(
        (dio) => _api.login(payload),
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
}
