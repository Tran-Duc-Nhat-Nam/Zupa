// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryTicket {

 int get id; String get code;@DateTimeConverter() DateTime? get timeIn;@DateTimeConverter() DateTime? get timeOut;@DateTimeConverter() DateTime? get receivedDate; bool get isFlagError; String? get siteId; VehicleType? get type;
/// Create a copy of HistoryTicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryTicketCopyWith<HistoryTicket> get copyWith => _$HistoryTicketCopyWithImpl<HistoryTicket>(this as HistoryTicket, _$identity);

  /// Serializes this HistoryTicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.timeIn, timeIn) || other.timeIn == timeIn)&&(identical(other.timeOut, timeOut) || other.timeOut == timeOut)&&(identical(other.receivedDate, receivedDate) || other.receivedDate == receivedDate)&&(identical(other.isFlagError, isFlagError) || other.isFlagError == isFlagError)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,timeIn,timeOut,receivedDate,isFlagError,siteId,type);

@override
String toString() {
  return 'HistoryTicket(id: $id, code: $code, timeIn: $timeIn, timeOut: $timeOut, receivedDate: $receivedDate, isFlagError: $isFlagError, siteId: $siteId, type: $type)';
}


}

/// @nodoc
abstract mixin class $HistoryTicketCopyWith<$Res>  {
  factory $HistoryTicketCopyWith(HistoryTicket value, $Res Function(HistoryTicket) _then) = _$HistoryTicketCopyWithImpl;
@useResult
$Res call({
 int id, String code,@DateTimeConverter() DateTime? timeIn,@DateTimeConverter() DateTime? timeOut,@DateTimeConverter() DateTime? receivedDate, bool isFlagError, String? siteId, VehicleType? type
});


$VehicleTypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$HistoryTicketCopyWithImpl<$Res>
    implements $HistoryTicketCopyWith<$Res> {
  _$HistoryTicketCopyWithImpl(this._self, this._then);

  final HistoryTicket _self;
  final $Res Function(HistoryTicket) _then;

/// Create a copy of HistoryTicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? timeIn = freezed,Object? timeOut = freezed,Object? receivedDate = freezed,Object? isFlagError = null,Object? siteId = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,timeIn: freezed == timeIn ? _self.timeIn : timeIn // ignore: cast_nullable_to_non_nullable
as DateTime?,timeOut: freezed == timeOut ? _self.timeOut : timeOut // ignore: cast_nullable_to_non_nullable
as DateTime?,receivedDate: freezed == receivedDate ? _self.receivedDate : receivedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isFlagError: null == isFlagError ? _self.isFlagError : isFlagError // ignore: cast_nullable_to_non_nullable
as bool,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VehicleType?,
  ));
}
/// Create a copy of HistoryTicket
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


/// Adds pattern-matching-related methods to [HistoryTicket].
extension HistoryTicketPatterns on HistoryTicket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryTicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryTicket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryTicket value)  $default,){
final _that = this;
switch (_that) {
case _HistoryTicket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryTicket value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryTicket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code, @DateTimeConverter()  DateTime? timeIn, @DateTimeConverter()  DateTime? timeOut, @DateTimeConverter()  DateTime? receivedDate,  bool isFlagError,  String? siteId,  VehicleType? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryTicket() when $default != null:
return $default(_that.id,_that.code,_that.timeIn,_that.timeOut,_that.receivedDate,_that.isFlagError,_that.siteId,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code, @DateTimeConverter()  DateTime? timeIn, @DateTimeConverter()  DateTime? timeOut, @DateTimeConverter()  DateTime? receivedDate,  bool isFlagError,  String? siteId,  VehicleType? type)  $default,) {final _that = this;
switch (_that) {
case _HistoryTicket():
return $default(_that.id,_that.code,_that.timeIn,_that.timeOut,_that.receivedDate,_that.isFlagError,_that.siteId,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code, @DateTimeConverter()  DateTime? timeIn, @DateTimeConverter()  DateTime? timeOut, @DateTimeConverter()  DateTime? receivedDate,  bool isFlagError,  String? siteId,  VehicleType? type)?  $default,) {final _that = this;
switch (_that) {
case _HistoryTicket() when $default != null:
return $default(_that.id,_that.code,_that.timeIn,_that.timeOut,_that.receivedDate,_that.isFlagError,_that.siteId,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryTicket implements HistoryTicket {
  const _HistoryTicket({required this.id, required this.code, @DateTimeConverter() this.timeIn, @DateTimeConverter() this.timeOut, @DateTimeConverter() this.receivedDate, this.isFlagError = false, this.siteId, this.type});
  factory _HistoryTicket.fromJson(Map<String, dynamic> json) => _$HistoryTicketFromJson(json);

@override final  int id;
@override final  String code;
@override@DateTimeConverter() final  DateTime? timeIn;
@override@DateTimeConverter() final  DateTime? timeOut;
@override@DateTimeConverter() final  DateTime? receivedDate;
@override@JsonKey() final  bool isFlagError;
@override final  String? siteId;
@override final  VehicleType? type;

/// Create a copy of HistoryTicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryTicketCopyWith<_HistoryTicket> get copyWith => __$HistoryTicketCopyWithImpl<_HistoryTicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryTicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.timeIn, timeIn) || other.timeIn == timeIn)&&(identical(other.timeOut, timeOut) || other.timeOut == timeOut)&&(identical(other.receivedDate, receivedDate) || other.receivedDate == receivedDate)&&(identical(other.isFlagError, isFlagError) || other.isFlagError == isFlagError)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,timeIn,timeOut,receivedDate,isFlagError,siteId,type);

@override
String toString() {
  return 'HistoryTicket(id: $id, code: $code, timeIn: $timeIn, timeOut: $timeOut, receivedDate: $receivedDate, isFlagError: $isFlagError, siteId: $siteId, type: $type)';
}


}

/// @nodoc
abstract mixin class _$HistoryTicketCopyWith<$Res> implements $HistoryTicketCopyWith<$Res> {
  factory _$HistoryTicketCopyWith(_HistoryTicket value, $Res Function(_HistoryTicket) _then) = __$HistoryTicketCopyWithImpl;
@override @useResult
$Res call({
 int id, String code,@DateTimeConverter() DateTime? timeIn,@DateTimeConverter() DateTime? timeOut,@DateTimeConverter() DateTime? receivedDate, bool isFlagError, String? siteId, VehicleType? type
});


@override $VehicleTypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$HistoryTicketCopyWithImpl<$Res>
    implements _$HistoryTicketCopyWith<$Res> {
  __$HistoryTicketCopyWithImpl(this._self, this._then);

  final _HistoryTicket _self;
  final $Res Function(_HistoryTicket) _then;

/// Create a copy of HistoryTicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? timeIn = freezed,Object? timeOut = freezed,Object? receivedDate = freezed,Object? isFlagError = null,Object? siteId = freezed,Object? type = freezed,}) {
  return _then(_HistoryTicket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,timeIn: freezed == timeIn ? _self.timeIn : timeIn // ignore: cast_nullable_to_non_nullable
as DateTime?,timeOut: freezed == timeOut ? _self.timeOut : timeOut // ignore: cast_nullable_to_non_nullable
as DateTime?,receivedDate: freezed == receivedDate ? _self.receivedDate : receivedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isFlagError: null == isFlagError ? _self.isFlagError : isFlagError // ignore: cast_nullable_to_non_nullable
as bool,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VehicleType?,
  ));
}

/// Create a copy of HistoryTicket
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
