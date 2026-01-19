import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/settings/data/models/member_vehicles_filter.dart';

part 'member_vehicles_filter_state.dart';
part 'member_vehicles_filter_cubit.freezed.dart';

@injectable
class MemberVehiclesFilterCubit extends Cubit<MemberVehiclesFilterState> {
  MemberVehiclesFilterCubit() : super(const .initial());
  Timer? _debounce;

  void search(String? query) {
    state.whenOrNull(
      loaded: (filter) {
        _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
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

  void filter({VehicleType? type, String? keyword, DateTime? time}) async {
    state.whenOrNull(
      loaded: (filter) async {
        final temp = MemberVehiclesFilter(
          type: type ?? filter.type,
          keyword: keyword ?? filter.keyword,
          time: time ?? filter.time,
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

