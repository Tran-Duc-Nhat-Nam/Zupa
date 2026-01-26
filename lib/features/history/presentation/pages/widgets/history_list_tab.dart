import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart'
    hide Loading;

import 'package:zupa/features/history/presentation/bloc/list/history_list_cubit.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_section.dart';
import 'package:zupa/gen/strings.g.dart';

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
        final List<HistoryTicket> items = state.maybeWhen(
          loaded: (tickets, _) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
          orElse: () => [],
        );

        return Skeletonizer(
          enabled: state is Loading,
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
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (c, i) => Padding(
                padding: .only(top: i == 0 ? 16 : 0, left: 24, right: 24),
                child: HistoryListSection(
                  tickets: items.isNotEmpty
                      ? items
                      : List.generate(
                          10,
                          (index) => HistoryTicket(
                            code: 'Placeholder',
                            id: -1,
                            timeIn: .now(),
                            siteId: 'A much Longer placeholder',
                            type: vehicleTypes.first,
                          ),
                        ),
                ),
              ),
              itemCount: items.isNotEmpty ? items.length : 10,
            ),
          ),
        );
      },
    );
  }
}
