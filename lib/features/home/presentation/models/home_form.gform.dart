// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveHomeFormConsumer extends StatelessWidget {
  const ReactiveHomeFormConsumer({Key? key, required this.builder, this.child})
    : super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context, HomeForm formModel, Widget? child)
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveHomeForm.of(context);

    if (formModel is! HomeForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class HomeFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const HomeFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final HomeForm form;
}

class ReactiveHomeForm extends StatelessWidget {
  const ReactiveHomeForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResult,
  }) : super(key: key);

  final Widget child;

  final HomeForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  static HomeForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<HomeFormInheritedStreamer>()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<HomeFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as HomeFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return HomeFormInheritedStreamer(
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

extension ReactiveReactiveHomeFormExt on BuildContext {
  HomeForm? homeFormWatch() => ReactiveHomeForm.of(this);

  HomeForm? homeFormRead() => ReactiveHomeForm.of(this, listen: false);
}

class HomeFormBuilder extends StatefulWidget {
  const HomeFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final Home? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  final Widget Function(BuildContext context, HomeForm formModel, Widget? child)
  builder;

  final void Function(BuildContext context, HomeForm formModel)? initState;

  @override
  _HomeFormBuilderState createState() => _HomeFormBuilderState();
}

class _HomeFormBuilderState extends State<HomeFormBuilder> {
  late HomeForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = HomeForm(HomeForm.formElements(widget.model), null, null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logHomeForm.onRecord.listen((LogRecord e) {
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
  void didUpdateWidget(covariant HomeFormBuilder oldWidget) {
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
    return ReactiveHomeForm(
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

final _logHomeForm = Logger.detached('HomeForm');

class HomeForm implements FormModel<Home, Home> {
  HomeForm(this.form, this.path, this._formModel) : initial = form.rawValue;

  static const String keywordControlName = "keyword";

  static const String timeControlName = "time";

  static const String typeControlName = "type";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, Object?> initial;

  String keywordControlPath() => pathBuilder(keywordControlName);

  String timeControlPath() => pathBuilder(timeControlName);

  String typeControlPath() => pathBuilder(typeControlName);

  String get _keywordValue => keywordControl.value ?? '';

  DateTime? get _timeValue => containsTime ? timeControl.value : null;

  VehicleType? get _typeValue => containsType ? typeControl.value : null;

  String get _keywordRawValue => keywordControl.value ?? '';

  DateTime? get _timeRawValue => containsTime ? timeControl.value : null;

  VehicleType? get _typeRawValue => containsType ? typeControl.value : null;

  bool get containsKeyword {
    try {
      form.control(keywordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTime {
    try {
      form.control(timeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsType {
    try {
      form.control(typeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get keywordErrors => keywordControl.errors;

  Map<String, dynamic>? get timeErrors => timeControl.errors;

  Map<String, dynamic>? get typeErrors => typeControl.errors;

  void get keywordFocus => form.focus(keywordControlPath());

  void get timeFocus => form.focus(timeControlPath());

  void get typeFocus => form.focus(typeControlPath());

  void timeRemove({bool updateParent = true, bool emitEvent = true}) {
    if (containsTime) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          timeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            timeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void typeRemove({bool updateParent = true, bool emitEvent = true}) {
    if (containsType) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          typeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            typeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void keywordValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    keywordControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void timeValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    timeControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void typeValueUpdate(
    VehicleType? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void keywordValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    keywordControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void timeValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    timeControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void typeValuePatch(
    VehicleType? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void keywordValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => keywordControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void timeValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => timeControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void typeValueReset(
    VehicleType? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => typeControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  FormControl<String> get keywordControl =>
      form.control(keywordControlPath()) as FormControl<String>;

  FormControl<DateTime> get timeControl =>
      form.control(timeControlPath()) as FormControl<DateTime>;

  FormControl<VehicleType> get typeControl =>
      form.control(typeControlPath()) as FormControl<VehicleType>;

  void keywordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      keywordControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      keywordControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void timeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      timeControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      timeControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void typeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      typeControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      typeControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  Home get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logHomeForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return Home(keyword: _keywordValue, time: _timeValue, type: _typeValue);
  }

  @override
  Home get rawModel {
    return Home(
      keyword: _keywordRawValue,
      time: _timeRawValue,
      type: _typeRawValue,
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
  bool equalsTo(Home? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      HomeForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(Home model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logHomeForm.info('Errors');
      _logHomeForm.info('┗━━ ${form.errors}');
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
    Home? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    HomeForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    Home? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = HomeForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({Home? value, bool updateParent = true, bool emitEvent = true}) =>
      currentForm.reset(
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

  static FormGroup formElements(Home? home) => FormGroup(
    {
      keywordControlName: FormControl<String>(
        value: home?.keyword,
        validators: [],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
        touched: false,
      ),
      timeControlName: FormControl<DateTime>(
        value: home?.time,
        validators: [],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
        touched: false,
      ),
      typeControlName: FormControl<VehicleType>(
        value: home?.type,
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

class ReactiveHomeFormArrayBuilder<ReactiveHomeFormArrayBuilderT>
    extends StatelessWidget {
  const ReactiveHomeFormArrayBuilder({
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

  final FormArray<ReactiveHomeFormArrayBuilderT>? formControl;

  final FormArray<ReactiveHomeFormArrayBuilderT>? Function(HomeForm formModel)?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    HomeForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveHomeFormArrayBuilderT> control,
    ReactiveHomeFormArrayBuilderT? item,
    HomeForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(FormControl<ReactiveHomeFormArrayBuilderT> control)?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveHomeForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveHomeFormArrayBuilderT>(
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

class ReactiveHomeFormArrayBuilder2<ReactiveHomeFormArrayBuilderT>
    extends StatelessWidget {
  const ReactiveHomeFormArrayBuilder2({
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

  final FormArray<ReactiveHomeFormArrayBuilderT>? formControl;

  final FormArray<ReactiveHomeFormArrayBuilderT>? Function(HomeForm formModel)?
  control;

  final Widget Function(
    ({BuildContext context, List<Widget> itemList, HomeForm formModel}) params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveHomeFormArrayBuilderT> control,
      ReactiveHomeFormArrayBuilderT? item,
      HomeForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(FormControl<ReactiveHomeFormArrayBuilderT> control)?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveHomeForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveHomeFormArrayBuilderT>(
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

class ReactiveHomeFormFormGroupArrayBuilder<
  ReactiveHomeFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveHomeFormFormGroupArrayBuilder({
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
    List<ReactiveHomeFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, Object?>?>,
    List<ReactiveHomeFormFormGroupArrayBuilderT>
  >
  Function(HomeForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    HomeForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveHomeFormFormGroupArrayBuilderT? item,
    HomeForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveHomeForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ?? <ReactiveHomeFormFormGroupArrayBuilderT>[])
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
