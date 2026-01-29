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
mixin _$HomeTicket {

 int get id; int get tenantId; String get code; String? get timekeepingCode; String? get fullName; String? get phoneNumber; String? get email; bool get isResigned;@GenderConverter() bool? get gender;@DateTimeConverter() DateTime? get birthDate;@DateTimeConverter() DateTime get dateCreated;@DateTimeConverter() DateTime get lastUpdated; String? get avatarPath; String? get note;
/// Create a copy of HomeTicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeTicketCopyWith<HomeTicket> get copyWith => _$HomeTicketCopyWithImpl<HomeTicket>(this as HomeTicket, _$identity);

  /// Serializes this HomeTicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.code, code) || other.code == code)&&(identical(other.timekeepingCode, timekeepingCode) || other.timekeepingCode == timekeepingCode)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.isResigned, isResigned) || other.isResigned == isResigned)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,code,timekeepingCode,fullName,phoneNumber,email,isResigned,gender,birthDate,dateCreated,lastUpdated,avatarPath,note);

@override
String toString() {
  return 'HomeTicket(id: $id, tenantId: $tenantId, code: $code, timekeepingCode: $timekeepingCode, fullName: $fullName, phoneNumber: $phoneNumber, email: $email, isResigned: $isResigned, gender: $gender, birthDate: $birthDate, dateCreated: $dateCreated, lastUpdated: $lastUpdated, avatarPath: $avatarPath, note: $note)';
}


}

/// @nodoc
abstract mixin class $HomeTicketCopyWith<$Res>  {
  factory $HomeTicketCopyWith(HomeTicket value, $Res Function(HomeTicket) _then) = _$HomeTicketCopyWithImpl;
@useResult
$Res call({
 int id, int tenantId, String code, String? timekeepingCode, String? fullName, String? phoneNumber, String? email, bool isResigned,@GenderConverter() bool? gender,@DateTimeConverter() DateTime? birthDate,@DateTimeConverter() DateTime dateCreated,@DateTimeConverter() DateTime lastUpdated, String? avatarPath, String? note
});




}
/// @nodoc
class _$HomeTicketCopyWithImpl<$Res>
    implements $HomeTicketCopyWith<$Res> {
  _$HomeTicketCopyWithImpl(this._self, this._then);

  final HomeTicket _self;
  final $Res Function(HomeTicket) _then;

/// Create a copy of HomeTicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantId = null,Object? code = null,Object? timekeepingCode = freezed,Object? fullName = freezed,Object? phoneNumber = freezed,Object? email = freezed,Object? isResigned = null,Object? gender = freezed,Object? birthDate = freezed,Object? dateCreated = null,Object? lastUpdated = null,Object? avatarPath = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,timekeepingCode: freezed == timekeepingCode ? _self.timekeepingCode : timekeepingCode // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isResigned: null == isResigned ? _self.isResigned : isResigned // ignore: cast_nullable_to_non_nullable
as bool,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as bool?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeTicket].
extension HomeTicketPatterns on HomeTicket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeTicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeTicket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeTicket value)  $default,){
final _that = this;
switch (_that) {
case _HomeTicket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeTicket value)?  $default,){
final _that = this;
switch (_that) {
case _HomeTicket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int tenantId,  String code,  String? timekeepingCode,  String? fullName,  String? phoneNumber,  String? email,  bool isResigned, @GenderConverter()  bool? gender, @DateTimeConverter()  DateTime? birthDate, @DateTimeConverter()  DateTime dateCreated, @DateTimeConverter()  DateTime lastUpdated,  String? avatarPath,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeTicket() when $default != null:
return $default(_that.id,_that.tenantId,_that.code,_that.timekeepingCode,_that.fullName,_that.phoneNumber,_that.email,_that.isResigned,_that.gender,_that.birthDate,_that.dateCreated,_that.lastUpdated,_that.avatarPath,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int tenantId,  String code,  String? timekeepingCode,  String? fullName,  String? phoneNumber,  String? email,  bool isResigned, @GenderConverter()  bool? gender, @DateTimeConverter()  DateTime? birthDate, @DateTimeConverter()  DateTime dateCreated, @DateTimeConverter()  DateTime lastUpdated,  String? avatarPath,  String? note)  $default,) {final _that = this;
switch (_that) {
case _HomeTicket():
return $default(_that.id,_that.tenantId,_that.code,_that.timekeepingCode,_that.fullName,_that.phoneNumber,_that.email,_that.isResigned,_that.gender,_that.birthDate,_that.dateCreated,_that.lastUpdated,_that.avatarPath,_that.note);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int tenantId,  String code,  String? timekeepingCode,  String? fullName,  String? phoneNumber,  String? email,  bool isResigned, @GenderConverter()  bool? gender, @DateTimeConverter()  DateTime? birthDate, @DateTimeConverter()  DateTime dateCreated, @DateTimeConverter()  DateTime lastUpdated,  String? avatarPath,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _HomeTicket() when $default != null:
return $default(_that.id,_that.tenantId,_that.code,_that.timekeepingCode,_that.fullName,_that.phoneNumber,_that.email,_that.isResigned,_that.gender,_that.birthDate,_that.dateCreated,_that.lastUpdated,_that.avatarPath,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeTicket implements HomeTicket {
  const _HomeTicket({required this.id, required this.tenantId, required this.code, this.timekeepingCode, this.fullName, this.phoneNumber, this.email, required this.isResigned, @GenderConverter() this.gender, @DateTimeConverter() this.birthDate, @DateTimeConverter() required this.dateCreated, @DateTimeConverter() required this.lastUpdated, this.avatarPath, this.note});
  factory _HomeTicket.fromJson(Map<String, dynamic> json) => _$HomeTicketFromJson(json);

@override final  int id;
@override final  int tenantId;
@override final  String code;
@override final  String? timekeepingCode;
@override final  String? fullName;
@override final  String? phoneNumber;
@override final  String? email;
@override final  bool isResigned;
@override@GenderConverter() final  bool? gender;
@override@DateTimeConverter() final  DateTime? birthDate;
@override@DateTimeConverter() final  DateTime dateCreated;
@override@DateTimeConverter() final  DateTime lastUpdated;
@override final  String? avatarPath;
@override final  String? note;

/// Create a copy of HomeTicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeTicketCopyWith<_HomeTicket> get copyWith => __$HomeTicketCopyWithImpl<_HomeTicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeTicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.code, code) || other.code == code)&&(identical(other.timekeepingCode, timekeepingCode) || other.timekeepingCode == timekeepingCode)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.isResigned, isResigned) || other.isResigned == isResigned)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,code,timekeepingCode,fullName,phoneNumber,email,isResigned,gender,birthDate,dateCreated,lastUpdated,avatarPath,note);

@override
String toString() {
  return 'HomeTicket(id: $id, tenantId: $tenantId, code: $code, timekeepingCode: $timekeepingCode, fullName: $fullName, phoneNumber: $phoneNumber, email: $email, isResigned: $isResigned, gender: $gender, birthDate: $birthDate, dateCreated: $dateCreated, lastUpdated: $lastUpdated, avatarPath: $avatarPath, note: $note)';
}


}

/// @nodoc
abstract mixin class _$HomeTicketCopyWith<$Res> implements $HomeTicketCopyWith<$Res> {
  factory _$HomeTicketCopyWith(_HomeTicket value, $Res Function(_HomeTicket) _then) = __$HomeTicketCopyWithImpl;
@override @useResult
$Res call({
 int id, int tenantId, String code, String? timekeepingCode, String? fullName, String? phoneNumber, String? email, bool isResigned,@GenderConverter() bool? gender,@DateTimeConverter() DateTime? birthDate,@DateTimeConverter() DateTime dateCreated,@DateTimeConverter() DateTime lastUpdated, String? avatarPath, String? note
});




}
/// @nodoc
class __$HomeTicketCopyWithImpl<$Res>
    implements _$HomeTicketCopyWith<$Res> {
  __$HomeTicketCopyWithImpl(this._self, this._then);

  final _HomeTicket _self;
  final $Res Function(_HomeTicket) _then;

/// Create a copy of HomeTicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantId = null,Object? code = null,Object? timekeepingCode = freezed,Object? fullName = freezed,Object? phoneNumber = freezed,Object? email = freezed,Object? isResigned = null,Object? gender = freezed,Object? birthDate = freezed,Object? dateCreated = null,Object? lastUpdated = null,Object? avatarPath = freezed,Object? note = freezed,}) {
  return _then(_HomeTicket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,timekeepingCode: freezed == timekeepingCode ? _self.timekeepingCode : timekeepingCode // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isResigned: null == isResigned ? _self.isResigned : isResigned // ignore: cast_nullable_to_non_nullable
as bool,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as bool?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
