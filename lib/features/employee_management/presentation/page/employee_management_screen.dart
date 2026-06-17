import 'package:auto_route/auto_route.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/employee_management/presentation/bloc/list/employee_list_bloc.dart';
import 'package:zupa/features/employee_management/presentation/model/form/list/employee_list_form.dart';

@RoutePage()
class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({super.key});

  @override
  AppState<EmployeeManagementScreen> createState() =>
      _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState
    extends AppState<EmployeeManagementScreen> {
  final refreshController = EasyRefreshController(
    controlFinishLoad: true,
    controlFinishRefresh: true,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return EmployeeListFormBuilder(
      builder: (context, formModel, child) => AppScreen(
        title: t.employeeManagement.title,
        isChildScrollable: true,
        child: BlocProvider<EmployeeListBloc>(
          create: (context) =>
              getIt<EmployeeListBloc>()..add(const LoadEmployeeList()),
          child: BlocConsumer<EmployeeListBloc, EmployeeListState>(
            listener: (context, state) {
              switch (state) {
                case Loaded(:final params):
                  formModel.updateValue(.fromParams(params));
                  refreshController.finishRefresh();
                  refreshController.finishLoad();
                case Failed(:final message):
                  MessageHelper.showError(
                    context,
                    message: message ?? t.common.errors.unknown,
                  );
                  refreshController.finishRefresh(.fail);
                  refreshController.finishLoad(.fail);
                case Empty():
                  refreshController.finishRefresh();
                  refreshController.finishLoad();
                default:
                  break;
              }
            },
            builder: (context, state) => Skeletonizer(
              enabled: state is Loading,
              child: EasyRefresh(
                controller: refreshController,
                onRefresh: () => context.read<EmployeeListBloc>().add(
                  RefreshEmployeeList(params: formModel.model.toParams()),
                ),
                onLoad: () => context.read<EmployeeListBloc>().add(
                  LoadMoreEmployeeList(params: formModel.model.toParams()),
                ),
                header: const MaterialHeader(),
                footer: const MaterialFooter(
                  clamping: false,
                  infiniteOffset: 0,
                  infiniteHitOver: false,
                ),
                canRefreshAfterNoMore: true,
                canLoadAfterNoMore: true,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const .symmetric(vertical: 16, horizontal: 24),
                    child: state.maybeMap(
                      loaded: (params) => AppList(
                        items: params.employees
                            .map(
                              (employee) => AppListItem(
                                leadingIcon: Symbols.settings_rounded,
                                content: Row(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      employee.fullName,
                                      style: AppTextStyles.bodyMediumMedium
                                          .copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                    Icon(
                                      Symbols.lock_rounded,
                                      color: colorScheme.error,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                trailingIcon: Symbols.chevron_right_rounded,
                                onTap: () => context.pushRoute(
                                  EmployeeRoute(employeeId: employee.id),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      loading: (_) => AppList(
                        items: List.generate(
                          10,
                          (index) => .new(
                            leadingIcon: Symbols.settings_rounded,
                            text: 'Placeholder name ${index.toString()}',
                            trailingIcon: Symbols.chevron_right_rounded,
                          ),
                        ),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
