// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_lot_capacity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingLotCapacity {

 VehicleType get vehicleType; int get capacity; int get available;
/// Create a copy of ParkingLotCapacity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingLotCapacityCopyWith<ParkingLotCapacity> get copyWith => _$ParkingLotCapacityCopyWithImpl<ParkingLotCapacity>(this as ParkingLotCapacity, _$identity);

  /// Serializes this ParkingLotCapacity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingLotCapacity&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,capacity,available);

@override
String toString() {
  return 'ParkingLotCapacity(vehicleType: $vehicleType, capacity: $capacity, available: $available)';
}


}

/// @nodoc
abstract mixin class $ParkingLotCapacityCopyWith<$Res>  {
  factory $ParkingLotCapacityCopyWith(ParkingLotCapacity value, $Res Function(ParkingLotCapacity) _then) = _$ParkingLotCapacityCopyWithImpl;
@useResult
$Res call({
 VehicleType vehicleType, int capacity, int available
});


$VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class _$ParkingLotCapacityCopyWithImpl<$Res>
    implements $ParkingLotCapacityCopyWith<$Res> {
  _$ParkingLotCapacityCopyWithImpl(this._self, this._then);

  final ParkingLotCapacity _self;
  final $Res Function(ParkingLotCapacity) _then;

/// Create a copy of ParkingLotCapacity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleType = null,Object? capacity = null,Object? available = null,}) {
  return _then(_self.copyWith(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ParkingLotCapacity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get vehicleType {
  
  return $VehicleTypeCopyWith<$Res>(_self.vehicleType, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParkingLotCapacity].
extension ParkingLotCapacityPatterns on ParkingLotCapacity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingLotCapacity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingLotCapacity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingLotCapacity value)  $default,){
final _that = this;
switch (_that) {
case _ParkingLotCapacity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingLotCapacity value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingLotCapacity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VehicleType vehicleType,  int capacity,  int available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingLotCapacity() when $default != null:
return $default(_that.vehicleType,_that.capacity,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VehicleType vehicleType,  int capacity,  int available)  $default,) {final _that = this;
switch (_that) {
case _ParkingLotCapacity():
return $default(_that.vehicleType,_that.capacity,_that.available);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VehicleType vehicleType,  int capacity,  int available)?  $default,) {final _that = this;
switch (_that) {
case _ParkingLotCapacity() when $default != null:
return $default(_that.vehicleType,_that.capacity,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingLotCapacity implements ParkingLotCapacity {
  const _ParkingLotCapacity({this.vehicleType = const VehicleType(), this.capacity = 0, this.available = 0});
  factory _ParkingLotCapacity.fromJson(Map<String, dynamic> json) => _$ParkingLotCapacityFromJson(json);

@override@JsonKey() final  VehicleType vehicleType;
@override@JsonKey() final  int capacity;
@override@JsonKey() final  int available;

/// Create a copy of ParkingLotCapacity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingLotCapacityCopyWith<_ParkingLotCapacity> get copyWith => __$ParkingLotCapacityCopyWithImpl<_ParkingLotCapacity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingLotCapacityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingLotCapacity&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,capacity,available);

@override
String toString() {
  return 'ParkingLotCapacity(vehicleType: $vehicleType, capacity: $capacity, available: $available)';
}


}

/// @nodoc
abstract mixin class _$ParkingLotCapacityCopyWith<$Res> implements $ParkingLotCapacityCopyWith<$Res> {
  factory _$ParkingLotCapacityCopyWith(_ParkingLotCapacity value, $Res Function(_ParkingLotCapacity) _then) = __$ParkingLotCapacityCopyWithImpl;
@override @useResult
$Res call({
 VehicleType vehicleType, int capacity, int available
});


@override $VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class __$ParkingLotCapacityCopyWithImpl<$Res>
    implements _$ParkingLotCapacityCopyWith<$Res> {
  __$ParkingLotCapacityCopyWithImpl(this._self, this._then);

  final _ParkingLotCapacity _self;
  final $Res Function(_ParkingLotCapacity) _then;

/// Create a copy of ParkingLotCapacity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleType = null,Object? capacity = null,Object? available = null,}) {
  return _then(_ParkingLotCapacity(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ParkingLotCapacity
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
