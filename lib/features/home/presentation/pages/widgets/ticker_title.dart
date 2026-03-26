// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:auto_route/auto_route.dart';
import 'package:dart_date/dart_date.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/popup/app_photo_view.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

class TicketTitle extends StatelessWidget {
  const TicketTitle({super.key, required this.ticket, this.enabled = true});

  final HomeTicketEntity ticket;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Slidable(
      enabled: enabled,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.35,
        children: [
          SlidableAction(
            onPressed: (context) => context.pushRoute(CheckInRoute()),
            backgroundColor: ticket.isFlagError == true
                ? colors.primary
                : colors.error,
            foregroundColor: colors.surface,
            icon: ticket.isFlagError == true
                ? Symbols.check_circle_outline_rounded
                : Symbols.report_problem_rounded,
            label: ticket.isFlagError == true
                ? t.parking.reportRecovered
                : t.parking.markAsLost,
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
            backgroundColor: colors.error,
            foregroundColor: colors.surface,
            icon: Symbols.logout_rounded,
            label: t.parking.allowOut,
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
                onTap: () =>
                    AppPhotoView.showNetworkPhotoView(context, ticket.imageUrl),
                child: ExtendedImage.network(
                  ticket.imageUrl,
                  fit: .cover,
                  width: 50,
                  height: 50,
                  borderRadius: .circular(6),
                  shape: .rectangle,
                  loadStateChanged: (state) => switch (state) {
                    LoadState.loading =>
                      LoadingAnimationWidget.horizontalRotatingDots(
                        color: colors.primary,
                        size: 35,
                      ),
                    LoadState.completed => state.completedWidget,
                    _ => Icon(
                      Symbols.error_rounded,
                      color: colors.error,
                      size: 35,
                    ),
                  },
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    ticket.code,
                    style: AppTextStyles.heading6.copyWith(
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
