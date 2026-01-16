abstract class AuthenticationRepository {
  Stream<AuthenticationStatus> get status;

  Future<void> logIn({
    required String tenant,
    required String username,
    required String password,
    bool isRemember = false,
  });

  Future<void> logOut();

  void dispose();
}

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
