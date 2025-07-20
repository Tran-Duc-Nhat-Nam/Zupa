import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constants/vehicle_types.dart';
import '../../../screens/camera/models/vehicle_type.dart';
import 'model/history_filter.dart';

part 'history_filter_state.dart';
part 'history_filter_cubit.freezed.dart';

class HistoryFilterCubit extends Cubit<HistoryFilterState> {
  HistoryFilterCubit() : super(const HistoryFilterState.initial());

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
              HistoryFilterState.loaded(
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
    emit(const HistoryFilterState.loading());
  }

  void init(BuildContext context) async {
    switch (state) {
      case Loaded(:final filter):
        {
          emit(HistoryFilterState.loaded(filter: filter));
        }
      case Loading():
        {
          emit(const HistoryFilterState.loaded());
        }
      default:
        {}
    }
  }

  void filter(Future<void> Function(HistoryFilter filter) fetchData) async {
    switch (state) {
      case Loaded():
        {
          final values = _getFormValues!();
          final temp = HistoryFilter(
            type: values['vehicleType'],
            keyword: values['keyword'],
            time: values['time'],
          );
          emit( HistoryFilterState.filtering(filter: temp));
          await fetchData(temp);
          emit( HistoryFilterState.loaded(filter: temp));
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
