import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/core/widgets/app_radio_group.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/history/presentation/bloc/history_cubit.dart';
import 'package:zupa/features/history/presentation/models/form/history_form.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    final form = ReactiveHistoryForm.of(context);
    return Padding(
      padding: const .only(top: 8),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return Skeletonizer(
            enabled: state is Loading,
            child: ReactiveValueListenableBuilder<String>(
              formControl: form?.keywordControl,
              builder: (context, control, child) => AppTextField(
                hintText: t.parking.ticketSearch,
                borderRadius: 100,
                backgroundColor: colorScheme.surfaceContainerLow,
                prefixIcon: Symbols.search_rounded,
                suffix: InkWell(
                  child: Icon(
                    Symbols.filter_alt_rounded,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onTap: () => _showFilter(context, form),
                ),
                onChanged: (value) {
                  context.read<HistoryCubit>().refresh(
                    filter:
                        form?.model.toParams() ?? .initial(keyword: value),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _showFilter(BuildContext context, HistoryForm? formModel) {
    final colorScheme = AppColors.of(context);
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const .only(top: 24, bottom: 48, left: 24, right: 24),
        child: Column(
          spacing: 16,
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Center(
              child: Text(
                t.common.actions.filter,
                style: AppTextStyles.bodyLargeSemibold.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  t.common.info.time,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  t.common.actions.reset,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            AppDateTimePicker(
              type: .date,
              value: formModel?.timeControl.value,
              onChanged: (value) {
                formModel?.timeValueUpdate(value);
              },
            ),
            Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      t.vehicles.type,
                      style: AppTextStyles.bodyMediumSemibold.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      t.common.actions.reset,
                      style: AppTextStyles.bodyMediumSemibold.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                AppRadioGroup<VehicleTypeEntity>(
                  formControl: formModel?.typeControl,
                  items: vehicleTypes,
                  isVertical: true,
                  itemBuilder:
                      (context, item, isSelected, onSelect, radioButton) => Row(
                        spacing: 8,
                        children: [
                          ?radioButton,
                          Text(t['vehicles.${item.name}']),
                        ],
                      ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppButton(
                    color: .basic,
                    theme: .outline,
                    onPressed: () => context.router.pop(),
                    text: t.common.actions.cancel,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => context.router.pop(),
                    text: t.common.actions.apply,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      useRootNavigator: true,
    );
  }
}
