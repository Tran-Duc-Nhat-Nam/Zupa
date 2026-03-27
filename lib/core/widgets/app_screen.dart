import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/responsive/responsive_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_animation.dart';
import 'package:zupa/core/widgets/app_app_bar.dart';
import 'package:zupa/core/widgets/app_drawer.dart';

class AppScreen extends StatefulWidget {
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
    this.hasSafeBottomArea = true,
    this.hasSafeTopArea = true,
    this.noBackground = false,
    this.backgroundColor,
    this.appBarColor,
    this.footer = const [],
    this.hasParentView = false,
    this.onFormChanged,
    this.formInitialValue,
    this.footerPadding,
    this.formGroup,
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
  final FormGroup? formGroup;
  final void Function()? onFormChanged;
  final Map<String, dynamic>? formInitialValue;

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  ShakeDetector? detector;

  @override
  void initState() {
    if (!widget.hasParentView) {
      detector = .autoStart(
        onPhoneShake: (ShakeEvent event) async {
          if ((await getIt<StorageService>().getDebuggerMode() || kDebugMode) &&
              mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    TalkerScreen(talker: DebuggerHelper.talker),
              ),
            );
          }
        },
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    detector?.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = widget.formGroup != null
        ? ReactiveForm(formGroup: widget.formGroup!, child: _buildScreen())
        : _buildScreen();

    if (widget.hasParentView) return content;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final router = context.router;
        if (await router.canPop()) {
          router.pop();
        } else {
          if (router.isRoot) {
            SystemNavigator.pop();
          } else {
            router.parent<StackRouter>()?.maybePop();
          }
        }
      },
      child: content,
    );
  }

  Widget _buildScreen() {
    return widget.hasParentView
        ? _buildContent()
        : Scaffold(
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            appBar: widget.hasAppBar
                ? AppAppBar(
                    color: widget.appBarColor,
                    text: widget.title,
                    subtext: widget.subtitle,
                    isClose: widget.isClose,
                    trailing: widget.appBarTrailing,
                    trailingIcon: widget.appBarTrailingIcon,
                    leading: widget.appBarLeading,
                    leadingIcon: widget.appBarLeadingIcon,
                  )
                : widget.appBar,
            backgroundColor:
                widget.backgroundColor ?? AppColors.of(context).surface,
            drawer: widget.hasDrawer ? const AppDrawer() : null,
            body: _buildContent(),
            floatingActionButton: widget.floatingActionButton,
          );
  }

  Widget _buildContent() {
    return Stack(
      alignment: .bottomCenter,
      children: [
        SafeArea(
          top: widget.hasSafeTopArea,
          bottom: widget.hasSafeBottomArea,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: ResponsiveHelper.getResponsiveWidth(context),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.getResponsivePadding(context),
                ),
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
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                widget.footerPadding ??
                const EdgeInsets.only(bottom: 48, left: 24, right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.footer,
            ),
          ),
        ),
      ],
    ).withAppAnimation(animate: !widget.hasParentView);
  }
}
