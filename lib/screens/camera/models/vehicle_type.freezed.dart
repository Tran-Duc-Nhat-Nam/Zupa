// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleType {

 String get value; String get name; String get iconPath;
/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<VehicleType> get copyWith => _$VehicleTypeCopyWithImpl<VehicleType>(this as VehicleType, _$identity);

  /// Serializes this VehicleType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleType&&(identical(other.value, value) || other.value == value)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,name,iconPath);

@override
String toString() {
  return 'VehicleType(value: $value, name: $name, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class $VehicleTypeCopyWith<$Res>  {
  factory $VehicleTypeCopyWith(VehicleType value, $Res Function(VehicleType) _then) = _$VehicleTypeCopyWithImpl;
@useResult
$Res call({
 String value, String name, String iconPath
});




}
/// @nodoc
class _$VehicleTypeCopyWithImpl<$Res>
    implements $VehicleTypeCopyWith<$Res> {
  _$VehicleTypeCopyWithImpl(this._self, this._then);

  final VehicleType _self;
  final $Res Function(VehicleType) _then;

/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? name = null,Object? iconPath = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleType].
extension VehicleTypePatterns on VehicleType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleType value)  $default,){
final _that = this;
switch (_that) {
case _VehicleType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleType value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String name,  String iconPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleType() when $default != null:
return $default(_that.value,_that.name,_that.iconPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String name,  String iconPath)  $default,) {final _that = this;
switch (_that) {
case _VehicleType():
return $default(_that.value,_that.name,_that.iconPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String name,  String iconPath)?  $default,) {final _that = this;
switch (_that) {
case _VehicleType() when $default != null:
return $default(_that.value,_that.name,_that.iconPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleType implements VehicleType {
  const _VehicleType({this.value = 'other', this.name = 'vehicle', this.iconPath = AppIcons.home});
  factory _VehicleType.fromJson(Map<String, dynamic> json) => _$VehicleTypeFromJson(json);

@override@JsonKey() final  String value;
@override@JsonKey() final  String name;
@override@JsonKey() final  String iconPath;

/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleTypeCopyWith<_VehicleType> get copyWith => __$VehicleTypeCopyWithImpl<_VehicleType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleType&&(identical(other.value, value) || other.value == value)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,name,iconPath);

@override
String toString() {
  return 'VehicleType(value: $value, name: $name, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class _$VehicleTypeCopyWith<$Res> implements $VehicleTypeCopyWith<$Res> {
  factory _$VehicleTypeCopyWith(_VehicleType value, $Res Function(_VehicleType) _then) = __$VehicleTypeCopyWithImpl;
@override @useResult
$Res call({
 String value, String name, String iconPath
});




}
/// @nodoc
class __$VehicleTypeCopyWithImpl<$Res>
    implements _$VehicleTypeCopyWith<$Res> {
  __$VehicleTypeCopyWithImpl(this._self, this._then);

  final _VehicleType _self;
  final $Res Function(_VehicleType) _then;

/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? name = null,Object? iconPath = null,}) {
  return _then(_VehicleType(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
