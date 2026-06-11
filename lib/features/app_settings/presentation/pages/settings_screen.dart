import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return AppScreen(
      hasParentView: true,
      title: t.settings.title,
      child: Padding(
        padding: const .symmetric(horizontal: 36),
        child: Column(
          spacing: 24,
          children: [
            AppList(
              items: [
                .new(
                  leadingIcon: Symbols.home_rounded,
                  leadingColor: colorScheme.primary,
                  text: t.parking.areaConfig,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const ParkingLotRoute()),
                ),
                .new(
                  leadingIcon: Symbols.calendar_add_on_rounded,
                  leadingColor: colorScheme.primary,
                  text: t.parking.memberVehicles,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const MemberVehiclesRoute()),
                ),
                .new(
                  leadingIcon: Symbols.user_attributes_rounded,
                  leadingColor: colorScheme.primary,
                  text: t.parking.staff,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () =>
                      context.pushRoute(const EmployeeManagementRoute()),
                ),
                .new(
                  leadingIcon: Symbols.smart_toy_rounded,
                  leadingColor: colorScheme.primary,
                  text: t.chatbot.title,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const ChatbotRoute()),
                ),
                .new(
                  leadingIcon: Symbols.settings_applications_rounded,
                  leadingColor: colorScheme.primary,
                  text: t.settings.generalConfig,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const GeneralConfigRoute()),
                ),
              ],
            ),
            AppList(
              items: [
                .new(
                  leadingIcon: Symbols.lock_reset_rounded,
                  leadingColor: colorScheme.primary,
                  text: t.settings.changePassword,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const ChangePasswordRoute()),
                ),
              ],
            ),
            AppList(
              items: [
                .new(
                  leadingIcon: Symbols.settings_rounded,
                  text: t.settings.appSettings,
                  leadingColor: colorScheme.primary,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const AppSettingsRoute()),
                ),
                .new(
                  leadingIcon: Symbols.info_rounded,
                  text: t.settings.aboutApp,
                  leadingColor: colorScheme.primary,
                  trailingIcon: Symbols.chevron_right_rounded,
                  onTap: () => context.pushRoute(const AboutAppRoute()),
                ),
                .new(
                  leadingIcon: Symbols.logout_rounded,
                  text: t.auth.logout.title,
                  leadingColor: colorScheme.error,
                  color: colorScheme.error,
                  onTap: () => DialogHelper.showModal(
                    context,
                    subtitleText: t.auth.logout.subtitle,
                    titleText: t.auth.logout.title,
                    type: .warning,
                    okText: t.common.actions.ok,
                    cancelText: t.common.actions.cancel,
                    onOk: context.read<AuthCubit>().logOut,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
