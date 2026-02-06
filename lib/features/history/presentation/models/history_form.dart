import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'history_form.gform.dart';

@Rf()
class History {
  final String keyword;
  final DateTime? time;
  final VehicleType? type;

  History({
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });
}
