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
import '../../widgets/app_icon.dart';
import '../../widgets/app_screen.dart';
import '../../widgets/app_text_field.dart';
import 'widgets/history_list_tab.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ValueNotifier<bool> _isScrolledNotifier = .new(false);

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
      title: context.tr('history'),
      hasAppBar: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HistoryListCubit>(
            create: (context) => HistoryListCubit()..init(context),
          ),
          BlocProvider<filter.HistoryFilterCubit>(
            create: (context) => filter.HistoryFilterCubit()
              ..load(context, () {
                return {};
              }),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<HistoryListCubit, HistoryListState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (_, _) =>
                      context.read<filter.HistoryFilterCubit>().init(context),
                );
              },
            ),
          ],
          child: Column(
            children: [
              BlocBuilder<HistoryListCubit, HistoryListState>(
                builder: (context, historyState) {
                  final isRefreshing = historyState.maybeMap(
                    refreshing: (_) => true,
                    orElse: () => false,
                  );

                  return ValueListenableBuilder<bool>(
                    valueListenable: _isScrolledNotifier,
                    builder: (context, isScrolled, child) {
                      final backgroundColor = ThemeHelper.getColor(
                        context,
                      ).primary400;
                      final showWhiteBackground = isScrolled && !isRefreshing;

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
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const .symmetric(horizontal: 24),
                      child:
                          BlocBuilder<
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
                                        borderRadius: 100,
                                      ),
                                    ),
                                    Container(
                                      clipBehavior: .antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: .circular(8),
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
                // 2. Use NotificationListener to catch scroll events bubbling up
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    // Only listen to updates (scrolling in progress)
                    if (notification is ScrollUpdateNotification) {
                      final isScrolled = notification.metrics.pixels > 20;
                      if (_isScrolledNotifier.value != isScrolled) {
                        _isScrolledNotifier.value = isScrolled;
                      }
                    }
                    return false; // Allow notification to continue bubbling if needed
                  },
                  child: const HistoryListTab(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showHistoryFilter(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 48,
          left: 24,
          right: 24,
        ),
        child: Column(
          spacing: 16,
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Center(
              child: Text(
                context.tr('filter'),
                style: AppTextStyles.bodySmallSemibold.copyWith(
                  color: ThemeHelper.getColor(context).grey600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  context.tr('time'),
                  style: AppTextStyles.bodyMediumSemibold.copyWith(
                    color: ThemeHelper.getColor(context).grey700,
                  ),
                ),
                Text(
                  context.tr('reset'),
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
                Text(context.tr('date')),
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
                      context.tr('vehicleType'),
                      style: AppTextStyles.bodyMediumSemibold.copyWith(
                        color: ThemeHelper.getColor(context).grey700,
                      ),
                    ),
                    Text(
                      context.tr('reset'),
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
                            context.tr(item.value),
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
                    text: context.tr('cancel'),
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => context.pop(),
                    text: context.tr('apply'),
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
