import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_checkbox.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart';
import 'package:zupa/gen/strings.g.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({
    super.key,
    required ValueNotifier<bool> isScrolledNotifier,
  }) : _isScrolledNotifier = isScrolledNotifier;
  final ValueNotifier<bool> _isScrolledNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isScrolledNotifier,
      builder: (context, isScrolled, child) {
        final backgroundColor = ThemeHelper.getColor(context).primary400;
        final showWhiteBackground = isScrolled;

        return AnimatedContainer(
          duration: const .new(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: showWhiteBackground
              ? const .symmetric(vertical: 10)
              : const .only(top: 10),
          decoration: BoxDecoration(
            color: showWhiteBackground
                ? backgroundColor
                : backgroundColor.withAlpha(0),
            boxShadow: [
              BoxShadow(
                color: showWhiteBackground
                    ? Colors.black.withAlpha(12)
                    : Colors.transparent,
                blurRadius: 4,
                offset: const .new(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const .symmetric(horizontal: 24, vertical: 6),
            child: BlocBuilder<HistoryFilterCubit, HistoryFilterState>(
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
                    onChanged: (value) => context
                        .read<HistoryFilterCubit>()
                        .update(keyword: value),
                  ),
                );
              },
            ),
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
            Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      t.vehicleType,
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
                Row(
                  spacing: 32,
                  children: vehicleTypes
                      .map(
                        (item) => AppCheckbox(
                          name: item.value,
                          label: Text(
                            t[item.value],
                            style: AppTextStyles.bodySmallMedium.copyWith(
                              color: ThemeHelper.getColor(context).grey700,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
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
