import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'state/app_state.dart';
import 'app_app_bar.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
    this.title = '',
    required this.child,
    this.hasAppBar = true,
    this.appBar,
    this.subtitle,
    this.hasDrawer = true,
    this.isChildScrollable = false,
    this.resizeToAvoidBottomInset = false,
    this.hasSafeBottomArea = true,
    this.hasSafeTopArea = true,
    this.noBackground = false,
    this.backgroundColor,
    this.appBarColor,
    this.footer = const [],
    this.onFormChanged,
    this.formInitialValue,
    this.footerPadding,
    this.formKey,
    this.isClose,
    this.appBarTrailingIconPath,
    this.appBarTrailing,
    this.appBarLeadingIconPath,
    this.appBarLeading,
  });

  final bool hasAppBar;
  final bool hasDrawer;
  final bool isChildScrollable;
  final bool? isClose;
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
  final String? appBarTrailingIconPath;
  final List<Widget>? appBarTrailing;
  final String? appBarLeadingIconPath;
  final Widget? appBarLeading;
  final GlobalKey<FormBuilderState>? formKey;
  final void Function()? onFormChanged;
  final Map<String, dynamic>? formInitialValue;

  @override
  AppState<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends AppState<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            return Scaffold(
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            appBar: widget.hasAppBar
                ? AppAppBar(
                    color: widget.appBarColor,
                    text: widget.title,
                    subtext: widget.subtitle,
                    isClose: widget.isClose,
                    trailing: widget.appBarTrailing,
                    trailingIconPath: widget.appBarTrailingIconPath,
                    leading: widget.appBarLeading,
                    leadingIconPath: widget.appBarLeadingIconPath,
                  )
                : widget.appBar,
            backgroundColor:
                widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
            body: SafeArea(
              top: widget.hasSafeTopArea,
              bottom: widget.hasSafeBottomArea,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  if (!widget.noBackground) Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: constraints.copyWith(
                                minHeight: constraints.maxHeight,
                                maxHeight: double.infinity,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/tsp-logo.png',
                                  opacity: const AlwaysStoppedAnimation(0.05),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: double.infinity,
                      child: widget.isChildScrollable
                          ? widget.child
                          : LayoutBuilder(
                              builder:
                                  (BuildContext context, BoxConstraints constraints) {
                                return SingleChildScrollView(
                                  child: ConstrainedBox(
                                    constraints: constraints.copyWith(
                                      minHeight: constraints.maxHeight,
                                      maxHeight: double.infinity,
                                    ),
                                    child: widget.child,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: widget.footerPadding ??
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.footer,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
