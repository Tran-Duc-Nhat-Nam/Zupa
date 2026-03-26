import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/features/revenue/domain/entities/filter/revenue_filter_entity.dart';
import 'package:zupa/features/revenue/presentation/models/revenue_form.dart';

part 'revenue_filter_cubit.freezed.dart';
part 'revenue_filter_state.dart';

@injectable
class RevenueFilterCubit extends Cubit<RevenueFilterState> {
  RevenueFilterCubit() : super(const .initial());

  final formModel = RevenueForm(
    RevenueForm.formElements(Revenue()),
    null,
    null,
  );

  void reset() {
    emit(const .initial());
  }

  void update() {
    if (formModel.form.valid) {
      final newFilter = RevenueFilterEntity(
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

  void init() {
    emit(const .loaded());
  }
}
