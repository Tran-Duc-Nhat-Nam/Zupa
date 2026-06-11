import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/features/home/presentation/bloc/home_cubit.dart';
import 'package:zupa/features/home/presentation/models/home_form.dart';
import 'package:zupa/features/home/presentation/pages/widgets/ticker_title.dart';

class TicketListTab extends StatelessWidget {
  const TicketListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
    final colorScheme = context.colorScheme;
    final form = ReactiveHomeForm.of(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (tickets, pageIndex) {
            refreshController.finishRefresh();
            refreshController.finishLoad();
          },
          failed: (message) {
            refreshController.finishRefresh(.fail);
            refreshController.finishLoad(.fail);
            MessageHelper.showError(
              context,
              message: message != null
                  ? t[message] ?? message
                  : t.common.errors.unknown,
            );
          },
          empty: () {
            refreshController.finishRefresh(.noMore);
            refreshController.finishLoad(.noMore);
          },
        );
      },
      builder: (context, state) => Container(
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: const .vertical(top: .circular(36)),
        ),
        child: Skeletonizer(
          enabled: state.isLoading,
          child: EasyRefresh(
            header: const MaterialHeader(triggerWhenRelease: true),
            footer: MaterialFooter(
              triggerWhenRelease: true,
              infiniteHitOver: false,
              infiniteOffset: 200,
            ),
            controller: refreshController,
            onRefresh: () => context.read<HomeCubit>().refresh(
              filter: form?.model.toParams() ?? .initial(),
            ),
            onLoad: () => context.read<HomeCubit>().loadMore(
              filter: form?.model.toParams() ?? .initial(),
            ),
            child: ListView.builder(
              itemCount: state.items.isNotEmpty ? state.items.length : 10,
              itemBuilder: (c, i) =>
                  Padding(
                    padding: .only(top: i == 0 ? 24 : 8),
                    child: Padding(
                      padding: const .symmetric(horizontal: 36),
                      child: TicketTitle(
                        key: ValueKey(
                          state.items.isNotEmpty
                              ? state.items[i].id
                              : 'skeleton_$i',
                        ),
                        isFirst: i == 0,
                        isLast: 1 == state.items.length - 1,
                        ticket: state.items.isNotEmpty
                            ? state.items[i]
                            : .new(
                                id: -1,
                                siteId: 'Nope',
                                code: 'None',
                                isFlagError: false,
                                timeIn: .now(),
                                type: .new(
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
                    ),
                  ).animateIn(
                    key: ValueKey('ticket_item_$i'),
                    index: i,
                    animate: state is Loading,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
