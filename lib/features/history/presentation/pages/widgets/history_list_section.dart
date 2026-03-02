import 'package:flutter/material.dart';

import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_title.dart';


class HistoryListSection extends StatelessWidget {
  const HistoryListSection({super.key, required this.dailyHistory});

  final HistoryTicket dailyHistory;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          DateTimeConverter.toDate(dailyHistory.date),
          style: AppTextStyles.bodyMediumSemibold.copyWith(
            color: ThemeHelper.getColor(context).grey900,
          ),
        ),
        ...dailyHistory.tickets.map((ticket) => HistoryTitle(ticket: ticket)),
      ],
    );
  }
}
