import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/features/history/presentation/bloc/history_cubit.dart';
import 'package:zupa/features/history/presentation/models/form/history_form.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_section.dart';

class HistoryListTab extends StatelessWidget {
  const HistoryListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );
    final form = ReactiveHistoryForm.of(context);

    return BlocConsumer<HistoryCubit, HistoryState>(
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
      builder: (listContext, state) => Skeletonizer(
        enabled: state.isLoading,
        child: EasyRefresh(
          header: const MaterialHeader(triggerWhenRelease: true),
          footer: MaterialFooter(
            triggerWhenRelease: true,
            infiniteHitOver: false,
            infiniteOffset: 200,
          ),
          controller: refreshController,
          onRefresh: () => context.read<HistoryCubit>().refresh(
            filter: form?.model.toParams() ?? .initial(),
          ),
          onLoad: () => context.read<HistoryCubit>().refresh(
            filter: form?.model.toParams() ?? .initial(),
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (c, i) =>
                Padding(
                  padding: .only(top: i == 0 ? 16 : 0),
                  child: HistoryListSection(
                    tickets: state.items.isNotEmpty
                        ? state.items
                        : List.generate(
                            10,
                            (index) => .new(
                              code: 'Placeholder',
                              id: -1,
                              timeIn: .now(),
                              timeOut: .now(),
                              isFlagError: false,
                              siteId: 'A much Longer placeholder',
                              type: vehicleTypes.first,
                            ),
                          ),
                  ),
                ).animateIn(
                  key: ValueKey('history_item_$i'),
                  index: i,
                  animate: state.isLoading,
                ),
            itemCount: state.items.isNotEmpty ? state.items.length : 10,
          ),
        ),
      ),
    );
  }
}
