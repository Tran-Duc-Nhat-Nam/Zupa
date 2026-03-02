import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/features/revenue/data/models/daily_revenue.dart';
import 'package:zupa/features/revenue/data/models/revenue_detail.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart'
    hide Loading;
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_search_bar.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_title.dart';
import 'package:zupa/gen/strings.g.dart';

class RevenueListTab extends StatelessWidget {
  const RevenueListTab({super.key});
  @override
  Widget build(BuildContext context) {
    final refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );

    return BlocConsumer<RevenueListCubit, RevenueListState>(
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
      builder: (listContext, listState) {
        final List<DailyRevenue> items = listState.maybeWhen(
          loaded: (tickets, _) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
          orElse: () => [],
        );

        return Skeletonizer(
          enabled: listState is Loading,
          child: Padding(
            padding: const .only(left: 32, right: 32, top: 16),
            child: Column(
              spacing: 16,
              children: [
                const RevenueSearchBar(),
                Expanded(
                  child: Container(
                    clipBehavior: .antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius: .vertical(top: .circular(8)),
                    ),
                    child: EasyRefresh(
                      header: const MaterialHeader(triggerWhenRelease: true),
                      footer: ClassicFooter(
                        dragText: t.dragText,
                        armedText: t.armedText,
                        readyText: t.releaseToLoadMore,
                        processingText: t.processingText,
                        processedText: t.processedText,
                        noMoreText: t.noMoreText,
                        failedText: t.failedText,
                        triggerWhenRelease: true,
                      ),
                      controller: refreshController,
                      onRefresh: () async {
                        final filter = context
                            .read<RevenueFilterCubit>()
                            .state
                            .maybeMap(
                              loaded: (s) => s.filter,
                              orElse: () => null,
                            );
                        await listContext.read<RevenueListCubit>().refresh(
                          filter,
                        );
                        refreshController.finishRefresh();
                      },
                      onLoad: () async {
                        final filter = context
                            .read<RevenueFilterCubit>()
                            .state
                            .maybeMap(
                              loaded: (s) => s.filter,
                              orElse: () => null,
                            );
                        await listContext.read<RevenueListCubit>().loadMore(
                          filter,
                        );
                        refreshController.finishLoad();
                      },
                      child: ListView.separated(
                        itemCount: items.isNotEmpty ? items.length : 10,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: 10),
                        itemBuilder: (_, i) => RevenueTitle(
                          revenue: items.isNotEmpty
                              ? items[i]
                              : DailyRevenue(
                                  date: DateTime.now(),
                                  byVehicleType: [
                                    RevenueDetail(
                                      vehicleType: vehicleTypes[0],
                                      count: 32,
                                      amount: 202000,
                                    ),
                                    RevenueDetail(
                                      vehicleType: vehicleTypes[1],
                                      count: 10,
                                      amount: 100000,
                                    ),
                                    RevenueDetail(
                                      vehicleType: vehicleTypes[2],
                                      count: 12,
                                      amount: 510000,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}