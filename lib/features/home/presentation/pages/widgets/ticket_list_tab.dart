import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Import Slidable
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart'
    hide Loading;
import 'package:zupa/features/home/presentation/bloc/ticket/home_ticket_cubit.dart';
import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/features/home/data/models/ticket.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/popup/app_photo_view.dart';
import 'package:zupa/gen/strings.g.dart';

class TicketListTab extends StatelessWidget {
  const TicketListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTicketCubit, HomeTicketState>(
      builder: (context, state) {
        final refreshController = RefreshController();
        final List<HomeTicket>? items = state.whenOrNull(
          loaded: (tickets, pageIndex) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
        );

        // Ensure Slidable doesn't interfere with Skeletonizer by checking loading state
        final isLoading = state is Loading;

        return Skeletonizer(
          enabled: isLoading,
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeHelper.getColor(context).white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: ThemeHelper.getColor(context).grey100,
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: SmartRefresher(
              enablePullDown: state is! LoadingMore,
              enablePullUp: state is! Refreshing,
              footer: CustomFooter(
                builder: (context, mode) {
                  Widget body;
                  switch (mode) {
                    case LoadStatus.idle:
                      body = Text(t.pullUpToLoad);
                    case LoadStatus.loading:
                      body = const CupertinoActivityIndicator();
                    case LoadStatus.failed:
                      body = Text(t.loadFailedPleaseRetry);
                    case LoadStatus.canLoading:
                      body = Text(t.releaseToLoadMore);
                    default:
                      body = Text(t.noMoreData);
                  }
                  return SizedBox(height: 55.0, child: Center(child: body));
                },
              ),
              controller: refreshController,
              onRefresh: () => context.read<HomeTicketCubit>().refresh(
                filter: context.read<HomeFilterState>().mapOrNull(
                  loaded: (s) => s.filter,
                ),
                onSuccess: refreshController.refreshCompleted,
                onFailed: refreshController.refreshFailed,
              ),
              onLoading: () => context.read<HomeTicketCubit>().loadMore(
                refreshController.loadComplete,
                refreshController.loadFailed,
                refreshController.loadNoData,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 0,
                  color: ThemeHelper.getColor(context).grey100,
                ),
                itemBuilder: (c, i) => Padding(
                  padding: EdgeInsets.only(top: i == 0 ? 16 : 0),
                  child: TicketTitle(
                    // Important: When using Slidable in a list, standard ValueKey helps performance
                    key: ValueKey(items?[i].id ?? 'skeleton_$i'),
                    ticket: items?[i] ??
                        HomeTicket(
                          id: 'Placeholder',
                          timeIn: DateTime.now(),
                          siteId: 'A much Longer placeholder',
                          type: vehicleTypes.first,
                        ),
                    enabled: !isLoading, // Disable sliding while loading skeleton
                  ),
                ),
                itemCount: items?.length ?? 10,
              ),
            ),
          ),
        );
      },
    );
  }
}

class TicketTitle extends StatelessWidget {
  const TicketTitle({
    super.key,
    required this.ticket,
    this.enabled = true,
  });

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
            backgroundColor: isRecoveredType ? colors.primary500 : colors.error600,
            foregroundColor: Colors.white,
            icon: isRecoveredType ? Icons.check_circle_outline : Icons.report_problem_outlined,
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () => AppPhotoView.showPhotoView(
                  context,
                  const NetworkImage('https://picsum.photos/750'),
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  child: Skeleton.replace(
                    height: 50,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/50',
                      // Added placeholders for better UX
                      placeholder: (context, url) => Container(color: colors.grey100),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Replaced spacing with MainAxisSize for safety if needed
                      children: [
                        Text(
                          ticket.id,
                          style: AppTextStyles.bodyLargeBold.copyWith(
                            color: colors.grey900,
                          ),
                        ),
                        const SizedBox(width: 8), // Replaced spacing: 8
                        if (isRecoveredType)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: colors.error200,
                              borderRadius: BorderRadius.circular(50),
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
                  Text(
                    DateTime.now().format('dd/MM/yyyy HH:mm'),
                    style: AppTextStyles.bodyMediumRegular.copyWith(
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