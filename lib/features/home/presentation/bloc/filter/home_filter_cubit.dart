import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/features/home/domain/entities/filter/home_filter_entity.dart';
import 'package:zupa/features/home/presentation/models/home_form.dart';

part 'home_filter_cubit.freezed.dart';
part 'home_filter_state.dart';

@injectable
class HomeFilterCubit extends Cubit<HomeFilterState> {
  HomeFilterCubit() : super(const .initial());

  Timer? _debounce;

  final formModel = HomeForm(HomeForm.formElements(Home()), null, null);

  HomeFilterEntity get _filter => .new(
    page: formModel.pageIndexControl.value ?? defaultPageIndex,
    size: formModel.pageSizeControl.value ?? defaultPageSize,
    keyword: formModel.keywordControl.value,
    time: formModel.timeControl.value,
    type: formModel.typeControl.value,
  );

  void search() {
    state.whenOrNull(
      loaded: (filter) {
        _debounce?.cancel();
        _debounce = .new(const Duration(milliseconds: 500), () {
          emit(.loaded(filter: _filter));
        });
      },
    );
  }

  void init() async {
    emit(const .loaded());
  }

  void filter() async {
    if (formModel.form.valid) {
      emit(.filtering(filter: _filter));
      await Future.delayed(const .new(seconds: 1));
      emit(.loaded(filter: _filter));
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
