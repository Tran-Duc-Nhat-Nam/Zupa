import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../bloc/revenue/list/revenue_list_cubit.dart';
import '../../../common/constants/vehicle_types.dart';
import '../../../data/model/revenue/daily/daily_revenue.dart';
import '../../../data/model/revenue/revenue.dart';
import '../../../widgets/app_card.dart';

import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/text_styles.dart';

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
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeHelper.getColor(context).white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0C0C0D0D),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: Column(
                spacing: 10,
                children: [
                  const RevenueSearchBar(),
                  Expanded(
                    child: SmartRefresher(
                      enablePullDown: state is! LoadingMore,
                      enablePullUp: state is! Refreshing,
                      controller: refreshController,
                      onRefresh: () => context.read<RevenueListCubit>().refresh(
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
                            date: DateTime.now(),
                            revenue: [
                              Revenue(
                                vehicleType: vehicleTypes[0],
                                pass: 32,
                                revenue: 202000,
                              ),
                              Revenue(
                                vehicleType: vehicleTypes[1],
                                pass: 10,
                                revenue: 100000,
                              ),
                              Revenue(
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
    return AppCard(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ThemeHelper.getColor(context).primary100,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: ThemeHelper.getColor(context).grey100),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(revenue.date.day.toString()),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: ThemeHelper.getColor(context).white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...revenue.revenue.map(
                          (e) => Text(
                            context.tr(e.vehicleType.name),
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: ThemeHelper.getColor(context).grey700,
                            ),
                          ),
                        ),
                        Text(
                          context.tr('total'),
                          style: AppTextStyles.bodyMediumSemibold.copyWith(
                            color: ThemeHelper.getColor(context).grey900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...revenue.revenue.map(
                          (e) => Text(
                            context.plural('pass', e.pass),
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: ThemeHelper.getColor(context).grey700,
                            ),
                          ),
                        ),
                        Text(
                          context.plural('pass', revenue.totalPass),
                          style: AppTextStyles.bodyMediumSemibold.copyWith(
                            color: ThemeHelper.getColor(context).grey900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...revenue.revenue.map(
                          (e) => Text(
                            NumberFormat.currency(
                              locale: Intl.getCurrentLocale(),
                              symbol: '',
                            ).format(e.revenue),
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: ThemeHelper.getColor(context).grey700,
                            ),
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: Intl.getCurrentLocale(),
                            symbol: '',
                          ).format(revenue.totalRevenue),
                          style: AppTextStyles.bodyMediumSemibold.copyWith(
                            color: ThemeHelper.getColor(context).grey900,
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
    );
  }
}
