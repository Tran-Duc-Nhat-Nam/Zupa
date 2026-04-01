import 'dart:math';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_card.dart';

class BorderPainter extends CustomPainter {
  final double currentState;
  final Color color;

  BorderPainter({required this.currentState, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 7;
    final Rect rect =
        const Offset(-3.5, -3.5) & Size(size.width + 7, size.height + 7);

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

    return AppCard(
      padding: const .all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? colors.primaryContainer
            : colors.primaryContainer.withAlpha(155),
        borderRadius: const .all(Radius.circular(100)),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: AnimatedOpacity(
          duration: const .new(milliseconds: 500),
          opacity: isDisabled ? 0.5 : 1,
          child: CustomPaint(
            painter: BorderPainter(
              currentState: value,
              color: current >= (capacity ?? 0)
                  ? colors.error
                  : isWarning
                  ? colors.warning
                  : colors.success,
            ),
            child: InkWell(
              customBorder:
                  const CircleBorder(),
              onTap: isDisabled ? null : onPressed,
              child: Column(
                mainAxisAlignment:
                    .center,
                children: [
                  Container(
                    clipBehavior: .antiAlias,
                    decoration: BoxDecoration(borderRadius: .circular(6)),
                    child: Skeleton.replace(
                      width: 32,
                      height: 32,
                      child: Container(
                        padding: const .all(6),
                        child: Icon(
                          icon,
                          size: 24,
                          color:
                              color?.harmonizeWith(colors.primary) ??
                              colors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5), // Spacing between Icon and Text
                  Text(
                    capacity != null && capacity! >= 0
                        ? (capacity! - current).toString()
                        : '${(value * 100).toInt()}%',
                    style: AppTextStyles.headlineSmallBold.copyWith(
                      color: current >= (capacity ?? 0)
                          ? colors.error
                          : isWarning
                          ? colors.warning
                          : colors.success,
                    ),
                  ),
                  // Removed bottom SizedBox to allow true centering
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
