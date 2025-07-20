// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeSettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeSettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeSettingsState()';
}


}

/// @nodoc
class $EmployeeSettingsStateCopyWith<$Res>  {
$EmployeeSettingsStateCopyWith(EmployeeSettingsState _, $Res Function(EmployeeSettingsState) __);
}


/// Adds pattern-matching-related methods to [EmployeeSettingsState].
extension EmployeeSettingsStatePatterns on EmployeeSettingsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Refreshing value)?  refreshing,TResult Function( LoadingMore value)?  loadingMore,TResult Function( Loaded value)?  loaded,TResult Function( Failed value)?  failed,TResult Function( Emtpy value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Refreshing() when refreshing != null:
return refreshing(_that);case LoadingMore() when loadingMore != null:
return loadingMore(_that);case Loaded() when loaded != null:
return loaded(_that);case Failed() when failed != null:
return failed(_that);case Emtpy() when empty != null:
return empty(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Refreshing value)  refreshing,required TResult Function( LoadingMore value)  loadingMore,required TResult Function( Loaded value)  loaded,required TResult Function( Failed value)  failed,required TResult Function( Emtpy value)  empty,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Refreshing():
return refreshing(_that);case LoadingMore():
return loadingMore(_that);case Loaded():
return loaded(_that);case Failed():
return failed(_that);case Emtpy():
return empty(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Refreshing value)?  refreshing,TResult? Function( LoadingMore value)?  loadingMore,TResult? Function( Loaded value)?  loaded,TResult? Function( Failed value)?  failed,TResult? Function( Emtpy value)?  empty,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Refreshing() when refreshing != null:
return refreshing(_that);case LoadingMore() when loadingMore != null:
return loadingMore(_that);case Loaded() when loaded != null:
return loaded(_that);case Failed() when failed != null:
return failed(_that);case Emtpy() when empty != null:
return empty(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Employee> employees)?  refreshing,TResult Function( List<Employee> employees)?  loadingMore,TResult Function( List<Employee> employees,  int pageIndex)?  loaded,TResult Function( String message)?  failed,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Refreshing() when refreshing != null:
return refreshing(_that.employees);case LoadingMore() when loadingMore != null:
return loadingMore(_that.employees);case Loaded() when loaded != null:
return loaded(_that.employees,_that.pageIndex);case Failed() when failed != null:
return failed(_that.message);case Emtpy() when empty != null:
return empty();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Employee> employees)  refreshing,required TResult Function( List<Employee> employees)  loadingMore,required TResult Function( List<Employee> employees,  int pageIndex)  loaded,required TResult Function( String message)  failed,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Refreshing():
return refreshing(_that.employees);case LoadingMore():
return loadingMore(_that.employees);case Loaded():
return loaded(_that.employees,_that.pageIndex);case Failed():
return failed(_that.message);case Emtpy():
return empty();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Employee> employees)?  refreshing,TResult? Function( List<Employee> employees)?  loadingMore,TResult? Function( List<Employee> employees,  int pageIndex)?  loaded,TResult? Function( String message)?  failed,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Refreshing() when refreshing != null:
return refreshing(_that.employees);case LoadingMore() when loadingMore != null:
return loadingMore(_that.employees);case Loaded() when loaded != null:
return loaded(_that.employees,_that.pageIndex);case Failed() when failed != null:
return failed(_that.message);case Emtpy() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements EmployeeSettingsState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeSettingsState.initial()';
}


}




/// @nodoc


class Loading implements EmployeeSettingsState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeSettingsState.loading()';
}


}




/// @nodoc


class Refreshing implements EmployeeSettingsState {
  const Refreshing(final  List<Employee> employees): _employees = employees;
  

 final  List<Employee> _employees;
 List<Employee> get employees {
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employees);
}


/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshingCopyWith<Refreshing> get copyWith => _$RefreshingCopyWithImpl<Refreshing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Refreshing&&const DeepCollectionEquality().equals(other._employees, _employees));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_employees));

@override
String toString() {
  return 'EmployeeSettingsState.refreshing(employees: $employees)';
}


}

/// @nodoc
abstract mixin class $RefreshingCopyWith<$Res> implements $EmployeeSettingsStateCopyWith<$Res> {
  factory $RefreshingCopyWith(Refreshing value, $Res Function(Refreshing) _then) = _$RefreshingCopyWithImpl;
@useResult
$Res call({
 List<Employee> employees
});




}
/// @nodoc
class _$RefreshingCopyWithImpl<$Res>
    implements $RefreshingCopyWith<$Res> {
  _$RefreshingCopyWithImpl(this._self, this._then);

  final Refreshing _self;
  final $Res Function(Refreshing) _then;

/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employees = null,}) {
  return _then(Refreshing(
null == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<Employee>,
  ));
}


}

/// @nodoc


class LoadingMore implements EmployeeSettingsState {
  const LoadingMore(final  List<Employee> employees): _employees = employees;
  

 final  List<Employee> _employees;
 List<Employee> get employees {
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employees);
}


/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingMoreCopyWith<LoadingMore> get copyWith => _$LoadingMoreCopyWithImpl<LoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMore&&const DeepCollectionEquality().equals(other._employees, _employees));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_employees));

@override
String toString() {
  return 'EmployeeSettingsState.loadingMore(employees: $employees)';
}


}

/// @nodoc
abstract mixin class $LoadingMoreCopyWith<$Res> implements $EmployeeSettingsStateCopyWith<$Res> {
  factory $LoadingMoreCopyWith(LoadingMore value, $Res Function(LoadingMore) _then) = _$LoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<Employee> employees
});




}
/// @nodoc
class _$LoadingMoreCopyWithImpl<$Res>
    implements $LoadingMoreCopyWith<$Res> {
  _$LoadingMoreCopyWithImpl(this._self, this._then);

  final LoadingMore _self;
  final $Res Function(LoadingMore) _then;

/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employees = null,}) {
  return _then(LoadingMore(
null == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<Employee>,
  ));
}


}

/// @nodoc


class Loaded implements EmployeeSettingsState {
  const Loaded(final  List<Employee> employees, this.pageIndex): _employees = employees;
  

 final  List<Employee> _employees;
 List<Employee> get employees {
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employees);
}

 final  int pageIndex;

/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._employees, _employees)&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_employees),pageIndex);

@override
String toString() {
  return 'EmployeeSettingsState.loaded(employees: $employees, pageIndex: $pageIndex)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $EmployeeSettingsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Employee> employees, int pageIndex
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employees = null,Object? pageIndex = null,}) {
  return _then(Loaded(
null == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<Employee>,null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Failed implements EmployeeSettingsState {
  const Failed(this.message);
  

 final  String message;

/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<Failed> get copyWith => _$FailedCopyWithImpl<Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EmployeeSettingsState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<$Res> implements $EmployeeSettingsStateCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) _then) = _$FailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailedCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed _self;
  final $Res Function(Failed) _then;

/// Create a copy of EmployeeSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Emtpy implements EmployeeSettingsState {
  const Emtpy();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Emtpy);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeSettingsState.empty()';
}


}




// dart format on
