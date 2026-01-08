import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/home/filter/home_filter_cubit.dart';
import '../../../common/styles/icons.dart';
import '../../../widgets/app_text_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFilterCubit, HomeFilterState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is Loading,
          child: AppTextField(
            name: 'keyword',
            hintText: context.tr('ticketSearch'),
            borderRadius: 100,
            prefixIconPath: AppIcons.search,
            suffixIconPath: AppIcons.filter,
            onChanged: (value) =>
                context.read<HomeFilterCubit>().search(value),
          ),
        );
      },
    );
  }
}
