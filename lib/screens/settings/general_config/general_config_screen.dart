import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../bloc/settings/general_config/general_config_cubit.dart';
import '../../../common/styles/text_styles.dart';
import '../../../widgets/app_screen.dart';
import '../../../widgets/app_text_field.dart';
import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/icons.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/app_list_tile.dart';

class GeneralConfigScreen extends StatefulWidget {
  const GeneralConfigScreen({super.key});

  @override
  State<GeneralConfigScreen> createState() => _GeneralConfigScreenState();
}

class _GeneralConfigScreenState extends State<GeneralConfigScreen> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: context.tr('generalConfig'),
      child: BlocProvider<GeneralConfigCubit>(
        create: (context) => GeneralConfigCubit()..init(),
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  child: Column(
                    spacing: 10,
                    children: [
                      AppCard(
                        child: Column(
                          children: [
                            AppListTile(
                              leadingIconPath: AppIcons.outlineSetting,
                              text: context.tr('parkingPrice'),
                              trailingIconPath: AppIcons.chevronRight,
                              onTap: () => context.pushNamed('ParkingPrice'),
                            ),
                            Divider(
                              color: ThemeHelper.getColor(context).grey200,
                            ),
                            AppListTile(
                              leadingIconPath: AppIcons.calendarAdd,
                              text: context.tr('memberFee'),
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
                              padding: EdgeInsets.zero,
                              leadingIconPath: AppIcons.notification,
                              text: context.tr('title.warningThreshold'),
                              trailing: SizedBox(
                                height: 20,
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    padding: EdgeInsets.zero,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    thumbIcon:
                                        WidgetStateProperty.resolveWith<Icon?>((
                                          Set<WidgetState> states,
                                        ) {
                                          if (states.contains(
                                            WidgetState.selected,
                                          )) {
                                            return const Icon(Icons.check);
                                          }
                                          return const Icon(Icons.close);
                                        }),
                                    thumbColor: WidgetStateProperty.all(
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
                                hintText: context.tr('enterInteger'),
                                required: true,
                              ),
                              Text(
                                context.tr('subtitle.warningThreshold'),
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
