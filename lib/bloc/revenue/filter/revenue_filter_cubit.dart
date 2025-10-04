import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constants/vehicle_types.dart';
import '../../../screens/camera/models/vehicle_type.dart';
import 'model/revenue_filter.dart';

part 'revenue_filter_state.dart';
part 'revenue_filter_cubit.freezed.dart';

class RevenueFilterCubit extends Cubit<RevenueFilterState> {
  RevenueFilterCubit() : super(const RevenueFilterState.initial());

  List<VehicleType> types = [];
  Map<String, dynamic> Function()? _getFormValues;
  Timer? _debounce;

  void search(String? query) {
    state.whenOrNull(
      loaded: (filter) {
        _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          log(query.toString());
          emit(
            RevenueFilterState.loaded(filter: filter.copyWith(keyword: query)),
          ); // Emit the latest query after the debounce delay
        });
      },
    );
  }

  void load(
    BuildContext context,
    Map<String, dynamic> Function()? getFormValues,
  ) async {
    types = vehicleTypes;
    _getFormValues = getFormValues;
    emit(const RevenueFilterState.loading());
  }

  void init(BuildContext context) async {
    state.whenOrNull(
      loaded: (filter) {
        emit(RevenueFilterState.loaded(filter: filter));
      },
      loading: () {
        emit(const RevenueFilterState.loaded());
      },
    );
  }

  void filter(Future<void> Function(RevenueFilter filter) fetchData) async {
    state.whenOrNull(
      loaded: (filter) async {
        final values = _getFormValues!();
        final temp = RevenueFilter(
          type: values['vehicleType'],
          keyword: values['keyword'],
          time: values['time'],
        );
        emit(RevenueFilterState.filtering(filter: temp));
        await fetchData(temp);
        emit(RevenueFilterState.loaded(filter: temp));
      },
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
