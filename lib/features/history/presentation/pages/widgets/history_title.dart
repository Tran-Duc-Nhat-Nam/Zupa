import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_icon.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key, required this.ticket});
  final HistoryTicket ticket;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: .zero,
      decoration: .new(
        color: ThemeHelper.getColor(context).white,
        borderRadius: const .all(.circular(8)),
        border: .all(color: ThemeHelper.getColor(context).grey100),
        boxShadow: const [
          .new(color: .new(0x0C0C0D0D), offset: .new(0, 1), blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            padding: const .all(16),
            child: Skeleton.replace(
              width: 24,
              height: 24,
              child: AppIcon(
                path: ticket.type.iconPath,
                size: 24,
                color: ThemeHelper.getColor(context).grey700,
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: const .new(minHeight: 70),
              decoration: BoxDecoration(
                border: .symmetric(
                  vertical: .new(color: ThemeHelper.getColor(context).grey100),
                ),
              ),
              padding: const .symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .center,
                    spacing: 4,
                    children: [
                      Text(
                        ticket.id.length % 2 == 0
                            ? ticket.id
                            : context.tr('passenger'),
                        overflow: .ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.bodyMediumMedium.copyWith(
                          color: ThemeHelper.getColor(context).grey900,
                        ),
                      ),
                      if (ticket.id.length % 2 == 0)
                        const AppIcon(path: AppIcons.userOctagon, size: 20),
                    ],
                  ),
                  Text(
                    ticket.id.length % 2 == 0
                        ? 'ABC-789-4004-ZYX-9A8B'
                        : 'No license plate',
                    textAlign: .center,
                    style: ticket.id.length % 2 == 0
                        ? GoogleFonts.robotoMono().copyWith(
                            fontWeight: .w600,
                            color: ThemeHelper.getColor(context).grey900,
                          )
                        : AppTextStyles.bodyLargeRegular.copyWith(
                            fontStyle: .italic,
                            color: ThemeHelper.getColor(context).grey400,
                          ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Row(
                  children: [
                    Skeleton.replace(
                      width: 24,
                      height: 24,
                      child: AppIcon(
                        path: AppIcons.roundArrowDown,
                        size: 24,
                        color: ThemeHelper.getColor(context).success600,
                      ),
                    ),
                    Text(
                      DateTimeConverter.toShortTime(ticket.timeIn),
                      style: AppTextStyles.bodyMediumMedium.copyWith(
                        color: ThemeHelper.getColor(context).grey700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (ticket.id.length % 2 == 0)
                      Skeleton.replace(
                        width: 24,
                        height: 24,
                        child: AppIcon(
                          path: AppIcons.roundArrowUp,
                          size: 24,
                          color: ThemeHelper.getColor(context).error600,
                        ),
                      ),
                    ticket.id.length % 2 == 0
                        ? Text(
                            DateTimeConverter.toShortTime(
                              ticket.timeOut ?? .now(),
                            ),
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: ThemeHelper.getColor(context).grey700,
                            ),
                          )
                        : Text(
                            '',
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: ThemeHelper.getColor(context).grey700,
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
