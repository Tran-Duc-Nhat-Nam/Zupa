import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppDateTimePicker extends StatelessWidget {
  const AppDateTimePicker({
    super.key,
    this.required = false,
    this.customValidators,
    this.value,
    this.onChanged,
    this.firstDate,
    this.lastDate,
    this.type = .dateAndTime,
  });

  final bool required;
  final AppDateTimePickerType type;
  final DateTime? value;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final List<FormFieldValidator<String>>? customValidators;
  final void Function(DateTime?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return Container(
      padding: const .all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: .all(color: colorScheme.outlineVariant),
        borderRadius: .circular(16),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Text(
              value?.format(switch (type) {
                    .date => 'dd/MM/yyyy',
                    .dateAndTime => 'dd/MM/yyyy hh:mm',
                    .time => 'hh:mm',
                  }) ??
                  '',
              maxLines: 1,
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final DateTime? dt = await showOmniDateTimePicker(
                context: context,
                initialDate: .now(),
                firstDate: firstDate,
                lastDate: lastDate,
                is24HourMode: true,
                type: switch (type) {
                  .date => .date,
                  .dateAndTime => .dateAndTime,
                  .time => .time,
                },
              );
              onChanged?.call(dt);
            },
            child: Icon(
              switch (type) {
                .date => Symbols.calendar_today_rounded,
                .dateAndTime => Symbols.calendar_clock_rounded,
                .time => Symbols.access_time_rounded,
              },
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

enum AppDateTimePickerType { date, dateAndTime, time }
