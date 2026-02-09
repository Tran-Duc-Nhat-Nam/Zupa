import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/widgets/state/app_state.dart';
import 'package:zupa/core/widgets/app_app_bar.dart';

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
  AppState<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends AppState<AppScreen> {
  ShakeDetector? detector;

  @override
  void initState() {
    if (!widget.hasParentView) {
      detector = .autoStart(
        onPhoneShake: (ShakeEvent event) async {
          if (await getIt<StorageService>().getDebuggerMode() &&
              mounted &&
              kDebugMode) {
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
    return widget.formGroup != null
        ? ReactiveForm(formGroup: widget.formGroup!, child: _buildScreen())
        : _buildScreen();
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
                widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
            body: _buildContent(),
            floatingActionButton: widget.floatingActionButton,
          );
  }

  Stack _buildContent() {
    return Stack(
      alignment: .bottomCenter,
      children: [
        SafeArea(
          top: widget.hasSafeTopArea,
          bottom: widget.hasSafeBottomArea,
          child: Align(
            alignment: .topCenter,
            child: SizedBox(
              width: 600,
              child: widget.isChildScrollable
                  ? widget.child
                  : LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: constraints.copyWith(
                                  minHeight: constraints.maxHeight,
                                  maxHeight: .infinity,
                                ),
                                child: widget.child,
                              ),
                            );
                          },
                    ),
            ),
          ),
        ),
        Align(
          alignment: .bottomCenter,
          child: Padding(
            padding:
                widget.footerPadding ??
                const .symmetric(vertical: 16, horizontal: 24),
            child: Column(mainAxisSize: .min, children: widget.footer),
          ),
        ),
      ],
    );
  }
}
