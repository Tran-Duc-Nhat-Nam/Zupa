import 'package:flutter/material.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:zupa/core/styles/colors.dart';

import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class MemberVehiclesTabBar extends StatelessWidget {
  const MemberVehiclesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .only(top: 16),
      child: SegmentedTabControl(
        height: 40,
        splashColor: Colors.transparent,
        barDecoration: BoxDecoration(
          color: AppColors.of(context).surface,
          borderRadius: const .all(Radius.circular(8)),
          border: .all(color: AppColors.of(context).surfaceContainerHighest),
        ),
        indicatorPadding: const .all(4),
        indicatorDecoration: BoxDecoration(
          color: AppColors.of(context).primary,
          borderRadius: const .all(Radius.circular(6)),
        ),
        textStyle: AppTextStyles.bodySmallBold,
        tabTextColor: AppColors.of(context).outline,
        tabs: [
          .new(label: t.common.actions.all),
          .new(label: t.parking.inUse),
          .new(label: t.parking.lost),
        ],
      ),
    );
  }
}
