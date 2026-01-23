
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/features/settings/presentation/bloc/general_config/general_config_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/icons.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/gen/strings.g.dart';

class GeneralConfigScreen extends StatefulWidget {
  const GeneralConfigScreen({super.key});

  @override
  State<GeneralConfigScreen> createState() => _GeneralConfigScreenState();
}

class _GeneralConfigScreenState extends AppState<GeneralConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Translations.of(context).generalConfig,
      child: BlocProvider<GeneralConfigCubit>(
        create: (context) => getIt<GeneralConfigCubit>()..init(),
        child: BlocBuilder<GeneralConfigCubit, GeneralConfigState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is Loading,
              child: FormBuilder(
                key: formKey,
                initialValue: {
                  'warningThreshold': state.maybeMap(
                    loaded: (params) => params.warningThreshold.toString(),
                    orElse: () => false,
                  ),
                },
                onChanged: () {
                  formKey.currentState?.saveAndValidate();
                  if (formKey.currentState?.validate() == true) {
                    context.read<GeneralConfigCubit>().setThreshold(
                      int.tryParse(
                            formKey.currentState!.value['warningThreshold'],
                          ) ??
                          0,
                    );
                  }
                },
                child: Padding(
                  padding: const .symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    spacing: 10,
                    children: [
                      AppCard(
                        child: Column(
                          children: [
                            AppListTile(
                              leadingIconPath: AppIcons.outlineSetting,
                              text: Translations.of(context).parkingPrice,
                              trailingIconPath: AppIcons.chevronRight,
                              onTap: () => context.pushNamed('ParkingPrice'),
                            ),
                            Divider(
                              color: ThemeHelper.getColor(context).grey200,
                            ),
                            AppListTile(
                              leadingIconPath: AppIcons.calendarAdd,
                              text: Translations.of(context).memberFee,
                              trailingIconPath: AppIcons.chevronRight,
                              onTap: () => context.pushNamed('MemberFee'),
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
                              leadingIconPath: AppIcons.notification,
                              text: Translations.of(context).title.warningThreshold,
                              trailing: SizedBox(
                                height: 20,
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    padding: .zero,
                                    materialTapTargetSize: .shrinkWrap,
                                    thumbIcon: .resolveWith<Icon?>((
                                      Set<WidgetState> states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.selected,
                                      )) {
                                        return const .new(Icons.check);
                                      }
                                      return const .new(Icons.close);
                                    }),
                                    thumbColor: .all(
                                      ThemeHelper.getColor(context).white,
                                    ),
                                    inactiveTrackColor: ThemeHelper.getColor(
                                      context,
                                    ).grey100,
                                    trackOutlineWidth:
                                        const WidgetStatePropertyAll(0),
                                    trackOutlineColor:
                                        const WidgetStatePropertyAll(
                                          WidgetStateColor.transparent,
                                        ),
                                    value: state.maybeWhen(
                                      loaded: (isWarning, _) => isWarning,
                                      orElse: () => false,
                                    ),
                                    onChanged: (value) => context
                                        .read<GeneralConfigCubit>()
                                        .setWarning(value),
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
                                hintText: Translations.of(context).enterInteger,
                                required: true,
                              ),
                              Text(
                                Translations.of(context).subtitle.warningThreshold,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
