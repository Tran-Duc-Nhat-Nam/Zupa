import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/history/domain/entities/history_filter.dart';
import 'package:zupa/features/history/presentation/models/history_form.dart';

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
      final newFilter = HistoryFilter(
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
