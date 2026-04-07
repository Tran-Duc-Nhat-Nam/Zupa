import 'package:flutter/material.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_title.dart';

class HistoryListSection extends StatelessWidget {
  const HistoryListSection({super.key, this.tickets = const []});

  final List<HistoryTicketEntity> tickets;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Container(
          padding: const .all(8),
          decoration: BoxDecoration(
            borderRadius: .circular(100),
            color: colorScheme.secondaryContainer,
          ),
          child: Text(
            DateTimeConverter.toDate(.now()),
            style: AppTextStyles.bodyMediumSemibold.copyWith(
              color: colorScheme.onSecondaryContainer,
            ),
          ),
        ),
        ...tickets.map((ticket) => HistoryTitle(ticket: ticket)),
      ],
    );
  }
}
