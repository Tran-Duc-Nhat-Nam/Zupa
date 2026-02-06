import 'package:reactive_forms/reactive_forms.dart';

class GeneralConfigValidator extends Validator<dynamic> {

  @override
  Map<String, dynamic>? validate(AbstractControl control) {
    // In reactive_forms_generator, group-level validators receive the FormGroup
    final form = control as FormGroup;

    // Note: You have to hardcode or map these names to match your model fields
    final bool isRequired = form.control('someBooleanFlag').value == true;
    final dynamic numericValue = form.control('someNumericField').value;

    final num value = (numericValue is num)
        ? numericValue
        : (num.tryParse(numericValue.toString()) ?? 0);

    final numericControl = form.control('someNumericField');

    if (isRequired && value <= 0) {
      numericControl.setErrors({'conditionalMin': true});
      return {'conditionalMin': true};
    }

    // Clear only our specific error
    numericControl.removeError('conditionalMin');
    return null;
  }
}