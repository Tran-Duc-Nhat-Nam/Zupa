import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constants/vehicle_types.dart';
import '../../../screens/camera/models/vehicle_type.dart';
import 'model/member_vehicles_filter.dart';

part 'member_vehicles_filter_state.dart';
part 'member_vehicles_filter_cubit.freezed.dart';

class MemberVehiclesFilterCubit extends Cubit<MemberVehiclesFilterState> {
  MemberVehiclesFilterCubit()
    : super(const MemberVehiclesFilterState.initial());

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
            MemberVehiclesFilterState.loaded(
              filter: filter.copyWith(keyword: query),
            ),
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
    emit(const MemberVehiclesFilterState.loading());
  }

  void init(BuildContext context) async {
    state.whenOrNull(
      loaded: (filter) =>
          emit(MemberVehiclesFilterState.loaded(filter: filter)),
      loading: () => emit(const MemberVehiclesFilterState.loading()),
    );
  }

  void filter(
    Future<void> Function(MemberVehiclesFilter filter) fetchData,
  ) async {
    switch (state) {
      case Loaded():
        {
          final values = _getFormValues!();
          final temp = MemberVehiclesFilter(
            type: values['vehicleType'],
            keyword: values['keyword'],
            time: values['time'],
          );
          emit(MemberVehiclesFilterState.filtering(filter: temp));
          await fetchData(temp);
          emit(MemberVehiclesFilterState.loaded(filter: temp));
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
