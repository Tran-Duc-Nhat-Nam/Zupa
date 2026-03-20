import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/converter/icon_converter.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key, required this.ticket});
  final HistoryTicketEntity ticket;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return AppCard(
      padding: .zero,
      decoration: .new(
        color: colorScheme.surfaceContainer,
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
                const IconConverter().fromJson(ticket.type.icon) ??
                    Symbols.globe_rounded,
                size: 24,
                color: colorScheme.primary,
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
                        ticket.id.toString(),
                        overflow: .ellipsis,
                        maxLines: 1,
                        textAlign: .center,
                        style: AppTextStyles.bodyMediumMedium.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: .centerLeft,
                          child: ticket.id % 2 == 0
                              ? Icon(
                                  Symbols.account_box_rounded,
                                  size: 20,
                                  color: colorScheme.primary,
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    ticket.code,
                    textAlign: .center,
                    style: !ticket.isFlagError
                        ? GoogleFonts.robotoMono().copyWith(
                            fontWeight: .w600,
                            color: colorScheme.onSurface,
                          )
                        : AppTextStyles.bodyLargeRegular.copyWith(
                            fontStyle: .italic,
                            color: colorScheme.outline,
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
                        color: colorScheme.success,
                      ),
                    ),
                    Text(
                      DateTimeConverter.toShortTime(ticket.timeIn),
                      style: AppTextStyles.bodyMediumMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
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
                        color: colorScheme.error,
                      ),
                    ),
                    ticket.id % 2 == 0
                        ? Text(
                            DateTimeConverter.toShortTime(
                              ticket.timeOut ?? .now(),
                            ),
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          )
                        : Text(
                            '',
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
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
