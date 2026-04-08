import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/features/revenue/domain/entities/filter/revenue_filter_entity.dart';
import 'package:zupa/features/revenue/presentation/models/revenue_form.dart';

part 'revenue_filter_cubit.freezed.dart';
part 'revenue_filter_state.dart';

@injectable
class RevenueFilterCubit extends Cubit<RevenueFilterState> {
  RevenueFilterCubit() : super(const .initial());

  final formModel = RevenueForm(
    RevenueForm.formElements(
      Revenue(
        fromDate: DateTime(DateTime.now().year, DateTime.now().month),
        toDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      ),
    ),
    null,
    null,
  );

  RevenueFilterEntity get _filter => .new(
    fromDate: formModel.fromDateControl.value ?? .now(),
    toDate: formModel.toDateControl.value ?? .now(),
    keyword: formModel.keywordControl.value ?? 'QUANTITY',
    type: formModel.typeControl.value ?? vehicleTypes[0],
  );

  void init() {
    emit(.loaded(filter: _filter));
  }

  void reset() {
    formModel.reset();
    emit(.loaded(filter: _filter));
  }

  void update() {
    if (formModel.form.valid) {
      emit(.loaded(filter: _filter));
    } else {
      formModel.form.markAllAsTouched();
    }
  }
}
