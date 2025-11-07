import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../bloc/member_vehicles/list/member_vehicles_list_cubit.dart';
import '../../../../helper/converter/date_time_converter.dart';
import '../../../../helper/theme/theme_helper.dart';
import '../../../../common/styles/text_styles.dart';
import '../../../../data/model/member_vehicle/member_vehicle.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_card.dart';
import '../../../../widgets/popup/app_dialog.dart';
import '../../../../widgets/popup/app_message.dart';
import '../../../../widgets/popup/app_photo_view.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class MemberVehiclesListTab extends StatelessWidget {
  const MemberVehiclesListTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberVehiclesListCubit, MemberVehiclesListState>(
      builder: (context, state) {
        final refreshController = RefreshController();
        final List<MemberVehicle>? items = state.maybeWhen(
          loaded: (vehicles, _) => vehicles,
          refreshing: (vehicles) => vehicles,
          loadingMore: (vehicles) => vehicles,
          orElse: () => null,
        );
        return Skeletonizer(
          enabled: state is Loading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SmartRefresher(
              enablePullDown: state is! LoadingMore,
              enablePullUp: state is! Refreshing,
              controller: refreshController,
              onRefresh: () => context.read<MemberVehiclesListCubit>().refresh(
                context,
                refreshController.refreshCompleted,
                refreshController.refreshFailed,
              ),
              onLoading: () => context.read<MemberVehiclesListCubit>().loadMore(
                context,
                refreshController.loadComplete,
                refreshController.loadFailed,
                refreshController.loadNoData,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (c, i) => Padding(
                  padding: EdgeInsets.only(top: i == 0 ? 16 : 0),
                  child: MemberVehiclesTitle(
                    ticket: items?[i] ?? const MemberVehicle(),
                  ),
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
  MemberVehiclesTitle({super.key, required this.ticket});

  final MemberVehicle ticket;
  final SwipeActionController controller = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
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
                  clipBehavior: Clip.antiAlias,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
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
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: ThemeHelper.getColor(context).grey100,
                  ),
                ),
                child: Center(child: Text(ticket.vehicleType.name)),
              ),
            ],
          ),
          Expanded(
            child: Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                  radius: BorderRadius.circular(8),
                  theme: AppButtonTheme.secondary,
                  onPressed: () => AppDialog.showModal(
                    context,
                    titleText: context.tr('title.extend'),
                    subtitleText: context.tr('subtitle.extend'),
                    okText: context.tr('title.extend'),
                    cancelText: context.tr('close'),
                    onOk: () async {
                      await Future.delayed(const Duration(milliseconds: 200));
                      if (context.mounted) {
                        AppMessage.showSuccessMessage(
                          context.tr('extendSuccessful'),
                          context: context,
                        );
                      }
                    },
                  ),
                  child: SizedBox(
                    width: 80,
                    child: Text(
                      'Gia hạn 200.000đ',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      maxLines: 10,
                      textAlign: TextAlign.center,
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
