import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppInputWrapper<T> extends StatelessWidget {
  const AppInputWrapper({
    super.key,
    required this.control,
    required this.builder,
    this.errorText,
  });

  final AbstractControl<T>? control;
  final Widget Function(
    T? value,
    void Function(T? value)? onChanged,
    String? errorText,
  )
  builder;
  final String? errorText;

  @override
  Widget build(BuildContext context) => control == null
      ? builder(null, null, null)
      : ReactiveValueListenableBuilder<T?>(
          formControl: control,
          builder: (_, innerControl, _) => builder(
            innerControl.value,
            (value) {
              innerControl.updateValue(value);
              innerControl.markAsDirty();
              innerControl.markAsTouched();
            },
            innerControl.invalid && innerControl.touched && innerControl.dirty
                ? errorText
                : null,
          ),
        );
}
