// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryListState {

 List<HistoryTicket> get tickets; int get page; bool get hasMore; NetworkState<List<HistoryTicket>> get status;
/// Create a copy of HistoryListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryListStateCopyWith<HistoryListState> get copyWith => _$HistoryListStateCopyWithImpl<HistoryListState>(this as HistoryListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryListState&&const DeepCollectionEquality().equals(other.tickets, tickets)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickets),page,hasMore,status);

@override
String toString() {
  return 'HistoryListState(tickets: $tickets, page: $page, hasMore: $hasMore, status: $status)';
}


}

/// @nodoc
abstract mixin class $HistoryListStateCopyWith<$Res>  {
  factory $HistoryListStateCopyWith(HistoryListState value, $Res Function(HistoryListState) _then) = _$HistoryListStateCopyWithImpl;
@useResult
$Res call({
 List<HistoryTicket> tickets, int page, bool hasMore, NetworkState<List<HistoryTicket>> status
});


$NetworkStateCopyWith<List<HistoryTicket>, $Res> get status;

}
/// @nodoc
class _$HistoryListStateCopyWithImpl<$Res>
    implements $HistoryListStateCopyWith<$Res> {
  _$HistoryListStateCopyWithImpl(this._self, this._then);

  final HistoryListState _self;
  final $Res Function(HistoryListState) _then;

/// Create a copy of HistoryListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickets = null,Object? page = null,Object? hasMore = null,Object? status = null,}) {
  return _then(_self.copyWith(
tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<HistoryTicket>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NetworkState<List<HistoryTicket>>,
  ));
}
/// Create a copy of HistoryListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkStateCopyWith<List<HistoryTicket>, $Res> get status {
  
  return $NetworkStateCopyWith<List<HistoryTicket>, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryListState].
extension HistoryListStatePatterns on HistoryListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryListState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryListState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryTicket> tickets,  int page,  bool hasMore,  NetworkState<List<HistoryTicket>> status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryListState() when $default != null:
return $default(_that.tickets,_that.page,_that.hasMore,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryTicket> tickets,  int page,  bool hasMore,  NetworkState<List<HistoryTicket>> status)  $default,) {final _that = this;
switch (_that) {
case _HistoryListState():
return $default(_that.tickets,_that.page,_that.hasMore,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryTicket> tickets,  int page,  bool hasMore,  NetworkState<List<HistoryTicket>> status)?  $default,) {final _that = this;
switch (_that) {
case _HistoryListState() when $default != null:
return $default(_that.tickets,_that.page,_that.hasMore,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryListState implements HistoryListState {
  const _HistoryListState({final  List<HistoryTicket> tickets = const [], this.page = 1, this.hasMore = true, this.status = const NetworkState.initial()}): _tickets = tickets;
  

 final  List<HistoryTicket> _tickets;
@override@JsonKey() List<HistoryTicket> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  NetworkState<List<HistoryTicket>> status;

/// Create a copy of HistoryListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryListStateCopyWith<_HistoryListState> get copyWith => __$HistoryListStateCopyWithImpl<_HistoryListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryListState&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets),page,hasMore,status);

@override
String toString() {
  return 'HistoryListState(tickets: $tickets, page: $page, hasMore: $hasMore, status: $status)';
}


}

/// @nodoc
abstract mixin class _$HistoryListStateCopyWith<$Res> implements $HistoryListStateCopyWith<$Res> {
  factory _$HistoryListStateCopyWith(_HistoryListState value, $Res Function(_HistoryListState) _then) = __$HistoryListStateCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryTicket> tickets, int page, bool hasMore, NetworkState<List<HistoryTicket>> status
});


@override $NetworkStateCopyWith<List<HistoryTicket>, $Res> get status;

}
/// @nodoc
class __$HistoryListStateCopyWithImpl<$Res>
    implements _$HistoryListStateCopyWith<$Res> {
  __$HistoryListStateCopyWithImpl(this._self, this._then);

  final _HistoryListState _self;
  final $Res Function(_HistoryListState) _then;

/// Create a copy of HistoryListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tickets = null,Object? page = null,Object? hasMore = null,Object? status = null,}) {
  return _then(_HistoryListState(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<HistoryTicket>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NetworkState<List<HistoryTicket>>,
  ));
}

/// Create a copy of HistoryListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkStateCopyWith<List<HistoryTicket>, $Res> get status {
  
  return $NetworkStateCopyWith<List<HistoryTicket>, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
