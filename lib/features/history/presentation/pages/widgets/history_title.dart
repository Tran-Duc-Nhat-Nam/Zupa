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
    final colorScheme = ThemeHelper.getColor(context);
    return AppCard(
      padding: .zero,
      decoration: .new(
        color: colorScheme.white,
        borderRadius: const .all(.circular(8)),
        border: .all(color: colorScheme.grey100),
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
                path: ticket.type?.iconPath ?? AppIcons.global,
                size: 24,
                color: colorScheme.grey700,
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: const .new(minHeight: 70),
              decoration: BoxDecoration(
                border: .symmetric(vertical: .new(color: colorScheme.grey100)),
              ),
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
                          color: colorScheme.grey900,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: .centerLeft,
                          child: ticket.id % 2 == 0
                              ? const AppIcon(
                                  path: AppIcons.userOctagon,
                                  size: 20,
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
                            color: colorScheme.grey900,
                          )
                        : AppTextStyles.bodyLargeRegular.copyWith(
                            fontStyle: .italic,
                            color: colorScheme.grey400,
                          ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Skeleton.replace(
                      width: 24,
                      height: 24,
                      child: AppIcon(
                        path: AppIcons.roundArrowDown,
                        size: 24,
                        color: colorScheme.success600,
                      ),
                    ),
                    Text(
                      ticket.receivedDate != null
                          ? DateTimeConverter.toShortTime(ticket.receivedDate!)
                          : '',
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
                      child: AppIcon(
                        path: AppIcons.roundArrowUp,
                        size: 24,
                        color: colorScheme.error600,
                      ),
                    ),
                    ticket.id % 2 == 0
                        ? Text(
                            DateTimeConverter.toShortTime(
                              ticket.timeOut ?? .now(),
                            ),
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: colorScheme.grey700,
                            ),
                          )
                        : Text(
                            '',
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: colorScheme.grey700,
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
