import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

class MemberVehicleDetailScreen extends StatefulWidget {
  const MemberVehicleDetailScreen({super.key});

  @override
  AppState<MemberVehicleDetailScreen> createState() =>
      _MemberVehicleDetailScreenState();
}

class _MemberVehicleDetailScreenState
    extends AppState<MemberVehicleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    final String? code = extra is String ? extra : null;

    return BlocProvider<MemberVehicleDetailCubit>(
      create: (context) => getIt<MemberVehicleDetailCubit>()
        ..init(
          context,
          code: code,
        ),
      child: BlocBuilder<MemberVehicleDetailCubit, MemberVehicleDetailState>(
        builder: (context, state) {
          return AppScreen(
            formKey: formKey,
            isChildScrollable: true,
            noBackground: true,
            title: context.tr(
              GoRouterState.of(context).extra is String
                  ? 'memberVehicleDetail'
                  : 'createMemberVehicle',
            ),
            footer: [
              AppButton(
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                  if (formKey.currentState?.validate() == true) {
                    context.read<MemberVehicleDetailCubit>().create(
                      context,
                      formKey.currentState!.value,
                    );
                  }
                },
                text: context.tr('save'),
              ),
              AppButton(
                theme: AppButtonTheme.outline,
                color: AppButtonColor.error,
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                  if (formKey.currentState?.validate() == true) {
                    context.read<MemberVehicleDetailCubit>().create(
                      context,
                      formKey.currentState!.value,
                    );
                  }
                },
                text: context.tr('delete'),
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: AppIcon(
                        onTap: () => context.pushNamed('CheckIn'),
                        path: AppIcons.camera,
                      ),
                    ),
                  ),
                  AppTextField(
                    name: 'name',
                    labelText: context.tr('name'),
                    hintText: context.tr('enter'),
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    name: 'phoneNumber',
                    labelText: context.tr('phoneNumber'),
                    hintText: context.tr('enter'),
                    isExternalLabel: true,
                  ),
                  AppTextField(
                    name: 'licenseNumber',
                    labelText: context.tr('licenseNumber'),
                    hintText: context.tr('enter'),
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch(
                    name: 'branch',
                    dropdownItems: vehicleTypes,
                    hint: context.tr('choose'),
                  ),
                  AppDropDownSearch(
                    name: 'vehicleType',
                    dropdownItems: vehicleTypes,
                    hint: context.tr('choose'),
                  ),
                  AppTextField(
                    name: 'ticketID',
                    labelText: context.tr('ticketID'),
                    hintText: context.tr('enter'),
                    isExternalLabel: true,
                  ),
                  AppDropDownSearch(
                    name: 'expiredIn',
                    dropdownItems: vehicleTypes,
                    hint: context.tr('choose'),
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

