import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/converter/icon_converter.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';

class RevenueTitle extends StatelessWidget {
  const RevenueTitle({super.key, required this.revenue});

  final DailyRevenueEntity revenue;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return Container(
      clipBehavior: .antiAlias,
      decoration: const BoxDecoration(borderRadius: .all(Radius.circular(16))),
      child: ListTileTheme(
        contentPadding: .zero,
        dense: true,
        horizontalTitleGap: 0.0,
        minVerticalPadding: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
          backgroundColor: colorScheme.surfaceContainerLow,
          tilePadding: .zero,
          childrenPadding: .zero,
          minTileHeight: 20,
          showTrailingIcon: false,
          visualDensity: .compact,
          shape: const Border(),
          title: Container(
            clipBehavior: .antiAlias,
            decoration: BoxDecoration(
              borderRadius: const .all(.circular(6)),
              color: colorScheme.surfaceContainerHigh,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: .center,
                  decoration: BoxDecoration(
                    borderRadius: .circular(4),
                    color: colorScheme.primary,
                  ),
                  child: Text(
                    revenue.date.day.toString(),
                    style: AppTextStyles.bodyMediumSemibold.copyWith(
                      color: colorScheme.surface,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const .symmetric(horizontal: 10, vertical: 4),
                    decoration: const BoxDecoration(
                      borderRadius: .only(
                        bottomRight: .circular(8),
                        topRight: .circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            t.parking.pass(
                              n: revenue.totalPass,
                              count: revenue.totalPass,
                            ),
                            textAlign: .end,
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${NumberFormat.currency(decimalDigits: 0, symbol: '').format(revenue.totalRevenue)} VND',
                            textAlign: .end,
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          children: [
            Row(
              children: [
                Padding(
                  padding: const .all(4),
                  child: Skeleton.replace(
                    width: 24,
                    height: 24,
                    child: Icon(
                      const IconConverter().fromJson(
                            revenue.vehicleType?.icon ?? '',
                          ) ??
                          Symbols.globe_rounded,
                      size: 24,
                      color: colorScheme.success,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const .symmetric(horizontal: 10, vertical: 4),
                    decoration: const BoxDecoration(
                      borderRadius: .only(
                        bottomRight: .circular(16),
                        topRight: .circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: .center,
                            children: [
                              ...revenue.revenue.map(
                                (e) => Text(
                                  t['vehicles.${e.vehicleType.name}'] ??
                                      e.vehicleType.name,
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .end,
                            mainAxisAlignment: .center,
                            children: [
                              ...revenue.revenue.map(
                                (e) => Text(
                                  t.parking.pass(n: e.pass, count: e.pass),
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .end,
                            mainAxisAlignment: .center,
                            children: [
                              ...revenue.revenue.map(
                                (e) => Text(
                                  NumberFormat.currency(
                                    decimalDigits: 0,
                                    symbol: '',
                                  ).format(e.revenue),
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
