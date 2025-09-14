import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/settings/employee/employee_settings_cubit.dart';
import '../../../common/styles/icons.dart';
import '../../../common/styles/text_styles.dart';
import '../../../helper/theme/theme_helper.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/app_list_tile.dart';
import '../../../widgets/app_screen.dart';
import '../../../widgets/state/app_state.dart';

class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({super.key});

  @override
  State<EmployeeManagementScreen> createState() =>
      _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState
    extends AppState<EmployeeManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: context.tr('parkingAreaConfig'),
      isChildScrollable: true,
      child: BlocProvider<EmployeeSettingsCubit>(
        create: (context) => EmployeeSettingsCubit()..init(context),
        child: BlocBuilder<EmployeeSettingsCubit, EmployeeSettingsState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: AppCard(
                  child: switch (state) {
                    Loaded(:final employees) => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder:
                          (context, index) => AppListTile(
                            leadingIconPath: AppIcons.outlineSetting,
                            content: Row(
                              spacing: 8,
                              children: [
                                Text(
                                  employees[index].fullName,
                                  style: AppTextStyles.bodyMediumMedium
                                      .copyWith(
                                        color:
                                            ThemeHelper.getColor(
                                              context,
                                            ).grey700,
                                      ),
                                ),
                                AppIcon(
                                  path: AppIcons.lock,
                                  color: ThemeHelper.getColor(context).error600,
                                  size: 16,
                                ),
                              ],
                            ),
                            trailingIconPath: AppIcons.chevronRight,
                            onTap:
                                () => context.pushNamed(
                                  'ParkingDetail',
                                  extra: employees[index],
                                ),
                          ),
                      separatorBuilder:
                          (context, index) => Divider(
                            color: ThemeHelper.getColor(context).grey100,
                          ),
                      itemCount: employees.length,
                    ),
                    Loading() => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder:
                          (context, index) => const AppListTile(
                            leadingIconPath: AppIcons.outlineSetting,
                            text: 'Placeholder name',
                            trailingIconPath: AppIcons.chevronRight,
                          ),
                      separatorBuilder:
                          (context, index) => Divider(
                            color: ThemeHelper.getColor(context).grey100,
                          ),
                      itemCount: 3,
                    ),
                    _ => const SizedBox.shrink(),
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
