import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/member_vehicles/presentation/bloc/list/member_vehicles_list_cubit.dart';
import 'package:zupa/features/member_vehicles/presentation/models/member_vehicle_list_form.dart';

class MemberVehiclesSearchBar extends StatelessWidget {
  const MemberVehiclesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveMemberVehiclesListForm.of(context);
    return BlocBuilder<MemberVehiclesListCubit, MemberVehiclesListState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is Loading,
          child: ReactiveValueListenableBuilder<String>(
            formControl: form?.keywordControl,
            builder: (context, control, child) => AppTextField(
              prefixIcon: Symbols.search_rounded,
              hintText: t.common.actions.search,
              onChanged: (value) =>
                  context.read<MemberVehiclesListCubit>().refresh(
                    filter: form?.model.toParams() ?? .initial(keyword: value),
                  ),
            ),
          ),
        );
      },
    );
  }
}
