import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/features/revenue/presentation/bloc/revenue_cubit.dart';
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

    final form = ReactiveRevenueForm.of(context);

    return BlocConsumer<RevenueCubit, RevenueState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (_, _) {
            refreshController.finishRefresh();
            refreshController.finishLoad();
          },
          failed: (_, _) {
            refreshController.finishRefresh(.fail);
            refreshController.finishLoad(.fail);
          },
          empty: () {
            refreshController.finishRefresh(.noMore);
            refreshController.finishLoad(.noMore);
          },
        );
      },
      builder: (listContext, listState) => Skeletonizer(
        enabled: listState.isLoading,
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
                    footer: MaterialFooter(
                      triggerWhenRelease: true,
                      infiniteHitOver: false,
                      infiniteOffset: 200,
                    ),
                    controller: refreshController,
                    onRefresh: () async => listContext
                        .read<RevenueCubit>()
                        .refresh(filter: form?.model.toParams() ?? .initial()),
                    onLoad: () async => listContext
                        .read<RevenueCubit>()
                        .loadMore(filter: form?.model.toParams() ?? .initial()),
                    child: ListView.separated(
                      itemCount: listState.items.isNotEmpty
                          ? listState.items.length
                          : 10,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (_, i) =>
                          RevenueTitle(
                            revenue: listState.items.isNotEmpty
                                ? listState.items[i]
                                : .new(
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
                                    vehicleType: null,
                                  ),
                          ).animateIn(
                            key: ValueKey('revenue_item_$i'),
                            index: i,
                            animate: listState.isLoading,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
