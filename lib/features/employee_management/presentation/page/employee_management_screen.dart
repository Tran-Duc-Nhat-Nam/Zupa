
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/features/employee_management/presentation/bloc/employee_cubit.dart';

import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
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
      title: t.parkingAreaConfig,
      isChildScrollable: true,
      child: BlocProvider<EmployeeCubit>(
        create: (context) => getIt<EmployeeCubit>()..init(),
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const .symmetric(vertical: 16, horizontal: 24),
                child: AppCard(
                  child: state.maybeMap(
                    loaded: (params) => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => AppListTile(
                        leadingIcon: Symbols.settings_rounded,
                        content: Row(
                          spacing: 8,
                          children: [
                            Text(
                              params.employees[index].fullName,
                              style: AppTextStyles.bodyMediumMedium.copyWith(
                                color: ThemeHelper.getColor(context).grey700,
                              ),
                            ),
                            Icon(
                              Symbols.lock,
                              color: ThemeHelper.getColor(context).error600,
                              size: 16,
                            ),
                          ],
                        ),
                        trailingIcon: Symbols.chevron_right_rounded,
                        onTap: () => context.pushRoute(ParkingDetailsRoute()),
                      ),
                      separatorBuilder: (context, index) =>
                          Divider(color: ThemeHelper.getColor(context).grey100),
                      itemCount: params.employees.length,
                    ),
                    loading: (_) => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const AppListTile(
                        leadingIcon: Symbols.settings_rounded,
                        text: 'Placeholder name',
                        trailingIcon: Symbols.chevron_right_rounded,
                      ),
                      separatorBuilder: (context, index) =>
                          Divider(color: ThemeHelper.getColor(context).grey100),
                      itemCount: 3,
                    ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
