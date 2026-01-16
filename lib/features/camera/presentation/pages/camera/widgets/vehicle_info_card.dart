import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';

class VehicleInfoCard extends StatelessWidget {
  const VehicleInfoCard({
    super.key,
    this.licenseNumber,
    required this.ticketNumber,
  });

  final String? licenseNumber;
  final String ticketNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      decoration: BoxDecoration(
        color: ThemeHelper.getColor(context).white,
        borderRadius: .circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const .all(10),
            child: Text(
              context.tr('ticketNumber', args: [ticketNumber]),
              style: AppTextStyles.bodyMediumSemibold.copyWith(
                color: ThemeHelper.getColor(context).grey700,
              ),
            ),
          ),
          Container(
            height: 1,
            width: .infinity,
            color: ThemeHelper.getColor(context).grey300,
          ),
          Padding(
            padding: const .all(8),
            child: Text(
              context.tr('ticketNumber', args: [ticketNumber]),
              style: AppTextStyles.bodyXLargeSemibold.copyWith(
                color: ThemeHelper.getColor(context).grey700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
