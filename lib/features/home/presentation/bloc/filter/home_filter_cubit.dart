import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/models/vehicle_type.dart';

import 'package:zupa/features/home/presentation/bloc/filter/model/home_filter.dart';

part 'home_filter_state.dart';
part 'home_filter_cubit.freezed.dart';

class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit() : super(const .initial());

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

  void init(BuildContext context) async {
    emit(const .loaded());
  }

  void filter(Map<String, dynamic> values) async {
    state.whenOrNull(
      loaded: (filter) async {
        final temp = HomeFilter(
          keyword: values.containsKey('keyword') ? values['keyword'] as String : filter.keyword,
          time: values.containsKey('time') ? values['time'] as DateTime : filter.time,
          type: values.containsKey('type') ? values['type'] as VehicleType : filter.type,
        );
        emit(.filtering(filter: temp));
        await Future.delayed(const .new(seconds: 3));
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
