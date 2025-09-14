import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/icons.dart';
import '../../../common/styles/text_styles.dart';
import '../../../data/model/ticket/ticket.dart';
import '../../../helper/converter/date_time_converter.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/app_icon.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key, required this.ticket});
  final Ticket ticket;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: ThemeHelper.getColor(context).white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: ThemeHelper.getColor(context).grey100),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C0C0D0D),
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 16,
        children: [
          Column(
            children: [
              Skeleton.replace(
                width: 24,
                height: 24,
                child: AppIcon(
                  path: ticket.type.iconPath,
                  size: 24,
                  color: ThemeHelper.getColor(context).grey700,
                ),
              ),
              Text(
                context.tr(ticket.type.value),
                style: AppTextStyles.bodyMediumMedium.copyWith(
                  color: ThemeHelper.getColor(context).grey700,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: ThemeHelper.getColor(context).grey100,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Skeleton.replace(
                      width: 24,
                      height: 24,
                      child: AppIcon(
                        path: AppIcons.roundArrowUp,
                        size: 24,
                        color: ThemeHelper.getColor(context).error600,
                      ),
                    ),
                    Text(
                      ticket.timeOut != null
                          ? DateTimeConverter.toShortTime(ticket.timeOut!)
                          : 'N/A',
                      style: AppTextStyles.bodyMediumMedium.copyWith(
                        color: ThemeHelper.getColor(context).grey700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  ticket.id,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.bodyMediumMedium.copyWith(
                    color: ThemeHelper.getColor(context).grey700,
                  ),
                ),
                Text(
                  ticket.licensePlate ?? 'No license plate',
                  style: AppTextStyles.bodyLargeSemibold.copyWith(
                    color: ThemeHelper.getColor(context).grey900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
