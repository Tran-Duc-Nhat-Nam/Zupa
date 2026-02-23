import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppDateTimePicker extends StatelessWidget {
  const AppDateTimePicker({
    super.key,
    required this.formControl,
    this.required = false,
    this.customValidators,
    this.firstDate,
  });

  final FormControl<DateTime?> formControl;
  final bool required;
  final DateTime? firstDate;
  final List<FormFieldValidator<String>>? customValidators;
  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<DateTime?, DateTime?>(
      formControl: formControl,
      builder: (field) => Container(
        padding: const .all(12),
        decoration: BoxDecoration(
          color: ThemeHelper.getColor(context).white,
          border: .all(color: ThemeHelper.getColor(context).primary100),
          borderRadius: .circular(16),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Text(
                field.value != null
                    ? field.value!.format('dd/MM/yyyy hh:mm')
                    : '',
                maxLines: 1,
                style: AppTextStyles.bodyMediumRegular.copyWith(
                  color: ThemeHelper.getColor(context).primary300,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                final DateTime? dt = await showOmniDateTimePicker(
                  context: context,
                  initialDate: .now(),
                  firstDate: firstDate,
                );
                dt != null ? field.didChange(dt) : null;
              },
              child: Icon(
                Icons.date_range,
                color: ThemeHelper.getColor(context).primary500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
