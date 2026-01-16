import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:zupa/features/settings/presentation/bloc/parking/parking_settings_cubit.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_icon.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/di/injection.dart';

class ParkingSettingsScreen extends StatefulWidget {
  const ParkingSettingsScreen({super.key});

  @override
  State<ParkingSettingsScreen> createState() => _ParkingSettingsScreenState();
}

class _ParkingSettingsScreenState extends AppState<ParkingSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: context.tr('parkingAreaConfig'),
      isChildScrollable: true,
      child: BlocProvider<ParkingSettingsCubit>(
        create: (context) => getIt<ParkingSettingsCubit>()..init(),
        child: BlocBuilder<ParkingSettingsCubit, ParkingSettingsState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: AppCard(
                  child: state.maybeMap(
                    loaded: (params) => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => AppListTile(
                        leadingIconPath: AppIcons.outlineSetting,
                        content: Row(
                          spacing: 8,
                          children: [
                            Text(
                              params.parkingLots[index].name,
                              style: AppTextStyles.bodyMediumMedium.copyWith(
                                color: ThemeHelper.getColor(context).grey700,
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
                        onTap: () => context.pushNamed(
                          'ParkingDetail',
                          extra: params.parkingLots[index],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          Divider(color: ThemeHelper.getColor(context).grey100),
                      itemCount: params.parkingLots.length,
                    ),
                    loading: (_) => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const AppListTile(
                        leadingIconPath: AppIcons.outlineSetting,
                        text: 'Placeholder name',
                        trailingIconPath: AppIcons.chevronRight,
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

