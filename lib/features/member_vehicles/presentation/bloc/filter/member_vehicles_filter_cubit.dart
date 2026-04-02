import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/features/member_vehicles/domain/entities/filter/member_vehicles_filter_entity.dart';
import 'package:zupa/features/member_vehicles/presentation/models/member_vehicle_list_form.dart';

part 'member_vehicles_filter_cubit.freezed.dart';
part 'member_vehicles_filter_state.dart';

@injectable
class MemberVehiclesFilterCubit extends Cubit<MemberVehiclesFilterState> {
  MemberVehiclesFilterCubit() : super(const .initial());
  Timer? _debounce;

  final formModel = MemberVehiclesListForm(
    MemberVehiclesListForm.formElements(MemberVehiclesList()),
    null,
    null,
  );

  void search() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      emit(
        .loaded(filter: filter),
      ); // Emit the latest query after the debounce delay
    });
  }

  void init() async {
    emit(const .loaded());
  }

  MemberVehicleFilterEntity get filter => MemberVehicleFilterEntity(
    page: formModel.pageIndexControl.value ?? defaultPageIndex,
    size: formModel.pageSizeControl.value ?? defaultPageSize,
    keyword: formModel.keywordControl.value ?? '',
    time: formModel.timeControl.value,
    type: formModel.typeControl.value,
  );

  void filterList() async {
    if (formModel.form.valid) {
      emit(.filtering(filter: filter));
      await Future.delayed(const .new(seconds: 3));
      emit(.loaded(filter: filter));
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
