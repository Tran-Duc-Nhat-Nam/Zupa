import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/member_vehicles/presentation/bloc/detail/member_vehicle_detail_cubit.dart';

@RoutePage()
class MemberVehicleDetailScreen extends StatelessWidget {
  const MemberVehicleDetailScreen({super.key, this.code});

  final String? code;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberVehicleDetailCubit>(
      create: (context) => getIt<MemberVehicleDetailCubit>()..init(code: code),
      child: BlocBuilder<MemberVehicleDetailCubit, MemberVehicleDetailState>(
        builder: (context, state) {
          final formModel = context.read<MemberVehicleDetailCubit>().formModel;

          return AppScreen(
            isChildScrollable: true,
            noBackground: true,
            title: code != null
                ? t.vehicles.memberVehicleDetail
                : t.vehicles.createMemberVehicle,
            footer: [
              AppButton(
                onPressed: context.read<MemberVehicleDetailCubit>().create,
                text: t.common.actions.save,
              ),
              if (code != null)
                AppButton(
                  theme: .outline,
                  color: .error,
                  onPressed: () =>
                      context.read<MemberVehicleDetailCubit>().delete(code!),
                  text: t.common.actions.delete,
                ),
            ],
            child: AppCard(
              child: Column(
                spacing: 16,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.of(context).surfaceContainerHigh,
                      borderRadius: .circular(16),
                    ),
                    child: Center(
                      child: InkWell(
                        child: Icon(
                          Symbols.camera_rounded,
                          color: AppColors.of(context).onSurfaceVariant,
                        ),
                        onTap: () => context.pushRoute(CheckInRoute()),
                      ),
                    ),
                  ),
                  AppTextField(
                    formControl: formModel.nameControl,
                    labelText: t.vehicles.name,
                    hintText: t.common.actions.enter,
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    formControl: formModel.phoneNumberControl,
                    labelText: t.vehicles.phoneNumber,
                    hintText: t.common.actions.enter,
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    formControl: formModel.licenseNumberControl,
                    labelText: t.vehicles.licenseNumber,
                    hintText: t.common.actions.enter,
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch<String>(
                    formControl: formModel.branchControl,
                    dropdownItems: const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'],
                    hint: t.common.actions.choose,
                  ),
                  AppDropDownSearch<VehicleTypeEntity>(
                    formControl: formModel.vehicleTypeControl,
                    dropdownItems: vehicleTypes,
                    hint: t.common.actions.choose,
                    itemLabelGetter: (vehicle) => vehicle != null
                        ? t['vehicles.${vehicle.name}'] ??
                              t.common.errors.unknown
                        : t.common.errors.unknown,
                  ),
                  AppTextField(
                    formControl: formModel.ticketIDControl,
                    labelText: t.parking.ticketID,
                    hintText: t.common.actions.enter,
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch<Duration>(
                    formControl: formModel.expiredInControl,
                    dropdownItems: const [
                      Duration(days: 30),
                      Duration(days: 60),
                    ],
                    hint: t.common.actions.choose,
                    itemLabelGetter: (value) => value?.inDays.toString() ?? t.common.errors.unknown,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
