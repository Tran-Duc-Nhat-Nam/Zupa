import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class MemberVehiclesTabBar extends StatelessWidget {
  const MemberVehiclesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return Container(
      padding: const .only(top: 16),
      child: SegmentedTabControl(
        splashColor: Colors.transparent,
        barDecoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const .all(.circular(28)),
          border: .all(color: colorScheme.surfaceContainerHighest),
        ),
        indicatorPadding: const .all(6),
        indicatorDecoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: const .all(Radius.circular(16)),
        ),
        textStyle: AppTextStyles.bodySmallBold.copyWith(color: colorScheme.onPrimaryContainer),
        tabTextColor: colorScheme.onSurfaceVariant,
        tabs: [
          .new(label: t.common.actions.all),
          .new(label: t.parking.inUse),
          .new(label: t.parking.lost),
        ],
      ),
    );
  }
}
