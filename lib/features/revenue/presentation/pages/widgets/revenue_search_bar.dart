import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';

import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/gen/strings.g.dart';

class RevenueSearchBar extends StatelessWidget {
  const RevenueSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: .zero,
      elevation: 0, // Keep it flat inside the colored container
      color: ThemeHelper.getColor(context).primary100, // Light Brand Color
      shape: RoundedRectangleBorder(
        borderRadius: .circular(16), // Modern large curves
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
                Text(
                  t[DateTimeConverter.getMonthKey(DateTime.now().month)],
                  style: AppTextStyles.heading5.copyWith(
                    color: ThemeHelper.getColor(context).primary500,
                    fontWeight: .w600,
                  ),
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
                        radius: .circular(8),
                        icon: AppIcon(
                          path: AppIcons.filter,
                          size: 20,
                          color: ThemeHelper.getColor(context).white,
                        ),
                        onPressed: () => _buildFilter(context),
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
                  '${t.totalRevenue}:',
                  style: AppTextStyles.bodyLargeBold.copyWith(
                    // Very large text
                    fontWeight: .bold,
                    color: ThemeHelper.getColor(context).primary400,
                  ),
                ),
                Text(
                  "${NumberFormat.currency(decimalDigits: 0, symbol: '').format(1984000000)} VND",
                  style: AppTextStyles.bodyLargeBold.copyWith(
                    // Very large text
                    fontWeight: .bold,
                    color: ThemeHelper.getColor(context).primary400,
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

  Future<dynamic> _buildFilter(BuildContext context) {
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
                t.filter,
                style: AppTextStyles.bodySmallSemibold.copyWith(
                  color: ThemeHelper.getColor(context).grey600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  t.time,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: ThemeHelper.getColor(context).grey700,
                  ),
                ),
                Text(
                  t.reset,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: ThemeHelper.getColor(context).primary500,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                Text(t.date),
                const AppDateTimePicker(name: 'dateTime'),
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
                    text: t.cancel,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => context.pop(),
                    text: t.apply,
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
