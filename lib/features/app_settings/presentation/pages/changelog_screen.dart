import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_screen.dart';

@RoutePage()
class ChangelogScreen extends StatelessWidget {
  final String changelog;

  const ChangelogScreen({
    super.key,
    // We no longer need a single 'version' parameter as the string contains the history
    required this.changelog,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    // 1. Clean the raw JSON/Git string into readable text [cite: 1, 8]
    final cleanChangelog = changelog
        .replaceAll('"', '')
        .replaceAll('\\n', '\n')
        .trim();

    // 2. Split by the version header delimiter "--- v"
    // This creates blocks: ["0.7.3 ---\ninfo", "0.7.2 ---\ninfo"]
    final versionBlocks = cleanChangelog
        .split('--- v')
        .where((block) => block.trim().isNotEmpty)
        .toList();

    return AppScreen(
      title: t.common.version.changelog,
      // Using a ListView for scrollable history
      child: ListView.separated(
        padding: const .all(20),
        itemCount: versionBlocks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final block = versionBlocks[index];

          // Extract version number and the actual logs
          final parts = block.split('---');
          final versionTag = parts.first.trim();
          final logs = parts.length > 1 ? parts.last.trim() : '';

          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: .circular(24),
              side: BorderSide(color: colorScheme.outlineVariant),
            ),
            // Use a tinted surface for the card background
            color: colorScheme.surfaceContainerLow,
            child: Padding(
              padding: const .all(20),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  // Version Chip
                  Container(
                    padding: const .symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: .circular(12),
                    ),
                    child: Text(
                      'v$versionTag',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Log entries parsed into bullet points
                  ...logs
                      .split('\n')
                      .where((line) => line.trim().isNotEmpty)
                      .map(
                        (line) => Padding(
                          padding: const .only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                '• ',
                                style: TextStyle(
                                  color: colorScheme.primary,
                                  fontSize: 18,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  line.trim(),
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
