import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              borderRadius: const .all(.circular(16)),
              color: colorScheme.surfaceContainerHigh,
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  alignment: .center,
                  decoration: BoxDecoration(
                    borderRadius: .circular(16),
                    color: colorScheme.primaryContainer,
                  ),
                  child: Text(
                    revenue.date.day.toString(),
                    style: AppTextStyles.bodyLargeSemibold.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const .symmetric(horizontal: 10, vertical: 16),
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
                            spacing: 4,
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
                            spacing: 4,
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
                            spacing: 4,
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
