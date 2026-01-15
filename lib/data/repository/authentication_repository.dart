
import 'dart:async';



import '../../helper/api/api_helper.dart';
import '../../helper/auth/auth_helper.dart';
import '../api/account/account_api.dart';
import '../request/account/account_request.dart';
import '../response/error/error_response.dart';
import '../response/success/success_response.dart';

import 'package:injectable/injectable.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

@lazySingleton
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

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
      final response = await ApiHelper.request((dio) => AccountAPI(dio).login(payload));
      
      if (response is SuccessResponse) {
         final accessToken = response.data['accessToken'];
         await AuthHelper.setAuth(accessToken);
         
         if (isRemember) {
           await AuthHelper.saveAccountInfo(payload);
         } else {
           await AuthHelper.removeAccountInfo();
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
    await AuthHelper.removeAuth();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
