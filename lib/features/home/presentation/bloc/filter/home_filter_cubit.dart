import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:zupa/features/home/domain/entities/home_filter.dart';
import 'package:zupa/features/home/presentation/models/home_form.dart';

part 'home_filter_state.dart';
part 'home_filter_cubit.freezed.dart';

@injectable
class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit() : super(const .initial());

  Timer? _debounce;

  final formModel = HomeForm(HomeForm.formElements(Home()), null, null);

  void search() {
    state.whenOrNull(
      loaded: (filter) {
        _debounce?.cancel();
        _debounce = .new(const Duration(milliseconds: 500), () {
          emit(
            .loaded(
              filter: filter.copyWith(keyword: formModel.keywordControl.value),
            ),
          ); // Emit the latest query after the debounce delay
        });
      },
    );
  }

  void init() async {
    emit(const .loaded());
  }

  void filter() async {
    if (formModel.form.valid) {
      final temp = HomeFilter(
        keyword: formModel.keywordControl.value,
        time: formModel.timeControl.value,
        type: formModel.typeControl.value,
      );
      emit(.filtering(filter: temp));
      await Future.delayed(const .new(seconds: 3));
      emit(.loaded(filter: temp));
    } else {
      formModel.form.markAllAsTouched();
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
