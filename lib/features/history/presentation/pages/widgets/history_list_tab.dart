import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart'
    hide Loading;
import 'package:zupa/features/history/presentation/bloc/list/history_list_cubit.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_section.dart';

class HistoryListTab extends StatelessWidget {
  const HistoryListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );

    return BlocConsumer<HistoryListCubit, HistoryListState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tickets, pageIndex) {
            refreshController.finishRefresh();
            refreshController.finishLoad();
          },
          failed: (message) {
            refreshController.finishRefresh(.fail);
            refreshController.finishLoad(.fail);
          },
          empty: () {
            refreshController.finishRefresh(.noMore);
            refreshController.finishLoad(.noMore);
          },
        );
      },
      builder: (listContext, state) {
        final List<HistoryTicketEntity> items = state.maybeWhen(
          loaded: (tickets, _) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
          orElse: () => [],
        );

        return Skeletonizer(
          enabled: state is Loading,
          child: Container(
            padding: const .symmetric(horizontal: 12),
            child: EasyRefresh(
              header: const MaterialHeader(triggerWhenRelease: true),
              footer: ClassicFooter(
                dragText: t.common.refresh.dragText,
                armedText: t.common.refresh.armedText,
                readyText: t.common.refresh.releaseToLoadMore,
                processingText: t.common.refresh.processingText,
                processedText: t.common.refresh.processedText,
                noMoreText: t.common.refresh.noMoreText,
                failedText: t.common.refresh.failedText,
                triggerWhenRelease: true,
              ),
              controller: refreshController,
              onRefresh: () async {
                final filter = context
                    .read<HistoryFilterCubit>()
                    .state
                    .whenOrNull(loaded: (filter) => filter);
                await context.read<HistoryListCubit>().refresh(filter);
              },
              onLoad: () async {
                final filter = context
                    .read<HistoryFilterCubit>()
                    .state
                    .whenOrNull(loaded: (filter) => filter);
                await context.read<HistoryListCubit>().loadMore(filter);
              },
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (c, i) => Padding(
                  padding: EdgeInsets.only(
                    top: i == 0 ? 16 : 0,
                    left: 24,
                    right: 24,
                  ),
                  child: HistoryListSection(
                    tickets: items.isNotEmpty
                        ? items
                        : List.generate(
                            10,
                            (index) => HistoryTicketEntity(
                              code: 'Placeholder',
                              id: -1,
                              timeIn: DateTime.now(),
                              timeOut: DateTime.now(),
                              isFlagError: false,
                              siteId: 'A much Longer placeholder',
                              type: vehicleTypes.first,
                            ),
                          ),
                  ),
                ).animateIn(index: i, animate: state is! LoadingMore),
                itemCount: items.isNotEmpty ? items.length : 10,
              ),
            ),
          ),
        );
      },
    );
  }
}
