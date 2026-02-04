import 'package:reactive_forms/reactive_forms.dart';

class ValidationHepler {
  static Validator<dynamic> greaterThanZeroIfTrue(
      String booleanControlName,
      String numericControlName,
      ) {
    return AnyValidator((control) {
      final form = control! as FormGroup;

      final bool isRequired = form.control(booleanControlName).value == true;
      final dynamic numericValue = form.control(numericControlName).value;

      // Convert to num safely
      final num value = (numericValue is num) ? numericValue : (num.tryParse(numericValue.toString()) ?? 0);

      if (isRequired && value <= 0) {
        // Attach the error to the numeric field specifically
        form.control(numericControlName).setErrors({'conditionalMin': true});
        return true;
      }

      // If valid, clear ONLY our specific error (so we don't wipe out other errors like 'required')
      form.control(numericControlName).removeError('conditionalMin');
      return false;
    });
  }
}