import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_date/dart_date.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Import Slidable
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';

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

class TicketListTab extends StatefulWidget {
  const TicketListTab({super.key});

  @override
  State<TicketListTab> createState() => _TicketListTabState();
}

class _TicketListTabState extends State<TicketListTab> {
  late final EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTicketCubit, HomeTicketState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tickets, pageIndex) {
            _refreshController.finishRefresh();
            _refreshController.finishLoad();
          },
          failed: (message) {
            _refreshController.finishRefresh(IndicatorResult.fail);
            _refreshController.finishLoad(IndicatorResult.fail);
            AppToast.showErrorToast(t[message] ?? message);
          },
          empty: () {
            _refreshController.finishRefresh(IndicatorResult.noMore);
            _refreshController.finishLoad(IndicatorResult.noMore);
          },
        );
      },
      builder: (context, state) {
        final List<HomeTicket> items = state.maybeWhen(
          loaded: (tickets, _) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
          orElse: () => [],
        );

        return Skeletonizer(
          enabled: state is Loading,
          child: Container(
            clipBehavior: .antiAlias,
            margin: const .symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeHelper.getColor(context).white,
              borderRadius: const .vertical(
                top: .circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: ThemeHelper.getColor(context).grey100,
                  offset: const .new(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: EasyRefresh(
              header: const MaterialHeader(),
              footer: ClassicFooter(
                dragText: t.dragText,
                armedText: t.armedText,
                readyText: t.releaseToLoadMore,
                processingText: t.processingText,
                processedText: t.processedText,
                noMoreText: t.noMoreText,
                failedText: t.failedText,
              ),
              controller: _refreshController,
              onRefresh: () => context.read<HomeTicketCubit>().refresh(
                context.read<HomeFilterCubit>().state.mapOrNull(
                  loaded: (s) => s.filter,
                ),
              ),
              onLoad: () => context.read<HomeTicketCubit>().loadMore(
                context.read<HomeFilterCubit>().state.mapOrNull(
                  loaded: (s) => s.filter,
                ),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 0,
                  color: ThemeHelper.getColor(context).grey100,
                ),
                itemCount: items.isNotEmpty ? items.length : 10,
                itemBuilder: (c, i) => Padding(
                  padding: EdgeInsets.only(top: i == 0 ? 16 : 0),
                  child: TicketTitle(
                    key: ValueKey(items.isNotEmpty ? items[i].id : 'skeleton_$i'),
                    ticket: items.isNotEmpty
                        ? items[i]
                        : HomeTicket(
                            id: 'Placeholder',
                            timeIn: DateTime.now(),
                            siteId: 'A much Longer placeholder',
                            type: vehicleTypes.first,
                          ), // Your placeholder logic
                    enabled: state is! Loading,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

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
                  clipBehavior: Clip.antiAlias,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: .circular(6)),
                  child: Skeleton.replace(
                    height: 50,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/50',
                      // Added placeholders for better UX
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
                  SizedBox(
                    height: 24,
                    child: Row(
                      mainAxisSize: .min,
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
