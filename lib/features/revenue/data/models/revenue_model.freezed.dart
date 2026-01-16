// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RevenueModel {

 VehicleType get vehicleType; int get pass; int get revenue;
/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueModelCopyWith<RevenueModel> get copyWith => _$RevenueModelCopyWithImpl<RevenueModel>(this as RevenueModel, _$identity);

  /// Serializes this RevenueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueModel&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.pass, pass) || other.pass == pass)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,pass,revenue);

@override
String toString() {
  return 'RevenueModel(vehicleType: $vehicleType, pass: $pass, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $RevenueModelCopyWith<$Res>  {
  factory $RevenueModelCopyWith(RevenueModel value, $Res Function(RevenueModel) _then) = _$RevenueModelCopyWithImpl;
@useResult
$Res call({
 VehicleType vehicleType, int pass, int revenue
});


$VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class _$RevenueModelCopyWithImpl<$Res>
    implements $RevenueModelCopyWith<$Res> {
  _$RevenueModelCopyWithImpl(this._self, this._then);

  final RevenueModel _self;
  final $Res Function(RevenueModel) _then;

/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleType = null,Object? pass = null,Object? revenue = null,}) {
  return _then(_self.copyWith(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,pass: null == pass ? _self.pass : pass // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res> get vehicleType {
  
  return $VehicleTypeCopyWith<$Res>(_self.vehicleType, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}


/// Adds pattern-matching-related methods to [RevenueModel].
extension RevenueModelPatterns on RevenueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenueModel value)  $default,){
final _that = this;
switch (_that) {
case _RevenueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenueModel value)?  $default,){
final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VehicleType vehicleType,  int pass,  int revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
return $default(_that.vehicleType,_that.pass,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VehicleType vehicleType,  int pass,  int revenue)  $default,) {final _that = this;
switch (_that) {
case _RevenueModel():
return $default(_that.vehicleType,_that.pass,_that.revenue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VehicleType vehicleType,  int pass,  int revenue)?  $default,) {final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
return $default(_that.vehicleType,_that.pass,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenueModel implements RevenueModel {
  const _RevenueModel({required this.vehicleType, this.pass = 0, this.revenue = 0});
  factory _RevenueModel.fromJson(Map<String, dynamic> json) => _$RevenueModelFromJson(json);

@override final  VehicleType vehicleType;
@override@JsonKey() final  int pass;
@override@JsonKey() final  int revenue;

/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueModelCopyWith<_RevenueModel> get copyWith => __$RevenueModelCopyWithImpl<_RevenueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenueModel&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.pass, pass) || other.pass == pass)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,pass,revenue);

@override
String toString() {
  return 'RevenueModel(vehicleType: $vehicleType, pass: $pass, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$RevenueModelCopyWith<$Res> implements $RevenueModelCopyWith<$Res> {
  factory _$RevenueModelCopyWith(_RevenueModel value, $Res Function(_RevenueModel) _then) = __$RevenueModelCopyWithImpl;
@override @useResult
$Res call({
 VehicleType vehicleType, int pass, int revenue
});


@override $VehicleTypeCopyWith<$Res> get vehicleType;

}
/// @nodoc
class __$RevenueModelCopyWithImpl<$Res>
    implements _$RevenueModelCopyWith<$Res> {
  __$RevenueModelCopyWithImpl(this._self, this._then);

  final _RevenueModel _self;
  final $Res Function(_RevenueModel) _then;

/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleType = null,Object? pass = null,Object? revenue = null,}) {
  return _then(_RevenueModel(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,pass: null == pass ? _self.pass : pass // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RevenueModel
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
