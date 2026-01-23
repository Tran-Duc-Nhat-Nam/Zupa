
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jiffy/jiffy.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:zupa/gen/strings.g.dart';

class AppDateTimePicker extends StatelessWidget {
  const AppDateTimePicker({
    super.key,
    required this.name,
    this.required = false,
    this.customValidators,
    this.firstDate,
  });

  final String name;
  final bool required;
  final DateTime? firstDate;
  final List<FormFieldValidator<String>>? customValidators;
  @override
  Widget build(BuildContext context) {
    final List<FormFieldValidator<DateTime>> validators = [];
    if (required) {
      validators.add(
        FormBuilderValidators.required(
          errorText: Translations.of(context).errorMessage.required,
        ),
      );
    }
    if (customValidators != null) {
      validators.addAll(
        customValidators! as Iterable<FormFieldValidator<DateTime>>,
      );
    }
    return FormBuilderField<DateTime?>(
      initialValue: .now(),
      builder: (field) => Container(
        padding: const .all(12),
        decoration: BoxDecoration(
          border: .all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: .circular(12),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Text(
                field.value != null
                    ? Jiffy.parseFromDateTime(
                        field.value!,
                      ).format(pattern: 'dd/MM/yyyy hh:mm')
                    : '',
                maxLines: 1,
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
              child: const Icon(Icons.date_range),
            ),
          ],
        ),
      ),
      name: name,
      validator: FormBuilderValidators.compose(validators),
    );
  }
}
