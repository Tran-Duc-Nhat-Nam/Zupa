import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_switch.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/features/parking/presentation/bloc/detail/parking_lot_detail_cubit.dart';
import 'package:zupa/features/parking/presentation/models/parking_lot_detail_form.dart';

@RoutePage()
class ParkingDetailsScreen extends StatelessWidget {
  const ParkingDetailsScreen({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return AppScreen(
      title: t.parking.areaConfig,
      isChildScrollable: true,
      footer: [
        AppButton(
          text: t.common.actions.save,
          onPressed: () =>
              AppToast.showToast(t.common.success, context: context),
        ),
      ],
      child: ParkingLotDetailFormBuilder(
        builder: (context, formModel, child) => BlocProvider<ParkingLotDetailCubit>(
          create: (_) => getIt<ParkingLotDetailCubit>()..init(),
          child: BlocBuilder<ParkingLotDetailCubit, ParkingLotDetailState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: state is Loading,
                child: Padding(
                  padding: const .symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    children: [
                      Container(
                        padding: const .all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLow,
                          borderRadius: .circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          spacing: 12,
                          children: [
                            Text(
                              t.common.info.info,
                              style: AppTextStyles.titleSmallBold.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            ReactiveValueListenableBuilder<String>(
                              formControl: formModel.branchNameControl,
                              builder: (context, control, child) =>
                                  AppTextField(
                                    labelText: t.settings.profile.branchName,
                                    initialValue: control.value,
                                    onChanged: (val) =>
                                        control.updateValue(val),
                                    errorText:
                                        control.invalid && control.touched
                                        ? t.common.errors.required
                                        : null,
                                    isExternalLabel: true,
                                  ),
                            ),
                            ReactiveValueListenableBuilder<String>(
                              formControl: formModel.addressControl,
                              builder: (context, control, child) =>
                                  AppTextField(
                                    labelText: t.settings.profile.address,
                                    initialValue: control.value,
                                    onChanged: (val) =>
                                        control.updateValue(val),
                                    errorText:
                                        control.invalid && control.touched
                                        ? t.common.errors.required
                                        : null,
                                    isExternalLabel: true,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const .all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLow,
                          borderRadius: .circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          spacing: 8,
                          children: [
                            Text(
                              t.parking.capacity,
                              style: AppTextStyles.titleSmallBold.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            ...state.maybeMap(
                              loaded: (params) => params.parkingLot.capacity
                                  .map(
                                    (
                                      e,
                                    ) => ReactiveValueListenableBuilder<String>(
                                      formControl: formModel
                                          .capacityParkingLotCapacityForm[params
                                              .parkingLot
                                              .capacity
                                              .indexOf(e)]
                                          .capacityControl,
                                      builder: (context, control, child) =>
                                          AppTextField(
                                            labelText:
                                                t['vehicles.${e.vehicleType.name}'] ??
                                                e.vehicleType.name,
                                            isExternalLabel: true,
                                          ),
                                    ),
                                  )
                                  .toList(),
                              loading: (_) => List.generate(
                                3,
                                (index) =>
                                    ReactiveValueListenableBuilder<String>(
                                      formControl: formModel
                                          .capacityParkingLotCapacityForm[index]
                                          .capacityControl,
                                      builder: (context, control, child) =>
                                          AppTextField(
                                            labelText: vehicleTypes[index].name,
                                            isExternalLabel: true,
                                          ),
                                    ),
                              ),
                              orElse: () => [],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            AppList(
                              segmented: false,
                              padding: EdgeInsets.zero,
                              items: [
                                AppListItem(
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
                                            type: AppDialogType.warning,
                                            onOk: () => toggle(true),
                                            onCancel: () => toggle(false),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Column(
                                children: [
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: AppColors.of(
                                      context,
                                    ).outlineVariant.withAlpha(100),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    t.parking.warningThreshold.subtitle,
                                    style: AppTextStyles.bodySmallMedium
                                        .copyWith(color: colorScheme.outline),
                                  ),
                                ],
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
      ),
    );
  }
}
