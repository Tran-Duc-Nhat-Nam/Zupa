// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveChangePasswordFormConsumer extends StatelessWidget {
  const ReactiveChangePasswordFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
    BuildContext context,
    ChangePasswordForm formModel,
    Widget? child,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangePasswordForm.of(context);

    if (formModel is! ChangePasswordForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class ChangePasswordFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const ChangePasswordFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final ChangePasswordForm form;
}

class ReactiveChangePasswordForm extends StatelessWidget {
  const ReactiveChangePasswordForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResultWithResult,
  }) : super(key: key);

  final Widget child;

  final ChangePasswordForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResultWithResult;

  static ChangePasswordForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
            ChangePasswordFormInheritedStreamer
          >()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<
          ChangePasswordFormInheritedStreamer
        >();
    return element == null
        ? null
        : (element.widget as ChangePasswordFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return ChangePasswordFormInheritedStreamer(
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

extension ReactiveReactiveChangePasswordFormExt on BuildContext {
  ChangePasswordForm? changePasswordFormWatch() =>
      ReactiveChangePasswordForm.of(this);

  ChangePasswordForm? changePasswordFormRead() =>
      ReactiveChangePasswordForm.of(this, listen: false);
}

class ChangePasswordFormBuilder extends StatefulWidget {
  const ChangePasswordFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResultWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final ChangePassword? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResultWithResult;

  final Widget Function(
    BuildContext context,
    ChangePasswordForm formModel,
    Widget? child,
  )
  builder;

  final void Function(BuildContext context, ChangePasswordForm formModel)?
  initState;

  @override
  _ChangePasswordFormBuilderState createState() =>
      _ChangePasswordFormBuilderState();
}

class _ChangePasswordFormBuilderState extends State<ChangePasswordFormBuilder> {
  late ChangePasswordForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = ChangePasswordForm(
      ChangePasswordForm.formElements(widget.model),
      null,
      null,
    );

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logChangePasswordForm.onRecord.listen((LogRecord e) {
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
  void didUpdateWidget(covariant ChangePasswordFormBuilder oldWidget) {
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
    return ReactiveChangePasswordForm(
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

final _logChangePasswordForm = Logger.detached('ChangePasswordForm');

class ChangePasswordForm implements FormModel<ChangePassword, ChangePassword> {
  ChangePasswordForm(this.form, this.path, this._formModel)
    : initial = form.rawValue;

  static const String currentPasswordControlName = "currentPassword";

  static const String newPasswordControlName = "newPassword";

  static const String confirmPasswordControlName = "confirmPassword";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, dynamic> initial;

  String currentPasswordControlPath() =>
      pathBuilder(currentPasswordControlName);

  String newPasswordControlPath() => pathBuilder(newPasswordControlName);

  String confirmPasswordControlPath() =>
      pathBuilder(confirmPasswordControlName);

  String get _currentPasswordValue => currentPasswordControl.value ?? '';

  String get _newPasswordValue => newPasswordControl.value ?? '';

  String get _confirmPasswordValue => confirmPasswordControl.value ?? '';

  String get _currentPasswordRawValue => currentPasswordControl.value ?? '';

  String get _newPasswordRawValue => newPasswordControl.value ?? '';

  String get _confirmPasswordRawValue => confirmPasswordControl.value ?? '';

  bool get containsCurrentPassword {
    try {
      form.control(currentPasswordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsNewPassword {
    try {
      form.control(newPasswordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsConfirmPassword {
    try {
      form.control(confirmPasswordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get currentPasswordErrors =>
      currentPasswordControl.errors;

  Map<String, dynamic> get newPasswordErrors => newPasswordControl.errors;

  Map<String, dynamic> get confirmPasswordErrors =>
      confirmPasswordControl.errors;

  void get currentPasswordFocus => form.focus(currentPasswordControlPath());

  void get newPasswordFocus => form.focus(newPasswordControlPath());

  void get confirmPasswordFocus => form.focus(confirmPasswordControlPath());

  void currentPasswordValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    currentPasswordControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void newPasswordValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    newPasswordControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void confirmPasswordValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    confirmPasswordControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void currentPasswordValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    currentPasswordControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void newPasswordValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    newPasswordControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void confirmPasswordValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    confirmPasswordControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void currentPasswordValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => currentPasswordControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void newPasswordValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => newPasswordControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  void confirmPasswordValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => confirmPasswordControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  FormControl<String> get currentPasswordControl =>
      form.control(currentPasswordControlPath()) as FormControl<String>;

  FormControl<String> get newPasswordControl =>
      form.control(newPasswordControlPath()) as FormControl<String>;

  FormControl<String> get confirmPasswordControl =>
      form.control(confirmPasswordControlPath()) as FormControl<String>;

  void currentPasswordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      currentPasswordControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      currentPasswordControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void newPasswordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      newPasswordControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      newPasswordControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void confirmPasswordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      confirmPasswordControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      confirmPasswordControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  ChangePassword get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logChangePasswordForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return ChangePassword(
      currentPassword: _currentPasswordValue,
      newPassword: _newPasswordValue,
      confirmPassword: _confirmPasswordValue,
    );
  }

  @override
  ChangePassword get rawModel {
    return ChangePassword(
      currentPassword: _currentPasswordRawValue,
      newPassword: _newPasswordRawValue,
      confirmPassword: _confirmPasswordRawValue,
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
  bool equalsTo(ChangePassword? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      ChangePasswordForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(ChangePassword model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logChangePasswordForm.info('Errors');
      _logChangePasswordForm.info('┗━━ ${form.errors}');
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
    ChangePassword? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    ChangePasswordForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    ChangePassword? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = ChangePasswordForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({
    ChangePassword? value,
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

  static FormGroup formElements(ChangePassword? changePassword) => FormGroup(
    {
      currentPasswordControlName: FormControl<String>(
        value: changePassword?.currentPassword,
        validators: [RequiredValidator()],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
        touched: false,
      ),
      newPasswordControlName: FormControl<String>(
        value: changePassword?.newPassword,
        validators: [RequiredValidator()],
        asyncValidators: [],
        asyncValidatorsDebounceTime: 250,
        disabled: false,
        touched: false,
      ),
      confirmPasswordControlName: FormControl<String>(
        value: changePassword?.confirmPassword,
        validators: [
          RequiredValidator(),
          MustMatchValidator('newPassword', 'confirmPassword', true),
        ],
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

class ReactiveChangePasswordFormArrayBuilder<
  ReactiveChangePasswordFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveChangePasswordFormArrayBuilder({
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

  final FormArray<ReactiveChangePasswordFormArrayBuilderT>? formControl;

  final FormArray<ReactiveChangePasswordFormArrayBuilderT>? Function(
    ChangePasswordForm formModel,
  )?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    ChangePasswordForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveChangePasswordFormArrayBuilderT> control,
    ReactiveChangePasswordFormArrayBuilderT? item,
    ChangePasswordForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveChangePasswordFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangePasswordForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveChangePasswordFormArrayBuilderT
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

class ReactiveChangePasswordFormArrayBuilder2<
  ReactiveChangePasswordFormArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveChangePasswordFormArrayBuilder2({
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

  final FormArray<ReactiveChangePasswordFormArrayBuilderT>? formControl;

  final FormArray<ReactiveChangePasswordFormArrayBuilderT>? Function(
    ChangePasswordForm formModel,
  )?
  control;

  final Widget Function(
    ({
      BuildContext context,
      List<Widget> itemList,
      ChangePasswordForm formModel,
    })
    params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveChangePasswordFormArrayBuilderT> control,
      ReactiveChangePasswordFormArrayBuilderT? item,
      ChangePasswordForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(
    FormControl<ReactiveChangePasswordFormArrayBuilderT> control,
  )?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangePasswordForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<
      ReactiveChangePasswordFormArrayBuilderT
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

class ReactiveChangePasswordFormFormGroupArrayBuilder<
  ReactiveChangePasswordFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveChangePasswordFormFormGroupArrayBuilder({
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
    List<ReactiveChangePasswordFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, dynamic>?>,
    List<ReactiveChangePasswordFormFormGroupArrayBuilderT>
  >
  Function(ChangePasswordForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    ChangePasswordForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveChangePasswordFormFormGroupArrayBuilderT? item,
    ChangePasswordForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveChangePasswordForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, dynamic>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ??
                    <ReactiveChangePasswordFormFormGroupArrayBuilderT>[])
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
