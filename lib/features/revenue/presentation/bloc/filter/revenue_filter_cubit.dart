import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/revenue/domain/entity/revenue_filter.dart';

part 'revenue_filter_state.dart';
part 'revenue_filter_cubit.freezed.dart';

@injectable
class RevenueFilterCubit extends Cubit<RevenueFilterState> {
  RevenueFilterCubit() : super(const .initial());

  final FormGroup form = FormGroup({
    'keyword': FormControl<String>(value: ''),
    'time': FormControl<DateTime>(),
    'type': FormControl<VehicleType>(),
  });

  void reset() {
    emit(const .initial());
  }

  void update() {
    final newFilter = RevenueFilter(
      keyword: form.control('keyword').value,
      time: form.control('time').value,
      type: form.control('type').value,
    );
    emit(.loaded(filter: newFilter));
  }

  void init() {
    emit(const .loaded());
  }
}
