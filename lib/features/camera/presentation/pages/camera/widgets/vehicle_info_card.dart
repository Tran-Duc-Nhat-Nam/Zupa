import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

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
        color: AppColors.of(context).surface,
        borderRadius: .circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const .all(10),
            child: Text(
              '${t.parking.ticketID}: $ticketNumber',
              style: AppTextStyles.bodyMediumSemibold.copyWith(
                color: AppColors.of(context).onSurfaceVariant,
              ),
            ),
          ),
          Container(
            height: 1,
            width: .infinity,
            color: AppColors.of(context).outline,
          ),
          Padding(
            padding: const .all(8),
            child: Text(
              '${t.parking.ticketID}: $ticketNumber',
              style: AppTextStyles.bodyXLargeSemibold.copyWith(
                color: AppColors.of(context).onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
