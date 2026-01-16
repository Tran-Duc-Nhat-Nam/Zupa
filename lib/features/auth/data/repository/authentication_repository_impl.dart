import 'dart:async';

import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/features/auth/data/api/account_api.dart';
import 'package:zupa/features/auth/data/models/account_request.dart';
import 'package:zupa/data/response/error/error_response.dart';
import 'package:zupa/data/response/success/success_response.dart';

import 'package:injectable/injectable.dart';

import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkService _networkService;
  final StorageService _storageService;
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepositoryImpl(this._networkService, this._storageService);

  @override
  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unknown;
    yield* _controller.stream;
  }

  @override
  Future<void> logIn({
    required String tenant,
    required String username,
    required String password,
    bool isRemember = false,
  }) async {
    final payload = AccountRequest(
      tenant: tenant,
      username: username,
      password: password,
    );

    try {
      final response = await _networkService.request(
        (dio) => AccountAPI(dio).login(payload),
      );

      if (response is SuccessResponse) {
        final accessToken = response.data['accessToken'];
        await _storageService.setAuth(accessToken);

        if (isRemember) {
          await _storageService.saveAccountInfo(payload);
        } else {
          await _storageService.removeAccountInfo();
        }

        _controller.add(AuthenticationStatus.authenticated);
      } else if (response is ErrorResponse) {
        throw Exception(response.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _storageService.removeAuth();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  void dispose() => _controller.close();
}
