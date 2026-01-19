import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';

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
          color: ThemeHelper.getColor(context).white,
          borderRadius: const .all(Radius.circular(8)),
          border: .all(color: ThemeHelper.getColor(context).grey100),
        ),
        indicatorPadding: const .all(4),
        indicatorDecoration: BoxDecoration(
          color: ThemeHelper.getColor(context).primary500,
          borderRadius: const .all(Radius.circular(6)),
        ),
        textStyle: AppTextStyles.bodySmallBold,
        tabTextColor: ThemeHelper.getColor(context).grey300,
        tabs: [
          .new(label: context.tr('all')),
          .new(label: context.tr('inUse')),
          .new(label: context.tr('lost')),
        ],
      ),
    );
  }
}
