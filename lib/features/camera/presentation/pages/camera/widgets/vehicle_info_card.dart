import 'package:flutter/material.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

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
    final colors = AppColors.of(context);
    return Container(
      width: .infinity,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: .circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const .all(10),
            child: Text(
              '${t.parking.ticketID}: $ticketNumber',
              style: AppTextStyles.bodyMediumSemibold.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
          Container(height: 1, width: .infinity, color: colors.outline),
          Padding(
            padding: const .all(8),
            child: Text(
              '${t.parking.ticketID}: $ticketNumber',
              style: AppTextStyles.bodyXLargeSemibold.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
