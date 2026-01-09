import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../helper/converter/date_time_converter.dart';
import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/icons.dart';
import '../../../common/styles/text_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_date_time_picker.dart';
import '../../../widgets/app_icon.dart';

class RevenueSearchBar extends StatelessWidget {
  const RevenueSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const .all(0),
      elevation: 0, // Keep it flat inside the colored container
      color: ThemeHelper.getColor(context).primary100, // Light Brand Color
      shape: RoundedRectangleBorder(
        borderRadius: .circular(16), // Modern large curves
      ),
      child: Padding(
        padding: const .symmetric(vertical: 16, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(
                      DateTimeConverter.getMonthKey(DateTime.now().month),
                    ),
                  style: AppTextStyles.heading5.copyWith(
                    color: ThemeHelper.getColor(context).primary500,
                    fontWeight: .w600
                  ),
                ),
                Container(
                  clipBehavior: .antiAlias,
                  decoration: BoxDecoration(borderRadius: .circular(8)),
                  child: Skeleton.replace(
                    width: 44,
                    height: 44,
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
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Padding(
                                padding: const .only(
                                  top: 24,
                                  bottom: 48,
                                  left: 24,
                                  right: 24,
                                ),
                                child: Column(
                                  spacing: 16,
                                  mainAxisSize: .min,
                                  crossAxisAlignment: .start,
                                  children: [
                                    Center(
                                      child: Text(
                                        context.tr('filter'),
                                        style: AppTextStyles.bodySmallSemibold.copyWith(
                                          color: ThemeHelper.getColor(context).grey600,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: .spaceBetween,
                                      children: [
                                        Text(
                                          context.tr('time'),
                                          style: AppTextStyles.bodyMediumSemibold
                                              .copyWith(
                                            color: ThemeHelper.getColor(
                                              context,
                                            ).grey700,
                                          ),
                                        ),
                                        Text(
                                          context.tr('reset'),
                                          style: AppTextStyles.bodyMediumSemibold
                                              .copyWith(
                                            color: ThemeHelper.getColor(
                                              context,
                                            ).primary500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      spacing: 12,
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(context.tr('date')),
                                        const AppDateTimePicker(name: 'dateTime'),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      spacing: 16,
                                      children: [
                                        Expanded(
                                          child: AppButton(
                                            color: AppButtonColor.basic,
                                            theme: AppButtonTheme.outline,
                                            onPressed: () => context.pop(),
                                            text: context.tr('cancel'),
                                          ),
                                        ),
                                        Expanded(
                                          child: AppButton(
                                            onPressed: () => context.pop(),
                                            text: context.tr('apply'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              useRootNavigator: true,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Text(
                  '${context.tr('totalRevenue')}:',
                  style: AppTextStyles.bodyLargeBold.copyWith( // Very large text
                    fontWeight: FontWeight.bold,
                    color: ThemeHelper.getColor(context).primary400,
                  ),
                ),
                Text(
                  "${NumberFormat.currency(
                    decimalDigits: 0,
                    symbol: '',
                  ).format(1984000000)} VND",
                  style: AppTextStyles.bodyLargeBold.copyWith( // Very large text
                    fontWeight: FontWeight.bold,
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
}
