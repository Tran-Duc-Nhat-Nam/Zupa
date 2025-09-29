import 'package:flutter/material.dart';

import '../../../helper/theme/theme_helper.dart';
import '../../../data/model/ticket/ticket.dart';
import '../../../helper/converter/date_time_converter.dart';
import '../../../common/styles/text_styles.dart';
import 'history_title.dart';

class HistoryListSection extends StatelessWidget {
  const HistoryListSection({
    super.key,
    this.tickets = const [],
  });

  final List<Ticket> tickets;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          DateTimeConverter.toDate(DateTime.now()),
          style: AppTextStyles.bodyMediumSemibold
              .copyWith(color: ThemeHelper.getColor(context).grey900),
        ),
        ...tickets.map(
          (ticket) => HistoryTitle(ticket: ticket),
        )
      ],
    );
  }
}
