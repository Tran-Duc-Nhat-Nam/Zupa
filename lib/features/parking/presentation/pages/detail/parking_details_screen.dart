import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_switch.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/presentation/bloc/detail/parking_lot_detail_cubit.dart';

@RoutePage()
class ParkingDetailsScreen extends StatelessWidget {
  const ParkingDetailsScreen({super.key, this.parkingLot});

  final ParkingLotEntity? parkingLot;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: t.parking.areaConfig,
      isChildScrollable: true,
      footer: [
        AppButton(
          text: t.common.actions.save,
          onPressed: () => AppToast.showNotify(t.common.success),
        ),
      ],
      child: BlocProvider<ParkingLotDetailCubit>(
        create: (_) => getIt<ParkingLotDetailCubit>()..init(parkingLot),
        child: BlocBuilder<ParkingLotDetailCubit, ParkingLotDetailState>(
          builder: (context, state) {
            final formModel = context.read<ParkingLotDetailCubit>().formModel;
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const .symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  children: [
                    AppCard(
                      child: Column(
                        crossAxisAlignment: .start,
                        spacing: 8,
                        children: [
                          Text(t.common.info.info),
                          AppTextField(
                            formControl: formModel.branchNameControl,
                            labelText: t.settings.profile.branchName,
                            isExternalLabel: true,
                          ),
                          AppTextField(
                            formControl: formModel.addressControl,
                            labelText: t.settings.profile.address,
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
                          Text(t.parking.capacity),
                          ...state.maybeMap(
                            loaded: (params) => params.parkingLot.capacity
                                .map(
                                  (e) => AppTextField(
                                    formControl: formModel
                                        .capacityParkingLotCapacityForm[params
                                            .parkingLot
                                            .capacity
                                            .indexOf(e)]
                                        .capacityControl,
                                    labelText:
                                        t['vehicles.${e.vehicleType.name}'] ??
                                        e.vehicleType.name,
                                    isExternalLabel: true,
                                  ),
                                )
                                .toList(),
                            loading: (_) => List.generate(
                              3,
                              (index) => AppTextField(
                                formControl: formModel
                                    .capacityParkingLotCapacityForm[index]
                                    .capacityControl,
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
                            leadingIcon: Symbols.notifications_rounded,
                            text: t.parking.warningThreshold.title,
                            trailing: AppSwitch(
                              formControl: formModel.isLockedControl,
                              onToggle: (value, toggle) => value
                                  ? toggle(false)
                                  : DialogHelper.showModal(
                                      context,
                                      okText: t.common.actions.lock,
                                      cancelText: t.common.actions.close,
                                      type: .warning,
                                      onOk: () => toggle(true),
                                      onCancel: () => toggle(false),
                                    ),
                            ),
                          ),
                          Text(
                            t.parking.warningThreshold.subtitle,
                            style: AppTextStyles.bodySmallMedium.copyWith(
                              color: AppColors.of(context).outline,
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
