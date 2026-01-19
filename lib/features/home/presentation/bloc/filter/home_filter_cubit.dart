import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
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
        _debounce = .new(const Duration(milliseconds: 500), () {
          log(query.toString());
          emit(
            .loaded(filter: filter.copyWith(keyword: query)),
          ); // Emit the latest query after the debounce delay
        });
      },
    );
  }

  void init() async {
    emit(const .loaded());
  }

  void filter({String? keyword, DateTime? time, VehicleType? type}) async {
    state.whenOrNull(
      loaded: (filter) async {
        final temp = HomeFilter(
          keyword: keyword ?? filter.keyword,
          time: time ?? filter.time,
          type: type ?? filter.type,
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
