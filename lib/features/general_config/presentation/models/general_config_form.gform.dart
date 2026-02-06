// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_config_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveGeneralConfigFormConsumer extends StatelessWidget {
  const ReactiveGeneralConfigFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
    BuildContext context,
    GeneralConfigForm formModel,
    Widget? child,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveGeneralConfigForm.of(context);

    if (formModel is! GeneralConfigForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class GeneralConfigFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const GeneralConfigFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final GeneralConfigForm form;
}

class ReactiveGeneralConfigForm extends StatelessWidget {
  const ReactiveGeneralConfigForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResult,
  }) : super(key: key);

  final Widget child;

  final GeneralConfigForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  static GeneralConfigForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
            GeneralConfigFormInheritedStreamer
          >()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<
          GeneralConfigFormInheritedStreamer
        >();
    return element == null
        ? null
        : (element.widget as GeneralConfigFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralConfigFormInheritedStreamer(
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

extension ReactiveReactiveGeneralConfigFormExt on BuildContext {
  GeneralConfigForm? generalConfigFormWatch() =>
      ReactiveGeneralConfigForm.of(this);

  GeneralConfigForm? generalConfigFormRead() =>
      ReactiveGeneralConfigForm.of(this, listen: false);
}

class GeneralConfigFormBuilder extends StatefulWidget {
  const GeneralConfigFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final GeneralConfig? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  final Widget Function(
    BuildContext context,
    GeneralConfigForm formModel,
    Widget? child,
  )
  builder;

  final void Function(BuildContext context, GeneralConfigForm formModel)?
  initState;

  @override
  _GeneralConfigFormBuilderState createState() =>
      _GeneralConfigFormBuilderState();
}

class _GeneralConfigFormBuilderState extends State<GeneralConfigFormBuilder> {
  late GeneralConfigForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = GeneralConfigForm(
      GeneralConfigForm.formElements(widget.model),
      null,
      null,
    );

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logGeneralConfigForm.onRecord.listen((LogRecord e) {
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
  void didUpdateWidget(covariant GeneralConfigFormBuilder oldWidget) {
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
    return ReactiveGeneralConfigForm(
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

final _logGeneralConfigForm = Logger.detached('GeneralConfigForm');

class GeneralConfigForm implements FormModel<GeneralConfig, GeneralConfig> {
  GeneralConfigForm(this.form, this.path, this._formModel)
    : initial = form.rawValue;

  static const String isWarningControlName = "isWarning";

  static const String warningThresholdControlName = "warningThreshold";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, Object?> initial;

  String isWarningControlPath() => pathBuilder(isWarningControlName);

  String warningThresholdControlPath() =>
      pathBuilder(warningThresholdControlName);

  bool get _isWarningValue => isWarningControl.value ?? false;

  String get _warningThresholdValue => warningThresholdControl.value ?? '0';

  bool get _isWarningRawValue => isWarningControl.value ?? false;

  String get _warningThresholdRawValue => warningThresholdControl.value ?? '0';

  bool get containsIsWarning {
    try {
      form.control(isWarningControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsWarningThreshold {
    try {
      form.control(warningThresholdControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get isWarningErrors => isWarningControl.errors;

  Map<String, dynamic> get warningThresholdErrors =>
      warningThresholdControl.errors;

  void get isWarningFocus => form.focus(isWarningControlPath());

  void get warningThresholdFocus => form.focus(warningThresholdControlPath());

  void isWarningValueUpdate(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isWarningControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void warningThresholdValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    warningThresholdControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void isWarningValuePatch(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isWarningControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void warningThresholdValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    warningThresholdControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void isWarningValueReset(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => isWarningControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void warningThresholdValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => warningThresholdControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  FormControl<bool> get isWarningControl =>
      form.control(isWarningControlPath()) as FormControl<bool>;

  FormControl<String> get warningThresholdControl =>
      form.control(warningThresholdControlPath()) as FormControl<String>;

  void isWarningSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      isWarningControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      isWarningControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void warningThresholdSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      warningThresholdControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      warningThresholdControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  GeneralConfig get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logGeneralConfigForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return GeneralConfig(
      isWarning: _isWarningValue,
      warningThreshold: _warningThresholdValue,
    );
  }

  @override
  GeneralConfig get rawModel {
    return GeneralConfig(
      isWarning: _isWarningRawValue,
      warningThreshold: _warningThresholdRawValue,
    );
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
  bool equalsTo(GeneralConfig? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      GeneralConfigForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(GeneralConfig model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logGeneralConfigForm.info('Errors');
      _logGeneralConfigForm.info('┗━━ ${form.errors}');
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
    GeneralConfig? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    GeneralConfigForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    GeneralConfig? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = GeneralConfigForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({
    GeneralConfig? value,
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

  static FormGroup formElements(GeneralConfig? generalConfig) => FormGroup(
    {
      isWarningControlName: FormControl<bool>(
        value: generalConfig?.isWarning,
        validators: [],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
        touched: false,
      ),
      warningThresholdControlName: FormControl<String>(
        value: generalConfig?.warningThreshold,
        validators: [MinValidator(0)],
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

class ReactiveGeneralConfigFormArrayBuilder<
  ReactiveGeneralConfigFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveGeneralConfigFormArrayBuilder({
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

  final FormArray<ReactiveGeneralConfigFormArrayBuilderT>? formControl;

  final FormArray<ReactiveGeneralConfigFormArrayBuilderT>? Function(
    GeneralConfigForm formModel,
  )?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    GeneralConfigForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveGeneralConfigFormArrayBuilderT> control,
    ReactiveGeneralConfigFormArrayBuilderT? item,
    GeneralConfigForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveGeneralConfigFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveGeneralConfigForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveGeneralConfigFormArrayBuilderT>(
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

class ReactiveGeneralConfigFormArrayBuilder2<
  ReactiveGeneralConfigFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveGeneralConfigFormArrayBuilder2({
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

  final FormArray<ReactiveGeneralConfigFormArrayBuilderT>? formControl;

  final FormArray<ReactiveGeneralConfigFormArrayBuilderT>? Function(
    GeneralConfigForm formModel,
  )?
  control;

  final Widget Function(
    ({BuildContext context, List<Widget> itemList, GeneralConfigForm formModel})
    params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveGeneralConfigFormArrayBuilderT> control,
      ReactiveGeneralConfigFormArrayBuilderT? item,
      GeneralConfigForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveGeneralConfigFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveGeneralConfigForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveGeneralConfigFormArrayBuilderT>(
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

class ReactiveGeneralConfigFormFormGroupArrayBuilder<
  ReactiveGeneralConfigFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveGeneralConfigFormFormGroupArrayBuilder({
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
    List<ReactiveGeneralConfigFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, Object?>?>,
    List<ReactiveGeneralConfigFormFormGroupArrayBuilderT>
  >
  Function(GeneralConfigForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    GeneralConfigForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveGeneralConfigFormFormGroupArrayBuilderT? item,
    GeneralConfigForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveGeneralConfigForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ??
                    <ReactiveGeneralConfigFormFormGroupArrayBuilderT>[])
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
