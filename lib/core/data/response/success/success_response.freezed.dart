// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'success_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuccessResponse<T> {

 int get code; T get data; String get message;
/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessResponseCopyWith<T, SuccessResponse<T>> get copyWith => _$SuccessResponseCopyWithImpl<T, SuccessResponse<T>>(this as SuccessResponse<T>, _$identity);

  /// Serializes this SuccessResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessResponse<T>&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'SuccessResponse<$T>(code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $SuccessResponseCopyWith<T,$Res>  {
  factory $SuccessResponseCopyWith(SuccessResponse<T> value, $Res Function(SuccessResponse<T>) _then) = _$SuccessResponseCopyWithImpl;
@useResult
$Res call({
 int code, T data, String message
});




}
/// @nodoc
class _$SuccessResponseCopyWithImpl<T,$Res>
    implements $SuccessResponseCopyWith<T, $Res> {
  _$SuccessResponseCopyWithImpl(this._self, this._then);

  final SuccessResponse<T> _self;
  final $Res Function(SuccessResponse<T>) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SuccessResponse].
extension SuccessResponsePatterns<T> on SuccessResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuccessResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuccessResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _SuccessResponse():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuccessResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  T data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
return $default(_that.code,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  T data,  String message)  $default,) {final _that = this;
switch (_that) {
case _SuccessResponse():
return $default(_that.code,_that.data,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  T data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
return $default(_that.code,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _SuccessResponse<T> implements SuccessResponse<T> {
  const _SuccessResponse({this.code = 200, required this.data, this.message = 'Success'});
  factory _SuccessResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$SuccessResponseFromJson(json,fromJsonT);

@override@JsonKey() final  int code;
@override final  T data;
@override@JsonKey() final  String message;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessResponseCopyWith<T, _SuccessResponse<T>> get copyWith => __$SuccessResponseCopyWithImpl<T, _SuccessResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$SuccessResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessResponse<T>&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'SuccessResponse<$T>(code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessResponseCopyWith<T,$Res> implements $SuccessResponseCopyWith<T, $Res> {
  factory _$SuccessResponseCopyWith(_SuccessResponse<T> value, $Res Function(_SuccessResponse<T>) _then) = __$SuccessResponseCopyWithImpl;
@override @useResult
$Res call({
 int code, T data, String message
});




}
/// @nodoc
class __$SuccessResponseCopyWithImpl<T,$Res>
    implements _$SuccessResponseCopyWith<T, $Res> {
  __$SuccessResponseCopyWithImpl(this._self, this._then);

  final _SuccessResponse<T> _self;
  final $Res Function(_SuccessResponse<T>) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? data = freezed,Object? message = null,}) {
  return _then(_SuccessResponse<T>(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
