import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
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
    final colorScheme = AppColors.of(context);

    final cleanChangelog = changelog
        .replaceAll('"', '')
        .replaceAll('\\n', '\n')
        .trim();

    final formattedChangelog = cleanChangelog
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .map((line) => '- ${line.trim()}')
        .join('\n');

    return AppScreen(
      title: t.common.version.changelog,
      child: Padding(
        padding: const .all(24),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 24,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: .circular(20),
                  ),
                  child: Text(
                    'v$version',
                    style: AppTextStyles.bodyLargeBold.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              formattedChangelog,
              style: AppTextStyles.bodyLarge.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
