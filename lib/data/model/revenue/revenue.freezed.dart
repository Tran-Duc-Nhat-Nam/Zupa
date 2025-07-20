// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Revenue {

 VehicleType get vehicleType; int get pass; int get revenue;
/// Create a copy of Revenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueCopyWith<Revenue> get copyWith => _$RevenueCopyWithImpl<Revenue>(this as Revenue, _$identity);

  /// Serializes this Revenue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Revenue&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.pass, pass) || other.pass == pass)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,pass,revenue);

@override
String toString() {
  return 'Revenue(vehicleType: $vehicleType, pass: $pass, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $RevenueCopyWith<$Res>  {
  factory $RevenueCopyWith(Revenue value, $Res Function(Revenue) _then) = _$RevenueCopyWithImpl;
@useResult
$Res call({
 VehicleType vehicleType, int pass, int revenue
});


$VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class _$RevenueCopyWithImpl<$Res>
    implements $RevenueCopyWith<$Res> {
  _$RevenueCopyWithImpl(this._self, this._then);

  final Revenue _self;
  final $Res Function(Revenue) _then;

/// Create a copy of Revenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleType = null,Object? pass = null,Object? revenue = null,}) {
  return _then(_self.copyWith(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,pass: null == pass ? _self.pass : pass // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Revenue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get vehicleType {
  
  return $VehicleTypeCopyWith<$Res>(_self.vehicleType, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}


/// Adds pattern-matching-related methods to [Revenue].
extension RevenuePatterns on Revenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Revenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Revenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Revenue value)  $default,){
final _that = this;
switch (_that) {
case _Revenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Revenue value)?  $default,){
final _that = this;
switch (_that) {
case _Revenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VehicleType vehicleType,  int pass,  int revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Revenue() when $default != null:
return $default(_that.vehicleType,_that.pass,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VehicleType vehicleType,  int pass,  int revenue)  $default,) {final _that = this;
switch (_that) {
case _Revenue():
return $default(_that.vehicleType,_that.pass,_that.revenue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VehicleType vehicleType,  int pass,  int revenue)?  $default,) {final _that = this;
switch (_that) {
case _Revenue() when $default != null:
return $default(_that.vehicleType,_that.pass,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Revenue implements Revenue {
  const _Revenue({required this.vehicleType, this.pass = 0, this.revenue = 0});
  factory _Revenue.fromJson(Map<String, dynamic> json) => _$RevenueFromJson(json);

@override final  VehicleType vehicleType;
@override@JsonKey() final  int pass;
@override@JsonKey() final  int revenue;

/// Create a copy of Revenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueCopyWith<_Revenue> get copyWith => __$RevenueCopyWithImpl<_Revenue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Revenue&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.pass, pass) || other.pass == pass)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,pass,revenue);

@override
String toString() {
  return 'Revenue(vehicleType: $vehicleType, pass: $pass, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$RevenueCopyWith<$Res> implements $RevenueCopyWith<$Res> {
  factory _$RevenueCopyWith(_Revenue value, $Res Function(_Revenue) _then) = __$RevenueCopyWithImpl;
@override @useResult
$Res call({
 VehicleType vehicleType, int pass, int revenue
});


@override $VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class __$RevenueCopyWithImpl<$Res>
    implements _$RevenueCopyWith<$Res> {
  __$RevenueCopyWithImpl(this._self, this._then);

  final _Revenue _self;
  final $Res Function(_Revenue) _then;

/// Create a copy of Revenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleType = null,Object? pass = null,Object? revenue = null,}) {
  return _then(_Revenue(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,pass: null == pass ? _self.pass : pass // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Revenue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get vehicleType {
  
  return $VehicleTypeCopyWith<$Res>(_self.vehicleType, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}

// dart format on
