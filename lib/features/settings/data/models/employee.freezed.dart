// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Employee {

 int get id; int get tenantId; String get dateCreated; String get lastUpdated; String get modifiedBy; String get createdBy; String get code; String? get timekeepingCode; String get fullName; String get gender; String? get birthDate; String get position; String get socialInsuranceCode; String? get taxCode; String get phoneNumber; String get email; String get identityCard; String get issueDateIdentityCard; String get issuePlaceIdentityCard; String get permanentAddress; String get temporaryAddress; String? get hireDate; bool get isResigned; String? get resignDate; String? get note; String get status; String get staffMetaDataLevel; String? get avatarPath;
/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeCopyWith<Employee> get copyWith => _$EmployeeCopyWithImpl<Employee>(this as Employee, _$identity);

  /// Serializes this Employee to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Employee&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.code, code) || other.code == code)&&(identical(other.timekeepingCode, timekeepingCode) || other.timekeepingCode == timekeepingCode)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.position, position) || other.position == position)&&(identical(other.socialInsuranceCode, socialInsuranceCode) || other.socialInsuranceCode == socialInsuranceCode)&&(identical(other.taxCode, taxCode) || other.taxCode == taxCode)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.identityCard, identityCard) || other.identityCard == identityCard)&&(identical(other.issueDateIdentityCard, issueDateIdentityCard) || other.issueDateIdentityCard == issueDateIdentityCard)&&(identical(other.issuePlaceIdentityCard, issuePlaceIdentityCard) || other.issuePlaceIdentityCard == issuePlaceIdentityCard)&&(identical(other.permanentAddress, permanentAddress) || other.permanentAddress == permanentAddress)&&(identical(other.temporaryAddress, temporaryAddress) || other.temporaryAddress == temporaryAddress)&&(identical(other.hireDate, hireDate) || other.hireDate == hireDate)&&(identical(other.isResigned, isResigned) || other.isResigned == isResigned)&&(identical(other.resignDate, resignDate) || other.resignDate == resignDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.staffMetaDataLevel, staffMetaDataLevel) || other.staffMetaDataLevel == staffMetaDataLevel)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantId,dateCreated,lastUpdated,modifiedBy,createdBy,code,timekeepingCode,fullName,gender,birthDate,position,socialInsuranceCode,taxCode,phoneNumber,email,identityCard,issueDateIdentityCard,issuePlaceIdentityCard,permanentAddress,temporaryAddress,hireDate,isResigned,resignDate,note,status,staffMetaDataLevel,avatarPath]);

@override
String toString() {
  return 'Employee(id: $id, tenantId: $tenantId, dateCreated: $dateCreated, lastUpdated: $lastUpdated, modifiedBy: $modifiedBy, createdBy: $createdBy, code: $code, timekeepingCode: $timekeepingCode, fullName: $fullName, gender: $gender, birthDate: $birthDate, position: $position, socialInsuranceCode: $socialInsuranceCode, taxCode: $taxCode, phoneNumber: $phoneNumber, email: $email, identityCard: $identityCard, issueDateIdentityCard: $issueDateIdentityCard, issuePlaceIdentityCard: $issuePlaceIdentityCard, permanentAddress: $permanentAddress, temporaryAddress: $temporaryAddress, hireDate: $hireDate, isResigned: $isResigned, resignDate: $resignDate, note: $note, status: $status, staffMetaDataLevel: $staffMetaDataLevel, avatarPath: $avatarPath)';
}


}

/// @nodoc
abstract mixin class $EmployeeCopyWith<$Res>  {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) _then) = _$EmployeeCopyWithImpl;
@useResult
$Res call({
 int id, int tenantId, String dateCreated, String lastUpdated, String modifiedBy, String createdBy, String code, String? timekeepingCode, String fullName, String gender, String? birthDate, String position, String socialInsuranceCode, String? taxCode, String phoneNumber, String email, String identityCard, String issueDateIdentityCard, String issuePlaceIdentityCard, String permanentAddress, String temporaryAddress, String? hireDate, bool isResigned, String? resignDate, String? note, String status, String staffMetaDataLevel, String? avatarPath
});




}
/// @nodoc
class _$EmployeeCopyWithImpl<$Res>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._self, this._then);

  final Employee _self;
  final $Res Function(Employee) _then;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantId = null,Object? dateCreated = null,Object? lastUpdated = null,Object? modifiedBy = null,Object? createdBy = null,Object? code = null,Object? timekeepingCode = freezed,Object? fullName = null,Object? gender = null,Object? birthDate = freezed,Object? position = null,Object? socialInsuranceCode = null,Object? taxCode = freezed,Object? phoneNumber = null,Object? email = null,Object? identityCard = null,Object? issueDateIdentityCard = null,Object? issuePlaceIdentityCard = null,Object? permanentAddress = null,Object? temporaryAddress = null,Object? hireDate = freezed,Object? isResigned = null,Object? resignDate = freezed,Object? note = freezed,Object? status = null,Object? staffMetaDataLevel = null,Object? avatarPath = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,timekeepingCode: freezed == timekeepingCode ? _self.timekeepingCode : timekeepingCode // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,socialInsuranceCode: null == socialInsuranceCode ? _self.socialInsuranceCode : socialInsuranceCode // ignore: cast_nullable_to_non_nullable
as String,taxCode: freezed == taxCode ? _self.taxCode : taxCode // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,identityCard: null == identityCard ? _self.identityCard : identityCard // ignore: cast_nullable_to_non_nullable
as String,issueDateIdentityCard: null == issueDateIdentityCard ? _self.issueDateIdentityCard : issueDateIdentityCard // ignore: cast_nullable_to_non_nullable
as String,issuePlaceIdentityCard: null == issuePlaceIdentityCard ? _self.issuePlaceIdentityCard : issuePlaceIdentityCard // ignore: cast_nullable_to_non_nullable
as String,permanentAddress: null == permanentAddress ? _self.permanentAddress : permanentAddress // ignore: cast_nullable_to_non_nullable
as String,temporaryAddress: null == temporaryAddress ? _self.temporaryAddress : temporaryAddress // ignore: cast_nullable_to_non_nullable
as String,hireDate: freezed == hireDate ? _self.hireDate : hireDate // ignore: cast_nullable_to_non_nullable
as String?,isResigned: null == isResigned ? _self.isResigned : isResigned // ignore: cast_nullable_to_non_nullable
as bool,resignDate: freezed == resignDate ? _self.resignDate : resignDate // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,staffMetaDataLevel: null == staffMetaDataLevel ? _self.staffMetaDataLevel : staffMetaDataLevel // ignore: cast_nullable_to_non_nullable
as String,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Employee].
extension EmployeePatterns on Employee {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Employee value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Employee() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Employee value)  $default,){
final _that = this;
switch (_that) {
case _Employee():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Employee value)?  $default,){
final _that = this;
switch (_that) {
case _Employee() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int tenantId,  String dateCreated,  String lastUpdated,  String modifiedBy,  String createdBy,  String code,  String? timekeepingCode,  String fullName,  String gender,  String? birthDate,  String position,  String socialInsuranceCode,  String? taxCode,  String phoneNumber,  String email,  String identityCard,  String issueDateIdentityCard,  String issuePlaceIdentityCard,  String permanentAddress,  String temporaryAddress,  String? hireDate,  bool isResigned,  String? resignDate,  String? note,  String status,  String staffMetaDataLevel,  String? avatarPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Employee() when $default != null:
return $default(_that.id,_that.tenantId,_that.dateCreated,_that.lastUpdated,_that.modifiedBy,_that.createdBy,_that.code,_that.timekeepingCode,_that.fullName,_that.gender,_that.birthDate,_that.position,_that.socialInsuranceCode,_that.taxCode,_that.phoneNumber,_that.email,_that.identityCard,_that.issueDateIdentityCard,_that.issuePlaceIdentityCard,_that.permanentAddress,_that.temporaryAddress,_that.hireDate,_that.isResigned,_that.resignDate,_that.note,_that.status,_that.staffMetaDataLevel,_that.avatarPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int tenantId,  String dateCreated,  String lastUpdated,  String modifiedBy,  String createdBy,  String code,  String? timekeepingCode,  String fullName,  String gender,  String? birthDate,  String position,  String socialInsuranceCode,  String? taxCode,  String phoneNumber,  String email,  String identityCard,  String issueDateIdentityCard,  String issuePlaceIdentityCard,  String permanentAddress,  String temporaryAddress,  String? hireDate,  bool isResigned,  String? resignDate,  String? note,  String status,  String staffMetaDataLevel,  String? avatarPath)  $default,) {final _that = this;
switch (_that) {
case _Employee():
return $default(_that.id,_that.tenantId,_that.dateCreated,_that.lastUpdated,_that.modifiedBy,_that.createdBy,_that.code,_that.timekeepingCode,_that.fullName,_that.gender,_that.birthDate,_that.position,_that.socialInsuranceCode,_that.taxCode,_that.phoneNumber,_that.email,_that.identityCard,_that.issueDateIdentityCard,_that.issuePlaceIdentityCard,_that.permanentAddress,_that.temporaryAddress,_that.hireDate,_that.isResigned,_that.resignDate,_that.note,_that.status,_that.staffMetaDataLevel,_that.avatarPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int tenantId,  String dateCreated,  String lastUpdated,  String modifiedBy,  String createdBy,  String code,  String? timekeepingCode,  String fullName,  String gender,  String? birthDate,  String position,  String socialInsuranceCode,  String? taxCode,  String phoneNumber,  String email,  String identityCard,  String issueDateIdentityCard,  String issuePlaceIdentityCard,  String permanentAddress,  String temporaryAddress,  String? hireDate,  bool isResigned,  String? resignDate,  String? note,  String status,  String staffMetaDataLevel,  String? avatarPath)?  $default,) {final _that = this;
switch (_that) {
case _Employee() when $default != null:
return $default(_that.id,_that.tenantId,_that.dateCreated,_that.lastUpdated,_that.modifiedBy,_that.createdBy,_that.code,_that.timekeepingCode,_that.fullName,_that.gender,_that.birthDate,_that.position,_that.socialInsuranceCode,_that.taxCode,_that.phoneNumber,_that.email,_that.identityCard,_that.issueDateIdentityCard,_that.issuePlaceIdentityCard,_that.permanentAddress,_that.temporaryAddress,_that.hireDate,_that.isResigned,_that.resignDate,_that.note,_that.status,_that.staffMetaDataLevel,_that.avatarPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Employee implements Employee {
   _Employee({this.id = 0, this.tenantId = 0, this.dateCreated = 'N/A', this.lastUpdated = 'N/A', this.modifiedBy = 'N/A', this.createdBy = 'N/A', this.code = 'N/A', this.timekeepingCode = null, this.fullName = 'N/A', this.gender = 'N/A', this.birthDate = null, this.position = 'N/A', this.socialInsuranceCode = 'N/A', this.taxCode = null, this.phoneNumber = 'N/A', this.email = 'N/A', this.identityCard = 'N/A', this.issueDateIdentityCard = 'N/A', this.issuePlaceIdentityCard = 'N/A', this.permanentAddress = 'N/A', this.temporaryAddress = 'N/A', this.hireDate = null, this.isResigned = false, this.resignDate = null, this.note = null, this.status = 'N/A', this.staffMetaDataLevel = 'N/A', this.avatarPath = null});
  factory _Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int tenantId;
@override@JsonKey() final  String dateCreated;
@override@JsonKey() final  String lastUpdated;
@override@JsonKey() final  String modifiedBy;
@override@JsonKey() final  String createdBy;
@override@JsonKey() final  String code;
@override@JsonKey() final  String? timekeepingCode;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String gender;
@override@JsonKey() final  String? birthDate;
@override@JsonKey() final  String position;
@override@JsonKey() final  String socialInsuranceCode;
@override@JsonKey() final  String? taxCode;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String email;
@override@JsonKey() final  String identityCard;
@override@JsonKey() final  String issueDateIdentityCard;
@override@JsonKey() final  String issuePlaceIdentityCard;
@override@JsonKey() final  String permanentAddress;
@override@JsonKey() final  String temporaryAddress;
@override@JsonKey() final  String? hireDate;
@override@JsonKey() final  bool isResigned;
@override@JsonKey() final  String? resignDate;
@override@JsonKey() final  String? note;
@override@JsonKey() final  String status;
@override@JsonKey() final  String staffMetaDataLevel;
@override@JsonKey() final  String? avatarPath;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeCopyWith<_Employee> get copyWith => __$EmployeeCopyWithImpl<_Employee>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Employee&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.code, code) || other.code == code)&&(identical(other.timekeepingCode, timekeepingCode) || other.timekeepingCode == timekeepingCode)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.position, position) || other.position == position)&&(identical(other.socialInsuranceCode, socialInsuranceCode) || other.socialInsuranceCode == socialInsuranceCode)&&(identical(other.taxCode, taxCode) || other.taxCode == taxCode)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.identityCard, identityCard) || other.identityCard == identityCard)&&(identical(other.issueDateIdentityCard, issueDateIdentityCard) || other.issueDateIdentityCard == issueDateIdentityCard)&&(identical(other.issuePlaceIdentityCard, issuePlaceIdentityCard) || other.issuePlaceIdentityCard == issuePlaceIdentityCard)&&(identical(other.permanentAddress, permanentAddress) || other.permanentAddress == permanentAddress)&&(identical(other.temporaryAddress, temporaryAddress) || other.temporaryAddress == temporaryAddress)&&(identical(other.hireDate, hireDate) || other.hireDate == hireDate)&&(identical(other.isResigned, isResigned) || other.isResigned == isResigned)&&(identical(other.resignDate, resignDate) || other.resignDate == resignDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.staffMetaDataLevel, staffMetaDataLevel) || other.staffMetaDataLevel == staffMetaDataLevel)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantId,dateCreated,lastUpdated,modifiedBy,createdBy,code,timekeepingCode,fullName,gender,birthDate,position,socialInsuranceCode,taxCode,phoneNumber,email,identityCard,issueDateIdentityCard,issuePlaceIdentityCard,permanentAddress,temporaryAddress,hireDate,isResigned,resignDate,note,status,staffMetaDataLevel,avatarPath]);

@override
String toString() {
  return 'Employee(id: $id, tenantId: $tenantId, dateCreated: $dateCreated, lastUpdated: $lastUpdated, modifiedBy: $modifiedBy, createdBy: $createdBy, code: $code, timekeepingCode: $timekeepingCode, fullName: $fullName, gender: $gender, birthDate: $birthDate, position: $position, socialInsuranceCode: $socialInsuranceCode, taxCode: $taxCode, phoneNumber: $phoneNumber, email: $email, identityCard: $identityCard, issueDateIdentityCard: $issueDateIdentityCard, issuePlaceIdentityCard: $issuePlaceIdentityCard, permanentAddress: $permanentAddress, temporaryAddress: $temporaryAddress, hireDate: $hireDate, isResigned: $isResigned, resignDate: $resignDate, note: $note, status: $status, staffMetaDataLevel: $staffMetaDataLevel, avatarPath: $avatarPath)';
}


}

/// @nodoc
abstract mixin class _$EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$EmployeeCopyWith(_Employee value, $Res Function(_Employee) _then) = __$EmployeeCopyWithImpl;
@override @useResult
$Res call({
 int id, int tenantId, String dateCreated, String lastUpdated, String modifiedBy, String createdBy, String code, String? timekeepingCode, String fullName, String gender, String? birthDate, String position, String socialInsuranceCode, String? taxCode, String phoneNumber, String email, String identityCard, String issueDateIdentityCard, String issuePlaceIdentityCard, String permanentAddress, String temporaryAddress, String? hireDate, bool isResigned, String? resignDate, String? note, String status, String staffMetaDataLevel, String? avatarPath
});




}
/// @nodoc
class __$EmployeeCopyWithImpl<$Res>
    implements _$EmployeeCopyWith<$Res> {
  __$EmployeeCopyWithImpl(this._self, this._then);

  final _Employee _self;
  final $Res Function(_Employee) _then;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantId = null,Object? dateCreated = null,Object? lastUpdated = null,Object? modifiedBy = null,Object? createdBy = null,Object? code = null,Object? timekeepingCode = freezed,Object? fullName = null,Object? gender = null,Object? birthDate = freezed,Object? position = null,Object? socialInsuranceCode = null,Object? taxCode = freezed,Object? phoneNumber = null,Object? email = null,Object? identityCard = null,Object? issueDateIdentityCard = null,Object? issuePlaceIdentityCard = null,Object? permanentAddress = null,Object? temporaryAddress = null,Object? hireDate = freezed,Object? isResigned = null,Object? resignDate = freezed,Object? note = freezed,Object? status = null,Object? staffMetaDataLevel = null,Object? avatarPath = freezed,}) {
  return _then(_Employee(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,timekeepingCode: freezed == timekeepingCode ? _self.timekeepingCode : timekeepingCode // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,socialInsuranceCode: null == socialInsuranceCode ? _self.socialInsuranceCode : socialInsuranceCode // ignore: cast_nullable_to_non_nullable
as String,taxCode: freezed == taxCode ? _self.taxCode : taxCode // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,identityCard: null == identityCard ? _self.identityCard : identityCard // ignore: cast_nullable_to_non_nullable
as String,issueDateIdentityCard: null == issueDateIdentityCard ? _self.issueDateIdentityCard : issueDateIdentityCard // ignore: cast_nullable_to_non_nullable
as String,issuePlaceIdentityCard: null == issuePlaceIdentityCard ? _self.issuePlaceIdentityCard : issuePlaceIdentityCard // ignore: cast_nullable_to_non_nullable
as String,permanentAddress: null == permanentAddress ? _self.permanentAddress : permanentAddress // ignore: cast_nullable_to_non_nullable
as String,temporaryAddress: null == temporaryAddress ? _self.temporaryAddress : temporaryAddress // ignore: cast_nullable_to_non_nullable
as String,hireDate: freezed == hireDate ? _self.hireDate : hireDate // ignore: cast_nullable_to_non_nullable
as String?,isResigned: null == isResigned ? _self.isResigned : isResigned // ignore: cast_nullable_to_non_nullable
as bool,resignDate: freezed == resignDate ? _self.resignDate : resignDate // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,staffMetaDataLevel: null == staffMetaDataLevel ? _self.staffMetaDataLevel : staffMetaDataLevel // ignore: cast_nullable_to_non_nullable
as String,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
