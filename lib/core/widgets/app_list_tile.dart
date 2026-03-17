import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

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
        borderRadius: borderRadius,
        child: Padding(
          padding: padding ?? const .symmetric(vertical: 12),
          child: Row(
            spacing: 12,
            children: [
              if (leading != null || leadingIcon != null)
                leading ??
                    Icon(leadingIcon, color: leadingColor ?? colors.primary),
              Expanded(
                child: text != null || content != null
                    ? content ??
                          Text(
                            text!,
                            style: AppTextStyles.bodyMediumMedium.copyWith(
                              color: color ?? colors.onSurface,
                            ),
                          )
                    : const SizedBox(),
              ),
              if (trailing != null || trailingIcon != null)
                trailing ??
                    Icon(trailingIcon, color: trailingColor ?? colors.outline),
            ],
          ),
        ),
      ),
    );
  }
}
