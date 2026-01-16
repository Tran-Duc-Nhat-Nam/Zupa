import 'package:flutter/material.dart';

import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/helper/converter/date_time_converter.dart';
import 'package:zupa/common/styles/text_styles.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_title.dart';

class HistoryListSection extends StatelessWidget {
  const HistoryListSection({super.key, this.tickets = const []});

  final List<HistoryTicket> tickets;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        Text(
          DateTimeConverter.toDate(.now()),
          style: AppTextStyles.bodyMediumSemibold.copyWith(
            color: ThemeHelper.getColor(context).grey900,
          ),
        ),
        ...tickets.map((ticket) => HistoryTitle(ticket: ticket)),
      ],
    );
  }
}
