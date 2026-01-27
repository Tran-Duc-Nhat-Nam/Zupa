import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/routes.dart';
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
    final isRecoveredType = ticket.id.length % 2 == 0;

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
            onPressed: (context) => context.pushNamed(AppRoutes.checkIn.name),
            backgroundColor: isRecoveredType
                ? colors.primary500
                : colors.error600,
            foregroundColor: Colors.white,
            icon: isRecoveredType
                ? Icons.check_circle_outline
                : Icons.report_problem_outlined,
            label: isRecoveredType ? t.reportRecovered : t.markAsLost,
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
              context.pushNamed(AppRoutes.checkIn.name, extra: true);
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
                onTap: () => AppPhotoView.showPhotoView(
                  context,
                  const NetworkImage('https://picsum.photos/750'),
                ),
                child: Container(
                  clipBehavior: .antiAlias,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: .circular(16)),
                  child: Skeleton.replace(
                    height: 50,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/50',
                      placeholder: (context, url) =>
                          Container(color: colors.grey100),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  Row(
                    mainAxisSize: .min,
                    spacing: 8,
                    children: [
                      Text(
                        ticket.id,
                        style: AppTextStyles.heading6.copyWith(
                          color: colors.grey900,
                        ),
                      ),
                      if (isRecoveredType)
                        Container(
                          padding: const .symmetric(
                            vertical: 2,
                            horizontal: 16,
                          ),
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
                  Text(
                    DateTime.now().format('dd/MM/yyyy HH:mm'),
                    style: AppTextStyles.bodySmallSemibold.copyWith(
                      color: colors.grey500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}