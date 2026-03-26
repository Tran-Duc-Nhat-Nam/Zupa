import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

part 'home_form.gform.dart';

@Rf()
class Home {
  final int pageIndex;
  final int pageSize;
  final String keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;

  Home({
    @RfControl(validators: [RequiredValidator()])
    this.pageIndex = defaultPageIndex,
    @RfControl(validators: [RequiredValidator()])
    this.pageSize = defaultPageSize,
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });
}
