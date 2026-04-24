import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
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
import 'package:zupa/features/general_config/presentation/models/general_config_form.dart';

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
      child: GeneralConfigFormBuilder(
        builder: (context, formModel, _) => BlocProvider<GeneralConfigCubit>(
          create: (context) => getIt<GeneralConfigCubit>()..init(),
          child: BlocConsumer<GeneralConfigCubit, GeneralConfigState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (isWarning, warningThreshold) {
                  formModel.isWarningValuePatch(isWarning);
                  formModel.warningThresholdValuePatch(warningThreshold);
                },
              );
            },
            builder: (context, state) => Padding(
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
                        onTap: () =>
                            context.pushRoute(const ParkingPriceSettingRoute()),
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
                  Skeletonizer(
                    enabled: state is Loading,
                    child: DecoratedBox(
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
                                trailing: ReactiveValueListenableBuilder<bool>(
                                  formControl: formModel.isWarningControl,
                                  builder: (context, control, _) => AppSwitch(
                                    value: control.value == true,
                                    onToggle: (value) {
                                      control.value = value;
                                      context
                                          .read<GeneralConfigCubit>()
                                          .setConfig(
                                            params: formModel.model.toParams(),
                                          );
                                    },
                                  ),
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
                                      spacing: 16,
                                      children: [
                                        ReactiveValueListenableBuilder<int>(
                                          formControl:
                                              formModel.warningThresholdControl,
                                          builder: (context, control, _) =>
                                              AppTextField(
                                                backgroundColor: colorScheme
                                                    .surfaceContainerHighest,
                                                initialValue:
                                                    (control.value ?? 0)
                                                        .toString(),
                                                hintText: t
                                                    .common
                                                    .errors
                                                    .enterInteger,
                                                onChanged: (val) {
                                                  control.value =
                                                      int.tryParse(val) ?? 0;
                                                  context
                                                      .read<
                                                        GeneralConfigCubit
                                                      >()
                                                      .setConfig(
                                                        params: formModel.model
                                                            .toParams(),
                                                      );
                                                },
                                              ),
                                        ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
