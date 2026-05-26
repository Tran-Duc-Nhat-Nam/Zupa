import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/wrapper/app_input_wrapper.dart';

extension AppFormTextField on AppTextField {
  static Widget form({
    required AbstractControl<String> control,
    String? labelText,
    IconData? prefixIcon,
    bool isPassword = false,
    String? errorText,
  }) {
    return AppInputWrapper<String>(
      control: control,
      errorText: errorText,
      builder: (value, onChanged, derivedError) => AppTextField(
        labelText: labelText,
        prefixIcon: prefixIcon,
        isPassword: isPassword,
        initialValue: value,
        onChanged: onChanged,
        errorText: derivedError,
      ),
    );
  }
}
