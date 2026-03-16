import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

part 'revenue_form.gform.dart';

@Rf()
class Revenue {
  final int pageIndex;
  final int pageSize;
  final String keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;

  Revenue({
    @RfControl() this.pageIndex = defaultPageIndex,
    @RfControl() this.pageSize = defaultPageSize,
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });
}
