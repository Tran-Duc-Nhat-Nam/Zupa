// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveCheckInFormConsumer extends StatelessWidget {
  const ReactiveCheckInFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
    BuildContext context,
    CheckInForm formModel,
    Widget? child,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCheckInForm.of(context);

    if (formModel is! CheckInForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class CheckInFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const CheckInFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final CheckInForm form;
}

class ReactiveCheckInForm extends StatelessWidget {
  const ReactiveCheckInForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResult,
  }) : super(key: key);

  final Widget child;

  final CheckInForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  static CheckInForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<CheckInFormInheritedStreamer>()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<
          CheckInFormInheritedStreamer
        >();
    return element == null
        ? null
        : (element.widget as CheckInFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return CheckInFormInheritedStreamer(
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

extension ReactiveReactiveCheckInFormExt on BuildContext {
  CheckInForm? checkInFormWatch() => ReactiveCheckInForm.of(this);

  CheckInForm? checkInFormRead() => ReactiveCheckInForm.of(this, listen: false);
}

class CheckInFormBuilder extends StatefulWidget {
  const CheckInFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final CheckIn? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  final Widget Function(
    BuildContext context,
    CheckInForm formModel,
    Widget? child,
  )
  builder;

  final void Function(BuildContext context, CheckInForm formModel)? initState;

  @override
  _CheckInFormBuilderState createState() => _CheckInFormBuilderState();
}

class _CheckInFormBuilderState extends State<CheckInFormBuilder> {
  late CheckInForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = CheckInForm(
      CheckInForm.formElements(widget.model),
      null,
      null,
    );

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logCheckInForm.onRecord.listen((LogRecord e) {
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
  void didUpdateWidget(covariant CheckInFormBuilder oldWidget) {
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
    return ReactiveCheckInForm(
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

final _logCheckInForm = Logger.detached('CheckInForm');

class CheckInForm implements FormModel<CheckIn, CheckIn> {
  CheckInForm(this.form, this.path, this._formModel) : initial = form.rawValue;

  static const String ticketIDControlName = "ticketID";

  static const String pictureControlName = "picture";

  static const String vehicleTypeControlName = "vehicleType";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, Object?> initial;

  String ticketIDControlPath() => pathBuilder(ticketIDControlName);

  String pictureControlPath() => pathBuilder(pictureControlName);

  String vehicleTypeControlPath() => pathBuilder(vehicleTypeControlName);

  String get _ticketIDValue => ticketIDControl.value ?? '';

  XFile? get _pictureValue => containsPicture ? pictureControl.value : null;

  VehicleType? get _vehicleTypeValue =>
      containsVehicleType ? vehicleTypeControl.value : null;

  String get _ticketIDRawValue => ticketIDControl.value ?? '';

  XFile? get _pictureRawValue => containsPicture ? pictureControl.value : null;

  VehicleType? get _vehicleTypeRawValue =>
      containsVehicleType ? vehicleTypeControl.value : null;

  bool get containsTicketID {
    try {
      form.control(ticketIDControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPicture {
    try {
      form.control(pictureControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsVehicleType {
    try {
      form.control(vehicleTypeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get ticketIDErrors => ticketIDControl.errors;

  Map<String, dynamic>? get pictureErrors => pictureControl.errors;

  Map<String, dynamic>? get vehicleTypeErrors => vehicleTypeControl.errors;

  void get ticketIDFocus => form.focus(ticketIDControlPath());

  void get pictureFocus => form.focus(pictureControlPath());

  void get vehicleTypeFocus => form.focus(vehicleTypeControlPath());

  void pictureRemove({bool updateParent = true, bool emitEvent = true}) {
    if (containsPicture) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          pictureControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            pictureControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void vehicleTypeRemove({bool updateParent = true, bool emitEvent = true}) {
    if (containsVehicleType) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          vehicleTypeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            vehicleTypeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void ticketIDValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    ticketIDControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void pictureValueUpdate(
    XFile? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pictureControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void vehicleTypeValueUpdate(
    VehicleType? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    vehicleTypeControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void ticketIDValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    ticketIDControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void pictureValuePatch(
    XFile? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pictureControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void vehicleTypeValuePatch(
    VehicleType? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    vehicleTypeControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void ticketIDValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => ticketIDControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void pictureValueReset(
    XFile? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => pictureControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void vehicleTypeValueReset(
    VehicleType? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => vehicleTypeControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  FormControl<String> get ticketIDControl =>
      form.control(ticketIDControlPath()) as FormControl<String>;

  FormControl<XFile> get pictureControl =>
      form.control(pictureControlPath()) as FormControl<XFile>;

  FormControl<VehicleType> get vehicleTypeControl =>
      form.control(vehicleTypeControlPath()) as FormControl<VehicleType>;

  void ticketIDSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      ticketIDControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      ticketIDControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void pictureSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      pictureControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      pictureControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void vehicleTypeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      vehicleTypeControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      vehicleTypeControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  CheckIn get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logCheckInForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return CheckIn(
      ticketID: _ticketIDValue,
      picture: _pictureValue,
      vehicleType: _vehicleTypeValue,
    );
  }

  @override
  CheckIn get rawModel {
    return CheckIn(
      ticketID: _ticketIDRawValue,
      picture: _pictureRawValue,
      vehicleType: _vehicleTypeRawValue,
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
  bool equalsTo(CheckIn? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      CheckInForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(CheckIn model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logCheckInForm.info('Errors');
      _logCheckInForm.info('┗━━ ${form.errors}');
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
    CheckIn? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    CheckInForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    CheckIn? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = CheckInForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({
    CheckIn? value,
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

  static FormGroup formElements(CheckIn? checkIn) => FormGroup(
    {
      ticketIDControlName: FormControl<String>(
        value: checkIn?.ticketID,
        validators: [RequiredValidator()],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
        touched: false,
      ),
      pictureControlName: FormControl<XFile>(
        value: checkIn?.picture,
        validators: [RequiredValidator()],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
        touched: false,
      ),
      vehicleTypeControlName: FormControl<VehicleType>(
        value: checkIn?.vehicleType,
        validators: [RequiredValidator()],
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

class ReactiveCheckInFormArrayBuilder<ReactiveCheckInFormArrayBuilderT>
    extends StatelessWidget {
  const ReactiveCheckInFormArrayBuilder({
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

  final FormArray<ReactiveCheckInFormArrayBuilderT>? formControl;

  final FormArray<ReactiveCheckInFormArrayBuilderT>? Function(
    CheckInForm formModel,
  )?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    CheckInForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveCheckInFormArrayBuilderT> control,
    ReactiveCheckInFormArrayBuilderT? item,
    CheckInForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(FormControl<ReactiveCheckInFormArrayBuilderT> control)?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCheckInForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveCheckInFormArrayBuilderT>(
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

class ReactiveCheckInFormArrayBuilder2<ReactiveCheckInFormArrayBuilderT>
    extends StatelessWidget {
  const ReactiveCheckInFormArrayBuilder2({
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

  final FormArray<ReactiveCheckInFormArrayBuilderT>? formControl;

  final FormArray<ReactiveCheckInFormArrayBuilderT>? Function(
    CheckInForm formModel,
  )?
  control;

  final Widget Function(
    ({BuildContext context, List<Widget> itemList, CheckInForm formModel})
    params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveCheckInFormArrayBuilderT> control,
      ReactiveCheckInFormArrayBuilderT? item,
      CheckInForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(FormControl<ReactiveCheckInFormArrayBuilderT> control)?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCheckInForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveCheckInFormArrayBuilderT>(
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

class ReactiveCheckInFormFormGroupArrayBuilder<
  ReactiveCheckInFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveCheckInFormFormGroupArrayBuilder({
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
    List<ReactiveCheckInFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, Object?>?>,
    List<ReactiveCheckInFormFormGroupArrayBuilderT>
  >
  Function(CheckInForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    CheckInForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveCheckInFormFormGroupArrayBuilderT? item,
    CheckInForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCheckInForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ?? <ReactiveCheckInFormFormGroupArrayBuilderT>[])
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
