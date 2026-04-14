import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/features/auth/domain/usecases/params/change_password_params.dart';

part 'change_password_form.gform.dart';

@Rf()
@RfGroup(
  validators: [MustMatchValidator('newPassword', 'confirmPassword', false)],
)
class ChangePassword {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePassword({
    @RfControl(validators: [RequiredValidator()]) this.currentPassword = '',
    @RfControl(validators: [RequiredValidator()]) this.newPassword = '',
    @RfControl(validators: [RequiredValidator()]) this.confirmPassword = '',
  });

  ChangePasswordParams toParams() =>
      .initial(newPassword: newPassword, currentPassword: currentPassword);

  factory ChangePassword.fromParams(ChangePasswordParams params) => .new(
    newPassword: params.newPassword,
    currentPassword: params.currentPassword,
    confirmPassword: '',
  );
}
