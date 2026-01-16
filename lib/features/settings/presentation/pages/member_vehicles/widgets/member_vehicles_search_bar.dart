import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/features/settings/presentation/bloc/member_vehicles/filter/member_vehicles_filter_cubit.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/widgets/app_text_field.dart';

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
            hintText: context.tr('search'),
            onChanged: (value) =>
                context.read<MemberVehiclesFilterCubit>().search(value),
          ),
        );
      },
    );
  }
}

