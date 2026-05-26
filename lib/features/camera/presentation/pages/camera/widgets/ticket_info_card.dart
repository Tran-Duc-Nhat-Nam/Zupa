import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

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
    final colorScheme = context.colorScheme;
    return Container(
      width: .infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: .circular(8),
      ),
      child: Column(
        children: [
          Padding(padding: const .all(4), child: Text(licenseNumber ?? 'N/A')),
          Container(height: 1, width: .infinity, color: colorScheme.outline),
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
                              timeIn.format('dd/MM/yyyy hh:mm'),
                              style: AppTextStyles.bodyMediumMedium.copyWith(
                                color: colorScheme.success,
                              ),
                            ),
                            if (timeOut != null) ...[
                              Text(
                                timeOut!.format('dd/MM/yyyy hh:mm'),
                                style: AppTextStyles.bodyMediumMedium.copyWith(
                                  color: colorScheme.error,
                                ),
                              ),
                              Container(
                                height: 1,
                                margin: const .symmetric(vertical: 4),
                                width: .infinity,
                                color: colorScheme.surfaceContainerHighest,
                              ),
                              Text(
                                t.parking.totalTime(
                                  n: totalTime!,
                                  count: totalTime!,
                                ),
                                overflow: .fade,
                                style: AppTextStyles.bodyMediumMedium.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(color: colorScheme.outline),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const .symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              t[ticketType],
                              style: AppTextStyles.bodyMediumMedium.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: Intl.getCurrentLocale(),
                                symbol: '',
                              ).format(price),
                              style: AppTextStyles.bodyLargeSemibold.copyWith(
                                color: colorScheme.primary,
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
