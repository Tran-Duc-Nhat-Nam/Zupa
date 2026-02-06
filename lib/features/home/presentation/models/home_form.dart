import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'home_form.gform.dart';

@Rf()
class Home {
  final String keyword;
  final DateTime? time;
  final VehicleType? type;

  Home({
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });
}
