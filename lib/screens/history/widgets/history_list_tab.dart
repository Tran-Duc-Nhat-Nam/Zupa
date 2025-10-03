import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/history/list/history_list_cubit.dart';
import '../../../common/constants/vehicle_types.dart';
import '../../../data/model/ticket/ticket.dart';
import 'history_list_section.dart';

class HistoryListTab extends StatelessWidget {
  const HistoryListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryListCubit, HistoryListState>(
      builder: (context, state) {
        final List<Ticket>? items = state.mapOrNull(
          loaded: (state) => state.tickets,
          refreshing: (state) => state.tickets,
          loadingMore: (state) => state.tickets,
        );
        final RefreshController refreshController = RefreshController();
        return Skeletonizer(
          enabled: state is Loading,
          child: SmartRefresher(
            enablePullDown: state is! LoadingMore,
            enablePullUp: state is! Refreshing,
            controller: refreshController,
            onRefresh: () => context.read<HistoryListCubit>().refresh(
              context,
              refreshController.refreshCompleted,
              refreshController.refreshFailed,
            ),
            onLoading: () => context.read<HistoryListCubit>().loadMore(
              context,
              refreshController.loadComplete,
              refreshController.loadFailed,
              refreshController.loadNoData,
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (c, i) => Padding(
                padding: EdgeInsets.only(
                  top: i == 0 ? 16 : 0,
                  left: 24,
                  right: 24,
                ),
                child: HistoryListSection(
                  tickets:
                      items ??
                      List.generate(
                        10,
                        (index) => Ticket(
                          id: 'Placeholder',
                          timeIn: DateTime.now(),
                          siteId: 'A much Longer placeholder',
                          type: vehicleTypes.first,
                        ),
                      ),
                ),
              ),
              itemCount: items?.length ?? 10,
            ),
          ),
        );
      },
    );
  }
}
