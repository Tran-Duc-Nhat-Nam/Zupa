import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart';

class RevenueSearchBar extends StatelessWidget {
  const RevenueSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return Card(
      margin: .zero,
      elevation: 0,
      // Keep it flat inside the colored container
      color: colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(28), // Modern large curves
      ),
      child: Padding(
        padding: const .symmetric(vertical: 16, horizontal: 24),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Symbols.calendar_clock_rounded,
                      size: 24,
                      color: colorScheme.secondary,
                    ),
                    Text(
                      t['common.months.${DateTimeConverter.getMonthKey(DateTime.now().month)}'],
                      style: AppTextStyles.titleLargeBold.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Container(
                  clipBehavior: .antiAlias,
                  decoration: BoxDecoration(borderRadius: .circular(8)),
                  child: SizedBox(
                    width: 44,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: AppButton(
                        fitContent: true,
                        padding: const .all(8),
                        icon: Symbols.filter_alt_rounded,
                        onPressed: () => _buildFilter(context, colorScheme),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Text(
                  '${t.parking.totalRevenue}:',
                  style: AppTextStyles.bodyLargeBold.copyWith(
                    // Very large text
                    fontWeight: .bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  "${NumberFormat.currency(decimalDigits: 0, symbol: '').format(1984000000)} VND",
                  style: AppTextStyles.bodyLargeBold.copyWith(
                    // Very large text
                    fontWeight: .bold,
                    color: colorScheme.primary,
                    letterSpacing: -0.5, // Tighten numbers slightly
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildFilter(BuildContext context, AppColors colorScheme) {
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
            Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                Text(t.common.info.date),
                AppDateTimePicker(
                  formControl: context
                      .read<RevenueFilterCubit>()
                      .formModel
                      .toDateControl,
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
                    onPressed: () => context.pop(),
                    text: t.common.actions.cancel,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => context.pop(),
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
