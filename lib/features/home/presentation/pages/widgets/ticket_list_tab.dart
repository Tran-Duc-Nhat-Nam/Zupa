import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/presentation/bloc/home_cubit.dart';
import 'package:zupa/features/home/presentation/models/home_form.dart';
import 'package:zupa/features/home/presentation/pages/widgets/ticker_title.dart';

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
    final colorScheme = AppColors.of(context);
    final form = ReactiveHomeForm.of(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tickets, pageIndex) {
            _refreshController.finishRefresh();
            _refreshController.finishLoad();
          },
          failed: (message) {
            _refreshController.finishRefresh(.fail);
            _refreshController.finishLoad(.fail);
            MessageHelper.showError(
              context,
              message: message != null
                  ? t[message] ?? message
                  : t.common.errors.unknown,
            );
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

        return Container(
          clipBehavior: .antiAlias,
          padding: const .symmetric(horizontal: 36),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            borderRadius: const .vertical(top: .circular(36)),
          ),
          child: Skeletonizer(
            enabled: state is Loading || state is Refreshing,
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
              onRefresh: () async {
                await context.read<HomeCubit>().refresh(
                  filter: form?.model.toParams() ?? .initial(),
                );
              },
              onLoad: () async {
                await context.read<HomeCubit>().loadMore(
                  filter: form?.model.toParams() ?? .initial(),
                );
              },
              child: ListView.builder(
                itemCount: items.isNotEmpty ? items.length : 10,
                itemBuilder: (c, i) =>
                    Padding(
                      padding: .only(top: i == 0 ? 24 : 8),
                      child: TicketTitle(
                        key: ValueKey(
                          items.isNotEmpty ? items[i].id : 'skeleton_$i',
                        ),
                        isFirst: i == 0,
                        isLast: 1 == items.length - 1,
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
                                  color: colorScheme.primary,
                                ),
                                imageUrl: '',
                              ),
                        // Your placeholder logic
                        enabled: state is! Loading,
                      ),
                    ).animateIn(
                      key: ValueKey('ticket_item_$i'),
                      index: i,
                      animate: state is Loading,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
