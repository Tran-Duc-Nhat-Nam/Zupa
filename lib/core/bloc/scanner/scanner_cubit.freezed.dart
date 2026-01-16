// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState()';
}


}

/// @nodoc
class $ScannerStateCopyWith<$Res>  {
$ScannerStateCopyWith(ScannerState _, $Res Function(ScannerState) __);
}


/// Adds pattern-matching-related methods to [ScannerState].
extension ScannerStatePatterns on ScannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Failed value)?  failed,TResult Function( Scanning value)?  scanning,TResult Function( ScanSuccess value)?  scanSuccess,TResult Function( ScanFailed value)?  scanFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Failed() when failed != null:
return failed(_that);case Scanning() when scanning != null:
return scanning(_that);case ScanSuccess() when scanSuccess != null:
return scanSuccess(_that);case ScanFailed() when scanFailed != null:
return scanFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Failed value)  failed,required TResult Function( Scanning value)  scanning,required TResult Function( ScanSuccess value)  scanSuccess,required TResult Function( ScanFailed value)  scanFailed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Failed():
return failed(_that);case Scanning():
return scanning(_that);case ScanSuccess():
return scanSuccess(_that);case ScanFailed():
return scanFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Failed value)?  failed,TResult? Function( Scanning value)?  scanning,TResult? Function( ScanSuccess value)?  scanSuccess,TResult? Function( ScanFailed value)?  scanFailed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Failed() when failed != null:
return failed(_that);case Scanning() when scanning != null:
return scanning(_that);case ScanSuccess() when scanSuccess != null:
return scanSuccess(_that);case ScanFailed() when scanFailed != null:
return scanFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loaded,TResult Function()?  failed,TResult Function()?  scanning,TResult Function( dynamic parkingData)?  scanSuccess,TResult Function( String message)?  scanFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded();case Failed() when failed != null:
return failed();case Scanning() when scanning != null:
return scanning();case ScanSuccess() when scanSuccess != null:
return scanSuccess(_that.parkingData);case ScanFailed() when scanFailed != null:
return scanFailed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loaded,required TResult Function()  failed,required TResult Function()  scanning,required TResult Function( dynamic parkingData)  scanSuccess,required TResult Function( String message)  scanFailed,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded();case Failed():
return failed();case Scanning():
return scanning();case ScanSuccess():
return scanSuccess(_that.parkingData);case ScanFailed():
return scanFailed(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loaded,TResult? Function()?  failed,TResult? Function()?  scanning,TResult? Function( dynamic parkingData)?  scanSuccess,TResult? Function( String message)?  scanFailed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded();case Failed() when failed != null:
return failed();case Scanning() when scanning != null:
return scanning();case ScanSuccess() when scanSuccess != null:
return scanSuccess(_that.parkingData);case ScanFailed() when scanFailed != null:
return scanFailed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ScannerState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState.initial()';
}


}




/// @nodoc


class Loading implements ScannerState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState.loading()';
}


}




/// @nodoc


class Loaded implements ScannerState {
  const Loaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState.loaded()';
}


}




/// @nodoc


class Failed implements ScannerState {
  const Failed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState.failed()';
}


}




/// @nodoc


class Scanning implements ScannerState {
  const Scanning();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scanning);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerState.scanning()';
}


}




/// @nodoc


class ScanSuccess implements ScannerState {
  const ScanSuccess(this.parkingData);
  

 final  dynamic parkingData;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanSuccessCopyWith<ScanSuccess> get copyWith => _$ScanSuccessCopyWithImpl<ScanSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanSuccess&&const DeepCollectionEquality().equals(other.parkingData, parkingData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(parkingData));

@override
String toString() {
  return 'ScannerState.scanSuccess(parkingData: $parkingData)';
}


}

/// @nodoc
abstract mixin class $ScanSuccessCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScanSuccessCopyWith(ScanSuccess value, $Res Function(ScanSuccess) _then) = _$ScanSuccessCopyWithImpl;
@useResult
$Res call({
 dynamic parkingData
});




}
/// @nodoc
class _$ScanSuccessCopyWithImpl<$Res>
    implements $ScanSuccessCopyWith<$Res> {
  _$ScanSuccessCopyWithImpl(this._self, this._then);

  final ScanSuccess _self;
  final $Res Function(ScanSuccess) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? parkingData = freezed,}) {
  return _then(ScanSuccess(
freezed == parkingData ? _self.parkingData : parkingData // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ScanFailed implements ScannerState {
  const ScanFailed(this.message);
  

 final  String message;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanFailedCopyWith<ScanFailed> get copyWith => _$ScanFailedCopyWithImpl<ScanFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ScannerState.scanFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $ScanFailedCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScanFailedCopyWith(ScanFailed value, $Res Function(ScanFailed) _then) = _$ScanFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ScanFailedCopyWithImpl<$Res>
    implements $ScanFailedCopyWith<$Res> {
  _$ScanFailedCopyWithImpl(this._self, this._then);

  final ScanFailed _self;
  final $Res Function(ScanFailed) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ScanFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
