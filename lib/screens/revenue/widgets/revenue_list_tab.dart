import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../bloc/revenue/list/revenue_list_cubit.dart';
import '../../../common/constants/vehicle_types.dart';
import '../../../data/model/revenue/daily/daily_revenue.dart';

import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/text_styles.dart';

import '../../../widgets/app_icon.dart';
import 'revenue_search_bar.dart';

class RevenueListTab extends StatelessWidget {
  const RevenueListTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RevenueListCubit, RevenueListState>(
      builder: (context, state) {
        final refreshController = RefreshController();
        final List<DailyRevenue>? items = state.whenOrNull(
          loaded: (revenue, _) => revenue,
          refreshing: (revenue) => revenue,
          loadingMore: (revenue) => revenue,
        );
        return Skeletonizer(
          enabled: state is Loading,
          child: Container(
            clipBehavior: .antiAlias,
            margin: const .symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeHelper.getColor(context).white,
              borderRadius: const .vertical(top: .circular(16)),
              boxShadow: const [
                .new(
                  color: Color(0x0C0C0D0D),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: const .only(left: 16, right: 16, top: 16),
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
                      child: SmartRefresher(
                        enablePullDown: state is! LoadingMore,
                        enablePullUp: state is! Refreshing,
                        controller: refreshController,
                        onRefresh: () =>
                            context.read<RevenueListCubit>().refresh(
                              context,
                              refreshController.refreshCompleted,
                              refreshController.refreshFailed,
                            ),
                        onLoading: () =>
                            context.read<RevenueListCubit>().loadMore(
                              context,
                              refreshController.loadComplete,
                              refreshController.loadFailed,
                              refreshController.loadNoData,
                            ),
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (c, i) => RevenueTitle(
                            revenue: DailyRevenue(
                              date: .now(),
                              revenue: [
                                .new(
                                  vehicleType: vehicleTypes[0],
                                  pass: 32,
                                  revenue: 202000,
                                ),
                                .new(
                                  vehicleType: vehicleTypes[1],
                                  pass: 10,
                                  revenue: 100000,
                                ),
                                .new(
                                  vehicleType: vehicleTypes[2],
                                  pass: 12,
                                  revenue: 510000,
                                ),
                              ],
                            ),
                          ),
                          itemCount: items?.length ?? 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RevenueTitle extends StatelessWidget {
  RevenueTitle({super.key, required this.revenue});

  final DailyRevenue revenue;
  final SwipeActionController controller = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        borderRadius: const .all(.circular(8)),
        border: .all(color: ThemeHelper.getColor(context).grey100),
      ),
      child: ListTileTheme(
        contentPadding: const .all(0),
        dense: true,
        horizontalTitleGap: 0.0,
        minVerticalPadding: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
          tilePadding: const .all(0),
          childrenPadding: const .all(0),
          minTileHeight: 20,
          showTrailingIcon: false,
          visualDensity: .compact,
          shape: const Border(),
          title: Container(
            clipBehavior: .antiAlias,
            decoration: BoxDecoration(
              borderRadius: const .all(.circular(6)),
              color: ThemeHelper.getColor(context).primary50,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: .center,
                  color: ThemeHelper.getColor(context).primary400,
                  child: Text(
                    revenue.date.day.toString(),
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
                            context.plural('pass', revenue.totalPass),
                            textAlign: .end,
                            style: AppTextStyles.bodyMediumSemibold.copyWith(
                              color: ThemeHelper.getColor(context).grey900,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${NumberFormat.currency(
                              decimalDigits: 0,
                              symbol: '',
                            ).format(revenue.totalRevenue)} VND',
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
                    decoration: BoxDecoration(
                      color: ThemeHelper.getColor(context).white,
                      borderRadius: const .only(
                        bottomRight: .circular(8),
                        topRight: .circular(8),
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
                                  context.tr(e.vehicleType.name),
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
                                  context.plural('pass', e.pass),
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
