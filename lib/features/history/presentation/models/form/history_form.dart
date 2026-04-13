import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';

part 'history_form.gform.dart';

@Rf()
class History {
  final int pageIndex;
  final int pageSize;
  final String keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;

  History({
    @RfControl(validators: [RequiredValidator()])
    this.pageIndex = defaultPageIndex,
    @RfControl(validators: [RequiredValidator()])
    this.pageSize = defaultPageSize,
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });

  GetHistoryParams toParams() => .new(
    page: pageIndex,
    size: pageSize,
    keyword: keyword,
    time: time,
    type: type,
  );

  factory History.fromParams(GetHistoryParams params) => .new(
    pageIndex: params.page,
    pageSize: params.page,
    keyword: params.keyword ?? '',
    time: params.time,
    type: params.type,
  );
}
