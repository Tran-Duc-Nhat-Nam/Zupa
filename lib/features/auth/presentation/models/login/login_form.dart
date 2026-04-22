import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

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
    @RfControl() this.isRemember = false,
  });

  LoginParams toParams() => .new(
    tenant: tenant,
    username: username,
    password: password,
    isRemember: isRemember,
  );

  factory Login.fromParams(LoginParams params) => .new(
    tenant: params.tenant,
    username: params.username,
    password: params.password,
    isRemember: params.isRemember,
  );
}
