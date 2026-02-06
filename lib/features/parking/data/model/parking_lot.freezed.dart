// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_lot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingLot {

 String get id; String get name; String get address; List<ParkingLotCapacity> get capacity; VehicleType get vehicleType; bool get isLocked;
/// Create a copy of ParkingLot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingLotCopyWith<ParkingLot> get copyWith => _$ParkingLotCopyWithImpl<ParkingLot>(this as ParkingLot, _$identity);

  /// Serializes this ParkingLot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingLot&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.capacity, capacity)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,const DeepCollectionEquality().hash(capacity),vehicleType,isLocked);

@override
String toString() {
  return 'ParkingLot(id: $id, name: $name, address: $address, capacity: $capacity, vehicleType: $vehicleType, isLocked: $isLocked)';
}


}

/// @nodoc
abstract mixin class $ParkingLotCopyWith<$Res>  {
  factory $ParkingLotCopyWith(ParkingLot value, $Res Function(ParkingLot) _then) = _$ParkingLotCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, List<ParkingLotCapacity> capacity, VehicleType vehicleType, bool isLocked
});


$VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class _$ParkingLotCopyWithImpl<$Res>
    implements $ParkingLotCopyWith<$Res> {
  _$ParkingLotCopyWithImpl(this._self, this._then);

  final ParkingLot _self;
  final $Res Function(ParkingLot) _then;

/// Create a copy of ParkingLot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? capacity = null,Object? vehicleType = null,Object? isLocked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as List<ParkingLotCapacity>,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ParkingLot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get vehicleType {
  
  return $VehicleTypeCopyWith<$Res>(_self.vehicleType, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParkingLot].
extension ParkingLotPatterns on ParkingLot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingLot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingLot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingLot value)  $default,){
final _that = this;
switch (_that) {
case _ParkingLot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingLot value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingLot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  List<ParkingLotCapacity> capacity,  VehicleType vehicleType,  bool isLocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingLot() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.capacity,_that.vehicleType,_that.isLocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  List<ParkingLotCapacity> capacity,  VehicleType vehicleType,  bool isLocked)  $default,) {final _that = this;
switch (_that) {
case _ParkingLot():
return $default(_that.id,_that.name,_that.address,_that.capacity,_that.vehicleType,_that.isLocked);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  List<ParkingLotCapacity> capacity,  VehicleType vehicleType,  bool isLocked)?  $default,) {final _that = this;
switch (_that) {
case _ParkingLot() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.capacity,_that.vehicleType,_that.isLocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingLot implements ParkingLot {
  const _ParkingLot({this.id = 'N/A', this.name = 'N/A', this.address = 'N/A', final  List<ParkingLotCapacity> capacity = const [], this.vehicleType = const VehicleType(), this.isLocked = false}): _capacity = capacity;
  factory _ParkingLot.fromJson(Map<String, dynamic> json) => _$ParkingLotFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String address;
 final  List<ParkingLotCapacity> _capacity;
@override@JsonKey() List<ParkingLotCapacity> get capacity {
  if (_capacity is EqualUnmodifiableListView) return _capacity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_capacity);
}

@override@JsonKey() final  VehicleType vehicleType;
@override@JsonKey() final  bool isLocked;

/// Create a copy of ParkingLot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingLotCopyWith<_ParkingLot> get copyWith => __$ParkingLotCopyWithImpl<_ParkingLot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingLotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingLot&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._capacity, _capacity)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,const DeepCollectionEquality().hash(_capacity),vehicleType,isLocked);

@override
String toString() {
  return 'ParkingLot(id: $id, name: $name, address: $address, capacity: $capacity, vehicleType: $vehicleType, isLocked: $isLocked)';
}


}

/// @nodoc
abstract mixin class _$ParkingLotCopyWith<$Res> implements $ParkingLotCopyWith<$Res> {
  factory _$ParkingLotCopyWith(_ParkingLot value, $Res Function(_ParkingLot) _then) = __$ParkingLotCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, List<ParkingLotCapacity> capacity, VehicleType vehicleType, bool isLocked
});


@override $VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class __$ParkingLotCopyWithImpl<$Res>
    implements _$ParkingLotCopyWith<$Res> {
  __$ParkingLotCopyWithImpl(this._self, this._then);

  final _ParkingLot _self;
  final $Res Function(_ParkingLot) _then;

/// Create a copy of ParkingLot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? capacity = null,Object? vehicleType = null,Object? isLocked = null,}) {
  return _then(_ParkingLot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self._capacity : capacity // ignore: cast_nullable_to_non_nullable
as List<ParkingLotCapacity>,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ParkingLot
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
