// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountRequest {

 String get tenant; String get username; String get password;
/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountRequestCopyWith<AccountRequest> get copyWith => _$AccountRequestCopyWithImpl<AccountRequest>(this as AccountRequest, _$identity);

  /// Serializes this AccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountRequest&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenant,username,password);

@override
String toString() {
  return 'AccountRequest(tenant: $tenant, username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $AccountRequestCopyWith<$Res>  {
  factory $AccountRequestCopyWith(AccountRequest value, $Res Function(AccountRequest) _then) = _$AccountRequestCopyWithImpl;
@useResult
$Res call({
 String tenant, String username, String password
});




}
/// @nodoc
class _$AccountRequestCopyWithImpl<$Res>
    implements $AccountRequestCopyWith<$Res> {
  _$AccountRequestCopyWithImpl(this._self, this._then);

  final AccountRequest _self;
  final $Res Function(AccountRequest) _then;

/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenant = null,Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountRequest].
extension AccountRequestPatterns on AccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountRequest value)  $default,){
final _that = this;
switch (_that) {
case _AccountRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenant,  String username,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
return $default(_that.tenant,_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenant,  String username,  String password)  $default,) {final _that = this;
switch (_that) {
case _AccountRequest():
return $default(_that.tenant,_that.username,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenant,  String username,  String password)?  $default,) {final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
return $default(_that.tenant,_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountRequest implements AccountRequest {
  const _AccountRequest({this.tenant = '', this.username = '', this.password = ''});
  factory _AccountRequest.fromJson(Map<String, dynamic> json) => _$AccountRequestFromJson(json);

@override@JsonKey() final  String tenant;
@override@JsonKey() final  String username;
@override@JsonKey() final  String password;

/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountRequestCopyWith<_AccountRequest> get copyWith => __$AccountRequestCopyWithImpl<_AccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountRequest&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenant,username,password);

@override
String toString() {
  return 'AccountRequest(tenant: $tenant, username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AccountRequestCopyWith<$Res> implements $AccountRequestCopyWith<$Res> {
  factory _$AccountRequestCopyWith(_AccountRequest value, $Res Function(_AccountRequest) _then) = __$AccountRequestCopyWithImpl;
@override @useResult
$Res call({
 String tenant, String username, String password
});




}
/// @nodoc
class __$AccountRequestCopyWithImpl<$Res>
    implements _$AccountRequestCopyWith<$Res> {
  __$AccountRequestCopyWithImpl(this._self, this._then);

  final _AccountRequest _self;
  final $Res Function(_AccountRequest) _then;

/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenant = null,Object? username = null,Object? password = null,}) {
  return _then(_AccountRequest(
tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
