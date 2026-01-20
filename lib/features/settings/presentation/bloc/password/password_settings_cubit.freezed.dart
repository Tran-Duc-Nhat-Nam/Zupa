// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasswordSettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordSettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PasswordSettingsState()';
}


}

/// @nodoc
class $PasswordSettingsStateCopyWith<$Res>  {
$PasswordSettingsStateCopyWith(PasswordSettingsState _, $Res Function(PasswordSettingsState) __);
}


/// Adds pattern-matching-related methods to [PasswordSettingsState].
extension PasswordSettingsStatePatterns on PasswordSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( ChangePasswordSuccess value)?  changePasswordSuccess,TResult Function( ChangePasswordFailed value)?  changePasswordFailed,TResult Function( Unauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that);case ChangePasswordFailed() when changePasswordFailed != null:
return changePasswordFailed(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( ChangePasswordSuccess value)  changePasswordSuccess,required TResult Function( ChangePasswordFailed value)  changePasswordFailed,required TResult Function( Unauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case ChangePasswordSuccess():
return changePasswordSuccess(_that);case ChangePasswordFailed():
return changePasswordFailed(_that);case Unauthenticated():
return unauthenticated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( ChangePasswordSuccess value)?  changePasswordSuccess,TResult? Function( ChangePasswordFailed value)?  changePasswordFailed,TResult? Function( Unauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that);case ChangePasswordFailed() when changePasswordFailed != null:
return changePasswordFailed(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loaded,TResult Function()?  changePasswordSuccess,TResult Function( String message)?  changePasswordFailed,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded();case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess();case ChangePasswordFailed() when changePasswordFailed != null:
return changePasswordFailed(_that.message);case Unauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loaded,required TResult Function()  changePasswordSuccess,required TResult Function( String message)  changePasswordFailed,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded();case ChangePasswordSuccess():
return changePasswordSuccess();case ChangePasswordFailed():
return changePasswordFailed(_that.message);case Unauthenticated():
return unauthenticated();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loaded,TResult? Function()?  changePasswordSuccess,TResult? Function( String message)?  changePasswordFailed,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded();case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess();case ChangePasswordFailed() when changePasswordFailed != null:
return changePasswordFailed(_that.message);case Unauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements PasswordSettingsState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PasswordSettingsState.initial()';
}


}




/// @nodoc


class Loading implements PasswordSettingsState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PasswordSettingsState.loading()';
}


}




/// @nodoc


class Loaded implements PasswordSettingsState {
  const Loaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PasswordSettingsState.loaded()';
}


}




/// @nodoc


class ChangePasswordSuccess implements PasswordSettingsState {
  const ChangePasswordSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PasswordSettingsState.changePasswordSuccess()';
}


}




/// @nodoc


class ChangePasswordFailed implements PasswordSettingsState {
  const ChangePasswordFailed(this.message);
  

 final  String message;

/// Create a copy of PasswordSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordFailedCopyWith<ChangePasswordFailed> get copyWith => _$ChangePasswordFailedCopyWithImpl<ChangePasswordFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PasswordSettingsState.changePasswordFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordFailedCopyWith<$Res> implements $PasswordSettingsStateCopyWith<$Res> {
  factory $ChangePasswordFailedCopyWith(ChangePasswordFailed value, $Res Function(ChangePasswordFailed) _then) = _$ChangePasswordFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChangePasswordFailedCopyWithImpl<$Res>
    implements $ChangePasswordFailedCopyWith<$Res> {
  _$ChangePasswordFailedCopyWithImpl(this._self, this._then);

  final ChangePasswordFailed _self;
  final $Res Function(ChangePasswordFailed) _then;

/// Create a copy of PasswordSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChangePasswordFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Unauthenticated implements PasswordSettingsState {
  const Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PasswordSettingsState.unauthenticated()';
}


}




// dart format on
