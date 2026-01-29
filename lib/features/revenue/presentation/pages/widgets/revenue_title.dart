import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue.dart';
import 'package:zupa/gen/strings.g.dart';

class RevenueTitle extends StatelessWidget {
  const RevenueTitle({super.key, required this.revenue});

  final DailyRevenue revenue;

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: ThemeHelper.getColor(
            context,
          ).primary50.withAlpha(155),
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
              color: ThemeHelper.getColor(context).primary100.withAlpha(155),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: .center,
                  decoration: BoxDecoration(
                    borderRadius: .circular(4),
                    color: ThemeHelper.getColor(context).primary400,
                  ),
                  child: Text(
                    revenue.date?.day.toString() ?? '36',
                    style: AppTextStyles.bodyMediumSemibold.copyWith(
                      color: ThemeHelper.getColor(context).white,
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
                            t.pass(n: revenue.totalPass),
                            textAlign: .end,
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: ThemeHelper.getColor(context).grey900,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${NumberFormat.currency(decimalDigits: 0, symbol: '').format(revenue.totalRevenue)} VND',
                            textAlign: .end,
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: ThemeHelper.getColor(context).grey900,
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
                    child: AppIcon(
                      path: revenue.vehicleType?.iconPath ?? '',
                      size: 24,
                      color: ThemeHelper.getColor(context).success600,
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
                                  t[e.vehicleType.name],
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: ThemeHelper.getColor(
                                          context,
                                        ).grey700,
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
                                  t.pass(n: e.pass),
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: ThemeHelper.getColor(
                                          context,
                                        ).grey700,
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
                                        color: ThemeHelper.getColor(
                                          context,
                                        ).grey700,
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
