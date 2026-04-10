import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/entities/revenue_entity.dart';
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart';
import 'package:zupa/features/revenue/presentation/models/revenue_form.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_search_bar.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_title.dart';

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
          loaded: (_, pageIndex) {
            refreshController.finishRefresh();
            refreshController.finishLoad();
          },
          failed: (_, message) {
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
        final List<DailyRevenueEntity> items = listState.maybeWhen(
          loaded: (tickets, _) => tickets,
          refreshing: (tickets, _) => tickets,
          loadingMore: (tickets, _) => tickets,
          orElse: () => [],
        );

        return Skeletonizer(
          enabled: listState is Loading,
          child: Padding(
            padding: const .only(top: 16),
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
                        await listContext.read<RevenueListCubit>().refresh(
                          filter:
                              ReactiveRevenueForm.of(
                                context,
                              )?.model.toParams() ??
                              .initial(),
                        );
                        refreshController.finishRefresh();
                      },
                      onLoad: () async {
                        await listContext.read<RevenueListCubit>().loadMore(
                          filter:
                              ReactiveRevenueForm.of(
                                context,
                              )?.model.toParams() ??
                              .initial(),
                        );
                        refreshController.finishLoad();
                      },
                      child: ListView.separated(
                        itemCount: items.isNotEmpty ? items.length : 10,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (_, i) =>
                            RevenueTitle(
                              revenue: items.isNotEmpty
                                  ? items[i]
                                  : DailyRevenueEntity(
                                      date: .now(),
                                      revenue: [
                                        RevenueEntity(
                                          vehicleType: vehicleTypes[0],
                                          pass: 32,
                                          revenue: 202000,
                                        ),
                                        RevenueEntity(
                                          vehicleType: vehicleTypes[1],
                                          pass: 10,
                                          revenue: 100000,
                                        ),
                                        RevenueEntity(
                                          vehicleType: vehicleTypes[2],
                                          pass: 12,
                                          revenue: 510000,
                                        ),
                                      ],
                                      vehicleType: null,
                                    ),
                            ).animateIn(
                              key: ValueKey('revenue_item_$i'),
                              index: i,
                              animate: listState is Loading,
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
