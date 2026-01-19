import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zupa/core/constants/routes.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/helper/auth/auth_helper.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';

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
      title: context.tr('settings'),
      hasAppBar: false,
      child: Padding(
        padding: const .symmetric(vertical: 16, horizontal: 24),
        child: Column(
          spacing: 10,
          children: [
            AppCard(
              padding: const .symmetric(vertical: 4, horizontal: 16),
              child: Column(
                children: [
                  AppListTile(
                    leadingIconPath: AppIcons.homeOutline,
                    leadingColor: ThemeHelper.getColor(context).primary500,
                    text: context.tr('parkingAreaConfig'),
                    trailingIconPath: AppIcons.chevronRight,
                    onTap: () => context.pushNamed(AppRoutes.parking),
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  AppListTile(
                    leadingIconPath: AppIcons.calendarEdit,
                    leadingColor: ThemeHelper.getColor(context).primary500,
                    text: context.tr('memberVehicles'),
                    trailingIconPath: AppIcons.chevronRight,
                    onTap: () => context.pushNamed(AppRoutes.memberVehicles),
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  AppListTile(
                    leadingIconPath: AppIcons.userEdit,
                    leadingColor: ThemeHelper.getColor(context).primary500,
                    text: context.tr('employeeManagement'),
                    trailingIconPath: AppIcons.chevronRight,
                    onTap: () =>
                        context.pushNamed(AppRoutes.employeeManagement),
                  ),
                  Divider(color: ThemeHelper.getColor(context).grey100),
                  AppListTile(
                    leadingIconPath: AppIcons.config,
                    leadingColor: ThemeHelper.getColor(context).primary500,
                    text: context.tr('generalConfig'),
                    trailingIconPath: AppIcons.chevronRight,
                    onTap: () => context.pushNamed(AppRoutes.generalConfig),
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
                    text: context.tr('changePassword'),
                    trailingIconPath: AppIcons.chevronRight,
                    onTap: () => context.pushNamed('ChangePassword'),
                  ),
                ],
              ),
            ),
            AppCard(
              padding: const .symmetric(vertical: 4, horizontal: 16),
              child: AppListTile(
                leadingIconPath: AppIcons.outlineSetting,
                text: context.tr('appSettings'),
                leadingColor: ThemeHelper.getColor(context).primary500,
                trailingIconPath: AppIcons.chevronRight,
                onTap: () => context.pushNamed('AppSettings'),
              ),
            ),
            AppCard(
              padding: const .symmetric(vertical: 4, horizontal: 16),
              child: AppListTile(
                leadingIconPath: AppIcons.logout,
                text: context.tr('title.logout'),
                leadingColor: ThemeHelper.getColor(context).error600,
                onTap: () async {
                  await AuthHelper.removeAuth();
                  context.mounted
                      ? context.goNamed(AppRoutes.login)
                      : AppToast.showErrorToast(
                          'Xảy ra lỗi không xác định! Vui lòng thoát ứng dụng và vào lại để đảm bảo ứng dụng hoạt động bình thường.',
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
