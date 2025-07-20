// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_vehicles_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberVehiclesFilterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberVehiclesFilterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MemberVehiclesFilterState()';
}


}

/// @nodoc
class $MemberVehiclesFilterStateCopyWith<$Res>  {
$MemberVehiclesFilterStateCopyWith(MemberVehiclesFilterState _, $Res Function(MemberVehiclesFilterState) __);
}


/// Adds pattern-matching-related methods to [MemberVehiclesFilterState].
extension MemberVehiclesFilterStatePatterns on MemberVehiclesFilterState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( MemberVehiclesFilter filter)?  loaded,TResult Function( MemberVehiclesFilter filter)?  filtering,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.filter);case Filtering() when filtering != null:
return filtering(_that.filter);case Failed() when failed != null:
return failed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( MemberVehiclesFilter filter)  loaded,required TResult Function( MemberVehiclesFilter filter)  filtering,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.filter);case Filtering():
return filtering(_that.filter);case Failed():
return failed(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( MemberVehiclesFilter filter)?  loaded,TResult? Function( MemberVehiclesFilter filter)?  filtering,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.filter);case Filtering() when filtering != null:
return filtering(_that.filter);case Failed() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements MemberVehiclesFilterState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MemberVehiclesFilterState.initial()';
}


}




/// @nodoc


class Loading implements MemberVehiclesFilterState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MemberVehiclesFilterState.loading()';
}


}




/// @nodoc


class Loaded implements MemberVehiclesFilterState {
  const Loaded({this.filter = const MemberVehiclesFilter()});
  

@JsonKey() final  MemberVehiclesFilter filter;

/// Create a copy of MemberVehiclesFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'MemberVehiclesFilterState.loaded(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $MemberVehiclesFilterStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 MemberVehiclesFilter filter
});


$MemberVehiclesFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of MemberVehiclesFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(Loaded(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MemberVehiclesFilter,
  ));
}

/// Create a copy of MemberVehiclesFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberVehiclesFilterCopyWith<$Res> get filter {
  
  return $MemberVehiclesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class Filtering implements MemberVehiclesFilterState {
  const Filtering({this.filter = const MemberVehiclesFilter()});
  

@JsonKey() final  MemberVehiclesFilter filter;

/// Create a copy of MemberVehiclesFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'MemberVehiclesFilterState.filtering(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $FilteringCopyWith<$Res> implements $MemberVehiclesFilterStateCopyWith<$Res> {
  factory $FilteringCopyWith(Filtering value, $Res Function(Filtering) _then) = _$FilteringCopyWithImpl;
@useResult
$Res call({
 MemberVehiclesFilter filter
});


$MemberVehiclesFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$FilteringCopyWithImpl<$Res>
    implements $FilteringCopyWith<$Res> {
  _$FilteringCopyWithImpl(this._self, this._then);

  final Filtering _self;
  final $Res Function(Filtering) _then;

/// Create a copy of MemberVehiclesFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(Filtering(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MemberVehiclesFilter,
  ));
}

/// Create a copy of MemberVehiclesFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberVehiclesFilterCopyWith<$Res> get filter {
  
  return $MemberVehiclesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class Failed implements MemberVehiclesFilterState {
  const Failed(this.message);
  

 final  String message;

/// Create a copy of MemberVehiclesFilterState
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
  return 'MemberVehiclesFilterState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<$Res> implements $MemberVehiclesFilterStateCopyWith<$Res> {
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

/// Create a copy of MemberVehiclesFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
