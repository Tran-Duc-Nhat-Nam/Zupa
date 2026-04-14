class ChangePasswordParams {
  const ChangePasswordParams({
    required this.id,
    required this.currentPassword,
    required this.newPassword,
  });

  factory ChangePasswordParams.initial({
    int? id,
    String? currentPassword,
    String? newPassword,
  }) => .new(
    id: id ?? -1,
    currentPassword: currentPassword ?? '',
    newPassword: newPassword ?? '',
  );

  final int id;
  final String currentPassword;
  final String newPassword;
}
