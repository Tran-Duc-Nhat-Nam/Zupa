import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: label != null ? Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.discreteCircle(
            color: Theme.of(context).colorScheme.primary,
            size: 32,
          ),
          Text(label!),
        ],
      ) : LoadingAnimationWidget.discreteCircle(
        color: Theme.of(context).colorScheme.primary,
        size: 32,
      ),
    );
  }
}
