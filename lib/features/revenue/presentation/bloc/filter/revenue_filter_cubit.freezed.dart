// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RevenueFilterState {

 RevenueFilter get filter;
/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueFilterStateCopyWith<RevenueFilterState> get copyWith => _$RevenueFilterStateCopyWithImpl<RevenueFilterState>(this as RevenueFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueFilterState&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'RevenueFilterState(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $RevenueFilterStateCopyWith<$Res>  {
  factory $RevenueFilterStateCopyWith(RevenueFilterState value, $Res Function(RevenueFilterState) _then) = _$RevenueFilterStateCopyWithImpl;
@useResult
$Res call({
 RevenueFilter filter
});


$RevenueFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$RevenueFilterStateCopyWithImpl<$Res>
    implements $RevenueFilterStateCopyWith<$Res> {
  _$RevenueFilterStateCopyWithImpl(this._self, this._then);

  final RevenueFilterState _self;
  final $Res Function(RevenueFilterState) _then;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RevenueFilter,
  ));
}
/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueFilterCopyWith<$Res> get filter {
  
  return $RevenueFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [RevenueFilterState].
extension RevenueFilterStatePatterns on RevenueFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Filtering value)?  filtering,TResult Function( Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Filtering() when filtering != null:
return filtering(_that);case Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Filtering value)  filtering,required TResult Function( Failed value)  failed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Filtering():
return filtering(_that);case Failed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Filtering value)?  filtering,TResult? Function( Failed value)?  failed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Filtering() when filtering != null:
return filtering(_that);case Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RevenueFilter filter)?  initial,TResult Function( RevenueFilter filter)?  loading,TResult Function( RevenueFilter filter)?  loaded,TResult Function( RevenueFilter filter)?  filtering,TResult Function( RevenueFilter filter,  String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.filter);case Loading() when loading != null:
return loading(_that.filter);case Loaded() when loaded != null:
return loaded(_that.filter);case Filtering() when filtering != null:
return filtering(_that.filter);case Failed() when failed != null:
return failed(_that.filter,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RevenueFilter filter)  initial,required TResult Function( RevenueFilter filter)  loading,required TResult Function( RevenueFilter filter)  loaded,required TResult Function( RevenueFilter filter)  filtering,required TResult Function( RevenueFilter filter,  String message)  failed,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.filter);case Loading():
return loading(_that.filter);case Loaded():
return loaded(_that.filter);case Filtering():
return filtering(_that.filter);case Failed():
return failed(_that.filter,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RevenueFilter filter)?  initial,TResult? Function( RevenueFilter filter)?  loading,TResult? Function( RevenueFilter filter)?  loaded,TResult? Function( RevenueFilter filter)?  filtering,TResult? Function( RevenueFilter filter,  String message)?  failed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.filter);case Loading() when loading != null:
return loading(_that.filter);case Loaded() when loaded != null:
return loaded(_that.filter);case Filtering() when filtering != null:
return filtering(_that.filter);case Failed() when failed != null:
return failed(_that.filter,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements RevenueFilterState {
  const Initial({this.filter = const RevenueFilter()});
  

@override@JsonKey() final  RevenueFilter filter;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'RevenueFilterState.initial(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $RevenueFilterStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 RevenueFilter filter
});


@override $RevenueFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(Initial(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RevenueFilter,
  ));
}

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueFilterCopyWith<$Res> get filter {
  
  return $RevenueFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class Loading implements RevenueFilterState {
  const Loading({this.filter = const RevenueFilter()});
  

@override@JsonKey() final  RevenueFilter filter;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'RevenueFilterState.loading(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $RevenueFilterStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 RevenueFilter filter
});


@override $RevenueFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(Loading(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RevenueFilter,
  ));
}

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueFilterCopyWith<$Res> get filter {
  
  return $RevenueFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class Loaded implements RevenueFilterState {
  const Loaded({this.filter = const RevenueFilter()});
  

@override@JsonKey() final  RevenueFilter filter;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'RevenueFilterState.loaded(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $RevenueFilterStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 RevenueFilter filter
});


@override $RevenueFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(Loaded(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RevenueFilter,
  ));
}

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueFilterCopyWith<$Res> get filter {
  
  return $RevenueFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class Filtering implements RevenueFilterState {
  const Filtering({this.filter = const RevenueFilter()});
  

@override@JsonKey() final  RevenueFilter filter;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilteringCopyWith<Filtering> get copyWith => _$FilteringCopyWithImpl<Filtering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Filtering&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'RevenueFilterState.filtering(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $FilteringCopyWith<$Res> implements $RevenueFilterStateCopyWith<$Res> {
  factory $FilteringCopyWith(Filtering value, $Res Function(Filtering) _then) = _$FilteringCopyWithImpl;
@override @useResult
$Res call({
 RevenueFilter filter
});


@override $RevenueFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$FilteringCopyWithImpl<$Res>
    implements $FilteringCopyWith<$Res> {
  _$FilteringCopyWithImpl(this._self, this._then);

  final Filtering _self;
  final $Res Function(Filtering) _then;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(Filtering(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RevenueFilter,
  ));
}

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueFilterCopyWith<$Res> get filter {
  
  return $RevenueFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class Failed implements RevenueFilterState {
  const Failed({this.filter = const RevenueFilter(), required this.message});
  

@override@JsonKey() final  RevenueFilter filter;
 final  String message;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<Failed> get copyWith => _$FailedCopyWithImpl<Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,filter,message);

@override
String toString() {
  return 'RevenueFilterState.failed(filter: $filter, message: $message)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<$Res> implements $RevenueFilterStateCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) _then) = _$FailedCopyWithImpl;
@override @useResult
$Res call({
 RevenueFilter filter, String message
});


@override $RevenueFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$FailedCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed _self;
  final $Res Function(Failed) _then;

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? message = null,}) {
  return _then(Failed(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RevenueFilter,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RevenueFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueFilterCopyWith<$Res> get filter {
  
  return $RevenueFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
