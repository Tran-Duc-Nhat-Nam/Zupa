// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_revenue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyRevenue {

 DateTime get date; VehicleType? get vehicleType; List<RevenueModel> get revenue;
/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyRevenueCopyWith<DailyRevenue> get copyWith => _$DailyRevenueCopyWithImpl<DailyRevenue>(this as DailyRevenue, _$identity);

  /// Serializes this DailyRevenue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyRevenue&&(identical(other.date, date) || other.date == date)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&const DeepCollectionEquality().equals(other.revenue, revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,vehicleType,const DeepCollectionEquality().hash(revenue));

@override
String toString() {
  return 'DailyRevenue(date: $date, vehicleType: $vehicleType, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $DailyRevenueCopyWith<$Res>  {
  factory $DailyRevenueCopyWith(DailyRevenue value, $Res Function(DailyRevenue) _then) = _$DailyRevenueCopyWithImpl;
@useResult
$Res call({
 DateTime date, VehicleType? vehicleType, List<RevenueModel> revenue
});


$VehicleTypeCopyWith<$Res>? get vehicleType;

}
/// @nodoc
class _$DailyRevenueCopyWithImpl<$Res>
    implements $DailyRevenueCopyWith<$Res> {
  _$DailyRevenueCopyWithImpl(this._self, this._then);

  final DailyRevenue _self;
  final $Res Function(DailyRevenue) _then;

/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? vehicleType = freezed,Object? revenue = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType?,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as List<RevenueModel>,
  ));
}
/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res>? get vehicleType {
    if (_self.vehicleType == null) {
    return null;
  }

  return $VehicleTypeCopyWith<$Res>(_self.vehicleType!, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyRevenue].
extension DailyRevenuePatterns on DailyRevenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyRevenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyRevenue value)  $default,){
final _that = this;
switch (_that) {
case _DailyRevenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyRevenue value)?  $default,){
final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  VehicleType? vehicleType,  List<RevenueModel> revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
return $default(_that.date,_that.vehicleType,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  VehicleType? vehicleType,  List<RevenueModel> revenue)  $default,) {final _that = this;
switch (_that) {
case _DailyRevenue():
return $default(_that.date,_that.vehicleType,_that.revenue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  VehicleType? vehicleType,  List<RevenueModel> revenue)?  $default,) {final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
return $default(_that.date,_that.vehicleType,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyRevenue extends DailyRevenue {
  const _DailyRevenue({required this.date, this.vehicleType, final  List<RevenueModel> revenue = const []}): _revenue = revenue,super._();
  factory _DailyRevenue.fromJson(Map<String, dynamic> json) => _$DailyRevenueFromJson(json);

@override final  DateTime date;
@override final  VehicleType? vehicleType;
 final  List<RevenueModel> _revenue;
@override@JsonKey() List<RevenueModel> get revenue {
  if (_revenue is EqualUnmodifiableListView) return _revenue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revenue);
}


/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyRevenueCopyWith<_DailyRevenue> get copyWith => __$DailyRevenueCopyWithImpl<_DailyRevenue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyRevenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyRevenue&&(identical(other.date, date) || other.date == date)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&const DeepCollectionEquality().equals(other._revenue, _revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,vehicleType,const DeepCollectionEquality().hash(_revenue));

@override
String toString() {
  return 'DailyRevenue(date: $date, vehicleType: $vehicleType, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$DailyRevenueCopyWith<$Res> implements $DailyRevenueCopyWith<$Res> {
  factory _$DailyRevenueCopyWith(_DailyRevenue value, $Res Function(_DailyRevenue) _then) = __$DailyRevenueCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, VehicleType? vehicleType, List<RevenueModel> revenue
});


@override $VehicleTypeCopyWith<$Res>? get vehicleType;

}
/// @nodoc
class __$DailyRevenueCopyWithImpl<$Res>
    implements _$DailyRevenueCopyWith<$Res> {
  __$DailyRevenueCopyWithImpl(this._self, this._then);

  final _DailyRevenue _self;
  final $Res Function(_DailyRevenue) _then;

/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? vehicleType = freezed,Object? revenue = null,}) {
  return _then(_DailyRevenue(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType?,revenue: null == revenue ? _self._revenue : revenue // ignore: cast_nullable_to_non_nullable
as List<RevenueModel>,
  ));
}

/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<$Res>? get vehicleType {
    if (_self.vehicleType == null) {
    return null;
  }

  return $VehicleTypeCopyWith<$Res>(_self.vehicleType!, (value) {
    return _then(_self.copyWith(vehicleType: value));
  });
}
}

// dart format on
