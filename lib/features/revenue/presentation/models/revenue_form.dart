import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'revenue_form.gform.dart';

@Rf()
class Revenue {
  final String keyword;
  final DateTime? time;
  final VehicleType? type;

  Revenue({
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });
}
