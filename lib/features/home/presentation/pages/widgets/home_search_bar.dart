import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_date_time_picker.dart';
import 'package:zupa/core/widgets/app_text_field.dart';
import 'package:zupa/features/home/presentation/bloc/home_cubit.dart';
import 'package:zupa/features/home/presentation/models/home_form.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    final form = ReactiveHomeForm.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is Loading,
          child: ReactiveValueListenableBuilder<String>(
            formControl: form?.keywordControl,
            builder: (context, control, child) => AppTextField(
              hintText: t.parking.ticketSearch,
              borderRadius: 100,
              prefix: Icon(
                Symbols.search_rounded,
                size: 24,
                color: colorScheme.onSurfaceVariant,
              ),
              suffix: InkWell(
                child: Icon(
                  Symbols.filter_list_rounded,
                  size: 24,
                  color: colorScheme.onSurfaceVariant,
                ),
                onTap: () => _showFilter(context, form, colorScheme),
              ),
              onChanged: (value) {
                context.read<HomeCubit>().refresh(
                  filter: form?.model.toParams() ?? .initial(keyword: value),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showFilter(
    BuildContext context,
    HomeForm? formModel,
    AppColors colorScheme,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const .only(top: 24, bottom: 48, left: 24, right: 24),
        child: Column(
          spacing: 24,
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Center(
              child: Text(
                t.common.actions.filter,
                style: AppTextStyles.bodyLargeSemibold.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                Text(t.common.info.date),
                AppDateTimePicker(
                  type: .date,
                  value: formModel?.timeControl.value,
                  onChanged: (value) {
                    formModel?.timeValueUpdate(value);
                  },
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppButton(
                    color: .basic,
                    theme: .outline,
                    onPressed: () => context.pop(),
                    text: t.common.actions.cancel,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => context.pop(),
                    text: t.common.actions.apply,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      useRootNavigator: true,
    );
  }
}
