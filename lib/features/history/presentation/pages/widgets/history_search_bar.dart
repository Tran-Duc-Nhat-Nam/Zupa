import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/core/widgets/app_radio_group.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart';
import 'package:zupa/features/history/presentation/models/form/history_form.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({
    super.key,
    required ValueNotifier<bool> isScrolledNotifier,
  }) : _isScrolledNotifier = isScrolledNotifier;
  final ValueNotifier<bool> _isScrolledNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isScrolledNotifier,
      builder: (context, isScrolled, child) {
        final backgroundColor = AppColors.of(context).surface;
        final showWhiteBackground = isScrolled;

        return AnimatedContainer(
          duration: const .new(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: showWhiteBackground
              ? const .symmetric(vertical: 10)
              : const .only(top: 10),
          decoration: BoxDecoration(
            color: showWhiteBackground
                ? backgroundColor
                : backgroundColor.withAlpha(0),
            boxShadow: [
              BoxShadow(
                color: showWhiteBackground
                    ? Colors.black.withAlpha(12)
                    : Colors.transparent,
                blurRadius: 4,
                offset: const .new(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const .symmetric(horizontal: 24, vertical: 6),
            child: BlocBuilder<HistoryFilterCubit, HistoryFilterState>(
              builder: (context, state) {
                final formModel = context.read<HistoryFilterCubit>().formModel;
                return Skeletonizer(
                  enabled: state is Loading,
                  child: AppTextField(
                    formControl: formModel.keywordControl,
                    hintText: t.parking.ticketSearch,
                    borderRadius: 100,
                    hasBorder: false,
                    backgroundColor: AppColors.of(context).surfaceContainerLow,
                    prefixIcon: Symbols.search_rounded,
                    suffix: InkWell(
                      child: Icon(
                        Symbols.filter_alt_rounded,
                        size: 20,
                        color: AppColors.of(context).onSurfaceVariant,
                      ),
                      onTap: () => _showFilter(context, formModel),
                    ),
                    onChanged: (value) =>
                        context.read<HistoryFilterCubit>().update(),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showFilter(BuildContext context, HistoryForm formModel) {
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
                style: AppTextStyles.bodySmallSemibold.copyWith(
                  color: AppColors.of(context).onSurfaceVariant,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  t.common.info.time,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: AppColors.of(context).onSurfaceVariant,
                  ),
                ),
                Text(
                  t.common.actions.reset,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: AppColors.of(context).primary,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                Text(t.common.info.date),
                AppDateTimePicker(formControl: formModel.timeControl),
              ],
            ),
            const Divider(),
            Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      t.vehicles.type,
                      style: AppTextStyles.bodyMediumSemibold.copyWith(
                        color: AppColors.of(context).onSurfaceVariant,
                      ),
                    ),
                    Text(
                      t.common.actions.reset,
                      style: AppTextStyles.bodyMediumSemibold.copyWith(
                        color: AppColors.of(context).primary,
                      ),
                    ),
                  ],
                ),
                AppRadioGroup<VehicleTypeEntity>(
                  formControl: formModel.typeControl,
                  items: vehicleTypes,
                ),
              ],
            ),
            const Divider(),
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
