// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:auto_route/auto_route.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zupa/core/widgets/app_avatar.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

class TicketTitle extends StatelessWidget {
  const TicketTitle({
    super.key,
    required this.ticket,
    this.enabled = true,
    this.isFirst = false,
    this.isLast = false,
  });

  final HomeTicketEntity ticket;
  final bool enabled;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Slidable(
      enabled: enabled,
      startActionPane: .new(
        motion: const StretchMotion(),
        extentRatio: 0.35,
        children: [
          SlidableAction(
            onPressed: (context) => context.pushRoute(CheckInRoute()),
            backgroundColor: ticket.isFlagError ? colors.primary : colors.error,
            foregroundColor: colors.surface,
            borderRadius: const .all(.circular(16)),
            icon: ticket.isFlagError
                ? Symbols.check_circle_outline_rounded
                : Symbols.report_problem_rounded,
            label: ticket.isFlagError
                ? t.parking.reportRecovered
                : t.parking.markAsLost,
          ),
        ],
      ),

      // End Action Pane (Right side - was trailingActions)
      endActionPane: .new(
        motion: const StretchMotion(),
        extentRatio: 0.35,
        children: [
          SlidableAction(
            onPressed: (context) =>
                context.pushRoute(CheckInRoute(isCheckOut: true)),
            backgroundColor: colors.success,
            foregroundColor: colors.surface,
            borderRadius: const .all(.circular(16)),
            icon: Symbols.logout_rounded,
            label: t.parking.allowOut,
          ),
        ],
      ),

      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceContainerHigh,
          borderRadius: .vertical(
            top: .circular(isFirst ? 16 : 16),
            bottom: .circular(isLast ? 16 : 16),
          ),
        ),
        padding: const .symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Padding(
              padding: const .only(right: 12),
              child: AppAvatarWidget(imageUrl: ticket.imageUrl),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    ticket.code,
                    style: AppTextStyles.titleMediumBold.copyWith(
                      color: colors.onSurface,
                    ),
                  ),
                  Text(
                    ticket.timeIn.format('dd/MM/yyyy HH:mm'),
                    style: AppTextStyles.bodySmallSemibold.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (ticket.isFlagError == true)
              Container(
                padding: const .symmetric(vertical: 2, horizontal: 16),
                decoration: BoxDecoration(
                  color: colors.error,
                  borderRadius: .circular(50),
                ),
                child: Text(
                  t.parking.lost,
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: colors.onError,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
