import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/home/presentation/bloc/filter/model/home_filter.dart';

part 'home_filter_state.dart';
part 'home_filter_cubit.freezed.dart';

class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit() : super(const .initial());

  List<VehicleType> types = [];
  Map<String, dynamic> Function()? _getFormValues;
  Timer? _debounce;

  void search(String? query) {
    state.whenOrNull(
      loaded: (filter) {
        _debounce?.cancel();
        _debounce = .new(const .new(milliseconds: 500), () {
          log(query.toString());
          emit(
            .loaded(filter: filter.copyWith(keyword: query)),
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
    emit(const .loading());
  }

  void init(BuildContext context) async {
    state.whenOrNull(
      loaded: (filter) => emit(.loaded(filter: filter)),
      loading: () => emit(const .loaded()),
    );
  }

  void filter(Future<void> Function(HomeFilter filter) fetchData) async {
    state.whenOrNull(
      loaded: (filter) async {
        final values = _getFormValues!();
        final temp = HomeFilter(
          type: values['vehicleType'],
          keyword: values['keyword'],
          time: values['time'],
        );
        emit(.filtering(filter: temp));
        await fetchData(temp);
        emit(.loaded(filter: temp));
      },
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
