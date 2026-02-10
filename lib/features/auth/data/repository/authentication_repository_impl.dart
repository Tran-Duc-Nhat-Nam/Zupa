import 'dart:async';

import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/features/auth/data/api/account_api.dart';
import 'package:zupa/features/auth/data/models/account_request.dart';
import 'package:zupa/core/data/response/error/error_response.dart';

import 'package:injectable/injectable.dart';
import 'package:zupa/features/auth/data/models/auth_response.dart';

import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkService _networkService;
  final AccountAPI _api;

  AuthenticationRepositoryImpl(this._networkService, this._api);

  @override
  Future<NetworkState<AuthResponse>> logIn({
    required String tenant,
    required String username,
    required String password,
  }) async {
    final payload = AccountRequest(
      tenant: tenant,
      username: username,
      password: password,
    );

    try {
      final response = await _networkService.request(
        (dio) => _api.login(payload),
      );

      if (response is SuccessResponse) {
        return .success(response.data);
      } else if (response is ErrorResponse) {
        return .error(response.message);
      } else {
        return const .error('error');
      }
    } catch (e) {
      return .error(e.toString());
    }
  }
}
