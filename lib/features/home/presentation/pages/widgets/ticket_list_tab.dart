import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart'
    hide Loading;
import 'package:zupa/features/home/presentation/bloc/ticket/home_ticket_cubit.dart';
import 'package:zupa/features/home/presentation/pages/widgets/ticker_title.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_animation.dart';


class TicketListTab extends StatefulWidget {
  const TicketListTab({super.key});

  @override
  State<TicketListTab> createState() => _TicketListTabState();
}

class _TicketListTabState extends State<TicketListTab> {
  late final EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTicketCubit, HomeTicketState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tickets, pageIndex) {
            _refreshController.finishRefresh();
            _refreshController.finishLoad();
          },
          failed: (message) {
            _refreshController.finishRefresh(.fail);
            _refreshController.finishLoad(.fail);
            AppToast.showNotify(t[message] ?? message);
          },
          empty: () {
            _refreshController.finishRefresh(.noMore);
            _refreshController.finishLoad(.noMore);
          },
        );
      },
      builder: (context, state) {
        final items = state.maybeWhen(
          loaded: (tickets, _) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
          orElse: () => [],
        );

        return Skeletonizer(
          enabled: state is Loading,
          child: Container(
            clipBehavior: .antiAlias,
            margin: const .symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.of(context).surfaceContainer,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
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
              controller: _refreshController,
              onRefresh: () => state is! Refreshing
                  ? context.read<HomeTicketCubit>().refresh(
                      context.read<HomeFilterCubit>().state.mapOrNull(
                        loaded: (s) => s.filter,
                      ),
                    )
                  : null,
              onLoad: () => state is! LoadingMore
                  ? context.read<HomeTicketCubit>().loadMore(
                      context.read<HomeFilterCubit>().state.mapOrNull(
                        loaded: (s) => s.filter,
                      ),
                    )
                  : null,
              child: ListView.builder(
                itemCount: items.isNotEmpty ? items.length : 10,
                itemBuilder: (c, i) => Padding(
                  padding: .only(top: i == 0 ? 8 : 0),
                  child: TicketTitle(
                    key: ValueKey(
                      items.isNotEmpty ? items[i].id : 'skeleton_$i',
                    ),
                    ticket: items.isNotEmpty
                        ? items[i]
                        : HomeTicketEntity(
                            id: -1,
                            siteId: 'Nope',
                            code: 'None',
                            isFlagError: false,
                            timeIn: .now(),
                            type: VehicleTypeEntity(
                              value: '',
                              name: '',
                              icon: '',
                              color: AppColors.of(context).primary,
                            ),
                            imageUrl: '',
                          ), // Your placeholder logic
                    enabled: state is! Loading,
                  ),
                )
                    .animateIn(index: i, animate: state is! LoadingMore),
              ),
            ),
          ),
        );
      },
    );
  }
}
