import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

part 'revenue_form.gform.dart';

@Rf()
class Revenue {
  final String keyword;
  final VehicleTypeEntity? type;
  final DateTime fromDate;
  final DateTime toDate;

  Revenue({
    @RfControl() this.keyword = 'QUANTITY',
    @RfControl() this.type,
    @RfControl() required this.fromDate,
    @RfControl() required this.toDate,
  });
}
