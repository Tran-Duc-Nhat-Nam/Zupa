import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../bloc/home/ticket/home_ticket_cubit.dart';
import '../../../common/constants/routes.dart';
import '../../../common/constants/vehicle_types.dart';
import '../../../common/styles/icons.dart';
import '../../../data/model/ticket/ticket.dart';
import '../../../widgets/app_icon.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/text_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/popup/app_photo_view.dart';
import 'package:jiffy/jiffy.dart';

class TicketListTab extends StatelessWidget {
  const TicketListTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTicketCubit, HomeTicketState>(
      builder: (context, state) {
        final refreshController = RefreshController();
        final List<Ticket>? items = state.whenOrNull(
          loaded: (tickets, pageIndex) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
        );
        return Skeletonizer(
          enabled: state is Loading,
          child: Container(
            clipBehavior: .antiAlias,
            margin: const .symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeHelper.getColor(context).white,
              borderRadius: const .vertical(top: .circular(16)),
              boxShadow: [
                .new(
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
                    case .idle:
                      body = Text(context.tr('pullUpToLoad'));
                    case .loading:
                      body = const CupertinoActivityIndicator();
                    case .failed:
                      body = Text(context.tr('loadFailedPleaseRetry'));
                    case .canLoading:
                      body = Text(context.tr('releaseToLoadMore'));
                    default:
                      body = Text(context.tr('noMoreData'));
                  }
                  return SizedBox(height: 55.0, child: Center(child: body));
                },
              ),
              controller: refreshController,
              onRefresh: () => context.read<HomeTicketCubit>().refresh(
                context,
                refreshController.refreshCompleted,
                refreshController.refreshFailed,
              ),
              onLoading: () => context.read<HomeTicketCubit>().loadMore(
                context,
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
                  padding: .only(top: i == 0 ? 16 : 0),
                  child: TicketTitle(
                    ticket:
                        items?[i] ??
                        Ticket(
                          id: 'Placeholder',
                          timeIn: .now(),
                          siteId: 'A much Longer placeholder',
                          type: vehicleTypes.first,
                        ),
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
  TicketTitle({super.key, required this.ticket});

  final Ticket ticket;
  final controller = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: GlobalKey(),
      controller: controller,
      backgroundColor: ThemeHelper.getColor(context).white,
      fullSwipeFactor: 0.5,
      leadingActions: [
        SwipeAction(
          onTap: (CompletionHandler handler) =>
              context.pushNamed(AppRoutes.checkIn),
          title: context.tr(
            ticket.id.length % 2 == 0 ? 'reportRecovered' : 'markAsLost',
          ),
          widthSpace: 180,
          color: ticket.id.length % 2 == 0
              ? ThemeHelper.getColor(context).primary500
              : ThemeHelper.getColor(context).error600,
        ),
      ],
      trailingActions: [
        SwipeAction(
          performsFirstActionWithFullSwipe: true,
          title: context.tr('allowOut'),
          onTap: (CompletionHandler handler) {
            controller.closeAllOpenCell();
            context.pushNamed(AppRoutes.checkIn, extra: true);
          },
          color: ThemeHelper.getColor(context).error600,
        ),
      ],
      child: Padding(
        padding: const .symmetric(vertical: 8, horizontal: 24),
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
                  decoration: BoxDecoration(borderRadius: .circular(6)),
                  child: Skeleton.replace(
                    height: 50,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/50',
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
                  SizedBox(
                    height: 24,
                    child: Row(
                      spacing: 8,
                      children: [
                        Text(
                          ticket.id,
                          style: AppTextStyles.bodyLargeBold.copyWith(
                            color: ThemeHelper.getColor(context).grey1000,
                          ),
                        ),
                        if (ticket.id.length % 2 == 0)
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16,),
                            decoration: BoxDecoration(
                              color: ThemeHelper.getColor(context).error200,
                              borderRadius: .circular(50),
                            ),
                            child: Text(
                              context.tr('lost'),
                              style: AppTextStyles.bodySmallSemibold.copyWith(
                                color: ThemeHelper.getColor(context).error600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    Jiffy.now().format(pattern: 'dd/MM/yyyy HH:mm'),
                    style: AppTextStyles.bodyMediumRegular.copyWith(
                      color: ThemeHelper.getColor(context).grey500,
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
