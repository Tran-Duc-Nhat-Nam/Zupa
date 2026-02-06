// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_vehicle_detail_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveMemberVehicleDetailFormConsumer extends StatelessWidget {
  const ReactiveMemberVehicleDetailFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
    BuildContext context,
    MemberVehicleDetailForm formModel,
    Widget? child,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMemberVehicleDetailForm.of(context);

    if (formModel is! MemberVehicleDetailForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class MemberVehicleDetailFormInheritedStreamer
    extends InheritedStreamer<dynamic> {
  const MemberVehicleDetailFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final MemberVehicleDetailForm form;
}

class ReactiveMemberVehicleDetailForm extends StatelessWidget {
  const ReactiveMemberVehicleDetailForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResult,
  }) : super(key: key);

  final Widget child;

  final MemberVehicleDetailForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  static MemberVehicleDetailForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
            MemberVehicleDetailFormInheritedStreamer
          >()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<
          MemberVehicleDetailFormInheritedStreamer
        >();
    return element == null
        ? null
        : (element.widget as MemberVehicleDetailFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return MemberVehicleDetailFormInheritedStreamer(
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

extension ReactiveReactiveMemberVehicleDetailFormExt on BuildContext {
  MemberVehicleDetailForm? memberVehicleDetailFormWatch() =>
      ReactiveMemberVehicleDetailForm.of(this);

  MemberVehicleDetailForm? memberVehicleDetailFormRead() =>
      ReactiveMemberVehicleDetailForm.of(this, listen: false);
}

class MemberVehicleDetailFormBuilder extends StatefulWidget {
  const MemberVehicleDetailFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final MemberVehicleDetail? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResult;

  final Widget Function(
    BuildContext context,
    MemberVehicleDetailForm formModel,
    Widget? child,
  )
  builder;

  final void Function(BuildContext context, MemberVehicleDetailForm formModel)?
  initState;

  @override
  _MemberVehicleDetailFormBuilderState createState() =>
      _MemberVehicleDetailFormBuilderState();
}

class _MemberVehicleDetailFormBuilderState
    extends State<MemberVehicleDetailFormBuilder> {
  late MemberVehicleDetailForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = MemberVehicleDetailForm(
      MemberVehicleDetailForm.formElements(widget.model),
      null,
      null,
    );

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logMemberVehicleDetailForm.onRecord.listen((
      LogRecord e,
    ) {
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
  void didUpdateWidget(covariant MemberVehicleDetailFormBuilder oldWidget) {
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
    return ReactiveMemberVehicleDetailForm(
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

final _logMemberVehicleDetailForm = Logger.detached('MemberVehicleDetailForm');

class MemberVehicleDetailForm
    implements FormModel<MemberVehicleDetail, MemberVehicleDetail> {
  MemberVehicleDetailForm(this.form, this.path, this._formModel)
    : initial = form.rawValue;

  static const String nameControlName = "name";

  static const String phoneNumberControlName = "phoneNumber";

  static const String licenseNumberControlName = "licenseNumber";

  static const String branchControlName = "branch";

  static const String vehicleTypeControlName = "vehicleType";

  static const String ticketIDControlName = "ticketID";

  static const String expiredInControlName = "expiredIn";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, Object?> initial;

  String nameControlPath() => pathBuilder(nameControlName);

  String phoneNumberControlPath() => pathBuilder(phoneNumberControlName);

  String licenseNumberControlPath() => pathBuilder(licenseNumberControlName);

  String branchControlPath() => pathBuilder(branchControlName);

  String vehicleTypeControlPath() => pathBuilder(vehicleTypeControlName);

  String ticketIDControlPath() => pathBuilder(ticketIDControlName);

  String expiredInControlPath() => pathBuilder(expiredInControlName);

  String get _nameValue => nameControl.value ?? '';

  String get _phoneNumberValue => phoneNumberControl.value ?? '';

  String get _licenseNumberValue => licenseNumberControl.value ?? '';

  String get _branchValue => branchControl.value ?? '';

  VehicleType? get _vehicleTypeValue =>
      containsVehicleType ? vehicleTypeControl.value : null;

  String get _ticketIDValue => ticketIDControl.value ?? '';

  Duration get _expiredInValue =>
      expiredInControl.value ?? const Duration(days: 30);

  String get _nameRawValue => nameControl.value ?? '';

  String get _phoneNumberRawValue => phoneNumberControl.value ?? '';

  String get _licenseNumberRawValue => licenseNumberControl.value ?? '';

  String get _branchRawValue => branchControl.value ?? '';

  VehicleType? get _vehicleTypeRawValue =>
      containsVehicleType ? vehicleTypeControl.value : null;

  String get _ticketIDRawValue => ticketIDControl.value ?? '';

  Duration get _expiredInRawValue =>
      expiredInControl.value ?? const Duration(days: 30);

  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPhoneNumber {
    try {
      form.control(phoneNumberControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLicenseNumber {
    try {
      form.control(licenseNumberControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsBranch {
    try {
      form.control(branchControlPath());
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

  bool get containsTicketID {
    try {
      form.control(ticketIDControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsExpiredIn {
    try {
      form.control(expiredInControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get nameErrors => nameControl.errors;

  Map<String, dynamic> get phoneNumberErrors => phoneNumberControl.errors;

  Map<String, dynamic> get licenseNumberErrors => licenseNumberControl.errors;

  Map<String, dynamic> get branchErrors => branchControl.errors;

  Map<String, dynamic>? get vehicleTypeErrors => vehicleTypeControl.errors;

  Map<String, dynamic> get ticketIDErrors => ticketIDControl.errors;

  Map<String, dynamic> get expiredInErrors => expiredInControl.errors;

  void get nameFocus => form.focus(nameControlPath());

  void get phoneNumberFocus => form.focus(phoneNumberControlPath());

  void get licenseNumberFocus => form.focus(licenseNumberControlPath());

  void get branchFocus => form.focus(branchControlPath());

  void get vehicleTypeFocus => form.focus(vehicleTypeControlPath());

  void get ticketIDFocus => form.focus(ticketIDControlPath());

  void get expiredInFocus => form.focus(expiredInControlPath());

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

  void nameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void phoneNumberValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    phoneNumberControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void licenseNumberValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    licenseNumberControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void branchValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    branchControl.updateValue(
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

  void expiredInValueUpdate(
    Duration value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    expiredInControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void nameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void phoneNumberValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    phoneNumberControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void licenseNumberValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    licenseNumberControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void branchValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    branchControl.patchValue(
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

  void expiredInValuePatch(
    Duration value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    expiredInControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void nameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => nameControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void phoneNumberValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => phoneNumberControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void licenseNumberValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => licenseNumberControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void branchValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => branchControl.reset(
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

  void expiredInValueReset(
    Duration value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => expiredInControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;

  FormControl<String> get phoneNumberControl =>
      form.control(phoneNumberControlPath()) as FormControl<String>;

  FormControl<String> get licenseNumberControl =>
      form.control(licenseNumberControlPath()) as FormControl<String>;

  FormControl<String> get branchControl =>
      form.control(branchControlPath()) as FormControl<String>;

  FormControl<VehicleType> get vehicleTypeControl =>
      form.control(vehicleTypeControlPath()) as FormControl<VehicleType>;

  FormControl<String> get ticketIDControl =>
      form.control(ticketIDControlPath()) as FormControl<String>;

  FormControl<Duration> get expiredInControl =>
      form.control(expiredInControlPath()) as FormControl<Duration>;

  void nameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      nameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      nameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void phoneNumberSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      phoneNumberControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      phoneNumberControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void licenseNumberSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      licenseNumberControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      licenseNumberControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void branchSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      branchControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      branchControl.markAsEnabled(
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

  void expiredInSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      expiredInControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      expiredInControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  MemberVehicleDetail get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logMemberVehicleDetailForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return MemberVehicleDetail(
      name: _nameValue,
      phoneNumber: _phoneNumberValue,
      licenseNumber: _licenseNumberValue,
      branch: _branchValue,
      vehicleType: _vehicleTypeValue,
      ticketID: _ticketIDValue,
      expiredIn: _expiredInValue,
    );
  }

  @override
  MemberVehicleDetail get rawModel {
    return MemberVehicleDetail(
      name: _nameRawValue,
      phoneNumber: _phoneNumberRawValue,
      licenseNumber: _licenseNumberRawValue,
      branch: _branchRawValue,
      vehicleType: _vehicleTypeRawValue,
      ticketID: _ticketIDRawValue,
      expiredIn: _expiredInRawValue,
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
  bool equalsTo(MemberVehicleDetail? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      MemberVehicleDetailForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(MemberVehicleDetail model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logMemberVehicleDetailForm.info('Errors');
      _logMemberVehicleDetailForm.info('┗━━ ${form.errors}');
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
    MemberVehicleDetail? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    MemberVehicleDetailForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    MemberVehicleDetail? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = MemberVehicleDetailForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({
    MemberVehicleDetail? value,
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

  static FormGroup formElements(MemberVehicleDetail? memberVehicleDetail) =>
      FormGroup(
        {
          nameControlName: FormControl<String>(
            value: memberVehicleDetail?.name,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          phoneNumberControlName: FormControl<String>(
            value: memberVehicleDetail?.phoneNumber,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          licenseNumberControlName: FormControl<String>(
            value: memberVehicleDetail?.licenseNumber,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          branchControlName: FormControl<String>(
            value: memberVehicleDetail?.branch,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          vehicleTypeControlName: FormControl<VehicleType>(
            value: memberVehicleDetail?.vehicleType,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          ticketIDControlName: FormControl<String>(
            value: memberVehicleDetail?.ticketID,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false,
          ),
          expiredInControlName: FormControl<Duration>(
            value: memberVehicleDetail?.expiredIn,
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

class ReactiveMemberVehicleDetailFormArrayBuilder<
  ReactiveMemberVehicleDetailFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveMemberVehicleDetailFormArrayBuilder({
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

  final FormArray<ReactiveMemberVehicleDetailFormArrayBuilderT>? formControl;

  final FormArray<ReactiveMemberVehicleDetailFormArrayBuilderT>? Function(
    MemberVehicleDetailForm formModel,
  )?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    MemberVehicleDetailForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveMemberVehicleDetailFormArrayBuilderT> control,
    ReactiveMemberVehicleDetailFormArrayBuilderT? item,
    MemberVehicleDetailForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveMemberVehicleDetailFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMemberVehicleDetailForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveMemberVehicleDetailFormArrayBuilderT
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

class ReactiveMemberVehicleDetailFormArrayBuilder2<
  ReactiveMemberVehicleDetailFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveMemberVehicleDetailFormArrayBuilder2({
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

  final FormArray<ReactiveMemberVehicleDetailFormArrayBuilderT>? formControl;

  final FormArray<ReactiveMemberVehicleDetailFormArrayBuilderT>? Function(
    MemberVehicleDetailForm formModel,
  )?
  control;

  final Widget Function(
    ({
      BuildContext context,
      List<Widget> itemList,
      MemberVehicleDetailForm formModel,
    })
    params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveMemberVehicleDetailFormArrayBuilderT> control,
      ReactiveMemberVehicleDetailFormArrayBuilderT? item,
      MemberVehicleDetailForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveMemberVehicleDetailFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMemberVehicleDetailForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveMemberVehicleDetailFormArrayBuilderT
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

class ReactiveMemberVehicleDetailFormFormGroupArrayBuilder<
  ReactiveMemberVehicleDetailFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveMemberVehicleDetailFormFormGroupArrayBuilder({
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
    List<ReactiveMemberVehicleDetailFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, Object?>?>,
    List<ReactiveMemberVehicleDetailFormFormGroupArrayBuilderT>
  >
  Function(MemberVehicleDetailForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    MemberVehicleDetailForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveMemberVehicleDetailFormFormGroupArrayBuilderT? item,
    MemberVehicleDetailForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveMemberVehicleDetailForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ??
                    <ReactiveMemberVehicleDetailFormFormGroupArrayBuilderT>[])
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
