// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeFilter {

 String? get keyword; DateTime? get time; VehicleType? get type;
/// Create a copy of HomeFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeFilterCopyWith<HomeFilter> get copyWith => _$HomeFilterCopyWithImpl<HomeFilter>(this as HomeFilter, _$identity);

  /// Serializes this HomeFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeFilter&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.time, time) || other.time == time)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyword,time,type);

@override
String toString() {
  return 'HomeFilter(keyword: $keyword, time: $time, type: $type)';
}


}

/// @nodoc
abstract mixin class $HomeFilterCopyWith<$Res>  {
  factory $HomeFilterCopyWith(HomeFilter value, $Res Function(HomeFilter) _then) = _$HomeFilterCopyWithImpl;
@useResult
$Res call({
 String? keyword, DateTime? time, VehicleType? type
});


$VehicleTypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$HomeFilterCopyWithImpl<$Res>
    implements $HomeFilterCopyWith<$Res> {
  _$HomeFilterCopyWithImpl(this._self, this._then);

  final HomeFilter _self;
  final $Res Function(HomeFilter) _then;

/// Create a copy of HomeFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = freezed,Object? time = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VehicleType?,
  ));
}
/// Create a copy of HomeFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $VehicleTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeFilter].
extension HomeFilterPatterns on HomeFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeFilter value)  $default,){
final _that = this;
switch (_that) {
case _HomeFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeFilter value)?  $default,){
final _that = this;
switch (_that) {
case _HomeFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? keyword,  DateTime? time,  VehicleType? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeFilter() when $default != null:
return $default(_that.keyword,_that.time,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? keyword,  DateTime? time,  VehicleType? type)  $default,) {final _that = this;
switch (_that) {
case _HomeFilter():
return $default(_that.keyword,_that.time,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? keyword,  DateTime? time,  VehicleType? type)?  $default,) {final _that = this;
switch (_that) {
case _HomeFilter() when $default != null:
return $default(_that.keyword,_that.time,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeFilter implements HomeFilter {
  const _HomeFilter({this.keyword, this.time, this.type});
  factory _HomeFilter.fromJson(Map<String, dynamic> json) => _$HomeFilterFromJson(json);

@override final  String? keyword;
@override final  DateTime? time;
@override final  VehicleType? type;

/// Create a copy of HomeFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeFilterCopyWith<_HomeFilter> get copyWith => __$HomeFilterCopyWithImpl<_HomeFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeFilter&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.time, time) || other.time == time)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyword,time,type);

@override
String toString() {
  return 'HomeFilter(keyword: $keyword, time: $time, type: $type)';
}


}

/// @nodoc
abstract mixin class _$HomeFilterCopyWith<$Res> implements $HomeFilterCopyWith<$Res> {
  factory _$HomeFilterCopyWith(_HomeFilter value, $Res Function(_HomeFilter) _then) = __$HomeFilterCopyWithImpl;
@override @useResult
$Res call({
 String? keyword, DateTime? time, VehicleType? type
});


@override $VehicleTypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$HomeFilterCopyWithImpl<$Res>
    implements _$HomeFilterCopyWith<$Res> {
  __$HomeFilterCopyWithImpl(this._self, this._then);

  final _HomeFilter _self;
  final $Res Function(_HomeFilter) _then;

/// Create a copy of HomeFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = freezed,Object? time = freezed,Object? type = freezed,}) {
  return _then(_HomeFilter(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VehicleType?,
  ));
}

/// Create a copy of HomeFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $VehicleTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

// dart format on
