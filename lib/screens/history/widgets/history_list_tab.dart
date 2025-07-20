import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/history/list/history_list_cubit.dart';
import '../../../common/constants/vehicle_types.dart';
import '../../../data/model/ticket/ticket.dart';
import 'history_list_section.dart';

class HistoryListTab extends StatelessWidget {
  const HistoryListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryListCubit, HistoryListState>(
      builder: (context, state) {
        final List<Ticket>? items = switch (state) {
          Loaded(:final tickets) => tickets,
          Refreshing(:final tickets) => tickets,
          LoadingMore(:final tickets) => tickets,
          _ => null,
        };
        final RefreshController _refreshController = RefreshController();
        return Skeletonizer(
          child: SmartRefresher(
            enablePullDown: state is! LoadingMore,
            enablePullUp: state is! Refreshing,
            controller: _refreshController,
            onRefresh:
                () => context.read<HistoryListCubit>().refresh(
                  context,
                  _refreshController.refreshCompleted,
                  _refreshController.refreshFailed,
                ),
            onLoading:
                () => context.read<HistoryListCubit>().loadMore(
                  context,
                  _refreshController.loadComplete,
                  _refreshController.loadFailed,
                  _refreshController.loadNoData,
                ),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder:
                  (c, i) => Padding(
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
          enabled: state is Loading,
        );
      },
    );
  }
}
