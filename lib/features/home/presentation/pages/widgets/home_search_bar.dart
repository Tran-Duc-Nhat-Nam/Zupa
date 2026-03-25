import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/styles/colors.dart';

import 'package:zupa/features/home/presentation/bloc/filter/home_filter_cubit.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/home/presentation/models/home_form.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return BlocBuilder<HomeFilterCubit, HomeFilterState>(
      builder: (context, state) {
        return HomeFormBuilder(
          builder: (context, formModel, child) {
            return Skeletonizer(
              enabled: state is Loading,
              child: AppTextField(
                formControl: formModel.keywordControl,
                hintText: t.parking.ticketSearch,
                borderRadius: 100,
                hasBorder: false,
                backgroundColor: colorScheme.surfaceContainer,
                prefix: Icon(
                  Symbols.search_rounded,
                  size: 24,
                  color: colorScheme.onSurfaceVariant,
                ),
                suffix: InkWell(
                  child: Icon(
                    Symbols.filter_alt_rounded,
                    size: 24,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onTap: () => _showFilter(context, formModel),
                ),
                onChanged: (value) => context.read<HomeFilterCubit>().search(),
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> _showFilter(BuildContext context, HomeForm formModel) {
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
                t.common.actions.filter,
                style: AppTextStyles.bodySmallSemibold.copyWith(
                  color: AppColors.of(context).onSurfaceVariant,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  t.common.info.time,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: AppColors.of(context).onSurfaceVariant,
                  ),
                ),
                Text(
                  t.common.actions.reset,
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: AppColors.of(context).primary,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                Text(t.common.info.date),
                AppDateTimePicker(formControl: formModel.timeControl),
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
                    text: t.common.actions.cancel,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => context.pop(),
                    text: t.common.actions.apply,
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
