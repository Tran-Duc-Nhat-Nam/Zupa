import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/data/models/ticket/ticket.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/widgets/app_card.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key, required this.ticket});
  final Ticket ticket;
  @override
  Widget build(BuildContext context) {
    final colorScheme = ThemeHelper.getColor(context);
    return AppCard(
      padding: .zero,
      decoration: .new(
        color: colorScheme.primary100.withAlpha(155),
        borderRadius: const .all(.circular(28)),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            padding: const .all(16),
            child: Skeleton.replace(
              width: 24,
              height: 24,
              child: Icon(
                ticket.vehicle.type.icon,
                size: 24,
                color: colorScheme.primary400,
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: const .new(minHeight: 70),
              padding: const .symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .center,
                    spacing: 4,
                    children: [
                      const Expanded(child: SizedBox()),
                      Text(
                        ticket.vehicle.plateNumber ?? ticket.id,
                        overflow: .ellipsis,
                        maxLines: 1,
                        textAlign: .center,
                        style: AppTextStyles.bodyMediumMedium.copyWith(
                          color: colorScheme.grey900,
                        ),
                      ),
                      const Expanded(child: SizedBox(),
                      ),
                    ],
                  ),
                  Text(
                    ticket.id,
                    textAlign: .center,
                    style: GoogleFonts.robotoMono().copyWith(
                      fontWeight: .w600,
                      color: colorScheme.grey900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Skeleton.replace(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Symbols.arrow_downward_rounded,
                        size: 24,
                        color: colorScheme.success600,
                      ),
                    ),
                    Text(
                      DateTimeConverter.toShortTime(ticket.entryTime),
                      style: AppTextStyles.bodyMediumMedium.copyWith(
                        color: colorScheme.grey700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skeleton.replace(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Symbols.arrow_upward_rounded,
                        size: 24,
                        color: colorScheme.error600,
                      ),
                    ),
                    ticket.exitTime != null
                        ? Text(
                            DateTimeConverter.toShortTime(
                              ticket.exitTime!,
                            ),
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: colorScheme.grey700,
                            ),
                          )
                        : const Text(''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
