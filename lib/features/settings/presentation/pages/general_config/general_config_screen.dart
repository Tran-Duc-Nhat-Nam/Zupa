import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/widgets/app_switch.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/settings/presentation/bloc/general_config/general_config_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class GeneralConfigScreen extends StatefulWidget {
  const GeneralConfigScreen({super.key});

  @override
  State<GeneralConfigScreen> createState() => _GeneralConfigScreenState();
}

class _GeneralConfigScreenState extends AppState<GeneralConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      formGroup: context.read<GeneralConfigCubit>().form,
      title: t.generalConfig,
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
                            text: t.parkingPrice,
                            trailingIcon: Symbols.chevron_right_rounded,
                            onTap: () => context.pushRoute(
                              const ParkingPriceSettingRoute(),
                            ),
                          ),
                          Divider(color: ThemeHelper.getColor(context).grey200),
                          AppListTile(
                            leadingIcon: Symbols.calendar_add_on_rounded,
                            text: t.memberFee,
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
                            text: t.title.warningThreshold,
                            trailing: SizedBox(
                              height: 20,
                              child: Transform.scale(
                                scale: 0.8,
                                child: AppSwitch(
                                  name: 'isWarning',
                                  onToggle: (value, toggle) {
                                    context
                                        .read<GeneralConfigCubit>()
                                        .setWarning(value);
                                    toggle(value);
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (state.maybeWhen(
                            loaded: (isWarning, _) => isWarning,
                            orElse: () => false,
                          )) ...[
                            AppTextField(
                              name: 'warningThreshold',
                              hintText: t.enterInteger,
                              required: true,
                            ),
                            Text(
                              t.subtitle.warningThreshold,
                              style: AppTextStyles.bodySmallMedium.copyWith(
                                color: ThemeHelper.getColor(context).grey500,
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
