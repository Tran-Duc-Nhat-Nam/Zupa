import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/history/domain/entities/history_filter.dart';

part 'history_filter_state.dart';
part 'history_filter_cubit.freezed.dart';

@injectable
class HistoryFilterCubit extends Cubit<HistoryFilterState> {
  HistoryFilterCubit() : super(const .initial());

  Timer? _debounce;

  final FormGroup form = fb.group({
    'keyword': FormControl<String>(value: ''),
    'time': FormControl<DateTime?>(),
    'type': FormControl<VehicleType?>(),
  });

  void update() {
    if (form.valid) {
      final newFilter = HistoryFilter(
        keyword: form.control('keyword').value,
        time: form.control('time').value,
        type: form.control('type').value,
      );

      emit(.loaded(filter: newFilter));
    } else {
      form.markAllAsTouched();
    }
  }

  void reset() {
    emit(const .initial());
  }

  void init() {
    emit(const .loaded());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
