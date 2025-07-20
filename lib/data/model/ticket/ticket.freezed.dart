// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ticket {

 String get id; String? get licensePlate; DateTime get timeIn; DateTime? get timeOut; String get siteId; VehicleType get type; int get price;
/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCopyWith<Ticket> get copyWith => _$TicketCopyWithImpl<Ticket>(this as Ticket, _$identity);

  /// Serializes this Ticket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ticket&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.timeIn, timeIn) || other.timeIn == timeIn)&&(identical(other.timeOut, timeOut) || other.timeOut == timeOut)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.type, type) || other.type == type)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,timeIn,timeOut,siteId,type,price);

@override
String toString() {
  return 'Ticket(id: $id, licensePlate: $licensePlate, timeIn: $timeIn, timeOut: $timeOut, siteId: $siteId, type: $type, price: $price)';
}


}

/// @nodoc
abstract mixin class $TicketCopyWith<$Res>  {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) _then) = _$TicketCopyWithImpl;
@useResult
$Res call({
 String id, String? licensePlate, DateTime timeIn, DateTime? timeOut, String siteId, VehicleType type, int price
});


$VehicleTypeCopyWith<$Res> get type;

}
/// @nodoc
class _$TicketCopyWithImpl<$Res>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._self, this._then);

  final Ticket _self;
  final $Res Function(Ticket) _then;

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? licensePlate = freezed,Object? timeIn = null,Object? timeOut = freezed,Object? siteId = null,Object? type = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,licensePlate: freezed == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String?,timeIn: null == timeIn ? _self.timeIn : timeIn // ignore: cast_nullable_to_non_nullable
as DateTime,timeOut: freezed == timeOut ? _self.timeOut : timeOut // ignore: cast_nullable_to_non_nullable
as DateTime?,siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VehicleType,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get type {
  
  return $VehicleTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [Ticket].
extension TicketPatterns on Ticket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ticket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ticket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ticket value)  $default,){
final _that = this;
switch (_that) {
case _Ticket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ticket value)?  $default,){
final _that = this;
switch (_that) {
case _Ticket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? licensePlate,  DateTime timeIn,  DateTime? timeOut,  String siteId,  VehicleType type,  int price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ticket() when $default != null:
return $default(_that.id,_that.licensePlate,_that.timeIn,_that.timeOut,_that.siteId,_that.type,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? licensePlate,  DateTime timeIn,  DateTime? timeOut,  String siteId,  VehicleType type,  int price)  $default,) {final _that = this;
switch (_that) {
case _Ticket():
return $default(_that.id,_that.licensePlate,_that.timeIn,_that.timeOut,_that.siteId,_that.type,_that.price);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? licensePlate,  DateTime timeIn,  DateTime? timeOut,  String siteId,  VehicleType type,  int price)?  $default,) {final _that = this;
switch (_that) {
case _Ticket() when $default != null:
return $default(_that.id,_that.licensePlate,_that.timeIn,_that.timeOut,_that.siteId,_that.type,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ticket implements Ticket {
  const _Ticket({required this.id, this.licensePlate, required this.timeIn, this.timeOut, required this.siteId, required this.type, this.price = 0});
  factory _Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

@override final  String id;
@override final  String? licensePlate;
@override final  DateTime timeIn;
@override final  DateTime? timeOut;
@override final  String siteId;
@override final  VehicleType type;
@override@JsonKey() final  int price;

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCopyWith<_Ticket> get copyWith => __$TicketCopyWithImpl<_Ticket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ticket&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.timeIn, timeIn) || other.timeIn == timeIn)&&(identical(other.timeOut, timeOut) || other.timeOut == timeOut)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.type, type) || other.type == type)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,timeIn,timeOut,siteId,type,price);

@override
String toString() {
  return 'Ticket(id: $id, licensePlate: $licensePlate, timeIn: $timeIn, timeOut: $timeOut, siteId: $siteId, type: $type, price: $price)';
}


}

/// @nodoc
abstract mixin class _$TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$TicketCopyWith(_Ticket value, $Res Function(_Ticket) _then) = __$TicketCopyWithImpl;
@override @useResult
$Res call({
 String id, String? licensePlate, DateTime timeIn, DateTime? timeOut, String siteId, VehicleType type, int price
});


@override $VehicleTypeCopyWith<$Res> get type;

}
/// @nodoc
class __$TicketCopyWithImpl<$Res>
    implements _$TicketCopyWith<$Res> {
  __$TicketCopyWithImpl(this._self, this._then);

  final _Ticket _self;
  final $Res Function(_Ticket) _then;

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? licensePlate = freezed,Object? timeIn = null,Object? timeOut = freezed,Object? siteId = null,Object? type = null,Object? price = null,}) {
  return _then(_Ticket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,licensePlate: freezed == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String?,timeIn: null == timeIn ? _self.timeIn : timeIn // ignore: cast_nullable_to_non_nullable
as DateTime,timeOut: freezed == timeOut ? _self.timeOut : timeOut // ignore: cast_nullable_to_non_nullable
as DateTime?,siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VehicleType,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get type {
  
  return $VehicleTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

// dart format on
