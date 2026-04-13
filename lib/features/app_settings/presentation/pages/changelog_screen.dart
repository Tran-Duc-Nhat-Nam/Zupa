import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_screen.dart';

@RoutePage()
class ChangelogScreen extends StatelessWidget {
  final String changelog;

  const ChangelogScreen({super.key, required this.changelog});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    final cleanChangelog = changelog
        .replaceAll('"', '')
        .replaceAll('\\n', '\n')
        .trim();

    final versionBlocks = cleanChangelog
        .split('--- v')
        .where((block) => block.trim().isNotEmpty)
        .toList();

    return AppScreen(
      title: t.common.version.changelog,
      isChildScrollable: true,
      child: ListView.separated(
        padding: const .all(20),
        itemCount: versionBlocks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 32),
        itemBuilder: (context, index) {
          final block = versionBlocks[index];
          final parts = block.split('---');
          final versionTag = parts.first.trim();
          final rawLogs = parts.length > 1 ? parts.last.trim() : '';

          final groupedChanges = _getNestedGroupedChanges(rawLogs);

          return Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: const .only(left: 8, bottom: 16),
                child: Text(
                  '${t.common.version.version} $versionTag',
                  style: AppTextStyles.titleLargeBold.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
              ...groupedChanges.entries.map((actionEntry) {
                return _buildActionGroup(
                  context,
                  actionEntry.key,
                  actionEntry.value,
                  actionEntry.key == groupedChanges.keys.first,
                  actionEntry.key == groupedChanges.keys.last,
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Map<String, Map<String, List<String>>> _getNestedGroupedChanges(
    String rawLogs,
  ) {
    final Map<String, Map<String, List<String>>> root = {};
    final shaRegex = RegExp(r'^[a-f0-9]{7,10}\s+');
    // Regex for: type(scope): description
    final pattern = RegExp(r'^(\w+)(?:\(([^)]+)\))?:\s*(.*)$');

    final lines = rawLogs
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty);

    for (final line in lines) {
      final cleanLine = line.replaceFirst(shaRegex, '');

      if (cleanLine.toLowerCase().startsWith('merge') ||
          cleanLine.contains('update versionarte')) {
        continue;
      }

      final match = pattern.firstMatch(cleanLine);
      if (match != null) {
        final action = match.group(1)!.toLowerCase();
        final scope = match.group(2) ?? 'general';
        final message = match.group(3)!;

        root.putIfAbsent(action, () => {});
        root[action]!.putIfAbsent(scope, () => []).add(message);
      } else {
        root.putIfAbsent('other', () => {});
        root['other']!.putIfAbsent('general', () => []).add(cleanLine);
      }
    }
    return root;
  }

  Widget _buildActionGroup(
    BuildContext context,
    String action,
    Map<String, List<String>> scopes,
    bool isFirst,
    bool isLast,
  ) {
    final colorScheme = AppColors.of(context);
    final (icon, label) = _getActionMetadata(action);

    return Container(
      margin: const .only(bottom: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: .vertical(
          top: isFirst ? const .circular(16) : const .circular(4),
          bottom: isLast ? const .circular(16) : const .circular(4),
        ),
        border: .all(color: colorScheme.outlineVariant.withAlpha(80)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Action Header with Icon
          Padding(
            padding: const .fromLTRB(20, 16, 20, 8),
            child: Row(
              children: [
                Icon(icon, size: 20, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  label.toUpperCase(),
                  style: AppTextStyles.bodyLargeBold.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ...scopes.entries.map((scopeEntry) {
            return Padding(
              padding: const .symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  if (scopeEntry.key != 'general')
                    Padding(
                      padding: const .only(bottom: 6, left: 4),
                      child: Text(
                        '# ${scopeEntry.key}',
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                  ...scopeEntry.value.map(
                    (msg) => _buildCommitLine(context, msg),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildCommitLine(BuildContext context, String message) {
    final colorScheme = AppColors.of(context);
    return Padding(
      padding: const .symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const .only(top: 8, left: 4),
            child: Icon(
              Symbols.circle_rounded,
              size: 12,
              color: colorScheme.onSurfaceVariant.withAlpha(120),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.bodyLarge.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  (IconData, String) _getActionMetadata(String action) {
    return switch (action) {
      'feat' => (Symbols.add_circle_rounded, 'Features'),
      'fix' => (Symbols.build_circle_rounded, 'Bug Fixes'),
      'docs' => (Symbols.description_rounded, 'Documentation'),
      'style' => (Symbols.palette_rounded, 'Styling'),
      'refactor' => (Symbols.auto_fix_high_rounded, 'Refactor'),
      'perf' => (Symbols.speed_rounded, 'Performance'),
      'test' => (Symbols.checklist_rtl_rounded, 'Testing'),
      'build' => (Symbols.package_2_rounded, 'Build'),
      'ci' => (Symbols.sync_alt_rounded, 'CI/CD'),
      'chore' => (Symbols.settings_suggest_rounded, 'Maintenance'),
      _ => (Symbols.history_rounded, 'Other'),
    };
  }
}
