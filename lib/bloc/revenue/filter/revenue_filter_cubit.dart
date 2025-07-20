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
    switch (state) {
      case Loaded(:final filter):
        {
          _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            log(query.toString());
            emit(
              RevenueFilterState.loaded(
                filter: filter.copyWith(keyword: query),
              ),
            ); // Emit the latest query after the debounce delay
          });
        }
      default:
        {}
    }
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
    switch (state) {
      case Loaded(:final filter):
        {
          emit(RevenueFilterState.loaded(filter: filter));
        }
      case Loading():
        {
          emit(const RevenueFilterState.loaded());
        }
      default:
        {}
    }
  }

  void filter(Future<void> Function(RevenueFilter filter) fetchData) async {
    switch (state) {
      case Loaded():
        {
          final values = _getFormValues!();
          final temp = RevenueFilter(
            type: values['vehicleType'],
            keyword: values['keyword'],
            time: values['time'],
          );
          emit( RevenueFilterState.filtering(filter: temp));
          await fetchData(temp);
          emit( RevenueFilterState.loaded(filter: temp));
        }
      default:
        {}
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
