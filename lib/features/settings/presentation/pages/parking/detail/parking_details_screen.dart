import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/features/settings/presentation/bloc/parking/detail/parking_lot_detail_cubit.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/features/settings/data/models/parking_lot.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_switch.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/di/injection.dart';

class ParkingDetailsScreen extends StatefulWidget {
  const ParkingDetailsScreen({super.key});

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
          onPressed: () => AppMessage.showSuccessMessage(
            context.tr('success'),
            context: context,
          ),
        ),
      ],
      child: BlocProvider<ParkingLotDetailCubit>(
        create: (_) => getIt<ParkingLotDetailCubit>()
          ..init(
            GoRouterState.of(context).extra is ParkingLot
                ? GoRouterState.of(context).extra! as ParkingLot
                : null,
          ),
        child: BlocBuilder<ParkingLotDetailCubit, ParkingLotDetailState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const .symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    AppCard(
                      child: Column(
                        crossAxisAlignment: .start,
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
                        crossAxisAlignment: .start,
                        spacing: 8,
                        children: [
                          Text(context.tr('capacity')),
                          ...state.maybeMap(
                            loaded: (params) => params.parkingLot.capacity
                                .map(
                                  (e) => AppTextField(
                                    name: e.vehicleType.value,
                                    labelText: context.tr(e.vehicleType.name),
                                    isExternalLabel: true,
                                  ),
                                )
                                .toList(),
                            loading: (_) => List.generate(
                              3,
                              (index) => AppTextField(
                                name: vehicleTypes[index].value,
                                labelText: vehicleTypes[index].name,
                                isExternalLabel: true,
                              ),
                            ),
                            orElse: () => [],
                          ),
                        ],
                      ),
                    ),
                    AppCard(
                      child: Column(
                        spacing: 10,
                        children: [
                          AppListTile(
                            padding: .zero,
                            leadingIconPath: AppIcons.notification,
                            text: context.tr('title.warningThreshold'),
                            trailing: AppSwitch(
                              name: 'isLocked',
                              onToggle: (value, toggle) => value
                                  ? toggle(false)
                                  : AppDialog.showModal(
                                      context,
                                      okText: context.tr('lock'),
                                      cancelText: context.tr('close'),
                                      theme: .warning,
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

