import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/member_vehicles/presentation/bloc/list/member_vehicles_list_cubit.dart';
import 'package:zupa/features/member_vehicles/presentation/models/member_vehicle_list_form.dart';

class MemberVehiclesSearchBar extends StatelessWidget {
  const MemberVehiclesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberVehiclesListCubit, MemberVehiclesListState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is Loading,
          child: AppTextField(
            formControl: ReactiveMemberVehiclesListForm.of(
              context,
            )?.keywordControl,
            prefixIcon: Symbols.search_rounded,
            hintText: t.common.actions.search,
            onChanged: (value) =>
                context.read<MemberVehiclesListCubit>().refresh(
                  filter:
                      ReactiveMemberVehiclesListForm.of(
                        context,
                      )?.model.toParams() ??
                      .initial(),
                ),
          ),
        );
      },
    );
  }
}
