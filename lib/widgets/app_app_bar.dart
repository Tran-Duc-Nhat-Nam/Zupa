import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/common/styles/icons.dart';
import 'package:zupa/common/styles/text_styles.dart';
import 'package:zupa/widgets/app_icon.dart';

class AppAppBar extends AppBar {
  AppAppBar({
    super.key,
    this.color,
    this.text,
    this.subtext,
    this.isClose,
    this.trailingIconPath,
    this.trailing,
    this.leadingIconPath,
    super.leading,
  });

  final Color? color;
  final String? text;
  final String? subtext;
  final bool? isClose;
  final String? trailingIconPath;
  final List<Widget>? trailing;
  final String? leadingIconPath;

  @override
  State<AppAppBar> createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: widget.color ?? ThemeHelper.getColor(context).white,
      foregroundColor: ThemeHelper.getColor(context).blueDark,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(bottom: .circular(16)),
      ),
      title: widget.subtext != null
          ? Column(children: [Text(widget.text ?? ''), Text(widget.subtext!)])
          : GestureDetector(
              child: Text(
                widget.text ?? '',
                style: TextStyle(color: ThemeHelper.getColor(context).grey1000),
              ),
            ),
      titleTextStyle: AppTextStyles.bodyLargeSemibold,
      automaticallyImplyLeading: false,
      leading: widget.leading != null
          ? widget.leading!
          : widget.leadingIconPath != null
          ? IconButton(
              constraints: const .new(),
              padding: const .only(left: 24),
              style: const ButtonStyle(
                overlayColor: WidgetStateColor.transparent,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: AppIcon(
                path: widget.leadingIconPath!,
                color: ThemeHelper.getColor(context).grey400,
                size: 32,
              ),
              onPressed: () {},
            )
          : ModalRoute.of(context)?.impliesAppBarDismissal == true
          ? IconButton(
              constraints: const .new(),
              padding: const .only(left: 24),
              style: const ButtonStyle(
                overlayColor: WidgetStateColor.transparent,
                tapTargetSize: .shrinkWrap,
              ),
              icon: AppIcon(
                path: widget.isClose == true ? AppIcons.close : AppIcons.back,
                color: ThemeHelper.getColor(context).grey400,
                size: 32,
              ),
              onPressed: () => context.pop(),
            )
          : null,
      titleSpacing: ModalRoute.of(context)?.impliesAppBarDismissal == true
          ? 8
          : 24,
      actions: widget.trailing != null
          ? [...widget.trailing!]
          : widget.trailingIconPath != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: AppIcon(
                  path: widget.trailingIconPath!,
                  color: ThemeHelper.getColor(context).grey400,
                  size: 32,
                ),
              ),
            ]
          : [const SizedBox(width: 12)],
    );
  }
}
