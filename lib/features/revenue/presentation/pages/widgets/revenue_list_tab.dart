import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue.dart';
import 'package:zupa/features/revenue/data/models/revenue_model.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart'
    hide Loading;
import 'package:zupa/features/revenue/presentation/bloc/list/revenue_list_cubit.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/features/revenue/presentation/pages/widgets/revenue_search_bar.dart';

import 'package:zupa/core/constants/vehicle_types.dart';
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
                                  date: .now(),
                                  revenue: [
                                    RevenueModel(
                                      vehicleType: vehicleTypes[0],
                                      pass: 32,
                                      revenue: 202000,
                                    ),
                                    RevenueModel(
                                      vehicleType: vehicleTypes[1],
                                      pass: 10,
                                      revenue: 100000,
                                    ),
                                    RevenueModel(
                                      vehicleType: vehicleTypes[2],
                                      pass: 12,
                                      revenue: 510000,
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

class RevenueTitle extends StatelessWidget {
  const RevenueTitle({super.key, required this.revenue});

  final DailyRevenue revenue;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .antiAlias,
      decoration: const BoxDecoration(
        borderRadius: .all(Radius.circular(16)),
      ),
      child: ListTileTheme(
        contentPadding: .zero,
        dense: true,
        horizontalTitleGap: 0.0,
        minVerticalPadding: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
          backgroundColor: ThemeHelper.getColor(context).primary50.withAlpha(155),
          tilePadding: .zero,
          childrenPadding: .zero,
          minTileHeight: 20,
          showTrailingIcon: false,
          visualDensity: .compact,
          shape: const Border(),
          title: Container(
            clipBehavior: .antiAlias,
            decoration: BoxDecoration(
              borderRadius: const .all(.circular(6)),
              color: ThemeHelper.getColor(context).primary100.withAlpha(155),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: .center,
                  decoration: BoxDecoration(
                    borderRadius: .circular(4),
                    color: ThemeHelper.getColor(context).primary400,
                  ),
                  child: Text(
                    revenue.date?.day.toString() ?? '36',
                    style: AppTextStyles.bodyMediumSemibold.copyWith(
                      color: ThemeHelper.getColor(context).white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const .symmetric(horizontal: 10, vertical: 4),
                    decoration: const BoxDecoration(
                      borderRadius: .only(
                        bottomRight: .circular(8),
                        topRight: .circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            t.pass(n: revenue.totalPass),
                            textAlign: .end,
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: ThemeHelper.getColor(context).grey900,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${NumberFormat.currency(decimalDigits: 0, symbol: '').format(revenue.totalRevenue)} VND',
                            textAlign: .end,
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: ThemeHelper.getColor(context).grey900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          children: [
            Row(
              children: [
                Padding(
                  padding: const .all(4),
                  child: Skeleton.replace(
                    width: 24,
                    height: 24,
                    child: AppIcon(
                      path: revenue.vehicleType?.iconPath ?? '',
                      size: 24,
                      color: ThemeHelper.getColor(context).success600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const .symmetric(horizontal: 10, vertical: 4),
                    decoration: const BoxDecoration(
                      borderRadius: .only(
                        bottomRight: .circular(16),
                        topRight: .circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: .center,
                            children: [
                              ...revenue.revenue.map(
                                (e) => Text(
                                  t[e.vehicleType.name],
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: ThemeHelper.getColor(
                                          context,
                                        ).grey700,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .end,
                            mainAxisAlignment: .center,
                            children: [
                              ...revenue.revenue.map(
                                (e) => Text(
                                  t.pass(n: e.pass),
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: ThemeHelper.getColor(
                                          context,
                                        ).grey700,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .end,
                            mainAxisAlignment: .center,
                            children: [
                              ...revenue.revenue.map(
                                (e) => Text(
                                  NumberFormat.currency(
                                    decimalDigits: 0,
                                    symbol: '',
                                  ).format(e.revenue),
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color: ThemeHelper.getColor(
                                          context,
                                        ).grey700,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
