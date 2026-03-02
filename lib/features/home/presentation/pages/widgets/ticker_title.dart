import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/data/models/ticket/ticket.dart';
import 'package:zupa/gen/strings.g.dart';

class TicketTitle extends StatelessWidget {
  const TicketTitle({super.key, required this.ticket, this.enabled = true});

  final Ticket ticket;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.getColor(context);

    return Slidable(
      // Enable/Disable sliding based on skeleton state
      enabled: enabled,

      // Start Action Pane (Left side - was leadingActions)
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // Check 0.5 equivalent extent ratio if you need exact width control,
        // but Slidable calculates based on children count usually.
        extentRatio: 0.35,
        children: [
          SlidableAction(
            onPressed: (context) => context.pushRoute(CheckInRoute()),
            backgroundColor: colors.primary500,
            foregroundColor: Colors.white,
            icon: Icons.check_circle_outline,
            label: t.reportRecovered,
          ),
        ],
      ),

      // End Action Pane (Right side - was trailingActions)
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (context) {
              // Slidable auto-closes, so we just navigate
              context.pushRoute(CheckInRoute(isCheckOut: true));
            },
            backgroundColor: colors.error600,
            foregroundColor: Colors.white,
            icon: Icons.logout,
            label: t.allowOut,
          ),
        ],
      ),

      child: Padding(
        padding: const .symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Padding(
              padding: const .only(right: 12),
              child: Container(
                  width: 50,
                  height: 50,
                decoration: BoxDecoration(
                  color: colors.primary100,
                  borderRadius: .circular(6),
                ),
                child: Icon(ticket.vehicle.type.icon, color: colors.primary400),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    ticket.vehicle.plateNumber ?? ticket.id,
                    style: AppTextStyles.heading6.copyWith(
                      color: colors.grey900,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm').format(ticket.entryTime),
                    style: AppTextStyles.bodySmallSemibold.copyWith(
                      color: colors.grey500,
                    ),
                  ),
                ],
              ),
            ),
            if (ticket.status == 'lost')
              Container(
                padding: const .symmetric(vertical: 2, horizontal: 16),
                decoration: BoxDecoration(
                  color: colors.error200,
                  borderRadius: .circular(50),
                ),
                child: Text(
                  t.lost,
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: colors.error600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
