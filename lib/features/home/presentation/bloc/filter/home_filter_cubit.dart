import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/models/vehicle_type.dart';

import 'package:zupa/features/home/domain/entities/home_filter.dart';

part 'home_filter_state.dart';
part 'home_filter_cubit.freezed.dart';

@injectable
class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit() : super(const .initial());

  Timer? _debounce;

  final FormGroup form = fb.group({
    'keyword': FormControl<String>(value: ''),
    'time': FormControl<DateTime?>(),
    'type': FormControl<VehicleType?>(),
  });

  void search() {
    state.whenOrNull(
      loaded: (filter) {
        _debounce?.cancel();
        _debounce = .new(const Duration(milliseconds: 500), () {
          emit(
            .loaded(filter: filter.copyWith(keyword: form.control('keyword').value)),
          ); // Emit the latest query after the debounce delay
        });
      },
    );
  }

  void init() async {
    emit(const .loaded());
  }

  void filter() async {
    state.whenOrNull(
      loaded: (filter) async {
        final temp = HomeFilter(
          keyword: form.control('keyword').value,
          time: form.control('time').value,
          type: form.control('type').value,
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
