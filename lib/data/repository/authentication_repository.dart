
import 'dart:async';



import '../../data/service/network_service.dart';
import '../../data/service/storage_service.dart';
import '../api/account/account_api.dart';
import '../request/account/account_request.dart';
import '../response/error/error_response.dart';
import '../response/success/success_response.dart';

import 'package:injectable/injectable.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

@lazySingleton
class AuthenticationRepository {
  final NetworkService _networkService;
  final StorageService _storageService;
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepository(this._networkService, this._storageService);

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unknown;
    yield* _controller.stream;
  }

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

  Future<void> logOut() async {
    await _storageService.removeAuth();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
