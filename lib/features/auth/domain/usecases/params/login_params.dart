class LoginParams {
  const LoginParams({
    required this.tenant,
    required this.username,
    required this.password,
    required this.isRemember,
  });

  factory LoginParams.initial({
     String? tenant,
     String? username,
     String? password,
     bool? isRemember,
  }) => .new(
    tenant: tenant ?? '',
    username: username ?? '',
    password: password ?? '',
    isRemember: isRemember ?? false,
  );

  final String tenant;
  final String username;
  final String password;
  final bool isRemember;
}
