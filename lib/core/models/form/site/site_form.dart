import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'site_form.gform.dart';

@Rf()
class Site {
  final String code;

  Site({
    @RfControl() required this.code,
  });
}
