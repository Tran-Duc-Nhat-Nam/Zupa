import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/bloc/animation/animation_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_switch.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/general_config/presentation/bloc/general_config_cubit.dart';

@RoutePage()
class GeneralConfigScreen extends StatefulWidget {
  const GeneralConfigScreen({super.key});

  @override
  AppState<GeneralConfigScreen> createState() => _GeneralConfigScreenState();
}

class _GeneralConfigScreenState extends AppState<GeneralConfigScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
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
                  spacing: 24,
                  children: [
                    AppList(
                      items: [
                        AppListItem(
                          leadingIcon: Symbols.settings_rounded,
                          text: t.parking.price,
                          trailingIcon: Symbols.chevron_right_rounded,
                          onTap: () => context.pushRoute(
                            const ParkingPriceSettingRoute(),
                          ),
                        ),
                        AppListItem(
                          leadingIcon: Symbols.calendar_add_on_rounded,
                          text: t.parking.memberFee,
                          trailingIcon: Symbols.chevron_right_rounded,
                          onTap: () =>
                              context.pushRoute(const MemberFeeSetingRoute()),
                        ),
                      ],
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: .circular(16),
                      ),
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          AppList(
                            segmented: false,
                            padding: .zero,
                            items: [
                              AppListItem(
                                leadingIcon: Symbols.notifications_rounded,
                                text: t.parking.warningThreshold.title,
                                trailing: AppSwitch(
                                  formControl: context
                                      .read<GeneralConfigCubit>()
                                      .formModel
                                      .isWarningControl,
                                  onToggle: (value, toggle) {
                                    toggle(value);
                                    context
                                        .read<GeneralConfigCubit>()
                                        .setWarning();
                                  },
                                ),
                              ),
                            ],
                          ),
                          AnimatedSwitcher(
                            duration: context
                                .watch<AnimationCubit>()
                                .state
                                .maybeWhen(
                                  loaded: (isOn) => isOn
                                      ? const Duration(milliseconds: 300)
                                      : .zero,
                                  orElse: () =>
                                      const Duration(milliseconds: 300),
                                ),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                                  return SizeTransition(
                                    sizeFactor: animation,
                                    child: FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    ),
                                  );
                                },
                            child:
                                state.maybeWhen(
                                  loaded: (isWarning, _) => isWarning,
                                  orElse: () => false,
                                )
                                ? Padding(
                                    padding: const .only(
                                      left: 16,
                                      top: 0,
                                      right: 16,
                                      bottom: 16,
                                    ),
                                    child: Column(
                                      key: const ValueKey('threshold_fields'),
                                      children: [
                                        const SizedBox(height: 16),
                                        AppTextField(
                                          formControl: context
                                              .read<GeneralConfigCubit>()
                                              .formModel
                                              .warningThresholdControl,
                                          hintText:
                                              t.common.errors.enterInteger,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          t.parking.warningThreshold.subtitle,
                                          style: AppTextStyles.bodySmallMedium
                                              .copyWith(
                                                color: colorScheme
                                                    .onSurfaceVariant,
                                              ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(
                                    key: ValueKey('threshold_empty'),
                                  ),
                          ),
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
