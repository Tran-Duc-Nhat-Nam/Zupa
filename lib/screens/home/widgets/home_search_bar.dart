import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/home/filter/home_filter_cubit.dart';
import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/icons.dart';
import '../../../common/styles/text_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_date_time_picker.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/app_text_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFilterCubit, HomeFilterState>(
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
                  hintText: context.tr('ticketSearch'),
                  borderRadius: 100,
                  onChanged: (value) =>
                      context.read<HomeFilterCubit>().search(value),
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
                        theme: AppButtonTheme.outline,
                        padding: const .all(8),
                        radius: .circular(8),
                        color: AppButtonColor.basic,
                        icon: AppIcon(
                          path: AppIcons.filter,
                          size: 20,
                          color: ThemeHelper.getColor(context).grey900,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                Padding(
                                  padding: const .only(
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
                                          style: AppTextStyles
                                              .bodySmallSemibold
                                              .copyWith(
                                            color: ThemeHelper.getColor(context).grey600,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        .spaceBetween,
                                        children: [
                                          Text(
                                            context.tr('time'),
                                            style: AppTextStyles
                                                .bodyMediumSemibold
                                                .copyWith(
                                              color: ThemeHelper.getColor(context).grey700,
                                            ),
                                          ),
                                          Text(
                                            context.tr('reset'),
                                            style: AppTextStyles
                                                .bodyMediumSemibold
                                                .copyWith(
                                              color: ThemeHelper.getColor(context).primary500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        spacing: 12,
                                        crossAxisAlignment:
                                        .start,
                                        children: [
                                          Text(
                                            context.tr('date'),
                                          ),
                                          const AppDateTimePicker(
                                            name: 'dateTime',
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
                                          )
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
    );
  }
}
