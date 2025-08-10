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
        final _refreshController = RefreshController();
        final List<Ticket>? items = state.whenOrNull(
          loaded: (tickets, pageIndex) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
        );
        return Skeletonizer(
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeHelper.getColor(context).white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
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
                  if (mode == LoadStatus.idle) {
                    body = Text(context.tr('pullUpToLoad'));
                  } else if (mode == LoadStatus.loading) {
                    body = const CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text(context.tr('loadFailedPleaseRetry'));
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text(context.tr('releaseToLoadMore'));
                  } else {
                    body = Text(context.tr('noMoreData'));
                  }
                  return SizedBox(height: 55.0, child: Center(child: body));
                },
              ),
              controller: _refreshController,
              onRefresh: () => context.read<HomeTicketCubit>().refresh(
                context,
                _refreshController.refreshCompleted,
                _refreshController.refreshFailed,
              ),
              onLoading: () => context.read<HomeTicketCubit>().loadMore(
                context,
                _refreshController.loadComplete,
                _refreshController.loadFailed,
                _refreshController.loadNoData,
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
                    ticket:
                        items?[i] ??
                        Ticket(
                          id: 'Placeholder',
                          timeIn: DateTime.now(),
                          siteId: 'A much Longer placeholder',
                          type: vehicleTypes.first,
                        ),
                  ),
                ),
                itemCount: items?.length ?? 10,
              ),
            ),
          ),
          enabled: state is Loading,
        );
      },
    );
  }
}

class TicketTitle extends StatelessWidget {
  TicketTitle({super.key, required this.ticket});

  final Ticket ticket;
  final SwipeActionController controller = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: GlobalKey(),
      controller: controller,
      backgroundColor: ThemeHelper.getColor(context).white,
      fullSwipeFactor: 0.5,
      leadingActions: [
        SwipeAction(
          onTap: (CompletionHandler handler) => context.pushNamed('CheckIn'),
          icon: AppIcon(
            path: AppIcons.close,
            color: ThemeHelper.getColor(context).white,
          ),
          color: ThemeHelper.getColor(context).error600,
        ),
      ],
      trailingActions: [
        SwipeAction(
          performsFirstActionWithFullSwipe: true,
          title: context.tr('allowOut'),
          onTap: (CompletionHandler handler) {
            controller.closeAllOpenCell();
            context.pushNamed('CheckIn', extra: true);
          },
          color: ThemeHelper.getColor(context).error600,
        ),
      ],
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            ticket.id,
                            style: AppTextStyles.bodyLargeSemibold.copyWith(
                              color: ThemeHelper.getColor(context).grey1000,
                            ),
                          ),
                        ),
                        AppButton(
                          fitContent: true,
                          onPressed: () {},
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          theme: 2 % 2 == 0
                              ? AppButtonTheme.secondary
                              : AppButtonTheme.outline,
                          color: ticket.id.length % 2 == 0
                              ? AppButtonColor.info
                              : AppButtonColor.error,
                          radius: BorderRadius.circular(6),
                          child: Text(
                            context.tr(
                              ticket.id.length % 2 == 0 ? 'recover' : 'lost',
                            ),
                            style: AppTextStyles.bodySmallSemibold.copyWith(
                              color: ticket.id.length % 2 == 0
                                  ? ThemeHelper.getColor(context).primary500
                                  : ThemeHelper.getColor(context).error600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(Jiffy.now().format(pattern: 'dd/MM/yyyy HH:mm')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
