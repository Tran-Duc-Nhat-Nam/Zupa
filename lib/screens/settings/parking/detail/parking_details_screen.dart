import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../bloc/settings/parking/detail/parking_lot_detail_cubit.dart';
import '../../../../common/constants/vehicle_types.dart';
import '../../../../common/styles/icons.dart';
import '../../../../common/styles/text_styles.dart';
import '../../../../data/model/parking_lot/parking_lot.dart';
import '../../../../helper/theme/theme_helper.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_card.dart';
import '../../../../widgets/app_list_tile.dart';
import '../../../../widgets/app_switch.dart';
import '../../../../widgets/app_text_field.dart';
import '../../../../widgets/popup/app_dialog.dart';
import '../../../../widgets/popup/app_message.dart';
import '../../../../widgets/state/app_state.dart';
import '../../../../widgets/app_screen.dart';

class ParkingDetailsScreen extends StatefulWidget {
  const ParkingDetailsScreen({Key? key}) : super(key: key);

  @override
  AppState<ParkingDetailsScreen> createState() => _ParkingDetailsScreenState();
}

class _ParkingDetailsScreenState extends AppState<ParkingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: context.tr('parkingAreaConfig'),
      isChildScrollable: true,
      footer: [
        AppButton(
          text: context.tr('save'),
          onPressed:
              () =>
                  AppMessage.showSuccessMessage(context, context.tr('success')),
        ),
      ],
      child: BlocProvider<ParkingLotDetailCubit>(
        create:
            (_) =>
                ParkingLotDetailCubit()..init(
                  GoRouterState.of(context).extra is ParkingLot
                      ? GoRouterState.of(context).extra! as ParkingLot
                      : null,
                ),
        child: BlocBuilder<ParkingLotDetailCubit, ParkingLotDetailState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(context.tr('info')),
                          AppTextField(
                            name: 'branchName',
                            labelText: context.tr('branchName'),
                            isExternalLabel: true,
                          ),
                          AppTextField(
                            name: 'address',
                            labelText: context.tr('address'),
                            isExternalLabel: true,
                          ),
                        ],
                      ),
                    ),
                    AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(context.tr('capacity')),
                          ...switch (state) {
                            Loaded(:final parkingLot) =>
                              parkingLot.capacity
                                  .map(
                                    (e) => AppTextField(
                                      name: e.vehicleType.value,
                                      labelText: context.tr(e.vehicleType.name),
                                      isExternalLabel: true,
                                    ),
                                  )
                                  .toList(),
                            Loading() => List.generate(
                              3,
                              (index) => AppTextField(
                                name: vehicleTypes[index].value,
                                labelText: vehicleTypes[index].name,
                                isExternalLabel: true,
                              ),
                            ),
                            _ => [],
                          },
                        ],
                      ),
                    ),
                    AppCard(
                      child: Column(
                        spacing: 10,
                        children: [
                          AppListTile(
                            padding: EdgeInsets.zero,
                            leadingIconPath: AppIcons.notification,
                            text: context.tr('title.warningThreshold'),
                            trailing: AppSwitch(
                              name: 'isLocked',
                              onToggle:
                                  (value, toggle) =>
                                      value
                                          ? toggle(false)
                                          : AppDialog.showModal(
                                            context,
                                            okText: context.tr('lock'),
                                            cancelText: context.tr('close'),
                                            theme: AppDialogTheme.warning,
                                            onOk: () => toggle(true),
                                            onCancel: () => toggle(false),
                                          ),
                            ),
                          ),
                          Text(
                            context.tr('subtitle.warningThreshold'),
                            style: AppTextStyles.bodySmallMedium.copyWith(
                              color: ThemeHelper.getColor(context).grey500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
