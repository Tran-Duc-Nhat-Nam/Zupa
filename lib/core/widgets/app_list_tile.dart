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

  const AppList({
    super.key,
    required this.items,
    this.spacing = 8,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppListTile(
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
                borderRadius: item.borderRadius,
              ),
              if (index < items.length - 1) SizedBox(height: spacing),
            ],
          );
        }).toList(),
      ),
    );
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        splashColor: colors.primary.withAlpha(20),
        highlightColor: colors.primary.withAlpha(10),
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
