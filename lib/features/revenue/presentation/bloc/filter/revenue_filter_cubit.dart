import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/common/models/vehicle_type.dart';
import '../../../domain/entity/revenue_filter.dart';

part 'revenue_filter_state.dart';
part 'revenue_filter_cubit.freezed.dart';

@injectable
class RevenueFilterCubit extends Cubit<RevenueFilterState> {
  RevenueFilterCubit() : super(const RevenueFilterState.initial());

  void reset() {
    emit(const RevenueFilterState.initial());
  }

  void update({String? keyword, DateTime? time, VehicleType? type}) {
    final currentFilter = state.maybeMap(
      initial: (s) => s.filter,
      loaded: (s) => s.filter,
      filtering: (s) => s.filter,
      orElse: () => const RevenueFilter(),
    );
    final newFilter = currentFilter.copyWith(
      keyword: keyword ?? currentFilter.keyword,
      time: time ?? currentFilter.time,
      type: type ?? currentFilter.type,
    );
    emit(RevenueFilterState.loaded(filter: newFilter));
  }

  void init(BuildContext context) {
    state.maybeMap(
      initial: (s) => emit(const RevenueFilterState.loaded()),
      orElse: () {},
    );
  }
}
