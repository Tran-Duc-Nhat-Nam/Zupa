
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/features/settings/presentation/bloc/member_vehicles/filter/member_vehicles_filter_cubit.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/gen/strings.g.dart';

class MemberVehiclesSearchBar extends StatelessWidget {
  const MemberVehiclesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberVehiclesFilterCubit, MemberVehiclesFilterState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is Loading,
          child: AppTextField(
            name: 'keyword',
            prefixIconPath: AppIcons.search,
            hintText: Translations.of(context).search,
            onChanged: (value) =>
                context.read<MemberVehiclesFilterCubit>().search(value),
          ),
        );
      },
    );
  }
}

