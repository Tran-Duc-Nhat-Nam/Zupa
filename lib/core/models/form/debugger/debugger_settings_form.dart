import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'debugger_settings_form.gform.dart';

@Rf()
class DebuggerSettings {
  final bool isEnabled;

  DebuggerSettings({
    @RfControl() this.isEnabled = false,
  });
}
