import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/i18n/strings.g.dart';
import 'package:zupa/core/widgets/app_screen.dart';

@RoutePage()
class ChangelogScreen extends StatelessWidget {
  final String version;
  final String changelog;

  const ChangelogScreen({
    super.key,
    required this.version,
    required this.changelog,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppScreen(
      title: t.common.version.changelog,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'v$version',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            changelog,
            style: textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
