import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart'
    hide Loading;

import 'package:zupa/features/history/presentation/bloc/list/history_list_cubit.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_section.dart';

class HistoryListTab extends StatelessWidget {
  const HistoryListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryFilterCubit, HistoryFilterState>(
      builder: (filterContext, filterState) {
        return BlocBuilder<HistoryListCubit, HistoryListState>(
          builder: (listContext, state) {
            final refreshController = RefreshController();
            final List<HistoryTicket> items =
                state.whenOrNull(
                  loaded: (tickets, _) => tickets,
                  refreshing: (tickets) => tickets,
                  loadingMore: (tickets) => tickets,
                ) ??
                [];

            return Skeletonizer(
              enabled: state is Loading,
              child: SmartRefresher(
                enablePullDown: state is! LoadingMore,
                enablePullUp: state is! Refreshing,
                controller: refreshController,
                onRefresh: () async {
                  final filter = filterState.whenOrNull(
                    loaded: (filter) => filter,
                  );
                  await context.read<HistoryListCubit>().refresh(filter);
                  refreshController.refreshCompleted();
                },
                onLoading: () async {
                  final filter = filterState.whenOrNull(
                    loaded: (filter) => filter,
                  );
                  await context.read<HistoryListCubit>().loadMore(filter);
                  refreshController.loadComplete();
                },
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
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
      },
    );
  }
}
