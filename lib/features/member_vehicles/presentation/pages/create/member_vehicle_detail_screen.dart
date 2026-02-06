import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/features/member_vehicles/presentation/bloc/detail/member_vehicle_detail_cubit.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class MemberVehicleDetailScreen extends StatefulWidget {
  const MemberVehicleDetailScreen({super.key, this.code});

  final String? code;

  @override
  AppState<MemberVehicleDetailScreen> createState() =>
      _MemberVehicleDetailScreenState();
}

class _MemberVehicleDetailScreenState
    extends AppState<MemberVehicleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberVehicleDetailCubit>(
      create: (context) =>
          getIt<MemberVehicleDetailCubit>()..init(code: widget.code),
      child: BlocBuilder<MemberVehicleDetailCubit, MemberVehicleDetailState>(
        builder: (context, state) {
          final formModel = context.read<MemberVehicleDetailCubit>().formModel;

          return AppScreen(
            isChildScrollable: true,
            noBackground: true,
            title: widget.code != null
                ? t.memberVehicleDetail
                : t.createMemberVehicle,
            footer: [
              AppButton(
                onPressed: context.read<MemberVehicleDetailCubit>().create,
                text: t.save,
              ),
              if (widget.code != null)
                AppButton(
                  theme: .outline,
                  color: .error,
                  onPressed: () => context
                      .read<MemberVehicleDetailCubit>()
                      .delete(widget.code!),
                  text: t.delete,
                ),
            ],
            child: AppCard(
              child: Column(
                spacing: 8,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: ThemeHelper.getColor(context).primary50,
                      borderRadius: .circular(8),
                    ),
                    child: Center(
                      child: InkWell(
                        child: const Icon(Symbols.camera_rounded),
                        onTap: () => context.pushRoute(CheckInRoute()),
                      ),
                    ),
                  ),
                  AppTextField(
                    formControl: formModel.nameControl,
                    labelText: t.name,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    formControl: formModel.phoneNumberControl,
                    labelText: t.phoneNumber,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    formControl: formModel.licenseNumberControl,
                    labelText: t.licenseNumber,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch<String>(
                    formControl: formModel.branchControl,
                    dropdownItems: const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'],
                    hint: t.choose,
                  ),
                  AppDropDownSearch<VehicleType>(
                    formControl: formModel.vehicleTypeControl,
                    dropdownItems: vehicleTypes,
                    hint: t.choose,
                  ),
                  AppTextField(
                    formControl: formModel.ticketIDControl,
                    labelText: t.ticketID,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch<Duration>(
                    formControl: formModel.expiredInControl,
                    dropdownItems: const [
                      Duration(days: 30),
                      Duration(days: 60),
                    ],
                    hint: t.choose,
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
