// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalizationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalizationState()';
}


}

/// @nodoc
class $LocalizationStateCopyWith<$Res>  {
$LocalizationStateCopyWith(LocalizationState _, $Res Function(LocalizationState) __);
}


/// Adds pattern-matching-related methods to [LocalizationState].
extension LocalizationStatePatterns on LocalizationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( AppLocalization locale)?  loading,TResult Function( AppLocalization locale)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.locale);case Loaded() when loaded != null:
return loaded(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( AppLocalization locale)  loading,required TResult Function( AppLocalization locale)  loaded,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading(_that.locale);case Loaded():
return loaded(_that.locale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( AppLocalization locale)?  loading,TResult? Function( AppLocalization locale)?  loaded,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.locale);case Loaded() when loaded != null:
return loaded(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements LocalizationState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalizationState.initial()';
}


}




/// @nodoc


class Loading implements LocalizationState {
  const Loading(this.locale);
  

 final  AppLocalization locale;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocalizationState.loading(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $LocalizationStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@useResult
$Res call({
 AppLocalization locale
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(Loading(
null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocalization,
  ));
}


}

/// @nodoc


class Loaded implements LocalizationState {
  const Loaded(this.locale);
  

 final  AppLocalization locale;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocalizationState.loaded(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $LocalizationStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 AppLocalization locale
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(Loaded(
null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocalization,
  ));
}


}

// dart format on
