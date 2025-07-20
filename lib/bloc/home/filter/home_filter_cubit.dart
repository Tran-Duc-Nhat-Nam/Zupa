import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constants/vehicle_types.dart';
import '../../../screens/camera/models/vehicle_type.dart';
import 'model/home_filter.dart';

part 'home_filter_state.dart';
part 'home_filter_cubit.freezed.dart';

class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit() : super(const HomeFilterState.initial());

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
              HomeFilterState.loaded(filter: filter.copyWith(keyword: query)),
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
    emit(const HomeFilterState.loading());
  }

  void init(BuildContext context) async {
    switch (state) {
      case Loaded(:final filter):
        {
          emit(HomeFilterState.loaded(filter: filter));
        }
      case Loading():
        {
          emit(const HomeFilterState.loaded());
        }
      default:
        {}
    }
  }

  void filter(Future<void> Function(HomeFilter filter) fetchData) async {
    switch (state) {
      case Loaded():
        {
          final values = _getFormValues!();
          final temp = HomeFilter(
            type: values['vehicleType'],
            keyword: values['keyword'],
            time: values['time'],
          );
          emit(HomeFilterState.filtering(filter: temp));
          await fetchData(temp);
          emit(HomeFilterState.loaded(filter: temp));
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
