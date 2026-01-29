import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/gen/strings.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      hasParentView: true,
      title: t.settings,
      hasAppBar: false,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            noAuthenticated: () {
              context.goNamed(AppRoutes.login.name);
            },
          );
        },
        child: Padding(
          padding: const .symmetric(vertical: 16, horizontal: 24),
          child: Column(
            spacing: 10,
            children: [
              AppCard(
                padding: const .symmetric(vertical: 4, horizontal: 16),
                child: Column(
                  spacing: 4,
                  children: [
                    AppListTile(
                      leadingIconPath: AppIcons.homeOutline,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.parkingAreaConfig,
                      trailingIconPath: AppIcons.chevronRight,
                      onTap: () => context.pushNamed(AppRoutes.parking.name),
                    ),
                    AppListTile(
                      leadingIconPath: AppIcons.calendarEdit,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.memberVehicles,
                      trailingIconPath: AppIcons.chevronRight,
                      onTap: () =>
                          context.pushNamed(AppRoutes.memberVehicles.name),
                    ),
                    AppListTile(
                      leadingIconPath: AppIcons.userEdit,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.employeeManagement,
                      trailingIconPath: AppIcons.chevronRight,
                      onTap: () =>
                          context.pushNamed(AppRoutes.employeeManagement.name),
                    ),
                    AppListTile(
                      leadingIconPath: AppIcons.config,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.generalConfig,
                      trailingIconPath: AppIcons.chevronRight,
                      onTap: () =>
                          context.pushNamed(AppRoutes.generalConfig.name),
                    ),
                  ],
                ),
              ),
              AppCard(
                padding: const .symmetric(vertical: 4, horizontal: 16),
                child: Column(
                  children: [
                    AppListTile(
                      leadingIconPath: AppIcons.lock,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.changePassword,
                      trailingIconPath: AppIcons.chevronRight,
                      onTap: () =>
                          context.pushNamed(AppRoutes.changePassword.name),
                    ),
                  ],
                ),
              ),
              AppCard(
                padding: const .symmetric(vertical: 4, horizontal: 16),
                child: AppListTile(
                  leadingIconPath: AppIcons.outlineSetting,
                  text: t.appSettings,
                  leadingColor: ThemeHelper.getColor(context).primary500,
                  trailingIconPath: AppIcons.chevronRight,
                  onTap: () => context.pushNamed(AppRoutes.appSettings.name),
                ),
              ),
              AppCard(
                padding: const .symmetric(vertical: 4, horizontal: 16),
                child: AppListTile(
                  leadingIconPath: AppIcons.logout,
                  text: t.title.logout,
                  leadingColor: ThemeHelper.getColor(context).error600,
                  onTap: () {
                    DialogHelper.showModal(
                      context,
                      subtitleText: t.subtitle.logout,
                      titleText: t.title.logout,
                      type: .warning,
                      okText: t.ok,
                      cancelText: t.cancel,
                      onOk: () {
                        context.read<AuthCubit>().logOut();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
