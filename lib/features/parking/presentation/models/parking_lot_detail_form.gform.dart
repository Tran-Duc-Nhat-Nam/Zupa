// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_lot_detail_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveParkingLotDetailFormConsumer extends StatelessWidget {
  const ReactiveParkingLotDetailFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
    BuildContext context,
    ParkingLotDetailForm formModel,
    Widget? child,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveParkingLotDetailForm.of(context);

    if (formModel is! ParkingLotDetailForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class ParkingLotDetailFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const ParkingLotDetailFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final ParkingLotDetailForm form;
}

class ReactiveParkingLotDetailForm extends StatelessWidget {
  const ReactiveParkingLotDetailForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResultWithResult,
  }) : super(key: key);

  final Widget child;

  final ParkingLotDetailForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResultWithResult;

  static ParkingLotDetailForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
            ParkingLotDetailFormInheritedStreamer
          >()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<
          ParkingLotDetailFormInheritedStreamer
        >();
    return element == null
        ? null
        : (element.widget as ParkingLotDetailFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return ParkingLotDetailFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: ReactiveFormPopScope(
        canPop: canPop,
        onPopInvokedWithResultWithResult: onPopInvokedWithResultWithResult,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveParkingLotDetailFormExt on BuildContext {
  ParkingLotDetailForm? parkingLotDetailFormWatch() =>
      ReactiveParkingLotDetailForm.of(this);

  ParkingLotDetailForm? parkingLotDetailFormRead() =>
      ReactiveParkingLotDetailForm.of(this, listen: false);
}

class ParkingLotDetailFormBuilder extends StatefulWidget {
  const ParkingLotDetailFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResultWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final ParkingLotDetail? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResultWithResult;

  final Widget Function(
    BuildContext context,
    ParkingLotDetailForm formModel,
    Widget? child,
  )
  builder;

  final void Function(BuildContext context, ParkingLotDetailForm formModel)?
  initState;

  @override
  _ParkingLotDetailFormBuilderState createState() =>
      _ParkingLotDetailFormBuilderState();
}

class _ParkingLotDetailFormBuilderState
    extends State<ParkingLotDetailFormBuilder> {
  late ParkingLotDetailForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = ParkingLotDetailForm(
      ParkingLotDetailForm.formElements(widget.model),
      null,
      null,
    );

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logParkingLotDetailForm.onRecord.listen((LogRecord e) {
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
  void didUpdateWidget(covariant ParkingLotDetailFormBuilder oldWidget) {
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
    return ReactiveParkingLotDetailForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        canPop: widget.canPop,
        onPopInvokedWithResultWithResult:
            widget.onPopInvokedWithResultWithResult,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

final _logParkingLotDetailForm = Logger.detached('ParkingLotDetailForm');

class ParkingLotDetailForm
    implements FormModel<ParkingLotDetail, ParkingLotDetail> {
  ParkingLotDetailForm(this.form, this.path, this._formModel)
    : initial = form.rawValue;

  static const String branchNameControlName = "branchName";

  static const String addressControlName = "address";

  static const String capacityControlName = "capacity";

  static const String isLockedControlName = "isLocked";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, dynamic> initial;

  String branchNameControlPath() => pathBuilder(branchNameControlName);

  String addressControlPath() => pathBuilder(addressControlName);

  String isLockedControlPath() => pathBuilder(isLockedControlName);

  String capacityControlPath() => pathBuilder(capacityControlName);

  String get _branchNameValue => branchNameControl.value ?? '';

  String get _addressValue => addressControl.value ?? '';

  bool get _isLockedValue => isLockedControl.value ?? false;

  List<ParkingLotCapacity> get _capacityValue =>
      capacityParkingLotCapacityForm.map((e) => e.model).toList();

  String get _branchNameRawValue => branchNameControl.value ?? '';

  String get _addressRawValue => addressControl.value ?? '';

  bool get _isLockedRawValue => isLockedControl.value ?? false;

  List<ParkingLotCapacity> get _capacityRawValue =>
      capacityParkingLotCapacityForm.map((e) => e.rawModel).toList();

  bool get containsBranchName {
    try {
      form.control(branchNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAddress {
    try {
      form.control(addressControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsIsLocked {
    try {
      form.control(isLockedControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCapacity {
    try {
      form.control(capacityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get branchNameErrors => branchNameControl.errors;

  Map<String, dynamic> get addressErrors => addressControl.errors;

  Map<String, dynamic> get isLockedErrors => isLockedControl.errors;

  Map<String, dynamic> get capacityErrors => capacityControl.errors;

  void get branchNameFocus => form.focus(branchNameControlPath());

  void get addressFocus => form.focus(addressControlPath());

  void get isLockedFocus => form.focus(isLockedControlPath());

  void get capacityFocus => form.focus(capacityControlPath());

  void branchNameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    branchNameControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void addressValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void isLockedValueUpdate(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isLockedControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void capacityValueUpdate(
    List<ParkingLotCapacity> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final localValue = (value);
    if (localValue.isEmpty) {
      capacityClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final toUpdate = <ParkingLotCapacity>[];
    final toAdd = <ParkingLotCapacity>[];

    localValue.asMap().forEach((k, v) {
      final values = capacityControl.controls.map((e) => e.value).toList();

      if (capacityParkingLotCapacityForm.asMap().containsKey(k) &&
          values.asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      capacityControl.updateValue(
        toUpdate
            .map((e) => ParkingLotCapacityForm.formElements(e).rawValue)
            .toList(),
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        capacityControl.add(
          ParkingLotCapacityForm.formElements(e),
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      });
    }
  }

  void capacityInsert(
    int i,
    ParkingLotCapacity value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final values = capacityControl.controls.map((e) => e.value).toList();
    if (values.length < i) {
      addCapacityItem(value);
      return;
    }

    capacityControl.insert(
      i,
      ParkingLotCapacityForm.formElements(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void capacityClear({bool updateParent = true, bool emitEvent = true}) {
    capacityParkingLotCapacityForm.clear();
    capacityControl.clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void branchNameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    branchNameControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void addressValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void isLockedValuePatch(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isLockedControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void capacityValuePatch(
    List<ParkingLotCapacity> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = capacityParkingLotCapacityForm.asMap().keys;

    final toPatch = <ParkingLotCapacity>[];
    (value).asMap().forEach((k, v) {
      if (keys.contains(k)) {
        toPatch.add(v);
      }
    });

    capacityControl.patchValue(
      toPatch
          .map((e) => ParkingLotCapacityForm.formElements(e).rawValue)
          .toList(),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void branchNameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => branchNameControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void addressValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => addressControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void isLockedValueReset(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => isLockedControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void capacityValueReset(
    List<ParkingLotCapacity> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => capacityControl.reset(
    value: value
        .map((e) => ParkingLotCapacityForm.formElements(e).rawValue)
        .toList(),
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  FormControl<String> get branchNameControl =>
      form.control(branchNameControlPath()) as FormControl<String>;

  FormControl<String> get addressControl =>
      form.control(addressControlPath()) as FormControl<String>;

  FormControl<bool> get isLockedControl =>
      form.control(isLockedControlPath()) as FormControl<bool>;

  FormArray<Map<String, dynamic>> get capacityControl =>
      form.control(capacityControlPath()) as FormArray<Map<String, dynamic>>;

  List<ParkingLotCapacityForm> get capacityParkingLotCapacityForm {
    final values = capacityControl.controls.map((e) => e.value).toList();

    return values
        .asMap()
        .map(
          (k, v) => MapEntry(
            k,
            ParkingLotCapacityForm(
              form,
              pathBuilder("capacity.$k"),
              _formModel ?? this,
            ),
          ),
        )
        .values
        .toList();
  }

  void branchNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      branchNameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      branchNameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void addressSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      addressControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      addressControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void isLockedSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      isLockedControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      isLockedControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void capacitySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      capacityControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      capacityControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, dynamic>?>, List<ParkingLotCapacityForm>>
  get capacityExtendedControl =>
      ExtendedControl<
        List<Map<String, dynamic>?>,
        List<ParkingLotCapacityForm>
      >(
        form.control(capacityControlPath()) as FormArray<Map<String, dynamic>>,
        () => capacityParkingLotCapacityForm,
      );

  void addCapacityItem(ParkingLotCapacity value) {
    capacityControl.add(ParkingLotCapacityForm.formElements(value));
  }

  void removeCapacityItemAtIndex(int i) {
    if ((capacityControl.value ?? []).length > i) {
      capacityControl.removeAt(i);
    }
  }

  void addCapacityItemList(List<ParkingLotCapacity> value) {
    value.forEach((e) => addCapacityItem(e));
  }

  @override
  ParkingLotDetail get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logParkingLotDetailForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return ParkingLotDetail(
      branchName: _branchNameValue,
      address: _addressValue,
      capacity: _capacityValue,
      isLocked: _isLockedValue,
    );
  }

  @override
  ParkingLotDetail get rawModel {
    return ParkingLotDetail(
      branchName: _branchNameRawValue,
      address: _addressRawValue,
      capacity: _capacityRawValue,
      isLocked: _isLockedRawValue,
    );
  }

  @override
  void toggleDisabled({bool updateParent = true, bool emitEvent = true}) {
    if (_disabled.isEmpty) {
      currentForm.controls.forEach((key, control) {
        _disabled[key] = control.disabled;
      });

      capacityParkingLotCapacityForm.forEach((e) => e.toggleDisabled());

      currentForm.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      capacityParkingLotCapacityForm.forEach((e) => e.toggleDisabled());

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
  bool equalsTo(ParkingLotDetail? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      ParkingLotDetailForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(ParkingLotDetail model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logParkingLotDetailForm.info('Errors');
      _logParkingLotDetailForm.info('┗━━ ${form.errors}');
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
    ParkingLotDetail? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    ParkingLotDetailForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    ParkingLotDetail? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = ParkingLotDetailForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({
    ParkingLotDetail? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.reset(
    value: value != null ? formElements(value).rawValue : null,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void updateInitial(Map<String, dynamic>? value, String? path) {
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
          current[key] = <String, dynamic>{};
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

  static FormGroup formElements(ParkingLotDetail? parkingLotDetail) =>
      FormGroup(
        {
          branchNameControlName: FormControl<String>(
            value: parkingLotDetail?.branchName,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          addressControlName: FormControl<String>(
            value: parkingLotDetail?.address,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          capacityControlName: FormArray(
            (parkingLotDetail?.capacity ?? [])
                .map((e) => ParkingLotCapacityForm.formElements(e))
                .toList(),
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
          ),
          isLockedControlName: FormControl<bool>(
            value: parkingLotDetail?.isLocked,
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

final _logParkingLotCapacityForm = Logger.detached('ParkingLotCapacityForm');

class ParkingLotCapacityForm
    implements FormModel<ParkingLotCapacity, ParkingLotCapacity> {
  ParkingLotCapacityForm(this.form, this.path, this._formModel)
    : initial = form.rawValue;

  static const String capacityControlName = "capacity";

  static const String vehicleTypeControlName = "vehicleType";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, dynamic> initial;

  String capacityControlPath() => pathBuilder(capacityControlName);

  String vehicleTypeControlPath() => pathBuilder(vehicleTypeControlName);

  String get _capacityValue => capacityControl.value ?? '';

  VehicleType get _vehicleTypeValue => vehicleTypeControl.value as VehicleType;

  String get _capacityRawValue => capacityControl.value ?? '';

  VehicleType get _vehicleTypeRawValue =>
      vehicleTypeControl.value as VehicleType;

  bool get containsCapacity {
    try {
      form.control(capacityControlPath());
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

  Map<String, dynamic> get capacityErrors => capacityControl.errors;

  Map<String, dynamic> get vehicleTypeErrors => vehicleTypeControl.errors;

  void get capacityFocus => form.focus(capacityControlPath());

  void get vehicleTypeFocus => form.focus(vehicleTypeControlPath());

  void capacityValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    capacityControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void vehicleTypeValueUpdate(
    VehicleType value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    vehicleTypeControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void capacityValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    capacityControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void vehicleTypeValuePatch(
    VehicleType value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    vehicleTypeControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void capacityValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => capacityControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void vehicleTypeValueReset(
    VehicleType value, {
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

  FormControl<String> get capacityControl =>
      form.control(capacityControlPath()) as FormControl<String>;

  FormControl<VehicleType> get vehicleTypeControl =>
      form.control(vehicleTypeControlPath()) as FormControl<VehicleType>;

  void capacitySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      capacityControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      capacityControl.markAsEnabled(
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
  ParkingLotCapacity get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logParkingLotCapacityForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return ParkingLotCapacity(
      capacity: _capacityValue,
      vehicleType: _vehicleTypeValue,
    );
  }

  @override
  ParkingLotCapacity get rawModel {
    return ParkingLotCapacity(
      capacity: _capacityRawValue,
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
  bool equalsTo(ParkingLotCapacity? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      ParkingLotCapacityForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(ParkingLotCapacity model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logParkingLotCapacityForm.info('Errors');
      _logParkingLotCapacityForm.info('┗━━ ${form.errors}');
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
    ParkingLotCapacity? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    ParkingLotCapacityForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    ParkingLotCapacity? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = ParkingLotCapacityForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({
    ParkingLotCapacity? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.reset(
    value: value != null ? formElements(value).rawValue : null,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void updateInitial(Map<String, dynamic>? value, String? path) {
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
          current[key] = <String, dynamic>{};
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

  static FormGroup formElements(ParkingLotCapacity? parkingLotCapacity) =>
      FormGroup(
        {
          capacityControlName: FormControl<String>(
            value: parkingLotCapacity?.capacity,
            validators: [RequiredValidator(), MinValidator(0)],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          vehicleTypeControlName: FormControl<VehicleType>(
            value: parkingLotCapacity?.vehicleType,
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

class ReactiveParkingLotDetailFormArrayBuilder<
  ReactiveParkingLotDetailFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveParkingLotDetailFormArrayBuilder({
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

  final FormArray<ReactiveParkingLotDetailFormArrayBuilderT>? formControl;

  final FormArray<ReactiveParkingLotDetailFormArrayBuilderT>? Function(
    ParkingLotDetailForm formModel,
  )?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    ParkingLotDetailForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveParkingLotDetailFormArrayBuilderT> control,
    ReactiveParkingLotDetailFormArrayBuilderT? item,
    ParkingLotDetailForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveParkingLotDetailFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveParkingLotDetailForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveParkingLotDetailFormArrayBuilderT
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

class ReactiveParkingLotDetailFormArrayBuilder2<
  ReactiveParkingLotDetailFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveParkingLotDetailFormArrayBuilder2({
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

  final FormArray<ReactiveParkingLotDetailFormArrayBuilderT>? formControl;

  final FormArray<ReactiveParkingLotDetailFormArrayBuilderT>? Function(
    ParkingLotDetailForm formModel,
  )?
  control;

  final Widget Function(
    ({
      BuildContext context,
      List<Widget> itemList,
      ParkingLotDetailForm formModel,
    })
    params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveParkingLotDetailFormArrayBuilderT> control,
      ReactiveParkingLotDetailFormArrayBuilderT? item,
      ParkingLotDetailForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveParkingLotDetailFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveParkingLotDetailForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveParkingLotDetailFormArrayBuilderT
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

class ReactiveParkingLotDetailFormFormGroupArrayBuilder<
  ReactiveParkingLotDetailFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveParkingLotDetailFormFormGroupArrayBuilder({
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
    List<Map<String, dynamic>?>,
    List<ReactiveParkingLotDetailFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, dynamic>?>,
    List<ReactiveParkingLotDetailFormFormGroupArrayBuilderT>
  >
  Function(ParkingLotDetailForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    ParkingLotDetailForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveParkingLotDetailFormFormGroupArrayBuilderT? item,
    ParkingLotDetailForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveParkingLotDetailForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, dynamic>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ??
                    <ReactiveParkingLotDetailFormFormGroupArrayBuilderT>[])
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
