import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/app_form_model.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';

part 'login_form.gform.dart';

@Rf()
class Login extends AppFormModel<LoginParams, Null> {
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

  @override
  LoginParams toParams() => .new(
    tenant: tenant,
    username: username,
    password: password,
    isRemember: isRemember,
  );

  @override
  Login fromEntity(Null entity) => .new();
}
