import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zupa/core/helper/responsive/responsive_helper.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/app_app_bar.dart';
import 'package:zupa/core/widgets/app_drawer.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    this.title = '',
    required this.child,
    this.hasAppBar = true,
    this.appBar,
    this.subtitle,
    this.hasDrawer = false,
    this.isChildScrollable = false,
    this.resizeToAvoidBottomInset = false,
    this.hasSafeBottomArea = false,
    this.hasSafeTopArea = true,
    this.noBackground = false,
    this.backgroundColor,
    this.appBarColor,
    this.footer = const [],
    this.hasParentView = false,
    this.onFormChanged,
    this.formInitialValue,
    this.footerPadding,
    this.isClose = false,
    this.appBarTrailingIcon,
    this.appBarTrailing,
    this.appBarLeadingIcon,
    this.appBarLeading,
    this.floatingActionButton,
  });

  final bool hasAppBar;
  final bool hasDrawer;
  final bool isChildScrollable;
  final bool isClose;
  final PreferredSizeWidget? appBar;
  final String title;
  final String? subtitle;
  final Widget child;
  final Color? backgroundColor;
  final Color? appBarColor;
  final List<Widget> footer;
  final EdgeInsetsGeometry? footerPadding;
  final bool resizeToAvoidBottomInset;
  final bool hasSafeBottomArea;
  final bool hasSafeTopArea;
  final bool noBackground;
  final bool hasParentView;
  final IconData? appBarTrailingIcon;
  final List<Widget>? appBarTrailing;
  final IconData? appBarLeadingIcon;
  final Widget? appBarLeading;
  final Widget? floatingActionButton;
  final void Function()? onFormChanged;
  final Map<String, dynamic>? formInitialValue;

  @override
  Widget build(BuildContext context) {
    if (hasParentView) return _buildScreen(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final router = context.router;
        if (router.canPop()) {
          router.pop();
        } else {
          if (router.isRoot) {
            SystemNavigator.pop();
          } else {
            router.parent<StackRouter>()?.maybePop();
          }
        }
      },
      child: _buildScreen(context),
    );
  }

  Widget _buildScreen(BuildContext context) {
    return hasParentView
        ? _buildContent(context)
        : Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: hasAppBar
                ? AppAppBar(
                    color: appBarColor,
                    text: title,
                    subtext: subtitle,
                    isClose: isClose,
                    trailing: appBarTrailing,
                    trailingIcon: appBarTrailingIcon,
                    leading: appBarLeading,
                    leadingIcon: appBarLeadingIcon,
                  )
                : appBar,
            backgroundColor: backgroundColor ?? AppColors.of(context).surface,
            drawer: hasDrawer ? const AppDrawer() : null,
            body: _buildContent(context),
            floatingActionButton: floatingActionButton,
          );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      alignment: .bottomCenter,
      children: [
        SafeArea(
          top: hasSafeTopArea,
          bottom: hasSafeBottomArea,
          child: Align(
            alignment: .topCenter,
            child: SizedBox(
              width: ResponsiveHelper.getResponsiveWidth(context),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.getResponsivePadding(context),
                ),
                child: isChildScrollable
                    ? child
                    : LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                              return SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: constraints.copyWith(
                                    minHeight: constraints.maxHeight,
                                    maxHeight: .infinity,
                                  ),
                                  child: child,
                                ),
                              );
                            },
                      ),
              ),
            ),
          ),
        ),
        Align(
          alignment: .bottomCenter,
          child: Padding(
            padding:
                footerPadding ?? const .only(bottom: 48, left: 24, right: 24),
            child: Column(mainAxisSize: .min, children: footer),
          ),
        ),
      ],
    ).withAppAnimation(animate: !hasParentView);
  }
}
