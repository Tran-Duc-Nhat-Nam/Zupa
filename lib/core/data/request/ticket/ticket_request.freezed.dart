// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketRequest {

 String? get keyword; DateTime? get time; int? get typeId; int get page; int get size;
/// Create a copy of TicketRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketRequestCopyWith<TicketRequest> get copyWith => _$TicketRequestCopyWithImpl<TicketRequest>(this as TicketRequest, _$identity);

  /// Serializes this TicketRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketRequest&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.time, time) || other.time == time)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyword,time,typeId,page,size);

@override
String toString() {
  return 'TicketRequest(keyword: $keyword, time: $time, typeId: $typeId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $TicketRequestCopyWith<$Res>  {
  factory $TicketRequestCopyWith(TicketRequest value, $Res Function(TicketRequest) _then) = _$TicketRequestCopyWithImpl;
@useResult
$Res call({
 String? keyword, DateTime? time, int? typeId, int page, int size
});




}
/// @nodoc
class _$TicketRequestCopyWithImpl<$Res>
    implements $TicketRequestCopyWith<$Res> {
  _$TicketRequestCopyWithImpl(this._self, this._then);

  final TicketRequest _self;
  final $Res Function(TicketRequest) _then;

/// Create a copy of TicketRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = freezed,Object? time = freezed,Object? typeId = freezed,Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketRequest].
extension TicketRequestPatterns on TicketRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketRequest value)  $default,){
final _that = this;
switch (_that) {
case _TicketRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TicketRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? keyword,  DateTime? time,  int? typeId,  int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketRequest() when $default != null:
return $default(_that.keyword,_that.time,_that.typeId,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? keyword,  DateTime? time,  int? typeId,  int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _TicketRequest():
return $default(_that.keyword,_that.time,_that.typeId,_that.page,_that.size);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? keyword,  DateTime? time,  int? typeId,  int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _TicketRequest() when $default != null:
return $default(_that.keyword,_that.time,_that.typeId,_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketRequest implements TicketRequest {
  const _TicketRequest({this.keyword, this.time, this.typeId, this.page = 0, this.size = 10});
  factory _TicketRequest.fromJson(Map<String, dynamic> json) => _$TicketRequestFromJson(json);

@override final  String? keyword;
@override final  DateTime? time;
@override final  int? typeId;
@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of TicketRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketRequestCopyWith<_TicketRequest> get copyWith => __$TicketRequestCopyWithImpl<_TicketRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketRequest&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.time, time) || other.time == time)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyword,time,typeId,page,size);

@override
String toString() {
  return 'TicketRequest(keyword: $keyword, time: $time, typeId: $typeId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$TicketRequestCopyWith<$Res> implements $TicketRequestCopyWith<$Res> {
  factory _$TicketRequestCopyWith(_TicketRequest value, $Res Function(_TicketRequest) _then) = __$TicketRequestCopyWithImpl;
@override @useResult
$Res call({
 String? keyword, DateTime? time, int? typeId, int page, int size
});




}
/// @nodoc
class __$TicketRequestCopyWithImpl<$Res>
    implements _$TicketRequestCopyWith<$Res> {
  __$TicketRequestCopyWithImpl(this._self, this._then);

  final _TicketRequest _self;
  final $Res Function(_TicketRequest) _then;

/// Create a copy of TicketRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = freezed,Object? time = freezed,Object? typeId = freezed,Object? page = null,Object? size = null,}) {
  return _then(_TicketRequest(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
