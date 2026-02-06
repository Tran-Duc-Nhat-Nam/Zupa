import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'change_password_form.gform.dart';

@Rf()
class ChangePassword {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePassword({
    @RfControl(validators: [RequiredValidator()]) this.currentPassword = '',
    @RfControl(validators: [RequiredValidator()]) this.newPassword = '',
    @RfControl(
      validators: [
        RequiredValidator(),
        MustMatchValidator('newPassword', 'confirmPassword', true),
      ],
    )
    this.confirmPassword = '',
  });
}
