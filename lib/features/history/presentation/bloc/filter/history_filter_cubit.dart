import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/history/presentation/bloc/filter/model/history_filter.dart';

part 'history_filter_state.dart';
part 'history_filter_cubit.freezed.dart';

@injectable
class HistoryFilterCubit extends Cubit<HistoryFilterState> {
  HistoryFilterCubit() : super(const .initial());

  Timer? _debounce;

  void update({String? keyword, DateTime? time, VehicleType? type}) {
    final currentFilter = state.maybeMap(
      loaded: (s) => s.filter,
      filtering: (s) => s.filter,
      orElse: () => const HistoryFilter(),
    );

    final newFilter = currentFilter.copyWith(
      keyword: keyword ?? currentFilter.keyword,
      time: time ?? currentFilter.time,
      type: type ?? currentFilter.type,
    );

    emit(.loaded(filter: newFilter));
  }

  void reset() {
    emit(const .initial());
  }

  void init() {
    state.maybeMap(
      initial: (s) => emit(const .loaded()),
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
