// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveSiteFormConsumer extends StatelessWidget {
  const ReactiveSiteFormConsumer({Key? key, required this.builder, this.child})
    : super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context, SiteForm formModel, Widget? child)
  builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSiteForm.of(context);

    if (formModel is! SiteForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class SiteFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const SiteFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  final SiteForm form;
}

class ReactiveSiteForm extends StatelessWidget {
  const ReactiveSiteForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvokedWithResultWithResult,
  }) : super(key: key);

  final Widget child;

  final SiteForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResultWithResult;

  static SiteForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<SiteFormInheritedStreamer>()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<SiteFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as SiteFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return SiteFormInheritedStreamer(
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

extension ReactiveReactiveSiteFormExt on BuildContext {
  SiteForm? siteFormWatch() => ReactiveSiteForm.of(this);

  SiteForm? siteFormRead() => ReactiveSiteForm.of(this, listen: false);
}

class SiteFormBuilder extends StatefulWidget {
  const SiteFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvokedWithResultWithResult,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final Site? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop, dynamic? result)?
  onPopInvokedWithResultWithResult;

  final Widget Function(BuildContext context, SiteForm formModel, Widget? child)
  builder;

  final void Function(BuildContext context, SiteForm formModel)? initState;

  @override
  _SiteFormBuilderState createState() => _SiteFormBuilderState();
}

class _SiteFormBuilderState extends State<SiteFormBuilder> {
  late SiteForm _formModel;

  StreamSubscription<LogRecord>? _logSubscription;

  @override
  void initState() {
    _formModel = SiteForm(SiteForm.formElements(widget.model), null, null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    _logSubscription = _logSiteForm.onRecord.listen((LogRecord e) {
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
  void didUpdateWidget(covariant SiteFormBuilder oldWidget) {
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
    return ReactiveSiteForm(
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

final _logSiteForm = Logger.detached('SiteForm');

class SiteForm implements FormModel<Site, Site> {
  SiteForm(this.form, this.path, this._formModel) : initial = form.rawValue;

  static const String codeControlName = "code";

  final FormGroup form;

  final String? path;

  // ignore: unused_field
  final FormModel<dynamic, dynamic>? _formModel;

  final Map<String, bool> _disabled = {};

  @override
  final Map<String, dynamic> initial;

  String codeControlPath() => pathBuilder(codeControlName);

  String get _codeValue => codeControl.value as String;

  String get _codeRawValue => codeControl.value as String;

  bool get containsCode {
    try {
      form.control(codeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> get codeErrors => codeControl.errors;

  void get codeFocus => form.focus(codeControlPath());

  void codeValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    codeControl.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void codeValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    codeControl.patchValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void codeValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => codeControl.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  FormControl<String> get codeControl =>
      form.control(codeControlPath()) as FormControl<String>;

  void codeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      codeControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      codeControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  Site get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      _logSiteForm.warning(
        'Avoid calling `model` on invalid form.Possible exceptions for non-nullable fields which should be guarded by `required` validator.',
        null,
        StackTrace.current,
      );
    }
    return Site(code: _codeValue);
  }

  @override
  Site get rawModel {
    return Site(code: _codeRawValue);
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
  bool equalsTo(Site? other) {
    final currentForm = this.currentForm;

    return const DeepCollectionEquality().equals(
      currentForm.rawValue,
      SiteForm.formElements(other).rawValue,
    );
  }

  @override
  void submit({
    required void Function(Site model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      _logSiteForm.info('Errors');
      _logSiteForm.info('┗━━ ${form.errors}');
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
    Site? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) => currentForm.updateValue(
    SiteForm.formElements(value).rawValue,
    updateParent: updateParent,
    emitEvent: emitEvent,
  );

  @override
  void upsertValue(
    Site? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final formElements = SiteForm.formElements(value);

    currentForm.addAll(formElements.controls);
  }

  @override
  void reset({Site? value, bool updateParent = true, bool emitEvent = true}) =>
      currentForm.reset(
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

  static FormGroup formElements(Site? site) => FormGroup(
    {
      codeControlName: FormControl<String>(
        value: site?.code,
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

class ReactiveSiteFormArrayBuilder<ReactiveSiteFormArrayBuilderT>
    extends StatelessWidget {
  const ReactiveSiteFormArrayBuilder({
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

  final FormArray<ReactiveSiteFormArrayBuilderT>? formControl;

  final FormArray<ReactiveSiteFormArrayBuilderT>? Function(SiteForm formModel)?
  control;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    SiteForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    FormControl<ReactiveSiteFormArrayBuilderT> control,
    ReactiveSiteFormArrayBuilderT? item,
    SiteForm formModel,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(FormControl<ReactiveSiteFormArrayBuilderT> control)?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSiteForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveSiteFormArrayBuilderT>(
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

class ReactiveSiteFormArrayBuilder2<ReactiveSiteFormArrayBuilderT>
    extends StatelessWidget {
  const ReactiveSiteFormArrayBuilder2({
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

  final FormArray<ReactiveSiteFormArrayBuilderT>? formControl;

  final FormArray<ReactiveSiteFormArrayBuilderT>? Function(SiteForm formModel)?
  control;

  final Widget Function(
    ({BuildContext context, List<Widget> itemList, SiteForm formModel}) params,
  )?
  builder;

  final Widget Function(
    ({
      BuildContext context,
      int i,
      FormControl<ReactiveSiteFormArrayBuilderT> control,
      ReactiveSiteFormArrayBuilderT? item,
      SiteForm formModel,
    })
    params,
  )
  itemBuilder;

  final Widget Function(BuildContext context)? emptyBuilder;

  final bool Function(FormControl<ReactiveSiteFormArrayBuilderT> control)?
  controlFilter;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSiteForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final builder = this.builder;
    final itemBuilder = this.itemBuilder;

    return ReactiveFormArrayItemBuilder<ReactiveSiteFormArrayBuilderT>(
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

class ReactiveSiteFormFormGroupArrayBuilder<
  ReactiveSiteFormFormGroupArrayBuilderT
>
    extends StatelessWidget {
  const ReactiveSiteFormFormGroupArrayBuilder({
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
    List<ReactiveSiteFormFormGroupArrayBuilderT>
  >?
  extended;

  final ExtendedControl<
    List<Map<String, dynamic>?>,
    List<ReactiveSiteFormFormGroupArrayBuilderT>
  >
  Function(SiteForm formModel)?
  getExtended;

  final Widget Function(
    BuildContext context,
    List<Widget> itemList,
    SiteForm formModel,
  )?
  builder;

  final Widget Function(
    BuildContext context,
    int i,
    ReactiveSiteFormFormGroupArrayBuilderT? item,
    SiteForm formModel,
  )
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSiteForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, dynamic>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ?? <ReactiveSiteFormFormGroupArrayBuilderT>[])
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
