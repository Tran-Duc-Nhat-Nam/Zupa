// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberVehicle {

 String get id; String get name; String get phoneNumber; String get parkingLotId; VehicleType get vehicleType; String get cardId; int get expiredIn; int get price;
/// Create a copy of MemberVehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberVehicleCopyWith<MemberVehicle> get copyWith => _$MemberVehicleCopyWithImpl<MemberVehicle>(this as MemberVehicle, _$identity);

  /// Serializes this MemberVehicle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberVehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.parkingLotId, parkingLotId) || other.parkingLotId == parkingLotId)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.expiredIn, expiredIn) || other.expiredIn == expiredIn)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phoneNumber,parkingLotId,vehicleType,cardId,expiredIn,price);

@override
String toString() {
  return 'MemberVehicle(id: $id, name: $name, phoneNumber: $phoneNumber, parkingLotId: $parkingLotId, vehicleType: $vehicleType, cardId: $cardId, expiredIn: $expiredIn, price: $price)';
}


}

/// @nodoc
abstract mixin class $MemberVehicleCopyWith<$Res>  {
  factory $MemberVehicleCopyWith(MemberVehicle value, $Res Function(MemberVehicle) _then) = _$MemberVehicleCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phoneNumber, String parkingLotId, VehicleType vehicleType, String cardId, int expiredIn, int price
});


$VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class _$MemberVehicleCopyWithImpl<$Res>
    implements $MemberVehicleCopyWith<$Res> {
  _$MemberVehicleCopyWithImpl(this._self, this._then);

  final MemberVehicle _self;
  final $Res Function(MemberVehicle) _then;

/// Create a copy of MemberVehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phoneNumber = null,Object? parkingLotId = null,Object? vehicleType = null,Object? cardId = null,Object? expiredIn = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,parkingLotId: null == parkingLotId ? _self.parkingLotId : parkingLotId // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,expiredIn: null == expiredIn ? _self.expiredIn : expiredIn // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MemberVehicle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get vehicleType {
  
  return $VehicleTypeCopyWith<$Res>(_self.vehicleType, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}


/// Adds pattern-matching-related methods to [MemberVehicle].
extension MemberVehiclePatterns on MemberVehicle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberVehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberVehicle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberVehicle value)  $default,){
final _that = this;
switch (_that) {
case _MemberVehicle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberVehicle value)?  $default,){
final _that = this;
switch (_that) {
case _MemberVehicle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phoneNumber,  String parkingLotId,  VehicleType vehicleType,  String cardId,  int expiredIn,  int price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberVehicle() when $default != null:
return $default(_that.id,_that.name,_that.phoneNumber,_that.parkingLotId,_that.vehicleType,_that.cardId,_that.expiredIn,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phoneNumber,  String parkingLotId,  VehicleType vehicleType,  String cardId,  int expiredIn,  int price)  $default,) {final _that = this;
switch (_that) {
case _MemberVehicle():
return $default(_that.id,_that.name,_that.phoneNumber,_that.parkingLotId,_that.vehicleType,_that.cardId,_that.expiredIn,_that.price);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phoneNumber,  String parkingLotId,  VehicleType vehicleType,  String cardId,  int expiredIn,  int price)?  $default,) {final _that = this;
switch (_that) {
case _MemberVehicle() when $default != null:
return $default(_that.id,_that.name,_that.phoneNumber,_that.parkingLotId,_that.vehicleType,_that.cardId,_that.expiredIn,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberVehicle implements MemberVehicle {
  const _MemberVehicle({this.id = 'N/A', this.name = 'N/A', this.phoneNumber = 'N/A', this.parkingLotId = 'N/A', this.vehicleType = const VehicleType(), this.cardId = 'N/A', this.expiredIn = 86400, this.price = 0});
  factory _MemberVehicle.fromJson(Map<String, dynamic> json) => _$MemberVehicleFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String parkingLotId;
@override@JsonKey() final  VehicleType vehicleType;
@override@JsonKey() final  String cardId;
@override@JsonKey() final  int expiredIn;
@override@JsonKey() final  int price;

/// Create a copy of MemberVehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberVehicleCopyWith<_MemberVehicle> get copyWith => __$MemberVehicleCopyWithImpl<_MemberVehicle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberVehicleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberVehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.parkingLotId, parkingLotId) || other.parkingLotId == parkingLotId)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.expiredIn, expiredIn) || other.expiredIn == expiredIn)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phoneNumber,parkingLotId,vehicleType,cardId,expiredIn,price);

@override
String toString() {
  return 'MemberVehicle(id: $id, name: $name, phoneNumber: $phoneNumber, parkingLotId: $parkingLotId, vehicleType: $vehicleType, cardId: $cardId, expiredIn: $expiredIn, price: $price)';
}


}

/// @nodoc
abstract mixin class _$MemberVehicleCopyWith<$Res> implements $MemberVehicleCopyWith<$Res> {
  factory _$MemberVehicleCopyWith(_MemberVehicle value, $Res Function(_MemberVehicle) _then) = __$MemberVehicleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phoneNumber, String parkingLotId, VehicleType vehicleType, String cardId, int expiredIn, int price
});


@override $VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class __$MemberVehicleCopyWithImpl<$Res>
    implements _$MemberVehicleCopyWith<$Res> {
  __$MemberVehicleCopyWithImpl(this._self, this._then);

  final _MemberVehicle _self;
  final $Res Function(_MemberVehicle) _then;

/// Create a copy of MemberVehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phoneNumber = null,Object? parkingLotId = null,Object? vehicleType = null,Object? cardId = null,Object? expiredIn = null,Object? price = null,}) {
  return _then(_MemberVehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,parkingLotId: null == parkingLotId ? _self.parkingLotId : parkingLotId // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,expiredIn: null == expiredIn ? _self.expiredIn : expiredIn // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MemberVehicle
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
