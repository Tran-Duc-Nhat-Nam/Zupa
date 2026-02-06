import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'login_form.gform.dart';

@Rf()
class Login {
  final String tenant;
  final String username;
  final String password;
  final bool isRemember;

  Login({
    @RfControl(validators: [RequiredValidator()]) this.tenant = '',
    @RfControl(validators: [RequiredValidator()]) this.username = '',
    @RfControl(validators: [RequiredValidator()]) this.password = '',
    @RfControl(validators: [RequiredValidator()]) this.isRemember = false,
  });
}
