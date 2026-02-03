import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/gen/strings.g.dart';

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
            hintText: t.ticketSearch,
            borderRadius: 100,
            hasBorder: false,
            backgroundColor: ThemeHelper.getColor(context).primary50,
            prefixIconPath: AppIcons.search,
            suffix: InkWell(
              child: AppIcon(
                path: AppIcons.filter,
                size: 20,
                color: ThemeHelper.getColor(context).grey400,
              ),
              onTap: () => _showFilter(context),
            ),
            onChanged: (value) => context.read<HomeFilterCubit>().search(value),
          ),
        );
      },
    );
  }

  Future<dynamic> _showFilter(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const .only(top: 24, bottom: 48, left: 24, right: 24),
        child: Column(
          spacing: 16,
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Center(
              child: Text(
                t.filter,
                style: AppTextStyles.bodySmallSemibold.copyWith(
                  color: ThemeHelper.getColor(context).grey600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  t.time,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: ThemeHelper.getColor(context).grey700,
                  ),
                ),
                Text(
                  t.reset,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: ThemeHelper.getColor(context).primary500,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                Text(t.date),
                const AppDateTimePicker(name: 'dateTime'),
              ],
            ),
            const Divider(),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppButton(
                    color: .basic,
                    theme: .outline,
                    onPressed: () => context.pop(),
                    text: t.cancel,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => context.pop(),
                    text: t.apply,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      useRootNavigator: true,
    );
  }
}
