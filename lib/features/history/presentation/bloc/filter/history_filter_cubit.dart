import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/features/history/domain/entities/filter/history_filter_entity.dart';
import 'package:zupa/features/history/presentation/models/form/history_form.dart';

part 'history_filter_state.dart';
part 'history_filter_cubit.freezed.dart';

@injectable
class HistoryFilterCubit extends Cubit<HistoryFilterState> {
  HistoryFilterCubit() : super(const .initial());

  Timer? _debounce;

  final formModel = HistoryForm(
    HistoryForm.formElements(History()),
    null,
    null,
  );

  void update() {
    if (formModel.form.valid) {
      final newFilter = HistoryFilterEntity(
        page: formModel.pageIndexControl.value ?? defaultPageIndex,
        size: formModel.pageSizeControl.value ?? defaultPageSize,
        keyword: formModel.keywordControl.value,
        time: formModel.timeControl.value,
        type: formModel.typeControl.value,
      );

      emit(.loaded(filter: newFilter));
    } else {
      formModel.form.markAllAsTouched();
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
