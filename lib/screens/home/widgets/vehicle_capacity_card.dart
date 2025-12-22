import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common/styles/colors.dart';
import '../../../helper/theme/theme_helper.dart';
import '../../../common/styles/text_styles.dart';
import '../../../widgets/app_icon.dart';

class BorderPainter extends CustomPainter {
  final double currentState;
  final Color color;

  BorderPainter({required this.currentState, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 5;
    final Rect rect =
        const Offset(-3, -3) & Size(size.width + 6, size.height + 6);

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    const double startAngle = -pi / 2;
    final double sweepAmount = currentState * pi;

    canvas.drawArc(rect, startAngle, sweepAmount, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class VehicleCapacityCard extends StatefulWidget {
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
  State<VehicleCapacityCard> createState() => _VehicleCapacityCardState();
}

class _VehicleCapacityCardState extends State<VehicleCapacityCard> {
  late BaseColors colors;

  @override
  Widget build(BuildContext context) {
    colors = ThemeHelper.getColor(context);

    final double value = widget.capacity != null && (widget.capacity!) >= 0
        ? (widget.current / widget.capacity!) * 2
        : 1;

    return AspectRatio(
      aspectRatio: 1, // <--- 1. Enforces a 1:1 square/circle ratio
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 350),
        opacity: widget.isDisabled ? 0.5 : 1,
        child: CustomPaint(
          painter: BorderPainter(
            currentState: value,
            color: widget.isWarning ? colors.error600 : colors.primary400,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape
                  .circle, // <--- 2. Ensures the background is a perfect circle
              color: widget.isSelected ? colors.primary400 : colors.primary100,
            ),
            child: InkWell(
              customBorder:
                  const CircleBorder(), // <--- 3. Ensures ripple effect is circular
              onTap: widget.isDisabled ? null : widget.onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // <--- 4. Centers content vertically
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Skeleton.replace(
                      width: 32,
                      height: 32,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: widget.isSelected
                              ? colors.blueDark
                              : colors.primary200,
                        ),
                        child: AppIcon(
                          path: widget.iconPath,
                          size: 24,
                          color: widget.isSelected
                              ? colors.primary50
                              : colors.primary500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ), // Spacing between Icon and Text
                  Text(
                    widget.capacity != null && widget.capacity! >= 0
                        ? (widget.capacity! - widget.current).toString()
                        : '${(value * 100).toInt()}%',
                    style: AppTextStyles.heading4.copyWith(
                      color: widget.isWarning
                          ? colors.error600
                          : widget.isSelected
                          ? colors.white
                          : colors.grey700,
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
