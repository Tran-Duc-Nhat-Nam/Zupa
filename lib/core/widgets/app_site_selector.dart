import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:zupa/core/bloc/site/site_cubit.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_button.dart';
import 'package:zupa/core/widgets/app_radio_group.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class AppSiteSelector extends StatelessWidget {
  const AppSiteSelector({super.key});

  final List<String> _parkingLots = const ['Bãi xe 1', 'Bãi xe 2', 'Bãi xe 3'];

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final siteCubit = context.watch<SiteCubit>();

    return InkWell(
      onTap: () => _showSitePicker(context, colors, siteCubit),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colors.outlineVariant.withAlpha(50),
          ),
          boxShadow: [
            BoxShadow(
              color: colors.shadow.withAlpha(10),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Symbols.location_on_rounded,
                size: 20,
                color: colors.primary,
                fill: 1,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.common.info.site,
                    style: AppTextStyles.bodySmallRegular.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  BlocBuilder<SiteCubit, SiteState>(
                    builder: (context, state) {
                      final siteName = state.maybeWhen(
                        loaded: (data) => data ?? _parkingLots[0],
                        orElse: () => _parkingLots[0],
                      );
                      return Text(
                        siteName,
                        style: AppTextStyles.bodyLargeBold.copyWith(
                          color: colors.onSurface,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Icon(
              Symbols.keyboard_arrow_right_rounded,
              color: colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: -0.2, end: 0, curve: Curves.easeOutQuad);
  }

  void _showSitePicker(
    BuildContext context,
    AppColors colors,
    SiteCubit siteCubit,
  ) {
    WoltModalSheet.show(
      context: context,
      pageListBuilder: (context) {
        return [
          WoltModalSheetPage(
            enableDrag: true,
            backgroundColor: colors.surfaceContainerLow,
            hasTopBarLayer: true,
            topBarTitle: Text(
              t.common.info.site,
              style: AppTextStyles.bodyLargeSemibold,
            ),
            isTopBarLayerAlwaysVisible: true,
            trailingNavBarWidget: IconButton(
              icon: const Icon(Symbols.close_rounded),
              onPressed: () => Navigator.of(context).pop(),
            ),
            stickyActionBar: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: AppButton(
                height: 48,
                onPressed: () {
                  siteCubit.changeSite();
                  Navigator.of(context).pop();
                },
                text: t.common.actions.apply,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80, top: 16),
              child: AppRadioGroup<String>(
                formControl: siteCubit.form.codeControl,
                items: _parkingLots,
                isVertical: true,
                showRadio: false,
                itemBuilder:
                    (context, item, isSelected, onSelect, radioButton) =>
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: onSelect,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colors.primaryContainer.withAlpha(80)
                                    : null,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.location_on_rounded,
                                    size: 20,
                                    color: isSelected
                                        ? colors.primary
                                        : colors.onSurfaceVariant,
                                    fill: isSelected ? 1 : 0,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    item,
                                    style: AppTextStyles.bodyLargeRegular.copyWith(
                                      color: isSelected
                                          ? colors.primary
                                          : colors.onSurface,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (isSelected)
                                    Icon(
                                      Symbols.check_rounded,
                                      color: colors.primary,
                                      size: 20,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
