import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../bloc/history/filter/history_filter_cubit.dart' as filter;
import '../../bloc/history/list/history_list_cubit.dart';
import '../../common/constants/vehicle_types.dart';
import '../../helper/theme/theme_helper.dart';
import '../../common/styles/icons.dart';
import '../../common/styles/text_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_checkbox.dart';
import '../../widgets/app_date_time_picker.dart';
import '../../widgets/app_drop_down_search.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/app_screen.dart';
import '../../widgets/app_text_field.dart';
import 'widgets/history_list_tab.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      isChildScrollable: true,
      title: context.tr('history'),
      appBarTrailing: const [
        Padding(
          padding: EdgeInsets.only(right: 24),
          child: AppDropDownSearch(
            name: 'parkingLot',
            dropdownItems: ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'],
            initialValue: 'Bãi xe 2',
            buttonWidth: 140,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HistoryListCubit>(
            create: (context) => HistoryListCubit()..init(context),
          ),
          BlocProvider<filter.HistoryFilterCubit>(
            create:
                (context) =>
                    filter.HistoryFilterCubit()..load(context, () {
                      return {};
                    }),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<HistoryListCubit, HistoryListState>(
              listener: (context, state) {
                switch (state) {
                  case Loaded():
                    {
                      context.read<filter.HistoryFilterCubit>().init(context);
                    }
                  default:
                    {}
                }
              },
            ),
          ],
          child: Column(
            spacing: 10,
            children: [
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlocBuilder<
                  filter.HistoryFilterCubit,
                  filter.HistoryFilterState
                >(
                  builder: (context, state) {
                    return Skeletonizer(
                      enabled: state is filter.Loading,
                      child: Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: AppTextField(
                              name: 'keyword',
                              prefixIconPath: AppIcons.search,
                              hintText: context.tr('ticketSearch'),
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Skeleton.replace(
                              width: 44,
                              height: 44,
                              child: SizedBox(
                                width: 44,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: AppButton(
                                    fitContent: true,
                                    theme: AppButtonTheme.outline,
                                    padding: const EdgeInsets.all(8),
                                    radius: BorderRadius.circular(8),
                                    color: AppButtonColor.basic,
                                    icon: AppIcon(
                                      path: AppIcons.filter,
                                      size: 20,
                                      color:
                                          ThemeHelper.getColor(context).grey900,
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder:
                                            (context) => Padding(
                                              padding: const EdgeInsets.only(
                                                top: 24,
                                                bottom: 48,
                                                left: 24,
                                                right: 24,
                                              ),
                                              child: Column(
                                                spacing: 16,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      context.tr('filter'),
                                                      style: AppTextStyles
                                                          .bodySmallSemibold
                                                          .copyWith(
                                                            color:
                                                                ThemeHelper.getColor(
                                                                  context,
                                                                ).grey600,
                                                          ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        context.tr('time'),
                                                        style: AppTextStyles
                                                            .bodyMediumSemibold
                                                            .copyWith(
                                                              color:
                                                                  ThemeHelper.getColor(
                                                                    context,
                                                                  ).grey700,
                                                            ),
                                                      ),
                                                      Text(
                                                        context.tr('reset'),
                                                        style: AppTextStyles
                                                            .bodyMediumSemibold
                                                            .copyWith(
                                                              color:
                                                                  ThemeHelper.getColor(
                                                                    context,
                                                                  ).primary500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    spacing: 12,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(context.tr('date')),
                                                      const AppDateTimePicker(
                                                        name: 'dateTime',
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(),
                                                  Column(
                                                    spacing: 12,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            context.tr(
                                                              'vehicleType',
                                                            ),
                                                            style: AppTextStyles
                                                                .bodyMediumSemibold
                                                                .copyWith(
                                                                  color:
                                                                      ThemeHelper.getColor(
                                                                        context,
                                                                      ).grey700,
                                                                ),
                                                          ),
                                                          Text(
                                                            context.tr('reset'),
                                                            style: AppTextStyles
                                                                .bodyMediumSemibold
                                                                .copyWith(
                                                                  color:
                                                                      ThemeHelper.getColor(
                                                                        context,
                                                                      ).primary500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        spacing: 32,
                                                        children:
                                                            vehicleTypes
                                                                .map(
                                                                  (
                                                                    item,
                                                                  ) => AppCheckbox(
                                                                    name:
                                                                        item.value,
                                                                    label: Text(
                                                                      context.tr(
                                                                        item.value,
                                                                      ),
                                                                      style: AppTextStyles.bodySmallMedium.copyWith(
                                                                        color:
                                                                            ThemeHelper.getColor(
                                                                              context,
                                                                            ).grey700,
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
                                                          color:
                                                              AppButtonColor
                                                                  .basic,
                                                          theme:
                                                              AppButtonTheme
                                                                  .outline,
                                                          onPressed:
                                                              () =>
                                                                  context.pop(),
                                                          text: context.tr(
                                                            'cancel',
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: AppButton(
                                                          onPressed:
                                                              () =>
                                                                  context.pop(),
                                                          text: context.tr(
                                                            'apply',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                        useRootNavigator: true,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Expanded(child: HistoryListTab()),
            ],
          ),
        ),
      ),
    );
  }
}
