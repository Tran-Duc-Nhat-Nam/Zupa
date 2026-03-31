import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

/// A data model for items displayed in an [AppList].
class AppListItem {
  final Widget? leading;
  final IconData? leadingIcon;
  final Widget? trailing;
  final IconData? trailingIcon;
  final Widget? content;
  final String? text;
  final Color? color;
  final Color? leadingColor;
  final Color? trailingColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final void Function()? onTap;

  const AppListItem({
    this.leading,
    this.leadingIcon,
    this.trailing,
    this.trailingIcon,
    this.content,
    this.text,
    this.onTap,
    this.color,
    this.leadingColor,
    this.trailingColor,
    this.padding,
    this.borderRadius,
  });
}

/// A Material Design 3 inspired list component that renders a collection of [AppListItem]s.
class AppList extends StatelessWidget {
  final List<AppListItem> items;
  final double spacing;
  final EdgeInsetsGeometry? padding;
  final bool segmented;

  const AppList({
    super.key,
    required this.items,
    this.spacing = 4,
    this.padding,
    this.segmented = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isFirst = index == 0;
        final isLast = index == items.length - 1;

        final itemBorderRadius =
            item.borderRadius ??
            (segmented
                ? .vertical(
                    top: isFirst ? const .circular(16) : const .circular(8),
                    bottom: isLast ? const .circular(16) : const .circular(8),
                  )
                : null);

        return Column(
          mainAxisSize: .min,
          children: [
            DecoratedBox(
              decoration: (segmented && spacing > 0)
                  ? BoxDecoration(
                      color: colors.surfaceContainerLow,
                      borderRadius: itemBorderRadius,
                    )
                  : const BoxDecoration(),
              child: AppListTile(
                leading: item.leading,
                leadingIcon: item.leadingIcon,
                trailing: item.trailing,
                trailingIcon: item.trailingIcon,
                content: item.content,
                text: item.text,
                onTap: item.onTap,
                color: item.color,
                leadingColor: item.leadingColor,
                trailingColor: item.trailingColor,
                padding: item.padding,
                borderRadius: itemBorderRadius,
              ),
            ),
            if (index < items.length - 1) ...[
              if (spacing > 0)
                SizedBox(height: spacing)
              else if (segmented)
                Divider(
                  height: 1,
                  thickness: 1,
                  color: colors.outlineVariant.withAlpha(100),
                ),
            ],
          ],
        );
      }).toList(),
    );

    if (segmented && spacing == 0) {
      content = DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: .circular(16),
        ),
        child: content,
      );
    }

    return Padding(padding: padding ?? EdgeInsets.zero, child: content);
  }
}

/// A single list tile widget, primary used as an item within [AppList].
class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.leading,
    this.trailing,
    this.content,
    this.text,
    this.onTap,
    this.leadingIcon,
    this.trailingIcon,
    this.color,
    this.leadingColor,
    this.trailingColor,
    this.padding,
    this.borderRadius,
  });

  final Widget? leading;
  final IconData? leadingIcon;
  final Widget? trailing;
  final IconData? trailingIcon;
  final Widget? content;
  final String? text;
  final Color? color;
  final Color? leadingColor;
  final Color? trailingColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final tileBorderRadius = borderRadius ?? BorderRadius.circular(12);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: tileBorderRadius,
        splashColor: colors.primary.withAlpha(20),
        highlightColor: colors.primary.withAlpha(10),
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              if (leading != null || leadingIcon != null) ...[
                leading ??
                    Icon(
                      leadingIcon,
                      color: leadingColor ?? colors.primary,
                      size: 24,
                    ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: text != null || content != null
                    ? content ??
                          Text(
                            text!,
                            style: AppTextStyles.titleMedium.copyWith(
                              color: color ?? colors.onSurface,
                            ),
                          )
                    : const SizedBox(),
              ),
              if (trailing != null || trailingIcon != null) ...[
                const SizedBox(width: 16),
                trailing ??
                    Icon(
                      trailingIcon,
                      color: trailingColor ?? colors.outline,
                      size: 20,
                    ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
