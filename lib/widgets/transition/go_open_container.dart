/// A workaround implementation created by Enrique Llopis to achieve functionality
/// similar to `openContainer` while using the `go_router` package. This approach
/// is not an exact 1:1 match to `openContainer`, but it provides a similar transition
/// effect and can be further customized to closely mimic the behavior of `openContainer`.
///
/// This implementation is provided under a permissive license, allowing anyone to use,
/// modify, and distribute it freely.
/// ⭐️ STAR IF IT PROVED USEFUL ⭐️

library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _kGoOpenContainerAnimationDuration = Duration(milliseconds: 300);

/// Mimics the behaviour of the OpenContainer widget for go_router.
class GoOpenContainer extends StatefulWidget {
  const GoOpenContainer({
    super.key,
    required this.child,
    required this.pushTo,
    this.onTap,
    this.borderRadiusStart = const BorderRadius.all(Radius.circular(16)),
    this.borderRadiusEnd = BorderRadius.zero,
    this.colorStart,
    this.colorEnd,
  });

  final Widget child;
  final bool Function()? onTap;
  final String pushTo;
  final BorderRadius borderRadiusStart;
  final BorderRadius borderRadiusEnd;
  final Color? colorStart;
  final Color? colorEnd;

  @override
  State<GoOpenContainer> createState() => _GoOpenContainerState();
}

class _GoOpenContainerState extends State<GoOpenContainer>
    with TickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();
  late AnimationController _animationController;
  late Animation<Size> _sizeAnimation;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<BorderRadius?> _borderRadiusAnimation;
  late Animation<Color?> _colorAnimation;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(
          duration: _kGoOpenContainerAnimationDuration,
          vsync: this,
        )..addStatusListener((status) async {
          if (status == AnimationStatus.completed) {
            _removeOverlay();
          }
        });

    _sizeAnimation = Tween<Size>(begin: Size.zero, end: Size.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _positionAnimation = Tween<Offset>(begin: Offset.zero, end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _opacityAnimation = Tween<double>(begin: 1, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const DelayedCurve(
          delay: 0.5,
          curve: Curves.easeInOut,
          end: 0.8,
        ),
      ),
    );
    _borderRadiusAnimation =
        BorderRadiusTween(
          begin: widget.borderRadiusStart,
          end: widget.borderRadiusEnd,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const DelayedCurve(delay: 0.7, curve: Curves.easeInOut),
          ),
        );

    _colorAnimation =
        ColorTween(
          begin: widget.colorStart ?? const Color(0x00000000),
          end: widget.colorEnd ?? const Color(0x00000000),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _removeOverlay();
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() async {
    final shouldNavigate = widget.onTap?.call() ?? true;
    if (!shouldNavigate) return;

    final RenderBox renderBox =
        _containerKey.currentContext!.findRenderObject()! as RenderBox;

    final RenderBox navigatorRenderBox =
        Navigator.of(context).context.findRenderObject()! as RenderBox;

    final Offset position = renderBox.localToGlobal(
      Offset.zero,
      ancestor: navigatorRenderBox,
    );
    final Size size = renderBox.size;
    final Size screenSize =
        (Navigator.of(context).context.findRenderObject()! as RenderBox).size;

    // Target size is full screen
    final Size targetSize = screenSize;

    // Calculate position to center on screen
    const Offset targetPosition = Offset.zero;

    final sizeTween = Tween<Size>(begin: size, end: targetSize);
    final offsetTween = Tween<Offset>(begin: position, end: targetPosition);

    _sizeAnimation = sizeTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _positionAnimation = offsetTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _showOverlay(position, size);
    _animationController.forward();
    final tween = {'sizeTween': sizeTween, 'offsetTween': offsetTween};
    await context.push(widget.pushTo, extra: tween);

    if (!context.mounted) return;

    _showOverlay(
      navigatorRenderBox.localToGlobal(Offset.zero),
      navigatorRenderBox.size,
    );
    _closeOverlay();
  }

  void _showOverlay(Offset initialPosition, Size size) {
    _overlayEntry = OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Positioned(
            left: _positionAnimation.value.dx,
            top: _positionAnimation.value.dy,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                width: _sizeAnimation.value.width,
                height: _sizeAnimation.value.height,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius: _borderRadiusAnimation.value,
                ),

                child: GestureDetector(
                  onTap: _closeOverlay,
                  child: widget.child,
                ),
              ),
            ),
          );
        },
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeOverlay() {
    _animationController.reverse().then((_) {
      _removeOverlay();
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: widget.colorStart ?? const Color(0x00000000),
        borderRadius: widget.borderRadiusStart,
      ),
      child: GestureDetector(
        key: _containerKey,
        onTap: _onTap,
        child: widget.child,
      ),
    );
  }
}

/// Use this custom transition only for pages that are accessed by using GoOpenContainer
Page<dynamic> goOpenContainerCustomTransition(
  GoRouterState state,
  Widget page,
) {
  if (state.extra == null) {
    return MaterialPage(key: state.pageKey, child: page);
  }

  final extra = state.extra! as Map<String, dynamic>;
  final sizeTween = extra['sizeTween'] as Tween<Size>;
  final offsetTween = extra['offsetTween'] as Tween<Offset>;

  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final sizeAnimation = sizeTween
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(animation);

      final offsetAnimation = offsetTween
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(animation);

      return Stack(
        children: [
          Positioned(
            left: offsetAnimation.value.dx,
            top: offsetAnimation.value.dy,
            child: SizedBox(
              width: sizeAnimation.value.width,
              height: sizeAnimation.value.height,
              child: child,
            ),
          ),
        ],
      );
    },
  );
}

class DelayedCurve extends Curve {
  final double delay;
  final double end;
  final Curve curve;

  const DelayedCurve({
    required this.delay,
    this.curve = Curves.easeIn,
    this.end = 1.0,
  }) : assert(
         delay >= 0.0 && delay <= 1.0 && end >= 0.0 && end <= 1.0,
         'Delay and end must be between 0.0 and 1.0',
       ),
       assert(end >= delay, 'End must not be lower than delay');

  @override
  double transform(double t) {
    if (t < delay) {
      return 0.0;
    }
    if (t >= end) {
      return 1.0;
    }
    // Remap the remaining time (delay to end) to (0.0 to 1.0)
    final double adjustedT = (t - delay) / (end - delay);
    return curve.transform(adjustedT);
  }
}
