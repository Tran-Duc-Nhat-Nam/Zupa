
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';

import 'package:zupa/features/settings/presentation/bloc/member_vehicles/detail/member_vehicle_detail_cubit.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_drop_down_search.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/di/injection.dart';
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
      create: (context) => getIt<MemberVehicleDetailCubit>()..init(code: widget.code),
      child: BlocBuilder<MemberVehicleDetailCubit, MemberVehicleDetailState>(
        builder: (context, state) {
          return AppScreen(
            formKey: formKey,
            isChildScrollable: true,
            noBackground: true,
            title: widget.code != null
                ? t.memberVehicleDetail
                : t.createMemberVehicle,
            footer: [
              AppButton(
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                  if (formKey.currentState?.validate() == true) {
                    context.read<MemberVehicleDetailCubit>().create(
                      formKey.currentState!.value,
                    );
                  }
                },
                text: t.save,
              ),
              AppButton(
                theme: .outline,
                color: .error,
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                  if (formKey.currentState?.validate() == true) {
                    context.read<MemberVehicleDetailCubit>().create(
                      formKey.currentState!.value,
                    );
                  }
                },
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
                      child: AppIcon(
                        onTap: () => context.pushRoute(CheckInRoute()),
                        path: AppIcons.camera,
                      ),
                    ),
                  ),
                  AppTextField(
                    name: 'name',
                    labelText: t.name,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    name: 'phoneNumber',
                    labelText: t.phoneNumber,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    name: 'licenseNumber',
                    labelText: t.licenseNumber,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch(
                    name: 'branch',
                    dropdownItems: vehicleTypes,
                    hint: t.choose,
                  ),
                  AppDropDownSearch(
                    name: 'vehicleType',
                    dropdownItems: vehicleTypes,
                    hint: t.choose,
                  ),
                  AppTextField(
                    name: 'ticketID',
                    labelText: t.ticketID,
                    hintText: t.enter,
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch(
                    name: 'expiredIn',
                    dropdownItems: vehicleTypes,
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
