import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
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
              context.router.replaceAll([const LoginRoute()]);
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
                      leadingIcon: Symbols.home_rounded,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.parkingAreaConfig,
                      trailingIcon: Symbols.chevron_right_rounded,
                      onTap: () =>
                          context.pushRoute(const ParkingSettingsRoute()),
                    ),
                    AppListTile(
                      leadingIcon: Symbols.calendar_add_on_rounded,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.memberVehicles,
                      trailingIcon: Symbols.chevron_right_rounded,
                      onTap: () =>
                          context.pushRoute(const MemberVehiclesRoute()),
                    ),
                    AppListTile(
                      leadingIcon: Symbols.user_attributes_rounded,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.employeeManagement,
                      trailingIcon: Symbols.chevron_right_rounded,
                      onTap: () =>
                          context.pushRoute(const EmployeeManagementRoute()),
                    ),
                    AppListTile(
                      leadingIcon: Symbols.settings,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.generalConfig,
                      trailingIcon: Symbols.chevron_right_rounded,
                      onTap: () =>
                          context.pushRoute(const GeneralConfigRoute()),
                    ),
                  ],
                ),
              ),
              AppCard(
                padding: const .symmetric(vertical: 4, horizontal: 16),
                child: Column(
                  children: [
                    AppListTile(
                      leadingIcon: Symbols.lock,
                      leadingColor: ThemeHelper.getColor(context).primary500,
                      text: t.changePassword,
                      trailingIcon: Symbols.chevron_right_rounded,
                      onTap: () =>
                          context.pushRoute(const ChangePasswordRoute()),
                    ),
                  ],
                ),
              ),
              AppCard(
                padding: const .symmetric(vertical: 4, horizontal: 16),
                child: AppListTile(
                  leadingIcon: Symbols.settings,
                  text: t.appSettings,
                  leadingColor: ThemeHelper.getColor(context).primary500,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const AppSettingsRoute()),
                ),
              ),
              AppCard(
                padding: const .symmetric(vertical: 4, horizontal: 16),
                child: AppListTile(
                  leadingIcon: Symbols.logout,
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
