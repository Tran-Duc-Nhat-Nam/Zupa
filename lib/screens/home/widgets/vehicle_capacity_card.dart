import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/text_styles.dart';
import '../../../widgets/app_icon.dart';

class VehicleCapacityCard extends StatelessWidget {
  const VehicleCapacityCard({
    super.key,
    required this.iconPath,
    required this.name,
    required this.current,
    this.capacity,
    this.isWarning = false,
    this.isSelected = false,
    this.isDisabled = false,
    this.onPressed,
  });

  final String iconPath;
  final String name;
  final int current;
  final int? capacity;
  final bool isWarning;
  final bool isSelected;
  final bool isDisabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onPressed,
      child: AnimatedOpacity(
        duration: const .new(milliseconds: 350),
        opacity: isDisabled ? 0.5 : 1,
        child: Container(
          padding: const .symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: .circular(8),
            color: isSelected
                ? ThemeHelper.getColor(context).primary400
                : ThemeHelper.getColor(context).primary100,
          ),
          child: Row(
            mainAxisAlignment: .spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    clipBehavior: .antiAlias,
                    decoration: BoxDecoration(borderRadius: .circular(6)),
                    child: Skeleton.replace(
                      width: 36,
                      height: 36,
                      child: Container(
                        padding: const .all(6),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ThemeHelper.getColor(context).blueDark
                              : ThemeHelper.getColor(context).primary200,
                        ),
                        child: AppIcon(
                          path: iconPath,
                          size: 24,
                          color: isSelected
                              ? ThemeHelper.getColor(context).primary50
                              : ThemeHelper.getColor(context).primary500,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .end,
                    children: [
                      Text(
                        current.toString(),
                        style: AppTextStyles.heading3.copyWith(
                          color: isWarning
                              ? ThemeHelper.getColor(context).error600
                              : isSelected
                              ? ThemeHelper.getColor(context).white
                              : ThemeHelper.getColor(context).grey700,
                        ),
                      ),
                      if (capacity != null) ...[
                        Text(
                          '/',
                          style: AppTextStyles.heading3.copyWith(
                            color: isWarning
                                ? ThemeHelper.getColor(context).error600
                                : isSelected
                                ? ThemeHelper.getColor(context).white
                                : ThemeHelper.getColor(context).grey700,
                          ),
                        ),
                        Text(
                          capacity.toString(),
                          style: AppTextStyles.bodyMediumMedium.copyWith(
                            color: isSelected
                                ? ThemeHelper.getColor(context).white
                                : ThemeHelper.getColor(context).grey700,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
