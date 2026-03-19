import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_switch.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/general_config/presentation/bloc/general_config_cubit.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

@RoutePage()
class GeneralConfigScreen extends StatefulWidget {
  const GeneralConfigScreen({super.key});

  @override
  AppState<GeneralConfigScreen> createState() => _GeneralConfigScreenState();
}

class _GeneralConfigScreenState extends AppState<GeneralConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: t.settings.generalConfig,
      child: BlocProvider<GeneralConfigCubit>(
        create: (context) => getIt<GeneralConfigCubit>()..init(),
        child: BlocBuilder<GeneralConfigCubit, GeneralConfigState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: Padding(
                padding: const .symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  spacing: 10,
                  children: [
                    AppCard(
                      child: Column(
                        children: [
                          AppListTile(
                            leadingIcon: Symbols.settings_rounded,
                            text: t.parking.price,
                            trailingIcon: Symbols.chevron_right_rounded,
                            onTap: () => context.pushRoute(
                              const ParkingPriceSettingRoute(),
                            ),
                          ),
                          Divider(color: AppColors.of(context).surfaceContainerHighest),
                          AppListTile(
                            leadingIcon: Symbols.calendar_add_on_rounded,
                            text: t.parking.memberFee,
                            trailingIcon: Symbols.chevron_right_rounded,
                            onTap: () =>
                                context.pushRoute(const MemberFeeSetingRoute()),
                          ),
                        ],
                      ),
                    ),
                    AppCard(
                      child: Column(
                        spacing: 10,
                        children: [
                          AppListTile(
                            padding: .zero,
                            leadingIcon: Symbols.notifications_rounded,
                            text: t.parking.warningThreshold.title,
                            trailing: Transform.scale(
                              scale: 0.8,
                              child: AppSwitch(
                                formControl: context
                                    .read<GeneralConfigCubit>()
                                    .formModel
                                    .isWarningControl,
                                onToggle: (value, toggle) {
                                  context
                                      .read<GeneralConfigCubit>()
                                      .setWarning();
                                  toggle(value);
                                },
                              ),
                            ),
                          ),
                          if (state.maybeWhen(
                            loaded: (isWarning, _) => isWarning,
                            orElse: () => false,
                          )) ...[
                            AppTextField(
                              formControl: context
                                  .read<GeneralConfigCubit>()
                                  .formModel
                                  .warningThresholdControl,
                              hintText: t.common.errors.enterInteger,
                              required: true,
                            ),
                            Text(
                              t.parking.warningThreshold.subtitle,
                              style: AppTextStyles.bodySmallMedium.copyWith(
                                color: AppColors.of(context).outline,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
