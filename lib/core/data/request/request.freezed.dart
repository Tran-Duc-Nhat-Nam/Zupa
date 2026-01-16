// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Request {

 int get page; int get size; Map<String, dynamic>? get query;
/// Create a copy of Request
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCopyWith<Request> get copyWith => _$RequestCopyWithImpl<Request>(this as Request, _$identity);

  /// Serializes this Request to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Request&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.query, query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,const DeepCollectionEquality().hash(query));

@override
String toString() {
  return 'Request(page: $page, size: $size, query: $query)';
}


}

/// @nodoc
abstract mixin class $RequestCopyWith<$Res>  {
  factory $RequestCopyWith(Request value, $Res Function(Request) _then) = _$RequestCopyWithImpl;
@useResult
$Res call({
 int page, int size, Map<String, dynamic>? query
});




}
/// @nodoc
class _$RequestCopyWithImpl<$Res>
    implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._self, this._then);

  final Request _self;
  final $Res Function(Request) _then;

/// Create a copy of Request
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? size = null,Object? query = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Request].
extension RequestPatterns on Request {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Request value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Request() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Request value)  $default,){
final _that = this;
switch (_that) {
case _Request():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Request value)?  $default,){
final _that = this;
switch (_that) {
case _Request() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int size,  Map<String, dynamic>? query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Request() when $default != null:
return $default(_that.page,_that.size,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int size,  Map<String, dynamic>? query)  $default,) {final _that = this;
switch (_that) {
case _Request():
return $default(_that.page,_that.size,_that.query);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int size,  Map<String, dynamic>? query)?  $default,) {final _that = this;
switch (_that) {
case _Request() when $default != null:
return $default(_that.page,_that.size,_that.query);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Request implements Request {
  const _Request({this.page = 1, this.size = 10, final  Map<String, dynamic>? query}): _query = query;
  factory _Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
 final  Map<String, dynamic>? _query;
@override Map<String, dynamic>? get query {
  final value = _query;
  if (value == null) return null;
  if (_query is EqualUnmodifiableMapView) return _query;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Request
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCopyWith<_Request> get copyWith => __$RequestCopyWithImpl<_Request>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Request&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._query, _query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,const DeepCollectionEquality().hash(_query));

@override
String toString() {
  return 'Request(page: $page, size: $size, query: $query)';
}


}

/// @nodoc
abstract mixin class _$RequestCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$RequestCopyWith(_Request value, $Res Function(_Request) _then) = __$RequestCopyWithImpl;
@override @useResult
$Res call({
 int page, int size, Map<String, dynamic>? query
});




}
/// @nodoc
class __$RequestCopyWithImpl<$Res>
    implements _$RequestCopyWith<$Res> {
  __$RequestCopyWithImpl(this._self, this._then);

  final _Request _self;
  final $Res Function(_Request) _then;

/// Create a copy of Request
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? size = null,Object? query = freezed,}) {
  return _then(_Request(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,query: freezed == query ? _self._query : query // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
