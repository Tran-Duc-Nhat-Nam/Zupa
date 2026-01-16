import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

Page<dynamic> fadingTransition(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

Page<dynamic> rightToLeftJoinedTransition(
  BuildContext context,
  GoRouterState state,
  child,
) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      return PageTransition(
        child: RepaintBoundary(child: child),
        type: .rightToLeft,
        alignment: .center,
        childCurrent: context.currentRoute ?? child,
      ).buildTransitions(context, animation, secondaryAnimation, child);
    },
  );
}
