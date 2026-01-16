import 'package:zupa/core/common/resource/network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../bloc/list/history_list_cubit.dart';
import '../../../../../common/constants/vehicle_types.dart';
import '../../../data/models/history_ticket.dart';
import 'history_list_section.dart';

class HistoryListTab extends StatelessWidget {
  const HistoryListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryListCubit, HistoryListState>(
      builder: (context, state) {
        final List<HistoryTicket> items = state.tickets;
        final refreshController = RefreshController();

        final isLoading = state.status.maybeWhen(
          loading: () => items.isEmpty,
          orElse: () => false,
        );

        return Skeletonizer(
          enabled: isLoading,
          child: SmartRefresher(
            enablePullUp: state.hasMore,
            controller: refreshController,
            onRefresh: () async {
              await context.read<HistoryListCubit>().init(context);
              refreshController.refreshCompleted();
            },
            onLoading: () async {
              await context.read<HistoryListCubit>().loadMore();
              refreshController.loadComplete();
            },
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 12),
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
                          (index) => HistoryTicket(
                            id: 'Placeholder',
                            timeIn: DateTime.now(),
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
