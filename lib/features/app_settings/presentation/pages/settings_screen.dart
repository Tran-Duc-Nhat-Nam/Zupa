import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return AppScreen(
      isChildScrollable: true,
      hasParentView: true,
      title: t.settings.title,
      hasAppBar: false,
      child: Padding(
        padding: const .symmetric(vertical: 16, horizontal: 24),
        child: Column(
          spacing: 10,
          children: [
            AppCard(
              clipBehavior: .antiAlias,
              padding: .zero,
              child: Column(
                spacing: 4,
                children: [
                  AppListTile(
                    leadingIcon: Symbols.home_rounded,
                    leadingColor: colorScheme.primary,
                    text: t.parking.areaConfig,
                    trailingIcon: Symbols.chevron_right_rounded,
                    onTap: () => context.pushRoute(const ParkingLotRoute()),
                  ),
                  AppListTile(
                    leadingIcon: Symbols.calendar_add_on_rounded,
                    leadingColor: colorScheme.primary,
                    text: t.parking.memberVehicles,
                    trailingIcon: Symbols.chevron_right_rounded,
                    onTap: () => context.pushRoute(const MemberVehiclesRoute()),
                  ),
                  AppListTile(
                    leadingIcon: Symbols.user_attributes_rounded,
                    leadingColor: colorScheme.primary,
                    text: t.parking.staff,
                    trailingIcon: Symbols.chevron_right_rounded,
                    onTap: () =>
                        context.pushRoute(const EmployeeManagementRoute()),
                  ),
                  AppListTile(
                    leadingIcon: Symbols.settings_applications_rounded,
                    leadingColor: colorScheme.primary,
                    text: t.settings.generalConfig,
                    trailingIcon: Symbols.chevron_right_rounded,
                    onTap: () => context.pushRoute(const GeneralConfigRoute()),
                  ),
                ],
              ),
            ),
            AppCard(
              clipBehavior: .antiAlias,
              padding: .zero,
              child: AppListTile(
                leadingIcon: Symbols.lock_reset_rounded,
                leadingColor: colorScheme.primary,
                text: t.settings.changePassword,
                trailingIcon: Symbols.chevron_right_rounded,
                onTap: () => context.pushRoute(const ChangePasswordRoute()),
              ),
            ),
            AppCard(
              clipBehavior: .antiAlias,
              padding: .zero,
              child: Column(
                children: [
                  AppListTile(
                    leadingIcon: Symbols.settings_rounded,
                    text: t.settings.appSettings,
                    leadingColor: colorScheme.primary,
                    trailingIcon: Symbols.chevron_right_rounded,
                    onTap: () => context.pushRoute(const AppSettingsRoute()),
                  ),
                  AppListTile(
                    leadingIcon: Symbols.info_rounded,
                    text: t.settings.aboutApp,
                    leadingColor: colorScheme.primary,
                    trailingIcon: Symbols.chevron_right_rounded,
                    onTap: () => context.pushRoute(const AboutAppRoute()),
                  ),
                  AppListTile(
                    leadingIcon: Symbols.logout_rounded,
                    text: t.auth.logout.title,
                    leadingColor: colorScheme.error,
                    color: colorScheme.error,
                    onTap: () {
                      DialogHelper.showModal(
                        context,
                        subtitleText: t.auth.logout.subtitle,
                        titleText: t.auth.logout.title,
                        type: .warning,
                        okText: t.common.actions.ok,
                        cancelText: t.common.actions.cancel,
                        onOk: context.read<AuthCubit>().logOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
