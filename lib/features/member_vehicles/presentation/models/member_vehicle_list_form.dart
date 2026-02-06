import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'member_vehicle_list_form.gform.dart';

@Rf()
class MemberVehiclesList {
  final String keyword;
  final DateTime? time;
  final VehicleType? type;

  MemberVehiclesList({
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });
}
