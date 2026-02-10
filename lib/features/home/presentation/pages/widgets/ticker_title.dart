import 'package:auto_route/auto_route.dart';
import 'package:dart_date/dart_date.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/popup/app_photo_view.dart';
import 'package:zupa/features/home/data/models/ticket.dart';
import 'package:zupa/gen/strings.g.dart';

class TicketTitle extends StatelessWidget {
  const TicketTitle({super.key, required this.ticket, this.enabled = true});

  final HomeTicket ticket;
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
            backgroundColor: ticket.gender == true
                ? colors.primary500
                : colors.error600,
            foregroundColor: Colors.white,
            icon: ticket.gender == true
                ? Icons.check_circle_outline
                : Icons.report_problem_outlined,
            label: ticket.gender == true ? t.reportRecovered : t.markAsLost,
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
              child: InkWell(
                onTap: () => AppPhotoView.showNetworkPhotoView(
                  context,
                  ticket.avatarPath ?? 'https://picsum.photos/750',
                ),
                child: ExtendedImage.network(
                  ticket.avatarPath ?? 'https://picsum.photos/50',
                  fit: .cover,
                  width: 50,
                  height: 50,
                  borderRadius: .circular(6),
                  shape: .rectangle,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    ticket.fullName ?? ticket.code,
                    style: AppTextStyles.heading6.copyWith(
                      color: colors.grey900,
                    ),
                  ),
                  Text(
                    ticket.lastUpdated.format('dd/MM/yyyy HH:mm'),
                    style: AppTextStyles.bodySmallSemibold.copyWith(
                      color: colors.grey500,
                    ),
                  ),
                ],
              ),
            ),
            if (ticket.gender == true)
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
