import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/features/member_vehicles/data/models/member_vehicle.dart';
import 'package:zupa/features/member_vehicles/presentation/bloc/filter/member_vehicles_filter_cubit.dart';
import 'package:zupa/features/member_vehicles/presentation/bloc/list/member_vehicles_list_cubit.dart' hide Loading;
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_photo_view.dart';
import 'package:zupa/gen/strings.g.dart';

class MemberVehicleListTab extends StatelessWidget {
  const MemberVehicleListTab({super.key});
  @override
  Widget build(BuildContext context) {
    final refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );

    return BlocConsumer<MemberVehiclesListCubit, MemberVehiclesListState>(
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
      builder: (context, state) {
        final List<MemberVehicle>? items = state.maybeWhen(
          loaded: (tickets, _) => tickets,
          refreshing: (tickets) => tickets,
          loadingMore: (tickets) => tickets,
          orElse: () => [],
        );

        return Skeletonizer(
          enabled: state is Loading,
          child: Padding(
            padding: const .symmetric(horizontal: 24),
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
              onRefresh: () => context.read<MemberVehiclesListCubit>().refresh(
                context.read<MemberVehiclesFilterCubit>().state.mapOrNull(
                  loaded: (s) => s.filter,
                ),
              ),
              onLoad: () => context.read<MemberVehiclesListCubit>().loadMore(
                context.read<MemberVehiclesFilterCubit>().state.mapOrNull(
                  loaded: (s) => s.filter,
                ),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (c, i) => Padding(
                  padding: .only(top: i == 0 ? 16 : 0),
                  child: MemberVehiclesTitle(ticket: items?[i] ?? const .new()),
                ),
                itemCount: items?.length ?? 10,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MemberVehiclesTitle extends StatelessWidget {
  const MemberVehiclesTitle({super.key, required this.ticket});

  final MemberVehicle ticket;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const .all(16),
      child: Row(
        spacing: 12,
        children: [
          Column(
            spacing: 3,
            children: [
              InkWell(
                onTap: () => AppPhotoView.showPhotoView(
                  context,
                  const NetworkImage('https://picsum.photos/750'),
                ),
                child: Container(
                  clipBehavior: .antiAlias,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(borderRadius: .circular(6)),
                  child: Skeleton.replace(
                    height: 60,
                    width: 60,
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/60',
                    ),
                  ),
                ),
              ),
              Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: .circular(6),
                  border: .all(color: ThemeHelper.getColor(context).grey100),
                ),
                child: Center(child: Text(ticket.vehicleType.name)),
              ),
            ],
          ),
          Expanded(
            child: Row(
              spacing: 12,
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        ticket.name,
                        style: AppTextStyles.bodyLargeSemibold.copyWith(
                          color: ThemeHelper.getColor(context).grey1000,
                        ),
                      ),
                      Text(
                        ticket.phoneNumber,
                        style: AppTextStyles.bodyMediumMedium.copyWith(
                          color: ThemeHelper.getColor(context).grey700,
                        ),
                      ),
                      Text(
                        ticket.parkingLotId,
                        style: AppTextStyles.bodyMediumMedium.copyWith(
                          color: ThemeHelper.getColor(context).grey700,
                        ),
                      ),
                      Text(
                        DateTimeConverter.toDate(
                          DateTime.now().add(
                            Duration(seconds: ticket.expiredIn),
                          ),
                        ),
                        style: AppTextStyles.bodyMediumMedium.copyWith(
                          color: ThemeHelper.getColor(context).grey700,
                        ),
                      ),
                    ],
                  ),
                ),
                AppButton(
                  fitContent: true,
                  radius: .circular(8),
                  theme: .secondary,
                  onPressed: () => DialogHelper.showModal(
                    context,
                    titleText: t.title_extend,
                    subtitleText: t.subtitle_extend,
                    okText: t.title_extend,
                    cancelText: t.close,
                    onOk: () async {
                      await Future.delayed(const Duration(milliseconds: 200));
                      if (context.mounted) {
                        AppToast.showNotify(t.success);
                      }
                    },
                  ),
                  child: SizedBox(
                    width: 80,
                    child: Text(
                      'Gia hạn 200.000đ',
                      overflow: .clip,
                      softWrap: true,
                      maxLines: 10,
                      textAlign: .center,
                      style: AppTextStyles.bodySmallSemibold.copyWith(
                        color: ThemeHelper.getColor(context).primary500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
