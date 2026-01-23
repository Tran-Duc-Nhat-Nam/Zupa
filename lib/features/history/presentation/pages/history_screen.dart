import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_checkbox.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/history/presentation/bloc/filter/history_filter_cubit.dart'
    hide Loading;
import 'package:zupa/features/history/presentation/bloc/list/history_list_cubit.dart';
import 'package:zupa/features/history/presentation/pages/widgets/history_list_tab.dart';
import 'package:zupa/gen/strings.g.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _isScrolledNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isScrolledNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      isChildScrollable: true,
      hasParentView: true,
      title: t.history,
      hasAppBar: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HistoryFilterCubit>(
            create: (filterContext) => getIt<HistoryFilterCubit>()..init(),
          ),
          BlocProvider<HistoryListCubit>(
            create: (listContext) => getIt<HistoryListCubit>()..init(),
          ),
        ],
        child: BlocListener<HistoryListCubit, HistoryListState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () => DialogHelper.showAuthDialog(context),
            );
          },
          child: BlocBuilder<HistoryListCubit, HistoryListState>(
            builder: (listContext, listState) {
              return Column(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: _isScrolledNotifier,
                    builder: (context, isScrolled, child) {
                      final backgroundColor = ThemeHelper.getColor(
                        context,
                      ).primary400;
                      final showWhiteBackground =
                          isScrolled && listState is! Refreshing;

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
                          padding: const .symmetric(horizontal: 24),
                          child:
                              BlocBuilder<
                                HistoryFilterCubit,
                                HistoryFilterState
                              >(
                                builder: (context, state) {
                                  return Skeletonizer(
                                    enabled: state is Loading,
                                    child: Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(
                                          child: AppTextField(
                                            name: 'keyword',
                                            prefixIconPath: AppIcons.search,
                                            hintText: Translations.of(
                                              context,
                                            ).ticketSearch,
                                            borderRadius: 100,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 44,
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: AppButton(
                                              fitContent: true,
                                              theme: .outline,
                                              padding: const .all(8),
                                              radius: .circular(8),
                                              color: .basic,
                                              icon: AppIcon(
                                                path: AppIcons.filter,
                                                size: 20,
                                                color: ThemeHelper.getColor(
                                                  context,
                                                ).grey900,
                                              ),
                                              onPressed: () {
                                                showHistoryFilter(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification) {
                          final isScrolled = notification.metrics.pixels > 20;
                          _isScrolledNotifier.value = isScrolled;
                        }
                        return false;
                      },
                      child: const HistoryListTab(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> showHistoryFilter(BuildContext context) {
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
