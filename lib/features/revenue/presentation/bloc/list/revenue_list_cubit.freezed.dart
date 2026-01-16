// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RevenueListState {

 List<DailyRevenue> get revenue; int get page; bool get hasMore; NetworkState<List<DailyRevenue>> get status;
/// Create a copy of RevenueListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueListStateCopyWith<RevenueListState> get copyWith => _$RevenueListStateCopyWithImpl<RevenueListState>(this as RevenueListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueListState&&const DeepCollectionEquality().equals(other.revenue, revenue)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(revenue),page,hasMore,status);

@override
String toString() {
  return 'RevenueListState(revenue: $revenue, page: $page, hasMore: $hasMore, status: $status)';
}


}

/// @nodoc
abstract mixin class $RevenueListStateCopyWith<$Res>  {
  factory $RevenueListStateCopyWith(RevenueListState value, $Res Function(RevenueListState) _then) = _$RevenueListStateCopyWithImpl;
@useResult
$Res call({
 List<DailyRevenue> revenue, int page, bool hasMore, NetworkState<List<DailyRevenue>> status
});


$NetworkStateCopyWith<List<DailyRevenue>, $Res> get status;

}
/// @nodoc
class _$RevenueListStateCopyWithImpl<$Res>
    implements $RevenueListStateCopyWith<$Res> {
  _$RevenueListStateCopyWithImpl(this._self, this._then);

  final RevenueListState _self;
  final $Res Function(RevenueListState) _then;

/// Create a copy of RevenueListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revenue = null,Object? page = null,Object? hasMore = null,Object? status = null,}) {
  return _then(_self.copyWith(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as List<DailyRevenue>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NetworkState<List<DailyRevenue>>,
  ));
}
/// Create a copy of RevenueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkStateCopyWith<List<DailyRevenue>, $Res> get status {
  
  return $NetworkStateCopyWith<List<DailyRevenue>, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [RevenueListState].
extension RevenueListStatePatterns on RevenueListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenueListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenueListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenueListState value)  $default,){
final _that = this;
switch (_that) {
case _RevenueListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenueListState value)?  $default,){
final _that = this;
switch (_that) {
case _RevenueListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DailyRevenue> revenue,  int page,  bool hasMore,  NetworkState<List<DailyRevenue>> status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenueListState() when $default != null:
return $default(_that.revenue,_that.page,_that.hasMore,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DailyRevenue> revenue,  int page,  bool hasMore,  NetworkState<List<DailyRevenue>> status)  $default,) {final _that = this;
switch (_that) {
case _RevenueListState():
return $default(_that.revenue,_that.page,_that.hasMore,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DailyRevenue> revenue,  int page,  bool hasMore,  NetworkState<List<DailyRevenue>> status)?  $default,) {final _that = this;
switch (_that) {
case _RevenueListState() when $default != null:
return $default(_that.revenue,_that.page,_that.hasMore,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _RevenueListState implements RevenueListState {
  const _RevenueListState({final  List<DailyRevenue> revenue = const [], this.page = 1, this.hasMore = true, this.status = const NetworkState.initial()}): _revenue = revenue;
  

 final  List<DailyRevenue> _revenue;
@override@JsonKey() List<DailyRevenue> get revenue {
  if (_revenue is EqualUnmodifiableListView) return _revenue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revenue);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  NetworkState<List<DailyRevenue>> status;

/// Create a copy of RevenueListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueListStateCopyWith<_RevenueListState> get copyWith => __$RevenueListStateCopyWithImpl<_RevenueListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenueListState&&const DeepCollectionEquality().equals(other._revenue, _revenue)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_revenue),page,hasMore,status);

@override
String toString() {
  return 'RevenueListState(revenue: $revenue, page: $page, hasMore: $hasMore, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RevenueListStateCopyWith<$Res> implements $RevenueListStateCopyWith<$Res> {
  factory _$RevenueListStateCopyWith(_RevenueListState value, $Res Function(_RevenueListState) _then) = __$RevenueListStateCopyWithImpl;
@override @useResult
$Res call({
 List<DailyRevenue> revenue, int page, bool hasMore, NetworkState<List<DailyRevenue>> status
});


@override $NetworkStateCopyWith<List<DailyRevenue>, $Res> get status;

}
/// @nodoc
class __$RevenueListStateCopyWithImpl<$Res>
    implements _$RevenueListStateCopyWith<$Res> {
  __$RevenueListStateCopyWithImpl(this._self, this._then);

  final _RevenueListState _self;
  final $Res Function(_RevenueListState) _then;

/// Create a copy of RevenueListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revenue = null,Object? page = null,Object? hasMore = null,Object? status = null,}) {
  return _then(_RevenueListState(
revenue: null == revenue ? _self._revenue : revenue // ignore: cast_nullable_to_non_nullable
as List<DailyRevenue>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NetworkState<List<DailyRevenue>>,
  ));
}

/// Create a copy of RevenueListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkStateCopyWith<List<DailyRevenue>, $Res> get status {
  
  return $NetworkStateCopyWith<List<DailyRevenue>, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
