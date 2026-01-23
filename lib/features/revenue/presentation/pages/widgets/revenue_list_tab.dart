
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue.dart';
import 'package:zupa/features/revenue/data/models/revenue_model.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart' hide Loading;
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
    return BlocBuilder<RevenueListCubit, RevenueListState>(
      builder: (context, state) {
        final refreshController = RefreshController();
        final List<DailyRevenue> items =
            state.whenOrNull(
              loaded: (tickets, _) => tickets,
              refreshing: (tickets) => tickets,
              loadingMore: (tickets) => tickets,
            ) ?? [];

        return Skeletonizer(
          enabled: state is Loading,
          child: Container(
            clipBehavior: .antiAlias,
            margin: const .symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ThemeHelper.getColor(context).white,
              borderRadius: const .vertical(top: .circular(16)),
              boxShadow: const [
                BoxShadow(
                  color: .new(0x0C0C0D0D),
                  offset: .new(0, 1),
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
                        enablePullUp: state is !LoadingMore,
                        enablePullDown: state is !Refreshing,
                        controller: refreshController,
                        onRefresh: () async {
                          final filter = context
                              .read<RevenueFilterState>()
                              .maybeMap(
                                loaded: (s) => s.filter,
                                orElse: () => null,
                              );
                          await context.read<RevenueListCubit>().refresh(
                            filter,
                          );
                          refreshController.refreshCompleted();
                        },
                        onLoading: () async {
                          final filter = context
                              .read<RevenueFilterState>()
                              .maybeMap(
                                loaded: (s) => s.filter,
                                orElse: () => null,
                              );
                          await context.read<RevenueListCubit>().loadMore(
                            filter,
                          );
                          refreshController.loadComplete();
                        },
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (c, i) => RevenueTitle(
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
                          itemCount: items.isNotEmpty ? items.length : 10,
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
        borderRadius: const .all(Radius.circular(8)),
        border: .all(color: ThemeHelper.getColor(context).grey100),
      ),
      child: ListTileTheme(
        contentPadding: .zero,
        dense: true,
        horizontalTitleGap: 0.0,
        minVerticalPadding: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
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
                            Translations.of(context).pass(n: revenue.totalPass),
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
                                  Translations.of(context)[e.vehicleType.name],
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
                                  Translations.of(context).pass(n: e.pass),
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
