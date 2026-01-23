import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/gen/strings.g.dart';

class TicketInfoCard extends StatelessWidget {
  const TicketInfoCard({
    super.key,
    this.licenseNumber,
    required this.ticketType,
    required this.timeIn,
    this.timeOut,
    this.totalTime,
    required this.price,
  });

  final String? licenseNumber;
  final String ticketType;
  final DateTime timeIn;
  final DateTime? timeOut;
  final int? totalTime;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      decoration: BoxDecoration(
        color: ThemeHelper.getColor(context).white,
        borderRadius: .circular(8),
      ),
      child: Column(
        children: [
          Padding(padding: const .all(4), child: Text(licenseNumber ?? 'N/A')),
          Container(
            height: 1,
            width: .infinity,
            color: ThemeHelper.getColor(context).grey300,
          ),
          Expanded(
            child: Padding(
              padding: const .symmetric(vertical: 6),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const .symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: .start,
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              Jiffy.parseFromDateTime(
                                timeIn,
                              ).format(pattern: 'dd/MM/yyyy hh:mm'),
                              style: AppTextStyles.bodyMediumMedium.copyWith(
                                color: ThemeHelper.getColor(context).success600,
                              ),
                            ),
                            if (timeOut != null) ...[
                              Text(
                                Jiffy.parseFromDateTime(
                                  timeOut!,
                                ).format(pattern: 'dd/MM/yyyy hh:mm'),
                                style: AppTextStyles.bodyMediumMedium.copyWith(
                                  color: ThemeHelper.getColor(context).error600,
                                ),
                              ),
                              Container(
                                height: 1,
                                margin: const .symmetric(vertical: 4),
                                width: .infinity,
                                color: ThemeHelper.getColor(context).grey200,
                              ),
                              Text(
                                  Translations.of(context).totalTime(n: totalTime!),
                                overflow: .fade,
                                style: AppTextStyles.bodyMediumMedium.copyWith(
                                  color: ThemeHelper.getColor(context).grey700,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: ThemeHelper.getColor(context).grey300,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const .symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
    Translations.of(context)[ticketType],
                              style: AppTextStyles.bodyMediumMedium.copyWith(
                                color: ThemeHelper.getColor(context).grey700,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: Intl.getCurrentLocale(),
                                symbol: '',
                              ).format(price),
                              style: AppTextStyles.bodyLargeSemibold.copyWith(
                                color: ThemeHelper.getColor(context).primary500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
