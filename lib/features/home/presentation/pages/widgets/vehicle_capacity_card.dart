import 'dart:math';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class BorderPainter extends CustomPainter {
  final double currentState;
  final Color color;

  BorderPainter({required this.currentState, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 4;
    final Rect rect = Offset.zero & size;

    final paint = Paint()
      ..filterQuality = .high
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = .round
      ..style = .stroke;

    const double startAngle = -pi / 2;
    final double sweepAmount = currentState * pi;

    canvas.drawArc(rect, startAngle, sweepAmount, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class VehicleCapacityCard extends StatelessWidget {
  const VehicleCapacityCard({
    super.key,
    required this.icon,
    required this.name,
    required this.current,
    this.capacity,
    this.isWarning = false,
    this.isSelected = false,
    this.isDisabled = false,
    this.onPressed,
    this.color,
  });

  final IconData icon;
  final String name;
  final int current;
  final int? capacity;
  final bool isWarning;
  final bool isSelected;
  final bool isDisabled;

  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    final double value = capacity != null && (capacity!) >= 0
        ? (current / capacity!) * 2
        : 1;

    return InkWell(
      onTap: isDisabled ? null : onPressed,
      customBorder: const StadiumBorder(),
      child: AnimatedOpacity(
        duration: 300.ms,
        opacity: isDisabled ? 0.5 : 1,
        child: Container(
          padding: const .symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? colors.primaryContainer
                : colors.surfaceContainer,
            borderRadius: .circular(28),
            border: .all(
              width: isSelected
                  ? 3
                  : 2,
              color: isSelected
                  ? colors.outline
                  : colors.outlineVariant,
            )
          ),
          child: Column(
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            children: [
              Stack(
                alignment: .center,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: CustomPaint(
                      painter: BorderPainter(
                        currentState: value,
                        color: current >= (capacity ?? 0)
                            ? colors.error
                            : isWarning
                            ? colors.warning
                            : colors.success,
                      ),
                    ),
                  ),
                  Icon(
                    icon,
                    size: 24,
                    color: isSelected
                        ? colors.onPrimaryContainer
                        : color?.harmonizeWith(colors.primary) ??
                              colors.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                capacity != null && capacity! >= 0
                    ? (capacity! - current).toString()
                    : '${(value * 100).toInt()}%',
                style: AppTextStyles.titleMediumBold.copyWith(
                  color: isSelected
                      ? colors.onPrimaryContainer
                      : current >= (capacity ?? 0)
                      ? colors.error
                      : isWarning
                      ? colors.warning
                      : colors.success,
                ),
              ),
              Text(
                t['vehicles.$name'] ?? name,
                style: AppTextStyles.labelMedium.copyWith(
                  color: isSelected
                      ? colors.onPrimaryContainer
                      : colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
