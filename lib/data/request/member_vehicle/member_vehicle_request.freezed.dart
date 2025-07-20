// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_vehicle_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberVehicleRequest {

 String get name; String get phoneNumber; String get licenseNumber; String get cardID; String get branchID; String get vehicleTypeID; DateTime get expiredIn;
/// Create a copy of MemberVehicleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberVehicleRequestCopyWith<MemberVehicleRequest> get copyWith => _$MemberVehicleRequestCopyWithImpl<MemberVehicleRequest>(this as MemberVehicleRequest, _$identity);

  /// Serializes this MemberVehicleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberVehicleRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.cardID, cardID) || other.cardID == cardID)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.vehicleTypeID, vehicleTypeID) || other.vehicleTypeID == vehicleTypeID)&&(identical(other.expiredIn, expiredIn) || other.expiredIn == expiredIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber,licenseNumber,cardID,branchID,vehicleTypeID,expiredIn);

@override
String toString() {
  return 'MemberVehicleRequest(name: $name, phoneNumber: $phoneNumber, licenseNumber: $licenseNumber, cardID: $cardID, branchID: $branchID, vehicleTypeID: $vehicleTypeID, expiredIn: $expiredIn)';
}


}

/// @nodoc
abstract mixin class $MemberVehicleRequestCopyWith<$Res>  {
  factory $MemberVehicleRequestCopyWith(MemberVehicleRequest value, $Res Function(MemberVehicleRequest) _then) = _$MemberVehicleRequestCopyWithImpl;
@useResult
$Res call({
 String name, String phoneNumber, String licenseNumber, String cardID, String branchID, String vehicleTypeID, DateTime expiredIn
});




}
/// @nodoc
class _$MemberVehicleRequestCopyWithImpl<$Res>
    implements $MemberVehicleRequestCopyWith<$Res> {
  _$MemberVehicleRequestCopyWithImpl(this._self, this._then);

  final MemberVehicleRequest _self;
  final $Res Function(MemberVehicleRequest) _then;

/// Create a copy of MemberVehicleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phoneNumber = null,Object? licenseNumber = null,Object? cardID = null,Object? branchID = null,Object? vehicleTypeID = null,Object? expiredIn = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,cardID: null == cardID ? _self.cardID : cardID // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,vehicleTypeID: null == vehicleTypeID ? _self.vehicleTypeID : vehicleTypeID // ignore: cast_nullable_to_non_nullable
as String,expiredIn: null == expiredIn ? _self.expiredIn : expiredIn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberVehicleRequest].
extension MemberVehicleRequestPatterns on MemberVehicleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberVehicleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberVehicleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberVehicleRequest value)  $default,){
final _that = this;
switch (_that) {
case _MemberVehicleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberVehicleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MemberVehicleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phoneNumber,  String licenseNumber,  String cardID,  String branchID,  String vehicleTypeID,  DateTime expiredIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberVehicleRequest() when $default != null:
return $default(_that.name,_that.phoneNumber,_that.licenseNumber,_that.cardID,_that.branchID,_that.vehicleTypeID,_that.expiredIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phoneNumber,  String licenseNumber,  String cardID,  String branchID,  String vehicleTypeID,  DateTime expiredIn)  $default,) {final _that = this;
switch (_that) {
case _MemberVehicleRequest():
return $default(_that.name,_that.phoneNumber,_that.licenseNumber,_that.cardID,_that.branchID,_that.vehicleTypeID,_that.expiredIn);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phoneNumber,  String licenseNumber,  String cardID,  String branchID,  String vehicleTypeID,  DateTime expiredIn)?  $default,) {final _that = this;
switch (_that) {
case _MemberVehicleRequest() when $default != null:
return $default(_that.name,_that.phoneNumber,_that.licenseNumber,_that.cardID,_that.branchID,_that.vehicleTypeID,_that.expiredIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberVehicleRequest implements MemberVehicleRequest {
  const _MemberVehicleRequest({required this.name, required this.phoneNumber, required this.licenseNumber, required this.cardID, required this.branchID, required this.vehicleTypeID, required this.expiredIn});
  factory _MemberVehicleRequest.fromJson(Map<String, dynamic> json) => _$MemberVehicleRequestFromJson(json);

@override final  String name;
@override final  String phoneNumber;
@override final  String licenseNumber;
@override final  String cardID;
@override final  String branchID;
@override final  String vehicleTypeID;
@override final  DateTime expiredIn;

/// Create a copy of MemberVehicleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberVehicleRequestCopyWith<_MemberVehicleRequest> get copyWith => __$MemberVehicleRequestCopyWithImpl<_MemberVehicleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberVehicleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberVehicleRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.cardID, cardID) || other.cardID == cardID)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.vehicleTypeID, vehicleTypeID) || other.vehicleTypeID == vehicleTypeID)&&(identical(other.expiredIn, expiredIn) || other.expiredIn == expiredIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber,licenseNumber,cardID,branchID,vehicleTypeID,expiredIn);

@override
String toString() {
  return 'MemberVehicleRequest(name: $name, phoneNumber: $phoneNumber, licenseNumber: $licenseNumber, cardID: $cardID, branchID: $branchID, vehicleTypeID: $vehicleTypeID, expiredIn: $expiredIn)';
}


}

/// @nodoc
abstract mixin class _$MemberVehicleRequestCopyWith<$Res> implements $MemberVehicleRequestCopyWith<$Res> {
  factory _$MemberVehicleRequestCopyWith(_MemberVehicleRequest value, $Res Function(_MemberVehicleRequest) _then) = __$MemberVehicleRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String phoneNumber, String licenseNumber, String cardID, String branchID, String vehicleTypeID, DateTime expiredIn
});




}
/// @nodoc
class __$MemberVehicleRequestCopyWithImpl<$Res>
    implements _$MemberVehicleRequestCopyWith<$Res> {
  __$MemberVehicleRequestCopyWithImpl(this._self, this._then);

  final _MemberVehicleRequest _self;
  final $Res Function(_MemberVehicleRequest) _then;

/// Create a copy of MemberVehicleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phoneNumber = null,Object? licenseNumber = null,Object? cardID = null,Object? branchID = null,Object? vehicleTypeID = null,Object? expiredIn = null,}) {
  return _then(_MemberVehicleRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,cardID: null == cardID ? _self.cardID : cardID // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,vehicleTypeID: null == vehicleTypeID ? _self.vehicleTypeID : vehicleTypeID // ignore: cast_nullable_to_non_nullable
as String,expiredIn: null == expiredIn ? _self.expiredIn : expiredIn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
