// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debugger_settings_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveDebuggerSettingsFormConsumer extends StatelessWidget {
  const ReactiveDebuggerSettingsFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
    BuildContext context,
    DebuggerSettingsForm formModel,
    Widget? child,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDebuggerSettingsForm.of(context);

    if (formModel is! DebuggerSettingsForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class DebuggerSettingsFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const DebuggerSettingsFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final DebuggerSettingsForm form;
}

class ReactiveDebuggerSettingsForm extends StatelessWidget {
  const ReactiveDebuggerSettingsForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResult,
  }) : super(key: key);

  final Widget child;

  final DebuggerSettingsForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  static DebuggerSettingsForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
            DebuggerSettingsFormInheritedStreamer
          >()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<
          DebuggerSettingsFormInheritedStreamer
        >();
    return element == null
        ? null
        : (element.widget as DebuggerSettingsFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return DebuggerSettingsFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: ReactiveFormPopScope(
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveDebuggerSettingsFormExt on BuildContext {
  DebuggerSettingsForm? debuggerSettingsFormWatch() =>
      ReactiveDebuggerSettingsForm.of(this);

  DebuggerSettingsForm? debuggerSettingsFormRead() =>
      ReactiveDebuggerSettingsForm.of(this, listen: false);
}

class DebuggerSettingsFormBuilder extends StatefulWidget {
  const DebuggerSettingsFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final DebuggerSettings? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  final Widget Function(
    BuildContext context,
    DebuggerSettingsForm formModel,
    Widget? child,
  )
  builder;

  final void Function(BuildContext context, DebuggerSettingsForm formModel)?
  initState;

  @override
  _DebuggerSettingsFormBuilderState createState() =>
      _DebuggerSettingsFormBuilderState();
}

class _DebuggerSettingsFormBuilderState
    extends State<DebuggerSettingsFormBuilder> {
  late DebuggerSettingsForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = DebuggerSettingsForm(
      DebuggerSettingsForm.formElements(widget.model),
      null,
      null,
    );

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logDebuggerSettingsForm.onRecord.listen((LogRecord e) {
      // use `dumpErrorToConsole` for severe messages to ensure that severe
      // exceptions are formatted consistently with other Flutter examples and
      // avoids printing duplicate exceptions
      if (e.level >= Level.SEVERE) {
        final Object? error = e.error;
        FlutterError.dumpErrorToConsole(
          FlutterErrorDetails(
            exception: error is Exception ? error : Exception(error),
            stack: e.stackTrace,
            library: e.loggerName,
            context: ErrorDescription(e.message),
          ),
        );
      } else {
        log(
          e.message,
          time: e.time,
          sequenceNumber: e.sequenceNumber,
          level: e.level.value,
          name: e.loggerName,
          zone: e.zone,
          error: e.error,
          stackTrace: e.stackTrace,
        );
      }
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DebuggerSettingsFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    _logSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDebuggerSettingsForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        canPop: widget.canPop,
        onPopInvokedWithResult: widget.onPopInvokedWithResult,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

final _logDebuggerSettingsForm = Logger.detached('DebuggerSettingsForm');

class DebuggerSettingsForm
    implements FormModel<DebuggerSettings, DebuggerSettings> {
  DebuggerSettingsForm(this.form, this.path, this._formModel)
    : initial = form.rawValue;

  static const String isEnabledControlName = "isEnabled";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, Object?> initial;

  String isEnabledControlPath() => pathBuilder(isEnabledControlName);

  bool get _isEnabledValue => isEnabledControl.value ?? false;

  bool get _isEnabledRawValue => isEnabledControl.value ?? false;

  bool get containsIsEnabled {
    try {
      form.control(isEnabledControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get isEnabledErrors => isEnabledControl.errors;

  void get isEnabledFocus => form.focus(isEnabledControlPath());

  void isEnabledValueUpdate(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isEnabledControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void isEnabledValuePatch(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isEnabledControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void isEnabledValueReset(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => isEnabledControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  FormControl<bool> get isEnabledControl =>
      form.control(isEnabledControlPath()) as FormControl<bool>;

  void isEnabledSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      isEnabledControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      isEnabledControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  DebuggerSettings get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logDebuggerSettingsForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return DebuggerSettings(isEnabled: _isEnabledValue);
  }

  @override
  DebuggerSettings get rawModel {
    return DebuggerSettings(isEnabled: _isEnabledRawValue);
  }

  @override
  void toggleDisabled({bool updateParent = true, bool emitEvent = true}) {
    if (_disabled.isEmpty) {
      currentForm.controls.forEach((key, control) {
        _disabled[key] = control.disabled;
      });

      currentForm.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      currentForm.controls.forEach((key, control) {
        if (_disabled[key] == false) {
          currentForm.controls[key]?.markAsEnabled(
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }

        _disabled.remove(key);
      });
    }
  }

  @override
  bool equalsTo(DebuggerSettings? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      DebuggerSettingsForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(DebuggerSettings model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logDebuggerSettingsForm.info('Errors');
      _logDebuggerSettingsForm.info('┗━━ ${form.errors}');
      onNotValid?.call();
    }
  }

  @override
  bool get hasChanged {
    return !const DeepCollectionEquality().equals(
      currentForm.rawValue,
      initial,
    );
  }

  @override
  FormGroup get currentForm {
    return path == null ? form : form.control(path!) as FormGroup;
  }

  @override
  void updateValue(
    DebuggerSettings? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    DebuggerSettingsForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    DebuggerSettings? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = DebuggerSettingsForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({
    DebuggerSettings? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.reset(
    value: value != null ? formElements(value).rawValue : null,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void updateInitial(Map<String, Object?>? value, String? path) {
    if (_formModel != null) {
      _formModel?.updateInitial(currentForm.rawValue, path);
      return;
    }

    if (value == null) return;

    if (path == null || path.isEmpty) {
      initial.addAll(value);
      return;
    }

    final keys = path.split('.');
    Object? current = initial;
    for (var i = 0; i < keys.length - 1; i++) {
      final key = keys[i];

      if (current is List) {
        final index = int.tryParse(key);
        if (index != null && index >= 0 && index < current.length) {
          current = current[index];
          continue;
        }
      }

      if (current is Map) {
        if (!current.containsKey(key)) {
          current[key] = <String, Object?>{};
        }
        current = current[key];
        continue;
      }

      return;
    }

    final key = keys.last;
    if (current is List) {
      final index = int.tryParse(key);
      if (index != null && index >= 0 && index < current.length) {
        current[index] = value;
      }
    } else if (current is Map) {
      current[key] = value;
    }
  }

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(DebuggerSettings? debuggerSettings) =>
      FormGroup(
        {
          isEnabledControlName: FormControl<bool>(
            value: debuggerSettings?.isEnabled,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
        },
        validators: [],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
      );
}

class ReactiveDebuggerSettingsFormArrayBuilder<
  ReactiveDebuggerSettingsFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveDebuggerSettingsFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
    this.emptyBuilder,
    this.controlFilter,
  }) : assert(
         control != null || formControl != null,
         "You have to specify `control` or `formControl`!",
       ),
       super(key: key);

  final FormArray<ReactiveDebuggerSettingsFormArrayBuilderT>? formControl;

  final FormArray<ReactiveDebuggerSettingsFormArrayBuilderT>? Function(
    DebuggerSettingsForm formModel,
  )?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    DebuggerSettingsForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveDebuggerSettingsFormArrayBuilderT> control,
    ReactiveDebuggerSettingsFormArrayBuilderT? item,
    DebuggerSettingsForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveDebuggerSettingsFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDebuggerSettingsForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveDebuggerSettingsFormArrayBuilderT
    >(
      formControl: formControl ?? control?.call(formModel),
      builder: builder != null
          ? (context, itemList) => builder(context, itemList, formModel)
          : null,
      itemBuilder: (context, i, control, item) =>
          itemBuilder(context, i, control, item, formModel),
      emptyBuilder: emptyBuilder,
      controlFilter: controlFilter,
    );
  }
}

class ReactiveDebuggerSettingsFormArrayBuilder2<
  ReactiveDebuggerSettingsFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveDebuggerSettingsFormArrayBuilder2({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
    this.emptyBuilder,
    this.controlFilter,
  }) : assert(
         control != null || formControl != null,
         "You have to specify `control` or `formControl`!",
       ),
       super(key: key);

  final FormArray<ReactiveDebuggerSettingsFormArrayBuilderT>? formControl;

  final FormArray<ReactiveDebuggerSettingsFormArrayBuilderT>? Function(
    DebuggerSettingsForm formModel,
  )?
  control;

  final Widget Function(
    ({
      BuildContext context,
      List<Widget> itemList,
      DebuggerSettingsForm formModel,
    })
    params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveDebuggerSettingsFormArrayBuilderT> control,
      ReactiveDebuggerSettingsFormArrayBuilderT? item,
      DebuggerSettingsForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveDebuggerSettingsFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDebuggerSettingsForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveDebuggerSettingsFormArrayBuilderT
    >(
      formControl: formControl ?? control?.call(formModel),
      builder: builder != null
          ? (context, itemList) => builder((
              context: context,
              itemList: itemList,
              formModel: formModel,
            ))
          : null,
      itemBuilder: (context, i, control, item) => itemBuilder((
        context: context,
        i: i,
        control: control,
        item: item,
        formModel: formModel,
      )),
      emptyBuilder: emptyBuilder,
      controlFilter: controlFilter,
    );
  }
}

class ReactiveDebuggerSettingsFormFormGroupArrayBuilder<
  ReactiveDebuggerSettingsFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveDebuggerSettingsFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  }) : assert(
         extended != null || getExtended != null,
         "You have to specify `control` or `formControl`!",
       ),
       super(key: key);

  final ExtendedControl<
    List<Map<String, Object?>?>,
    List<ReactiveDebuggerSettingsFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, Object?>?>,
    List<ReactiveDebuggerSettingsFormFormGroupArrayBuilderT>
  >
  Function(DebuggerSettingsForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    DebuggerSettingsForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveDebuggerSettingsFormFormGroupArrayBuilderT? item,
    DebuggerSettingsForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDebuggerSettingsForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ??
                    <ReactiveDebuggerSettingsFormFormGroupArrayBuilderT>[])
                .asMap()
                .map(
                  (i, item) =>
                      MapEntry(i, itemBuilder(context, i, item, formModel)),
                )
                .values
                .toList();

        return builder?.call(context, itemList, formModel) ??
            Column(children: itemList);
      },
    );
  }
}
